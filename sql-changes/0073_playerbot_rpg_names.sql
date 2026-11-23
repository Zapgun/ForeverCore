-- 0073_playerbot_rpg_names.sql
-- PLAYERBOT shared database (the schema Playerbot.SharedDatabase names —
-- "playerbot" in the shipped configs; "wowc_playerbot" on Forever installs).
-- Apply with: mysql ... <your shared playerbot db> < this file
--
-- Race/sex-appropriate names for V2 bot characters (the "RPG names" feature,
-- code side in patches/0002_bot_rpg_names.patch):
--
--   playerbots_race_names    curated lore first names, consumed like the
--                            playerbots_names pool (is_used / used_by_guid);
--                            `race` gates which race may draw the name
--                            (0 = any race). First names stay unique
--                            server-wide — only eligibility is per-race.
--   playerbots_surnames      whole surnames, race-keyed (0 = any race),
--                            gender like the name pools. Reusable — never
--                            consumed; last names repeat freely.
--   playerbots_surname_parts combinable halves (half 0 = prefix, 1 = suffix)
--                            for generated compound surnames
--                            ("Hammer"+"fist", "Star"+"brook").
--
-- `race` is the ChrRaces id (1 Human, 2 Orc, 3 Dwarf, 4 NightElf, 5 Undead,
-- 6 Tauren, 7 Gnome, 8 Troll, 95 Skyborne-A, 96 Skyborne-H). A plain column,
-- not a bitmask: 32 bits can't hold races > 32.
--
-- No bak_ tables: this file only CREATES new tables and INSERT IGNOREs into
-- them; nothing existing is changed or removed.
-- Idempotent and safe to re-run. Restart worldserver afterwards (the pools
-- load once at boot, Fleet/BotNamePool.cpp).
--
-- Undo: run sql-changes/undo/undo_0073_playerbot_rpg_names.sql

CREATE TABLE IF NOT EXISTS `playerbots_race_names` (
  `name_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `race` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'ChrRaces id; 0 = any race',
  `gender` tinyint unsigned NOT NULL DEFAULT '2' COMMENT '0=male, 1=female, 2=neutral',
  `is_used` tinyint(1) NOT NULL DEFAULT '0',
  `used_by_guid` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`name_id`),
  UNIQUE KEY `idx_unique_name` (`name`),
  KEY `idx_available` (`is_used`,`race`,`gender`),
  KEY `idx_used` (`is_used`,`used_by_guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `playerbots_surnames` (
  `surname_id` int unsigned NOT NULL AUTO_INCREMENT,
  `surname` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `race` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'ChrRaces id; 0 = any race',
  `gender` tinyint unsigned NOT NULL DEFAULT '2' COMMENT '0=male, 1=female, 2=neutral',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`surname_id`),
  UNIQUE KEY `uk_surname_race` (`surname`,`race`),
  KEY `idx_race` (`race`,`gender`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `playerbots_surname_parts` (
  `part_id` int unsigned NOT NULL AUTO_INCREMENT,
  `part` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `half` tinyint unsigned NOT NULL COMMENT '0=prefix, 1=suffix',
  `race` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'ChrRaces id; 0 = any race',
  PRIMARY KEY (`part_id`),
  UNIQUE KEY `uk_part` (`part`,`half`,`race`),
  KEY `idx_race` (`race`,`half`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Seed data is generated per race/sex in sql-changes/namegen/ and merged into
-- 0074_playerbot_rpg_names_data.sql by sql-changes/namegen/merge.py.
