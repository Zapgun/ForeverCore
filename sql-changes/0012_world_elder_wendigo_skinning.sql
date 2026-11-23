-- World DB. Elder Wendigo (271530) and Wendigo Shaman (271486) have no skinning table:
-- creature_template_difficulty.SkinLootID = 0 and no skinning_loot_template rows, so the
-- client never shows the skinning cursor. Baseline wendigos (1134/1135) and the named
-- mobs (Edan the Howler 1137, Vagash 1388) all have SkinLootID = own entry plus a table.
--
-- Fix: set SkinLootID = own entry on both and copy the Wendigo (1135) skinning table
-- (Light Leather ~39% / Ruined Leather Scraps ~61%) so each stays independently tunable.
-- Elder Wendigo has 11 live spawns; Wendigo Shaman currently has none but the template
-- is fixed so it's correct if spawned later.
--
-- Safe to run again (UPDATE idempotent; INSERTs guarded by NOT EXISTS).
CREATE TABLE IF NOT EXISTS bak_0012_ctd AS SELECT * FROM creature_template_difficulty WHERE Entry IN (271486,271530);
CREATE TABLE IF NOT EXISTS bak_0012_skinning AS SELECT * FROM skinning_loot_template WHERE Entry IN (271486,271530);
START TRANSACTION;
UPDATE `creature_template_difficulty` SET `SkinLootID`=`Entry` WHERE `Entry` IN (271486,271530) AND `DifficultyID`=0;
INSERT INTO `skinning_loot_template`
  (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`)
SELECT d.dst, src.`ItemType`, src.`Item`, src.`Chance`, src.`QuestRequired`, src.`LootMode`, src.`GroupId`, src.`MinCount`, src.`MaxCount`,
       'Copied from Wendigo 1135 (patch 0012)'
FROM `skinning_loot_template` src
JOIN (SELECT 271486 AS dst UNION SELECT 271530) d
WHERE src.`Entry`=1135
  AND NOT EXISTS (SELECT 1 FROM `skinning_loot_template` t WHERE t.`Entry`=d.dst AND t.`Item`=src.`Item`);
COMMIT;
-- Undo: DELETE FROM `skinning_loot_template` WHERE `Entry` IN (271486,271530);
--       UPDATE `creature_template_difficulty` SET `SkinLootID`=0 WHERE `Entry` IN (271486,271530);
