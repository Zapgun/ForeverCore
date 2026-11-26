-- WoW Forever: hunter pets and warlock demons inherit owner stats through the client's hidden
-- scaling auras (flagged SPELL_ATTR4_OWNER_POWER_SCALING, every slot BasePoints = 0 — the server
-- fills all amounts). 415429 covers every hunter pet family, 416189 every warlock demon family.
-- 415431 "Avoidance" is a plain -50% AoE damage aura and needs no script.
-- Amounts are computed by spell_forever_pet_scaling (AuraScript::DoEffectCalcAmount) reading owner
-- stats; shares live behind Classic.PetGearScaling.* conf values.
-- Only matters with Classic.PetGearScaling = 1; safe to run again.
DELETE FROM `spell_script_names` WHERE `spell_id` IN (415429, 416189);
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(415429, 'spell_forever_pet_scaling'),
(416189, 'spell_forever_pet_scaling');
