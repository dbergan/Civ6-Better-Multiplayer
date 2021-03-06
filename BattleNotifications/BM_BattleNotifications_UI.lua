if not ExposedMembers.DB_BM then ExposedMembers.DB_BM = {} end;
local DB_BM = ExposedMembers.DB_BM;

-- ---------------------------------------------
-- Global constants that might want to be edited
-- Radius of 1 = the unit and each tile around it, 2 = each tile around the tiles in 1, etc.
BM_DefenderRadius = 1
BM_NuclearRadius = 1
BM_ThermonuclearRadius = 2
BM_EnemyRGB = "255,47,47"
BM_MyRGB = "36,119,255"
-- ---------------------------------------------

-- from TutorialScenarioBase.lua
function GetUnitType( playerID: number, unitID : number )
	local pPlayer	:table = Players[playerID]
	local pUnit		:table = pPlayer:GetUnits():FindID(unitID)

	if pUnit == nil then return "" end

	return GameInfo.Units[pUnit:GetUnitType()].UnitType
end

function BM_Combat_DebugPrintNotificationData(notificationData)

	print("****************************************************************************************")
	print(notificationData[ParameterTypes.MESSAGE])
	print(notificationData[ParameterTypes.SUMMARY])
	print("****************************************************************************************")
end

function BM_Combat_DebugPrintAllCombatResult(CombatResult)

	print("========================================================================================")
	print("CombatResult[CombatResultParameters.COMBAT_TYPE]", CombatResult[CombatResultParameters.COMBAT_TYPE])
	print("CombatResult[CombatResultParameters.LOCATION].x", CombatResult[CombatResultParameters.LOCATION].x)
	print("CombatResult[CombatResultParameters.LOCATION].y", CombatResult[CombatResultParameters.LOCATION].y)
	print("CombatResult[CombatResultParameters.ALT_SOURCE_LOCATION].x", CombatResult[CombatResultParameters.ALT_SOURCE_LOCATION].x)
	print("CombatResult[CombatResultParameters.ALT_SOURCE_LOCATION].y", CombatResult[CombatResultParameters.ALT_SOURCE_LOCATION].y)
	print("CombatResult[CombatResultParameters.DEFENDER_RETALIATES]", CombatResult[CombatResultParameters.DEFENDER_RETALIATES])
	print("CombatResult[CombatResultParameters.ATTACKER_ADVANCES]", CombatResult[CombatResultParameters.ATTACKER_ADVANCES])
	print("CombatResult[CombatResultParameters.DEFENDER_CAPTURED]", CombatResult[CombatResultParameters.DEFENDER_CAPTURED])
	print("CombatResult[CombatResultParameters.LOCATION_PILLAGED]", CombatResult[CombatResultParameters.LOCATION_PILLAGED])
	print("CombatResult[CombatResultParameters.WMD_STATUS]", CombatResult[CombatResultParameters.WMD_STATUS])
	print("CombatResult[CombatResultParameters.WMD_TYPE]", CombatResult[CombatResultParameters.WMD_TYPE])
	print("CombatResult[CombatResultParameters.WMD_STRIKE_RANGE]", CombatResult[CombatResultParameters.WMD_STRIKE_RANGE])
	print("CombatResult[CombatResultParameters.DAMAGE_MEMBER_COUNT]", CombatResult[CombatResultParameters.DAMAGE_MEMBER_COUNT])
	print("CombatResult[CombatResultParameters.VISUALIZE]", CombatResult[CombatResultParameters.VISUALIZE])
	print("CombatResult[CombatResultParameters.ATTACKER_ADVANCED_DURING_VISUALIZATION]", CombatResult[CombatResultParameters.ATTACKER_ADVANCED_DURING_VISUALIZATION])
	print(" ")
	print("CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.ID].type", CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.ID].type)	-- unit (1), city (3), or encamp (3)
	print("CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.ID].id", CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.ID].id)
	print("CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.ID].player", CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.ID].player)
	print("CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.LOCATION].x", CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.LOCATION].x)
	print("CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.LOCATION].y", CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.LOCATION].x)
	print("CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.COMBAT_STRENGTH]", CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.COMBAT_STRENGTH])
	print("CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.STRENGTH_MODIFIER]", CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.STRENGTH_MODIFIER])
	print("CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.COMBAT_SUB_TYPE]", CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.COMBAT_SUB_TYPE])
	print("CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.MAX_HIT_POINTS]", CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.MAX_HIT_POINTS])
	print("CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.DAMAGE_TO]", CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.DAMAGE_TO])
	print("CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.FINAL_DAMAGE_TO]", CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.FINAL_DAMAGE_TO])
	print("CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.MAX_DEFENSE_HIT_POINTS]", CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.MAX_DEFENSE_HIT_POINTS])
	print("CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.DEFENSE_DAMAGE_TO]", CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.DEFENSE_DAMAGE_TO])
	print("CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.FINAL_DEFENSE_DAMAGE_TO]", CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.FINAL_DEFENSE_DAMAGE_TO])
	print("CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.EXPERIENCE_CHANGE]", CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.EXPERIENCE_CHANGE])
	print("CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.ERA]", CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.ERA])
	print(" ")
	print("CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.ID].type", CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.ID].type)	-- unit (1), city (3), or encamp (3)
	print("CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.ID].id", CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.ID].id)
	print("CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.ID].player", CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.ID].player)
	print("CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.LOCATION].x", CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.LOCATION].x)
	print("CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.LOCATION].y", CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.LOCATION].x)
	print("CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.COMBAT_STRENGTH]", CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.COMBAT_STRENGTH])
	print("CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.STRENGTH_MODIFIER]", CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.STRENGTH_MODIFIER])
	print("CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.COMBAT_SUB_TYPE]", CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.COMBAT_SUB_TYPE])
	print("CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.MAX_HIT_POINTS]", CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.MAX_HIT_POINTS])
	print("CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.DAMAGE_TO]", CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.DAMAGE_TO])
	print("CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.FINAL_DAMAGE_TO]", CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.FINAL_DAMAGE_TO])
	print("CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.MAX_DEFENSE_HIT_POINTS]", CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.MAX_DEFENSE_HIT_POINTS])
	print("CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.DEFENSE_DAMAGE_TO]", CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.DEFENSE_DAMAGE_TO])
	print("CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.FINAL_DEFENSE_DAMAGE_TO]", CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.FINAL_DEFENSE_DAMAGE_TO])
	print("CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.EXPERIENCE_CHANGE]", CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.EXPERIENCE_CHANGE])
	print("CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.ERA]", CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.ERA])
	print(" ")
	print("CombatResult[CombatResultParameters.ANTI_AIR][CombatResultParameters.ID].type", CombatResult[CombatResultParameters.ANTI_AIR][CombatResultParameters.ID].type)	-- unit (1), city (3), or encamp (3)
	print("CombatResult[CombatResultParameters.ANTI_AIR][CombatResultParameters.ID].id", CombatResult[CombatResultParameters.ANTI_AIR][CombatResultParameters.ID].id)
	print("CombatResult[CombatResultParameters.ANTI_AIR][CombatResultParameters.ID].player", CombatResult[CombatResultParameters.ANTI_AIR][CombatResultParameters.ID].player)
	print("CombatResult[CombatResultParameters.ANTI_AIR][CombatResultParameters.LOCATION].x", CombatResult[CombatResultParameters.ANTI_AIR][CombatResultParameters.LOCATION].x)
	print("CombatResult[CombatResultParameters.ANTI_AIR][CombatResultParameters.LOCATION].y", CombatResult[CombatResultParameters.ANTI_AIR][CombatResultParameters.LOCATION].x)
	print("CombatResult[CombatResultParameters.ANTI_AIR][CombatResultParameters.COMBAT_STRENGTH]", CombatResult[CombatResultParameters.ANTI_AIR][CombatResultParameters.COMBAT_STRENGTH])
	print("CombatResult[CombatResultParameters.ANTI_AIR][CombatResultParameters.STRENGTH_MODIFIER]", CombatResult[CombatResultParameters.ANTI_AIR][CombatResultParameters.STRENGTH_MODIFIER])
	print("CombatResult[CombatResultParameters.ANTI_AIR][CombatResultParameters.COMBAT_SUB_TYPE]", CombatResult[CombatResultParameters.ANTI_AIR][CombatResultParameters.COMBAT_SUB_TYPE])
	print("CombatResult[CombatResultParameters.ANTI_AIR][CombatResultParameters.MAX_HIT_POINTS]", CombatResult[CombatResultParameters.ANTI_AIR][CombatResultParameters.MAX_HIT_POINTS])
	print("CombatResult[CombatResultParameters.ANTI_AIR][CombatResultParameters.DAMAGE_TO]", CombatResult[CombatResultParameters.ANTI_AIR][CombatResultParameters.DAMAGE_TO])
	print("CombatResult[CombatResultParameters.ANTI_AIR][CombatResultParameters.FINAL_DAMAGE_TO]", CombatResult[CombatResultParameters.ANTI_AIR][CombatResultParameters.FINAL_DAMAGE_TO])
	print("CombatResult[CombatResultParameters.ANTI_AIR][CombatResultParameters.MAX_DEFENSE_HIT_POINTS]", CombatResult[CombatResultParameters.ANTI_AIR][CombatResultParameters.MAX_DEFENSE_HIT_POINTS])
	print("CombatResult[CombatResultParameters.ANTI_AIR][CombatResultParameters.DEFENSE_DAMAGE_TO]", CombatResult[CombatResultParameters.ANTI_AIR][CombatResultParameters.DEFENSE_DAMAGE_TO])
	print("CombatResult[CombatResultParameters.ANTI_AIR][CombatResultParameters.FINAL_DEFENSE_DAMAGE_TO]", CombatResult[CombatResultParameters.ANTI_AIR][CombatResultParameters.FINAL_DEFENSE_DAMAGE_TO])
	print("CombatResult[CombatResultParameters.ANTI_AIR][CombatResultParameters.EXPERIENCE_CHANGE]", CombatResult[CombatResultParameters.ANTI_AIR][CombatResultParameters.EXPERIENCE_CHANGE])
	print("CombatResult[CombatResultParameters.ANTI_AIR][CombatResultParameters.ERA]", CombatResult[CombatResultParameters.ANTI_AIR][CombatResultParameters.ERA])
	print(" ")
	print("CombatResult[CombatResultParameters.INTERCEPTOR][CombatResultParameters.ID].type", CombatResult[CombatResultParameters.INTERCEPTOR][CombatResultParameters.ID].type)	-- unit (1), city (3), or encamp (3)
	print("CombatResult[CombatResultParameters.INTERCEPTOR][CombatResultParameters.ID].id", CombatResult[CombatResultParameters.INTERCEPTOR][CombatResultParameters.ID].id)
	print("CombatResult[CombatResultParameters.INTERCEPTOR][CombatResultParameters.ID].player", CombatResult[CombatResultParameters.INTERCEPTOR][CombatResultParameters.ID].player)
	print("CombatResult[CombatResultParameters.INTERCEPTOR][CombatResultParameters.LOCATION].x", CombatResult[CombatResultParameters.INTERCEPTOR][CombatResultParameters.LOCATION].x)
	print("CombatResult[CombatResultParameters.INTERCEPTOR][CombatResultParameters.LOCATION].y", CombatResult[CombatResultParameters.INTERCEPTOR][CombatResultParameters.LOCATION].x)
	print("CombatResult[CombatResultParameters.INTERCEPTOR][CombatResultParameters.COMBAT_STRENGTH]", CombatResult[CombatResultParameters.INTERCEPTOR][CombatResultParameters.COMBAT_STRENGTH])
	print("CombatResult[CombatResultParameters.INTERCEPTOR][CombatResultParameters.STRENGTH_MODIFIER]", CombatResult[CombatResultParameters.INTERCEPTOR][CombatResultParameters.STRENGTH_MODIFIER])
	print("CombatResult[CombatResultParameters.INTERCEPTOR][CombatResultParameters.COMBAT_SUB_TYPE]", CombatResult[CombatResultParameters.INTERCEPTOR][CombatResultParameters.COMBAT_SUB_TYPE])
	print("CombatResult[CombatResultParameters.INTERCEPTOR][CombatResultParameters.MAX_HIT_POINTS]", CombatResult[CombatResultParameters.INTERCEPTOR][CombatResultParameters.MAX_HIT_POINTS])
	print("CombatResult[CombatResultParameters.INTERCEPTOR][CombatResultParameters.DAMAGE_TO]", CombatResult[CombatResultParameters.INTERCEPTOR][CombatResultParameters.DAMAGE_TO])
	print("CombatResult[CombatResultParameters.INTERCEPTOR][CombatResultParameters.FINAL_DAMAGE_TO]", CombatResult[CombatResultParameters.INTERCEPTOR][CombatResultParameters.FINAL_DAMAGE_TO])
	print("CombatResult[CombatResultParameters.INTERCEPTOR][CombatResultParameters.MAX_DEFENSE_HIT_POINTS]", CombatResult[CombatResultParameters.INTERCEPTOR][CombatResultParameters.MAX_DEFENSE_HIT_POINTS])
	print("CombatResult[CombatResultParameters.INTERCEPTOR][CombatResultParameters.DEFENSE_DAMAGE_TO]", CombatResult[CombatResultParameters.INTERCEPTOR][CombatResultParameters.DEFENSE_DAMAGE_TO])
	print("CombatResult[CombatResultParameters.INTERCEPTOR][CombatResultParameters.FINAL_DEFENSE_DAMAGE_TO]", CombatResult[CombatResultParameters.INTERCEPTOR][CombatResultParameters.FINAL_DEFENSE_DAMAGE_TO])
	print("CombatResult[CombatResultParameters.INTERCEPTOR][CombatResultParameters.EXPERIENCE_CHANGE]", CombatResult[CombatResultParameters.INTERCEPTOR][CombatResultParameters.EXPERIENCE_CHANGE])
	print("CombatResult[CombatResultParameters.INTERCEPTOR][CombatResultParameters.ERA]", CombatResult[CombatResultParameters.INTERCEPTOR][CombatResultParameters.ERA])
	print("========================================================================================")
