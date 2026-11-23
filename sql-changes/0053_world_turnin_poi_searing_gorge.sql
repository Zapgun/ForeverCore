-- 0053_world_turnin_poi_searing_gorge.sql: hand-in ('?') map markers for 5 custom quests, searing gorge (UiMapID 1427).
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
--   94263  Craftsman's Writ: Fire Protection Potion  (sort 16941, near 20)
--   94275  Craftsman's Writ: Solid Sharpening Stone  (sort 16941, sibling)
--   94287  Craftsman's Writ: Fire Goggles  (sort 16941, near 20)
--   94299  Craftsman's Writ: Nightscape Shoulders  (sort 16941, sibling)
--   94311  Craftsman's Writ: Red Mageweave Pants  (sort 16941, sibling)
--
-- Worldserver restart required (quest POI data loads at startup).

INSERT IGNORE INTO quest_poi (QuestID,BlobIndex,Idx1,ObjectiveIndex,QuestObjectiveID,QuestObjectID,MapID,UiMapID,Priority,Flags,WorldEffectID,PlayerConditionID,NavigationPlayerConditionID,SpawnTrackingID,AlwaysAllowMergingBlobs,VerifiedBuild) VALUES
(94263,0,0,-1,0,0,0,1427,0,0,0,0,0,0,0,70124),
(94275,0,0,-1,0,0,0,1427,0,0,0,0,0,0,0,70124),
(94287,0,0,-1,0,0,0,1427,0,0,0,0,0,0,0,70124),
(94299,0,0,-1,0,0,0,1427,0,0,0,0,0,0,0,70124),
(94311,0,0,-1,0,0,0,1427,0,0,0,0,0,0,0,70124);

INSERT IGNORE INTO quest_poi_points (QuestID,Idx1,Idx2,X,Y,Z,VerifiedBuild) VALUES
(94263,0,0,-6969,-1238,181,70124),
(94275,0,0,-6524,-1189,309,70124),
(94287,0,0,-6969,-1238,181,70124),
(94299,0,0,-6513,-1179,309,70124),
(94311,0,0,-6495,-1165,309,70124);

-- Undo (also ready-to-run in undo/undo_0053_world_turnin_poi_searing_gorge.sql):
--   DELETE FROM quest_poi WHERE QuestID IN (94263,94275,94287,94299,94311) AND VerifiedBuild=70124;
--   DELETE FROM quest_poi_points WHERE QuestID IN (94263,94275,94287,94299,94311) AND VerifiedBuild=70124;
