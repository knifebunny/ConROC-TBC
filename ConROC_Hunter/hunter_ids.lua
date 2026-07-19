local ConROC_Hunter, ids = ...;

--General
ids.Racial = {
	Berserking = 20554,
	Shadowmeld = 20580,
}
ids.Spec = {
	BeastMastery = 1,
	Marksmanship = 2,
	Survival = 3,
}
ids.Ability = {
--Beast Mastery
	AspectoftheBeast = 13161,
	AspectoftheCheetah = 5118,
	AspectoftheHawk = 13165,
	AspectoftheMonkey = 13163,
	AspectofthePack = 13159,
	AspectoftheViper = 34074,
	AspectoftheWild = 20043,
	BeastLore = 1462,
	BestialWrath = 19574,
	EagleEye = 6197,
	CallPet = 883,
	FeedPet = 6991,
	EyesoftheBeast = 1002,
	Intimidation = 19577,
	MendPet = 136,
	ScareBeast = 1513,
--Marksmanship
	AimedShot = 19434,
	ArcaneShot = 3044,
	ConcussiveShot = 5116,
	SteadyShot = 34120,
	DistractingShot = 20736,
	Flare = 1543,
	HuntersMark = 1130,
	MultiShot = 2643,
	RapidFire = 3045,
	ScatterShot = 19503,
	ScorpidSting = 3043,
	SerpentSting = 1978,
	TrueshotAura = 19506,
	ViperSting = 3034,
	Volley = 1510,
--Survival
	Counterattack = 19306,
	Deterrence = 19263,
	Disengage = 781,
	ExplosiveTrap = 13813,
	ImmolationTrap = 13795,
	FeignDeath = 5384,
	FreezingTrap = 1499,
	FrostTrap = 13809,
	MongooseBite = 1495,
	RaptorStrike = 2973,
	TrackBeasts = 1494,
	TrackDemons = 19878,
	TrackDragonkin = 19879,
	TrackElementals = 19880,
	TrackGiants = 19882,
	TrackHidden = 19885,
	TrackHumanoids = 19883,
	TrackUndead = 19884,
	WingClip = 2974,
	WyvernSting = 19386,
--TBC
	KillCommand = 34026,
	Misdirection = 34477,
	SnakeTrap = 34600,
}
ids.Rank = {
--Beast Mastery
	AspectoftheHawkRank1 = 13165,
	AspectoftheHawkRank2 = 14318,
	AspectoftheHawkRank3 = 14319,
	AspectoftheHawkRank4 = 14320,
	AspectoftheHawkRank5 = 14321,
	AspectoftheHawkRank6 = 14322,
	AspectoftheHawkRank7 = 38784, -- TBC rank (level 64)
	AspectoftheWildRank1 = 20043,
	AspectoftheWildRank2 = 20190,
	MendPetRank1 = 136,
	MendPetRank2 = 3111,
	MendPetRank3 = 3661,
	MendPetRank4 = 3662,
	MendPetRank5 = 13542,
	MendPetRank6 = 13543,
	MendPetRank7 = 13544,
	MendPetRank8 = 27046, -- TBC rank (level 68)
	ScareBeastRank1 = 1513,
	ScareBeastRank2 = 14326,
	ScareBeastRank3 = 14327,
--Marksmanship
	AimedShotRank1 = 19434,
	AimedShotRank2 = 20900,
	AimedShotRank3 = 20901,
	AimedShotRank4 = 20902,
	AimedShotRank5 = 20903,
	AimedShotRank6 = 20904,
	AimedShotRank7 = 27065,
	ArcaneShotRank1 = 3044,
	ArcaneShotRank2 = 14281,
	ArcaneShotRank3 = 14282,
	ArcaneShotRank4 = 14283,
	ArcaneShotRank5 = 14284,
	ArcaneShotRank6 = 14285,
	ArcaneShotRank7 = 14286,
	ArcaneShotRank8 = 14287,
	ArcaneShotRank9 = 27019, -- TBC rank (level 60)
	DistractingShotRank1 = 20736,
	DistractingShotRank2 = 14274,
	DistractingShotRank3 = 15629,
	DistractingShotRank4 = 15630,
	DistractingShotRank5 = 15631,
	DistractingShotRank6 = 15632,
	HuntersMarkRank1 = 1130,
	HuntersMarkRank2 = 14323,
	HuntersMarkRank3 = 14324,
	HuntersMarkRank4 = 14325,
	SteadyShotRank1 = 34120,
	MultiShotRank1 = 2643,
	MultiShotRank2 = 14288,
	MultiShotRank3 = 14289,
	MultiShotRank4 = 14290,
	MultiShotRank5 = 27021, -- TBC rank (level 60)
	ScorpidStingRank1 = 3043,
	ScorpidStingRank2 = 14275,
	ScorpidStingRank3 = 14276,
	ScorpidStingRank4 = 14277,
	SerpentStingRank1 = 1978,
	SerpentStingRank2 = 13549,
	SerpentStingRank3 = 13550,
	SerpentStingRank4 = 13551,
	SerpentStingRank5 = 13552,
	SerpentStingRank6 = 13553,
	SerpentStingRank7 = 13554,
	SerpentStingRank8 = 13555,
	SerpentStingRank9 = 25295,
	SerpentStingRank10 = 27016, -- TBC rank (level 60)
	TrueshotAuraRank1 = 19506,
	TrueshotAuraRank2 = 20905,
	TrueshotAuraRank3 = 20906,
	ViperStingRank1 = 3034,
	ViperStingRank2 = 14279,
	ViperStingRank3 = 14280,
	VolleyRank1 = 1510,
	VolleyRank2 = 14294,
	VolleyRank3 = 14295,
	VolleyRank4 = 27022, -- TBC rank (level 60)
--Survival
	CounterattackRank1 = 19306,
	CounterattackRank2 = 20909,
	CounterattackRank3 = 20910,
	DisengageRank1 = 781,
	DisengageRank2 = 14272,
	DisengageRank3 = 14273,
	ExplosiveTrapRank1 = 13813,
	ExplosiveTrapRank2 = 14316,
	ExplosiveTrapRank3 = 14317,
	ExplosiveTrapRank4 = 27025,
	ImmolationTrapRank1 = 13795,
	ImmolationTrapRank2 = 14302,
	ImmolationTrapRank3 = 14303,
	ImmolationTrapRank4 = 14304,
	ImmolationTrapRank5 = 14305,
	ImmolationTrapRank6 = 27023,
	FreezingTrapRank1 = 1499,
	FreezingTrapRank2 = 14310,
	FreezingTrapRank3 = 14311,
	MongooseBiteRank1 = 1495,
	MongooseBiteRank2 = 14269,
	MongooseBiteRank3 = 14270,
	MongooseBiteRank4 = 14271,
	RaptorStrikeRank1 = 2973,
	RaptorStrikeRank2 = 14260,
	RaptorStrikeRank3 = 14261,
	RaptorStrikeRank4 = 14262,
	RaptorStrikeRank5 = 14263,
	RaptorStrikeRank6 = 14264,
	RaptorStrikeRank7 = 14265,
	RaptorStrikeRank8 = 14266,
	RaptorStrikeRank9 = 27014,
	WingClipRank1 = 2974,
	WingClipRank2 = 14267,
	WingClipRank3 = 14268,
	WyvernStingRank1 = 19386,
	WyvernStingRank2 = 24132,
	WyvernStingRank3 = 24133,
}
-- NOTE: Talent indices must match GetTalentInfo(tab, index) positions for TBC.
-- Run /script ConROC:PopulateTalentIDs() in-game to verify these indices.
ids.BeastMastery_Talent = {
	ImprovedAspectoftheHawk = 1,
	EnduranceTraining = 2,
	FocusedFire = 3,
	ImprovedAspectoftheMonkey = 4,
	ThickHide = 5,
	ImprovedRevivePet = 6,
	Pathfinding = 7,
	BestialSwiftness = 8,
	UnleashedFury = 9,
	ImprovedMendPet = 10,
	Ferocity = 11,
	SpiritBond = 12,
	Intimidation = 13,
	BestialDiscipline = 14,
	AnimalHandler = 15,
	Frenzy = 16,
	FerociousInspiration = 17,
	BestialWrath = 18,
	CatlikeReflexes = 19,
	SerpentsSwiftness = 20,
	TheBeastWithin = 21,
}
ids.Marksmanship_Talent = {
	ImprovedConcussiveShot = 1,
	LethalShots = 2,
	ImprovedHuntersMark = 3,
	Efficiency = 4,
	GofortheThroat = 5,
	ImprovedArcaneShot = 6,
	AimedShot = 7,
	RapidKilling = 8,
	ImprovedStings = 9,
	MortalShots = 10,
	ConcussiveBarrage = 11,
	ScatterShot = 12,
	Barrage = 13,
	CombatExperience = 14,
	RangedWeaponSpecialization = 15,
	CarefulAim = 16,
	TrueshotAura = 17,
	ImprovedBarrage = 18,
	MasterMarksman = 19,
	SilencingShot = 20,
}
ids.Survival_Talent = {
	MonsterSlaying = 1,
	HumanoidSlaying = 2,
	HawkEye = 3,
	SavageStrikes = 4,
	Entrapment = 5,
	Deflection = 6,
	ImprovedWingClip = 7,
	CleverTraps = 8,
	Survivalist = 9,
	Deterrence = 10,
	TrapMastery = 11,
	Surefooted = 12,
	ImprovedFeignDeath = 13,
	SurvivalInstincts = 14,
	KillerInstinct = 15,
	Counterattack = 16,
	Resourcefulness = 17,
	LightningReflexes = 18,
	ThrilloftheHunt = 19,
	WyvernSting = 20,
	ExposeWeakness = 21,
	MasterTactician = 22,
	Readiness = 23,
}
--Pet
ids.Pet = {

}
-- Auras
ids.Buff = {

}
ids.Debuff = {

}
function ConROC:UpdateSpellID()
--Beast Mastery
	if IsSpellKnown(ids.Rank.AspectoftheHawkRank7) then ids.Ability.AspectoftheHawk = ids.Rank.AspectoftheHawkRank7;
	elseif IsSpellKnown(ids.Rank.AspectoftheHawkRank6) then ids.Ability.AspectoftheHawk = ids.Rank.AspectoftheHawkRank6;
	elseif IsSpellKnown(ids.Rank.AspectoftheHawkRank5) then ids.Ability.AspectoftheHawk = ids.Rank.AspectoftheHawkRank5;
	elseif IsSpellKnown(ids.Rank.AspectoftheHawkRank4) then ids.Ability.AspectoftheHawk = ids.Rank.AspectoftheHawkRank4;
	elseif IsSpellKnown(ids.Rank.AspectoftheHawkRank3) then ids.Ability.AspectoftheHawk = ids.Rank.AspectoftheHawkRank3;
	elseif IsSpellKnown(ids.Rank.AspectoftheHawkRank2) then ids.Ability.AspectoftheHawk = ids.Rank.AspectoftheHawkRank2; end

	if IsSpellKnown(ids.Rank.AspectoftheWildRank2) then ids.Ability.AspectoftheWild = ids.Rank.AspectoftheWildRank2; end

	if IsSpellKnown(ids.Rank.ScareBeastRank3) then ids.Ability.ScareBeast = ids.Rank.ScareBeastRank3;
	elseif IsSpellKnown(ids.Rank.ScareBeastRank2) then ids.Ability.ScareBeast = ids.Rank.ScareBeastRank2; end

	if IsSpellKnown(ids.Rank.MendPetRank8) then ids.Ability.MendPet = ids.Rank.MendPetRank8;
	elseif IsSpellKnown(ids.Rank.MendPetRank7) then ids.Ability.MendPet = ids.Rank.MendPetRank7;
	elseif IsSpellKnown(ids.Rank.MendPetRank6) then ids.Ability.MendPet = ids.Rank.MendPetRank6;
	elseif IsSpellKnown(ids.Rank.MendPetRank5) then ids.Ability.MendPet = ids.Rank.MendPetRank5;
	elseif IsSpellKnown(ids.Rank.MendPetRank4) then ids.Ability.MendPet = ids.Rank.MendPetRank4;
	elseif IsSpellKnown(ids.Rank.MendPetRank3) then ids.Ability.MendPet = ids.Rank.MendPetRank3;
	elseif IsSpellKnown(ids.Rank.MendPetRank2) then ids.Ability.MendPet = ids.Rank.MendPetRank2; end

