-- 0051_world_turnin_poi_teldrassil.sql: hand-in ('?') map markers for 6 custom quests, teldrassil (UiMapID 1438).
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
--   94775  Divine Grace  (sort -262, sibling)
--   94820  Contingency Plan  (sort -262, sibling)
--   94823  Confounding Flash  (sort -262, sibling)
--   97950  Camping 101: Tailoring  (sort -666, near 10)
--   99205  Swift as the Wind  (sort 1657, sibling)
--   99214  An Epic Ride  (sort 1657, sibling)
--
-- Worldserver restart required (quest POI data loads at startup).

INSERT IGNORE INTO quest_poi (QuestID,BlobIndex,Idx1,ObjectiveIndex,QuestObjectiveID,QuestObjectID,MapID,UiMapID,Priority,Flags,WorldEffectID,PlayerConditionID,NavigationPlayerConditionID,SpawnTrackingID,AlwaysAllowMergingBlobs,VerifiedBuild) VALUES
(94775,0,0,-1,0,0,0,1429,0,0,0,0,0,0,0,70124),
(94820,0,0,-1,0,0,0,1426,0,0,0,0,0,0,0,70124),
(94823,0,0,-1,0,0,0,1426,0,0,0,0,0,0,0,70124),
(97950,0,0,-1,0,0,1,1438,0,0,0,0,0,0,0,70124),
(99205,0,0,-1,0,0,1,1438,0,0,0,0,0,0,0,70124),
(99214,0,0,-1,0,0,1,1438,0,0,0,0,0,0,0,70124);

INSERT IGNORE INTO quest_poi_points (QuestID,Idx1,Idx2,X,Y,Z,VerifiedBuild) VALUES
(94775,0,0,-8512,862,110,70124),
(94820,0,0,-4622,-910,501,70124),
(94823,0,0,-4622,-910,501,70124),
(97950,0,0,10089,2266,1333,70124),
(99205,0,0,10130,2533,1323,70124),
(99214,0,0,10130,2533,1323,70124);

-- Undo (also ready-to-run in undo/undo_0051_world_turnin_poi_teldrassil.sql):
--   DELETE FROM quest_poi WHERE QuestID IN (94775,94820,94823,97950,99205,99214) AND VerifiedBuild=70124;
--   DELETE FROM quest_poi_points WHERE QuestID IN (94775,94820,94823,97950,99205,99214) AND VerifiedBuild=70124;
