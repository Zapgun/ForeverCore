-- 0044_world_turnin_poi_loch_modan.sql: hand-in ('?') map markers for 6 custom quests, loch modan (UiMapID 1432).
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
--   94466  Call of Fire  (sort -82, sibling)
--   94467  Call of Fire  (sort -82, near 0, markers in uimap 1411)
--   94467  Call of Fire  (sort -82, near 28, markers in uimap 1411)
--   94468  Call of Fire  (sort -82, near 145)
--   94495  Call of Water  (sort -82, near 62)
--   94502  Call of Water  (sort -82, near 64)
--   94505  Call of Water  (sort -82, sibling)
--
-- Worldserver restart required (quest POI data loads at startup).

INSERT IGNORE INTO quest_poi (QuestID,BlobIndex,Idx1,ObjectiveIndex,QuestObjectiveID,QuestObjectID,MapID,UiMapID,Priority,Flags,WorldEffectID,PlayerConditionID,NavigationPlayerConditionID,SpawnTrackingID,AlwaysAllowMergingBlobs,VerifiedBuild) VALUES
(94466,0,0,-1,0,0,0,1432,0,0,0,0,0,0,0,70124),
(94467,0,0,-1,0,0,0,1432,0,0,0,0,0,0,0,70124),
(94467,1,1,-1,0,0,1,1411,0,0,0,0,0,0,0,70124),
(94468,0,0,-1,0,0,0,1426,0,0,0,0,0,0,0,70124),
(94495,0,0,-1,0,0,0,1429,0,0,0,0,0,0,0,70124),
(94502,0,0,-1,0,0,0,1436,0,0,0,0,0,0,0,70124),
(94502,1,1,-1,0,0,0,1436,0,0,0,0,0,0,0,70124),
(94505,0,0,-1,0,0,0,1432,0,0,0,0,0,0,0,70124);

INSERT IGNORE INTO quest_poi_points (QuestID,Idx1,Idx2,X,Y,Z,VerifiedBuild) VALUES
(94466,0,0,-5702,-2876,457,70124),
(94467,0,0,-5674,-2871,476,70124),
(94467,1,0,-244,-4022,187,70124),
(94468,0,0,-5309,-2512,485,70124),
(94495,0,0,-4263,-3118,30,70124),
(94502,0,0,-10802,1428,35,70124),
(94502,1,0,-10798,1421,33,70124),
(94505,0,0,-4837,-3147,300,70124);

-- Undo (also ready-to-run in undo/undo_0044_world_turnin_poi_loch_modan.sql):
--   DELETE FROM quest_poi WHERE QuestID IN (94466,94467,94468,94495,94502,94505) AND VerifiedBuild=70124;
--   DELETE FROM quest_poi_points WHERE QuestID IN (94466,94467,94468,94495,94502,94505) AND VerifiedBuild=70124;