end

function ExpectedDmg(AttStr, DefStr, WallMaxHP, WallDamage, HasTower)
	local NormalDmg = 29.5*2.6553^(0.04*(AttStr-DefStr))
	local WallAdjustedDmg = NormalDmg
	if WallMaxHP ~= nil and WallMaxHP > 0 and (HasTower == nil or HasTower == false) then
		WallAdjustedDmg = WallAdjustedDmg * WallDamage / WallMaxHP
	end
	return string.format("%.1f", WallAdjustedDmg)
end

function ExpectedWallDmg(AttStr, DefStr, CombatType, HasRam)
	local NormalDmg = 29.5*2.6553^(0.04*(AttStr-DefStr))
	local WallDmg = NormalDmg
	if CombatType == CombatTypes.MELEE and (HasRam == nil or HasRam == false) then
		WallDmg = WallDmg * 0.15
	elseif CombatType == CombatTypes.RANGED then
		WallDmg = WallDmg * 0.50
	end
	return string.format("%.1f", WallDmg)
end

function BM_CombatIcon(CombatType, WMDType)
	if CombatType == CombatTypes.MELEE then
		return "[ICON_Strength]"
	elseif CombatType == CombatTypes.RANGED then
		return "[ICON_Ranged]"
	elseif CombatType == CombatTypes.BOMBARD then
		return "[ICON_Bombard]"
	elseif CombatType == CombatTypes.RELIGIOUS then
		return "[ICON_Religion]"
	elseif CombatType == CombatTypes.AIR then
		return "[ICON_Range]"
	elseif CombatType == CombatTypes.ICBM and WMDType == 0 then
		return "[ICON_Nuclear]"
	elseif CombatType == CombatTypes.ICBM then
		return "[ICON_ThermoNuclear]"
	end
