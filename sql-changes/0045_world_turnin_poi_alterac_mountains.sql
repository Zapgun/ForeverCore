-- 0045_world_turnin_poi_alterac_mountains.sql: hand-in ('?') map markers for 7 custom quests, alterac mountains (UiMapID 1416).
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
--   94004  Craftsman's Writ: Elixir of Ogre's Strength  (sort 16941, near 25)
--   94238  Craftsman's Writ: Heavy Leather Ball  (sort 16941, near 25)
--   94251  Craftsman's Writ: Phoenix Pants  (sort 16941, sibling)
--   96772  The Dragon's Journal  (sort 16620, near 7)
--   96986  The Grave Knight  (sort 16544, sibling)
--   99191  A Donation of Wool  (sort 279, near 28)
--   99192  A Donation of Silk  (sort 279, near 28)
--
-- Worldserver restart required (quest POI data loads at startup).

INSERT IGNORE INTO quest_poi (QuestID,BlobIndex,Idx1,ObjectiveIndex,QuestObjectiveID,QuestObjectID,MapID,UiMapID,Priority,Flags,WorldEffectID,PlayerConditionID,NavigationPlayerConditionID,SpawnTrackingID,AlwaysAllowMergingBlobs,VerifiedBuild) VALUES
(94004,0,0,-1,0,0,0,1416,0,0,0,0,0,0,0,70124),
(94238,0,0,-1,0,0,0,1416,0,0,0,0,0,0,0,70124),
(94251,0,0,-1,0,0,0,1416,0,0,0,0,0,0,0,70124),
(96772,0,0,-1,0,0,0,1416,0,0,0,0,0,0,0,70124),
(96986,0,0,-1,0,0,0,1416,0,0,0,0,0,0,0,70124),
(99191,0,0,-1,0,0,0,1416,0,0,0,0,0,0,0,70124),
(99192,0,0,-1,0,0,0,1416,0,0,0,0,0,0,0,70124);

INSERT IGNORE INTO quest_poi_points (QuestID,Idx1,Idx2,X,Y,Z,VerifiedBuild) VALUES
(94004,0,0,358,-292,163,70124),
(94238,0,0,358,-292,163,70124),
(94251,0,0,251,-1471,55,70124),
(96772,0,0,120,355,102,70124),
(96986,0,0,-40,-937,54,70124),
(99191,0,0,420,459,111,70124),
(99192,0,0,420,459,111,70124);

-- Undo (also ready-to-run in undo/undo_0045_world_turnin_poi_alterac_mountains.sql):
--   DELETE FROM quest_poi WHERE QuestID IN (94004,94238,94251,96772,96986,99191,99192) AND VerifiedBuild=70124;
--   DELETE FROM quest_poi_points WHERE QuestID IN (94004,94238,94251,96772,96986,99191,99192) AND VerifiedBuild=70124;
