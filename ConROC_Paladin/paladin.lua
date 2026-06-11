ConROC.Paladin = {};

local ConROC_Paladin, ids = ...;

function ConROC:EnableRotationModule()
	self.Description = "Paladin";
	self.NextSpell = ConROC.Paladin.Damage;

	self:RegisterEvent('UNIT_SPELLCAST_SUCCEEDED');
	self.lastSpellId = 0;

	if ConROCSpellmenuClass == nil then
		ConROC:SpellmenuClass();
	end
end

function ConROC:EnableDefenseModule()
	self.NextDef = ConROC.Paladin.Defense;
end

function ConROC:UNIT_SPELLCAST_SUCCEEDED(event, unitID, lineID, spellID)
	if unitID == 'player' then
		self.lastSpellId = spellID;
	end

	ConROC:JustCasted(spellID);
end

local Racial, Spec, Ability, Rank, Holy_Talent, Prot_Talent, Ret_Talent, Buff, Debuff = ids.Racial, ids.Spec, ids.Ability, ids.Rank, ids.Holy_Talent, ids.Protection_Talent, ids.Retribution_Talent, ids.Buff, ids.Debuff;
local consecEXP = 0;

--Info
local _Player_Spec, _Player_Spec_ID = ConROC:currentSpec();
local _Player_Level = UnitLevel("player");
local _Player_Percent_Health = ConROC:PercentHealth('player');
local _is_PvP = ConROC:IsPvP();
local _in_combat = UnitAffectingCombat('player');
local _party_size = GetNumGroupMembers();
local _is_PC = UnitPlayerControlled("target");
local _is_Enemy = ConROC:TarHostile();
local _Target_Health = UnitHealth('target');
local _Target_Percent_Health = ConROC:PercentHealth('target');

--Resources
local _Mana, _Mana_Max = ConROC:PlayerPower('Mana');

--Conditions
local _Queue = 0;
local _is__is_moving = ConROC:PlayerSpeed();
local _enemies_in_melee, _target_in_melee = ConROC:Targets("Melee");
local _enemies_in_10yrds, _target_in_10yrds = ConROC:Targets("10");
local _enemies_in_20yrds, _target_in_20yrds = ConROC:Targets("20");
local _enemies_in_40yrds, _target_in_40yrds = ConROC:Targets("40");
local _can_Execute = _Target_Percent_Health < 20;

--Racials
local _Perception, _Perception_RDY = _, _;

-- Talent detection
local _Player_Faction = UnitFactionGroup("player"); -- "Alliance" or "Horde"

function ConROC:Stats()
	_Player_Spec, _Player_Spec_ID = ConROC:currentSpec();
	_Player_Level = UnitLevel("player");
	_Player_Percent_Health = ConROC:PercentHealth('player');
	_is_PvP = ConROC:IsPvP();
	_in_combat = UnitAffectingCombat('player');
	_party_size = GetNumGroupMembers();
	_is_PC = UnitPlayerControlled("target");
	_is_Enemy = ConROC:TarHostile();
	_Target_Health = UnitHealth('target');
	_Target_Percent_Health = ConROC:PercentHealth('target');

	_Mana, _Mana_Max = ConROC:PlayerPower('Mana');

	_Queue = 0;
	_is_moving = ConROC:PlayerSpeed();
	_enemies_in_melee, _target_in_melee = ConROC:Targets("Melee");
	_enemies_in_10yrds, _target_in_10yrds = ConROC:Targets("10");
	_enemies_in_20yrds, _target_in_20yrds = ConROC:Targets("20");
	_enemies_in_40yrds, _target_in_40yrds = ConROC:Targets("40");
	_can_Execute = _Target_Percent_Health < 20;

	_Perception, _Perception_RDY = ConROC:AbilityReady(Racial.Perception, timeShift);
end

function ConROC.Paladin.Damage(_, timeShift, currentSpell, gcd)
	ConROC:UpdateSpellID();
	wipe(ConROC.SuggestedSpells);
	ConROC:Stats();

