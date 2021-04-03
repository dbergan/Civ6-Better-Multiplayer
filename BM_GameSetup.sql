INSERT OR REPLACE INTO Parameters (ParameterId, Name, Description, 
Domain, DefaultValue, ConfigurationGroup, ConfigurationId, GroupId, Visible, ReadOnly,
SupportsSinglePlayer, SupportsLANMultiplayer, SupportsInternetMultiplayer, SupportsHotSeat, SupportsPlayByCloud,
ChangeableAfterGameStart, ChangeableAfterPlayByCloudMatchCreate, SortIndex) VALUES 

('BM_HEADER', 'LOC_BM_HEADER_NAME', 'LOC_BM_HEADER_DESC', 
'EmptyDomain', 1, 'Game', 'BM_HEADER', 'AdvancedOptions', 1, 0, 
1, 1, 1, 1, 1, 
0, 0, 300),

('BM_BATTLE_NOTIFICATIONS', 'LOC_BM_BATTLE_NOTIFICATIONS_NAME', 'LOC_BM_BATTLE_NOTIFICATIONS_DESC', 
'bool', 1, 'Game', 'BM_BATTLE_NOTIFICATIONS', 'AdvancedOptions', 1, 0, 
1, 1, 1, 1, 1, 
0, 0, 301),

('BM_REMOVE_FOREIGN_INFO', 'LOC_BM_REMOVE_FOREIGN_INFO_NAME', 'LOC_BM_REMOVE_FOREIGN_INFO_DESC', 
'bool', 1, 'Game', 'BM_REMOVE_FOREIGN_INFO', 'AdvancedOptions', 1, 0, 
1, 1, 1, 1, 1, 
0, 0, 302),

('BM_DOUBLE_SPIES', 'LOC_BM_DOUBLE_SPIES_NAME', 'LOC_BM_DOUBLE_SPIES_DESC', 
'bool', 1, 'Game', 'BM_DOUBLE_SPIES', 'AdvancedOptions', 1, 0, 
1, 1, 1, 1, 1, 
0, 0, 303),

('BM_DISLOYAL_INFORMANTS', 'LOC_BM_DISLOYAL_INFORMANTS_NAME', 'LOC_BM_DISLOYAL_INFORMANTS_DESC', 
'bool', 1, 'Game', 'BM_DISLOYAL_INFORMANTS', 'AdvancedOptions', 1, 0, 
1, 1, 1, 1, 1, 
0, 0, 304),

('BM_LOYALTY_MATTERS', 'LOC_BM_LOYALTY_MATTERS_NAME', 'LOC_BM_LOYALTY_MATTERS_DESC', 
'bool', 1, 'Game', 'BM_LOYALTY_MATTERS', 'AdvancedOptions', 1, 0, 
1, 1, 1, 1, 1, 
0, 0, 305),

('BM_MILITARY_ALLIANCE_ONLY_SHARE_VISION', 'LOC_BM_MILITARY_ALLIANCE_ONLY_SHARE_VISION_NAME', 'LOC_BM_MILITARY_ALLIANCE_ONLY_SHARE_VISION_DESC', 
'bool', 1, 'Game', 'BM_MILITARY_ALLIANCE_ONLY_SHARE_VISION', 'AdvancedOptions', 1, 0, 
1, 1, 1, 1, 1, 
0, 0, 306),

('BM_ALL_MEN_ARE_MORTAL', 'LOC_BM_ALL_MEN_ARE_MORTAL_NAME', 'LOC_BM_ALL_MEN_ARE_MORTAL_DESC', 
'bool', 1, 'Game', 'BM_ALL_MEN_ARE_MORTAL', 'AdvancedOptions', 1, 0, 
1, 1, 1, 1, 1, 
0, 0, 307),

('BM_REMOVE_WORLD_CONGRESS', 'LOC_BM_REMOVE_WORLD_CONGRESS_NAME', 'LOC_BM_REMOVE_WORLD_CONGRESS_DESC', 
'bool', 1, 'Game', 'BM_REMOVE_WORLD_CONGRESS', 'AdvancedOptions', 1, 0, 
1, 1, 1, 1, 1, 
0, 0, 308),

