-- undo_0057_world_turnin_poi_uimap_27.sql - rolls back the rows added by 0057_world_turnin_poi_uimap_27.sql
-- World database. Worldserver restart required.

DELETE FROM quest_poi WHERE QuestID IN (96390,96391,96392,96393) AND VerifiedBuild=70124;
DELETE FROM quest_poi_points WHERE QuestID IN (96390,96391,96392,96393) AND VerifiedBuild=70124;
