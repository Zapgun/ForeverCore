-- 0062_world_turnin_poi_undercity.sql: hand-in ('?') map markers for 3 custom quests, undercity (UiMapID 1458).
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
--   96988  Source of Power  (sort 16544, sibling)
--   97000  Grain of Memory  (sort 616, near 46)
--   97985  Thundering Hearts  (sort 1497, near 4)
--
-- Worldserver restart required (quest POI data loads at startup).

INSERT IGNORE INTO quest_poi (QuestID,BlobIndex,Idx1,ObjectiveIndex,QuestObjectiveID,QuestObjectID,MapID,UiMapID,Priority,Flags,WorldEffectID,PlayerConditionID,NavigationPlayerConditionID,SpawnTrackingID,AlwaysAllowMergingBlobs,VerifiedBuild) VALUES
(96988,0,0,-1,0,0,0,1458,0,0,0,0,0,0,0,70124),
(97000,0,0,-1,0,0,1,198,0,0,0,0,0,0,0,70124),
(97985,0,0,-1,0,0,0,1458,0,0,0,0,0,0,0,70124);

INSERT IGNORE INTO quest_poi_points (QuestID,Idx1,Idx2,X,Y,Z,VerifiedBuild) VALUES
(96988,0,0,1404,426,-80,70124),
(97000,0,0,5357,-2078,1291,70124),
(97985,0,0,1429,402,-85,70124);

-- Undo (also ready-to-run in undo/undo_0062_world_turnin_poi_undercity.sql):
--   DELETE FROM quest_poi WHERE QuestID IN (96988,97000,97985) AND VerifiedBuild=70124;
--   DELETE FROM quest_poi_points WHERE QuestID IN (96988,97000,97985) AND VerifiedBuild=70124;
