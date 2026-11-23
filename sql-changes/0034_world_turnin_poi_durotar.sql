-- 0034_world_turnin_poi_durotar.sql: hand-in ('?') map markers for 12 custom quests, durotar (UiMapID 1411).
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
--   96102  Camping 101: Tailoring  (sort -666, near 10)
--   96604  The Great Outdoors  (sort -666, sibling)
--   96876  Ukor's Lost Pack  (sort 14, near 81)
--   96989  Your First Riding Raptor  (sort 14, sibling)
--   97225  Forgotten Loa Idols  (sort 14, sibling)
--   97279  Wayward Weapons  (sort 363, near 20)
--   97281  A Simmering Storm  (sort 14, sibling)
--   97282  Stormy Potential  (sort 14, sibling)
--   98575  Tainted Tablet  (sort -61, sibling)
--   98576  Glyphic Parchment  (sort -161, sibling)
--   99048  A Missing Hand  (sort 14, near 40)
--   99052  Threat from Below  (sort 14, sibling)
--
-- Worldserver restart required (quest POI data loads at startup).

INSERT IGNORE INTO quest_poi (QuestID,BlobIndex,Idx1,ObjectiveIndex,QuestObjectiveID,QuestObjectID,MapID,UiMapID,Priority,Flags,WorldEffectID,PlayerConditionID,NavigationPlayerConditionID,SpawnTrackingID,AlwaysAllowMergingBlobs,VerifiedBuild) VALUES
(96102,0,0,-1,0,0,1,85,0,0,0,0,0,0,0,70124),
(96604,0,0,-1,0,0,1,1411,0,0,0,0,0,0,0,70124),
(96876,0,0,-1,0,0,1,1411,0,0,0,0,0,0,0,70124),
(96989,0,0,-1,0,0,1,1411,0,0,0,0,0,0,0,70124),
(97225,0,0,-1,0,0,1,1411,0,0,0,0,0,0,0,70124),
(97279,0,0,-1,0,0,1,1411,0,0,0,0,0,0,0,70124),
(97281,0,0,-1,0,0,1,1411,0,0,0,0,0,0,0,70124),
(97282,0,0,-1,0,0,1,1411,0,0,0,0,0,0,0,70124),
(98575,0,0,-1,0,0,1,1411,0,0,0,0,0,0,0,70124),
(98576,0,0,-1,0,0,1,1411,0,0,0,0,0,0,0,70124),
(99048,0,0,-1,0,0,1,1,0,0,0,0,0,0,0,70124),
(99052,0,0,-1,0,0,1,1411,0,0,0,0,0,0,0,70124);

INSERT IGNORE INTO quest_poi_points (QuestID,Idx1,Idx2,X,Y,Z,VerifiedBuild) VALUES
(96102,0,0,1813,-4563,23,70124),
(96604,0,0,137,-4712,19,70124),
(96876,0,0,-599,-4715,35,70124),
(96989,0,0,-858,-4883,22,70124),
(97225,0,0,-826,-4921,20,70124),
(97279,0,0,-589,-4102,44,70124),
(97281,0,0,1000,-4414,14,70124),
(97282,0,0,1000,-4414,14,70124),
(98575,0,0,-607,-4112,43,70124),
(98576,0,0,-625,-4210,38,70124),
(99048,0,0,201,-5061,13,70124),
(99052,0,0,287,-4725,13,70124);

-- Undo (also ready-to-run in undo/undo_0034_world_turnin_poi_durotar.sql):
--   DELETE FROM quest_poi WHERE QuestID IN (96102,96604,96876,96989,97225,97279,97281,97282,98575,98576,99048,99052) AND VerifiedBuild=70124;
--   DELETE FROM quest_poi_points WHERE QuestID IN (96102,96604,96876,96989,97225,97279,97281,97282,98575,98576,99048,99052) AND VerifiedBuild=70124;
