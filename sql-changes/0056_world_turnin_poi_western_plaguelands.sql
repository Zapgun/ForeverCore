-- 0056_world_turnin_poi_western_plaguelands.sql: hand-in ('?') map markers for 4 custom quests, western plaguelands (UiMapID 1422).
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
--   94323  Craftsman's Writ: Major Rejuvenation Potion  (sort 16941, near 46)
--   94341  Craftsman's Writ: Sniper Scope  (sort 16941, near 24)
--   94350  Craftsman's Writ: Runic Leather Bracers  (sort 16941, near 58)
--   94356  Craftsman's Writ: Felcloth Boots  (sort 16941, sibling)
--
-- Worldserver restart required (quest POI data loads at startup).

INSERT IGNORE INTO quest_poi (QuestID,BlobIndex,Idx1,ObjectiveIndex,QuestObjectiveID,QuestObjectID,MapID,UiMapID,Priority,Flags,WorldEffectID,PlayerConditionID,NavigationPlayerConditionID,SpawnTrackingID,AlwaysAllowMergingBlobs,VerifiedBuild) VALUES
(94323,0,0,-1,0,0,0,1422,0,0,0,0,0,0,0,70124),
(94341,0,0,-1,0,0,0,1422,0,0,0,0,0,0,0,70124),
(94350,0,0,-1,0,0,0,1422,0,0,0,0,0,0,0,70124),
(94356,0,0,-1,0,0,0,1422,0,0,0,0,0,0,0,70124);

INSERT IGNORE INTO quest_poi_points (QuestID,Idx1,Idx2,X,Y,Z,VerifiedBuild) VALUES
(94323,0,0,1843,-2145,68,70124),
(94341,0,0,1188,-2396,60,70124),
(94350,0,0,1285,-1217,63,70124),
(94356,0,0,2929,-2745,110,70124);

-- Undo (also ready-to-run in undo/undo_0056_world_turnin_poi_western_plaguelands.sql):
--   DELETE FROM quest_poi WHERE QuestID IN (94323,94341,94350,94356) AND VerifiedBuild=70124;
--   DELETE FROM quest_poi_points WHERE QuestID IN (94323,94341,94350,94356) AND VerifiedBuild=70124;
