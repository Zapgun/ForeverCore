-- 0038_world_turnin_poi_arathi_highlands.sql: hand-in ('?') map markers for 10 custom quests, arathi highlands (UiMapID 1417).
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
--   92867  Ground to Keep  (sort 45, near 24)
--   94212  Craftsman's Writ: Elixir of Wisdom  (sort 16941, near 84)
--   94221  Craftsman's Writ: Golden Rod  (sort 16941, near 84)
--   94230  Craftsman's Writ: Explosive Sheep  (sort 16941, near 47)
--   94239  Craftsman's Writ: Fine Leather Pants  (sort 16941, near 47)
--   94248  Craftsman's Writ: Blue Overalls  (sort 16941, near 47)
--   94314  Craftsman's Writ: Cindercloth Robe  (sort 16941, sibling)
--   95143  Finding Tan'jani  (sort 45, near 212)
--   96784  Master of Disguise  (sort -162, near 34)
--   97539  Silky Sutures  (sort 45, sibling)
--
-- Worldserver restart required (quest POI data loads at startup).

INSERT IGNORE INTO quest_poi (QuestID,BlobIndex,Idx1,ObjectiveIndex,QuestObjectiveID,QuestObjectID,MapID,UiMapID,Priority,Flags,WorldEffectID,PlayerConditionID,NavigationPlayerConditionID,SpawnTrackingID,AlwaysAllowMergingBlobs,VerifiedBuild) VALUES
(92867,0,0,-1,0,0,0,1417,0,0,0,0,0,0,0,70124),
(94212,0,0,-1,0,0,0,1417,0,0,0,0,0,0,0,70124),
(94221,0,0,-1,0,0,0,1417,0,0,0,0,0,0,0,70124),
(94230,0,0,-1,0,0,0,1417,0,0,0,0,0,0,0,70124),
(94239,0,0,-1,0,0,0,1417,0,0,0,0,0,0,0,70124),
(94248,0,0,-1,0,0,0,1417,0,0,0,0,0,0,0,70124),
(94314,0,0,-1,0,0,0,1417,0,0,0,0,0,0,0,70124),
(95143,0,0,-1,0,0,0,84,0,0,0,0,0,0,0,70124),
(96784,0,0,-1,0,0,0,1417,0,0,0,0,0,0,0,70124),
(97539,0,0,-1,0,0,0,1417,0,0,0,0,0,0,0,70124);

INSERT IGNORE INTO quest_poi_points (QuestID,Idx1,Idx2,X,Y,Z,VerifiedBuild) VALUES
(92867,0,0,-1501,-1839,68,70124),
(94212,0,0,-1463,-2623,48,70124),
(94221,0,0,-1463,-2623,48,70124),
(94230,0,0,-690,-2091,59,70124),
(94239,0,0,-690,-2091,59,70124),
(94248,0,0,-690,-2091,59,70124),
(94314,0,0,-464,-2874,97,70124),
(95143,0,0,-7922,-4705,24,70124),
(96784,0,0,-1680,-1832,86,70124),
(97539,0,0,-1019,-3509,63,70124);

-- Undo (also ready-to-run in undo/undo_0038_world_turnin_poi_arathi_highlands.sql):
--   DELETE FROM quest_poi WHERE QuestID IN (92867,94212,94221,94230,94239,94248,94314,95143,96784,97539) AND VerifiedBuild=70124;
--   DELETE FROM quest_poi_points WHERE QuestID IN (92867,94212,94221,94230,94239,94248,94314,95143,96784,97539) AND VerifiedBuild=70124;
