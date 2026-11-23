#!/usr/bin/env python3
"""generate_turnin_poi.py - emit per-zone sql-changes files that add the
missing hand-in ("?") map markers for custom quests, plus an undo/ folder
with ready-to-run rollbacks.

A quest's turn-in icon on the world map comes from a quest_poi row with
ObjectiveIndex=-1 plus a quest_poi_points row at the turn-in NPC/object.
~540 custom quests (ID >= 90000) have a creature/gameobject ender but no
such row (baseline misses are legit instance/BG/seasonal turn-ins).

File grouping: by the quest's STARTING zone (quest giver location). A
quest whose ender spawns in several zone maps still lands in one file -
the quest_poi rows keep each spawn's own UiMapID, so markers still show
on the right maps; rollback removes all of them at once.

UiMapID per spawn is resolved by, in order of confidence:
  1. "sibling" - another quest ending at the same creature already has a
     -1 marker near this spawn -> copy its UiMapID
  2. "near"    - UiMapID of the closest existing quest_poi point on the
     same world map, within NEAR_LIMIT units, restricted to zone-level
     UiMaps (classic zones + any UiMap already used by custom quests)
  3. "guess"   - same as 2 but no nearby data: flagged for manual review

Run from repo root:  python sql-changes/generate_turnin_poi.py
Outputs 00NN_world_turnin_poi_<zone>.sql files next to this script plus
undo/undo_00NN_world_turnin_poi_<zone>.sql rollback files.
"""

import math
import re
import subprocess
from collections import Counter, defaultdict
from pathlib import Path

MYSQL = r"F:\Games\ForeverBots\mysql\bin\mysql.exe"
DB_ARGS = [MYSQL, "-h127.0.0.1", "-P3307", "-utrinity",
           "-pCkDFxBN3UM0hfLinOb4Hlg1r", "--batch", "--raw", "world"]
OUT_DIR = Path(__file__).resolve().parent
UNDO_DIR = OUT_DIR / "undo"
START_NUMBER = 17
MIN_QUEST_ID = 90000
SIBLING_RANGE = 300.0
NEAR_LIMIT = 1500.0

# UiMap.db2 IDs for the classic world maps (ui_map table is trimmed in the
# hotfixes DB, so names can't be looked up there).
UIMAP_NAMES = {
    1411: "durotar", 1412: "mulgore", 1413: "the_barrens",
    1416: "alterac_mountains", 1417: "arathi_highlands", 1418: "badlands",
    1419: "blasted_lands", 1420: "tirisfal_glades", 1421: "silverpine_forest",
    1422: "western_plaguelands", 1423: "eastern_plaguelands",
    1424: "hillsbrad_foothills", 1425: "the_hinterlands", 1426: "dun_morogh",
    1427: "searing_gorge", 1428: "burning_steppes", 1429: "elwynn_forest",
    1430: "deadwind_pass", 1431: "duskwood", 1432: "loch_modan",
    1433: "redridge_mountains", 1434: "stranglethorn_vale",
    1435: "swamp_of_sorrows", 1436: "westfall", 1437: "wetlands",
    1438: "teldrassil", 1439: "darkshore", 1440: "ashenvale",
    1441: "desolace", 1442: "stonetalon_mountains", 1443: "the_barrens",
    1444: "feralas", 1445: "dustwallow_marsh", 1446: "tanaris",
    1447: "azshara", 1448: "felwood", 1449: "ungoro_crater",
    1450: "moonglade", 1451: "silithus", 1452: "winterspring",
    1453: "stormwind_city", 1454: "orgrimmar", 1455: "ironforge",
    1456: "thunder_bluff", 1457: "darnassus", 1458: "undercity",
    1459: "alterac_valley", 1460: "warsong_gulch", 1461: "arathi_basin",
}


def q(sql):
    out = subprocess.run(DB_ARGS + ["-e", sql], capture_output=True,
                         text=True, check=True).stdout
    return [line.split("\t") for line in out.splitlines()[1:]]


