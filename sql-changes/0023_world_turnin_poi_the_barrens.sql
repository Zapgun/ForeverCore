-- 0023_world_turnin_poi_the_barrens.sql: hand-in ('?') map markers for 18 custom quests, the barrens (UiMapID 1443).
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
--   92754  A New Need for Shadow Protection  (sort 405, near 152)
--   92811  Economic Warfare  (sort 405, near 36)
--   92812  Economic Warfare  (sort 405, near 44)
--   92841  Valley of Bones  (sort 16651, near 25)
--   92841  Valley of Bones  (sort 16651, near 34)
--   92893  No Mercy for the Weak  (sort 16651, near 25)
--   92893  No Mercy for the Weak  (sort 16651, near 34)
--   93034  Valley of Bones  (sort 16651, sibling)
--   93066  Bristleback Retreat  (sort 16651, near 390)
--   93224  Carved Centaur Totems  (sort 405, near 3)
--   93225  Carved Centaur Totems  (sort 405, near 5)
--   93227  Buying Friendship: Gelkis  (sort 405, near 44)
--   94257  Craftsman's Writ: Lesser Invisibility Potion  (sort 16941, sibling)
--   94269  Craftsman's Writ: Inlaid Mithril Cylinder  (sort 16941, sibling)
--   94281  Craftsman's Writ: Advanced Target Dummy  (sort 16941, sibling)
--   94293  Craftsman's Writ: Guardian Cloak  (sort 16941, sibling)
--   94305  Craftsman's Writ: Shadoweave Gloves  (sort 16941, sibling)
--   94872  Buying Friendship: Magram  (sort 405, near 36)
--   94873  Buying Friendship: Gelkis  (sort 405, near 44)
--   96222  Khan Hratha  (sort 405, near 200)
--
-- Worldserver restart required (quest POI data loads at startup).

INSERT IGNORE INTO quest_poi (QuestID,BlobIndex,Idx1,ObjectiveIndex,QuestObjectiveID,QuestObjectID,MapID,UiMapID,Priority,Flags,WorldEffectID,PlayerConditionID,NavigationPlayerConditionID,SpawnTrackingID,AlwaysAllowMergingBlobs,VerifiedBuild) VALUES
(92754,0,0,-1,0,0,1,1443,0,0,0,0,0,0,0,70124),
(92811,0,0,-1,0,0,1,1443,0,0,0,0,0,0,0,70124),
(92812,0,0,-1,0,0,1,1443,0,0,0,0,0,0,0,70124),
(92841,0,0,-1,0,0,1,1443,0,0,0,0,0,0,0,70124),
(92841,1,1,-1,0,0,1,1443,0,0,0,0,0,0,0,70124),
(92893,0,0,-1,0,0,1,1443,0,0,0,0,0,0,0,70124),
(92893,1,1,-1,0,0,1,1443,0,0,0,0,0,0,0,70124),
(93034,0,0,-1,0,0,1,2652,0,0,0,0,0,0,0,70124),
(93066,0,0,-1,0,0,1,1412,0,0,0,0,0,0,0,70124),
(93224,0,0,-1,0,0,1,1443,0,0,0,0,0,0,0,70124),
(93225,0,0,-1,0,0,1,1443,0,0,0,0,0,0,0,70124),
(93227,0,0,-1,0,0,1,1443,0,0,0,0,0,0,0,70124),
(94257,0,0,-1,0,0,1,1443,0,0,0,0,0,0,0,70124),
(94269,0,0,-1,0,0,1,1443,0,0,0,0,0,0,0,70124),
(94281,0,0,-1,0,0,1,1443,0,0,0,0,0,0,0,70124),
(94293,0,0,-1,0,0,1,1443,0,0,0,0,0,0,0,70124),
(94305,0,0,-1,0,0,1,1443,0,0,0,0,0,0,0,70124),
(94872,0,0,-1,0,0,1,1443,0,0,0,0,0,0,0,70124),
(94873,0,0,-1,0,0,1,1443,0,0,0,0,0,0,0,70124),
(96222,0,0,-1,0,0,1,1443,0,0,0,0,0,0,0,70124);

INSERT IGNORE INTO quest_poi_points (QuestID,Idx1,Idx2,X,Y,Z,VerifiedBuild) VALUES
(92754,0,0,-1658,1065,89,70124),
(92811,0,0,-1928,1257,92,70124),
(92812,0,0,-2306,2633,60,70124),
(92841,0,0,-2065,1296,66,70124),
(92841,1,0,-2079,1292,66,70124),
(92893,0,0,-2065,1296,66,70124),
(92893,1,0,-2079,1292,66,70124),
(93034,0,0,-2217,1590,60,70124),
(93066,0,0,-2635,820,76,70124),
(93224,0,0,124,1236,163,70124),
(93225,0,0,-1337,1703,90,70124),
(93227,0,0,-2306,2633,60,70124),
(94257,0,0,-2146,1963,84,70124),
(94269,0,0,-717,1431,90,70124),
(94281,0,0,-717,1431,90,70124),
(94293,0,0,-362,2485,75,70124),
(94305,0,0,-736,1437,91,70124),
(94872,0,0,-1928,1257,92,70124),
(94873,0,0,-2306,2633,60,70124),
(96222,0,0,-1904,2282,60,70124);

-- Undo (also ready-to-run in undo/undo_0023_world_turnin_poi_the_barrens.sql):
--   DELETE FROM quest_poi WHERE QuestID IN (92754,92811,92812,92841,92893,93034,93066,93224,93225,93227,94257,94269,94281,94293,94305,94872,94873,96222) AND VerifiedBuild=70124;
--   DELETE FROM quest_poi_points WHERE QuestID IN (92754,92811,92812,92841,92893,93034,93066,93224,93225,93227,94257,94269,94281,94293,94305,94872,94873,96222) AND VerifiedBuild=70124;
