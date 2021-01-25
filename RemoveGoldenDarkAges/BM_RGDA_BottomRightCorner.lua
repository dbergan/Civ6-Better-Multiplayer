include("ActionPanel_Expansion1");


function OnRefresh()

	BASE_OnRefresh();

	-- disable the Era indicators entirely
    Controls.TurnAgeAnimation:SetTexture("ActionPanel_TurnProcessing");
    Controls.EndTurnButtonLabel:SetTexture("ActionPanel_TurnBlocker");
    Controls.DarkAgeShadow:SetHide(true);
    Controls.GoldenAgeAnimation:SetHide(true);

    Controls.EraToolTipArea1:SetHide(true);
    Controls.EraToolTipArea2:SetHide(true);
	Controls.TurnTimerMeterWarning:SetHide(true);
    Controls.AgeLabelCurrent:SetHide(true);
    Controls.TurnTimerMeterGolden:SetHide(true);
    Controls.TurnTimerMeterNormal:SetHide(true);
    Controls.AgeScoreStack:SetHide(true);
end


function LateInitialize()
	BASE_LateInitialize();
	-- Controls.AgeButtonBG:RegisterCallback( Mouse.eLClick, OnAgeButtonClicked )
	ContextPtr:SetRefreshHandler(OnRefresh);
end