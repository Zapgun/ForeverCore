-- 0041_world_turnin_poi_ashenvale.sql: hand-in ('?') map markers for 9 custom quests, ashenvale (UiMapID 1440).
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
--   94213  Craftsman's Writ: Lesser Mana Potion  (sort 16941, near 1)
--   94222  Craftsman's Writ: Iridescent Hammer  (sort 16941, near 23)
--   94231  Craftsman's Writ: Moonsight Rifle  (sort 16941, near 24)
--   94240  Craftsman's Writ: Herbalist's Gloves  (sort 16941, near 36)
--   94249  Craftsman's Writ: Azure Silk Hood  (sort 16941, near 23)
--   98027  Gleaming Crescent Necklace  (sort 331, near 15)
--   98251  Never Coming Back  (sort 1638, near 313)
--   98417  Vengeful Trail  (sort 331, near 68)
--   98418  Shared Fury  (sort 331, near 68)
--
-- Worldserver restart required (quest POI data loads at startup).

INSERT IGNORE INTO quest_poi (QuestID,BlobIndex,Idx1,ObjectiveIndex,QuestObjectiveID,QuestObjectID,MapID,UiMapID,Priority,Flags,WorldEffectID,PlayerConditionID,NavigationPlayerConditionID,SpawnTrackingID,AlwaysAllowMergingBlobs,VerifiedBuild) VALUES
(94213,0,0,-1,0,0,1,1440,0,0,0,0,0,0,0,70124),
(94222,0,0,-1,0,0,1,1440,0,0,0,0,0,0,0,70124),
(94231,0,0,-1,0,0,1,1440,0,0,0,0,0,0,0,70124),
(94240,0,0,-1,0,0,1,1440,0,0,0,0,0,0,0,70124),
(94249,0,0,-1,0,0,1,1440,0,0,0,0,0,0,0,70124),
(98027,0,0,-1,0,0,1,1440,0,0,0,0,0,0,0,70124),
(98251,0,0,-1,0,0,1,1440,0,0,0,0,0,0,0,70124),
(98417,0,0,-1,0,0,1,1440,0,0,0,0,0,0,0,70124),
(98418,0,0,-1,0,0,1,1440,0,0,0,0,0,0,0,70124);

INSERT IGNORE INTO quest_poi_points (QuestID,Idx1,Idx2,X,Y,Z,VerifiedBuild) VALUES
(94213,0,0,1882,-1760,61,70124),
(94222,0,0,2028,-2821,113,70124),
(94231,0,0,2713,-3040,155,70124),
(94240,0,0,1598,-2025,120,70124),
(94249,0,0,2028,-2821,113,70124),
(98027,0,0,2752,-412,112,70124),
(98251,0,0,2313,-630,121,70124),
(98417,0,0,2910,-3274,160,70124),
(98418,0,0,2910,-3274,160,70124);

-- Undo (also ready-to-run in undo/undo_0041_world_turnin_poi_ashenvale.sql):
--   DELETE FROM quest_poi WHERE QuestID IN (94213,94222,94231,94240,94249,98027,98251,98417,98418) AND VerifiedBuild=70124;
--   DELETE FROM quest_poi_points WHERE QuestID IN (94213,94222,94231,94240,94249,98027,98251,98417,98418) AND VerifiedBuild=70124;