--Abilities	
	local _BlessingofMight, _BlessingofMight_RDY = ConROC:AbilityReady(Ability.BlessingofMight, timeShift);
		local _BlessingofMight_BUFF = ConROC:Aura(_BlessingofMight, timeShift);
	local _GreaterBlessingofMight, _GreaterBlessingofMight_RDY = ConROC:AbilityReady(Ability.GreaterBlessingofMight, timeShift);
		local _GreaterBlessingofMight_BUFF = ConROC:Aura(_GreaterBlessingofMight, timeShift);
	local _BlessingofWisdom, _BlessingofWisdom_RDY = ConROC:AbilityReady(Ability.BlessingofWisdom, timeShift);
		local _BlessingofWisdom_BUFF = ConROC:Aura(_BlessingofWisdom, timeShift);
	local _GreaterBlessingofWisdom, _GreaterBlessingofWisdom_RDY = ConROC:AbilityReady(Ability.GreaterBlessingofWisdom, timeShift);
		local _GreaterBlessingofWisdom_BUFF = ConROC:Aura(_GreaterBlessingofWisdom, timeShift);
	local _BlessingofKings, _BlessingofKings_RDY = ConROC:AbilityReady(Ability.BlessingofKings, timeShift);
		local _BlessingofKings_BUFF = ConROC:Aura(_BlessingofKings, timeShift);
	local _GreaterBlessingofKings, _GreaterBlessingofKings_RDY = ConROC:AbilityReady(Ability.GreaterBlessingofKings, timeShift);
		local _GreaterBlessingofKings_BUFF = ConROC:Aura(_GreaterBlessingofKings, timeShift);
	local _BlessingofSalvation, _BlessingofSalvation_RDY = ConROC:AbilityReady(Ability.BlessingofSalvation, timeShift);
		local _BlessingofSalvation_BUFF = ConROC:Aura(_BlessingofSalvation, timeShift);
	local _Consecration, _Consecration_RDY = ConROC:AbilityReady(Ability.Consecration, timeShift);
		local _Consecration_DUR = consecEXP - GetTime();
	local _HolyWrath, _HolyWrath_RDY = ConROC:AbilityReady(Ability.HolyWrath, timeShift);
	local _HolyShield, _HolyShield_RDY = ConROC:AbilityReady(Ability.HolyShield, timeShift);
		local _HolyShield_BUFF = ConROC:Aura(_HolyShield, timeShift);
	local _GreaterBlessingofSalvation, _GreaterBlessingofSalvation_RDY = ConROC:AbilityReady(Ability.GreaterBlessingofSalvation, timeShift);
		local _GreaterBlessingofSalvation_BUFF = ConROC:Aura(_GreaterBlessingofSalvation, timeShift);
	local _BlessingofSanctuary, _BlessingofSanctuary_RDY = ConROC:AbilityReady(Ability.BlessingofSanctuary, timeShift);
		local _BlessingofSanctuary_BUFF = ConROC:Aura(_BlessingofSanctuary, timeShift);
	local _GreaterBlessingofSanctuary, _GreaterBlessingofSanctuary_RDY = ConROC:AbilityReady(Ability.GreaterBlessingofSanctuary, timeShift);
		local _GreaterBlessingofSanctuary_BUFF = ConROC:Aura(_GreaterBlessingofSanctuary, timeShift);

	local _BlessingofLight, _BlessingofLight_RDY = ConROC:AbilityReady(Ability.BlessingofLight, timeShift);
		local _BlessingofLight_BUFF = ConROC:Aura(_BlessingofLight, timeShift);
	local _Judgement, _Judgement_RDY, judgeCD, judgeMCD = ConROC:AbilityReady(Ability.Judgement, timeShift);
	local _SealoftheCrusader, _SealoftheCrusader_RDY = ConROC:AbilityReady(Ability.SealoftheCrusader, timeShift);
		local _SealoftheCrusader_BUFF = ConROC:Aura(_SealoftheCrusader, timeShift);
		local _JudgementoftheCrusader_DEBUFF = ConROC:TargetAura(Debuff.JudgementoftheCrusader, timeShift);
	local _SealofJustice, _SealofJustice_RDY = ConROC:AbilityReady(Ability.SealofJustice, timeShift);
		local _SealofJustice_BUFF = ConROC:Aura(_SealofJustice, timeShift);
		local _JudgementofJustice_DEBUFF = ConROC:TargetAura(Debuff.JudgementofJustice, timeShift);
	local _SealofLight, _SealofLight_RDY = ConROC:AbilityReady(Ability.SealofLight, timeShift);
		local _SealofLight_BUFF = ConROC:Aura(_SealofLight, timeShift);
		local _JudgementofLight_DEBUFF = ConROC:TargetAura(Debuff.JudgementofLight, timeShift);
	local _SealofWisdom, _SealofWisdom_RDY = ConROC:AbilityReady(Ability.SealofWisdom, timeShift);
		local _SealofWisdom_BUFF = ConROC:Aura(_SealofWisdom, timeShift);
		local _JudgementofWisdom_DEBUFF = ConROC:TargetAura(Debuff.JudgementofWisdom, timeShift);
	local _SealofRighteousness, _SealofRighteousness_RDY = ConROC:AbilityReady(Ability.SealofRighteousness, timeShift);
		local _SealofRighteousness_BUFF, _, _SealofRighteousness_DUR = ConROC:Aura(_SealofRighteousness, timeShift);
	local _SealofCommand, _SealofCommand_RDY = ConROC:AbilityReady(Ability.SealofCommand, timeShift);
		local _SealofCommand_BUFF = ConROC:Aura(_SealofCommand, timeShift);
		
	-- TBC Seals - Faction specific
	local _SealofBlood, _SealofBlood_RDY = ConROC:AbilityReady(Ability.SealofBlood, timeShift);
		local _SealofBlood_BUFF = ConROC:Aura(_SealofBlood, timeShift);
		local _JudgementofBlood_DEBUFF = ConROC:TargetAura(Debuff.JudgementofBlood, timeShift);
	local _SealofVengeance, _SealofVengeance_RDY = ConROC:AbilityReady(Ability.SealofVengeance, timeShift);
		local _SealofVengeance_BUFF = ConROC:Aura(_SealofVengeance, timeShift);
		local _JudgementofVengeance_DEBUFF = ConROC:TargetAura(Debuff.JudgementofVengeance, timeShift);
		
	local _Exorcism, _Exorcism_RDY = ConROC:AbilityReady(Ability.Exorcism, timeShift);
	local _HammerofJustice, _HammerofJustice_RDY = ConROC:AbilityReady(Ability.HammerofJustice, timeShift);
	local _HammerofWrath, _HammerofWrath_RDY = ConROC:AbilityReady(Ability.HammerofWrath, timeShift);

--TBC Abilities
	local _AvengersShield, _AvengersShield_RDY = ConROC:AbilityReady(Ability.AvengersShield, timeShift);
	local _CrusaderStrike, _CrusaderStrike_RDY = ConROC:AbilityReady(Ability.CrusaderStrike, timeShift);
	local _RighteousDefense, _RighteousDefense_RDY = ConROC:AbilityReady(Ability.RighteousDefense, timeShift);

