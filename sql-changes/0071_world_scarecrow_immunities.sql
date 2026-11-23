-- 0071: scarecrow/golem family immunities — adds the missing vanilla poison
-- immunity. SchoolMask stays 0: the scarecrows are NOT nature-school immune;
-- they take nature damage normally.
--
-- World database.
--
-- Reference (vanilla dataset, entry 114 Harvest Watcher):
--   CC immunities: fleeing, incapacitated, bleeding, horrified
--   Effects: Poison
--
-- Before: MechanicsMask 16810016 = FEAR|BLEED|DAZE (bits 5/15/24) — the
--         bleed immunity the reference lists was already present,
--         DispelTypeMask 0.
-- After:  DispelTypeMask 16 (+ DISPEL_POISON bit 4) — so Serpent Sting and
--         other poison-type debuffs show "Immune", matching vanilla.
--         The MechanicsMask OR is a no-op safety clause (bit already set).
--
-- Creature entries (each has its own creature_immunities row):
--    36 Harvest Golem        -> 5000036
--   114 Harvest Watcher     -> 5000114
--   115 Harvest Reaper      -> 5000115
--   480 Rusty Harvest Golem -> 5000480
--   573 Foe Reaper 4000     -> 5000573
--
-- Backs up to bak_0071_creature_immunities.
-- Worldserver restart required (creature_immunities load at startup).

CREATE TABLE IF NOT EXISTS bak_0071_creature_immunities LIKE creature_immunities;
INSERT IGNORE INTO bak_0071_creature_immunities
  SELECT * FROM creature_immunities
  WHERE ID IN (5000036,5000114,5000115,5000480,5000573);

UPDATE creature_immunities
  SET DispelTypeMask = DispelTypeMask | 16,
      MechanicsMask  = MechanicsMask | 32768
  WHERE ID IN (5000036,5000114,5000115,5000480,5000573)
    AND DispelTypeMask = 0 AND MechanicsMask = 16810016;

-- Undo:
--   UPDATE creature_immunities i JOIN bak_0071_creature_immunities b
--     ON b.ID=i.ID SET i.DispelTypeMask=b.DispelTypeMask,
--     i.MechanicsMask=b.MechanicsMask WHERE i.ID IN
--     (5000036,5000114,5000115,5000480,5000573);
