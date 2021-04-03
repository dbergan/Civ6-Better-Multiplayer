if not ExposedMembers.DB_BM then ExposedMembers.DB_BM = {} end
local DB_BM = ExposedMembers.DB_BM

function BM_DisloyalInformants_UI(ActivePlayerID)
	if (ActivePlayerID == -1 or ActivePlayerID > 62) then return nil end		-- if (blsFirstTime ~= true or ActivePlayerID == -1 or ActivePlayerID > 61 or DB_BM.YT_GetForeignTourists == nil) then return nil end


	local CityVision = {}

	local AlivePlayers = PlayerManager.GetAlive()
	for _, player in ipairs(AlivePlayers) do
		if player ~= nil then
			local TargetCityOwnerID = player:GetID()
			for _, city in player:GetCities():Members() do

--[[
print('')
print('', Locale.Lookup(city:GetName()))
--]]
				local CityIdentity = city:GetCulturalIdentity()
				if CityIdentity:GetLoyalty() <= 99 then
					local Radius = 0	-- Radius = 0 for just the city center tile
					if CityIdentity:GetLoyalty() < 80 then
						Radius = 2
					elseif CityIdentity:GetLoyalty() < 90 then
						Radius = 1
					end

					for _, PressureSource in ipairs(CityIdentity:GetCityIdentityPressures()) do
						if PressureSource.CityOwner ~= TargetCityOwnerID and PressureSource.CityOwner == ActivePlayerID and PressureSource.IdentityPressureTotal > 0 then
							local temp = { PlotX = city:GetX(), PlotY = city:GetY(), Radius = Radius }
							table.insert(CityVision, temp)
						end
					end
				end

--[[
print('', '', 'CityIdentity:GetConversionOutcome()', CityIdentity:GetConversionOutcome())
print('', '', 'CityIdentity:GetLoyalty()', CityIdentity:GetLoyalty())
print('', '', 'CityIdentity:GetLoyaltyLevel()', CityIdentity:GetLoyaltyLevel())
print('', '', 'CityIdentity:GetLoyaltyPerTurn()', CityIdentity:GetLoyaltyPerTurn())
print('', '', 'CityIdentity:GetLoyaltyPerTurnStatus()', CityIdentity:GetLoyaltyPerTurnStatus())
print('', '', 'CityIdentity:GetMaxLoyalty()', CityIdentity:GetMaxLoyalty())
print('', '', 'CityIdentity:GetPotentialTransferPlayer()', CityIdentity:GetPotentialTransferPlayer())
print('', '', 'CityIdentity:GetTurnsToConversion()', CityIdentity:GetTurnsToConversion())
print('', '', 'CityIdentity:IsAlwaysFullyLoyal()', CityIdentity:IsAlwaysFullyLoyal())

print('')
print('', '', 'CityIdentity:GetIdentitySourcesBreakdown()', CityIdentity:GetIdentitySourcesBreakdown())
				for key, value in ipairs(CityIdentity:GetIdentitySourcesBreakdown()) do
					for key2, value2 in pairs(value) do
print('', '', '', value2, key2)
					end
				end

print('')
print('', '', 'CityIdentity:GetIdentitySourcesDetailedBreakdown()', CityIdentity:GetIdentitySourcesDetailedBreakdown())
				for key, value in pairs(CityIdentity:GetIdentitySourcesDetailedBreakdown()) do
					for key2, value2 in pairs(value) do
print('', '', '', value2, key2)
					end
				end
		
	
print('')
print('', '', 'CityIdentity:GetCityIdentityPressures()', CityIdentity:GetCityIdentityPressures())
				for key, value in ipairs(CityIdentity:GetCityIdentityPressures()) do
					for key2, value2 in pairs(value) do
print('', '', '', value2, key2)
					end
				end
--]]




			end		-- city loop
		end		-- player if
	end		-- player loop

	return CityVision
end

function BM_DisloyalInformants_UI_Init()
	DB_BM.BM_DisloyalInformants_UI = BM_DisloyalInformants_UI
end
BM_DisloyalInformants_UI_Init()