end

-- Combatant = CombatResultParameters.ATTACKER, CombatResultParameters.DEFENDER, CombatResultParameters.ANTI_AIR, or CombatResultParameters.INTERCEPTOR
function BM_CombatantShortName(CombatResult, Combatant)
	local a = ""
	if CombatResult[Combatant][CombatResultParameters.ID].type == 3 then -- type 3 = district (city or encampment)
		local district = CityManager.GetDistrictAt(CombatResult[Combatant][CombatResultParameters.LOCATION].x, CombatResult[Combatant][CombatResultParameters.LOCATION].y)
		if district:GetType() == 3 then						-- district type 3 = encampment >> "Paris Encampment"
			local city = district:GetCity() ;
			a = a .. Locale.Lookup(city:GetName())
			a = a .. " Encampment"
		else												-- district type = city >> "Paris"
			local city = Cities.GetCityInPlot(CombatResult[Combatant][CombatResultParameters.LOCATION].x, CombatResult[Combatant][CombatResultParameters.LOCATION].y)
			a = a .. Locale.Lookup(city:GetName())
		end
	elseif CombatResult[Combatant][CombatResultParameters.ID].type == 1 then	-- type 1 = unit >> "French Warrior" OR "The Iron Marksmen"
		local unit = UnitManager.GetUnit(CombatResult[Combatant][CombatResultParameters.ID].player, CombatResult[Combatant][CombatResultParameters.ID].id)
		local name = Locale.Lookup(unit:GetName())
		local vetname = unit:GetExperience():GetVeteranName()

		if vetname ~= "" then
			a = a .. vetname
		elseif PlayerConfigurations[CombatResult[Combatant][CombatResultParameters.ID].player]:GetCivilizationTypeName() == 'CIVILIZATION_FREE_CITIES' then
			a = a .. Locale.Lookup("LOC_" .. PlayerConfigurations[CombatResult[Combatant][CombatResultParameters.ID].player]:GetCivilizationTypeName() .. "_NAME")
			a = a .. ' ' .. name
		else
			a = a .. Locale.Lookup("LOC_" .. PlayerConfigurations[CombatResult[Combatant][CombatResultParameters.ID].player]:GetCivilizationTypeName() .. "_ADJECTIVE")
			a = a .. ' ' .. name
		end
	end
	return a