--Conditions
	local _Can_Exorcist = ConROC:CreatureType("Undead") or ConROC:CreatureType("Demon");
	local isAutoAttacking = IsPlayerAttacking("target");
	local twohandIDs = {1,5,6,8,10} --Two-Handed Axes, Two-Handed Maces, Polearms, Two-Handed Swords, Staves
	local has2HandID = ConROC:Equipped(twohandIDs, "MAINHANDSLOT")
	local hasShield = ConROC:Equipped('Shields', 'SECONDARYHANDSLOT')
	
	-- Mana efficiency thresholds
	local _Mana_Percent = (_Mana / _Mana_Max) * 100
	local _Low_Mana = _Mana_Percent < 30  -- Below 30% mana
	local _Medium_Mana = _Mana_Percent >= 30 and _Mana_Percent < 60  -- 30-60% mana
	local _High_Mana = _Mana_Percent >= 60  -- Above 60% mana

	local judgeDebuff = {
		_JudgementoftheCrusader_DEBUFF,
        _JudgementofJustice_DEBUFF,
		_JudgementofLight_DEBUFF,
        _JudgementofWisdom_DEBUFF,
		_JudgementofBlood_DEBUFF,
		_JudgementofVengeance_DEBUFF,
    }

	local judgeUp = false;
	for k, v in pairs(judgeDebuff) do
		if v then
			judgeUp = true;
			break
		end
	end

	
	-- Determine optimal seal based on spec and faction
	local _OptimalSeal = nil
	local _OptimalSeal_RDY = false
	local _OptimalSeal_BUFF = false
	
	if _Player_Spec_ID == Spec.Retribution then
		-- Emergency: Use Seal of Wisdom when very low mana (below 20%)
		if _Mana_Percent < 20 and _SealofWisdom_RDY then
			_OptimalSeal = _SealofWisdom
			_OptimalSeal_RDY = _SealofWisdom_RDY
			_OptimalSeal_BUFF = _SealofWisdom_BUFF
		-- Ret uses Command if available (2H), otherwise Blood/Vengeance
		elseif _SealofCommand_RDY and has2HandID then
			_OptimalSeal = _SealofCommand
			_OptimalSeal_RDY = _SealofCommand_RDY
			_OptimalSeal_BUFF = _SealofCommand_BUFF
		elseif _Player_Faction == "Horde" and _SealofBlood_RDY then
			_OptimalSeal = _SealofBlood
			_OptimalSeal_RDY = _SealofBlood_RDY
			_OptimalSeal_BUFF = _SealofBlood_BUFF
		elseif _Player_Faction == "Alliance" and _SealofVengeance_RDY then
			_OptimalSeal = _SealofVengeance
			_OptimalSeal_RDY = _SealofVengeance_RDY
			_OptimalSeal_BUFF = _SealofVengeance_BUFF
		else
			-- Fallback to Righteousness
			_OptimalSeal = _SealofRighteousness
			_OptimalSeal_RDY = _SealofRighteousness_RDY
			_OptimalSeal_BUFF = _SealofRighteousness_BUFF
		end
	elseif _Player_Spec_ID == Spec.Protection then
		-- Prot uses Righteousness or Vengeance (for threat)
		if _Player_Faction == "Alliance" and _SealofVengeance_RDY then
			_OptimalSeal = _SealofVengeance
			_OptimalSeal_RDY = _SealofVengeance_RDY
			_OptimalSeal_BUFF = _SealofVengeance_BUFF
		else
			_OptimalSeal = _SealofRighteousness
			_OptimalSeal_RDY = _SealofRighteousness_RDY
			_OptimalSeal_BUFF = _SealofRighteousness_BUFF
		end
	else -- Holy
		-- Holy uses Wisdom for mana or Righteousness for damage while solo
		if _in_combat and _is_Enemy then
			_OptimalSeal = _SealofRighteousness
			_OptimalSeal_RDY = _SealofRighteousness_RDY
			_OptimalSeal_BUFF = _SealofRighteousness_BUFF
		else
			_OptimalSeal = _SealofWisdom
			_OptimalSeal_RDY = _SealofWisdom_RDY
			_OptimalSeal_BUFF = _SealofWisdom_BUFF
		end
	end
	
	-- Determine optimal judgement based on spec and available abilities
	local _OptimalJudgement_Seal = nil
	local _OptimalJudgement_Seal_RDY = false
	local _OptimalJudgement_Seal_BUFF = false
	local _OptimalJudgement_DEBUFF = false
	
	if _Player_Spec_ID == Spec.Retribution then
		-- Ret prioritizes Blood/Vengeance for DPS, falls back to Crusader
		if _Player_Faction == "Horde" and _SealofBlood_RDY then
			_OptimalJudgement_Seal = _SealofBlood
			_OptimalJudgement_Seal_RDY = _SealofBlood_RDY
			_OptimalJudgement_Seal_BUFF = _SealofBlood_BUFF
			_OptimalJudgement_DEBUFF = _JudgementofBlood_DEBUFF
		elseif _Player_Faction == "Alliance" and _SealofVengeance_RDY then
			_OptimalJudgement_Seal = _SealofVengeance
			_OptimalJudgement_Seal_RDY = _SealofVengeance_RDY
			_OptimalJudgement_Seal_BUFF = _SealofVengeance_BUFF
			_OptimalJudgement_DEBUFF = _JudgementofVengeance_DEBUFF
		elseif _SealoftheCrusader_RDY then
			-- Fallback to Crusader for AP debuff before level 64
			_OptimalJudgement_Seal = _SealoftheCrusader
			_OptimalJudgement_Seal_RDY = _SealoftheCrusader_RDY
			_OptimalJudgement_Seal_BUFF = _SealoftheCrusader_BUFF
			_OptimalJudgement_DEBUFF = _JudgementoftheCrusader_DEBUFF
		end
	elseif _Player_Spec_ID == Spec.Protection then
		-- Prot prioritizes Light for healing, falls back to Crusader for threat
		if _SealofLight_RDY and _party_size > 1 then
			-- Use Light in groups for healing support
			_OptimalJudgement_Seal = _SealofLight
			_OptimalJudgement_Seal_RDY = _SealofLight_RDY
			_OptimalJudgement_Seal_BUFF = _SealofLight_BUFF
			_OptimalJudgement_DEBUFF = _JudgementofLight_DEBUFF
		elseif _SealoftheCrusader_RDY then
			-- Use Crusader solo or for threat in raids
			_OptimalJudgement_Seal = _SealoftheCrusader
			_OptimalJudgement_Seal_RDY = _SealoftheCrusader_RDY
			_OptimalJudgement_Seal_BUFF = _SealoftheCrusader_BUFF
			_OptimalJudgement_DEBUFF = _JudgementoftheCrusader_DEBUFF
		end
	else -- Holy
		-- Holy prioritizes Light for healing, falls back to Wisdom for mana
		if _SealofLight_RDY then
			_OptimalJudgement_Seal = _SealofLight
			_OptimalJudgement_Seal_RDY = _SealofLight_RDY
			_OptimalJudgement_Seal_BUFF = _SealofLight_BUFF
			_OptimalJudgement_DEBUFF = _JudgementofLight_DEBUFF
		elseif _SealofWisdom_RDY then
			_OptimalJudgement_Seal = _SealofWisdom
			_OptimalJudgement_Seal_RDY = _SealofWisdom_RDY
			_OptimalJudgement_Seal_BUFF = _SealofWisdom_BUFF
			_OptimalJudgement_DEBUFF = _JudgementofWisdom_DEBUFF
		end
	end

