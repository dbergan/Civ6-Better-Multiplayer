DELETE FROM AllianceEffects WHERE AllianceType = 'ALLIANCE_MILITARY' ;
INSERT INTO AllianceEffects 
(LevelRequirement, AllianceType, ModifierID)
VALUES
(1, 'ALLIANCE_MILITARY', 'ALLIANCE_SHARE_VISIBILITY') ;