end

-- Combatant = CombatResultParameters.ATTACKER, CombatResultParameters.DEFENDER, CombatResultParameters.ANTI_AIR, or CombatResultParameters.INTERCEPTOR
function BM_CombatantFinalHealth(CombatResult, Combatant)
	local EndHP = CombatResult[Combatant][CombatResultParameters.MAX_HIT_POINTS] - CombatResult[Combatant][CombatResultParameters.FINAL_DAMAGE_TO]
	if EndHP > 0 then
		return " <" .. EndHP .. "[ICON_Damaged]>"
	else
		return ''
	end
end

function BM_CombatantLongName(CombatResult, Combatant)
	local a = BM_CombatantShortName(CombatResult, Combatant)

	if CombatResult[Combatant][CombatResultParameters.ID].type == 1 then
		local unit = UnitManager.GetUnit(CombatResult[Combatant][CombatResultParameters.ID].player, CombatResult[Combatant][CombatResultParameters.ID].id)
		local level = unit:GetExperience():GetLevel()
		local milform = unit:GetMilitaryFormation()
		local unitType = unit:GetUnitType()
		local unitInfo = GameInfo.Units[unitType]
		local name = Locale.Lookup(unit:GetName())
		local vetname = unit:GetExperience():GetVeteranName()

		if PlayerConfigurations[CombatResult[Combatant][CombatResultParameters.ID].player]:GetCivilizationTypeName() == 'CIVILIZATION_FREE_CITIES' then
			a = Locale.Lookup("LOC_" .. PlayerConfigurations[CombatResult[Combatant][CombatResultParameters.ID].player]:GetCivilizationTypeName() .. "_NAME")
		else
			a = Locale.Lookup("LOC_" .. PlayerConfigurations[CombatResult[Combatant][CombatResultParameters.ID].player]:GetCivilizationTypeName() .. "_ADJECTIVE")
		end
		a = a .. ' ' .. Locale.Lookup("LOC_" .. unitInfo.UnitType .. "_NAME")

		if vetname ~= "" then
			a = a .. ' "' .. vetname .. '"'
		end

		if milform == MilitaryFormationTypes.CORPS_FORMATION then
			a = a .. " [ICON_Corps]"
		elseif milform == MilitaryFormationTypes.ARMY_FORMATION then
			a = a .. " [ICON_Army]"
		end

		a = a .. " (Lvl " .. level .. ")"
	end
	return a
end

function BM_Combat_Summary(CombatResult, AttackerOrDefender) -- AttackerOrDefender = 'A' or 'D'
	-- "French Warrior attacked Greek Slinger" || "Greek Slinger attacked Paris" || "Paris Encampment attacked Greek Slinger" || "Greek Warrior captured Paris"
	local a = ''
	if AttackerOrDefender == 'A' then
		a = a .. "[COLOR:" .. BM_MyRGB .. ",255]"
	else
		a = a .. "[COLOR:" .. BM_EnemyRGB .. ",255]"
	end
	a = a .. BM_CombatantShortName(CombatResult, CombatResultParameters.ATTACKER)
	a = a .. BM_CombatantFinalHealth(CombatResult, CombatResultParameters.ATTACKER)
	a = a .. "[ENDCOLOR]"

	local EndHP = CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.MAX_HIT_POINTS] - CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.FINAL_DAMAGE_TO]

	-- "attacked"
	if CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.ID].type == 3 and CombatResult[CombatResultParameters.ATTACKER_ADVANCES] then
		a = a .. " captured "
	elseif CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.ID].type == 1 and EndHP <= 0 then
		a = a .. " killed "
	else
		a = a .. " attacked "
	end

	-- defender name
	if AttackerOrDefender == 'D' then
		a = a .. "[COLOR:" .. BM_MyRGB .. ",255]"
	else
		a = a .. "[COLOR:" .. BM_EnemyRGB .. ",255]"
	end
	a = a .. BM_CombatantShortName(CombatResult, CombatResultParameters.DEFENDER)
	a = a .. BM_CombatantFinalHealth(CombatResult, CombatResultParameters.DEFENDER)
	a = a .. "[ENDCOLOR]"
	
	return a
