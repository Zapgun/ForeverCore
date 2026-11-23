-- 0043_world_turnin_poi_tanaris.sql: hand-in ('?') map markers for 8 custom quests, tanaris (UiMapID 1446).
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
--   94265  Craftsman's Writ: Goblin Rocket Fuel  (sort 16941, sibling)
--   94277  Craftsman's Writ: Truesilver Rod  (sort 16941, sibling)
--   94289  Craftsman's Writ: Gyromatic Micro-Adjuster  (sort 16941, near 3)
--   94301  Craftsman's Writ: Big Voodoo Robe  (sort 16941, sibling)
--   94313  Craftsman's Writ: White Bandit Mask  (sort 16941, sibling)
--   96912  Field of Honor: Week 1  (sort 976, near 19)
--   96913  Field of Honor: Week 2  (sort 3277, near 19)
--   97530  Dunemaul Dues  (sort 440, sibling)
--
-- Worldserver restart required (quest POI data loads at startup).

INSERT IGNORE INTO quest_poi (QuestID,BlobIndex,Idx1,ObjectiveIndex,QuestObjectiveID,QuestObjectID,MapID,UiMapID,Priority,Flags,WorldEffectID,PlayerConditionID,NavigationPlayerConditionID,SpawnTrackingID,AlwaysAllowMergingBlobs,VerifiedBuild) VALUES
(94265,0,0,-1,0,0,1,1446,0,0,0,0,0,0,0,70124),
(94277,0,0,-1,0,0,1,1446,0,0,0,0,0,0,0,70124),
(94289,0,0,-1,0,0,1,1446,0,0,0,0,0,0,0,70124),
(94301,0,0,-1,0,0,1,1446,0,0,0,0,0,0,0,70124),
(94313,0,0,-1,0,0,1,1446,0,0,0,0,0,0,0,70124),
(96912,0,0,-1,0,0,1,1446,0,0,0,0,0,0,0,70124),
(96913,0,0,-1,0,0,1,1446,0,0,0,0,0,0,0,70124),
(97530,0,0,-1,0,0,1,1446,0,0,0,0,0,0,0,70124);

INSERT IGNORE INTO quest_poi_points (QuestID,Idx1,Idx2,X,Y,Z,VerifiedBuild) VALUES
(94265,0,0,-7115,-3730,9,70124),
(94277,0,0,-7183,-3840,9,70124),
(94289,0,0,-7112,-3827,10,70124),
(94301,0,0,-6903,-4841,8,70124),
(94313,0,0,-7134,-3739,8,70124),
(96912,0,0,-7117,-3793,8,70124),
(96913,0,0,-7117,-3793,8,70124),
(97530,0,0,-6974,-4846,8,70124);

-- Undo (also ready-to-run in undo/undo_0043_world_turnin_poi_tanaris.sql):
--   DELETE FROM quest_poi WHERE QuestID IN (94265,94277,94289,94301,94313,96912,96913,97530) AND VerifiedBuild=70124;
--   DELETE FROM quest_poi_points WHERE QuestID IN (94265,94277,94289,94301,94313,96912,96913,97530) AND VerifiedBuild=70124;
