-- undo_0045_world_turnin_poi_alterac_mountains.sql - rolls back the rows added by 0045_world_turnin_poi_alterac_mountains.sql
-- World database. Worldserver restart required.

DELETE FROM quest_poi WHERE QuestID IN (94004,94238,94251,96772,96986,99191,99192) AND VerifiedBuild=70124;
DELETE FROM quest_poi_points WHERE QuestID IN (94004,94238,94251,96772,96986,99191,99192) AND VerifiedBuild=70124;
