-- 0029_world_turnin_poi_orgrimmar.sql: hand-in ('?') map markers for 5 custom quests, orgrimmar (UiMapID 1454).
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
--   95483  Thrall Needs to Know  (sort 16620, sibling)
--   97411  An Earnest Proposition  (sort 1637, near 12)
--   97412  Just Compensation  (sort 1637, near 12)
--   98891  Conflict at Darkspear Islands  (sort 16606, near 14, markers in uimap 1412,1416,1417,1420,1440)
--   98891  Conflict at Darkspear Islands  (sort 16606, near 21, markers in uimap 1412,1416,1417,1420,1440)
--   98891  Conflict at Darkspear Islands  (sort 16606, near 23, markers in uimap 1412,1416,1417,1420,1440)
--   98891  Conflict at Darkspear Islands  (sort 16606, sibling, markers in uimap 1412,1416,1417,1420,1440)
--   98893  Conflict at Darkspear Islands  (sort 16606, near 14, markers in uimap 1412,1416,1417,1420,1440)
--   98893  Conflict at Darkspear Islands  (sort 16606, near 21, markers in uimap 1412,1416,1417,1420,1440)
--   98893  Conflict at Darkspear Islands  (sort 16606, near 23, markers in uimap 1412,1416,1417,1420,1440)
--   98893  Conflict at Darkspear Islands  (sort 16606, sibling, markers in uimap 1412,1416,1417,1420,1440)
--
-- Worldserver restart required (quest POI data loads at startup).

INSERT IGNORE INTO quest_poi (QuestID,BlobIndex,Idx1,ObjectiveIndex,QuestObjectiveID,QuestObjectID,MapID,UiMapID,Priority,Flags,WorldEffectID,PlayerConditionID,NavigationPlayerConditionID,SpawnTrackingID,AlwaysAllowMergingBlobs,VerifiedBuild) VALUES
(95483,0,0,-1,0,0,1,1454,0,0,0,0,0,0,0,70124),
(97411,0,0,-1,0,0,1,1454,0,0,0,0,0,0,0,70124),
(97412,0,0,-1,0,0,1,1454,0,0,0,0,0,0,0,70124),
(98891,0,0,-1,0,0,1,1454,0,0,0,0,0,0,0,70124),
(98891,1,1,-1,0,0,1,1412,0,0,0,0,0,0,0,70124),
(98891,2,2,-1,0,0,0,1420,0,0,0,0,0,0,0,70124),
(98891,3,3,-1,0,0,0,1417,0,0,0,0,0,0,0,70124),
(98891,4,4,-1,0,0,0,1416,0,0,0,0,0,0,0,70124),
(98891,5,5,-1,0,0,1,1440,0,0,0,0,0,0,0,70124),
(98893,0,0,-1,0,0,1,1454,0,0,0,0,0,0,0,70124),
(98893,1,1,-1,0,0,1,1412,0,0,0,0,0,0,0,70124),
(98893,2,2,-1,0,0,0,1420,0,0,0,0,0,0,0,70124),
(98893,3,3,-1,0,0,0,1417,0,0,0,0,0,0,0,70124),
(98893,4,4,-1,0,0,0,1416,0,0,0,0,0,0,0,70124),
(98893,5,5,-1,0,0,1,1440,0,0,0,0,0,0,0,70124);

INSERT IGNORE INTO quest_poi_points (QuestID,Idx1,Idx2,X,Y,Z,VerifiedBuild) VALUES
(95483,0,0,1920,-4126,43,70124),
(97411,0,0,1936,-4148,41,70124),
(97412,0,0,1936,-4148,41,70124),
(98891,0,0,1988,-4812,57,70124),
(98891,1,0,-1381,-87,160,70124),
(98891,2,0,1251,314,-64,70124),
(98891,3,0,-832,-3513,72,70124),
(98891,4,0,382,-983,110,70124),
(98891,5,0,1026,-2111,123,70124),
(98893,0,0,1988,-4812,57,70124),
(98893,1,0,-1381,-87,160,70124),
(98893,2,0,1251,314,-64,70124),
(98893,3,0,-832,-3513,72,70124),
(98893,4,0,382,-983,110,70124),
(98893,5,0,1026,-2111,123,70124);

-- Undo (also ready-to-run in undo/undo_0029_world_turnin_poi_orgrimmar.sql):
--   DELETE FROM quest_poi WHERE QuestID IN (95483,97411,97412,98891,98893) AND VerifiedBuild=70124;
--   DELETE FROM quest_poi_points WHERE QuestID IN (95483,97411,97412,98891,98893) AND VerifiedBuild=70124;
