-- undo_0030_world_turnin_poi_dustwallow_marsh.sql - rolls back the rows added by 0030_world_turnin_poi_dustwallow_marsh.sql
-- World database. Worldserver restart required.

DELETE FROM quest_poi WHERE QuestID IN (94258,94270,94282,94294,94306,95196,95198,95264,95284,95285,96332,96334,96381,98166) AND VerifiedBuild=70124;
DELETE FROM quest_poi_points WHERE QuestID IN (94258,94270,94282,94294,94306,95196,95198,95264,95284,95285,96332,96334,96381,98166) AND VerifiedBuild=70124;
