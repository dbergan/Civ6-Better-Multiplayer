PRIOR_UpdateStatValues = UpdateStatValues

function UpdateStatValues(playerID, uiLeader)
	if not GameConfiguration.GetValue("BM_REMOVE_FOREIGN_INFO") then return PRIOR_UpdateStatValues(playerID, uiLeader) end

	HideStats(uiLeader)
end