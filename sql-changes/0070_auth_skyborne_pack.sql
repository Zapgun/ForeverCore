-- 0070_auth_skyborne_pack.sql
-- AUTH database  (apply with: mysql ... auth < this file)
--
-- Grants every server-side piece of the "Skyborne" store pack to ONE battlenet account.
-- Self-contained and idempotent — safe to re-run, safe to apply to any account.
--
-- TO USE: set @acct to the battlenet_account id (auth.battlenet_accounts.id /
--         auth.account.battlenet_account — NOT the characters.account id unless they match).
--
-- CONTENTS
--   Heroic:  Cerulean Prideclaw mount, Shen'dorei Skyseer's Garb set, Windwell toy,
--            Veteran Adventurer's Rucksack back transmog
--   Epic:    + Veteran Adventurer's Loyal Companion mount, Outdoor Wear set,
--            + Pachimari / Panda Cub / Zergling / Mini Diablo pets
--
-- NOT INCLUDED (needs work, see TODO at bottom):
--   * Lordaeron Forever Tabard (item 280404) and Shen'dorei Tabard (item 280729) —
--     physical items; they can't go in an account collection table, they must be
--     delivered to a character (mail/bags) or earned in-game.
--   * Skyborne race + Zephras Isle — races 95/96, race_unlock_requirement Expansion=0:
--     already unlocked for ALL accounts; no per-purchase gate exists in the core.
--   * Housing decor, WC3, beta access, game time, invite codes — not server content.
--
-- ---------------------------------------------------------------------------

SET @acct := 138;   -- <<< battlenet account id to grant to

