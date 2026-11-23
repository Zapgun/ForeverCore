-- 0020_world_turnin_poi_mulgore.sql: hand-in ('?') map markers for 29 custom quests, mulgore (UiMapID 1412).
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
--   93072  Long-Term Solutions  (sort 16651, near 390)
--   93574  Corpsefeeder's Carapace  (sort 16651, near 15)
--   93601  Passing the Blame  (sort 16651, near 15)
--   93606  Not on Squealing Terms  (sort 16651, near 175)
--   95664  Elder Knowledge  (sort 16732, sibling)
--   96241  Talkin' bout Toxins, Mon  (sort 215, near 93)
--   96260  Stronger than Steel  (sort 215, near 117)
--   96261  The Broodmother  (sort 215, sibling)
--   96605  The Great Outdoors  (sort -666, near 95)
--   96659  The Adventurer  (sort -666, near 95)
--   96774  Ancient Gurubashi Idol  (sort 16550, near 93)
--   96775  Zum'rah's Head  (sort 1176, near 93)
--   97932  Camping 101: Fishing  (sort -666, near 98)
--   97937  Camping 101: Tailoring  (sort -666, near 2)
--   98340  The Great Cat Spirit  (sort -263, sibling)
--   98424  Fizsprocket's Notes  (sort 215, sibling)
--   98427  Ceasing Operations  (sort 215, sibling)
--   98435  Thunderhorn's Report  (sort 215, sibling)
--   98477  Unstable Magic  (sort 215, near 6)
--   98517  Call of Fire  (sort -82, near 4)
--   98517  Call of Fire  (sort -82, near 7)
--   98823  Earthen Echo  (sort 16732, sibling)
--   99079  Longwalker Malah  (sort 215, near 7)
--   99081  Grim Tidings  (sort 215, near 17)
--   99082  The High Chieftain  (sort 215, sibling)
--   99101  Our Ancient Enemy  (sort 215, sibling)
--   99196  A Donation of Wool  (sort 215, near 49)
--   99197  A Donation of Silk  (sort 215, near 49)
--   99202  Swift as the Wind  (sort 215, sibling)
--   99217  An Epic Ride  (sort 215, sibling)
--
-- Worldserver restart required (quest POI data loads at startup).

INSERT IGNORE INTO quest_poi (QuestID,BlobIndex,Idx1,ObjectiveIndex,QuestObjectiveID,QuestObjectID,MapID,UiMapID,Priority,Flags,WorldEffectID,PlayerConditionID,NavigationPlayerConditionID,SpawnTrackingID,AlwaysAllowMergingBlobs,VerifiedBuild) VALUES
(93072,0,0,-1,0,0,1,1412,0,0,0,0,0,0,0,70124),
(93574,0,0,-1,0,0,1,1412,0,0,0,0,0,0,0,70124),
(93601,0,0,-1,0,0,1,1412,0,0,0,0,0,0,0,70124),
(93606,0,0,-1,0,0,1,1443,0,0,0,0,0,0,0,70124),
(95664,0,0,-1,0,0,1,1412,0,0,0,0,0,0,0,70124),
(96241,0,0,-1,0,0,1,1412,0,0,0,0,0,0,0,70124),
(96260,0,0,-1,0,0,1,1412,0,0,0,0,0,0,0,70124),
(96261,0,0,-1,0,0,1,1412,0,0,0,0,0,0,0,70124),
(96605,0,0,-1,0,0,1,1412,0,0,0,0,0,0,0,70124),
(96659,0,0,-1,0,0,1,1412,0,0,0,0,0,0,0,70124),
(96774,0,0,-1,0,0,1,1412,0,0,0,0,0,0,0,70124),
(96775,0,0,-1,0,0,1,1412,0,0,0,0,0,0,0,70124),
(97932,0,0,-1,0,0,1,1412,0,0,0,0,0,0,0,70124),
(97937,0,0,-1,0,0,1,1412,0,0,0,0,0,0,0,70124),
(98340,0,0,-1,0,0,1,1450,0,0,0,0,0,0,0,70124),
(98424,0,0,-1,0,0,1,1412,0,0,0,0,0,0,0,70124),
(98427,0,0,-1,0,0,1,1412,0,0,0,0,0,0,0,70124),
(98435,0,0,-1,0,0,1,1456,0,0,0,0,0,0,0,70124),
(98477,0,0,-1,0,0,1,1412,0,0,0,0,0,0,0,70124),
(98517,0,0,-1,0,0,2991,2521,0,0,0,0,0,0,0,70124),
(98517,1,1,-1,0,0,2991,2521,0,0,0,0,0,0,0,70124),
(98823,0,0,-1,0,0,1,1412,0,0,0,0,0,0,0,70124),
(99079,0,0,-1,0,0,1,1412,0,0,0,0,0,0,0,70124),
(99081,0,0,-1,0,0,1,1412,0,0,0,0,0,0,0,70124),
(99082,0,0,-1,0,0,1,1412,0,0,0,0,0,0,0,70124),
(99101,0,0,-1,0,0,1,1412,0,0,0,0,0,0,0,70124),
(99196,0,0,-1,0,0,1,1412,0,0,0,0,0,0,0,70124),
(99197,0,0,-1,0,0,1,1412,0,0,0,0,0,0,0,70124),
(99202,0,0,-1,0,0,1,1412,0,0,0,0,0,0,0,70124),
(99217,0,0,-1,0,0,1,1412,0,0,0,0,0,0,0,70124);