--Indicators	
	ConROC:AbilityRaidBuffs(_BlessingofMight, ConROC:CheckBox(ConROC_SM_Bless_Might) and _BlessingofMight_RDY and not _BlessingofMight_BUFF);
	ConROC:AbilityRaidBuffs(_GreaterBlessingofMight, ConROC:CheckBox(ConROC_SM_Bless_GreaterMight) and _GreaterBlessingofMight_RDY and not _GreaterBlessingofMight_BUFF);
	ConROC:AbilityRaidBuffs(_BlessingofWisdom, ConROC:CheckBox(ConROC_SM_Bless_Wisdom) and _BlessingofWisdom_RDY and not _BlessingofWisdom_BUFF);
	ConROC:AbilityRaidBuffs(_GreaterBlessingofWisdom, ConROC:CheckBox(ConROC_SM_Bless_GreaterWisdom) and _GreaterBlessingofWisdom_RDY and not _GreaterBlessingofWisdom_BUFF);
	ConROC:AbilityRaidBuffs(_BlessingofKings, ConROC:CheckBox(ConROC_SM_Bless_Kings) and _BlessingofKings_RDY and not _BlessingofKings_BUFF);
	ConROC:AbilityRaidBuffs(_GreaterBlessingofKings, ConROC:CheckBox(ConROC_SM_Bless_GreaterKings) and _GreaterBlessingofKings_RDY and not _GreaterBlessingofKings_BUFF);
	ConROC:AbilityRaidBuffs(_BlessingofSalvation, ConROC:CheckBox(ConROC_SM_Bless_Salvation) and _BlessingofSalvation_RDY and not _BlessingofSalvation_BUFF);
	ConROC:AbilityRaidBuffs(_GreaterBlessingofSalvation, ConROC:CheckBox(ConROC_SM_Bless_GreaterSalvation) and _GreaterBlessingofSalvation_RDY and not _GreaterBlessingofSalvation_BUFF);
	ConROC:AbilityRaidBuffs(_BlessingofSanctuary, ConROC:CheckBox(ConROC_SM_Bless_Sanctuary) and _BlessingofSanctuary_RDY and not _BlessingofSanctuary_BUFF);
	ConROC:AbilityRaidBuffs(_GreaterBlessingofSanctuary, ConROC:CheckBox(ConROC_SM_Bless_GreaterSanctuary) and _GreaterBlessingofSanctuary_RDY and not _GreaterBlessingofSanctuary_BUFF);
	ConROC:AbilityRaidBuffs(_BlessingofLight, ConROC:CheckBox(ConROC_SM_Bless_Light) and _BlessingofLight_RDY and not _BlessingofLight_BUFF);

--Warnings

