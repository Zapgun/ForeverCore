-- 0037_world_turnin_poi_the_barrens.sql: hand-in ('?') map markers for 11 custom quests, the barrens (UiMapID 1413).
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
--   95494  Bruised Pride and Lion Hides  (sort 17, near 102)
--   95495  The Hermit Tanner  (sort 17, sibling)
--   95507  Vrang's Game  (sort 17, near 102)
--   95774  Her Name Is Olgra  (sort 17, sibling)
--   95819  Sign Me Up!  (sort 17, near 58)
--   95820  Karolek  (sort 1637, sibling)
--   96339  Legacy Reward: Replica Ironforge Air Rifle  (sort 17, near 25)
--   96340  Legacy Reward: Spectral Bear Cub  (sort 17, near 25)
--   96341  Legacy Reward: Spectral Bear Tabard  (sort 17, near 25)
--   96342  Legacy Reward: Reins of the Spectral Bear  (sort 17, near 25)
--   98248  Shipping Label  (sort 17, near 67)
--
-- Worldserver restart required (quest POI data loads at startup).

INSERT IGNORE INTO quest_poi (QuestID,BlobIndex,Idx1,ObjectiveIndex,QuestObjectiveID,QuestObjectID,MapID,UiMapID,Priority,Flags,WorldEffectID,PlayerConditionID,NavigationPlayerConditionID,SpawnTrackingID,AlwaysAllowMergingBlobs,VerifiedBuild) VALUES
(95494,0,0,-1,0,0,1,1413,0,0,0,0,0,0,0,70124),
(95495,0,0,-1,0,0,1,1413,0,0,0,0,0,0,0,70124),
(95507,0,0,-1,0,0,1,1413,0,0,0,0,0,0,0,70124),
(95774,0,0,-1,0,0,1,1413,0,0,0,0,0,0,0,70124),
(95819,0,0,-1,0,0,1,1413,0,0,0,0,0,0,0,70124),
(95820,0,0,-1,0,0,1,1454,0,0,0,0,0,0,0,70124),
(96339,0,0,-1,0,0,1,1413,0,0,0,0,0,0,0,70124),
(96340,0,0,-1,0,0,1,1413,0,0,0,0,0,0,0,70124),
(96341,0,0,-1,0,0,1,1413,0,0,0,0,0,0,0,70124),
(96342,0,0,-1,0,0,1,1413,0,0,0,0,0,0,0,70124),
(98248,0,0,-1,0,0,1,1413,0,0,0,0,0,0,0,70124);

INSERT IGNORE INTO quest_poi_points (QuestID,Idx1,Idx2,X,Y,Z,VerifiedBuild) VALUES
(95494,0,0,787,-1815,92,70124),
(95495,0,0,842,-1633,213,70124),
(95507,0,0,787,-1815,92,70124),
(95774,0,0,-521,-2641,96,70124),
(95819,0,0,-372,-2436,98,70124),
(95820,0,0,1861,-4562,25,70124),
(96339,0,0,-1050,-3665,24,70124),
(96340,0,0,-1050,-3665,24,70124),
(96341,0,0,-1050,-3665,24,70124),
(96342,0,0,-1050,-3665,24,70124),
(98248,0,0,-372,-2457,94,70124);

-- Undo (also ready-to-run in undo/undo_0037_world_turnin_poi_the_barrens.sql):
--   DELETE FROM quest_poi WHERE QuestID IN (95494,95495,95507,95774,95819,95820,96339,96340,96341,96342,98248) AND VerifiedBuild=70124;
--   DELETE FROM quest_poi_points WHERE QuestID IN (95494,95495,95507,95774,95819,95820,96339,96340,96341,96342,98248) AND VerifiedBuild=70124;