('BM_REMOVE_CIV_LEADER_TRAITS', 'LOC_BM_REMOVE_CIV_LEADER_TRAITS_NAME', 'LOC_BM_REMOVE_CIV_LEADER_TRAITS_DESC', 
'bool', 1, 'Game', 'BM_REMOVE_CIV_LEADER_TRAITS', 'AdvancedOptions', 1, 0, 
1, 1, 1, 1, 1, 
0, 0, 309),

('BM_REMOVE_EMERGENCIES', 'LOC_BM_REMOVE_EMERGENCIES_NAME', 'LOC_BM_REMOVE_EMERGENCIES_DESC', 
'bool', 1, 'Game', 'BM_REMOVE_EMERGENCIES', 'AdvancedOptions', 1, 0, 
1, 1, 1, 1, 1, 
0, 0, 310),

('BM_REMOVE_ONE_TURN_POLICIES', 'LOC_BM_REMOVE_ONE_TURN_POLICIES_NAME', 'LOC_BM_REMOVE_ONE_TURN_POLICIES_DESC', 
'bool', 1, 'Game', 'BM_REMOVE_ONE_TURN_POLICIES', 'AdvancedOptions', 1, 0, 
1, 1, 1, 1, 1, 
0, 0, 311),

('BM_REMOVE_GOLDEN_DARK_AGES', 'LOC_BM_REMOVE_GOLDEN_DARK_AGES_NAME', 'LOC_BM_REMOVE_GOLDEN_DARK_AGES_DESC', 
'bool', 1, 'Game', 'BM_REMOVE_GOLDEN_DARK_AGES', 'AdvancedOptions', 1, 0, 
1, 1, 1, 1, 1, 
0, 0, 312),

('BM_REMOVE_PLUNDER_POLICIES', 'LOC_BM_REMOVE_PLUNDER_POLICIES_NAME', 'LOC_BM_REMOVE_PLUNDER_POLICIES_DESC', 
'bool', 1, 'Game', 'BM_REMOVE_PLUNDER_POLICIES', 'AdvancedOptions', 1, 0, 
1, 1, 1, 1, 1, 
0, 0, 313),

('BM_REMOVE_UNIT_UPGRADES', 'LOC_BM_REMOVE_UNIT_UPGRADES_NAME', 'LOC_BM_REMOVE_UNIT_UPGRADES_DESC', 
'bool', 1, 'Game', 'BM_REMOVE_UNIT_UPGRADES', 'AdvancedOptions', 1, 0, 
1, 1, 1, 1, 1, 
0, 0, 314),

('BM_DIFFICULTY_COMBAT_STRENGTH', 'LOC_BM_DIFFICULTY_COMBAT_STRENGTH_NAME', 'LOC_BM_DIFFICULTY_COMBAT_STRENGTH_DESC', 
'bool', 0, 'Game', 'BM_DIFFICULTY_COMBAT_STRENGTH', 'AdvancedOptions', 1, 0, 
1, 1, 1, 1, 1, 
0, 0, 315),

('BM_REVEAL_STRATEGIC_RESOURCES', 'LOC_BM_REVEAL_STRATEGIC_RESOURCES_NAME', 'LOC_BM_REVEAL_STRATEGIC_RESOURCES_DESC', 
'bool', 0, 'Game', 'BM_REVEAL_STRATEGIC_RESOURCES', 'AdvancedOptions', 1, 0, 
1, 1, 1, 1, 1, 
0, 0, 316),

('DB_FOOTER', 'LOC_DB_FOOTER_NAME', 'LOC_DB_FOOTER_DESC', 
'EmptyDomain', 1, 'Game', 'DB_FOOTER', 'AdvancedOptions', 1, 0, 
1, 1, 1, 1, 1, 
0, 0, 380) ;



INSERT OR REPLACE INTO DomainRanges (Domain, MinimumValue, MaximumValue) VALUES
('EmptyDomain', 0, 1) ;