-- 0069_auth_veteran_adventurer_appearances.sql
-- AUTH database  (apply with: mysql ... auth < this file)
--
-- Grants the "Veteran Adventurer" bundle to battlenet account 138 (Tagrin's account):
--   * TransmogSet 5914 "Veteran Adventurer's Outdoor Wear" (9 pieces)
--   * Back piece NOT in the set: item 280623 "Veteran Adventurer's Rucksack" (IMA 311559)
--   * Mount: item 280611 teaches spell 1309405 = Mount.db2 3130 (SPELL_AURA_MOUNTED, creature 271863)
--
-- (Item 279182 "Ensemble: Veteran Adventurer's Outdoor Wear" casts spell 1306128 =
-- SPELL_EFFECT_LEARN_TRANSMOG_SET(5914) + QUEST_COMPLETE(97984 tracking quest, client-side only)
-- — its effect is covered entirely by the appearance rows below.)
--
-- How it works:
--   battlenet_item_appearances stores a bitset of ItemModifiedAppearanceEntry.IDs as 32-bit
--   blocks: blobIndex = ItemModifiedAppearanceID / 32, bit = ID % 32.
--   TransmogSetItem rows for set 5914 map to IMA IDs 310897-310905 (items 279173-279181:
--   Belt/Boots/Bracer/Chestpiece/Cloak/Gloves/Hood/Legguards/Shoulderpads).
--   All 9 IDs fall in block 9715 (9715*32 = 310880) at bits 17-25 -> mask 0x03FE0000 = 66977792.
--
--   Also grants the set's back piece that is NOT in TransmogSetItem: item 280623
--   "Veteran Adventurer's Rucksack" -> IMA 311559 -> block 9736, bit 7 -> mask 128.
--   Mount is a battlenet_account_mounts row (mountSpellId 1309405).
--
-- No backup needed: none of these rows existed before this patch (verified). Undo below removes them.

INSERT INTO battlenet_item_appearances (battlenetAccountId, blobIndex, appearanceMask)
VALUES (138, 9715, 66977792)
ON DUPLICATE KEY UPDATE appearanceMask = appearanceMask | 66977792;

INSERT INTO battlenet_item_appearances (battlenetAccountId, blobIndex, appearanceMask)
VALUES (138, 9736, 128)
ON DUPLICATE KEY UPDATE appearanceMask = appearanceMask | 128;

INSERT IGNORE INTO battlenet_account_mounts (battlenetAccountId, mountSpellId, flags)
VALUES (138, 1309405, 0);

-- Undo:
-- DELETE FROM battlenet_item_appearances WHERE battlenetAccountId = 138 AND blobIndex IN (9715, 9736);
-- DELETE FROM battlenet_account_mounts WHERE battlenetAccountId = 138 AND mountSpellId = 1309405;
-- (If the account later earns other appearances in those blocks, use:
--  UPDATE battlenet_item_appearances SET appearanceMask = appearanceMask & ~66977792
--  WHERE battlenetAccountId = 138 AND blobIndex = 9715;
--  UPDATE battlenet_item_appearances SET appearanceMask = appearanceMask & ~128
--  WHERE battlenetAccountId = 138 AND blobIndex = 9736;)
--
-- No worldserver restart needed — appearances load at character login. Relog to see the set.
