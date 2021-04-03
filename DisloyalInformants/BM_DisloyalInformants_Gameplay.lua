if not ExposedMembers.DB_BM then ExposedMembers.DB_BM = {} end
local DB_BM = ExposedMembers.DB_BM

BM_DI_RevealedPlots = {}

function BM_DI_ChangeVisibility(PlayerID, X, Y, Radius, Visibility)
	local Vis = PlayersVisibility[PlayerID]
	local Center = Map.GetPlot(X, Y)
	local PlotTable = BM_DI_GetPlotTable(Center, Radius)
	
	for _, TempPlot in pairs(PlotTable) do
		if Visibility == true and Vis:IsVisible(TempPlot:GetX(), TempPlot:GetY()) == false then
			-- Making Visible
			if not BM_DI_RevealedPlots[PlayerID] then BM_DI_RevealedPlots[PlayerID] = {} end
			Vis:ChangeVisibilityCount(TempPlot:GetIndex(), 1)
			table.insert(BM_DI_RevealedPlots[PlayerID], TempPlot:GetIndex())

		elseif Visibility == false and Vis:IsVisible(TempPlot:GetX(), TempPlot:GetY()) == true then
			-- Making Invisible
			Vis:ChangeVisibilityCount(TempPlot:GetIndex(), -1)

		end
    end
end

function BM_DI_GetPlotTable(Center, Radius)
	local TempTable = {}
	if Center ~= nil then
		local x, y = Center:GetX(), Center:GetY()
		if Radius == 0 then
			local TempPlot = Map.GetPlotXYWithRangeCheck(x, y, 0, 0, Radius)
			if TempPlot then
				table.insert(TempTable, TempPlot)
			end
		else
			for TempX = (Radius * -1), Radius do
				for TempY = (Radius * -1), Radius do
					local TempPlot = Map.GetPlotXYWithRangeCheck(x, y, TempX, TempY, Radius)
					if TempPlot then
						table.insert(TempTable, TempPlot)
					end
				end
			end
		end
	end
	return TempTable
end

function BM_DI_HideRevealedDisloyalInformantsTiles(ActivePlayerID)
	local Vis = PlayersVisibility[ActivePlayerID]
	if BM_DI_RevealedPlots[ActivePlayerID] ~= nil then
		for _, value in pairs(BM_DI_RevealedPlots[ActivePlayerID]) do
			local TempPlot = Map.GetPlotByIndex(value)
			if Vis:IsVisible(TempPlot:GetX(), TempPlot:GetY()) == true then
				Vis:ChangeVisibilityCount(value, -1)
			end
		end
	end
	BM_DI_RevealedPlots[ActivePlayerID] = {}
end



function BM_DisloyalInformants_Gameplay(ActivePlayerID, blsFirstTime)
	if (blsFirstTime ~= true or ActivePlayerID == -1 or ActivePlayerID > 62 or DB_BM.BM_DisloyalInformants_UI == nil) then return nil end

	local CityVision = DB_BM.BM_DisloyalInformants_UI(ActivePlayerID)
	for _, v in pairs(CityVision) do
		BM_DI_ChangeVisibility(ActivePlayerID, v.PlotX, v.PlotY, v.Radius, true)
	end

end

function BM_DisloyalInformants_Gameplay_Init()
	Events.PlayerTurnActivated.Add(BM_DisloyalInformants_Gameplay)
	Events.PlayerTurnDeactivated.Add(BM_DI_HideRevealedDisloyalInformantsTiles)
end

BM_DisloyalInformants_Gameplay_Init()