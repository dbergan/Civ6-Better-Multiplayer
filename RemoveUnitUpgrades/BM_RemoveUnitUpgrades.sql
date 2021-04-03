DELETE FROM UnitUpgrades ;

-- ?? --
-- DELETE FROM UnitPromotionPrereqs ;
-- ?? --


UPDATE ModifierArguments SET Value = 100 WHERE Name = 'Amount' AND 
(ModifierId = 'BARRACKS_TRAINED_UNIT_XP' OR
ModifierId = 'STABLE_TRAINED_UNIT_XP' OR
ModifierId = 'ARMORY_TRAINED_UNIT_XP' OR
ModifierId = 'MILITARY_ACADEMY_TRAINED_UNIT_XP' OR
ModifierId = 'LIGHTHOUSE_TRAINED_UNIT_XP' OR
ModifierId = 'SHIPYARD_TRAINED_UNIT_XP' OR
ModifierId = 'SEAPORT_TRAINED_UNIT_XP' OR
ModifierId = 'HANGAR_TRAINED_AIRCRAFT_XP' OR
ModifierId = 'AIRPORT_TRAINED_AIRCRAFT_XP') ;

UPDATE GlobalParameters SET Value = 999 WHERE Name = 'EXPERIENCE_MAXIMUM_ONE_COMBAT' ;