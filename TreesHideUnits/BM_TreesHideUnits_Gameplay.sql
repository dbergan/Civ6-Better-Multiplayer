-- ************************************************
-- From DB_lib

INSERT OR IGNORE INTO Tags 
(Tag,							Vocabulary) 
VALUES 
('DB_CLASS_ALL',						'ABILITY_CLASS');

INSERT OR IGNORE INTO TypeTags (Type, Tag)
  SELECT UnitType, 'DB_CLASS_ALL' FROM Units ;
  
  -- Plot has feature (DB_REQ_HAS_FOREST, DB_REQSET_HAS_FOREST)
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType)
  SELECT 'DB_REQ_HAS_' || SUBSTR(FeatureType, 9), 'REQUIREMENT_PLOT_FEATURE_TYPE_MATCHES' FROM Features ;
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value)
  SELECT 'DB_REQ_HAS_' || SUBSTR(FeatureType, 9), 'FeatureType', FeatureType FROM Features ;

-- Unit in specific district (DB_REQ_UNIT_IN_CITY_CENTER, DB_REQSET_UNIT_IN_CITY_CENTER)
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType)
  SELECT 'DB_REQ_UNIT_IN_' || SUBSTR(DistrictType, 10), 'REQUIREMENT_PLOT_ADJACENT_DISTRICT_TYPE_MATCHES' FROM Districts ;
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value)
  SELECT 'DB_REQ_UNIT_IN_' || SUBSTR(DistrictType, 10), 'DistrictType', DistrictType FROM Districts ;
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value)
  SELECT 'DB_REQ_UNIT_IN_' || SUBSTR(DistrictType, 10), 'MinRange', 0 FROM Districts ;
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value)
  SELECT 'DB_REQ_UNIT_IN_' || SUBSTR(DistrictType, 10), 'MaxRange', 0 FROM Districts ;

-- Unit in fort (i.e. improvement with a defense bonus; DB_REQ_UNIT_IN_FORT, DB_REQSET_UNIT_IN_FORT)
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) VALUES ('DB_REQ_UNIT_IN_FORT', 'REQUIREMENT_ATTACKER_PLOT_IMPROVEMENT_DEFENSE_STRENGTH') ;
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) VALUES ('DB_REQ_UNIT_IN_FORT', 'Amount', '1') ;


-- Is Hidden (like a Privateer)
--    UNITS (Hidden [bool])
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_IS_HIDDEN', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_IS_HIDDEN', 'COLLECTION_OWNER', 'EFFECT_ADJUST_UNIT_HIDDEN_VISIBILITY') ;

-- Can see hidden units
--    UNITS (SeeHidden [bool])
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_CAN_SEE_HIDDEN', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_CAN_SEE_HIDDEN', 'COLLECTION_OWNER', 'EFFECT_ADJUST_UNIT_SEE_HIDDEN') ;
-- ************************************************


INSERT OR IGNORE INTO RequirementSets ('RequirementSetId', 'RequirementSetType') VALUES ('DB_REQSET_PLOT_HAS_WOODS_OR_RAINFOREST', 'REQUIREMENTSET_TEST_ANY') ;
INSERT OR IGNORE INTO RequirementSetRequirements ('RequirementSetId', 'RequirementId') VALUES 
('DB_REQSET_PLOT_HAS_WOODS_OR_RAINFOREST', 'DB_REQ_HAS_FOREST'),
('DB_REQSET_PLOT_HAS_WOODS_OR_RAINFOREST', 'DB_REQ_HAS_JUNGLE') ;

INSERT INTO Types (Type, Kind) VALUES ('BM_ABILITY_HIDE_IN_TREES', 'KIND_ABILITY') ; 
INSERT INTO TypeTags (Type, Tag) VALUES ('BM_ABILITY_HIDE_IN_TREES', 'DB_CLASS_ALL') ; 
INSERT INTO UnitAbilities (UnitAbilityType, Name, Description) VALUES ('BM_ABILITY_HIDE_IN_TREES', 'LOC_BM_ABILITY_HIDE_IN_TREES_NAME', 'LOC_BM_ABILITY_HIDE_IN_TREES_DESC') ;
INSERT INTO UnitAbilityModifiers (UnitAbilityType, ModifierId) VALUES ('BM_ABILITY_HIDE_IN_TREES', 'BM_MOD_HIDE_IN_TREES') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('BM_MOD_HIDE_IN_TREES', 'DB_DM_IS_HIDDEN', 'DB_REQSET_PLOT_HAS_WOODS_OR_RAINFOREST') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('BM_MOD_HIDE_IN_TREES', 'Hidden', 1) ;

