-- 0067_world_turnin_poi_uimap_23.sql: hand-in ('?') map markers for 1 custom quests, uimap 23 (UiMapID 23).
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
--   94320  Craftsman's Writ: Gift of Arthas  (sort 16941, near 71)
--
-- Worldserver restart required (quest POI data loads at startup).

INSERT IGNORE INTO quest_poi (QuestID,BlobIndex,Idx1,ObjectiveIndex,QuestObjectiveID,QuestObjectID,MapID,UiMapID,Priority,Flags,WorldEffectID,PlayerConditionID,NavigationPlayerConditionID,SpawnTrackingID,AlwaysAllowMergingBlobs,VerifiedBuild) VALUES
(94320,0,0,-1,0,0,0,23,0,0,0,0,0,0,0,70124);

INSERT IGNORE INTO quest_poi_points (QuestID,Idx1,Idx2,X,Y,Z,VerifiedBuild) VALUES
(94320,0,0,3363,-4447,128,70124);

-- Undo (also ready-to-run in undo/undo_0067_world_turnin_poi_uimap_23.sql):
--   DELETE FROM quest_poi WHERE QuestID IN (94320) AND VerifiedBuild=70124;
--   DELETE FROM quest_poi_points WHERE QuestID IN (94320) AND VerifiedBuild=70124;
