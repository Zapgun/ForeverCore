-- 0019_world_turnin_poi_uimap_1.sql: hand-in ('?') map markers for 3 custom quests, uimap 1 (UiMapID 1).
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
--   96822  For Honor  (sort 14, near 1, markers in uimap 1411)
--   96822  For Honor  (sort 14, near 10, markers in uimap 1411)
--   96822  For Honor  (sort 14, near 12, markers in uimap 1411)
--   96822  For Honor  (sort 14, near 15, markers in uimap 1411)
--   96822  For Honor  (sort 14, near 17, markers in uimap 1411)
--   96822  For Honor  (sort 14, near 18, markers in uimap 1411)
--   96822  For Honor  (sort 14, near 19, markers in uimap 1411)
--   96822  For Honor  (sort 14, near 2, markers in uimap 1411)
--   96822  For Honor  (sort 14, near 21, markers in uimap 1411)
--   96822  For Honor  (sort 14, near 23, markers in uimap 1411)
--   96822  For Honor  (sort 14, near 24, markers in uimap 1411)
--   96822  For Honor  (sort 14, near 3, markers in uimap 1411)
--   96822  For Honor  (sort 14, near 30, markers in uimap 1411)
--   96822  For Honor  (sort 14, near 36, markers in uimap 1411)
--   96822  For Honor  (sort 14, near 4, markers in uimap 1411)
--   96822  For Honor  (sort 14, near 5, markers in uimap 1411)
--   96822  For Honor  (sort 14, near 6, markers in uimap 1411)
--   96822  For Honor  (sort 14, near 7, markers in uimap 1411)
--   96822  For Honor  (sort 14, near 8, markers in uimap 1411)
--   96822  For Honor  (sort 14, near 9, markers in uimap 1411)
--   96873  A Pain in the Neck  (sort 14, near 14)
--   99201  Swift as the Wind  (sort 1637, sibling)
--
-- Worldserver restart required (quest POI data loads at startup).

INSERT IGNORE INTO quest_poi (QuestID,BlobIndex,Idx1,ObjectiveIndex,QuestObjectiveID,QuestObjectID,MapID,UiMapID,Priority,Flags,WorldEffectID,PlayerConditionID,NavigationPlayerConditionID,SpawnTrackingID,AlwaysAllowMergingBlobs,VerifiedBuild) VALUES
(96822,0,0,-1,0,0,1,1,0,0,0,0,0,0,0,70124),
(96822,1,1,-1,0,0,1,1,0,0,0,0,0,0,0,70124),
(96822,2,2,-1,0,0,1,1,0,0,0,0,0,0,0,70124),
(96822,3,3,-1,0,0,1,1,0,0,0,0,0,0,0,70124),
(96822,4,4,-1,0,0,1,1,0,0,0,0,0,0,0,70124),
(96822,5,5,-1,0,0,1,1,0,0,0,0,0,0,0,70124),
(96822,6,6,-1,0,0,1,1,0,0,0,0,0,0,0,70124),
(96822,7,7,-1,0,0,1,1,0,0,0,0,0,0,0,70124),
(96822,8,8,-1,0,0,1,1,0,0,0,0,0,0,0,70124),
(96822,9,9,-1,0,0,1,1,0,0,0,0,0,0,0,70124),
(96822,10,10,-1,0,0,1,1,0,0,0,0,0,0,0,70124),
(96822,11,11,-1,0,0,1,1,0,0,0,0,0,0,0,70124),
(96822,12,12,-1,0,0,1,1,0,0,0,0,0,0,0,70124),
(96822,13,13,-1,0,0,1,1,0,0,0,0,0,0,0,70124),
(96822,14,14,-1,0,0,1,1411,0,0,0,0,0,0,0,70124),
(96822,15,15,-1,0,0,1,1,0,0,0,0,0,0,0,70124),
(96822,16,16,-1,0,0,1,1,0,0,0,0,0,0,0,70124),
(96822,17,17,-1,0,0,1,1,0,0,0,0,0,0,0,70124),
(96822,18,18,-1,0,0,1,1,0,0,0,0,0,0,0,70124),
(96822,19,19,-1,0,0,1,1,0,0,0,0,0,0,0,70124),
(96822,20,20,-1,0,0,1,1,0,0,0,0,0,0,0,70124),
(96822,21,21,-1,0,0,1,1,0,0,0,0,0,0,0,70124),
(96822,22,22,-1,0,0,1,1,0,0,0,0,0,0,0,70124),
(96822,23,23,-1,0,0,1,1,0,0,0,0,0,0,0,70124),
(96822,24,24,-1,0,0,1,1,0,0,0,0,0,0,0,70124),
(96822,25,25,-1,0,0,1,1,0,0,0,0,0,0,0,70124),
(96822,26,26,-1,0,0,1,1,0,0,0,0,0,0,0,70124),
(96822,27,27,-1,0,0,1,1,0,0,0,0,0,0,0,70124),
(96822,28,28,-1,0,0,1,1,0,0,0,0,0,0,0,70124),
(96822,29,29,-1,0,0,1,1,0,0,0,0,0,0,0,70124),
(96822,30,30,-1,0,0,1,1,0,0,0,0,0,0,0,70124),
(96822,31,31,-1,0,0,1,1411,0,0,0,0,0,0,0,70124),
(96822,32,32,-1,0,0,1,1,0,0,0,0,0,0,0,70124),
(96822,33,33,-1,0,0,1,1,0,0,0,0,0,0,0,70124),
(96822,34,34,-1,0,0,1,1,0,0,0,0,0,0,0,70124),
(96822,35,35,-1,0,0,1,1,0,0,0,0,0,0,0,70124),
(96873,0,0,-1,0,0,1,1,0,0,0,0,0,0,0,70124),
(99201,0,0,-1,0,0,1,1411,0,0,0,0,0,0,0,70124);

