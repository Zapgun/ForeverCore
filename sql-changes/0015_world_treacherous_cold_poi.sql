-- 0015: quest 99162 "Treacherous Cold" (Dun Morogh) — adds the missing map
-- markers and makes the three rifle objectives sequential.
--
-- World database.
--
-- Bug: quest_poi/quest_poi_points had no rows for 99162, so none of the three
-- rifle pickups showed a map marker; and none of the objectives carried the
-- SEQUENCED flag, so all three displayed at once instead of step-by-step.
-- Sibling quest 99049 ("Threat from Below", same 3-item shape) shows the
-- intended layout: one quest_poi row per objective + one point per location.
--
--   Objectives (quest_objectives):
--     479527 Order 0 ObjectID 286360 Stoneanvil's Rifle   -> (-5804.4, -818.0)
--     479528 Order 1 ObjectID 286359 Sunhammer's Rifle    -> (-5522.0, -1148.0)
--     479529 Order 2 ObjectID 286358 Coalbeard's Rifle    -> (-5321.8, -763.8)
--   Quest giver/ender: Father Gavin (creature 1253) at (-5350.61, -1040.98).
--   UiMapID 1426 = Dun Morogh (same as sibling 99158, QuestSortID 1).
--
-- Backs up the changed objective rows to bak_0015_quest_objectives.
-- Worldserver restart required (quest templates + POI data load at startup).

CREATE TABLE IF NOT EXISTS bak_0015_quest_objectives LIKE quest_objectives;
INSERT IGNORE INTO bak_0015_quest_objectives SELECT * FROM quest_objectives WHERE QuestID=99162;

-- Objectives 1 and 2 get SEQUENCED (0x2): only shown once the previous step is done.
UPDATE quest_objectives SET Flags = Flags | 2 WHERE ID IN (479528,479529);

-- One POI blob: header row (ObjectiveIndex -1) + one row per objective.
INSERT IGNORE INTO quest_poi (QuestID,BlobIndex,Idx1,ObjectiveIndex,QuestObjectiveID,QuestObjectID,MapID,UiMapID,Priority,Flags,WorldEffectID,PlayerConditionID,NavigationPlayerConditionID,SpawnTrackingID,AlwaysAllowMergingBlobs,VerifiedBuild) VALUES
(99162,0,0,-1,0,0,0,1426,0,0,0,0,0,0,0,70124),
(99162,0,1,0,479527,286360,0,1426,0,0,0,0,0,0,0,70124),
(99162,0,2,1,479528,286359,0,1426,0,0,0,0,0,0,0,70124),
(99162,0,3,2,479529,286358,0,1426,0,0,0,0,0,0,0,70124);

-- Marker points: quest giver + each rifle spawn (world coords of gameobjects 695277/695223/695222).
INSERT IGNORE INTO quest_poi_points (QuestID,Idx1,Idx2,X,Y,Z,VerifiedBuild) VALUES
(99162,0,0,-5350.61,-1040.98,394.991,70124),
(99162,1,0,-5804.4,-818,398,70124),
(99162,2,0,-5522,-1148,398.4,70124),
(99162,3,0,-5321.8,-763.8,388.3,70124);

-- Undo:
--   UPDATE quest_objectives o JOIN bak_0015_quest_objectives b ON b.ID=o.ID SET o.Flags=b.Flags WHERE o.QuestID=99162;
--   DELETE FROM quest_poi WHERE QuestID=99162 AND VerifiedBuild=70124;
--   DELETE FROM quest_poi_points WHERE QuestID=99162 AND VerifiedBuild=70124;
