-- DB - to clean out error in lua log when buying a GP
function Close()
end
-- /DB

-- ===========================================================================
--	Suk_GreatPeoplePopup
-- ===========================================================================

include("InstanceManager")
include("SupportFunctions")	-- Round(), Clamp()
include("GameCapabilities")
include("CivilizationIcon");

-- ===========================================================================
--	CONSTANTS
-- ===========================================================================

local CAN_RECRUIT				= HasCapability("CAPABILITY_GREAT_PEOPLE_CAN_RECRUIT")
local CAN_GOLD_RECRUIT			= HasCapability("CAPABILITY_GREAT_PEOPLE_RECRUIT_WITH_GOLD")
local CAN_FAITH_RECRUIT			= HasCapability("CAPABILITY_GREAT_PEOPLE_RECRUIT_WITH_FAITH")
local CAN_REJECT				= HasCapability("CAPABILITY_GREAT_PEOPLE_CAN_REJECT")
local MAX_COST					= 1000000

local MAX_ITEMS_PER_COLUMN		= 3
local SIZE_GP_ITEM_WIDTH		= 500
local SIZE_GP_ITEM_HEIGHT		= 200

local BOX_COLOR 				= UI.GetColorValueFromHexLiteral(0xFF5A360F)
local HL_BOX_COLOR 				= UI.GetColorValueFromHexLiteral(0xFFFFF8E8)
local COLOR_GP_UNSELECTED		= UI.GetColorValueFromHexLiteral(0xffe9dfc7) -- Background for unselected background (or forground text color on non-selected).
local COLOR_GP_SELECTED			= UI.GetColorValueFromHexLiteral(0xff261407) -- Background for selected background (or forground text color on selected).
local UNKNOWN_COLOR				= UI.GetColorValue(0.4, 0.4, 0.4, 1) -- Color to for unmet civ icons

local DOUBLE_SPACE				= "[NEWLINE][NEWLINE]"
-- ===========================================================================
--	MEMBERS
-- ===========================================================================

local m_GreatPeopleIM		= InstanceManager:new("GreatPersonInstance", "Top", Controls.PeopleStack)
local m_PlayerProgressIM	= InstanceManager:new("PlayerPointsInstance", "CivIconBackingFaded")

-- ===========================================================================
--	Sort
-- ===========================================================================
function SortPlayerPoints(tA, tB)
	if(tA.PointsTotal == tB.PointsTotal) then
		return tA.PlayerID < tB.PlayerID;
	else
		return tA.PointsTotal > tB.PointsTotal;
	end
end
-- ===========================================================================
--	On Button Click
-- ===========================================================================
function OnRecruitButtonClick( individualID:number )
	local pLocalPlayer = Players[Game.GetLocalPlayer()];
	if (pLocalPlayer ~= nil) then
		local kParameters:table = {};
		kParameters[PlayerOperations.PARAM_GREAT_PERSON_INDIVIDUAL_TYPE] = individualID;
		UI.RequestPlayerOperation(Game.GetLocalPlayer(), PlayerOperations.RECRUIT_GREAT_PERSON, kParameters);
		Close();
	end
end

function OnRejectButtonClick( individualID:number )
	local pLocalPlayer = Players[Game.GetLocalPlayer()];
	if (pLocalPlayer ~= nil) then
		local kParameters:table = {};
		kParameters[PlayerOperations.PARAM_GREAT_PERSON_INDIVIDUAL_TYPE] = individualID;
		UI.RequestPlayerOperation(Game.GetLocalPlayer(), PlayerOperations.REJECT_GREAT_PERSON, kParameters);
		Close();
	end
end

function OnGoldButtonClick( individualID:number  )
	local pLocalPlayer = Players[Game.GetLocalPlayer()];
	if (pLocalPlayer ~= nil) then
		local kParameters:table = {};
		kParameters[PlayerOperations.PARAM_GREAT_PERSON_INDIVIDUAL_TYPE] = individualID;
		kParameters[PlayerOperations.PARAM_YIELD_TYPE] = YieldTypes.GOLD;
		UI.RequestPlayerOperation(Game.GetLocalPlayer(), PlayerOperations.PATRONIZE_GREAT_PERSON, kParameters);
		UI.PlaySound("Purchase_With_Gold");
		Close();
	end