--Marksmanship
	if IsSpellKnown(ids.Rank.AimedShotRank7) then ids.Ability.AimedShot = ids.Rank.AimedShotRank7;
	elseif IsSpellKnown(ids.Rank.AimedShotRank6) then ids.Ability.AimedShot = ids.Rank.AimedShotRank6;
	elseif IsSpellKnown(ids.Rank.AimedShotRank5) then ids.Ability.AimedShot = ids.Rank.AimedShotRank5;
	elseif IsSpellKnown(ids.Rank.AimedShotRank4) then ids.Ability.AimedShot = ids.Rank.AimedShotRank4;
	elseif IsSpellKnown(ids.Rank.AimedShotRank3) then ids.Ability.AimedShot = ids.Rank.AimedShotRank3;
	elseif IsSpellKnown(ids.Rank.AimedShotRank2) then ids.Ability.AimedShot = ids.Rank.AimedShotRank2; end

	if IsSpellKnown(ids.Rank.ArcaneShotRank9) then ids.Ability.ArcaneShot = ids.Rank.ArcaneShotRank9;
	elseif IsSpellKnown(ids.Rank.ArcaneShotRank8) then ids.Ability.ArcaneShot = ids.Rank.ArcaneShotRank8;
	elseif IsSpellKnown(ids.Rank.ArcaneShotRank7) then ids.Ability.ArcaneShot = ids.Rank.ArcaneShotRank7;
	elseif IsSpellKnown(ids.Rank.ArcaneShotRank6) then ids.Ability.ArcaneShot = ids.Rank.ArcaneShotRank6;
	elseif IsSpellKnown(ids.Rank.ArcaneShotRank5) then ids.Ability.ArcaneShot = ids.Rank.ArcaneShotRank5;
	elseif IsSpellKnown(ids.Rank.ArcaneShotRank4) then ids.Ability.ArcaneShot = ids.Rank.ArcaneShotRank4;
	elseif IsSpellKnown(ids.Rank.ArcaneShotRank3) then ids.Ability.ArcaneShot = ids.Rank.ArcaneShotRank3;
	elseif IsSpellKnown(ids.Rank.ArcaneShotRank2) then ids.Ability.ArcaneShot = ids.Rank.ArcaneShotRank2; end

	if IsSpellKnown(ids.Rank.DistractingShotRank6) then ids.Ability.DistractingShot = ids.Rank.DistractingShotRank6;
	elseif IsSpellKnown(ids.Rank.DistractingShotRank5) then ids.Ability.DistractingShot = ids.Rank.DistractingShotRank5;
	elseif IsSpellKnown(ids.Rank.DistractingShotRank4) then ids.Ability.DistractingShot = ids.Rank.DistractingShotRank4;
	elseif IsSpellKnown(ids.Rank.DistractingShotRank3) then ids.Ability.DistractingShot = ids.Rank.DistractingShotRank3;
	elseif IsSpellKnown(ids.Rank.DistractingShotRank2) then ids.Ability.DistractingShot = ids.Rank.DistractingShotRank2; end

	if IsSpellKnown(ids.Rank.HuntersMarkRank4) then ids.Ability.HuntersMark = ids.Rank.HuntersMarkRank4;
	elseif IsSpellKnown(ids.Rank.HuntersMarkRank3) then ids.Ability.HuntersMark = ids.Rank.HuntersMarkRank3;
	elseif IsSpellKnown(ids.Rank.HuntersMarkRank2) then ids.Ability.HuntersMark = ids.Rank.HuntersMarkRank2; end

	if IsSpellKnown(ids.Rank.MultiShotRank5) then ids.Ability.MultiShot = ids.Rank.MultiShotRank5;
	elseif IsSpellKnown(ids.Rank.MultiShotRank4) then ids.Ability.MultiShot = ids.Rank.MultiShotRank4;
	elseif IsSpellKnown(ids.Rank.MultiShotRank3) then ids.Ability.MultiShot = ids.Rank.MultiShotRank3;
	elseif IsSpellKnown(ids.Rank.MultiShotRank2) then ids.Ability.MultiShot = ids.Rank.MultiShotRank2; end

	if IsSpellKnown(ids.Rank.ScorpidStingRank4) then ids.Ability.ScorpidSting = ids.Rank.ScorpidStingRank4;
	elseif IsSpellKnown(ids.Rank.ScorpidStingRank3) then ids.Ability.ScorpidSting = ids.Rank.ScorpidStingRank3;
	elseif IsSpellKnown(ids.Rank.ScorpidStingRank2) then ids.Ability.ScorpidSting = ids.Rank.ScorpidStingRank2; end

	if IsSpellKnown(ids.Rank.SerpentStingRank10) then ids.Ability.SerpentSting = ids.Rank.SerpentStingRank10;
	elseif IsSpellKnown(ids.Rank.SerpentStingRank9) then ids.Ability.SerpentSting = ids.Rank.SerpentStingRank9;
	elseif IsSpellKnown(ids.Rank.SerpentStingRank8) then ids.Ability.SerpentSting = ids.Rank.SerpentStingRank8;
	elseif IsSpellKnown(ids.Rank.SerpentStingRank7) then ids.Ability.SerpentSting = ids.Rank.SerpentStingRank7;
	elseif IsSpellKnown(ids.Rank.SerpentStingRank6) then ids.Ability.SerpentSting = ids.Rank.SerpentStingRank6;
	elseif IsSpellKnown(ids.Rank.SerpentStingRank5) then ids.Ability.SerpentSting = ids.Rank.SerpentStingRank5;
	elseif IsSpellKnown(ids.Rank.SerpentStingRank4) then ids.Ability.SerpentSting = ids.Rank.SerpentStingRank4;
	elseif IsSpellKnown(ids.Rank.SerpentStingRank3) then ids.Ability.SerpentSting = ids.Rank.SerpentStingRank3;
	elseif IsSpellKnown(ids.Rank.SerpentStingRank2) then ids.Ability.SerpentSting = ids.Rank.SerpentStingRank2; end

	if IsSpellKnown(ids.Rank.TrueshotAuraRank3) then ids.Ability.TrueshotAura = ids.Rank.TrueshotAuraRank3;
	elseif IsSpellKnown(ids.Rank.TrueshotAuraRank2) then ids.Ability.TrueshotAura = ids.Rank.TrueshotAuraRank2; end

	if IsSpellKnown(ids.Rank.ViperStingRank3) then ids.Ability.ViperSting = ids.Rank.ViperStingRank3;
	elseif IsSpellKnown(ids.Rank.ViperStingRank2) then ids.Ability.ViperSting = ids.Rank.ViperStingRank2; end

	if IsSpellKnown(ids.Rank.VolleyRank4) then ids.Ability.Volley = ids.Rank.VolleyRank4;
	elseif IsSpellKnown(ids.Rank.VolleyRank3) then ids.Ability.Volley = ids.Rank.VolleyRank3;
	elseif IsSpellKnown(ids.Rank.VolleyRank2) then ids.Ability.Volley = ids.Rank.VolleyRank2; end