def main():
    UNDO_DIR.mkdir(exist_ok=True)

    missing = {int(r[0]) for r in q(
        "SELECT DISTINCT quest FROM creature_questender WHERE quest>=%d "
        "AND NOT EXISTS (SELECT 1 FROM quest_poi p WHERE p.QuestID=quest "
        "AND p.ObjectiveIndex=-1) UNION SELECT DISTINCT quest FROM "
        "gameobject_questender WHERE quest>=%d AND NOT EXISTS (SELECT 1 "
        "FROM quest_poi p WHERE p.QuestID=quest AND p.ObjectiveIndex=-1)"
        % (MIN_QUEST_ID, MIN_QUEST_ID))}

    titles = {int(r[0]): r[1] for r in q(
        "SELECT ID, LogTitle FROM quest_template WHERE ID>=%d" % MIN_QUEST_ID)}
    sorts = {int(r[0]): int(r[1]) for r in q(
        "SELECT ID, QuestSortID FROM quest_template WHERE ID>=%d"
        % MIN_QUEST_ID)}

    # (quest, kind, entry, map, x, y, z) - one row per ender spawn
    ender_spawns = q(
        "SELECT qe.quest,'c',qe.id,c.map,c.position_x,c.position_y,"
        "c.position_z FROM creature_questender qe JOIN creature c ON "
        "c.id=qe.id WHERE qe.quest>=%d UNION ALL SELECT ge.quest,'g',ge.id,"
        "g.map,g.position_x,g.position_y,g.position_z FROM "
        "gameobject_questender ge JOIN gameobject g ON g.id=ge.id WHERE "
        "ge.quest>=%d" % (MIN_QUEST_ID, MIN_QUEST_ID))
    ender_spawns = [(int(a), b, int(c), int(d), float(e), float(f),
                     float(g)) for a, b, c, d, e, f, g in ender_spawns
                    if int(a) in missing]

    # starter spawns -> "starting zone" file grouping
    starter_spawns = q(
        "SELECT qs.quest,'c',qs.id,c.map,c.position_x,c.position_y FROM "
        "creature_queststarter qs JOIN creature c ON c.id=qs.id WHERE "
        "qs.quest>=%d UNION ALL SELECT gs.quest,'g',gs.id,g.map,"
        "g.position_x,g.position_y FROM gameobject_queststarter gs JOIN "
        "gameobject g ON g.id=gs.id WHERE gs.quest>=%d"
        % (MIN_QUEST_ID, MIN_QUEST_ID))
    starter_spawns = [(int(a), int(d), float(e), float(f))
                      for a, b, c, d, e, f in starter_spawns
                      if int(a) in missing]

    # UiMapID of a -1 point near the same ender creature (sibling quests)
    sib_map = defaultdict(list)  # creature entry -> (mapid, uimap, x, y)
    for cid, m, u, x, y in q(
            "SELECT qe.id,p.MapID,p.UiMapID,pt.X,pt.Y FROM "
            "creature_questender qe JOIN quest_poi p ON p.QuestID=qe.quest "
            "AND p.ObjectiveIndex=-1 JOIN quest_poi_points pt ON "
            "pt.QuestID=p.QuestID AND pt.Idx1=p.Idx1"):
        sib_map[int(cid)].append((int(m), int(u), float(x), float(y)))

    # zone-level UiMaps already used by custom-quest markers
    custom_uimaps = {int(r[0]) for r in q(
        "SELECT DISTINCT p.UiMapID FROM quest_poi p JOIN quest_template qt "
        "ON qt.ID=p.QuestID WHERE qt.ID>=%d" % MIN_QUEST_ID)}
    allowed_uimaps = set(UIMAP_NAMES) | custom_uimaps

    # all existing poi points on zone-level maps (reference set)
    pts = [(int(m), int(u), float(x), float(y)) for m, u, x, y in q(
        "SELECT p.MapID,p.UiMapID,pt.X,pt.Y FROM quest_poi p JOIN "
        "quest_poi_points pt ON pt.QuestID=p.QuestID AND pt.Idx1=p.Idx1")
        if int(u) in allowed_uimaps]

    # existing poi row counters so new blobs don't collide
    used = {int(a): (int(b or -1), int(c or -1)) for a, b, c in q(
        "SELECT QuestID,MAX(BlobIndex),MAX(Idx1) FROM quest_poi WHERE "
        "QuestID>=%d GROUP BY QuestID" % MIN_QUEST_ID)}

    def nearest_uimap(mapid, x, y):
        best, bd = None, float("inf")
        for m, u, sx, sy in pts:
            if m != mapid:
                continue
            d = math.hypot(x - sx, y - sy)
            if d < bd:
                best, bd = u, d
        return best, bd

    def uimap_for(kind, entry, mapid, x, y):
        """-> (uimap, confidence_note)"""
        if kind == "c":
            best, bd = None, SIBLING_RANGE
            for m, u, sx, sy in sib_map.get(entry, []):
                if m != mapid:
                    continue
                d = math.hypot(x - sx, y - sy)
                if d < bd:
                    best, bd = u, d
            if best is not None:
                return best, "sibling"
        best, bd = nearest_uimap(mapid, x, y)
        if best is None:
            return None, "no-marker-data"
        return best, ("near %d" % bd if bd <= NEAR_LIMIT
                      else "GUESS %d" % bd)

    enders = defaultdict(list)
    for quest, kind, entry, mapid, x, y, z in ender_spawns:
        enders[quest].append((kind, entry, mapid, x, y, z))

    starters = defaultdict(list)
    for quest, mapid, x, y in starter_spawns:
        u, d = nearest_uimap(mapid, x, y)
        if u is not None:
            starters[quest].append((u, d))

    files = defaultdict(list)   # starting-zone uimap -> rows
    notes = defaultdict(set)    # file uimap -> confidence notes
    unspawned = []
    for quest in sorted(enders):
        blob, idx1 = used.get(quest, (-1, -1))
        rows = []
        row_uimaps = set()
        for kind, entry, mapid, x, y, z in enders[quest]:
            uimap, how = uimap_for(kind, entry, mapid, x, y)
            if uimap is None:
                continue
            blob += 1
            idx1 += 1
            row_uimaps.add(uimap)
            rows.append((uimap, how,
                         "(%d,%d,%d,-1,0,0,%d,%d,0,0,0,0,0,0,0,70124)"
                         % (quest, blob, idx1, mapid, uimap),
                         "(%d,%d,0,%d,%d,%d,70124)"
                         % (quest, idx1, round(x), round(y), round(z))))
        if not rows:
            continue
        if starters.get(quest):
            home = Counter(u for u, _ in starters[quest]).most_common(1)[0][0]
        else:
            home = rows[0][0]
        span = ", markers in uimap %s" % ",".join(
            map(str, sorted(row_uimaps - {home}))) if len(row_uimaps) > 1 \
            else ""
        for uimap, how, poi_row, pt_row in rows:
            files[home].append((quest, titles.get(quest, "?"),
                                sorts.get(quest, 0), how, span, poi_row,
                                pt_row))
        notes[home] |= {r[1].split()[0] for r in rows}

    for quest in sorted(missing - set(enders)):
        unspawned.append((quest, titles.get(quest, "?")))

    n = START_NUMBER
    manifest = []
    for uimap in sorted(files, key=lambda u: -len(files[u])):
        slug = UIMAP_NAMES.get(uimap, "uimap_%d" % uimap)
        fname = "%04d_world_turnin_poi_%s.sql" % (n, slug)
        groups = files[uimap]
        quests = sorted({g[0] for g in groups})
        lines = [
            "-- %s: hand-in ('?') map markers for %d custom quests, %s "
            "(UiMapID %d)." % (fname, len(quests), slug.replace('_', ' '),
                               uimap),
            "--", "-- World database.", "--",
            "-- quest_poi/quest_poi_points had no ObjectiveIndex=-1 blob for",
            "-- these quests, so the turn-in icon never showed on the world",
            "-- map. Quests are filed by starting zone; a few enders span",
            "-- other zone maps (noted per quest) - their markers still",
            "-- carry the correct UiMapID for the map they land on.", "--",
            "-- confidence: 'sibling' = same ender NPC already has a marker;",
            "-- 'near N' = closest marker data N units away; 'GUESS' = no",
            "-- marker data nearby, UiMapID may be wrong - verify.", "--",
        ] + [
            "--   %d  %s  (sort %d, %s%s)" % (g[0], g[1], g[2], g[3], g[4])
            for g in sorted({(g[0], g[1], g[2], g[3], g[4])
                             for g in groups})
        ] + [
            "--",
            "-- Worldserver restart required (quest POI data loads at "
            "startup).", "",
            "INSERT IGNORE INTO quest_poi (QuestID,BlobIndex,Idx1,"
            "ObjectiveIndex,QuestObjectiveID,QuestObjectID,MapID,UiMapID,"
            "Priority,Flags,WorldEffectID,PlayerConditionID,"
            "NavigationPlayerConditionID,SpawnTrackingID,"
            "AlwaysAllowMergingBlobs,VerifiedBuild) VALUES",
            ",\n".join(g[5] for g in groups) + ";", "",
            "INSERT IGNORE INTO quest_poi_points (QuestID,Idx1,Idx2,X,Y,Z,"
            "VerifiedBuild) VALUES",
            ",\n".join(g[6] for g in groups) + ";", "",
            "-- Undo (also ready-to-run in undo/undo_%s):" % fname,
            "--   DELETE FROM quest_poi WHERE QuestID IN (%s) AND "
            "VerifiedBuild=70124;" % ",".join(map(str, quests)),
            "--   DELETE FROM quest_poi_points WHERE QuestID IN (%s) AND "
            "VerifiedBuild=70124;" % ",".join(map(str, quests)),
        ]
        (OUT_DIR / fname).write_text("\n".join(lines) + "\n")

        undo = [
            "-- undo_%s - rolls back the rows added by %s" % (fname, fname),
            "-- World database. Worldserver restart required.",
            "",
            "DELETE FROM quest_poi WHERE QuestID IN (%s) AND "
            "VerifiedBuild=70124;" % ",".join(map(str, quests)),
            "DELETE FROM quest_poi_points WHERE QuestID IN (%s) AND "
            "VerifiedBuild=70124;" % ",".join(map(str, quests)),
        ]
        (UNDO_DIR / ("undo_" + fname)).write_text("\n".join(undo) + "\n")

        manifest.append((fname, uimap, len(quests),
                         sorted(notes[uimap])))
        n += 1

    print("wrote %d zone files (+ undo/ companions):" % len(manifest))
    for fname, uimap, cnt, conf in manifest:
        print("  %-48s uimap=%-5d quests=%-3d %s" % (fname, uimap, cnt,
                                                    ",".join(conf)))
    if unspawned:
        print("\nno spawn found for ender of %d quests:" % len(unspawned))
        for qid, t in unspawned:
            print("  %d %s" % (qid, t))


if __name__ == "__main__":
    main()