end

-- Combatant = CombatResultParameters.ATTACKER, CombatResultParameters.DEFENDER, CombatResultParameters.ANTI_AIR, or CombatResultParameters.INTERCEPTOR
function BM_CombatantLocationString(CombatResult, Combatant)
	local a = ""
	if Combatant == CombatResultParameters.ATTACKER then
		a = a .. "from ("
	else
		a = a .. "at ("
	end
	a = a .. CombatResult[Combatant][CombatResultParameters.LOCATION].x .. ", " .. CombatResult[Combatant][CombatResultParameters.LOCATION].y .. ")"
	return a
end

-- Combatant = CombatResultParameters.ATTACKER, CombatResultParameters.DEFENDER, CombatResultParameters.ANTI_AIR, or CombatResultParameters.INTERCEPTOR
function BM_CombatStrengthString(CombatResult, Combatant)
	local a = " with "
	a = a .. tostring(CombatResult[Combatant][CombatResultParameters.COMBAT_STRENGTH] + CombatResult[Combatant][CombatResultParameters.STRENGTH_MODIFIER])
	if Combatant == CombatResultParameters.ATTACKER then
		a = a .. BM_CombatIcon(CombatResult[CombatResultParameters.COMBAT_TYPE], CombatResult[CombatResultParameters.WMD_TYPE])
	elseif Combatant == CombatResultParameters.DEFENDER then
		a = a .. "[ICON_Strength]"
	elseif Combatant == CombatResultParameters.INTERCEPTOR then
		a = a .. "[ICON_AntiAir_Large]"
	else
		a = a .. "[ICON_AntiAir_Large]"
	end
	return a
end

-- Combatant = CombatResultParameters.ATTACKER, CombatResultParameters.DEFENDER, CombatResultParameters.ANTI_AIR, or CombatResultParameters.INTERCEPTOR
function BM_HealthChangeString(CombatResult, Combatant)
	local MaxHP = CombatResult[Combatant][CombatResultParameters.MAX_HIT_POINTS]
	local StartHP = CombatResult[Combatant][CombatResultParameters.MAX_HIT_POINTS] - CombatResult[Combatant][CombatResultParameters.FINAL_DAMAGE_TO] + CombatResult[Combatant][CombatResultParameters.DAMAGE_TO]
	local NewDamage = CombatResult[Combatant][CombatResultParameters.DAMAGE_TO]
	local EndHP = CombatResult[Combatant][CombatResultParameters.MAX_HIT_POINTS] - CombatResult[Combatant][CombatResultParameters.FINAL_DAMAGE_TO]
	if EndHP < 0 then
		EndHP = 0
	end

	local ExpectedDamage = ""
	if Combatant == CombatResultParameters.ATTACKER then
		ExpectedDamage = ExpectedDmg(CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.COMBAT_STRENGTH] + CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.STRENGTH_MODIFIER], CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.COMBAT_STRENGTH] + CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.STRENGTH_MODIFIER])
	elseif Combatant == CombatResultParameters.DEFENDER then
		ExpectedDamage = ExpectedDmg(CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.COMBAT_STRENGTH] + CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.STRENGTH_MODIFIER], CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.COMBAT_STRENGTH] + CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.STRENGTH_MODIFIER], CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.MAX_DEFENSE_HIT_POINTS], CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.FINAL_DEFENSE_DAMAGE_TO] - CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.DEFENSE_DAMAGE_TO])
	end

	local a = "[NEWLINE]"
	if Combatant == CombatResultParameters.ATTACKER and CombatResult[CombatResultParameters.DEFENDER_RETALIATES] == false then		-- ranged attack
		return ""
	else
		a = a .. tostring(StartHP) .. "[ICON_Damaged] - "
		a = a .. tostring(NewDamage) .. " Dmg "
		a = a .. "(expected " .. tostring(ExpectedDamage) .. ") = "
		a = a .. EndHP
		
		if CombatResult[Combatant][CombatResultParameters.ID].type == 1 and EndHP > 0 then
			a = a .. "[ICON_Damaged]"
		end
	end
	return a
end

-- Combatant = CombatResultParameters.ATTACKER, CombatResultParameters.DEFENDER, CombatResultParameters.ANTI_AIR, or CombatResultParameters.INTERCEPTOR
function BM_XPChangeString(CombatResult, Combatant)
	local a = ""
	if CombatResult[Combatant][CombatResultParameters.ID].type == 1 and CombatResult[Combatant][CombatResultParameters.MAX_HIT_POINTS] <= CombatResult[Combatant][CombatResultParameters.FINAL_DAMAGE_TO] then		-- don't print for a dead unit
		a = ""
	elseif CombatResult[Combatant][CombatResultParameters.EXPERIENCE_CHANGE] > 0 or CombatResult[Combatant][CombatResultParameters.ID].type == 1 then		-- print if there's XP or if it's an alive unit (they can have 0 if they are sitting on a promotion)
		a = "[NEWLINE]+" .. CombatResult[Combatant][CombatResultParameters.EXPERIENCE_CHANGE] .. "xp"
	end
	return a