-- Mounts ---------------------------------------------------------------------
-- item 280544 -> learn spell 1309208 -> Mount.db2 3111 (Cerulean Prideclaw)
-- item 280611 -> learn spell 1309405 -> Mount.db2 3130 (Veteran Adventurer's Loyal Companion)
INSERT IGNORE INTO battlenet_account_mounts (battlenetAccountId, mountSpellId, flags) VALUES
(@acct, 1309208, 0),
(@acct, 1309405, 0);

-- Transmog appearances -------------------------------------------------------
-- battlenet_item_appearances = 32-bit blocks of ItemModifiedAppearanceEntry.ID:
--   blobIndex = ID / 32, bit = ID % 32
-- TransmogSet 5702 Skyseer's Garb : IMA 307675-307683 -> block 9614 bits 27-31 + block 9615 bits 0-3
-- TransmogSet 5914 Outdoor Wear   : IMA 310897-310905 -> block 9715 bits 17-25
-- Rucksack (not in any set)       : item 280623 -> IMA 311559 -> block 9736 bit 7
INSERT INTO battlenet_item_appearances (battlenetAccountId, blobIndex, appearanceMask) VALUES
(@acct, 9614, 4160749568),
(@acct, 9615, 15),
(@acct, 9715, 66977792),
(@acct, 9736, 128)
ON DUPLICATE KEY UPDATE appearanceMask = appearanceMask | VALUES(appearanceMask);

-- Toy ------------------------------------------------------------------------
-- Shen'dorei Windwell, item 280740 (Toy.db2 1761)
INSERT IGNORE INTO battlenet_account_toys (accountId, itemId, isFavourite, hasFanfare)
VALUES (@acct, 280740, 0, 0);

-- Pets -----------------------------------------------------------------------
-- battle_pets needs a unique guid per pet; the server seeds its generator from
-- MAX(guid), so we take the next 4 free ids. BattlePetBreedState/BreedQuality are
-- empty in this client (no pet battles, companions only) -> breed 3 (B/B default),
-- quality 3 (Rare), level 1, health 100 (fork's fallback MaxHealth), displayIds
-- from creature_template_model. species -> learn item -> summon spell:
--   5138 Pachimari   <- 280614 -> 1309420    5159 Panda Cub   <- 281166 -> 1310331
--   5160 Zergling    <- 281167 -> 1310330    5161 Mini Diablo <- 281168 -> 1310329
SET @petGuid := (SELECT IFNULL(MAX(guid), 0) + 1 FROM battle_pets);
INSERT INTO battle_pets (guid, battlenetAccountId, species, breed, displayId, level, exp, health, quality, flags, name, nameTimestamp, owner, ownerRealmId)
SELECT @petGuid,     @acct, 5138, 3, 146839, 1, 0, 100, 3, 0, '', 0, NULL, NULL
WHERE NOT EXISTS (SELECT 1 FROM battle_pets WHERE battlenetAccountId = @acct AND species = 5138);
INSERT INTO battle_pets (guid, battlenetAccountId, species, breed, displayId, level, exp, health, quality, flags, name, nameTimestamp, owner, ownerRealmId)
SELECT @petGuid + 1, @acct, 5159, 3, 146955, 1, 0, 100, 3, 0, '', 0, NULL, NULL
WHERE NOT EXISTS (SELECT 1 FROM battle_pets WHERE battlenetAccountId = @acct AND species = 5159);
INSERT INTO battle_pets (guid, battlenetAccountId, species, breed, displayId, level, exp, health, quality, flags, name, nameTimestamp, owner, ownerRealmId)
SELECT @petGuid + 2, @acct, 5160, 3, 146954, 1, 0, 100, 3, 0, '', 0, NULL, NULL
WHERE NOT EXISTS (SELECT 1 FROM battle_pets WHERE battlenetAccountId = @acct AND species = 5160);
INSERT INTO battle_pets (guid, battlenetAccountId, species, breed, displayId, level, exp, health, quality, flags, name, nameTimestamp, owner, ownerRealmId)
SELECT @petGuid + 3, @acct, 5161, 3, 146956, 1, 0, 100, 3, 0, '', 0, NULL, NULL
WHERE NOT EXISTS (SELECT 1 FROM battle_pets WHERE battlenetAccountId = @acct AND species = 5161);

-- Undo (replace @acct value):
-- DELETE FROM battlenet_account_mounts  WHERE battlenetAccountId = @acct AND mountSpellId IN (1309208, 1309405);
-- UPDATE battlenet_item_appearances SET appearanceMask = appearanceMask & ~4160749568 WHERE battlenetAccountId = @acct AND blobIndex = 9614;
-- UPDATE battlenet_item_appearances SET appearanceMask = appearanceMask & ~15         WHERE battlenetAccountId = @acct AND blobIndex = 9615;
-- UPDATE battlenet_item_appearances SET appearanceMask = appearanceMask & ~66977792   WHERE battlenetAccountId = @acct AND blobIndex = 9715;
-- UPDATE battlenet_item_appearances SET appearanceMask = appearanceMask & ~128        WHERE battlenetAccountId = @acct AND blobIndex = 9736;
-- DELETE FROM battlenet_item_appearances WHERE battlenetAccountId = @acct AND appearanceMask = 0;
-- DELETE FROM battlenet_account_toys    WHERE accountId = @acct AND itemId = 280740;
-- DELETE FROM battle_pets               WHERE battlenetAccountId = @acct AND species IN (5138, 5159, 5160, 5161);
--
-- No worldserver restart needed — account collections load at login. Relog to see everything.

-- ---------------------------------------------------------------------------
-- TODO — the two tabards:
--   Item 280404 "Lordaeron Forever Tabard" and item 280729 "Shen'dorei Tabard"
--   are ordinary equippable items (InventoryType 19), not collection unlocks —
--   there is no tabard-collection table to put them in.
--   Options, pick later:
--     a) Mail them to the buyer's first character (characters-side mail_items insert)
--     b) A claim NPC/quest in-game — e.g. a "collection vendor" or a pack-claim
--        quest granted at account level that hands out the physical items
--     c) Vendor-sell them for a token cost to flagged accounts
--   Decide a delivery mechanism, then add the tabards (and any future physical
--   pack rewards) to it rather than to this account-grant script.
-- ---------------------------------------------------------------------------
