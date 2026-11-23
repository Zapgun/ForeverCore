-- 0024_world_turnin_poi_uimap_198.sql: hand-in ('?') map markers for 18 custom quests, uimap 198 (UiMapID 198).
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
--   90702  Disturbed Grave  (sort 616, near 18)
--   91564  Itching for a Fixing  (sort 616, near 8)
--   91696  Open Season  (sort 616, near 29)
--   92100  Anywhere But Here  (sort 616, near 14)
--   93127  Summit Sentries  (sort 616, near 65)
--   93444  Bait the Beast  (sort 616, near 103)
--   93521  Challenger of the Gods  (sort 616, near 65)
--   93547  A Thorny Solution  (sort 616, near 65)
--   93615  Kits and Cats  (sort 616, near 40)
--   94348  Craftsman's Writ: Chimeric Vest  (sort 16941, near 12)
--   94360  Craftsman's Writ: Soul Pouch  (sort 16941, near 37)
--   94479  One Person's Trash  (sort 616, near 35)
--   95379  A Revenge So Sweet  (sort 616, near 36)
--   96296  Fetid Corruption  (sort 616, near 7)
--   96959  Blademaster's Bonfires  (sort 616, near 10)
--   96983  Yashiro's Windwalk  (sort 616, near 10)
--   96998  Tribal Colors  (sort 616, near 11)
--   97001  Sawyer's Legacy  (sort 616, near 26)
--
-- Worldserver restart required (quest POI data loads at startup).

INSERT IGNORE INTO quest_poi (QuestID,BlobIndex,Idx1,ObjectiveIndex,QuestObjectiveID,QuestObjectID,MapID,UiMapID,Priority,Flags,WorldEffectID,PlayerConditionID,NavigationPlayerConditionID,SpawnTrackingID,AlwaysAllowMergingBlobs,VerifiedBuild) VALUES
(90702,0,0,-1,0,0,1,198,0,0,0,0,0,0,0,70124),
(91564,0,0,-1,0,0,1,198,0,0,0,0,0,0,0,70124),
(91696,0,0,-1,0,0,1,198,0,0,0,0,0,0,0,70124),
(92100,0,0,-1,0,0,1,198,0,0,0,0,0,0,0,70124),
(93127,0,0,-1,0,0,1,198,0,0,0,0,0,0,0,70124),
(93444,0,0,-1,0,0,1,198,0,0,0,0,0,0,0,70124),
(93521,0,0,-1,0,0,1,198,0,0,0,0,0,0,0,70124),
(93547,0,0,-1,0,0,1,198,0,0,0,0,0,0,0,70124),
(93615,0,0,-1,0,0,1,198,0,0,0,0,0,0,0,70124),
(94348,0,0,-1,0,0,1,198,0,0,0,0,0,0,0,70124),
(94360,0,0,-1,0,0,1,198,0,0,0,0,0,0,0,70124),
(94479,0,0,-1,0,0,1,198,0,0,0,0,0,0,0,70124),
(95379,0,0,-1,0,0,1,198,0,0,0,0,0,0,0,70124),
(96296,0,0,-1,0,0,1,198,0,0,0,0,0,0,0,70124),
(96959,0,0,-1,0,0,1,198,0,0,0,0,0,0,0,70124),
(96983,0,0,-1,0,0,1,198,0,0,0,0,0,0,0,70124),
(96998,0,0,-1,0,0,1,198,0,0,0,0,0,0,0,70124),
(97001,0,0,-1,0,0,0,1458,0,0,0,0,0,0,0,70124);

INSERT IGNORE INTO quest_poi_points (QuestID,Idx1,Idx2,X,Y,Z,VerifiedBuild) VALUES
(90702,0,0,5036,-1465,1335,70124),
(91564,0,0,5142,-1465,1343,70124),
(91696,0,0,4647,-1638,1290,70124),
(92100,0,0,5232,-1226,1376,70124),
(93127,0,0,5133,-3312,1646,70124),
(93444,0,0,5286,-3305,1659,70124),
(93521,0,0,5133,-3312,1646,70124),
(93547,0,0,5133,-3312,1646,70124),
(93615,0,0,5147,-2013,1367,70124),
(94348,0,0,4255,-4149,946,70124),
(94360,0,0,4359,-4406,897,70124),
(94479,0,0,4418,-3465,1010,70124),
(95379,0,0,4517,-2625,1125,70124),
(96296,0,0,4832,-2805,1449,70124),
(96959,0,0,5550,-2632,1483,70124),
(96983,0,0,5550,-2632,1483,70124),
(96998,0,0,5036,-1409,1337,70124),
(97001,0,0,1630,348,-62,70124);

-- Undo (also ready-to-run in undo/undo_0024_world_turnin_poi_uimap_198.sql):
--   DELETE FROM quest_poi WHERE QuestID IN (90702,91564,91696,92100,93127,93444,93521,93547,93615,94348,94360,94479,95379,96296,96959,96983,96998,97001) AND VerifiedBuild=70124;
--   DELETE FROM quest_poi_points WHERE QuestID IN (90702,91564,91696,92100,93127,93444,93521,93547,93615,94348,94360,94479,95379,96296,96959,96983,96998,97001) AND VerifiedBuild=70124;
