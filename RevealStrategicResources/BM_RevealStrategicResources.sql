-- Revealing Resources
INSERT INTO GameModifiers
(ModifierId)
VALUES 
('SRR_REVEAL_HORSES_PLAYERS_ATTACH_MODIFIER'),
('SRR_REVEAL_IRON_PLAYERS_ATTACH_MODIFIER'),
('SRR_REVEAL_NITER_PLAYERS_ATTACH_MODIFIER'),
('SRR_REVEAL_COAL_PLAYERS_ATTACH_MODIFIER'),
('SRR_REVEAL_OIL_PLAYERS_ATTACH_MODIFIER'),
('SRR_REVEAL_ALUMINUM_PLAYERS_ATTACH_MODIFIER'),
('SRR_REVEAL_URANIUM_PLAYERS_ATTACH_MODIFIER') ;

INSERT INTO Modifiers 
(ModifierId,									ModifierType)
VALUES
('SRR_REVEAL_HORSES_PLAYERS_ATTACH_MODIFIER',	'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER'),
('SRR_REVEAL_IRON_PLAYERS_ATTACH_MODIFIER',		'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER'),
('SRR_REVEAL_NITER_PLAYERS_ATTACH_MODIFIER',	'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER'),
('SRR_REVEAL_COAL_PLAYERS_ATTACH_MODIFIER',		'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER'),
('SRR_REVEAL_OIL_PLAYERS_ATTACH_MODIFIER',		'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER'),
('SRR_REVEAL_ALUMINUM_PLAYERS_ATTACH_MODIFIER',	'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER'),
('SRR_REVEAL_URANIUM_PLAYERS_ATTACH_MODIFIER',	'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER') ;

INSERT INTO ModifierArguments
(ModifierId,									Name,			Value) 
VALUES
('SRR_REVEAL_HORSES_PLAYERS_ATTACH_MODIFIER',	'ModifierId',	'SRR_REVEAL_HORSES'),
('SRR_REVEAL_IRON_PLAYERS_ATTACH_MODIFIER',		'ModifierId',	'SRR_REVEAL_IRON'),
('SRR_REVEAL_NITER_PLAYERS_ATTACH_MODIFIER',	'ModifierId',	'SRR_REVEAL_NITER'),
('SRR_REVEAL_COAL_PLAYERS_ATTACH_MODIFIER',		'ModifierId',	'SRR_REVEAL_COAL'),
('SRR_REVEAL_OIL_PLAYERS_ATTACH_MODIFIER',		'ModifierId',	'SRR_REVEAL_OIL'),
('SRR_REVEAL_ALUMINUM_PLAYERS_ATTACH_MODIFIER',	'ModifierId',	'SRR_REVEAL_ALUMINUM'),
('SRR_REVEAL_URANIUM_PLAYERS_ATTACH_MODIFIER',	'ModifierId',	'SRR_REVEAL_URANIUM') ;

INSERT INTO Modifiers 
(ModifierId,			ModifierType) 
VALUES
('SRR_REVEAL_HORSES',	'MODIFIER_PLAYER_GRANT_FREE_RESOURCE_VISIBILITY'),
('SRR_REVEAL_IRON',		'MODIFIER_PLAYER_GRANT_FREE_RESOURCE_VISIBILITY'),
('SRR_REVEAL_NITER',	'MODIFIER_PLAYER_GRANT_FREE_RESOURCE_VISIBILITY'),
('SRR_REVEAL_COAL',		'MODIFIER_PLAYER_GRANT_FREE_RESOURCE_VISIBILITY'),
('SRR_REVEAL_OIL',		'MODIFIER_PLAYER_GRANT_FREE_RESOURCE_VISIBILITY'),
('SRR_REVEAL_ALUMINUM', 'MODIFIER_PLAYER_GRANT_FREE_RESOURCE_VISIBILITY'),
('SRR_REVEAL_URANIUM',	'MODIFIER_PLAYER_GRANT_FREE_RESOURCE_VISIBILITY') ;

INSERT INTO ModifierArguments
(ModifierId,			Name,			Value)
VALUES
('SRR_REVEAL_HORSES',	'ResourceType', 'RESOURCE_HORSES'),
('SRR_REVEAL_IRON',		'ResourceType', 'RESOURCE_IRON'),
('SRR_REVEAL_NITER',	'ResourceType', 'RESOURCE_NITER'),
('SRR_REVEAL_COAL',		'ResourceType', 'RESOURCE_COAL'),
('SRR_REVEAL_OIL',		'ResourceType', 'RESOURCE_OIL'),
('SRR_REVEAL_ALUMINUM',	'ResourceType', 'RESOURCE_ALUMINUM'),
('SRR_REVEAL_URANIUM',	'ResourceType', 'RESOURCE_URANIUM') ;


-- Remove Yields for strategic resources
DELETE FROM Resource_YieldChanges WHERE 
ResourceType = 'RESOURCE_HORSES' OR
ResourceType = 'RESOURCE_IRON' OR
ResourceType = 'RESOURCE_NITER' OR
ResourceType = 'RESOURCE_COAL' OR
ResourceType = 'RESOURCE_OIL' OR
ResourceType = 'RESOURCE_ALUMINUM' OR
ResourceType = 'RESOURCE_URANIUM' ;


-- Buildings to eat strategic resources
INSERT INTO GameModifiers
(ModifierId)
VALUES 
('SRR_STOP_GATHERING_HORSES_PLAYERS_ATTACH_MODIFIER'),
('SRR_STOP_GATHERING_IRON_PLAYERS_ATTACH_MODIFIER'),
('SRR_STOP_GATHERING_NITER_PLAYERS_ATTACH_MODIFIER'),
('SRR_STOP_GATHERING_COAL_PLAYERS_ATTACH_MODIFIER'),
('SRR_STOP_GATHERING_OIL_PLAYERS_ATTACH_MODIFIER'),
('SRR_STOP_GATHERING_ALUMINUM_PLAYERS_ATTACH_MODIFIER'),
('SRR_STOP_GATHERING_URANIUM_PLAYERS_ATTACH_MODIFIER') ;

