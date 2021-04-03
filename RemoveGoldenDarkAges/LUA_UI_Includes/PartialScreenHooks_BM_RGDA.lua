PRIOR_AddEraHook = AddEraHook
function AddEraHook()
	if HasCapability("CAPABILITY_GOLDEN_AND_DARK_AGES") then
		PRIOR_AddEraHook()
	end
end