end

function BM_AntiAirString(CombatResult)
	local a = ""
	if CombatResult[CombatResultParameters.COMBAT_TYPE] == CombatTypes.AIR and CombatResult[CombatResultParameters.ANTI_AIR][CombatResultParameters.COMBAT_STRENGTH] > 0 then
		a = a .. "[NEWLINE]Anti-Air: " .. BM_CombatStrengthString(CombatResult, CombatResultParameters.ANTI_AIR)
		a = a .. " did "
		a = a .. tostring(CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.DAMAGE_TO])
		a = a .. " Dmg"
	end
	return a
end

function BM_InterceptorString(CombatResult)
	local a = ""
	if CombatResult[CombatResultParameters.COMBAT_TYPE] == CombatTypes.AIR and CombatResult[CombatResultParameters.INTERCEPTOR][CombatResultParameters.COMBAT_STRENGTH] > 0 then
		a = a .. "[NEWLINE]Interceptor: " .. BM_CombatStrengthString(CombatResult, CombatResultParameters.INTERCEPTOR)
		a = a .. " did "
		a = a .. tostring(CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.DAMAGE_TO])
		a = a .. " Dmg"
	end
	return a
end

function BM_WallString(CombatResult)
	local a = ""
	if CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.MAX_DEFENSE_HIT_POINTS] > 0 then
		local MaxHP = CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.MAX_DEFENSE_HIT_POINTS]
		local StartHP = CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.MAX_DEFENSE_HIT_POINTS] - CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.FINAL_DEFENSE_DAMAGE_TO] + CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.DEFENSE_DAMAGE_TO]
		local NewDamage = CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.DEFENSE_DAMAGE_TO]
		local EndHP = CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.MAX_DEFENSE_HIT_POINTS] - CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.FINAL_DEFENSE_DAMAGE_TO]
		if EndHP < 0 then
			EndHP = 0
		end

		local ExpectedDamage = ExpectedWallDmg(CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.COMBAT_STRENGTH] + CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.STRENGTH_MODIFIER], CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.COMBAT_STRENGTH] + CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.STRENGTH_MODIFIER], CombatResult[CombatResultParameters.COMBAT_TYPE])

		a = a .. "[NEWLINE]Wall: "
		a = a .. tostring(StartHP) .. "[ICON_Fortified] - "
		a = a .. tostring(NewDamage) .. " Dmg "
		a = a .. "(expected " .. tostring(ExpectedDamage) .. ") = "
		a = a .. EndHP .. "[ICON_Fortified]"
	end
	return a
end


function BM_AttackerDetails(CombatResult, AttackerOrDefender)	-- AttackerOrDefender = 'A' or 'D'
	local a = ''
	if AttackerOrDefender == 'A' then
		a = a .. "[COLOR:" .. BM_MyRGB .. ",255]"
	else
		a = a .. "[COLOR:" .. BM_EnemyRGB .. ",255]"
	end
	a = a .. BM_CombatantLongName(CombatResult, CombatResultParameters.ATTACKER) .. " attacked "
	a = a .. BM_CombatantLocationString(CombatResult, CombatResultParameters.ATTACKER)
	a = a .. BM_CombatStrengthString(CombatResult, CombatResultParameters.ATTACKER)
	a = a .. BM_HealthChangeString(CombatResult, CombatResultParameters.ATTACKER)
	a = a .. BM_XPChangeString(CombatResult, CombatResultParameters.ATTACKER)
	a = a .. BM_AntiAirString(CombatResult)
	a = a .. BM_InterceptorString(CombatResult)
	a = a .. "[ENDCOLOR]"
	return a
end

function BM_DefenderDetails(CombatResult, AttackerOrDefender)	-- AttackerOrDefender = 'A' or 'D'
	local a = ''
	if AttackerOrDefender == 'D' then
		a = a .. "[COLOR:" .. BM_MyRGB .. ",255]"
	else
		a = a .. "[COLOR:" .. BM_EnemyRGB .. ",255]"
	end
	a = a .. BM_CombatantLongName(CombatResult, CombatResultParameters.DEFENDER) .. " defended "
	a = a .. BM_CombatantLocationString(CombatResult, CombatResultParameters.DEFENDER)
	a = a .. BM_CombatStrengthString(CombatResult, CombatResultParameters.DEFENDER)
	a = a .. BM_HealthChangeString(CombatResult, CombatResultParameters.DEFENDER)
	a = a .. BM_XPChangeString(CombatResult, CombatResultParameters.DEFENDER)
	a = a .. BM_WallString(CombatResult)
	a = a .. "[ENDCOLOR]"
	return a
end


function BM_Combat(CombatResult)

	if CombatResult == nil then print("CombatResult is nil") return end
	if CombatResultParameters == nil then print("CombatResultParameters is nil") return end

	if CombatResult[-1480090105] > -1 then		-- CombatResultParameters.WMD_TYPE = -1480090105 (sometimes CombatResultParameters.WMD_TYPE is nil)
		BM_Combat_WMD(CombatResult)
		return
	end
	
