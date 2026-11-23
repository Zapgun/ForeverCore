-- 0021_world_turnin_poi_dun_morogh.sql: hand-in ('?') map markers for 26 custom quests, dun morogh (UiMapID 1426).
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
--   94449  Call of Fire  (sort -82, near 145)
--   94465  Call of Fire  (sort -82, sibling)
--   94472  Earth Sapta  (sort -82, sibling)
--   94494  Call of Water  (sort -82, sibling)
--   94776  Divine Grace  (sort -262, sibling)
--   94778  Divine Grace  (sort -262, sibling)
--   94817  Confounding Flash  (sort -262, sibling)
--   94818  Contingency Plan  (sort -262, sibling)
--   96031  Camping 101: Leatherworking  (sort -666, near 35)
--   96044  Camping 101: Blacksmithing  (sort -666, near 11, markers in uimap 27)
--   96044  Camping 101: Blacksmithing  (sort -666, sibling, markers in uimap 27)
--   96045  Camping 101: Alchemy  (sort -666, near 37)
--   96046  Camping 101: Mining  (sort -666, near 45)
--   96047  Camping 101: First Aid  (sort -666, near 55, markers in uimap 27,1455)
--   96047  Camping 101: First Aid  (sort -666, near 9, markers in uimap 27,1455)
--   96050  Camping 101: Fishing  (sort -666, near 113)
--   96055  Camping 101: Herbalism  (sort -666, near 60)
--   96056  Camping 101: Skinning  (sort -666, near 26)
--   96057  Camping 101: Tailoring  (sort -666, near 20)
--   96058  Camping 101: Engineering  (sort -666, near 44)
--   96408  A Visitor to Dun Morogh  (sort 1, near 55)
--   96629  Camping 101: Cooking  (sort -666, near 11)
--   98323  Secure the Mountain  (sort 1, sibling)
--   98574  Hallowed Memorandum  (sort -262, sibling)
--   99159  Finding Warmth  (sort 1, sibling)
--   99160  Rime's Wrath  (sort 1, sibling)
--   99161  Rime's Wrath  (sort 1, sibling)
--   99210  An Epic Ride  (sort 1, sibling)
--
-- Worldserver restart required (quest POI data loads at startup).

INSERT IGNORE INTO quest_poi (QuestID,BlobIndex,Idx1,ObjectiveIndex,QuestObjectiveID,QuestObjectID,MapID,UiMapID,Priority,Flags,WorldEffectID,PlayerConditionID,NavigationPlayerConditionID,SpawnTrackingID,AlwaysAllowMergingBlobs,VerifiedBuild) VALUES
(94449,0,0,-1,0,0,0,1426,0,0,0,0,0,0,0,70124),
(94465,0,0,-1,0,0,0,1432,0,0,0,0,0,0,0,70124),
(94472,0,0,-1,0,0,0,1426,0,0,0,0,0,0,0,70124),
(94494,0,0,-1,0,0,0,1432,0,0,0,0,0,0,0,70124),
(94776,0,0,-1,0,0,0,1429,0,0,0,0,0,0,0,70124),
(94778,0,0,-1,0,0,0,1429,0,0,0,0,0,0,0,70124),
(94817,0,0,-1,0,0,0,1426,0,0,0,0,0,0,0,70124),
(94818,0,0,-1,0,0,0,1426,0,0,0,0,0,0,0,70124),
(96031,0,0,-1,0,0,0,1426,0,0,0,0,0,0,0,70124),
(96044,0,0,-1,0,0,0,1426,0,0,0,0,0,0,0,70124),
(96044,1,1,-1,0,0,0,27,0,0,0,0,0,0,0,70124),
(96045,0,0,-1,0,0,0,1426,0,0,0,0,0,0,0,70124),
(96046,0,0,-1,0,0,0,1426,0,0,0,0,0,0,0,70124),
(96047,0,0,-1,0,0,0,27,0,0,0,0,0,0,0,70124),
(96047,1,1,-1,0,0,0,1455,0,0,0,0,0,0,0,70124),
(96050,0,0,-1,0,0,0,1426,0,0,0,0,0,0,0,70124),
(96055,0,0,-1,0,0,0,1455,0,0,0,0,0,0,0,70124),
(96056,0,0,-1,0,0,0,1426,0,0,0,0,0,0,0,70124),
(96057,0,0,-1,0,0,0,1426,0,0,0,0,0,0,0,70124),
(96058,0,0,-1,0,0,0,1426,0,0,0,0,0,0,0,70124),
(96408,0,0,-1,0,0,0,27,0,0,0,0,0,0,0,70124),
(96629,0,0,-1,0,0,0,1426,0,0,0,0,0,0,0,70124),
(98323,0,0,-1,0,0,0,1426,0,0,0,0,0,0,0,70124),
(98574,0,0,-1,0,0,0,1426,0,0,0,0,0,0,0,70124),
(99159,0,0,-1,0,0,0,1426,0,0,0,0,0,0,0,70124),
(99160,0,0,-1,0,0,0,1426,0,0,0,0,0,0,0,70124),
(99161,0,0,-1,0,0,0,1426,0,0,0,0,0,0,0,70124),
(99210,0,0,-1,0,0,0,1426,0,0,0,0,0,0,0,70124);

INSERT IGNORE INTO quest_poi_points (QuestID,Idx1,Idx2,X,Y,Z,VerifiedBuild) VALUES
(94449,0,0,-5309,-2512,485,70124),
(94465,0,0,-5702,-2876,457,70124),
(94472,0,0,-6050,384,399,70124),
(94494,0,0,-4837,-3147,300,70124),
(94776,0,0,-8512,862,110,70124),
(94778,0,0,-8512,862,110,70124),
(94817,0,0,-4622,-910,501,70124),
(94818,0,0,-4622,-910,501,70124),
(96031,0,0,-4743,-1020,505,70124),
(96044,0,0,-5582,-431,397,70124),
(96044,1,0,-4791,-1127,499,70124),
(96045,0,0,-4863,-1238,502,70124),
(96046,0,0,-5529,-661,393,70124),
(96047,0,0,-5604,-521,400,70124),
(96047,1,0,-4877,-1149,513,70124),
(96050,0,0,-5198,55,386,70124),
(96055,0,0,-4881,-1156,506,70124),
(96056,0,0,-4741,-1029,505,70124),
(96057,0,0,-4716,-1060,504,70124),
(96058,0,0,-5531,-669,393,70124),
(96408,0,0,-5795,-1389,441,70124),
(96629,0,0,-5594,-546,399,70124),
(98323,0,0,-5644,-499,397,70124),
(98574,0,0,-6057,394,393,70124),
(99159,0,0,-5351,-1041,395,70124),
(99160,0,0,-5351,-1041,395,70124),
(99161,0,0,-5351,-1041,395,70124),
(99210,0,0,-5537,-1324,399,70124);

-- Undo (also ready-to-run in undo/undo_0021_world_turnin_poi_dun_morogh.sql):
--   DELETE FROM quest_poi WHERE QuestID IN (94449,94465,94472,94494,94776,94778,94817,94818,96031,96044,96045,96046,96047,96050,96055,96056,96057,96058,96408,96629,98323,98574,99159,99160,99161,99210) AND VerifiedBuild=70124;
--   DELETE FROM quest_poi_points WHERE QuestID IN (94449,94465,94472,94494,94776,94778,94817,94818,96031,96044,96045,96046,96047,96050,96055,96056,96057,96058,96408,96629,98323,98574,99159,99160,99161,99210) AND VerifiedBuild=70124;
