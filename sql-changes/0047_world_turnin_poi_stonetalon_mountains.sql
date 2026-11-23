-- 0047_world_turnin_poi_stonetalon_mountains.sql: hand-in ('?') map markers for 6 custom quests, stonetalon mountains (UiMapID 1442).
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
--   94216  Craftsman's Writ: Elixir of Lesser Agility  (sort 16941, sibling)
--   94225  Craftsman's Writ: Rough Bronze Leggings  (sort 16941, sibling)
--   94234  Craftsman's Writ: Shadow Goggles  (sort 16941, sibling)
--   94243  Craftsman's Writ: Heavy Quiver  (sort 16941, sibling)
--   94252  Craftsman's Writ: Red Woolen Boots  (sort 16941, sibling)
--   97446  Your First Riding Kodo  (sort 406, near 20)
--
-- Worldserver restart required (quest POI data loads at startup).

INSERT IGNORE INTO quest_poi (QuestID,BlobIndex,Idx1,ObjectiveIndex,QuestObjectiveID,QuestObjectID,MapID,UiMapID,Priority,Flags,WorldEffectID,PlayerConditionID,NavigationPlayerConditionID,SpawnTrackingID,AlwaysAllowMergingBlobs,VerifiedBuild) VALUES
(94216,0,0,-1,0,0,1,1442,0,0,0,0,0,0,0,70124),
(94225,0,0,-1,0,0,1,1442,0,0,0,0,0,0,0,70124),
(94234,0,0,-1,0,0,1,1442,0,0,0,0,0,0,0,70124),
(94243,0,0,-1,0,0,1,1442,0,0,0,0,0,0,0,70124),
(94252,0,0,-1,0,0,1,1442,0,0,0,0,0,0,0,70124),
(97446,0,0,-1,0,0,1,1442,0,0,0,0,0,0,0,70124);

INSERT IGNORE INTO quest_poi_points (QuestID,Idx1,Idx2,X,Y,Z,VerifiedBuild) VALUES
(94216,0,0,878,365,23,70124),
(94225,0,0,878,365,23,70124),
(94234,0,0,878,365,23,70124),
(94243,0,0,878,365,23,70124),
(94252,0,0,878,365,23,70124),
(97446,0,0,969,1000,105,70124);

-- Undo (also ready-to-run in undo/undo_0047_world_turnin_poi_stonetalon_mountains.sql):
--   DELETE FROM quest_poi WHERE QuestID IN (94216,94225,94234,94243,94252,97446) AND VerifiedBuild=70124;
--   DELETE FROM quest_poi_points WHERE QuestID IN (94216,94225,94234,94243,94252,97446) AND VerifiedBuild=70124;