--Survival
	if IsSpellKnown(ids.Rank.CounterattackRank3) then ids.Ability.Counterattack = ids.Rank.CounterattackRank3;
	elseif IsSpellKnown(ids.Rank.CounterattackRank2) then ids.Ability.Counterattack = ids.Rank.CounterattackRank2; end

	if IsSpellKnown(ids.Rank.DisengageRank3) then ids.Ability.Disengage = ids.Rank.DisengageRank3;
	elseif IsSpellKnown(ids.Rank.DisengageRank2) then ids.Ability.Disengage = ids.Rank.DisengageRank2; end

	if IsSpellKnown(ids.Rank.ExplosiveTrapRank4) then ids.Ability.ExplosiveTrap = ids.Rank.ExplosiveTrapRank4;
	elseif IsSpellKnown(ids.Rank.ExplosiveTrapRank3) then ids.Ability.ExplosiveTrap = ids.Rank.ExplosiveTrapRank3;
	elseif IsSpellKnown(ids.Rank.ExplosiveTrapRank2) then ids.Ability.ExplosiveTrap = ids.Rank.ExplosiveTrapRank2;
	elseif IsSpellKnown(ids.Rank.ExplosiveTrapRank1) then ids.Ability.ExplosiveTrap = ids.Rank.ExplosiveTrapRank1; end

	if IsSpellKnown(ids.Rank.FreezingTrapRank3) then ids.Ability.FreezingTrap = ids.Rank.FreezingTrapRank3;
	elseif IsSpellKnown(ids.Rank.FreezingTrapRank2) then ids.Ability.FreezingTrap = ids.Rank.FreezingTrapRank2;
	elseif IsSpellKnown(ids.Rank.FreezingTrapRank1) then ids.Ability.FreezingTrap = ids.Rank.FreezingTrapRank1; end

	if IsSpellKnown(ids.Rank.ImmolationTrapRank6) then ids.Ability.ImmolationTrap = ids.Rank.ImmolationTrapRank6;
	elseif IsSpellKnown(ids.Rank.ImmolationTrapRank5) then ids.Ability.ImmolationTrap = ids.Rank.ImmolationTrapRank5;
	elseif IsSpellKnown(ids.Rank.ImmolationTrapRank4) then ids.Ability.ImmolationTrap = ids.Rank.ImmolationTrapRank4;
	elseif IsSpellKnown(ids.Rank.ImmolationTrapRank3) then ids.Ability.ImmolationTrap = ids.Rank.ImmolationTrapRank3;
	elseif IsSpellKnown(ids.Rank.ImmolationTrapRank2) then ids.Ability.ImmolationTrap = ids.Rank.ImmolationTrapRank2;
	elseif IsSpellKnown(ids.Rank.ImmolationTrapRank1) then ids.Ability.ImmolationTrap = ids.Rank.ImmolationTrapRank1; end

	if IsSpellKnown(ids.Rank.MongooseBiteRank4) then ids.Ability.MongooseBite = ids.Rank.MongooseBiteRank4;
	elseif IsSpellKnown(ids.Rank.MongooseBiteRank3) then ids.Ability.MongooseBite = ids.Rank.MongooseBiteRank3;
	elseif IsSpellKnown(ids.Rank.MongooseBiteRank2) then ids.Ability.MongooseBite = ids.Rank.MongooseBiteRank2; end

	if IsSpellKnown(ids.Rank.RaptorStrikeRank9) then ids.Ability.RaptorStrike = ids.Rank.RaptorStrikeRank9;
	elseif IsSpellKnown(ids.Rank.RaptorStrikeRank8) then ids.Ability.RaptorStrike = ids.Rank.RaptorStrikeRank8;
	elseif IsSpellKnown(ids.Rank.RaptorStrikeRank7) then ids.Ability.RaptorStrike = ids.Rank.RaptorStrikeRank7;
	elseif IsSpellKnown(ids.Rank.RaptorStrikeRank6) then ids.Ability.RaptorStrike = ids.Rank.RaptorStrikeRank6;
	elseif IsSpellKnown(ids.Rank.RaptorStrikeRank5) then ids.Ability.RaptorStrike = ids.Rank.RaptorStrikeRank5;
	elseif IsSpellKnown(ids.Rank.RaptorStrikeRank4) then ids.Ability.RaptorStrike = ids.Rank.RaptorStrikeRank4;
	elseif IsSpellKnown(ids.Rank.RaptorStrikeRank3) then ids.Ability.RaptorStrike = ids.Rank.RaptorStrikeRank3;
	elseif IsSpellKnown(ids.Rank.RaptorStrikeRank2) then ids.Ability.RaptorStrike = ids.Rank.RaptorStrikeRank2;
	elseif IsSpellKnown(ids.Rank.RaptorStrikeRank1) then ids.Ability.RaptorStrike = ids.Rank.RaptorStrikeRank1; end

	if IsSpellKnown(ids.Rank.WingClipRank3) then ids.Ability.WingClip = ids.Rank.WingClipRank3;
	elseif IsSpellKnown(ids.Rank.WingClipRank2) then ids.Ability.WingClip = ids.Rank.WingClipRank2; end

	if IsSpellKnown(ids.Rank.WyvernStingRank3) then ids.Ability.WyvernSting = ids.Rank.WyvernStingRank3;
	elseif IsSpellKnown(ids.Rank.WyvernStingRank2) then ids.Ability.WyvernSting = ids.Rank.WyvernStingRank2;
	elseif IsSpellKnown(ids.Rank.WyvernStingRank1) then ids.Ability.WyvernSting = ids.Rank.WyvernStingRank1; end
end
