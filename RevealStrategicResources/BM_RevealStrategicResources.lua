function SRR_TakeawayTooEarlyResources (playerID, resourceID)
	local SRR_pPlayer = Players[playerID] ;
	local SRR_playerResources = SRR_pPlayer:GetResources();

	if resourceID == GameInfo.Resources['RESOURCE_HORSES'].Index and SRR_pPlayer:GetTechs():HasTech(GameInfo.Technologies["TECH_ANIMAL_HUSBANDRY"].Index) == false and SRR_playerResources:GetResourceAmount('RESOURCE_HORSES') > 0 then
		SRR_playerResources:ChangeResourceAmount (resourceID, -1 * SRR_playerResources:GetResourceAmount('RESOURCE_HORSES'));
	end

	if resourceID == GameInfo.Resources['RESOURCE_IRON'].Index and SRR_pPlayer:GetTechs():HasTech(GameInfo.Technologies["TECH_BRONZE_WORKING"].Index) == false and SRR_playerResources:GetResourceAmount('RESOURCE_IRON') > 0 then
		SRR_playerResources:ChangeResourceAmount (resourceID, -1 * SRR_playerResources:GetResourceAmount('RESOURCE_IRON'));
	end

	if resourceID == GameInfo.Resources['RESOURCE_NITER'].Index and SRR_pPlayer:GetTechs():HasTech(GameInfo.Technologies["TECH_MILITARY_ENGINEERING"].Index) == false and SRR_playerResources:GetResourceAmount('RESOURCE_NITER') > 0 then
		SRR_playerResources:ChangeResourceAmount (resourceID, -1 * SRR_playerResources:GetResourceAmount('RESOURCE_NITER'));
	end

	if resourceID == GameInfo.Resources['RESOURCE_COAL'].Index and SRR_pPlayer:GetTechs():HasTech(GameInfo.Technologies["TECH_INDUSTRIALIZATION"].Index) == false and SRR_playerResources:GetResourceAmount('RESOURCE_COAL') > 0 then
		SRR_playerResources:ChangeResourceAmount (resourceID, -1 * SRR_playerResources:GetResourceAmount('RESOURCE_COAL'));
	end

	if resourceID == GameInfo.Resources['RESOURCE_OIL'].Index and SRR_pPlayer:GetTechs():HasTech(GameInfo.Technologies["TECH_STEEL"].Index) == false and SRR_playerResources:GetResourceAmount('RESOURCE_OIL') > 0 then
		SRR_playerResources:ChangeResourceAmount (resourceID, -1 * SRR_playerResources:GetResourceAmount('RESOURCE_OIL'));
	end

	if resourceID == GameInfo.Resources['RESOURCE_ALUMINUM'].Index and SRR_pPlayer:GetTechs():HasTech(GameInfo.Technologies["TECH_RADIO"].Index) == false and SRR_playerResources:GetResourceAmount('RESOURCE_ALUMINUM') > 0 then
		SRR_playerResources:ChangeResourceAmount (resourceID, -1 * SRR_playerResources:GetResourceAmount('RESOURCE_ALUMINUM'));
	end

	if resourceID == GameInfo.Resources['RESOURCE_URANIUM'].Index and SRR_pPlayer:GetTechs():HasTech(GameInfo.Technologies["TECH_COMBINED_ARMS"].Index) == false and SRR_playerResources:GetResourceAmount('RESOURCE_URANIUM') > 0 then
		SRR_playerResources:ChangeResourceAmount (resourceID, -1 * SRR_playerResources:GetResourceAmount('RESOURCE_URANIUM'));
	end
end

Events.PlayerResourceChanged.Add( SRR_TakeawayTooEarlyResources );
