-- FOMENT UNREST

UPDATE GlobalParameters SET Value = -100 WHERE Name = 'ESPIONAGE_FOMENT_UNREST_BASE_LOYALTY_CHANGE' ;
UPDATE GlobalParameters SET Value = 0 WHERE Name = 'ESPIONAGE_FOMENT_UNREST_LEVEL_LOYALTY_CHANGE' ;



-- GREAT WORKS

INSERT INTO GameModifiers (ModifierId) VALUES ('BM_LM_LOYALTY_FROM_GREAT_WORKS_ALL_PLAYERS_ATTACH_MODIFIER') ;

INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('BM_LM_LOYALTY_FROM_GREAT_WORKS_ALL_PLAYERS_ATTACH_MODIFIER', 'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('BM_LM_LOYALTY_FROM_GREAT_WORKS_ALL_PLAYERS_ATTACH_MODIFIER', 'ModifierId', 'BM_LM_LOYALTY_FROM_GREAT_WORKS') ;

INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('BM_LM_LOYALTY_FROM_GREAT_WORKS', 'MODIFIER_PLAYER_ADJUST_IDENTITY_PER_TURN_FROM_NEARBY_GREAT_WORKS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
('BM_LM_LOYALTY_FROM_GREAT_WORKS', 'Amount', 1),
('BM_LM_LOYALTY_FROM_GREAT_WORKS', 'ForeignCities', 1),
('BM_LM_LOYALTY_FROM_GREAT_WORKS', 'DomesticCities', 1) ;


-- DISTRICTS & BUILDINGS

-- Adjust existing monument modifier
UPDATE ModifierArguments SET Value = 1 WHERE ModifierId = 'MONUMENT_LOYALTY'  AND Name = 'Amount' ;

-- ***** From DB_lib.sql *****

-- Plot within 9 tiles of where the modifier is attached (DB_REQ_WITHIN_9_TILES, DB_REQSET_WITHIN_9_TILES)
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) VALUES ('DB_REQ_WITHIN_9_TILES', 'REQUIREMENT_PLOT_ADJACENT_TO_OWNER') ;
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) VALUES 
('DB_REQ_WITHIN_9_TILES', 'MinDistance', 0),
('DB_REQ_WITHIN_9_TILES', 'MaxDistance', 9) ;
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('DB_REQSET_WITHIN_9_TILES', 'REQUIREMENTSET_TEST_ALL') ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('DB_REQSET_WITHIN_9_TILES', 'DB_REQ_WITHIN_9_TILES') ;


-- Adjust loyalty to all other cities
--	 CITIES (Amount)
--   Attach with BuildingModifiers or DistrictModifiers and use requirements of type REQUIREMENT_PLOT_ADJACENT_BUILDING_TYPE_MATCHES or REQUIREMENT_PLOT_ADJACENT_DISTRICT_TYPE_MATCHES to filter cities with a range of the Building/District
--   My method was often to apply negative loyalty to all cities, and then use the following domestic cities version to undo the negative amounts on the players's own cities
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_ALL_CITIES_ADJUST_IDENTITY_PER_TURN', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_ALL_CITIES_ADJUST_IDENTITY_PER_TURN', 'COLLECTION_ALL_CITIES', 'EFFECT_ADJUST_CITY_IDENTITY_PER_TURN') ;

-- Adjust loyalty to all domestic cities 
--	 CITIES (Amount)
--   Attach with BuildingModifiers or DistrictModifiers and use requirements of type REQUIREMENT_PLOT_ADJACENT_BUILDING_TYPE_MATCHES or REQUIREMENT_PLOT_ADJACENT_DISTRICT_TYPE_MATCHES to filter cities with a range of the Building/District
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_PLAYER_CITIES_ADJUST_IDENTITY_PER_TURN', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_PLAYER_CITIES_ADJUST_IDENTITY_PER_TURN', 'COLLECTION_PLAYER_CITIES', 'EFFECT_ADJUST_CITY_IDENTITY_PER_TURN') ;

-- ****************************


INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('BM_LM_MOD_MINUS_1_IDENTITY_ON_ALL_CITIES_WITHIN_9_TILES', 'DB_DM_ALL_CITIES_ADJUST_IDENTITY_PER_TURN', 'DB_REQSET_WITHIN_9_TILES') ;
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES ('BM_LM_MOD_MINUS_1_IDENTITY_ON_ALL_CITIES_WITHIN_9_TILES', 'Amount', -1) ;

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('BM_LM_MOD_PLUS_2_IDENTITY_ON_PLAYER_CITIES_WITHIN_9_TILES', 'DB_DM_PLAYER_CITIES_ADJUST_IDENTITY_PER_TURN', 'DB_REQSET_WITHIN_9_TILES') ;
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES ('BM_LM_MOD_PLUS_2_IDENTITY_ON_PLAYER_CITIES_WITHIN_9_TILES', 'Amount', 2) ;


DROP TABLE IF EXISTS BM_LM_Districts ;
DROP TABLE IF EXISTS BM_LM_Buildings ;

CREATE TABLE BM_LM_Districts (DistrictType VARCHAR) ;
CREATE TABLE BM_LM_Buildings (BuildingType VARCHAR) ;

INSERT INTO BM_LM_Districts (DistrictType) VALUES
('DISTRICT_ENTERTAINMENT_COMPLEX'),
('DISTRICT_THEATER'),
('DISTRICT_WATER_ENTERTAINMENT_COMPLEX') ;

INSERT INTO BM_LM_Districts (DistrictType)
	SELECT CivUniqueDistrictType FROM DistrictReplaces WHERE ReplacesDistrictType IN (SELECT DISTINCT DistrictType FROM BM_LM_Districts) ;

INSERT INTO BM_LM_Buildings (BuildingType) VALUES ('BUILDING_MONUMENT') ;

INSERT INTO BM_LM_Buildings (BuildingType) 
	SELECT BuildingType FROM Buildings WHERE PrereqDistrict IN (SELECT DISTINCT DistrictType FROM BM_LM_Districts) ;

INSERT INTO BM_LM_Buildings (BuildingType)
	SELECT BuildingType FROM Buildings WHERE IsWonder = 1 ;

INSERT INTO BM_LM_Buildings (BuildingType)
	SELECT CivUniqueBuildingType FROM BuildingReplaces WHERE ReplacesBuildingType IN (SELECT DISTINCT BuildingType FROM BM_LM_Buildings) ;


INSERT OR IGNORE INTO DistrictModifiers (DistrictType, ModifierId)
	SELECT DISTINCT DistrictType, 'BM_LM_MOD_MINUS_1_IDENTITY_ON_ALL_CITIES_WITHIN_9_TILES' FROM BM_LM_Districts ;

INSERT OR IGNORE INTO DistrictModifiers (DistrictType, ModifierId)
	SELECT DISTINCT DistrictType, 'BM_LM_MOD_PLUS_2_IDENTITY_ON_PLAYER_CITIES_WITHIN_9_TILES' FROM BM_LM_Districts ;


INSERT OR IGNORE INTO BuildingModifiers (BuildingType, ModifierId)
	SELECT DISTINCT BuildingType, 'BM_LM_MOD_MINUS_1_IDENTITY_ON_ALL_CITIES_WITHIN_9_TILES' FROM BM_LM_Buildings ;

INSERT OR IGNORE INTO BuildingModifiers (BuildingType, ModifierId)
	SELECT DISTINCT BuildingType, 'BM_LM_MOD_PLUS_2_IDENTITY_ON_PLAYER_CITIES_WITHIN_9_TILES' FROM BM_LM_Buildings ;




-- For updating LOC query
/*
DROP TABLE IF EXISTS BM_LM_LOC_Descriptions ;
CREATE TABLE BM_LM_LOC_Descriptions (Tag VARCHAR) ;
INSERT INTO BM_LM_LOC_Descriptions (Tag)
	SELECT DISTINCT "'LOC_" || DistrictType || "_DESCRIPTION'," FROM BM_LM_Districts ;
INSERT INTO BM_LM_LOC_Descriptions (Tag)
	SELECT DISTINCT "'LOC_" || BuildingType || "_DESCRIPTION'," FROM BM_LM_Buildings ;
*/

DROP TABLE IF EXISTS BM_LM_Districts ;
DROP TABLE IF EXISTS BM_LM_Buildings ;
DROP TABLE IF EXISTS BM_LM_LOC_Descriptions ;