--Rotations
	repeat
		while(true) do
			-- Out of combat - maintain buffs
			if not _in_combat then
				-- Blessings - suggest recasting when missing (uses role-based checkboxes)
				-- Skipped entirely if "No Blessing" option is selected
				if not ConROC:CheckBox(ConROC_SM_Bless_None) then
					-- Check for greater versions first, don't suggest regular if greater is active
					if ConROC:CheckBox(ConROC_SM_Bless_Might) and _BlessingofMight_RDY and not _BlessingofMight_BUFF and not _GreaterBlessingofMight_BUFF then
						tinsert(ConROC.SuggestedSpells, _BlessingofMight);
						_BlessingofMight_RDY = false;
						_Queue = _Queue + 1;
						break;
					end
					
					if ConROC:CheckBox(ConROC_SM_Bless_Wisdom) and _BlessingofWisdom_RDY and not _BlessingofWisdom_BUFF and not _GreaterBlessingofWisdom_BUFF then
						tinsert(ConROC.SuggestedSpells, _BlessingofWisdom);
						_BlessingofWisdom_RDY = false;
						_Queue = _Queue + 1;
						break;
					end
					
					if ConROC:CheckBox(ConROC_SM_Bless_Kings) and _BlessingofKings_RDY and not _BlessingofKings_BUFF and not _GreaterBlessingofKings_BUFF then
						tinsert(ConROC.SuggestedSpells, _BlessingofKings);
						_BlessingofKings_RDY = false;
						_Queue = _Queue + 1;
						break;
					end
					
					if ConROC:CheckBox(ConROC_SM_Bless_Salvation) and _BlessingofSalvation_RDY and not _BlessingofSalvation_BUFF and not _GreaterBlessingofSalvation_BUFF then
						tinsert(ConROC.SuggestedSpells, _BlessingofSalvation);
						_BlessingofSalvation_RDY = false;
						_Queue = _Queue + 1;
						break;
					end
					
					if ConROC:CheckBox(ConROC_SM_Bless_Sanctuary) and _BlessingofSanctuary_RDY and not _BlessingofSanctuary_BUFF and not _GreaterBlessingofSanctuary_BUFF then
						tinsert(ConROC.SuggestedSpells, _BlessingofSanctuary);
						_BlessingofSanctuary_RDY = false;
						_Queue = _Queue + 1;
						break;
					end
					
					if ConROC:CheckBox(ConROC_SM_Bless_Light) and _BlessingofLight_RDY and not _BlessingofLight_BUFF then
						tinsert(ConROC.SuggestedSpells, _BlessingofLight);
						_BlessingofLight_RDY = false;
						_Queue = _Queue + 1;
						break;
					end
					
					-- Greater Blessings
					if ConROC:CheckBox(ConROC_SM_Bless_GreaterMight) and _GreaterBlessingofMight_RDY and not _GreaterBlessingofMight_BUFF then
						tinsert(ConROC.SuggestedSpells, _GreaterBlessingofMight);
						_GreaterBlessingofMight_RDY = false;
						_Queue = _Queue + 1;
						break;
					end
					
					if ConROC:CheckBox(ConROC_SM_Bless_GreaterWisdom) and _GreaterBlessingofWisdom_RDY and not _GreaterBlessingofWisdom_BUFF then
						tinsert(ConROC.SuggestedSpells, _GreaterBlessingofWisdom);
						_GreaterBlessingofWisdom_RDY = false;
						_Queue = _Queue + 1;
						break;
					end
					
					if ConROC:CheckBox(ConROC_SM_Bless_GreaterKings) and _GreaterBlessingofKings_RDY and not _GreaterBlessingofKings_BUFF then
						tinsert(ConROC.SuggestedSpells, _GreaterBlessingofKings);
						_GreaterBlessingofKings_RDY = false;
						_Queue = _Queue + 1;
						break;
					end
					
					if ConROC:CheckBox(ConROC_SM_Bless_GreaterSanctuary) and _GreaterBlessingofSanctuary_RDY and not _GreaterBlessingofSanctuary_BUFF then
						tinsert(ConROC.SuggestedSpells, _GreaterBlessingofSanctuary);
						_GreaterBlessingofSanctuary_RDY = false;
						_Queue = _Queue + 1;
						break;
					end
					
					if ConROC:CheckBox(ConROC_SM_Bless_GreaterSalvation) and _GreaterBlessingofSalvation_RDY and not _GreaterBlessingofSalvation_BUFF then
						tinsert(ConROC.SuggestedSpells, _GreaterBlessingofSalvation);
						_GreaterBlessingofSalvation_RDY = false;
						_Queue = _Queue + 1;
						break;
					end
				end
				
				-- Maintain seal out of combat - prioritize judgement seal if judging is enabled
				-- This way you're always ready to judge when you engage
				
				-- Check if user wants to judge (any judgement checkbox enabled)
				local wantsToJudgeOOC = ConROC:CheckBox(ConROC_SM_Judgement_Crusader) or
				                        ConROC:CheckBox(ConROC_SM_Judgement_Wisdom) or
				                        ConROC:CheckBox(ConROC_SM_Judgement_Light) or
				                        ConROC:CheckBox(ConROC_SM_Judgement_Justice) or
				                        ConROC:CheckBox(ConROC_SM_Judgement_Command) or
				                        ConROC:CheckBox(ConROC_SM_Judgement_Blood) or
				                        ConROC:CheckBox(ConROC_SM_Judgement_Vengeance)
				
				-- If judging is enabled, prioritize the judgement seal out of combat
				local prioritySealOOC = nil
				local prioritySealBuffOOC = false
				
				if wantsToJudgeOOC then
					-- Determine which seal to use for judging based on judgement checkbox
					if ConROC:CheckBox(ConROC_SM_Judgement_Crusader) and _SealoftheCrusader_RDY then
						prioritySealOOC = _SealoftheCrusader
						prioritySealBuffOOC = _SealoftheCrusader_BUFF
					elseif ConROC:CheckBox(ConROC_SM_Judgement_Wisdom) and _SealofWisdom_RDY then
						prioritySealOOC = _SealofWisdom
						prioritySealBuffOOC = _SealofWisdom_BUFF
					elseif ConROC:CheckBox(ConROC_SM_Judgement_Light) and _SealofLight_RDY then
						prioritySealOOC = _SealofLight
						prioritySealBuffOOC = _SealofLight_BUFF
					elseif ConROC:CheckBox(ConROC_SM_Judgement_Justice) and _SealofJustice_RDY then
						prioritySealOOC = _SealofJustice
						prioritySealBuffOOC = _SealofJustice_BUFF
					elseif ConROC:CheckBox(ConROC_SM_Judgement_Command) and _SealofCommand_RDY then
						prioritySealOOC = _SealofCommand
						prioritySealBuffOOC = _SealofCommand_BUFF
					elseif ConROC:CheckBox(ConROC_SM_Judgement_Blood) and _SealofBlood_RDY then
						prioritySealOOC = _SealofBlood
						prioritySealBuffOOC = _SealofBlood_BUFF
					elseif ConROC:CheckBox(ConROC_SM_Judgement_Vengeance) and _SealofVengeance_RDY then
						prioritySealOOC = _SealofVengeance
						prioritySealBuffOOC = _SealofVengeance_BUFF
					end
				else
					-- If not judging, check for manual DPS seal selection
					if ConROC:CheckBox(ConROC_SM_Seal_Command) and _SealofCommand_RDY then
						prioritySealOOC = _SealofCommand
						prioritySealBuffOOC = _SealofCommand_BUFF
					elseif ConROC:CheckBox(ConROC_SM_Seal_Blood) and _SealofBlood_RDY then
						prioritySealOOC = _SealofBlood
						prioritySealBuffOOC = _SealofBlood_BUFF
					elseif ConROC:CheckBox(ConROC_SM_Seal_Vengeance) and _SealofVengeance_RDY then
						prioritySealOOC = _SealofVengeance
						prioritySealBuffOOC = _SealofVengeance_BUFF
					elseif ConROC:CheckBox(ConROC_SM_Seal_Righteousness) and _SealofRighteousness_RDY then
						prioritySealOOC = _SealofRighteousness
						prioritySealBuffOOC = _SealofRighteousness_BUFF
					elseif ConROC:CheckBox(ConROC_SM_Seal_Crusader) and _SealoftheCrusader_RDY then
						prioritySealOOC = _SealoftheCrusader
						prioritySealBuffOOC = _SealoftheCrusader_BUFF
					elseif ConROC:CheckBox(ConROC_SM_Seal_Justice) and _SealofJustice_RDY then
						prioritySealOOC = _SealofJustice
						prioritySealBuffOOC = _SealofJustice_BUFF
					elseif ConROC:CheckBox(ConROC_SM_Seal_Light) and _SealofLight_RDY then
						prioritySealOOC = _SealofLight
						prioritySealBuffOOC = _SealofLight_BUFF
					elseif ConROC:CheckBox(ConROC_SM_Seal_Wisdom) and _SealofWisdom_RDY then
						prioritySealOOC = _SealofWisdom
						prioritySealBuffOOC = _SealofWisdom_BUFF
					end
				end
				
				-- Apply priority seal if missing
				if prioritySealOOC and not prioritySealBuffOOC then
					tinsert(ConROC.SuggestedSpells, prioritySealOOC);
					_Queue = _Queue + 1;
					break;
				end
				
				-- Out-of-combat judgement (when you have hostile target and judgement seal active)
				if ConROC:TarHostile() and wantsToJudgeOOC and prioritySealOOC and prioritySealBuffOOC then
					-- Check if target already has the judgement debuff
					local judgeDebuffNameOOC = nil
					if prioritySealOOC == _SealoftheCrusader then
						judgeDebuffNameOOC = "Judgement of the Crusader"
					elseif prioritySealOOC == _SealofWisdom then
						judgeDebuffNameOOC = "Judgement of Wisdom"
					elseif prioritySealOOC == _SealofLight then
						judgeDebuffNameOOC = "Judgement of Light"
					elseif prioritySealOOC == _SealofJustice then
						judgeDebuffNameOOC = "Judgement of Justice"
					elseif prioritySealOOC == _SealofCommand then
						judgeDebuffNameOOC = "Judgement of Command"
					elseif prioritySealOOC == _SealofBlood then
						judgeDebuffNameOOC = "Judgement of Blood"
					elseif prioritySealOOC == _SealofVengeance then
						judgeDebuffNameOOC = "Judgement of Vengeance"
					end
					
					local hasDebuffOOC = false
					if judgeDebuffNameOOC then
						for i = 1, 40 do
							local name = UnitDebuff("target", i, "player")
							if name == judgeDebuffNameOOC then
								hasDebuffOOC = true
								break
							end
						end
					end
					
					-- Suggest judgement if debuff is missing
					if not hasDebuffOOC and _Judgement_RDY then
						tinsert(ConROC.SuggestedSpells, _Judgement);
						_Judgement_RDY = false;
						_Queue = _Queue + 1;
						break;
					end
				end
				
				-- If no manual seal/judgement selected, use automatic selection
				if not prioritySealOOC and _OptimalSeal and _OptimalSeal_RDY and not _OptimalSeal_BUFF then
					tinsert(ConROC.SuggestedSpells, _OptimalSeal);
					_OptimalSeal_BUFF = true;
					_Queue = _Queue + 1;
					break;
				end
			end
			
			-- Execute phase - Hammer of Wrath (highest priority)
			if _can_Execute and _HammerofWrath_RDY then
				tinsert(ConROC.SuggestedSpells, _HammerofWrath);
				_HammerofWrath_RDY = false;
				_Queue = _Queue + 1;
				break;
			end
			
			-- Only suggest combat rotation if we have a hostile target
			if _in_combat and _is_Enemy then
				
				-- Judgement - HIGHEST priority (always check before seal maintenance)
				-- Suggest judging if: checkbox enabled, debuff missing, judgement ready
				-- Works regardless of whether you have a seal active or not
				local wantsToJudge = ConROC:CheckBox(ConROC_SM_Judgement_Crusader) or
				                     ConROC:CheckBox(ConROC_SM_Judgement_Wisdom) or
				                     ConROC:CheckBox(ConROC_SM_Judgement_Light) or
				                     ConROC:CheckBox(ConROC_SM_Judgement_Justice) or
				                     ConROC:CheckBox(ConROC_SM_Judgement_Command) or
				                     ConROC:CheckBox(ConROC_SM_Judgement_Blood) or
				                     ConROC:CheckBox(ConROC_SM_Judgement_Vengeance)
				
				-- Determine which judgement debuff to check based on SELECTED judgement checkbox
				-- This works even if you don't have the seal active yet
				local judgeDebuffName = nil
				if ConROC:CheckBox(ConROC_SM_Judgement_Crusader) then
					judgeDebuffName = "Judgement of the Crusader"
				elseif ConROC:CheckBox(ConROC_SM_Judgement_Wisdom) then
					judgeDebuffName = "Judgement of Wisdom"
				elseif ConROC:CheckBox(ConROC_SM_Judgement_Light) then
					judgeDebuffName = "Judgement of Light"
				elseif ConROC:CheckBox(ConROC_SM_Judgement_Justice) then
					judgeDebuffName = "Judgement of Justice"
				elseif ConROC:CheckBox(ConROC_SM_Judgement_Command) then
					judgeDebuffName = "Judgement of Command"
				elseif ConROC:CheckBox(ConROC_SM_Judgement_Blood) then
					judgeDebuffName = "Judgement of Blood"
				elseif ConROC:CheckBox(ConROC_SM_Judgement_Vengeance) then
					judgeDebuffName = "Judgement of Vengeance"
				end
				
				-- Check if the target already has this judgement debuff
				local hasDebuff = false
				if wantsToJudge and judgeDebuffName then
					for i = 1, 40 do
						local name = UnitDebuff("target", i, "player")
						if name == judgeDebuffName then
							hasDebuff = true
							break
						end
					end
				end
				
				-- Suggest judgement if: checkbox enabled AND debuff missing AND judgement ready
				-- Note: You need to have the right seal to judge successfully, but we suggest it anyway
				if wantsToJudge and not hasDebuff and _Judgement_RDY then
					tinsert(ConROC.SuggestedSpells, _Judgement);
					_Judgement_RDY = false;
					_Queue = _Queue + 1;
					break;
				end

				-- Seal maintenance - use manual selection OR automatic
				-- Check if user manually selected a seal (their DPS seal)
				local manualSeal = nil
				local hasManualSealBuff = false
				
				if ConROC:CheckBox(ConROC_SM_Seal_Command) and _SealofCommand_RDY then
					manualSeal = _SealofCommand
					hasManualSealBuff = _SealofCommand_BUFF
				elseif ConROC:CheckBox(ConROC_SM_Seal_Blood) and _SealofBlood_RDY then
					manualSeal = _SealofBlood
					hasManualSealBuff = _SealofBlood_BUFF
				elseif ConROC:CheckBox(ConROC_SM_Seal_Vengeance) and _SealofVengeance_RDY then
					manualSeal = _SealofVengeance
					hasManualSealBuff = _SealofVengeance_BUFF
				elseif ConROC:CheckBox(ConROC_SM_Seal_Righteousness) and _SealofRighteousness_RDY then
					manualSeal = _SealofRighteousness
					hasManualSealBuff = _SealofRighteousness_BUFF
				elseif ConROC:CheckBox(ConROC_SM_Seal_Crusader) and _SealoftheCrusader_RDY then
					manualSeal = _SealoftheCrusader
					hasManualSealBuff = _SealoftheCrusader_BUFF
				elseif ConROC:CheckBox(ConROC_SM_Seal_Justice) and _SealofJustice_RDY then
					manualSeal = _SealofJustice
					hasManualSealBuff = _SealofJustice_BUFF
				elseif ConROC:CheckBox(ConROC_SM_Seal_Light) and _SealofLight_RDY then
					manualSeal = _SealofLight
					hasManualSealBuff = _SealofLight_BUFF
				elseif ConROC:CheckBox(ConROC_SM_Seal_Wisdom) and _SealofWisdom_RDY then
					manualSeal = _SealofWisdom
					hasManualSealBuff = _SealofWisdom_BUFF
				end
				
				-- Maintain your seal (reapply after judging or if missing)
				if manualSeal and not hasManualSealBuff then
					tinsert(ConROC.SuggestedSpells, manualSeal);
					_Queue = _Queue + 1;
					break;
				end
				
				-- If no manual seal selected, use automatic selection
				if not manualSeal and _OptimalSeal and _OptimalSeal_RDY and not _OptimalSeal_BUFF then
					tinsert(ConROC.SuggestedSpells, _OptimalSeal);
					_OptimalSeal_BUFF = true;
					_Queue = _Queue + 1;
					break;
				end
				
				
				-- Holy Shield - highest priority for Prot (keep block charges active)
				if _Player_Spec_ID == Spec.Protection and _HolyShield_RDY and not _HolyShield_BUFF then
					tinsert(ConROC.SuggestedSpells, _HolyShield);
					_HolyShield_RDY = false;
					_Queue = _Queue + 1;
					break;
				end
				
				-- Main GCD abilities - efficient damage dealers
				-- Crusader Strike - your primary filler (low mana cost, good damage)
				if _CrusaderStrike_RDY then
					tinsert(ConROC.SuggestedSpells, _CrusaderStrike);
					_CrusaderStrike_RDY = false;
					_Queue = _Queue + 1;
					break;
				end
				
				-- Exorcism - good damage vs Undead/Demons
				if _Exorcism_RDY and _Can_Exorcist then
					tinsert(ConROC.SuggestedSpells, _Exorcism);
					_Exorcism_RDY = false;
					_Queue = _Queue + 1;
					break;
				end
				
				-- AoE abilities - only when high mana and multiple targets
				if _High_Mana and _enemies_in_melee >= 3 then
					if _Consecration_RDY then
						tinsert(ConROC.SuggestedSpells, _Consecration);
						_Consecration_RDY = false;
						_Queue = _Queue + 1;
						break;
					end
					
					if _HolyWrath_RDY then
						tinsert(ConROC.SuggestedSpells, _HolyWrath);
						_HolyWrath_RDY = false;
						_Queue = _Queue + 1;
						break;
					end
				end
				
				-- Protection specific abilities
				if _Player_Spec_ID == Spec.Protection then
					if _AvengersShield_RDY and hasShield then
						tinsert(ConROC.SuggestedSpells, _AvengersShield);
						_AvengersShield_RDY = false;
						_Queue = _Queue + 1;
						break;
					end
				end
			end
			

			tinsert(ConROC.SuggestedSpells, 26008); --Waiting Spell Icon
			_Queue = _Queue + 3;
			break;
		end
	until _Queue >= 3;