INSERT IGNORE INTO quest_poi_points (QuestID,Idx1,Idx2,X,Y,Z,VerifiedBuild) VALUES
(96822,0,0,262,-4646,12,70124),
(96822,1,0,399,-4708,10,70124),
(96822,2,0,391,-4591,55,70124),
(96822,3,0,358,-4792,13,70124),
(96822,4,0,393,-4583,70,70124),
(96822,5,0,319,-4813,11,70124),
(96822,6,0,219,-4717,15,70124),
(96822,7,0,311,-4768,10,70124),
(96822,8,0,265,-4639,12,70124),
(96822,9,0,296,-4645,17,70124),
(96822,10,0,401,-4741,11,70124),
(96822,11,0,394,-4599,76,70124),
(96822,12,0,383,-4583,76,70124),
(96822,13,0,385,-4851,14,70124),
(96822,14,0,384,-4619,53,70124),
(96822,15,0,302,-4816,11,70124),
(96822,16,0,366,-4827,11,70124),
(96822,17,0,249,-4857,14,70124),
(96822,18,0,244,-4742,10,70124),
(96822,19,0,306,-4773,9,70124),
(96822,20,0,257,-4831,11,70124),
(96822,21,0,369,-4761,12,70124),
(96822,22,0,218,-4651,16,70124),
(96822,23,0,379,-4665,16,70124),
(96822,24,0,377,-4554,53,70124),
(96822,25,0,417,-4617,54,70124),
(96822,26,0,300,-4770,10,70124),
(96822,27,0,312,-4924,18,70124),
(96822,28,0,370,-4819,12,70124),
(96822,29,0,257,-4675,15,70124),
(96822,30,0,273,-4593,21,70124),
(96822,31,0,384,-4599,70,70124),
(96822,32,0,413,-4586,53,70124),
(96822,33,0,244,-4730,10,70124),
(96822,34,0,256,-4645,12,70124),
(96822,35,0,307,-4815,10,70124),
(96873,0,0,-791,-4960,23,70124),
(99201,0,0,-858,-4883,22,70124);

-- Undo (also ready-to-run in undo/undo_0019_world_turnin_poi_uimap_1.sql):
--   DELETE FROM quest_poi WHERE QuestID IN (96822,96873,99201) AND VerifiedBuild=70124;
--   DELETE FROM quest_poi_points WHERE QuestID IN (96822,96873,99201) AND VerifiedBuild=70124;
