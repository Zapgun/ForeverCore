-- 0063_world_turnin_poi_feralas.sql: hand-in ('?') map markers for 3 custom quests, feralas (UiMapID 1444).
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
--   97270  Brawl at the Maul  (sort 3217, near 60)
--   99233  Brawl at the Maul  (sort 3217, near 60)
--   99234  Brawl at the Maul  (sort 3217, near 60)
--
-- Worldserver restart required (quest POI data loads at startup).

INSERT IGNORE INTO quest_poi (QuestID,BlobIndex,Idx1,ObjectiveIndex,QuestObjectiveID,QuestObjectID,MapID,UiMapID,Priority,Flags,WorldEffectID,PlayerConditionID,NavigationPlayerConditionID,SpawnTrackingID,AlwaysAllowMergingBlobs,VerifiedBuild) VALUES
(97270,0,0,-1,0,0,1,1444,0,0,0,0,0,0,0,70124),
(99233,0,0,-1,0,0,1,1444,0,0,0,0,0,0,0,70124),
(99234,0,0,-1,0,0,1,1444,0,0,0,0,0,0,0,70124);

INSERT IGNORE INTO quest_poi_points (QuestID,Idx1,Idx2,X,Y,Z,VerifiedBuild) VALUES
(97270,0,0,-3763,1135,160,70124),
(99233,0,0,-3763,1135,160,70124),
(99234,0,0,-3763,1135,160,70124);

-- Undo (also ready-to-run in undo/undo_0063_world_turnin_poi_feralas.sql):
--   DELETE FROM quest_poi WHERE QuestID IN (97270,99233,99234) AND VerifiedBuild=70124;
--   DELETE FROM quest_poi_points WHERE QuestID IN (97270,99233,99234) AND VerifiedBuild=70124;