return nil;
end

function ConROC.Paladin.Defense(_, timeShift, currentSpell, gcd)
	ConROC:UpdateSpellID();
	wipe(ConROC.SuggestedDefSpells);
	ConROC:Stats();

--Abilities	
	local _DevotionAura, _DevotionAura_RDY = ConROC:AbilityReady(Ability.DevotionAura, timeShift);
		local _DevotionAura_FORM = ConROC:Form(_DevotionAura);
	local _RetributionAura, _RetributionAura_RDY = ConROC:AbilityReady(Ability.RetributionAura, timeShift);
		local _RetributionAura_FORM = ConROC:Form(_RetributionAura);
	local _ConcentrationAura, _ConcentrationAura_RDY = ConROC:AbilityReady(Ability.ConcentrationAura, timeShift);
		local _ConcentrationAura_FORM = ConROC:Form(_ConcentrationAura);
	local _SanctityAura, _SanctityAura_RDY = ConROC:AbilityReady(Ability.SanctityAura, timeShift);
		local _SanctityAura_FORM = ConROC:Form(_SanctityAura);
	local _FireResistanceAura, _FireResistanceAura_RDY = ConROC:AbilityReady(Ability.FireResistanceAura, timeShift);
		local _FireResistanceAura_FORM = ConROC:Form(_FireResistanceAura);
	local _FrostResistanceAura, _FrostResistanceAura_RDY = ConROC:AbilityReady(Ability.FrostResistanceAura, timeShift);
		local _FrostResistanceAura_FORM = ConROC:Form(_FrostResistanceAura);
	local _ShadowResistanceAura, _ShadowResistanceAura_RDY = ConROC:AbilityReady(Ability.ShadowResistanceAura, timeShift);
		local _ShadowResistanceAura_FORM = ConROC:Form(_ShadowResistanceAura);

