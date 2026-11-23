-- undo_0042_world_turnin_poi_hillsbrad_foothills.sql - rolls back the rows added by 0042_world_turnin_poi_hillsbrad_foothills.sql
-- World database. Worldserver restart required.

DELETE FROM quest_poi WHERE QuestID IN (93680,94215,94224,94233,94242,97179,97180,98059) AND VerifiedBuild=70124;
DELETE FROM quest_poi_points WHERE QuestID IN (93680,94215,94224,94233,94242,97179,97180,98059) AND VerifiedBuild=70124;
