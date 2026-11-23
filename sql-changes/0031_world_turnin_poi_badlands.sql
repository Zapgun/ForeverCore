-- 0031_world_turnin_poi_badlands.sql: hand-in ('?') map markers for 11 custom quests, badlands (UiMapID 1418).
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
--   94256  Craftsman's Writ: Frost Protection Potion  (sort 16941, sibling)
--   94268  Craftsman's Writ: Steel Plate Helm  (sort 16941, near 43)
--   94280  Craftsman's Writ: Mechanical Dragonling  (sort 16941, near 124)
--   94292  Craftsman's Writ: Comfortable Leather Hat  (sort 16941, sibling)
--   94304  Craftsman's Writ: Mageweave Bag  (sort 16941, sibling)
--   94745  Carving a Path  (sort 16591, near 185)
--   95278  It Is Time, Brother...  (sort 16591, near 233)
--   95424  Might Makes Right  (sort 16591, near 840)
--   95428  Clugfist's Decree  (sort 16591, near 233)
--   95431  Rumblings of Discontent  (sort 16591, near 180)
--   97821  Mirage Mirror  (sort 3, near 33)
--   97821  Mirage Mirror  (sort 3, near 77)
--
-- Worldserver restart required (quest POI data loads at startup).

INSERT IGNORE INTO quest_poi (QuestID,BlobIndex,Idx1,ObjectiveIndex,QuestObjectiveID,QuestObjectID,MapID,UiMapID,Priority,Flags,WorldEffectID,PlayerConditionID,NavigationPlayerConditionID,SpawnTrackingID,AlwaysAllowMergingBlobs,VerifiedBuild) VALUES
(94256,0,0,-1,0,0,0,1418,0,0,0,0,0,0,0,70124),
(94268,0,0,-1,0,0,0,1418,0,0,0,0,0,0,0,70124),
(94280,0,0,-1,0,0,0,1418,0,0,0,0,0,0,0,70124),
(94292,0,0,-1,0,0,0,1418,0,0,0,0,0,0,0,70124),
(94304,0,0,-1,0,0,0,1418,0,0,0,0,0,0,0,70124),
(94745,0,0,-1,0,0,0,1418,0,0,0,0,0,0,0,70124),
(95278,0,0,-1,0,0,0,84,0,0,0,0,0,0,0,70124),
(95424,0,0,-1,0,0,0,1418,0,0,0,0,0,0,0,70124),
(95428,0,0,-1,0,0,0,84,0,0,0,0,0,0,0,70124),
(95431,0,0,-1,0,0,0,36,0,0,0,0,0,0,0,70124),
(97821,0,0,-1,0,0,0,1418,0,0,0,0,0,0,0,70124),
(97821,1,1,-1,0,0,0,1418,0,0,0,0,0,0,0,70124);

INSERT IGNORE INTO quest_poi_points (QuestID,Idx1,Idx2,X,Y,Z,VerifiedBuild) VALUES
(94256,0,0,-6634,-2725,243,70124),
(94268,0,0,-6079,-3189,256,70124),
(94280,0,0,-6752,-3766,255,70124),
(94292,0,0,-6789,-3620,244,70124),
(94304,0,0,-6767,-3134,241,70124),
(94745,0,0,-7693,-3515,182,70124),
(95278,0,0,-7941,-4773,22,70124),
(95424,0,0,-6945,-5015,78,70124),
(95428,0,0,-7941,-4773,22,70124),
(95431,0,0,-7648,-3233,180,70124),
(97821,0,0,-6105,-3427,271,70124),
(97821,1,0,-6656,-2184,244,70124);

-- Undo (also ready-to-run in undo/undo_0031_world_turnin_poi_badlands.sql):
--   DELETE FROM quest_poi WHERE QuestID IN (94256,94268,94280,94292,94304,94745,95278,95424,95428,95431,97821) AND VerifiedBuild=70124;
--   DELETE FROM quest_poi_points WHERE QuestID IN (94256,94268,94280,94292,94304,94745,95278,95424,95428,95431,97821) AND VerifiedBuild=70124;