--Rotations
	if _DevotionAura_RDY and not _DevotionAura_FORM and ConROC:CheckBox(ConROC_SM_Aura_Devotion) then
		tinsert(ConROC.SuggestedDefSpells, _DevotionAura);
	end

	if _RetributionAura_RDY and not _RetributionAura_FORM and ConROC:CheckBox(ConROC_SM_Aura_Retribution) then
		tinsert(ConROC.SuggestedDefSpells, _RetributionAura);
	end

	if _ConcentrationAura_RDY and not _ConcentrationAura_FORM and ConROC:CheckBox(ConROC_SM_Aura_Concentration) then
		tinsert(ConROC.SuggestedDefSpells, _ConcentrationAura);
	end

	if _SanctityAura_RDY and not _SanctityAura_FORM and ConROC:CheckBox(ConROC_SM_Aura_Sanctity) then
		tinsert(ConROC.SuggestedDefSpells, _SanctityAura);
	end

	if _FireResistanceAura_RDY and not _FireResistanceAura_FORM and ConROC:CheckBox(ConROC_SM_Aura_FireResistance) then
		tinsert(ConROC.SuggestedDefSpells, _FireResistanceAura);
	end

	if _FrostResistanceAura_RDY and not _FrostResistanceAura_FORM and ConROC:CheckBox(ConROC_SM_Aura_FrostResistance) then
		tinsert(ConROC.SuggestedDefSpells, _FrostResistanceAura);
	end

	if _ShadowResistanceAura_RDY and not _ShadowResistanceAura_FORM and ConROC:CheckBox(ConROC_SM_Aura_ShadowResistance) then
		tinsert(ConROC.SuggestedDefSpells, _ShadowResistanceAura);
	end
return nil;
end

function ConROC:JustCasted(spellID)
	if spellID == _Consecration then
		local expTime = GetTime() + 8;
		consecEXP = expTime;
	end
end
