-- 0057_world_turnin_poi_uimap_27.sql: hand-in ('?') map markers for 4 custom quests, uimap 27 (UiMapID 27).
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
--   96390  Nip 'Em in the Bud  (sort 1, near 55)
--   96391  Underground Map  (sort 1, near 55)
--   96392  Farsen's Watch  (sort 1, near 55)
--   96393  Old Ironforge Incursion  (sort 16919, sibling)
--
-- Worldserver restart required (quest POI data loads at startup).

INSERT IGNORE INTO quest_poi (QuestID,BlobIndex,Idx1,ObjectiveIndex,QuestObjectiveID,QuestObjectID,MapID,UiMapID,Priority,Flags,WorldEffectID,PlayerConditionID,NavigationPlayerConditionID,SpawnTrackingID,AlwaysAllowMergingBlobs,VerifiedBuild) VALUES
(96390,0,0,-1,0,0,0,27,0,0,0,0,0,0,0,70124),
(96391,0,0,-1,0,0,0,27,0,0,0,0,0,0,0,70124),
(96392,0,0,-1,0,0,0,27,0,0,0,0,0,0,0,70124),
(96393,0,0,-1,0,0,0,1426,0,0,0,0,0,0,0,70124);

INSERT IGNORE INTO quest_poi_points (QuestID,Idx1,Idx2,X,Y,Z,VerifiedBuild) VALUES
(96390,0,0,-5795,-1389,441,70124),
(96391,0,0,-5795,-1389,441,70124),
(96392,0,0,-5795,-1389,441,70124),
(96393,0,0,-4866,-1023,506,70124);

-- Undo (also ready-to-run in undo/undo_0057_world_turnin_poi_uimap_27.sql):
--   DELETE FROM quest_poi WHERE QuestID IN (96390,96391,96392,96393) AND VerifiedBuild=70124;
--   DELETE FROM quest_poi_points WHERE QuestID IN (96390,96391,96392,96393) AND VerifiedBuild=70124;
