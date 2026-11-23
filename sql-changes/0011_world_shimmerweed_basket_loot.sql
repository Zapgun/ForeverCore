-- World DB. Gameobject 276 "Shimmerweed Basket" (loot template 797, VMaNGOS 1.12 import) drops
-- exactly 1 Shimmerweed (item 2676) per basket; the baskets should roll 1-2 per open, matching
-- classic behaviour and the quest's intent (quest 315 "The Perfect Stout" needs 6 from 21
-- spawned baskets in Frostmane Hold).
--
-- Fix: raise the loot row's MaxCount from 1 to 2 so each basket yields a random 1-2.
--
-- Safe to run again (idempotent UPDATE).
CREATE TABLE IF NOT EXISTS bak_0011_gameobject_loot AS SELECT * FROM gameobject_loot_template WHERE Entry=797;
START TRANSACTION;
UPDATE `gameobject_loot_template` SET `MaxCount`=2 WHERE `Entry`=797 AND `Item`=2676;
COMMIT;
-- Undo: UPDATE `gameobject_loot_template` SET `MaxCount`=1 WHERE `Entry`=797 AND `Item`=2676;
