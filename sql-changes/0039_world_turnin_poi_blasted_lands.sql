-- 0039_world_turnin_poi_blasted_lands.sql: hand-in ('?') map markers for 10 custom quests, blasted lands (UiMapID 1419).
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
--   94317  Craftsman's Writ: Dreamless Sleep Potion  (sort 16941, sibling)
--   94319  Craftsman's Writ: Draught of Detect Demon  (sort 16941, near 495)
--   94326  Craftsman's Writ: Radiant Belt  (sort 16941, sibling)
--   94328  Craftsman's Writ: Mithril Spurs  (sort 16941, near 522)
--   94335  Craftsman's Writ: Green Lens  (sort 16941, sibling)
--   94346  Craftsman's Writ: Runic Leather Headband  (sort 16941, near 495)
--   94353  Craftsman's Writ: Runecloth Bag  (sort 16941, sibling)
--   94355  Craftsman's Writ: Tuxedo Jacket  (sort 16941, near 495)
--   96799  A Heavy Responsibility  (sort 4, near 107)
--   96812  Thicker Than Water  (sort 16560, near 14)
--
-- Worldserver restart required (quest POI data loads at startup).

INSERT IGNORE INTO quest_poi (QuestID,BlobIndex,Idx1,ObjectiveIndex,QuestObjectiveID,QuestObjectID,MapID,UiMapID,Priority,Flags,WorldEffectID,PlayerConditionID,NavigationPlayerConditionID,SpawnTrackingID,AlwaysAllowMergingBlobs,VerifiedBuild) VALUES
(94317,0,0,-1,0,0,0,1419,0,0,0,0,0,0,0,70124),
(94319,0,0,-1,0,0,0,1419,0,0,0,0,0,0,0,70124),
(94326,0,0,-1,0,0,0,1419,0,0,0,0,0,0,0,70124),
(94328,0,0,-1,0,0,0,1419,0,0,0,0,0,0,0,70124),
(94335,0,0,-1,0,0,0,1419,0,0,0,0,0,0,0,70124),
(94346,0,0,-1,0,0,0,1419,0,0,0,0,0,0,0,70124),
(94353,0,0,-1,0,0,0,1419,0,0,0,0,0,0,0,70124),
(94355,0,0,-1,0,0,0,1419,0,0,0,0,0,0,0,70124),
(96799,0,0,-1,0,0,0,1419,0,0,0,0,0,0,0,70124),
(96812,0,0,-1,0,0,0,1416,0,0,0,0,0,0,0,70124);

INSERT IGNORE INTO quest_poi_points (QuestID,Idx1,Idx2,X,Y,Z,VerifiedBuild) VALUES
(94317,0,0,-11363,-2983,1,70124),
(94319,0,0,-11117,-2013,13,70124),
(94326,0,0,-11363,-2983,1,70124),
(94328,0,0,-11003,-2033,41,70124),
(94335,0,0,-11363,-2983,1,70124),
(94346,0,0,-11117,-2013,13,70124),
(94353,0,0,-11363,-2983,1,70124),
(94355,0,0,-11117,-2013,13,70124),
(96799,0,0,-10910,-3425,91,70124),
(96812,0,0,134,178,90,70124);

-- Undo (also ready-to-run in undo/undo_0039_world_turnin_poi_blasted_lands.sql):
--   DELETE FROM quest_poi WHERE QuestID IN (94317,94319,94326,94328,94335,94346,94353,94355,96799,96812) AND VerifiedBuild=70124;
--   DELETE FROM quest_poi_points WHERE QuestID IN (94317,94319,94326,94328,94335,94346,94353,94355,96799,96812) AND VerifiedBuild=70124;
