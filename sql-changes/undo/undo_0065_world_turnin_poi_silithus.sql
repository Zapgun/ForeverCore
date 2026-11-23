-- undo_0065_world_turnin_poi_silithus.sql - rolls back the rows added by 0065_world_turnin_poi_silithus.sql
-- World database. Worldserver restart required.

DELETE FROM quest_poi WHERE QuestID IN (94340,94358) AND VerifiedBuild=70124;
DELETE FROM quest_poi_points WHERE QuestID IN (94340,94358) AND VerifiedBuild=70124;
