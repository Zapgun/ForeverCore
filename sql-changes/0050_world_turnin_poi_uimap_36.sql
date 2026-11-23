-- 0050_world_turnin_poi_uimap_36.sql: hand-in ('?') map markers for 6 custom quests, uimap 36 (UiMapID 36).
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
--   94327  Craftsman's Writ: Orcish War Leggings  (sort 16941, near 39)
--   94336  Craftsman's Writ: Lifelike Mechanical Toad  (sort 16941, near 39)
--   94889  Carving a Path  (sort 16591, near 352)
--   95147  The Lost Scout  (sort 16591, near 518)
--   95433  Death to the Executioner  (sort 16591, near 840)
--   96015  A Miner Problem  (sort 16591, near 352)
--
-- Worldserver restart required (quest POI data loads at startup).

INSERT IGNORE INTO quest_poi (QuestID,BlobIndex,Idx1,ObjectiveIndex,QuestObjectiveID,QuestObjectID,MapID,UiMapID,Priority,Flags,WorldEffectID,PlayerConditionID,NavigationPlayerConditionID,SpawnTrackingID,AlwaysAllowMergingBlobs,VerifiedBuild) VALUES
(94327,0,0,-1,0,0,0,36,0,0,0,0,0,0,0,70124),
(94336,0,0,-1,0,0,0,36,0,0,0,0,0,0,0,70124),
(94889,0,0,-1,0,0,0,36,0,0,0,0,0,0,0,70124),
(95147,0,0,-1,0,0,0,1433,0,0,0,0,0,0,0,70124),
(95433,0,0,-1,0,0,0,1418,0,0,0,0,0,0,0,70124),
(96015,0,0,-1,0,0,0,36,0,0,0,0,0,0,0,70124);

INSERT IGNORE INTO quest_poi_points (QuestID,Idx1,Idx2,X,Y,Z,VerifiedBuild) VALUES
(94327,0,0,-7714,-1386,132,70124),
(94336,0,0,-7714,-1386,132,70124),
(94889,0,0,-8051,-3366,167,70124),
(95147,0,0,-8879,-3803,48,70124),
(95433,0,0,-6945,-5015,78,70124),
(96015,0,0,-8051,-3366,167,70124);

-- Undo (also ready-to-run in undo/undo_0050_world_turnin_poi_uimap_36.sql):
--   DELETE FROM quest_poi WHERE QuestID IN (94327,94336,94889,95147,95433,96015) AND VerifiedBuild=70124;
--   DELETE FROM quest_poi_points WHERE QuestID IN (94327,94336,94889,95147,95433,96015) AND VerifiedBuild=70124;
