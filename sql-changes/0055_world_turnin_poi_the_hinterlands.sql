-- 0055_world_turnin_poi_the_hinterlands.sql: hand-in ('?') map markers for 4 custom quests, the hinterlands (UiMapID 1425).
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
--   94266  Craftsman's Writ: Elixir of Agility  (sort 16941, near 52)
--   94278  Craftsman's Writ: Golden Scale Gauntlets  (sort 16941, sibling)
--   94290  Craftsman's Writ: Mechanical Repair Kit  (sort 16941, sibling)
--   94302  Craftsman's Writ: Turtle Scale Breastplate  (sort 16941, near 52)
--
-- Worldserver restart required (quest POI data loads at startup).

INSERT IGNORE INTO quest_poi (QuestID,BlobIndex,Idx1,ObjectiveIndex,QuestObjectiveID,QuestObjectID,MapID,UiMapID,Priority,Flags,WorldEffectID,PlayerConditionID,NavigationPlayerConditionID,SpawnTrackingID,AlwaysAllowMergingBlobs,VerifiedBuild) VALUES
(94266,0,0,-1,0,0,0,1425,0,0,0,0,0,0,0,70124),
(94278,0,0,-1,0,0,0,1425,0,0,0,0,0,0,0,70124),
(94290,0,0,-1,0,0,0,1425,0,0,0,0,0,0,0,70124),
(94302,0,0,-1,0,0,0,1425,0,0,0,0,0,0,0,70124);

INSERT IGNORE INTO quest_poi_points (QuestID,Idx1,Idx2,X,Y,Z,VerifiedBuild) VALUES
(94266,0,0,45,-4663,13,70124),
(94278,0,0,219,-2603,160,70124),
(94290,0,0,220,-2612,160,70124),
(94302,0,0,45,-4663,13,70124);

-- Undo (also ready-to-run in undo/undo_0055_world_turnin_poi_the_hinterlands.sql):
--   DELETE FROM quest_poi WHERE QuestID IN (94266,94278,94290,94302) AND VerifiedBuild=70124;
--   DELETE FROM quest_poi_points WHERE QuestID IN (94266,94278,94290,94302) AND VerifiedBuild=70124;
