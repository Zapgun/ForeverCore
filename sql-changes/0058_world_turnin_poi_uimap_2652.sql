-- 0058_world_turnin_poi_uimap_2652.sql: hand-in ('?') map markers for 3 custom quests, uimap 2652 (UiMapID 2652).
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
--   93037  Outing Outcasts  (sort 16651, sibling)
--   93128  Khan Jehn  (sort 405, sibling)
--   93568  Partially Digested Collar  (sort 16651, near 528)
--
-- Worldserver restart required (quest POI data loads at startup).

INSERT IGNORE INTO quest_poi (QuestID,BlobIndex,Idx1,ObjectiveIndex,QuestObjectiveID,QuestObjectID,MapID,UiMapID,Priority,Flags,WorldEffectID,PlayerConditionID,NavigationPlayerConditionID,SpawnTrackingID,AlwaysAllowMergingBlobs,VerifiedBuild) VALUES
(93037,0,0,-1,0,0,1,2652,0,0,0,0,0,0,0,70124),
(93128,0,0,-1,0,0,1,1443,0,0,0,0,0,0,0,70124),
(93568,0,0,-1,0,0,1,2652,0,0,0,0,0,0,0,70124);

INSERT IGNORE INTO quest_poi_points (QuestID,Idx1,Idx2,X,Y,Z,VerifiedBuild) VALUES
(93037,0,0,-2217,1590,60,70124),
(93128,0,0,-1924,2605,65,70124),
(93568,0,0,-2805,1057,132,70124);

-- Undo (also ready-to-run in undo/undo_0058_world_turnin_poi_uimap_2652.sql):
--   DELETE FROM quest_poi WHERE QuestID IN (93037,93128,93568) AND VerifiedBuild=70124;
--   DELETE FROM quest_poi_points WHERE QuestID IN (93037,93128,93568) AND VerifiedBuild=70124;