INSERT INTO Modifiers 
(ModifierId,											ModifierType)
VALUES
('SRR_STOP_GATHERING_HORSES_PLAYERS_ATTACH_MODIFIER',	'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER'),
('SRR_STOP_GATHERING_IRON_PLAYERS_ATTACH_MODIFIER',		'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER'),
('SRR_STOP_GATHERING_NITER_PLAYERS_ATTACH_MODIFIER',	'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER'),
('SRR_STOP_GATHERING_COAL_PLAYERS_ATTACH_MODIFIER',		'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER'),
('SRR_STOP_GATHERING_OIL_PLAYERS_ATTACH_MODIFIER',		'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER'),
('SRR_STOP_GATHERING_ALUMINUM_PLAYERS_ATTACH_MODIFIER',	'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER'),
('SRR_STOP_GATHERING_URANIUM_PLAYERS_ATTACH_MODIFIER',	'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER') ;

INSERT INTO ModifierArguments
(ModifierId,											Name,			Value) 
VALUES
('SRR_STOP_GATHERING_HORSES_PLAYERS_ATTACH_MODIFIER',	'ModifierId',	'SRR_STOP_GATHERING_HORSES'),
('SRR_STOP_GATHERING_IRON_PLAYERS_ATTACH_MODIFIER',		'ModifierId',	'SRR_STOP_GATHERING_IRON'),
('SRR_STOP_GATHERING_NITER_PLAYERS_ATTACH_MODIFIER',	'ModifierId',	'SRR_STOP_GATHERING_NITER'),
('SRR_STOP_GATHERING_COAL_PLAYERS_ATTACH_MODIFIER',		'ModifierId',	'SRR_STOP_GATHERING_COAL'),
('SRR_STOP_GATHERING_OIL_PLAYERS_ATTACH_MODIFIER',		'ModifierId',	'SRR_STOP_GATHERING_OIL'),
('SRR_STOP_GATHERING_ALUMINUM_PLAYERS_ATTACH_MODIFIER',	'ModifierId',	'SRR_STOP_GATHERING_ALUMINUM'),
('SRR_STOP_GATHERING_URANIUM_PLAYERS_ATTACH_MODIFIER',	'ModifierId',	'SRR_STOP_GATHERING_URANIUM') ;

INSERT INTO Modifiers 
(ModifierId,					ModifierType) 
VALUES
('SRR_STOP_GATHERING_HORSES',	'MODIFIER_PLAYER_ADJUST_RESOURCE_ACCUMULATION_MODIFIER'),
('SRR_STOP_GATHERING_IRON',		'MODIFIER_PLAYER_ADJUST_RESOURCE_ACCUMULATION_MODIFIER'),
('SRR_STOP_GATHERING_NITER',	'MODIFIER_PLAYER_ADJUST_RESOURCE_ACCUMULATION_MODIFIER'),
('SRR_STOP_GATHERING_COAL',		'MODIFIER_PLAYER_ADJUST_RESOURCE_ACCUMULATION_MODIFIER'),
('SRR_STOP_GATHERING_OIL',		'MODIFIER_PLAYER_ADJUST_RESOURCE_ACCUMULATION_MODIFIER'),
('SRR_STOP_GATHERING_ALUMINUM', 'MODIFIER_PLAYER_ADJUST_RESOURCE_ACCUMULATION_MODIFIER'),
('SRR_STOP_GATHERING_URANIUM',	'MODIFIER_PLAYER_ADJUST_RESOURCE_ACCUMULATION_MODIFIER') ;

INSERT INTO ModifierArguments
(ModifierId,					Name,			Value)
VALUES
('SRR_STOP_GATHERING_HORSES',	'ResourceType', 'RESOURCE_HORSES'),
('SRR_STOP_GATHERING_HORSES',	'Amount',		-2),
('SRR_STOP_GATHERING_IRON',		'ResourceType', 'RESOURCE_IRON'),
('SRR_STOP_GATHERING_IRON',		'Amount',		-2),
('SRR_STOP_GATHERING_NITER',	'ResourceType', 'RESOURCE_NITER'),
('SRR_STOP_GATHERING_NITER',	'Amount',		-2),
('SRR_STOP_GATHERING_COAL',		'ResourceType', 'RESOURCE_COAL'),
('SRR_STOP_GATHERING_COAL',		'Amount',		-3),
('SRR_STOP_GATHERING_OIL',		'ResourceType', 'RESOURCE_OIL'),
('SRR_STOP_GATHERING_OIL',		'Amount',		-3),
('SRR_STOP_GATHERING_ALUMINUM',	'ResourceType', 'RESOURCE_ALUMINUM'),
('SRR_STOP_GATHERING_ALUMINUM',	'Amount',		-2),
('SRR_STOP_GATHERING_URANIUM',	'ResourceType', 'RESOURCE_URANIUM'),
('SRR_STOP_GATHERING_URANIUM',	'Amount',		-3) ;

-- Misc
DELETE FROM GoodyHutSubTypes WHERE SubTypeGoodyHut = 'GOODYHUT_RESOURCES' ;
DELETE FROM GoodyHutSubTypes_XP2 WHERE SubTypeGoodyHut = 'GOODYHUT_RESOURCES' ;

-- Olympic Pantheons // Soli Deo Gloria
DELETE FROM Beliefs WHERE BeliefType = 'OP_HEPHAESTUS' OR BeliefType = 'SDG_I_AM_DEATH' ;

