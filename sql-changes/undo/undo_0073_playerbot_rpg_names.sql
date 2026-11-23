-- undo_0073_playerbot_rpg_names.sql
-- Drops the RPG-name tables created by 0073 (+ the rows 0074 loaded).
-- Bot creation keeps working afterwards: BotNamePool falls back to the
-- generic playerbots_names pool and the syllable generator, and surnames
-- simply come back empty.

DROP TABLE IF EXISTS `playerbots_race_names`;
DROP TABLE IF EXISTS `playerbots_surnames`;
DROP TABLE IF EXISTS `playerbots_surname_parts`;
