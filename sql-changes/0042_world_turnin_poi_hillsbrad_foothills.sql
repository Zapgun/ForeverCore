-- 0042_world_turnin_poi_hillsbrad_foothills.sql: hand-in ('?') map markers for 8 custom quests, hillsbrad foothills (UiMapID 1424).
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
--   93680  Key to the City  (sort 36, sibling)
--   94215  Craftsman's Writ: Free Action Potion  (sort 16941, near 96)
--   94224  Craftsman's Writ: Heavy Bronze Mace  (sort 16941, near 33)
--   94233  Craftsman's Writ: Practice Lock  (sort 16941, near 33)
--   94242  Craftsman's Writ: Pilferer's Gloves  (sort 16941, near 19)
--   97179  Collection of Goods  (sort -141, sibling)
--   97180  Ott's Finest Work  (sort -141, sibling)
--   98059  Hillsbrad's Hoard  (sort 267, near 149)
--
-- Worldserver restart required (quest POI data loads at startup).

INSERT IGNORE INTO quest_poi (QuestID,BlobIndex,Idx1,ObjectiveIndex,QuestObjectiveID,QuestObjectID,MapID,UiMapID,Priority,Flags,WorldEffectID,PlayerConditionID,NavigationPlayerConditionID,SpawnTrackingID,AlwaysAllowMergingBlobs,VerifiedBuild) VALUES
(93680,0,0,-1,0,0,0,1424,0,0,0,0,0,0,0,70124),
(94215,0,0,-1,0,0,0,1424,0,0,0,0,0,0,0,70124),
(94224,0,0,-1,0,0,0,1424,0,0,0,0,0,0,0,70124),
(94233,0,0,-1,0,0,0,1424,0,0,0,0,0,0,0,70124),
(94242,0,0,-1,0,0,0,1424,0,0,0,0,0,0,0,70124),
(97179,0,0,-1,0,0,0,1424,0,0,0,0,0,0,0,70124),
(97180,0,0,-1,0,0,0,1420,0,0,0,0,0,0,0,70124),
(98059,0,0,-1,0,0,0,1424,0,0,0,0,0,0,0,70124);

INSERT IGNORE INTO quest_poi_points (QuestID,Idx1,Idx2,X,Y,Z,VerifiedBuild) VALUES
(93680,0,0,-45,-905,57,70124),
(94215,0,0,-1076,-924,49,70124),
(94224,0,0,-633,-1493,65,70124),
(94233,0,0,-633,-1493,65,70124),
(94242,0,0,-430,-1498,88,70124),
(97179,0,0,-159,-867,57,70124),
(97180,0,0,2492,2035,156,70124),
(98059,0,0,-671,-418,32,70124);

-- Undo (also ready-to-run in undo/undo_0042_world_turnin_poi_hillsbrad_foothills.sql):
--   DELETE FROM quest_poi WHERE QuestID IN (93680,94215,94224,94233,94242,97179,97180,98059) AND VerifiedBuild=70124;
--   DELETE FROM quest_poi_points WHERE QuestID IN (93680,94215,94224,94233,94242,97179,97180,98059) AND VerifiedBuild=70124;