/*
INSERT INTO GameModifiers (ModifierId) VALUES ('BM_HIDE_IN_TREES_ABILITY_TO_UNITS') ;
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('BM_HIDE_IN_TREES_ABILITY_TO_UNITS', 'DB_DM_GRANT_ABILITY_ALL_UNITS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('BM_HIDE_IN_TREES_ABILITY_TO_UNITS', 'AbilityType', 'BM_ABILITY_HIDE_IN_TREES') ;
*/







INSERT OR IGNORE INTO RequirementSets ('RequirementSetId', 'RequirementSetType') VALUES ('DB_REQSET_UNIT_IN_CITY_CENTER_OR_ENCAMPMENT_OR_FORT', 'REQUIREMENTSET_TEST_ANY') ;
INSERT OR IGNORE INTO RequirementSetRequirements ('RequirementSetId', 'RequirementId') VALUES 
('DB_REQSET_UNIT_IN_CITY_CENTER_OR_ENCAMPMENT_OR_FORT', 'DB_REQ_UNIT_IN_CITY_CENTER'),
('DB_REQSET_UNIT_IN_CITY_CENTER_OR_ENCAMPMENT_OR_FORT', 'DB_REQ_UNIT_IN_ENCAMPMENT'),
('DB_REQSET_UNIT_IN_CITY_CENTER_OR_ENCAMPMENT_OR_FORT', 'DB_REQ_UNIT_IN_FORT') ;

INSERT INTO Types (Type, Kind) VALUES ('BM_ABILITY_CITIES_SEE_HIDDEN', 'KIND_ABILITY') ; 
INSERT INTO TypeTags (Type, Tag) VALUES ('BM_ABILITY_CITIES_SEE_HIDDEN', 'DB_CLASS_ALL') ; 
INSERT INTO UnitAbilities (UnitAbilityType, Name, Description) VALUES ('BM_ABILITY_CITIES_SEE_HIDDEN', 'LOC_BM_ABILITY_CITIES_SEE_HIDDEN_NAME', 'LOC_BM_ABILITY_CITIES_SEE_HIDDEN_DESC') ;
INSERT INTO UnitAbilityModifiers (UnitAbilityType, ModifierId) VALUES ('BM_ABILITY_CITIES_SEE_HIDDEN', 'BM_MOD_CITIES_SEE_HIDDEN') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('BM_MOD_CITIES_SEE_HIDDEN', 'DB_DM_CAN_SEE_HIDDEN', 'DB_REQSET_UNIT_IN_CITY_CENTER_OR_ENCAMPMENT_OR_FORT') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('BM_MOD_CITIES_SEE_HIDDEN', 'SeeHidden', 1) ;

/*
INSERT INTO GameModifiers (ModifierId) VALUES ('BM_CITIES_SEE_HIDDEN_ABILITY_TO_UNITS') ;
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('BM_CITIES_SEE_HIDDEN_ABILITY_TO_UNITS', 'DB_DM_GRANT_ABILITY_ALL_UNITS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('BM_CITIES_SEE_HIDDEN_ABILITY_TO_UNITS', 'AbilityType', 'BM_ABILITY_CITIES_SEE_HIDDEN') ;
*/

/*

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('BM_HIDE_IN_TREES_UNITS_ATTACH_MODIFIER', 'MODIFIER_ALL_UNITS_ATTACH_MODIFIER', 'DB_REQSET_PLOT_HAS_WOODS_OR_RAINFOREST') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('BM_HIDE_IN_TREES_UNITS_ATTACH_MODIFIER', 'ModifierId', 'BM_MOD_HIDE_IN_TREES') ;

INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('BM_MOD_HIDE_IN_TREES', 'DB_DM_IS_HIDDEN') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('BM_MOD_HIDE_IN_TREES', 'Hidden', 1) ;


INSERT INTO GameModifiers (ModifierId) VALUES ('BM_CITIES_SEE_HIDDEN_UNITS_ATTACH_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('BM_CITIES_SEE_HIDDEN_UNITS_ATTACH_MODIFIER', 'MODIFIER_ALL_UNITS_ATTACH_MODIFIER', 'DB_REQSET_UNIT_IN_CITY_CENTER_OR_ENCAMPMENT_OR_FORT') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('BM_CITIES_SEE_HIDDEN_UNITS_ATTACH_MODIFIER', 'ModifierId', 'BM_MOD_SEE_HIDDEN_IN_CITIES_OR_ENCAMPMENTSOR_FORTS') ;

INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('BM_MOD_SEE_HIDDEN_IN_CITIES_OR_ENCAMPMENTSOR_FORTS', 'DB_DM_CAN_SEE_HIDDEN') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('BM_MOD_SEE_HIDDEN_IN_CITIES_OR_ENCAMPMENTSOR_FORTS', 'SeeHidden', 1) ;

*/