-- BM_Combat_DebugPrintAllCombatResult(CombatResult)

	local AttackerNotificationData = {}
	local DefenderNotificationData = {}
	AttackerNotificationData[ParameterTypes.LOCATION] = { x = CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.LOCATION].x, y = CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.LOCATION].y }
	AttackerNotificationData[ParameterTypes.MESSAGE] = BM_Combat_Summary(CombatResult, 'A')
	AttackerNotificationData[ParameterTypes.SUMMARY] = BM_AttackerDetails(CombatResult, 'A') .. "[NEWLINE][NEWLINE]" .. BM_DefenderDetails(CombatResult, 'A')
	NotificationManager.SendNotification(CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.ID].player, NotificationTypes.USER_DEFINED_3, AttackerNotificationData)	-- USER_DEFINED_3 for attacker reports

	DefenderNotificationData[ParameterTypes.LOCATION] = { x = CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.LOCATION].x, y = CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.LOCATION].y }
	DefenderNotificationData[ParameterTypes.MESSAGE] = BM_Combat_Summary(CombatResult, 'D')
	DefenderNotificationData[ParameterTypes.SUMMARY] = BM_AttackerDetails(CombatResult, 'D') .. "[NEWLINE][NEWLINE]" .. BM_DefenderDetails(CombatResult, 'D')
	NotificationManager.SendNotification(CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.ID].player, BM_DefenderNotificationType(CombatResult), DefenderNotificationData)

	-- drop pins on attacker tile (for defender to see)
-- BM_Combat_DebugPrintNotificationData(notificationData)


end

function BM_Combat_WMD(CombatResult)
	local notificationData = {}
	notificationData[ParameterTypes.LOCATION] = { x = CombatResult[CombatResultParameters.LOCATION].x, y = CombatResult[CombatResultParameters.LOCATION].y }

	local a = ""
	local icon = ""

	if PlayerConfigurations[CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.ID].player]:GetCivilizationTypeName() == 'CIVILIZATION_FREE_CITIES' then
		a = a .. Locale.Lookup("LOC_" .. PlayerConfigurations[CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.ID].player]:GetCivilizationTypeName() .. "_NAME")
	else
		a = a .. Locale.Lookup("LOC_" .. PlayerConfigurations[CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.ID].player]:GetCivilizationTypeName() .. "_ADJECTIVE")
	end
	a = a .. " "
	if CombatResult[CombatResultParameters.WMD_TYPE] == 0 then
		a = a .. "Nuclear"
		icon = "[ICON_Nuclear]"
	else
		a = a .. "Thermonuclear"
		icon = "[ICON_ThermoNuclear]"
	end
	a = a .. " weapon detonated"
	notificationData[ParameterTypes.MESSAGE] = a

	a = "Source" .. icon .. ": "

	if CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.ID].type == 1 then
		local Attacker = Players[CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.ID].player]
		local Unit = Attacker:GetUnits():FindID(CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.ID].id)
		if PlayerConfigurations[CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.ID].player]:GetCivilizationTypeName() == 'CIVILIZATION_FREE_CITIES' then
			a = a .. Locale.Lookup("LOC_" .. PlayerConfigurations[CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.ID].player]:GetCivilizationTypeName() .. "_NAME")
		else
			a = a .. Locale.Lookup("LOC_" .. PlayerConfigurations[CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.ID].player]:GetCivilizationTypeName() .. "_ADJECTIVE")
		end
		a = a .. " "
		a = a .. "{LOC_" .. GetUnitType(CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.ID].player, CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.ID].id) .. "_NAME} "
		a = a .. "(at " .. Unit:GetX() .. "," .. Unit:GetY() .. ")"
	elseif CombatResult[CombatResultParameters.ALT_SOURCE_LOCATION].x >= 0 then
		a = a .. "Missile Silo at (" .. CombatResult[CombatResultParameters.ALT_SOURCE_LOCATION].x .. ", " .. CombatResult[CombatResultParameters.ALT_SOURCE_LOCATION].y .. ")"
	else
		a = a .. "???"
	end
	a = a .. "[NEWLINE]"
	a = a .. "Destination: "
	local Plot = Map.GetPlot(CombatResult[CombatResultParameters.LOCATION].x, CombatResult[CombatResultParameters.LOCATION].y)
	if Plot:IsCity() then
		local City = CityManager.GetCityAt(CombatResult[CombatResultParameters.LOCATION].x, CombatResult[CombatResultParameters.LOCATION].y)
		a = a .. "{" .. City:GetName() .. "} "
	end

	a = a .. "(" .. CombatResult[CombatResultParameters.LOCATION].x .. ", " .. CombatResult[CombatResultParameters.LOCATION].y .. ")"
	notificationData[ParameterTypes.SUMMARY] = a

	local AllPlayers = PlayerManager.GetAliveMajors()
	for _, Player in pairs(AllPlayers) do
		if CombatResult[CombatResultParameters.WMD_TYPE] == 0 then
			NotificationManager.SendNotification(Player:GetID(), NotificationTypes.USER_DEFINED_1, notificationData)	-- USER_DEFINED_1 for nuke reports
		else
			NotificationManager.SendNotification(Player:GetID(), NotificationTypes.USER_DEFINED_2, notificationData)	-- USER_DEFINED_2 for thermonuke reports
		end
	end

