-- 0025_world_turnin_poi_stormwind_city.sql: hand-in ('?') map markers for 3 custom quests, stormwind city (UiMapID 1453).
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
--   98896  Darkspear Islands Clash  (sort 16606, near 15, markers in uimap 1417,1421,1426,1438,1440)
--   98896  Darkspear Islands Clash  (sort 16606, near 5, markers in uimap 1417,1421,1426,1438,1440)
--   98896  Darkspear Islands Clash  (sort 16606, near 9, markers in uimap 1417,1421,1426,1438,1440)
--   98896  Darkspear Islands Clash  (sort 16606, sibling, markers in uimap 1417,1421,1426,1438,1440)
--   98899  Darkspear Islands Clash  (sort 16606, near 15, markers in uimap 1417,1421,1426,1438,1440)
--   98899  Darkspear Islands Clash  (sort 16606, near 5, markers in uimap 1417,1421,1426,1438,1440)
--   98899  Darkspear Islands Clash  (sort 16606, near 9, markers in uimap 1417,1421,1426,1438,1440)
--   98899  Darkspear Islands Clash  (sort 16606, sibling, markers in uimap 1417,1421,1426,1438,1440)
--   98901  Darkspear Islands Clash  (sort 16606, near 15, markers in uimap 1417,1421,1426,1438,1440)
--   98901  Darkspear Islands Clash  (sort 16606, near 5, markers in uimap 1417,1421,1426,1438,1440)
--   98901  Darkspear Islands Clash  (sort 16606, near 9, markers in uimap 1417,1421,1426,1438,1440)
--   98901  Darkspear Islands Clash  (sort 16606, sibling, markers in uimap 1417,1421,1426,1438,1440)
--
-- Worldserver restart required (quest POI data loads at startup).

INSERT IGNORE INTO quest_poi (QuestID,BlobIndex,Idx1,ObjectiveIndex,QuestObjectiveID,QuestObjectID,MapID,UiMapID,Priority,Flags,WorldEffectID,PlayerConditionID,NavigationPlayerConditionID,SpawnTrackingID,AlwaysAllowMergingBlobs,VerifiedBuild) VALUES
(98896,0,0,-1,0,0,0,1453,0,0,0,0,0,0,0,70124),
(98896,1,1,-1,0,0,1,1438,0,0,0,0,0,0,0,70124),
(98896,2,2,-1,0,0,0,1426,0,0,0,0,0,0,0,70124),
(98896,3,3,-1,0,0,0,1421,0,0,0,0,0,0,0,70124),
(98896,4,4,-1,0,0,1,1440,0,0,0,0,0,0,0,70124),
(98896,5,5,-1,0,0,0,1417,0,0,0,0,0,0,0,70124),
(98899,0,0,-1,0,0,0,1453,0,0,0,0,0,0,0,70124),
(98899,1,1,-1,0,0,1,1438,0,0,0,0,0,0,0,70124),
(98899,2,2,-1,0,0,0,1426,0,0,0,0,0,0,0,70124),
(98899,3,3,-1,0,0,0,1421,0,0,0,0,0,0,0,70124),
(98899,4,4,-1,0,0,1,1440,0,0,0,0,0,0,0,70124),
(98899,5,5,-1,0,0,0,1417,0,0,0,0,0,0,0,70124),
(98901,0,0,-1,0,0,0,1453,0,0,0,0,0,0,0,70124),
(98901,1,1,-1,0,0,1,1438,0,0,0,0,0,0,0,70124),
(98901,2,2,-1,0,0,0,1426,0,0,0,0,0,0,0,70124),
(98901,3,3,-1,0,0,0,1421,0,0,0,0,0,0,0,70124),
(98901,4,4,-1,0,0,1,1440,0,0,0,0,0,0,0,70124),
(98901,5,5,-1,0,0,0,1417,0,0,0,0,0,0,0,70124);

INSERT IGNORE INTO quest_poi_points (QuestID,Idx1,Idx2,X,Y,Z,VerifiedBuild) VALUES
(98896,0,0,-8442,312,121,70124),
(98896,1,0,9995,2324,1331,70124),
(98896,2,0,-5050,-1270,510,70124),
(98896,3,0,-37,-317,131,70124),
(98896,4,0,1451,-1872,127,70124),
(98896,5,0,-1231,-2510,23,70124),
(98899,0,0,-8442,312,121,70124),
(98899,1,0,9995,2324,1331,70124),
(98899,2,0,-5050,-1270,510,70124),
(98899,3,0,-37,-317,131,70124),
(98899,4,0,1451,-1872,127,70124),
(98899,5,0,-1231,-2510,23,70124),
(98901,0,0,-8442,312,121,70124),
(98901,1,0,9995,2324,1331,70124),
(98901,2,0,-5050,-1270,510,70124),
(98901,3,0,-37,-317,131,70124),
(98901,4,0,1451,-1872,127,70124),
(98901,5,0,-1231,-2510,23,70124);

-- Undo (also ready-to-run in undo/undo_0025_world_turnin_poi_stormwind_city.sql):
--   DELETE FROM quest_poi WHERE QuestID IN (98896,98899,98901) AND VerifiedBuild=70124;
--   DELETE FROM quest_poi_points WHERE QuestID IN (98896,98899,98901) AND VerifiedBuild=70124;
