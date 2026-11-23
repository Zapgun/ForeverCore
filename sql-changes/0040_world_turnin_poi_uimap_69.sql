-- 0040_world_turnin_poi_uimap_69.sql: hand-in ('?') map markers for 9 custom quests, uimap 69 (UiMapID 69).
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
--   92858  WANTED: Ohk'zi  (sort 357, sibling)
--   93125  Going Home  (sort 16651, sibling)
--   93362  What They've Done to My Peonies  (sort 16651, near 648)
--   93594  Word of the Woods  (sort 16651, near 398)
--   94260  Craftsman's Writ: Catseye Draught  (sort 16941, near 102)
--   94272  Craftsman's Writ: Blue Glittering Axe  (sort 16941, near 102)
--   94284  Craftsman's Writ: Catseye Ultra Goggles  (sort 16941, near 102)
--   94296  Craftsman's Writ: Wild Leather Shoulders  (sort 16941, near 102)
--   99258  Mana Mania  (sort 16651, near 618)
--
-- Worldserver restart required (quest POI data loads at startup).

INSERT IGNORE INTO quest_poi (QuestID,BlobIndex,Idx1,ObjectiveIndex,QuestObjectiveID,QuestObjectID,MapID,UiMapID,Priority,Flags,WorldEffectID,PlayerConditionID,NavigationPlayerConditionID,SpawnTrackingID,AlwaysAllowMergingBlobs,VerifiedBuild) VALUES
(92858,0,0,-1,0,0,1,1444,0,0,0,0,0,0,0,70124),
(93125,0,0,-1,0,0,1,2652,0,0,0,0,0,0,0,70124),
(93362,0,0,-1,0,0,1,69,0,0,0,0,0,0,0,70124),
(93594,0,0,-1,0,0,1,1412,0,0,0,0,0,0,0,70124),
(94260,0,0,-1,0,0,1,69,0,0,0,0,0,0,0,70124),
(94272,0,0,-1,0,0,1,69,0,0,0,0,0,0,0,70124),
(94284,0,0,-1,0,0,1,69,0,0,0,0,0,0,0,70124),
(94296,0,0,-1,0,0,1,69,0,0,0,0,0,0,0,70124),
(99258,0,0,-1,0,0,1,69,0,0,0,0,0,0,0,70124);

INSERT IGNORE INTO quest_poi_points (QuestID,Idx1,Idx2,X,Y,Z,VerifiedBuild) VALUES
(92858,0,0,-4506,3330,14,70124),
(93125,0,0,-2217,1590,60,70124),
(93362,0,0,-2939,943,135,70124),
(93594,0,0,-2881,597,120,70124),
(94260,0,0,-4785,410,14,70124),
(94272,0,0,-4785,410,14,70124),
(94284,0,0,-4785,410,14,70124),
(94296,0,0,-4785,410,14,70124),
(99258,0,0,-2961,1090,148,70124);

-- Undo (also ready-to-run in undo/undo_0040_world_turnin_poi_uimap_69.sql):
--   DELETE FROM quest_poi WHERE QuestID IN (92858,93125,93362,93594,94260,94272,94284,94296,99258) AND VerifiedBuild=70124;
--   DELETE FROM quest_poi_points WHERE QuestID IN (92858,93125,93362,93594,94260,94272,94284,94296,99258) AND VerifiedBuild=70124;