end

function OnFaithButtonClick( individualID:number  )
	local pLocalPlayer = Players[Game.GetLocalPlayer()];
	if (pLocalPlayer ~= nil) then
		local kParameters:table = {};
		kParameters[PlayerOperations.PARAM_GREAT_PERSON_INDIVIDUAL_TYPE] = individualID;
		kParameters[PlayerOperations.PARAM_YIELD_TYPE] = YieldTypes.FAITH;
		UI.RequestPlayerOperation(Game.GetLocalPlayer(), PlayerOperations.PATRONIZE_GREAT_PERSON, kParameters);
		UI.PlaySound("Purchase_With_Faith");
		Close();
	end
end
-- ===========================================================================
--	Generate Instance
-- ===========================================================================
function GenerateGreatPersonInstance(kData, kPerson)
	local tInstance = m_GreatPeopleIM:GetInstance()
	-------------------------------------------
	-- Appearance Variables
	-------------------------------------------
	local bNoneAvailable	= kPerson.IndividualID == nil
	local bCanRecruit		= (not bNoneAvailable) and (CAN_RECRUIT and kPerson.CanRecruit and kPerson.RecruitCost ~= nil)
	local bCanGoldRecruit	= CAN_GOLD_RECRUIT and (not kPerson.CanRecruit and not kPerson.CanReject and kPerson.PatronizeWithGoldCost ~= nil and kPerson.PatronizeWithGoldCost < MAX_COST)
	local bCanFaithRecruit	= CAN_FAITH_RECRUIT and (not kPerson.CanRecruit and not kPerson.CanReject and kPerson.PatronizeWithFaithCost ~= nil and kPerson.PatronizeWithFaithCost < MAX_COST)
	local bCanReject		= CAN_REJECT and kPerson.CanReject and kPerson.RejectCost ~= nil

	local sTexture			= bCanRecruit and "Governments_BackingSelected" or "Governments_Backing"
	local iTextColor		= bCanRecruit and COLOR_GP_SELECTED or COLOR_GP_UNSELECTED
	local iBonusBoxColor	= bCanRecruit and HL_BOX_COLOR or BOX_COLOR
	-------------------------------------------
	-- Set Textures and Colors
	-------------------------------------------
	tInstance.Top:SetTexture(sTexture)

	tInstance.BonusBacking1:SetColor(iBonusBoxColor)
	tInstance.BonusBacking2:SetColor(iBonusBoxColor)
	tInstance.BonusBacking3:SetColor(iBonusBoxColor)

	tInstance.Bonus1:SetColor(iTextColor)
	tInstance.Bonus2:SetColor(iTextColor)
	tInstance.Bonus3:SetColor(iTextColor)
	tInstance.IndividualName:SetColor(iTextColor)

	tInstance.Contents:SetHide(bNoneAvailable)
	tInstance.ClaimedLabel:SetHide(not bNoneAvailable)

	tInstance.RecruitStack:SetHide(bNoneAvailable);

	if bNoneAvailable then return end
	-------------------------------------------
	-- Person Info Variables
	-------------------------------------------
	local kClass		= GameInfo.GreatPersonClasses[kPerson.ClassID]
	local iLocalPlayer	= Game.GetLocalPlayer()

	local sName		= Locale.ToUpper(kPerson.Name)
	local sClass	= Locale.ToUpper(Locale.Lookup(kClass.Name))
	local sRomanEra	= Locale.ToRomanNumeral(kPerson.EraID + 1)
	local sEra		= Locale.Lookup(GameInfo.Eras[kPerson.EraID].Name)
	local sFontIcon	= kClass.IconString
	local sIcon		= kClass.ActionIcon

	local sPassiveName	= kPerson.PassiveNameText
	local sPassiveDesc	= kPerson.PassiveEffectText
	local sActiveName	= kPerson.ActionNameText
	local sActiveDesc	= kPerson.ActionEffectText
	local iCharges		= kPerson.ActionCharges
	local sCharges		= iCharges < 1 and "" or " (" .. Locale.Lookup("LOC_GREATPERSON_ACTION_CHARGES", iCharges) .. ")"

	local bTwoBoxes		= (#sPassiveDesc > 0) and (#sActiveDesc > 0)
	local bCanEarn		= not(kPerson.EarnConditions) or #kPerson.EarnConditions < 1
	-------------------------------------------
	-- Populate Info
	-------------------------------------------
	local sLabel = sName and (sClass .. " - " .. sName) or sClass
	tInstance.IndividualName:SetText(sLabel)
	tInstance.EraLabel:SetText(sRomanEra)
	tInstance.Era:SetToolTipString(sEra)
	tInstance.GreatPersonIcon:SetIcon(sIcon)

	local pActiveControl	= bTwoBoxes and tInstance.Bonus3 or tInstance.Bonus1
	local sPassive			= sPassiveName .. DOUBLE_SPACE .. sPassiveDesc
	local sActive			= sActiveName .. sCharges .. DOUBLE_SPACE .. sActiveDesc

	tInstance.BonusBacking1:SetHide(bTwoBoxes)
	tInstance.BonusBacking2:SetHide(not bTwoBoxes)
	tInstance.BonusBacking3:SetHide(not bTwoBoxes)
	tInstance.Bonus2:SetText(sPassive)
	pActiveControl:SetText(sActive)
	-------------------------------------------
	-- Recruiting Standings
	-------------------------------------------
	local tPlayerPoints			= {}
	local bCanEarnMore			= nil -- Store the info here instead of making a copy.
	local tPlayerPoints_Local	= nil

	-- make a local copy for sorting
	for i, tPlayer in ipairs(kData.PointsByClass[kPerson.ClassID]) do
-- DB - limit recruitment info to just the local player [BM_RFI]
		if tPlayer.PlayerID == Game.GetLocalPlayer() then
			table.insert(tPlayerPoints, tPlayer)
		end
-- /DB
	end
	table.sort(tPlayerPoints, SortPlayerPoints)

	for i, tPlayer in ipairs(tPlayerPoints) do
		if (i <= 3) or (tPlayer.PlayerID == iLocalPlayer) then
			if (tPlayer.PlayerID == iLocalPlayer) then
				local iMaxEarnable	= tPlayer.MaxPlayerInstances
				local iEarned		= tPlayer.NumInstancesEarned
				bCanEarnMore		= (iMaxEarnable and iEarned) and (iMaxEarnable > iEarned)

				tPlayerPoints_Local	= tPlayerPoints[i]
			end
			GeneratePlayerPointsInstance(kPerson, tPlayer, tInstance)
		end
	end

	tInstance.CivIconStack:CalculateSize()
	tInstance.CivIconStack_TTCatcher:SetSizeVal(tInstance.CivIconStack:GetSizeX(), tInstance.CivIconStack:GetSizeY())
	LuaEvents.Suk_SetGreatPersonTooltip(tInstance.CivIconStack_TTCatcher, tPlayerPoints, kPerson)
	-------------------------------------------
	-- Progress Points
	-------------------------------------------
	local iPointsCur		= Round(tPlayerPoints_Local.PointsTotal, 1)
	local iPointsReq		= kPerson.RecruitCost
	local iPointsPerTurn	= Round(tPlayerPoints_Local.PointsPerTurn, 1)

	local bShowProgress = (bCanEarnMore or bCanEarn) and not bCanRecruit
	local iOffset		= 45

	tInstance.Progress:SetHide(not bShowProgress)
	if bShowProgress then
		iOffset = 48
		local sProgress = iPointsCur .. "/" .. iPointsReq .. " ".. sFontIcon .. ", +" .. iPointsPerTurn
		tInstance.Progress:SetText(sProgress)
	end

	tInstance.BonusStack:SetOffsetVal(0, iOffset)
	-------------------------------------------
	-- Recruit Buttons
	-------------------------------------------
	if not bCanEarn then
		local sRecruitTooltip = "[COLOR_RED]" .. kPerson.EarnConditions .. "[ENDCOLOR]"
		tInstance.CannotRecruitButton:SetToolTipString(sRecruitTooltip)
	end
	tInstance.CannotRecruitButton:SetHide(bCanEarn)

	if bCanRecruit then
		tInstance.RecruitButton:SetToolTipString(Locale.Lookup("LOC_GREAT_PEOPLE_RECRUIT_DETAILS", kPerson.RecruitCost));
		tInstance.RecruitButton:SetVoid1(kPerson.IndividualID);
		tInstance.RecruitButton:RegisterCallback(Mouse.eLClick, OnRecruitButtonClick);
	end
	tInstance.RecruitButton:SetHide(not bCanRecruit)

	if bCanGoldRecruit then
		local bCanBuyNow	= kPerson.CanPatronizeWithGold
		local iCost			= kPerson.PatronizeWithGoldCost

		tInstance.GoldButtonLabel:SetAlpha(bCanBuyNow and 1 or 0.5)
		tInstance.GoldButtonLabel:SetText(iCost .. "[ICON_Gold]")
		tInstance.GoldButton:SetToolTipString(Locale.Lookup("LOC_GREAT_PEOPLE_PATRONAGE_GOLD_DETAILS", iCost))
		tInstance.GoldButton:SetVoid1(kPerson.IndividualID)
		tInstance.GoldButton:RegisterCallback(Mouse.eLClick, OnGoldButtonClick)
		tInstance.GoldButton:SetDisabled(not bCanBuyNow)
	end
	tInstance.GoldButton:SetHide(not bCanGoldRecruit)

	if bCanFaithRecruit then
		local bCanBuyNow	= kPerson.CanPatronizeWithFaith
		local iCost			= kPerson.PatronizeWithFaithCost

		tInstance.FaithButtonLabel:SetAlpha(bCanBuyNow and 1 or 0.5)
		tInstance.FaithButtonLabel:SetText(iCost .. "[ICON_Faith]")
		tInstance.FaithButton:SetToolTipString(Locale.Lookup("LOC_GREAT_PEOPLE_PATRONAGE_FAITH_DETAILS", iCost))
		tInstance.FaithButton:SetVoid1(kPerson.IndividualID)
		tInstance.FaithButton:RegisterCallback(Mouse.eLClick, OnFaithButtonClick)
		tInstance.FaithButton:SetDisabled(not bCanBuyNow)
	end
	tInstance.FaithButton:SetHide(not bCanFaithRecruit)

	if bCanReject then
		tInstance.RejectButton:SetToolTipString(Locale.Lookup("LOC_GREAT_PEOPLE_PASS_DETAILS", kPerson.RejectCost))
		tInstance.RejectButton:SetVoid1(kPerson.IndividualID)
		tInstance.RejectButton:RegisterCallback(Mouse.eLClick, OnRejectButtonClick)
	end
	tInstance.RejectButton:SetHide(not bCanReject)
end

function GeneratePlayerPointsInstance(kPerson, kPlayerPoints, tParent)
	local tInstance = m_PlayerProgressIM:GetInstance(tParent.CivIconStack)
	local iProgress = Clamp(kPlayerPoints.PointsTotal/kPerson.RecruitCost, 0, 1)
	local iPlayer	= kPlayerPoints.PlayerID
	local bIsLocal	= iPlayer == Game.GetLocalPlayer()

	tInstance.LocalPlayer:SetHide(not bIsLocal)
	--------------------------------------------------------
	-- Faded Icon
	--------------------------------------------------------
	local pFadedIcon = CivilizationIcon:AttachInstance(
		{
			CivIconBacking	= tInstance.CivIconBackingFaded,
			CivIcon			= tInstance.CivIconFaded,
		}
	)
	pFadedIcon:UpdateIconFromPlayerID(iPlayer)
	-- UpdateIconFromPlayerID also sets color, so we need to undo that
	tInstance.CivIconBackingFaded:SetColor(UNKNOWN_COLOR)
	tInstance.CivIconFaded:SetColor(UNKNOWN_COLOR)
	--------------------------------------------------------
	-- Color Icon
	--------------------------------------------------------
	local pFullIcon = CivilizationIcon:AttachInstance(
		{
			CivIconBacking	= tInstance.CivIconBacking,
			CivIcon			= tInstance.CivIcon,
		}
	)
	pFullIcon:UpdateIconFromPlayerID(iPlayer)
	-- Set Progress Percentage
	tInstance.CivIcon:SetPercent(iProgress);
	tInstance.CivIconBacking:SetPercent(iProgress);
	--------------------------------------------------------
	--------------------------------------------------------
end
-- ===========================================================================
--	On Refresh
-- ===========================================================================
function On_Suk_GreatPeoplePopup(kData)
	m_PlayerProgressIM:ResetInstances()
	m_GreatPeopleIM:ResetInstances()
	-------------------------------------------
	-- Generate Instances for each Great Person
	-------------------------------------------
	for _, kPerson in ipairs(kData.Timeline) do
		GenerateGreatPersonInstance(kData, kPerson)
	end
	-------------------------------------------
	-- Get variables ready for the grid
	-------------------------------------------
	local iMaxHeight			= Controls.PeopleStack:GetSizeY()
	local iMaxWidth				= Controls.Top:GetSizeX()

	local iNumInstances			= m_GreatPeopleIM.m_iAllocatedInstances
	local iInstancesPerRow		= math.ceil(iNumInstances/MAX_ITEMS_PER_COLUMN)
	local iInstancesPerRowVis	= math.floor(iMaxWidth/SIZE_GP_ITEM_WIDTH)
	local iPaddingY				= (iMaxHeight - (MAX_ITEMS_PER_COLUMN * SIZE_GP_ITEM_HEIGHT))/(MAX_ITEMS_PER_COLUMN + 1)
	local iPaddingX				= (iMaxWidth - (iInstancesPerRowVis * SIZE_GP_ITEM_WIDTH))/(iInstancesPerRowVis + 1)
	local iSizeX				= iInstancesPerRow * (SIZE_GP_ITEM_WIDTH + iPaddingX) - iPaddingX
	local iCenterX				= iSizeX/2
	-------------------------------------------
	-- Now arrange in a grid
	-------------------------------------------
	for i,tInstance in ipairs(m_GreatPeopleIM.m_AllocatedInstances) do
		iX = math.floor((i - 1)/MAX_ITEMS_PER_COLUMN)
		iY = ((i - 1)%MAX_ITEMS_PER_COLUMN) + 1

		local iPosX = iX * (SIZE_GP_ITEM_WIDTH + iPaddingX);
		local iPosY = (iY * (iPaddingY + SIZE_GP_ITEM_HEIGHT)) - (SIZE_GP_ITEM_HEIGHT);

		tInstance.Top:SetOffsetVal((iPosX - iCenterX + SIZE_GP_ITEM_WIDTH/2), iPosY);	-- Spread centered
	end
	-------------------------------------------
	-- Finally, size the scroll area
	-------------------------------------------
	Controls.PeopleStack:SetSizeX(math.max(iMaxWidth, iSizeX + iPaddingX));
	Controls.PeopleScroller:CalculateSize();
end
-- ===========================================================================
-- ===========================================================================
function OnShutdown()
	m_PlayerProgressIM:DestroyInstances()
	m_GreatPeopleIM:DestroyInstances()
	LuaEvents.Suk_GreatPeoplePopup.Remove(On_Suk_GreatPeoplePopup)
end

function Initialize()
	LuaEvents.Suk_GreatPeoplePopup.Add(On_Suk_GreatPeoplePopup)
	ContextPtr:SetShutdown(OnShutdown);
end
Initialize();