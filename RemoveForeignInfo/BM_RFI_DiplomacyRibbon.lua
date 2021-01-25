include("DiplomacyRibbon");

function UpdateStatValues( playerID:number, uiLeader:table )	

	local pPlayer:table = Players[playerID];

	if uiLeader.Score:IsVisible() then 
		local score	:number = Round( pPlayer:GetScore() );
		uiLeader.Score:SetText("[ICON_Capital]"..tostring(score));
	end

	if uiLeader.Military:IsVisible() then	
		local military :number = Round( Players[playerID]:GetStats():GetMilitaryStrengthWithoutTreasury() );
		uiLeader.Military:SetText( "[ICON_Strength]"..tostring(military));
	end

	if uiLeader.Science:IsVisible() then 
		local science :number = Round(pPlayer:GetTechs():GetScienceYield() );
		uiLeader.Science:SetText( "[ICON_Science]"..tostring(science));
	end

	if uiLeader.Culture:IsVisible() then 
		local culture :number = Round(pPlayer:GetCulture():GetCultureYield() );
		uiLeader.Culture:SetText( "[ICON_Culture]"..tostring(culture));
	end

	if uiLeader.Gold:IsVisible() then 		
		local pTreasury	:table	= pPlayer:GetTreasury();
		local gold		:number = math.floor( pTreasury:GetGoldBalance() );
		uiLeader.Gold:SetText( "[ICON_Gold]"..tostring(gold));
	end
	
	if uiLeader.Faith:IsVisible() then
		local faith	:number = Round( Players[playerID]:GetReligion():GetFaithBalance() );
		uiLeader.Faith:SetText( "[ICON_Faith]"..tostring(faith));
	end

	
--DB
--[[
	-- Show or hide all stats based on options.
	if m_ribbonStats == RibbonHUDStats.SHOW then
		if uiLeader.StatStack:IsHidden() or m_isIniting then
			ShowStats( uiLeader );
		end
	elseif m_ribbonStats == RibbonHUDStats.FOCUS or m_ribbonStats == RibbonHUDStats.HIDE then
		if uiLeader.StatStack:IsVisible() or m_isIniting then			
			HideStats( uiLeader );
		end
	end
--]]
	HideStats( uiLeader );
-- /DB
end
