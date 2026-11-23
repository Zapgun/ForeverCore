-- 0036_world_turnin_poi_wetlands.sql: hand-in ('?') map markers for 11 custom quests, wetlands (UiMapID 1437).
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
--   94219  Craftsman's Writ: Draught of Water Breathing  (sort 16941, near 41)
--   94228  Craftsman's Writ: Green Iron Boots  (sort 16941, near 41)
--   94237  Craftsman's Writ: Crafted Solid Shot  (sort 16941, near 41)
--   94246  Craftsman's Writ: Red Whelp Gloves  (sort 16941, near 41)
--   94255  Craftsman's Writ: Spider Silk Slippers  (sort 16941, near 41)
--   97171  Your First Horse  (sort 11, near 38)
--   98208  Bloom of the Heavens  (sort 11, near 21)
--   98209  Bloom of the Heavens  (sort 11, sibling)
--   98223  Old Habits  (sort 11, sibling)
--   98240  Crimson Crate Delivery  (sort 11, sibling)
--   98313  For Further Study  (sort 1537, sibling)
--
-- Worldserver restart required (quest POI data loads at startup).

INSERT IGNORE INTO quest_poi (QuestID,BlobIndex,Idx1,ObjectiveIndex,QuestObjectiveID,QuestObjectID,MapID,UiMapID,Priority,Flags,WorldEffectID,PlayerConditionID,NavigationPlayerConditionID,SpawnTrackingID,AlwaysAllowMergingBlobs,VerifiedBuild) VALUES
(94219,0,0,-1,0,0,0,1437,0,0,0,0,0,0,0,70124),
(94228,0,0,-1,0,0,0,1437,0,0,0,0,0,0,0,70124),
(94237,0,0,-1,0,0,0,1437,0,0,0,0,0,0,0,70124),
(94246,0,0,-1,0,0,0,1437,0,0,0,0,0,0,0,70124),
(94255,0,0,-1,0,0,0,1437,0,0,0,0,0,0,0,70124),
(97171,0,0,-1,0,0,0,1437,0,0,0,0,0,0,0,70124),
(98208,0,0,-1,0,0,0,1437,0,0,0,0,0,0,0,70124),
(98209,0,0,-1,0,0,1,1439,0,0,0,0,0,0,0,70124),
(98223,0,0,-1,0,0,0,1437,0,0,0,0,0,0,0,70124),
(98240,0,0,-1,0,0,0,1437,0,0,0,0,0,0,0,70124),
(98313,0,0,-1,0,0,0,1426,0,0,0,0,0,0,0,70124);

INSERT IGNORE INTO quest_poi_points (QuestID,Idx1,Idx2,X,Y,Z,VerifiedBuild) VALUES
(94219,0,0,-3188,-2466,10,70124),
(94228,0,0,-3188,-2466,10,70124),
(94237,0,0,-3188,-2466,10,70124),
(94246,0,0,-3188,-2466,10,70124),
(94255,0,0,-3188,-2466,10,70124),
(97171,0,0,-3646,-744,10,70124),
(98208,0,0,-3686,-720,16,70124),
(98209,0,0,6581,492,8,70124),
(98223,0,0,-3732,-797,27,70124),
(98240,0,0,-3300,-2432,19,70124),
(98313,0,0,-4632,-1327,503,70124);

-- Undo (also ready-to-run in undo/undo_0036_world_turnin_poi_wetlands.sql):
--   DELETE FROM quest_poi WHERE QuestID IN (94219,94228,94237,94246,94255,97171,98208,98209,98223,98240,98313) AND VerifiedBuild=70124;
--   DELETE FROM quest_poi_points WHERE QuestID IN (94219,94228,94237,94246,94255,97171,98208,98209,98223,98240,98313) AND VerifiedBuild=70124;
