-- 0016: quests 95212 "Never Saddle on Quality" and 95213/95214 "Stolen
-- Blasting Powder" (Dun Morogh, custom quests) — adds the missing hand-in
-- map markers.
--
-- World database.
--
-- Bug: quest_poi/quest_poi_points had no rows at all for these three quests,
-- so the "?" turn-in icon never appeared on the world map.
--
--   95212 "Never Saddle on Quality"    ends at Veron Amberstill (creature 1261)
--                                        (-5537.03, -1323.67, 399.159)
--   95213 "Stolen Blasting Powder"     ends at Quarrymaster Thesten (creature 1256)
--                                        (-5676.31, -1604.09, 383.388)
--   95214 "Stolen Blasting Powder"     ends at Quarrymaster Thesten (same spot)
--
-- UiMapID 1426 = Dun Morogh (same as quests 287/315/99162). One POI blob per
-- quest: header row (ObjectiveIndex -1) + one point at the turn-in NPC.
-- Note: these quests also have no objective markers (quest_poi rows for
-- Objectives) — item-collection objectives simply show no blob until that
-- data is authored.
--
-- Worldserver restart required (quest POI data loads at startup).

INSERT IGNORE INTO quest_poi (QuestID,BlobIndex,Idx1,ObjectiveIndex,QuestObjectiveID,QuestObjectID,MapID,UiMapID,Priority,Flags,WorldEffectID,PlayerConditionID,NavigationPlayerConditionID,SpawnTrackingID,AlwaysAllowMergingBlobs,VerifiedBuild) VALUES
(95212,0,0,-1,0,0,0,1426,0,0,0,0,0,0,0,70124),
(95213,0,0,-1,0,0,0,1426,0,0,0,0,0,0,0,70124),
(95214,0,0,-1,0,0,0,1426,0,0,0,0,0,0,0,70124);

INSERT IGNORE INTO quest_poi_points (QuestID,Idx1,Idx2,X,Y,Z,VerifiedBuild) VALUES
(95212,0,0,-5537.03,-1323.67,399.159,70124),
(95213,0,0,-5676.31,-1604.09,383.388,70124),
(95214,0,0,-5676.31,-1604.09,383.388,70124);

-- Undo:
--   DELETE FROM quest_poi WHERE QuestID IN (95212,95213,95214) AND VerifiedBuild=70124;
--   DELETE FROM quest_poi_points WHERE QuestID IN (95212,95213,95214) AND VerifiedBuild=70124;