--[[
	-- drop pins
	print("ICON_" .. GameInfo.Projects["PROJECT_OPERATION_IVY"].ProjectType)
	local pPlayerCfg = PlayerConfigurations[0]
	local pMapPin = pPlayerCfg:GetMapPin(CombatResult[CombatResultParameters.LOCATION].x, CombatResult[CombatResultParameters.LOCATION].y)
	local playerMapPins = pPlayerCfg:GetMapPins()
	print("pMapPin", pMapPin)
	for key, value in pairs(pMapPin) do
		print("-",key, value)
	end
	print("pMapPin:SetName()", pMapPin:SetName("test"))
	print("pMapPin:SetIconName()", pMapPin:SetIconName("ICON_" .. GameInfo.Projects["PROJECT_OPERATION_IVY"].ProjectType))
	print("pMapPin:GetName(test)", pMapPin:GetName("test"))
	print("pMapPin:GetName()", pMapPin:GetName())
	print("pMapPin:GetIconName(ICON_PROJECT_OPERATION_IVY)", pMapPin:GetIconName("ICON_" .. GameInfo.Projects["PROJECT_OPERATION_IVY"].ProjectType))
	print("pMapPin:GetIconName()", pMapPin:GetIconName())
	print("pMapPin:GetID()", pMapPin:GetID())
--	print("pMapPin:GetVisibility()", pMapPin:GetVisibility())
	print("pMapPin:IsVisible()", pMapPin:IsVisible())
--	print("playerMapPins[pMapPin]", playerMapPins[pMapPin])

	local mapPinEntry = GetMapPinListEntry(0, pMapPin:GetID());
	print("mapPinEntry", mapPinEntry)
	local mapPinCfg = GetMapPinConfig(0, pMapPin:GetID());
	print("mapPinCfg", mapPinCfg)
--]]

--[[
	for key, value in pairs(playerMapPins) do
		print("--", key, value)
		for key2, value2 in pairs(value) do
			print("---", key2, value2)
			print("---", value2.__instance)
			for key3, value3 in pairs(value2) do
				print("----", key3, value3)
			end
		end
	end
--]]

--[[
	local mapPinCfg = GetMapPinConfig(pinPlayerID, pinID);
	if(mapPinCfg:GetName() ~= nil) then
		instance.MapPinButton:SetText(mapPinCfg:GetName());
	else
		instance.MapPinButton:SetText(Locale.Lookup("LOC_MAP_PIN_DEFAULT_NAME", mapPinCfg:GetID()));
	end
	instance.MapPinButton:SetOffsetVal(instance.PlayerString:GetSizeX(), 0);
	instance.MapPinButton:SetSizeX(instance.MapPinButton:GetTextControl():GetSizeX()+BUTTON_TEXT_PADDING);
	
	-- LuaEvents.MapPinPopup_RequestMapPin(CombatResult[CombatResultParameters.LOCATION].x+1, CombatResult[CombatResultParameters.LOCATION].y+1)


	if(imageControl ~= nil and mapPinIconName ~= nil) then
		local iconName = mapPinIconName;
		if(not imageControl:SetIcon(iconName)) then
			imageControl:SetIcon(MapTacks.UNKNOWN);
		end
	end
--]]

end

function BM_DefenderNotificationType(CombatResult)
	local EndHP = CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.MAX_HIT_POINTS] - CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.FINAL_DAMAGE_TO]

	if CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.ID].type == 3 and CombatResult[CombatResultParameters.ATTACKER_ADVANCES] then
		-- if city, and attacker advanced
		return NotificationTypes.USER_DEFINED_7
	elseif CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.ID].type == 3 then
		-- if city
		return NotificationTypes.USER_DEFINED_5
	elseif EndHP <= 0 then
		-- not city (must be unit), no HP left
		return NotificationTypes.USER_DEFINED_6
	else
		-- not city, has HP
		return NotificationTypes.USER_DEFINED_4
	end 
end

-- Add vision with NOTIFICATION_USER_DEFINED_1, 2, and 6
function BM_OnNotificationAdded(playerID, notificationID) 
	if not DB_BM.ChangeVisibility then return end

	if playerID == nil or Game == nil then return end

	if playerID ~= Game.GetLocalPlayer() then return end 

	local pPlayer : table = PlayerConfigurations[playerID]

	if (not pPlayer:IsAlive()) then return end 

	local pNotification : table = NotificationManager.Find( playerID, notificationID )

	if pNotification == nil then return end
		
	if (not pNotification:IsVisibleInUI()) then return end

	if (not pNotification:IsLocationValid()) then return end

	local x, y = pNotification:GetLocation()
	if pNotification:GetTypeName() == "NOTIFICATION_USER_DEFINED_1" then
		DB_BM.ChangeVisibility(playerID, x, y, BM_NuclearRadius, true)
	elseif pNotification:GetTypeName() == "NOTIFICATION_USER_DEFINED_2" then
		DB_BM.ChangeVisibility(playerID, x, y, BM_ThermonuclearRadius, true)
	elseif pNotification:GetTypeName() == "NOTIFICATION_USER_DEFINED_6" then
		DB_BM.ChangeVisibility(playerID, x, y, BM_DefenderRadius, true)
	end
	
end

function BM_OnLocalPlayerTurnEnd()
	if not DB_BM.HideRevealedBattleNotificationTiles then return end
	DB_BM.HideRevealedBattleNotificationTiles(Game.GetLocalPlayer())
end

function Initialize()
	Events.Combat.Add(BM_Combat)
	Events.NotificationAdded.Add(BM_OnNotificationAdded)
	Events.LocalPlayerTurnEnd.Add(BM_OnLocalPlayerTurnEnd)
end

Initialize()
