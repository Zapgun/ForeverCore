-- 0048_world_turnin_poi_felwood.sql: hand-in ('?') map markers for 6 custom quests, felwood (UiMapID 1448).
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
--   94259  Craftsman's Writ: Nature Protection Potion  (sort 16941, sibling)
--   94271  Craftsman's Writ: Ornate Mithril Shoulders  (sort 16941, sibling)
--   94283  Craftsman's Writ: Goblin Land Mine  (sort 16941, sibling)
--   94295  Craftsman's Writ: Wild Leather Helmet  (sort 16941, near 4)
--   94307  Craftsman's Writ: Shadoweave Robe  (sort 16941, sibling)
--   94308  Craftsman's Writ: Enchanted Mageweave Pouch  (sort 16941, sibling)
--
-- Worldserver restart required (quest POI data loads at startup).

INSERT IGNORE INTO quest_poi (QuestID,BlobIndex,Idx1,ObjectiveIndex,QuestObjectiveID,QuestObjectID,MapID,UiMapID,Priority,Flags,WorldEffectID,PlayerConditionID,NavigationPlayerConditionID,SpawnTrackingID,AlwaysAllowMergingBlobs,VerifiedBuild) VALUES
(94259,0,0,-1,0,0,1,1448,0,0,0,0,0,0,0,70124),
(94271,0,0,-1,0,0,1,1448,0,0,0,0,0,0,0,70124),
(94283,0,0,-1,0,0,1,1448,0,0,0,0,0,0,0,70124),
(94295,0,0,-1,0,0,1,1448,0,0,0,0,0,0,0,70124),
(94307,0,0,-1,0,0,1,1448,0,0,0,0,0,0,0,70124),
(94308,0,0,-1,0,0,1,1448,0,0,0,0,0,0,0,70124);

INSERT IGNORE INTO quest_poi_points (QuestID,Idx1,Idx2,X,Y,Z,VerifiedBuild) VALUES
(94259,0,0,3986,-1303,251,70124),
(94271,0,0,4005,-1284,254,70124),
(94283,0,0,3990,-1311,254,70124),
(94295,0,0,4006,-1288,254,70124),
(94307,0,0,4009,-1311,255,70124),
(94308,0,0,5408,-737,344,70124);

-- Undo (also ready-to-run in undo/undo_0048_world_turnin_poi_felwood.sql):
--   DELETE FROM quest_poi WHERE QuestID IN (94259,94271,94283,94295,94307,94308) AND VerifiedBuild=70124;
--   DELETE FROM quest_poi_points WHERE QuestID IN (94259,94271,94283,94295,94307,94308) AND VerifiedBuild=70124;
