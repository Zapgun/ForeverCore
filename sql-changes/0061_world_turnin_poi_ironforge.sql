-- 0061_world_turnin_poi_ironforge.sql: hand-in ('?') map markers for 3 custom quests, ironforge (UiMapID 1455).
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
--   95924  Panic at the Digsite  (sort 16985, sibling)
--   96059  Camping 101: Enchanting  (sort -666, near 40)
--   96394  The Restless Dead  (sort 16919, near 18)
--
-- Worldserver restart required (quest POI data loads at startup).

INSERT IGNORE INTO quest_poi (QuestID,BlobIndex,Idx1,ObjectiveIndex,QuestObjectiveID,QuestObjectID,MapID,UiMapID,Priority,Flags,WorldEffectID,PlayerConditionID,NavigationPlayerConditionID,SpawnTrackingID,AlwaysAllowMergingBlobs,VerifiedBuild) VALUES
(95924,0,0,-1,0,0,0,1455,0,0,0,0,0,0,0,70124),
(96059,0,0,-1,0,0,0,1455,0,0,0,0,0,0,0,70124),
(96394,1,1,-1,0,0,0,1455,0,0,0,0,0,0,0,70124);

INSERT IGNORE INTO quest_poi_points (QuestID,Idx1,Idx2,X,Y,Z,VerifiedBuild) VALUES
(95924,0,0,-4654,-1282,503,70124),
(96059,0,0,-4809,-1190,506,70124),
(96394,1,0,-4820,-978,465,70124);

-- Undo (also ready-to-run in undo/undo_0061_world_turnin_poi_ironforge.sql):
--   DELETE FROM quest_poi WHERE QuestID IN (95924,96059,96394) AND VerifiedBuild=70124;
--   DELETE FROM quest_poi_points WHERE QuestID IN (95924,96059,96394) AND VerifiedBuild=70124;
