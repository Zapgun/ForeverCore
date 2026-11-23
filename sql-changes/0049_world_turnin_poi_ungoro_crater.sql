-- 0049_world_turnin_poi_ungoro_crater.sql: hand-in ('?') map markers for 6 custom quests, ungoro crater (UiMapID 1449).
--
-- World database.
--
-- quest_poi/quest_poi_points had no ObjectiveIndex=-1 blob for
-- these quests, so the turn-in icon never showed on the world
-- map. Quests are filed by starting zone; a few enders span
-- other zone maps (noted per quest) - their markers still
-- carry the correct UiMapID for the map they land on.
--
-- confidence: 'sibling' = same ender NPC already has a marker;
-- 'near N' = closest marker data N units away; 'GUESS' = no
-- marker data nearby, UiMapID may be wrong - verify.
--
--   94267  Craftsman's Writ: Wildvine Potion  (sort 16941, sibling)
--   94279  Craftsman's Writ: Heavy Mithril Axe  (sort 16941, sibling)
--   94291  Craftsman's Writ: Dark Iron Bomb  (sort 16941, near 5)
--   94303  Craftsman's Writ: Thick Leather Ammo Pouch  (sort 16941, near 11)
--   94315  Craftsman's Writ: Earthen Silk Belt  (sort 16941, near 0)
--   94322  Craftsman's Writ: Limited Invulnerability Potion  (sort 16941, near 20)
--
-- Worldserver restart required (quest POI data loads at startup).

INSERT IGNORE INTO quest_poi (QuestID,BlobIndex,Idx1,ObjectiveIndex,QuestObjectiveID,QuestObjectID,MapID,UiMapID,Priority,Flags,WorldEffectID,PlayerConditionID,NavigationPlayerConditionID,SpawnTrackingID,AlwaysAllowMergingBlobs,VerifiedBuild) VALUES
(94267,0,0,-1,0,0,1,1449,0,0,0,0,0,0,0,70124),
(94279,0,0,-1,0,0,1,1449,0,0,0,0,0,0,0,70124),
(94291,0,0,-1,0,0,1,1449,0,0,0,0,0,0,0,70124),
(94303,0,0,-1,0,0,1,1449,0,0,0,0,0,0,0,70124),
(94315,0,0,-1,0,0,1,1449,0,0,0,0,0,0,0,70124),
(94322,0,0,-1,0,0,1,1449,0,0,0,0,0,0,0,70124);

INSERT IGNORE INTO quest_poi_points (QuestID,Idx1,Idx2,X,Y,Z,VerifiedBuild) VALUES
(94267,0,0,-6150,-1076,-199,70124),
(94279,0,0,-7840,-2117,-254,70124),
(94291,0,0,-6144,-1099,-203,70124),
(94303,0,0,-6157,-1068,-195,70124),
(94315,0,0,-6145,-1083,-198,70124),
(94322,0,0,-6378,-321,-1,70124);

-- Undo (also ready-to-run in undo/undo_0049_world_turnin_poi_ungoro_crater.sql):
--   DELETE FROM quest_poi WHERE QuestID IN (94267,94279,94291,94303,94315,94322) AND VerifiedBuild=70124;
--   DELETE FROM quest_poi_points WHERE QuestID IN (94267,94279,94291,94303,94315,94322) AND VerifiedBuild=70124;
