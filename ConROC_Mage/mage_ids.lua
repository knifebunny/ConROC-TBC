local ConROC_Mage, ids = ...;

--General
ids.Racial = {
	Berserking = 20554,
	EscapeArtist = 20589,
	Perception = 20600,
}
ids.Spec = {
	Arcane = 1,
	Fire = 2,
	Frost = 3,
}
ids.Caster = {
	Shoot = 5019,
}
ids.Ability = {
--Arcane
	AmplifyMagic = 1008,
	ArcaneBlast = 30451,
	ArcaneBrilliance = 23028,
	ArcaneExplosion = 1449,
	ArcaneIntellect = 1459,
	ArcaneMissiles = 5143,
	ArcanePower = 12042,
	Blink = 1953,
	ConjureFood = 587,
	ConjureManaAgate = 759,
	ConjureManaJade = 3552,
	ConjureManaCitrine = 10053,
	ConjureManaRuby = 10054,
	ConjureWater = 5504,
	Counterspell = 2139,
	DampenMagic = 604,
	DetectMagic = 2855,
	Evocation = 12051,
	Invisibility = 66,
	MageArmor = 6117,
	ManaShield = 1463,
	PresenceofMind = 12043,
	RemoveLesserCurse = 475,
	SlowFall = 130,
	Polymorph = 118,
	Spellsteal = 30449,
--Fire
	BlastWave = 11113,
	Combustion = 11129,
	DragonBreath = 31661,
	FireBlast = 2136,
	FireWard = 543,
	Fireball = 133,
	Flamestrike = 2120,
	FlamestrikeDR = 2120,
	MoltenArmor = 30482,
	Pyroblast = 11366,
	Scorch = 2948,
--Frost
	Blizzard = 10,
	ColdSnap = 11958,
	ConeofCold = 120,
	FrostNova = 122,
	FrostWard = 6143,
	Frostbolt = 116,
	IceArmor = 168,
	IceBarrier = 11426,
	IceBlock = 45438,
	IceLance = 30455,
	IcyVeins = 12472,
	SummonWaterElemental = 31687,
}
ids.Rank = {
--Arcane
	AmplifyMagicRank1 = 1008,
	AmplifyMagicRank2 = 8455,
	AmplifyMagicRank3 = 10169,
	AmplifyMagicRank4 = 10170,
	AmplifyMagicRank5 = 27130,
	ArcaneExplosionRank1 = 1449,
	ArcaneExplosionRank2 = 8437,
	ArcaneExplosionRank3 = 8438,
	ArcaneExplosionRank4 = 8439,
	ArcaneExplosionRank5 = 10201,
	ArcaneExplosionRank6 = 10202,
	ArcaneExplosionRank7 = 27080,
	ArcaneExplosionRank8 = 27082,
	ArcaneIntellectRank1 = 1459,
	ArcaneIntellectRank2 = 1460,
	ArcaneIntellectRank3 = 1461,
	ArcaneIntellectRank4 = 10156,
	ArcaneIntellectRank5 = 10157,
	ArcaneBrillianceRank1 = 23028,
	ArcaneBrillianceRank2 = 27127,
	ArcaneMissilesRank1 = 5143,
	ArcaneMissilesRank2 = 5144,
	ArcaneMissilesRank3 = 5145,
	ArcaneMissilesRank4 = 8416,
	ArcaneMissilesRank5 = 8417,
	ArcaneMissilesRank6 = 10211,
	ArcaneMissilesRank7 = 10212,
	ArcaneMissilesRank8 = 25345,
	ArcaneMissilesRank9 = 27075,
	ArcaneMissilesRank10 = 38699,
	ArcaneMissilesRank11 = 38704,
	ConjureFoodRank1 = 587,
	ConjureFoodRank2 = 597,
	ConjureFoodRank3 = 990,
	ConjureFoodRank4 = 6129,
	ConjureFoodRank5 = 10144,
	ConjureFoodRank6 = 10145,
	ConjureFoodRank7 = 28612,
	ConjureWaterRank1 = 5504,
	ConjureWaterRank2 = 5505,
	ConjureWaterRank3 = 5506,
	ConjureWaterRank4 = 6127,
	ConjureWaterRank5 = 10138,
	ConjureWaterRank6 = 10139,
	ConjureWaterRank7 = 10140,
	DampenMagicRank1 = 604,
	DampenMagicRank2 = 8450,
	DampenMagicRank3 = 8451,
	DampenMagicRank4 = 10173,
	DampenMagicRank5 = 10174,
	MageArmorRank1 = 6117,
	MageArmorRank2 = 22782,
	MageArmorRank3 = 22783,
	MageArmorRank4 = 27125,
	ManaShieldRank1 = 1463,
	ManaShieldRank2 = 8494,
	ManaShieldRank3 = 8495,
	ManaShieldRank4 = 10191,
	ManaShieldRank5 = 10192,
	ManaShieldRank6 = 10193,
	ManaShieldRank7 = 27131,
	PolymorphRank1 = 118,
	PolymorphRank2 = 12824,
	PolymorphRank3 = 12825,
	PolymorphRank4 = 12826,
--Fire
	BlastWaveRank1 = 11113,
	BlastWaveRank2 = 13018,
	BlastWaveRank3 = 13019,
	BlastWaveRank4 = 13020,
	BlastWaveRank5 = 13021,
	BlastWaveRank6 = 27133,
	BlastWaveRank7 = 33933,
	DragonBreathRank1 = 31661,
	DragonBreathRank2 = 33041,
	DragonBreathRank3 = 33042,
	DragonBreathRank4 = 33043,
	FireBlastRank1 = 2136,
	FireBlastRank2 = 2137,
	FireBlastRank3 = 2138,
	FireBlastRank4 = 8412,
	FireBlastRank5 = 8413,
	FireBlastRank6 = 10197,
	FireBlastRank7 = 10199,
	FireBlastRank8 = 27078,
	FireBlastRank9 = 27079,
	FireWardRank1 = 543,
	FireWardRank2 = 8457,
	FireWardRank3 = 8458,
	FireWardRank4 = 10223,
	FireWardRank5 = 10225,
	FireWardRank6 = 27128,
	FireballRank1 = 133,
	FireballRank2 = 143,
	FireballRank3 = 145,
	FireballRank4 = 3140,
	FireballRank5 = 8400,
	FireballRank6 = 8401,
	FireballRank7 = 8402,
	FireballRank8 = 10148,
	FireballRank9 = 10149,
	FireballRank10 = 10150,
	FireballRank11 = 10151,
	FireballRank12 = 25306,
	FireballRank13 = 27070,
	FireballRank14 = 38692,
	FlamestrikeRank1 = 2120,
	FlamestrikeRank2 = 2121,
	FlamestrikeRank3 = 8422,
	FlamestrikeRank4 = 8423,
	FlamestrikeRank5 = 10215,
	FlamestrikeRank6 = 10216,
	FlamestrikeRank7 = 27086,
	PyroblastRank1 = 11366,
	PyroblastRank2 = 12505,
	PyroblastRank3 = 12522,
	PyroblastRank4 = 12523,
	PyroblastRank5 = 12524,
	PyroblastRank6 = 12525,
	PyroblastRank7 = 12526,
	PyroblastRank8 = 18809,
	PyroblastRank9 = 27132,
	PyroblastRank10 = 33938,
	ScorchRank1 = 2948,
	ScorchRank2 = 8444,
	ScorchRank3 = 8445,
	ScorchRank4 = 8446,
	ScorchRank5 = 10205,
	ScorchRank6 = 10206,
	ScorchRank7 = 10207,
	ScorchRank8 = 27073,
	ScorchRank9 = 27074,
--Frost
	BlizzardRank1 = 10,
	BlizzardRank2 = 6141,
	BlizzardRank3 = 8427,
	BlizzardRank4 = 10185,
	BlizzardRank5 = 10186,
	BlizzardRank6 = 10187,
	BlizzardRank7 = 27085,
	ConeofColdRank1 = 120,
	ConeofColdRank2 = 8492,
	ConeofColdRank3 = 10159,
	ConeofColdRank4 = 10160,
	ConeofColdRank5 = 10161,
	ConeofColdRank6 = 27087,
	FrostArmorRank1 = 168,
	FrostArmorRank2 = 7300,
	FrostArmorRank3 = 7301,
	FrostNovaRank1 = 122,
	FrostNovaRank2 = 865,
	FrostNovaRank3 = 6131,
	FrostNovaRank4 = 10230,
	FrostNovaRank5 = 27088,
	FrostWardRank1 = 6143,
	FrostWardRank2 = 8461,
	FrostWardRank3 = 8462,
	FrostWardRank4 = 10177,
	FrostWardRank5 = 28609,
	FrostWardRank6 = 32796,
	FrostboltRank1 = 116,
	FrostboltRank2 = 205,
	FrostboltRank3 = 837,
	FrostboltRank4 = 7322,
	FrostboltRank5 = 8406,
	FrostboltRank6 = 8407,
	FrostboltRank7 = 8408,
	FrostboltRank8 = 10179,
	FrostboltRank9 = 10180,
	FrostboltRank10 = 10181,
	FrostboltRank11 = 25304,
	FrostboltRank12 = 27071,
	FrostboltRank13 = 27072,
	FrostboltRank14 = 38697,
	IceBarrierRank1 = 11426,
	IceBarrierRank2 = 13031,
	IceBarrierRank3 = 13032,
	IceBarrierRank4 = 13033,
	IceBarrierRank5 = 27134,
	IceBarrierRank6 = 33405,
	IceArmorRank1 = 7302,
	IceArmorRank2 = 7320,
	IceArmorRank3 = 10219,
	IceArmorRank4 = 10220,
}
-- TBC Talent tree positions for GetTalentInfo(tab, index).
-- Tab 1=Arcane, 2=Fire, 3=Frost.
-- NOTE: These reflect TBC talent tree ordering. Verify in-game if rotation
-- behaviour seems off — Classic Era positions differ from TBC.
ids.Arcane_Talent = {
	ArcaneSubtlety =  1,
	ArcaneConcentration =  2,
	ImprovedArcaneMissiles =  3,
	WandSpecialization =  4,
	MagicAttunement =  5,
	ArcaneFocus =  6,
	ArcaneResilience =  7,
	ImprovedBlink =  8,
	ArcaneInstability =  9,
	PresenceofMind =  10,
	ArcaneMind =  11,
	ArcaneMeditation =  12,
	TormenttheWeak =  13,
	SpellImpact =  14,
	ArcanePower =  15,
	ImprovedCounterspell =  16,
	ArcanePotency =  17,
	MagicAbsorption =  18,
	MindMastery =  19,
	Slow =  20,
	ArcaneFlows =  21,
}
ids.Fire_Talent = {
	BurningSoul =  1,
	ImprovedFireWard =  2,
	ImprovedScorch =  3,
	ImprovedFireball =  4,
	Incinerate =  5,
	FlameThrowing =  6,
	Impact =  7,
	Pyroblast =  8,
	BurningDetermination =  9,
	MasterofElements =  10,
	Ignite =  11,
	ImprovedFlamestrike =  12,
	BlastWave =  13,
	FirePower =  14,
	CriticalMass =  15,
	BlazingSpeed =  16,
	Pyromaniac =  17,
	Combustion =  18,
	EmpoweredFireball =  19,
	DragonBreath =  20,
	Firestarter =  21,
}
ids.Frost_Talent = {
	ImprovedFrostbolt =  1,
	Frostbite =  2,
	ImprovedFrostNova =  3,
	Permafrost =  4,
	PiercingIce =  5,
	IcyVeins =  6,
	ImprovedBlizzard =  7,
	ArcticReach =  8,
	FrostChanneling =  9,
	Shatter =  10,
	ColdSnap =  11,
	ImprovedConeofCold =  12,
	IceShards =  13,
	WintersChill =  14,
	FrozenCore =  15,
	ColdAsIce =  16,
	SummonWaterElemental =  17,
	EmpoweredFrostbolt =  18,
	ChilledtotheBone =  19,
	IceFloes =  20,
	DeepFreeze =  21,
}
ids.Buff = {
}
ids.Debuff = {
	Chilled = 6136,
	FireVulnerability = 22959,
	WintersChill = 12579,
}