INSERT IGNORE INTO quest_poi_points (QuestID,Idx1,Idx2,X,Y,Z,VerifiedBuild) VALUES
(93072,0,0,-2635,820,76,70124),
(93574,0,0,-2326,534,216,70124),
(93601,0,0,-2326,534,216,70124),
(93606,0,0,-2102,833,192,70124),
(95664,0,0,-1088,-225,159,70124),
(96241,0,0,-581,479,185,70124),
(96260,0,0,-553,481,189,70124),
(96261,0,0,-659,423,187,70124),
(96605,0,0,-2490,-364,-11,70124),
(96659,0,0,-2490,-364,-11,70124),
(96774,0,0,-581,479,185,70124),
(96775,0,0,-581,479,185,70124),
(97932,0,0,-2351,-239,-8,70124),
(97937,0,0,-1159,55,146,70124),
(98340,0,0,8020,-2679,525,70124),
(98424,0,0,-2313,-617,-9,70124),
(98427,0,0,-2313,-617,-9,70124),
(98435,0,0,-1049,-304,159,70124),
(98477,0,0,-662,420,187,70124),
(98517,0,0,2045,988,657,70124),
(98517,1,0,3292,1814,824,70124),
(98823,0,0,-659,423,187,70124),
(99079,0,0,-2325,-1067,-5,70124),
(99081,0,0,-2352,-394,-8,70124),
(99082,0,0,-1210,-113,164,70124),
(99101,0,0,-2334,-393,-8,70124),
(99196,0,0,-654,375,180,70124),
(99197,0,0,-654,375,180,70124),
(99202,0,0,-2280,-392,-9,70124),
(99217,0,0,-2280,-392,-9,70124);

-- Undo (also ready-to-run in undo/undo_0020_world_turnin_poi_mulgore.sql):
--   DELETE FROM quest_poi WHERE QuestID IN (93072,93574,93601,93606,95664,96241,96260,96261,96605,96659,96774,96775,97932,97937,98340,98424,98427,98435,98477,98517,98823,99079,99081,99082,99101,99196,99197,99202,99217) AND VerifiedBuild=70124;
--   DELETE FROM quest_poi_points WHERE QuestID IN (93072,93574,93601,93606,95664,96241,96260,96261,96605,96659,96774,96775,97932,97937,98340,98424,98427,98435,98477,98517,98823,99079,99081,99082,99101,99196,99197,99202,99217) AND VerifiedBuild=70124;
