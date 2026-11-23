-- 0059_world_turnin_poi_winterspring.sql: hand-in ('?') map markers for 3 custom quests, winterspring (UiMapID 1452).
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
--   94324  Craftsman's Writ: Distilled Firewater  (sort 16941, near 70)
--   94333  Craftsman's Writ: Ebon Shiv  (sort 16941, near 15)
--   98462  Shroud of the Winter Wilds  (sort 618, near 11)
--
-- Worldserver restart required (quest POI data loads at startup).

INSERT IGNORE INTO quest_poi (QuestID,BlobIndex,Idx1,ObjectiveIndex,QuestObjectiveID,QuestObjectID,MapID,UiMapID,Priority,Flags,WorldEffectID,PlayerConditionID,NavigationPlayerConditionID,SpawnTrackingID,AlwaysAllowMergingBlobs,VerifiedBuild) VALUES
(94324,0,0,-1,0,0,1,1452,0,0,0,0,0,0,0,70124),
(94333,0,0,-1,0,0,1,1452,0,0,0,0,0,0,0,70124),
(98462,0,0,-1,0,0,1,1452,0,0,0,0,0,0,0,70124);

INSERT IGNORE INTO quest_poi_points (QuestID,Idx1,Idx2,X,Y,Z,VerifiedBuild) VALUES
(94324,0,0,6962,-4917,694,70124),
(94333,0,0,6706,-4634,722,70124),
(98462,0,0,6745,-4630,722,70124);

-- Undo (also ready-to-run in undo/undo_0059_world_turnin_poi_winterspring.sql):
--   DELETE FROM quest_poi WHERE QuestID IN (94324,94333,98462) AND VerifiedBuild=70124;
--   DELETE FROM quest_poi_points WHERE QuestID IN (94324,94333,98462) AND VerifiedBuild=70124;