function ConROC:UpdateSpellID()
	--Ranks
	if IsSpellKnown(ids.Rank.AmplifyMagicRank5) then ids.Ability.AmplifyMagic = ids.Rank.AmplifyMagicRank5;
	elseif IsSpellKnown(ids.Rank.AmplifyMagicRank4) then ids.Ability.AmplifyMagic = ids.Rank.AmplifyMagicRank4;
	elseif IsSpellKnown(ids.Rank.AmplifyMagicRank3) then ids.Ability.AmplifyMagic = ids.Rank.AmplifyMagicRank3;
	elseif IsSpellKnown(ids.Rank.AmplifyMagicRank2) then ids.Ability.AmplifyMagic = ids.Rank.AmplifyMagicRank2; end

	if IsSpellKnown(ids.Rank.ArcaneBrillianceRank2) then ids.Ability.ArcaneBrilliance = ids.Rank.ArcaneBrillianceRank2; end

	if IsSpellKnown(ids.Rank.ArcaneExplosionRank8) then ids.Ability.ArcaneExplosion = ids.Rank.ArcaneExplosionRank8;
	elseif IsSpellKnown(ids.Rank.ArcaneExplosionRank7) then ids.Ability.ArcaneExplosion = ids.Rank.ArcaneExplosionRank7;
	elseif IsSpellKnown(ids.Rank.ArcaneExplosionRank6) then ids.Ability.ArcaneExplosion = ids.Rank.ArcaneExplosionRank6;
	elseif IsSpellKnown(ids.Rank.ArcaneExplosionRank5) then ids.Ability.ArcaneExplosion = ids.Rank.ArcaneExplosionRank5;
	elseif IsSpellKnown(ids.Rank.ArcaneExplosionRank4) then ids.Ability.ArcaneExplosion = ids.Rank.ArcaneExplosionRank4;
	elseif IsSpellKnown(ids.Rank.ArcaneExplosionRank3) then ids.Ability.ArcaneExplosion = ids.Rank.ArcaneExplosionRank3;
	elseif IsSpellKnown(ids.Rank.ArcaneExplosionRank2) then ids.Ability.ArcaneExplosion = ids.Rank.ArcaneExplosionRank2; end

	if IsSpellKnown(ids.Rank.ArcaneIntellectRank5) then ids.Ability.ArcaneIntellect = ids.Rank.ArcaneIntellectRank5;
	elseif IsSpellKnown(ids.Rank.ArcaneIntellectRank4) then ids.Ability.ArcaneIntellect = ids.Rank.ArcaneIntellectRank4;
	elseif IsSpellKnown(ids.Rank.ArcaneIntellectRank3) then ids.Ability.ArcaneIntellect = ids.Rank.ArcaneIntellectRank3;
	elseif IsSpellKnown(ids.Rank.ArcaneIntellectRank2) then ids.Ability.ArcaneIntellect = ids.Rank.ArcaneIntellectRank2; end

	if IsSpellKnown(ids.Rank.ArcaneMissilesRank11) then ids.Ability.ArcaneMissiles = ids.Rank.ArcaneMissilesRank11;
	elseif IsSpellKnown(ids.Rank.ArcaneMissilesRank10) then ids.Ability.ArcaneMissiles = ids.Rank.ArcaneMissilesRank10;
	elseif IsSpellKnown(ids.Rank.ArcaneMissilesRank9) then ids.Ability.ArcaneMissiles = ids.Rank.ArcaneMissilesRank9;
	elseif IsSpellKnown(ids.Rank.ArcaneMissilesRank8) then ids.Ability.ArcaneMissiles = ids.Rank.ArcaneMissilesRank8;
	elseif IsSpellKnown(ids.Rank.ArcaneMissilesRank7) then ids.Ability.ArcaneMissiles = ids.Rank.ArcaneMissilesRank7;
	elseif IsSpellKnown(ids.Rank.ArcaneMissilesRank6) then ids.Ability.ArcaneMissiles = ids.Rank.ArcaneMissilesRank6;
	elseif IsSpellKnown(ids.Rank.ArcaneMissilesRank5) then ids.Ability.ArcaneMissiles = ids.Rank.ArcaneMissilesRank5;
	elseif IsSpellKnown(ids.Rank.ArcaneMissilesRank4) then ids.Ability.ArcaneMissiles = ids.Rank.ArcaneMissilesRank4;
	elseif IsSpellKnown(ids.Rank.ArcaneMissilesRank3) then ids.Ability.ArcaneMissiles = ids.Rank.ArcaneMissilesRank3;
	elseif IsSpellKnown(ids.Rank.ArcaneMissilesRank2) then ids.Ability.ArcaneMissiles = ids.Rank.ArcaneMissilesRank2; end

	if IsSpellKnown(ids.Rank.DampenMagicRank5) then ids.Ability.DampenMagic = ids.Rank.DampenMagicRank5;
	elseif IsSpellKnown(ids.Rank.DampenMagicRank4) then ids.Ability.DampenMagic = ids.Rank.DampenMagicRank4;
	elseif IsSpellKnown(ids.Rank.DampenMagicRank3) then ids.Ability.DampenMagic = ids.Rank.DampenMagicRank3;
	elseif IsSpellKnown(ids.Rank.DampenMagicRank2) then ids.Ability.DampenMagic = ids.Rank.DampenMagicRank2; end

	if IsSpellKnown(ids.Rank.BlastWaveRank7) then ids.Ability.BlastWave = ids.Rank.BlastWaveRank7;
	elseif IsSpellKnown(ids.Rank.BlastWaveRank6) then ids.Ability.BlastWave = ids.Rank.BlastWaveRank6;
	elseif IsSpellKnown(ids.Rank.BlastWaveRank5) then ids.Ability.BlastWave = ids.Rank.BlastWaveRank5;
	elseif IsSpellKnown(ids.Rank.BlastWaveRank4) then ids.Ability.BlastWave = ids.Rank.BlastWaveRank4;
	elseif IsSpellKnown(ids.Rank.BlastWaveRank3) then ids.Ability.BlastWave = ids.Rank.BlastWaveRank3;
	elseif IsSpellKnown(ids.Rank.BlastWaveRank2) then ids.Ability.BlastWave = ids.Rank.BlastWaveRank2; end

	if IsSpellKnown(ids.Rank.DragonBreathRank4) then ids.Ability.DragonBreath = ids.Rank.DragonBreathRank4;
	elseif IsSpellKnown(ids.Rank.DragonBreathRank3) then ids.Ability.DragonBreath = ids.Rank.DragonBreathRank3;
	elseif IsSpellKnown(ids.Rank.DragonBreathRank2) then ids.Ability.DragonBreath = ids.Rank.DragonBreathRank2;
	elseif IsSpellKnown(ids.Rank.DragonBreathRank1) then ids.Ability.DragonBreath = ids.Rank.DragonBreathRank1; end

	if IsSpellKnown(ids.Rank.FireBlastRank9) then ids.Ability.FireBlast = ids.Rank.FireBlastRank9;
	elseif IsSpellKnown(ids.Rank.FireBlastRank8) then ids.Ability.FireBlast = ids.Rank.FireBlastRank8;
	elseif IsSpellKnown(ids.Rank.FireBlastRank7) then ids.Ability.FireBlast = ids.Rank.FireBlastRank7;
	elseif IsSpellKnown(ids.Rank.FireBlastRank6) then ids.Ability.FireBlast = ids.Rank.FireBlastRank6;
	elseif IsSpellKnown(ids.Rank.FireBlastRank5) then ids.Ability.FireBlast = ids.Rank.FireBlastRank5;
	elseif IsSpellKnown(ids.Rank.FireBlastRank4) then ids.Ability.FireBlast = ids.Rank.FireBlastRank4;
	elseif IsSpellKnown(ids.Rank.FireBlastRank3) then ids.Ability.FireBlast = ids.Rank.FireBlastRank3;
	elseif IsSpellKnown(ids.Rank.FireBlastRank2) then ids.Ability.FireBlast = ids.Rank.FireBlastRank2; end

	if IsSpellKnown(ids.Rank.FireWardRank6) then ids.Ability.FireWard = ids.Rank.FireWardRank6;
	elseif IsSpellKnown(ids.Rank.FireWardRank5) then ids.Ability.FireWard = ids.Rank.FireWardRank5;
	elseif IsSpellKnown(ids.Rank.FireWardRank4) then ids.Ability.FireWard = ids.Rank.FireWardRank4;
	elseif IsSpellKnown(ids.Rank.FireWardRank3) then ids.Ability.FireWard = ids.Rank.FireWardRank3;
	elseif IsSpellKnown(ids.Rank.FireWardRank2) then ids.Ability.FireWard = ids.Rank.FireWardRank2; end

	-- BUG FIX: Original code had Rank8 and Rank9 assignments swapped.
	if IsSpellKnown(ids.Rank.FireballRank14) then ids.Ability.Fireball = ids.Rank.FireballRank14;
	elseif IsSpellKnown(ids.Rank.FireballRank13) then ids.Ability.Fireball = ids.Rank.FireballRank13;
	elseif IsSpellKnown(ids.Rank.FireballRank12) then ids.Ability.Fireball = ids.Rank.FireballRank12;
	elseif IsSpellKnown(ids.Rank.FireballRank11) then ids.Ability.Fireball = ids.Rank.FireballRank11;
	elseif IsSpellKnown(ids.Rank.FireballRank10) then ids.Ability.Fireball = ids.Rank.FireballRank10;
	elseif IsSpellKnown(ids.Rank.FireballRank9) then ids.Ability.Fireball = ids.Rank.FireballRank9;
	elseif IsSpellKnown(ids.Rank.FireballRank8) then ids.Ability.Fireball = ids.Rank.FireballRank8;
	elseif IsSpellKnown(ids.Rank.FireballRank7) then ids.Ability.Fireball = ids.Rank.FireballRank7;
	elseif IsSpellKnown(ids.Rank.FireballRank6) then ids.Ability.Fireball = ids.Rank.FireballRank6;
	elseif IsSpellKnown(ids.Rank.FireballRank5) then ids.Ability.Fireball = ids.Rank.FireballRank5;
	elseif IsSpellKnown(ids.Rank.FireballRank4) then ids.Ability.Fireball = ids.Rank.FireballRank4;
	elseif IsSpellKnown(ids.Rank.FireballRank3) then ids.Ability.Fireball = ids.Rank.FireballRank3;
	elseif IsSpellKnown(ids.Rank.FireballRank2) then ids.Ability.Fireball = ids.Rank.FireballRank2; end

	if IsSpellKnown(ids.Rank.FlamestrikeRank7) then ids.Ability.Flamestrike = ids.Rank.FlamestrikeRank7;
	elseif IsSpellKnown(ids.Rank.FlamestrikeRank6) then ids.Ability.Flamestrike = ids.Rank.FlamestrikeRank6;
	elseif IsSpellKnown(ids.Rank.FlamestrikeRank5) then ids.Ability.Flamestrike = ids.Rank.FlamestrikeRank5;
	elseif IsSpellKnown(ids.Rank.FlamestrikeRank4) then ids.Ability.Flamestrike = ids.Rank.FlamestrikeRank4;
	elseif IsSpellKnown(ids.Rank.FlamestrikeRank3) then ids.Ability.Flamestrike = ids.Rank.FlamestrikeRank3;
	elseif IsSpellKnown(ids.Rank.FlamestrikeRank2) then ids.Ability.Flamestrike = ids.Rank.FlamestrikeRank2; end

	-- Down-ranked Flamestrike (one rank lower than highest known)
	if IsSpellKnown(ids.Rank.FlamestrikeRank7) then ids.Ability.FlamestrikeDR = ids.Rank.FlamestrikeRank6;
	elseif IsSpellKnown(ids.Rank.FlamestrikeRank6) then ids.Ability.FlamestrikeDR = ids.Rank.FlamestrikeRank5;
	elseif IsSpellKnown(ids.Rank.FlamestrikeRank5) then ids.Ability.FlamestrikeDR = ids.Rank.FlamestrikeRank4;
	elseif IsSpellKnown(ids.Rank.FlamestrikeRank4) then ids.Ability.FlamestrikeDR = ids.Rank.FlamestrikeRank3;
	elseif IsSpellKnown(ids.Rank.FlamestrikeRank3) then ids.Ability.FlamestrikeDR = ids.Rank.FlamestrikeRank2;
	elseif IsSpellKnown(ids.Rank.FlamestrikeRank2) then ids.Ability.FlamestrikeDR = ids.Rank.FlamestrikeRank1; end

	if IsSpellKnown(ids.Rank.PyroblastRank10) then ids.Ability.Pyroblast = ids.Rank.PyroblastRank10;
	elseif IsSpellKnown(ids.Rank.PyroblastRank9) then ids.Ability.Pyroblast = ids.Rank.PyroblastRank9;
	elseif IsSpellKnown(ids.Rank.PyroblastRank8) then ids.Ability.Pyroblast = ids.Rank.PyroblastRank8;
	elseif IsSpellKnown(ids.Rank.PyroblastRank7) then ids.Ability.Pyroblast = ids.Rank.PyroblastRank7;
	elseif IsSpellKnown(ids.Rank.PyroblastRank6) then ids.Ability.Pyroblast = ids.Rank.PyroblastRank6;
	elseif IsSpellKnown(ids.Rank.PyroblastRank5) then ids.Ability.Pyroblast = ids.Rank.PyroblastRank5;
	elseif IsSpellKnown(ids.Rank.PyroblastRank4) then ids.Ability.Pyroblast = ids.Rank.PyroblastRank4;
	elseif IsSpellKnown(ids.Rank.PyroblastRank3) then ids.Ability.Pyroblast = ids.Rank.PyroblastRank3;
	elseif IsSpellKnown(ids.Rank.PyroblastRank2) then ids.Ability.Pyroblast = ids.Rank.PyroblastRank2; end

	if IsSpellKnown(ids.Rank.ScorchRank9) then ids.Ability.Scorch = ids.Rank.ScorchRank9;
	elseif IsSpellKnown(ids.Rank.ScorchRank8) then ids.Ability.Scorch = ids.Rank.ScorchRank8;
	elseif IsSpellKnown(ids.Rank.ScorchRank7) then ids.Ability.Scorch = ids.Rank.ScorchRank7;
	elseif IsSpellKnown(ids.Rank.ScorchRank6) then ids.Ability.Scorch = ids.Rank.ScorchRank6;
	elseif IsSpellKnown(ids.Rank.ScorchRank5) then ids.Ability.Scorch = ids.Rank.ScorchRank5;
	elseif IsSpellKnown(ids.Rank.ScorchRank4) then ids.Ability.Scorch = ids.Rank.ScorchRank4;
	elseif IsSpellKnown(ids.Rank.ScorchRank3) then ids.Ability.Scorch = ids.Rank.ScorchRank3;
	elseif IsSpellKnown(ids.Rank.ScorchRank2) then ids.Ability.Scorch = ids.Rank.ScorchRank2; end

	if IsSpellKnown(ids.Rank.BlizzardRank7) then ids.Ability.Blizzard = ids.Rank.BlizzardRank7;
	elseif IsSpellKnown(ids.Rank.BlizzardRank6) then ids.Ability.Blizzard = ids.Rank.BlizzardRank6;
	elseif IsSpellKnown(ids.Rank.BlizzardRank5) then ids.Ability.Blizzard = ids.Rank.BlizzardRank5;
	elseif IsSpellKnown(ids.Rank.BlizzardRank4) then ids.Ability.Blizzard = ids.Rank.BlizzardRank4;
	elseif IsSpellKnown(ids.Rank.BlizzardRank3) then ids.Ability.Blizzard = ids.Rank.BlizzardRank3;
	elseif IsSpellKnown(ids.Rank.BlizzardRank2) then ids.Ability.Blizzard = ids.Rank.BlizzardRank2; end

	if IsSpellKnown(ids.Rank.ConeofColdRank6) then ids.Ability.ConeofCold = ids.Rank.ConeofColdRank6;
	elseif IsSpellKnown(ids.Rank.ConeofColdRank5) then ids.Ability.ConeofCold = ids.Rank.ConeofColdRank5;
	elseif IsSpellKnown(ids.Rank.ConeofColdRank4) then ids.Ability.ConeofCold = ids.Rank.ConeofColdRank4;
	elseif IsSpellKnown(ids.Rank.ConeofColdRank3) then ids.Ability.ConeofCold = ids.Rank.ConeofColdRank3;
	elseif IsSpellKnown(ids.Rank.ConeofColdRank2) then ids.Ability.ConeofCold = ids.Rank.ConeofColdRank2; end

	if IsSpellKnown(ids.Rank.FrostWardRank6) then ids.Ability.FrostWard = ids.Rank.FrostWardRank6;
	elseif IsSpellKnown(ids.Rank.FrostWardRank5) then ids.Ability.FrostWard = ids.Rank.FrostWardRank5;
	elseif IsSpellKnown(ids.Rank.FrostWardRank4) then ids.Ability.FrostWard = ids.Rank.FrostWardRank4;
	elseif IsSpellKnown(ids.Rank.FrostWardRank3) then ids.Ability.FrostWard = ids.Rank.FrostWardRank3;
	elseif IsSpellKnown(ids.Rank.FrostWardRank2) then ids.Ability.FrostWard = ids.Rank.FrostWardRank2; end

	if IsSpellKnown(ids.Rank.FrostboltRank14) then ids.Ability.Frostbolt = ids.Rank.FrostboltRank14;
	elseif IsSpellKnown(ids.Rank.FrostboltRank13) then ids.Ability.Frostbolt = ids.Rank.FrostboltRank13;
	elseif IsSpellKnown(ids.Rank.FrostboltRank12) then ids.Ability.Frostbolt = ids.Rank.FrostboltRank12;
	elseif IsSpellKnown(ids.Rank.FrostboltRank11) then ids.Ability.Frostbolt = ids.Rank.FrostboltRank11;
	elseif IsSpellKnown(ids.Rank.FrostboltRank10) then ids.Ability.Frostbolt = ids.Rank.FrostboltRank10;
	elseif IsSpellKnown(ids.Rank.FrostboltRank9) then ids.Ability.Frostbolt = ids.Rank.FrostboltRank9;
	elseif IsSpellKnown(ids.Rank.FrostboltRank8) then ids.Ability.Frostbolt = ids.Rank.FrostboltRank8;
	elseif IsSpellKnown(ids.Rank.FrostboltRank7) then ids.Ability.Frostbolt = ids.Rank.FrostboltRank7;
	elseif IsSpellKnown(ids.Rank.FrostboltRank6) then ids.Ability.Frostbolt = ids.Rank.FrostboltRank6;
	elseif IsSpellKnown(ids.Rank.FrostboltRank5) then ids.Ability.Frostbolt = ids.Rank.FrostboltRank5;
	elseif IsSpellKnown(ids.Rank.FrostboltRank4) then ids.Ability.Frostbolt = ids.Rank.FrostboltRank4;
	elseif IsSpellKnown(ids.Rank.FrostboltRank3) then ids.Ability.Frostbolt = ids.Rank.FrostboltRank3;
	elseif IsSpellKnown(ids.Rank.FrostboltRank2) then ids.Ability.Frostbolt = ids.Rank.FrostboltRank2; end

	--Defensive Ranks
	if IsSpellKnown(ids.Rank.MageArmorRank4) then ids.Ability.MageArmor = ids.Rank.MageArmorRank4;
	elseif IsSpellKnown(ids.Rank.MageArmorRank3) then ids.Ability.MageArmor = ids.Rank.MageArmorRank3;
	elseif IsSpellKnown(ids.Rank.MageArmorRank2) then ids.Ability.MageArmor = ids.Rank.MageArmorRank2; end

	if IsSpellKnown(ids.Rank.ManaShieldRank7) then ids.Ability.ManaShield = ids.Rank.ManaShieldRank7;
	elseif IsSpellKnown(ids.Rank.ManaShieldRank6) then ids.Ability.ManaShield = ids.Rank.ManaShieldRank6;
	elseif IsSpellKnown(ids.Rank.ManaShieldRank5) then ids.Ability.ManaShield = ids.Rank.ManaShieldRank5;
	elseif IsSpellKnown(ids.Rank.ManaShieldRank4) then ids.Ability.ManaShield = ids.Rank.ManaShieldRank4;
	elseif IsSpellKnown(ids.Rank.ManaShieldRank3) then ids.Ability.ManaShield = ids.Rank.ManaShieldRank3;
	elseif IsSpellKnown(ids.Rank.ManaShieldRank2) then ids.Ability.ManaShield = ids.Rank.ManaShieldRank2; end

	if IsSpellKnown(ids.Rank.IceBarrierRank6) then ids.Ability.IceBarrier = ids.Rank.IceBarrierRank6;
	elseif IsSpellKnown(ids.Rank.IceBarrierRank5) then ids.Ability.IceBarrier = ids.Rank.IceBarrierRank5;
	elseif IsSpellKnown(ids.Rank.IceBarrierRank4) then ids.Ability.IceBarrier = ids.Rank.IceBarrierRank4;
	elseif IsSpellKnown(ids.Rank.IceBarrierRank3) then ids.Ability.IceBarrier = ids.Rank.IceBarrierRank3;
	elseif IsSpellKnown(ids.Rank.IceBarrierRank2) then ids.Ability.IceBarrier = ids.Rank.IceBarrierRank2; end

	if IsSpellKnown(ids.Rank.IceArmorRank4) then ids.Ability.IceArmor = ids.Rank.IceArmorRank4;
	elseif IsSpellKnown(ids.Rank.IceArmorRank3) then ids.Ability.IceArmor = ids.Rank.IceArmorRank3;
	elseif IsSpellKnown(ids.Rank.IceArmorRank2) then ids.Ability.IceArmor = ids.Rank.IceArmorRank2;
	elseif IsSpellKnown(ids.Rank.IceArmorRank1) then ids.Ability.IceArmor = ids.Rank.IceArmorRank1;
	elseif IsSpellKnown(ids.Rank.FrostArmorRank3) then ids.Ability.IceArmor = ids.Rank.FrostArmorRank3;
	elseif IsSpellKnown(ids.Rank.FrostArmorRank2) then ids.Ability.IceArmor = ids.Rank.FrostArmorRank2; end

	if IsSpellKnown(ids.Rank.FrostNovaRank5) then ids.Ability.FrostNova = ids.Rank.FrostNovaRank5;
	elseif IsSpellKnown(ids.Rank.FrostNovaRank4) then ids.Ability.FrostNova = ids.Rank.FrostNovaRank4;
	elseif IsSpellKnown(ids.Rank.FrostNovaRank3) then ids.Ability.FrostNova = ids.Rank.FrostNovaRank3;
	elseif IsSpellKnown(ids.Rank.FrostNovaRank2) then ids.Ability.FrostNova = ids.Rank.FrostNovaRank2; end
end
