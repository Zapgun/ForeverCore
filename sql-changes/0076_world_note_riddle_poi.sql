-- 0076_world_note_riddle_poi.sql
-- WORLD database. Apply with: mysql ... <your world db> < this file
--
-- Fixes the '?' map pin for the scavenger-hunt pair
-- "... and that note you found" (79007/79008). The two quests are one-way
-- routes between twin camps (the "twin land" in the riddle text):
--
--   79007 ends ONLY in Westfall   -> Kalimdor -> Westfall direction
--   79008 ends ONLY in the Barrens (its ender 417072 "Nailed Plank" has no
--                                  Eastern Kingdoms spawn) -> Westfall -> Barrens
--
-- The baseline has the single pin on 79008 pointed at the WESTFALL camp
-- (map 0, uimap 1436, -10581/1708) — the camp where the Horde-side variant
-- is STARTED, not its twin. The '?' therefore sits at the pickup spot and
-- the real destination gets nothing. 79007 has no pin at all.
--
-- Fix: move that pin onto 79007 (whose destination IS the Westfall camp)
-- and give 79008 a new pin at the Barrens camp (map 1, uimap 199 = Southern
-- Barrens, -3377/-2079, next to Nailed Plank 417072 at -3373/-2078 and the
-- 415106 spawn at -3380/-2078).
--
-- Baseline rows carried VerifiedBuild 0; ours are tagged 70124 like the rest
-- of the series so undo deletes only our rows. The old 79008 pin rows are
-- deleted (they were wrong), not moved — VerifiedBuild 0 rows can't be told
-- apart from real baseline data otherwise.
--
-- Undo: run sql-changes/undo/undo_0076_world_note_riddle_poi.sql

-- 79007 (Kalimdor -> Westfall route): destination = the Westfall camp.
INSERT INTO quest_poi (QuestID, BlobIndex, Idx1, ObjectiveIndex, QuestObjectiveID, QuestObjectID, MapID, UiMapID, Priority, Flags, WorldEffectID, PlayerConditionID, NavigationPlayerConditionID, SpawnTrackingID, AlwaysAllowMergingBlobs, VerifiedBuild) VALUES
(79007, 0, 0, -1, 0, 0, 0, 1436, 0, 0, 0, 0, 0, 0, 0, 70124),
(79007, 0, 1, 32, 0, 0, 0, 1436, 0, 0, 0, 0, 0, 0, 0, 70124);

INSERT INTO quest_poi_points (QuestID, Idx1, Idx2, X, Y, Z, VerifiedBuild) VALUES
(79007, 0, 0, -10581, 1708, 41, 70124),
(79007, 1, 0, -10581, 1708, 41, 70124);

-- 79008 (Westfall -> Barrens route): drop the mis-placed Westfall pin…
DELETE FROM quest_poi WHERE QuestID = 79008 AND ObjectiveIndex IN (-1, 32);
DELETE FROM quest_poi_points WHERE QuestID = 79008;

-- …and pin the Barrens twin camp instead.
INSERT INTO quest_poi (QuestID, BlobIndex, Idx1, ObjectiveIndex, QuestObjectiveID, QuestObjectID, MapID, UiMapID, Priority, Flags, WorldEffectID, PlayerConditionID, NavigationPlayerConditionID, SpawnTrackingID, AlwaysAllowMergingBlobs, VerifiedBuild) VALUES
(79008, 0, 0, -1, 0, 0, 1, 199, 0, 0, 0, 0, 0, 0, 0, 70124),
(79008, 0, 1, 32, 0, 0, 1, 199, 0, 0, 0, 0, 0, 0, 0, 70124);

INSERT INTO quest_poi_points (QuestID, Idx1, Idx2, X, Y, Z, VerifiedBuild) VALUES
(79008, 0, 0, -3377, -2079, 95, 70124),
(79008, 1, 0, -3377, -2079, 95, 70124);
