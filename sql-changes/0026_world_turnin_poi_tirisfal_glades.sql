-- 0026_world_turnin_poi_tirisfal_glades.sql: hand-in ('?') map markers for 16 custom quests, tirisfal glades (UiMapID 1420).
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
--   96895  The Argent Emissary  (sort 85, near 21)
--   96897  The Cult of the Damned  (sort 85, near 21)
--   96898  Remnants of War  (sort 85, near 21)
--   96899  Bandarion Keep  (sort 85, sibling)
--   96997  A Steed in Death as They Were in Life  (sort 85, near 16)
--   97183  Blessed Arcanite Barding  (sort -141, sibling)
--   97184  The Divination Scryer  (sort -141, sibling)
--   97951  Camping 101: Alchemy  (sort -666, sibling)
--   97952  Camping 101: Blacksmithing  (sort -666, near 35)
--   97954  Camping 101: Engineering  (sort -666, near 82)
--   97958  Camping 101: Leatherworking  (sort -666, sibling)
--   97959  Camping 101: Mining  (sort -666, near 26)
--   97960  Camping 101: Skinning  (sort -666, near 7)
--   99142  Tomb Weed  (sort 85, sibling)
--   99208  Swift as the Wind  (sort 85, near 16)
--   99211  An Epic Ride  (sort 85, near 16)
--
-- Worldserver restart required (quest POI data loads at startup).

INSERT IGNORE INTO quest_poi (QuestID,BlobIndex,Idx1,ObjectiveIndex,QuestObjectiveID,QuestObjectID,MapID,UiMapID,Priority,Flags,WorldEffectID,PlayerConditionID,NavigationPlayerConditionID,SpawnTrackingID,AlwaysAllowMergingBlobs,VerifiedBuild) VALUES
(96895,0,0,-1,0,0,0,1420,0,0,0,0,0,0,0,70124),
(96897,0,0,-1,0,0,0,1420,0,0,0,0,0,0,0,70124),
(96898,0,0,-1,0,0,0,1420,0,0,0,0,0,0,0,70124),
(96899,0,0,-1,0,0,0,1420,0,0,0,0,0,0,0,70124),
(96997,0,0,-1,0,0,0,1420,0,0,0,0,0,0,0,70124),
(97183,0,0,-1,0,0,0,1420,0,0,0,0,0,0,0,70124),
(97184,0,0,-1,0,0,0,1420,0,0,0,0,0,0,0,70124),
(97951,0,0,-1,0,0,0,1420,0,0,0,0,0,0,0,70124),
(97952,0,0,-1,0,0,0,1458,0,0,0,0,0,0,0,70124),
(97954,0,0,-1,0,0,0,1458,0,0,0,0,0,0,0,70124),
(97958,0,0,-1,0,0,0,1420,0,0,0,0,0,0,0,70124),
(97959,0,0,-1,0,0,0,1458,0,0,0,0,0,0,0,70124),
(97960,0,0,-1,0,0,0,1420,0,0,0,0,0,0,0,70124),
(99142,0,0,-1,0,0,0,1420,0,0,0,0,0,0,0,70124),
(99208,0,0,-1,0,0,0,1420,0,0,0,0,0,0,0,70124),
(99211,0,0,-1,0,0,0,1420,0,0,0,0,0,0,0,70124);

INSERT IGNORE INTO quest_poi_points (QuestID,Idx1,Idx2,X,Y,Z,VerifiedBuild) VALUES
(96895,0,0,1996,54,36,70124),
(96897,0,0,1996,54,36,70124),
(96898,0,0,1996,54,36,70124),
(96899,0,0,2486,2038,138,70124),
(96997,0,0,2250,328,37,70124),
(97183,0,0,2492,2035,156,70124),
(97184,0,0,2492,2035,156,70124),
(97951,0,0,2265,348,36,70124),
(97952,0,0,1692,296,-62,70124),
(97954,0,0,1410,150,-62,70124),
(97958,0,0,2026,77,35,70124),
(97959,0,0,1638,336,-62,70124),
(97960,0,0,2029,70,34,70124),
(99142,0,0,2366,438,33,70124),
(99208,0,0,2250,328,37,70124),
(99211,0,0,2250,328,37,70124);

-- Undo (also ready-to-run in undo/undo_0026_world_turnin_poi_tirisfal_glades.sql):
--   DELETE FROM quest_poi WHERE QuestID IN (96895,96897,96898,96899,96997,97183,97184,97951,97952,97954,97958,97959,97960,99142,99208,99211) AND VerifiedBuild=70124;
--   DELETE FROM quest_poi_points WHERE QuestID IN (96895,96897,96898,96899,96997,97183,97184,97951,97952,97954,97958,97959,97960,99142,99208,99211) AND VerifiedBuild=70124;
