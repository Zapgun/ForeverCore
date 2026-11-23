-- 0060_world_turnin_poi_eastern_plaguelands.sql: hand-in ('?') map markers for 3 custom quests, eastern plaguelands (UiMapID 1423).
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
--   94329  Craftsman's Writ: Imperial Plate Chest  (sort 16941, near 29)
--   94347  Craftsman's Writ: Wicked Leather Bracers  (sort 16941, sibling)
--   97186  Manna-Enriched Horse Feed  (sort -141, sibling)
--
-- Worldserver restart required (quest POI data loads at startup).

INSERT IGNORE INTO quest_poi (QuestID,BlobIndex,Idx1,ObjectiveIndex,QuestObjectiveID,QuestObjectID,MapID,UiMapID,Priority,Flags,WorldEffectID,PlayerConditionID,NavigationPlayerConditionID,SpawnTrackingID,AlwaysAllowMergingBlobs,VerifiedBuild) VALUES
(94329,0,0,-1,0,0,0,1423,0,0,0,0,0,0,0,70124),
(94347,0,0,-1,0,0,0,1423,0,0,0,0,0,0,0,70124),
(97186,0,0,-1,0,0,0,1423,0,0,0,0,0,0,0,70124);

INSERT IGNORE INTO quest_poi_points (QuestID,Idx1,Idx2,X,Y,Z,VerifiedBuild) VALUES
(94329,0,0,2442,-4958,63,70124),
(94347,0,0,2251,-5345,87,70124),
(97186,0,0,1871,-3213,125,70124);

-- Undo (also ready-to-run in undo/undo_0060_world_turnin_poi_eastern_plaguelands.sql):
--   DELETE FROM quest_poi WHERE QuestID IN (94329,94347,97186) AND VerifiedBuild=70124;
--   DELETE FROM quest_poi_points WHERE QuestID IN (94329,94347,97186) AND VerifiedBuild=70124;
