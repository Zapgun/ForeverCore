-- undo_0074_playerbot_rpg_names_data.sql
-- Removes the seed data loaded by 0074; the tables from 0073 stay in place.
-- Caveat: rows still marked is_used belong to live bots. Removing them is
-- safe for naming (the name row is simply gone, nothing releases or
-- re-acquires it) but the same first name can be re-seeded later without a
-- conflict check, so apply this only on a wiped/deleted fleet.

DELETE FROM `playerbots_race_names`;
DELETE FROM `playerbots_surnames`;
DELETE FROM `playerbots_surname_parts`;
