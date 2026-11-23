-- undo_0026_world_turnin_poi_tirisfal_glades.sql - rolls back the rows added by 0026_world_turnin_poi_tirisfal_glades.sql
-- World database. Worldserver restart required.

DELETE FROM quest_poi WHERE QuestID IN (96895,96897,96898,96899,96997,97183,97184,97951,97952,97954,97958,97959,97960,99142,99208,99211) AND VerifiedBuild=70124;
DELETE FROM quest_poi_points WHERE QuestID IN (96895,96897,96898,96899,96997,97183,97184,97951,97952,97954,97958,97959,97960,99142,99208,99211) AND VerifiedBuild=70124;
