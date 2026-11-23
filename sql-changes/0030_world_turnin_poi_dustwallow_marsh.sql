-- 0030_world_turnin_poi_dustwallow_marsh.sql: hand-in ('?') map markers for 14 custom quests, dustwallow marsh (UiMapID 1445).
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
--   94258  Craftsman's Writ: Lesser Stoneshield Potion  (sort 16941, sibling)
--   94270  Craftsman's Writ: Steel Weapon Chain  (sort 16941, near 149)
--   94282  Craftsman's Writ: Craftsman's Monocle  (sort 16941, near 4)
--   94294  Craftsman's Writ: Dusky Bracers  (sort 16941, near 4)
--   94306  Craftsman's Writ: Crimson Silk Robe  (sort 16941, sibling)
--   95196  Watch Yer Back  (sort 15, near 101)
--   95198  The Return of the King?  (sort 15, near 101)
--   95264  Shaw Needs To Know  (sort 1519, sibling)
--   95284  The Elite of the Elite  (sort 15, near 44)
--   95285  Right Place, Wrong Time  (sort 15, near 44)
--   96332  A Little Payback  (sort 16620, near 44)
--   96334  Blood Red Bandanas  (sort 16620, near 6)
--   96381  A Bit of Wet Work  (sort 16620, near 12)
--   98166  Your First Horse  (sort 11, near 27)
--
-- Worldserver restart required (quest POI data loads at startup).

INSERT IGNORE INTO quest_poi (QuestID,BlobIndex,Idx1,ObjectiveIndex,QuestObjectiveID,QuestObjectID,MapID,UiMapID,Priority,Flags,WorldEffectID,PlayerConditionID,NavigationPlayerConditionID,SpawnTrackingID,AlwaysAllowMergingBlobs,VerifiedBuild) VALUES
(94258,0,0,-1,0,0,1,1445,0,0,0,0,0,0,0,70124),
(94270,0,0,-1,0,0,1,1445,0,0,0,0,0,0,0,70124),
(94282,0,0,-1,0,0,1,1445,0,0,0,0,0,0,0,70124),
(94294,0,0,-1,0,0,1,1445,0,0,0,0,0,0,0,70124),
(94306,0,0,-1,0,0,1,1445,0,0,0,0,0,0,0,70124),
(95196,0,0,-1,0,0,1,1445,0,0,0,0,0,0,0,70124),
(95198,0,0,-1,0,0,1,1445,0,0,0,0,0,0,0,70124),
(95264,0,0,-1,0,0,0,1429,0,0,0,0,0,0,0,70124),
(95284,0,0,-1,0,0,1,1445,0,0,0,0,0,0,0,70124),
(95285,0,0,-1,0,0,1,1445,0,0,0,0,0,0,0,70124),
(96332,0,0,-1,0,0,1,1445,0,0,0,0,0,0,0,70124),
(96334,0,0,-1,0,0,1,85,0,0,0,0,0,0,0,70124),
(96381,0,0,-1,0,0,1,1445,0,0,0,0,0,0,0,70124),
(98166,0,0,-1,0,0,1,1445,0,0,0,0,0,0,0,70124);

INSERT IGNORE INTO quest_poi_points (QuestID,Idx1,Idx2,X,Y,Z,VerifiedBuild) VALUES
(94258,0,0,-3372,-2821,34,70124),
(94270,0,0,-3009,-3127,40,70124),
(94282,0,0,-4010,-3810,38,70124),
(94294,0,0,-4010,-3810,38,70124),
(94306,0,0,-4032,-3393,39,70124),
(95196,0,0,-3517,-4303,6,70124),
(95198,0,0,-3517,-4303,6,70124),
(95264,0,0,-8815,362,110,70124),
(95284,0,0,-2571,-4899,32,70124),
(95285,0,0,-2571,-4899,32,70124),
(96332,0,0,-2571,-4899,32,70124),
(96334,0,0,1906,-4161,41,70124),
(96381,0,0,-3615,-4450,14,70124),
(98166,0,0,-3836,-4398,11,70124);

-- Undo (also ready-to-run in undo/undo_0030_world_turnin_poi_dustwallow_marsh.sql):
--   DELETE FROM quest_poi WHERE QuestID IN (94258,94270,94282,94294,94306,95196,95198,95264,95284,95285,96332,96334,96381,98166) AND VerifiedBuild=70124;
--   DELETE FROM quest_poi_points WHERE QuestID IN (94258,94270,94282,94294,94306,95196,95198,95264,95284,95285,96332,96334,96381,98166) AND VerifiedBuild=70124;
