-- 0027_world_turnin_poi_uimap_2521.sql: hand-in ('?') map markers for 15 custom quests, uimap 2521 (UiMapID 2521).
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
--   92466  Call of Earth  (sort 16593, near 3)
--   92467  Call of Earth  (sort 16593, near 24)
--   92468  Call of Earth  (sort 16593, near 3)
--   92483  At Home in the Shadows  (sort -162, near 10)
--   92484  Embracing the Elements  (sort -82, near 3)
--   92532  The Warrior's Path  (sort -81, near 3)
--   93459  More Al'Aketh Ears  (sort 16593, sibling)
--   94003  The Skybreaker Bulwark  (sort -81, near 1)
--   96996  Your First Riding Galestrider  (sort 16593, near 46)
--   97243  Call of Fire  (sort -82, near 15)
--   97244  Call of Fire  (sort -82, near 15)
--   97245  Call of Fire  (sort -82, near 15)
--   97257  Call of Fire  (sort -82, near 7)
--   97973  Camping 101: Tailoring  (sort -666, sibling)
--   98512  Al'Aketh Assassins  (sort 16593, near 19)
--
-- Worldserver restart required (quest POI data loads at startup).

INSERT IGNORE INTO quest_poi (QuestID,BlobIndex,Idx1,ObjectiveIndex,QuestObjectiveID,QuestObjectID,MapID,UiMapID,Priority,Flags,WorldEffectID,PlayerConditionID,NavigationPlayerConditionID,SpawnTrackingID,AlwaysAllowMergingBlobs,VerifiedBuild) VALUES
(92466,0,0,-1,0,0,2991,2521,0,0,0,0,0,0,0,70124),
(92467,0,0,-1,0,0,2991,2521,0,0,0,0,0,0,0,70124),
(92468,0,0,-1,0,0,2991,2521,0,0,0,0,0,0,0,70124),
(92483,0,0,-1,0,0,2991,2521,0,0,0,0,0,0,0,70124),
(92484,0,0,-1,0,0,2991,2521,0,0,0,0,0,0,0,70124),
(92532,0,0,-1,0,0,2991,2521,0,0,0,0,0,0,0,70124),
(93459,0,0,-1,0,0,2991,2521,0,0,0,0,0,0,0,70124),
(94003,0,0,-1,0,0,2991,2521,0,0,0,0,0,0,0,70124),
(96996,0,0,-1,0,0,2991,2521,0,0,0,0,0,0,0,70124),
(97243,0,0,-1,0,0,2991,2521,0,0,0,0,0,0,0,70124),
(97244,0,0,-1,0,0,2991,2521,0,0,0,0,0,0,0,70124),
(97245,0,0,-1,0,0,2991,2521,0,0,0,0,0,0,0,70124),
(97257,0,0,-1,0,0,2991,2521,0,0,0,0,0,0,0,70124),
(97973,0,0,-1,0,0,2991,2521,0,0,0,0,0,0,0,70124),
(98512,2,3,-1,0,0,2991,2521,0,0,0,0,0,0,0,70124);

INSERT IGNORE INTO quest_poi_points (QuestID,Idx1,Idx2,X,Y,Z,VerifiedBuild) VALUES
(92466,0,0,4082,1851,977,70124),
(92467,0,0,4066,1472,1026,70124),
(92468,0,0,4082,1851,977,70124),
(92483,0,0,4053,1798,983,70124),
(92484,0,0,4082,1851,977,70124),
(92532,0,0,4062,1803,983,70124),
(93459,0,0,3621,682,806,70124),
(94003,0,0,2254,900,675,70124),
(96996,0,0,1940,1237,625,70124),
(97243,0,0,1760,1381,657,70124),
(97244,0,0,1760,1381,657,70124),
(97245,0,0,1760,1381,657,70124),
(97257,0,0,2045,988,657,70124),
(97973,0,0,3318,1735,823,70124),
(98512,3,0,2690,1071,765,70124);

-- Undo (also ready-to-run in undo/undo_0027_world_turnin_poi_uimap_2521.sql):
--   DELETE FROM quest_poi WHERE QuestID IN (92466,92467,92468,92483,92484,92532,93459,94003,96996,97243,97244,97245,97257,97973,98512) AND VerifiedBuild=70124;
--   DELETE FROM quest_poi_points WHERE QuestID IN (92466,92467,92468,92483,92484,92532,93459,94003,96996,97243,97244,97245,97257,97973,98512) AND VerifiedBuild=70124;
