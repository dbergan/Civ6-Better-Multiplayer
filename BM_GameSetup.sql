INSERT OR REPLACE INTO Parameters (ParameterId, Name, Description, 
Domain, DefaultValue, ConfigurationGroup, ConfigurationId, GroupId, Visible, ReadOnly,
SupportsSinglePlayer, SupportsLANMultiplayer, SupportsInternetMultiplayer, SupportsHotSeat, SupportsPlayByCloud,
ChangeableAfterGameStart, ChangeableAfterPlayByCloudMatchCreate, SortIndex) VALUES 

('BM_BATTLE_NOTIFICATIONS', 'Battle Notifications', '[ICON_BULLET]Each battle creates a notification with all the combat values invovled[NEWLINE][ICON_BULLET]When your units/cities die defending, you get vision of the area for a turn[NEWLINE][ICON_BULLET]All players receive notifications when WMDs are launched[NEWLINE][NEWLINE][COLOR_Red]from mod "Better Multiplayer"[ENDCOLOR]', 
'bool', 1, 'Game', 'BM_BATTLE_NOTIFICATIONS', 'AdvancedOptions', 1, 0, 
1, 1, 1, 1, 1, 
0, 0, 300),

('BM_REMOVE_FOREIGN_INFO', 'Remove Foreign Info', 'No clairvoyance. You don''t get to automatically know everything about every other civilization.[NEWLINE][ICON_BULLET]Removes world rankings screen[NEWLINE][ICON_BULLET]Removes stats from the leader ribbons[NEWLINE][ICON_BULLET]Removes info about foreign religions on the religion screen[NEWLINE][ICON_BULLET]Removes the leader icons on the bottom of the Tech and Civic trees[NEWLINE][ICON_BULLET]Removes info about the foreign government''s type the Diplomacy screen[NEWLINE][ICON_BULLET]Removes info about relationships with other leaders on the Diplomacy screen[NEWLINE][ICON_BULLET]Removes city information from the dealmaker screen[NEWLINE][ICON_BULLET]Removes gold/resource quantity info from the dealmaker screen[NEWLINE][ICON_BULLET]Removes info about foreign progress toward great people[NEWLINE][ICON_BULLET]Great person recruitment notifications (and history) are anonymous[NEWLINE][ICON_BULLET]Wonder completion notifications are anonymous[NEWLINE][NEWLINE][COLOR_Red]from mod "Better Multiplayer"[ENDCOLOR]', 
'bool', 1, 'Game', 'BM_REMOVE_FOREIGN_INFO', 'AdvancedOptions', 1, 0, 
1, 1, 1, 1, 1, 
0, 0, 301),

('BM_DOUBLE_SPIES', 'Double Spy Capacity', 'Techs and civcs that grant a spy will now grant 2.[NEWLINE][NEWLINE]Recommended to go with Remove Foreign Info, as the extra spies will help make up for your lack of clairvoyance.[NEWLINE][NEWLINE][COLOR_Red]from mod "Better Multiplayer"[ENDCOLOR]', 
'bool', 1, 'Game', 'BM_DOUBLE_SPIES', 'AdvancedOptions', 1, 0, 
1, 1, 1, 1, 1, 
0, 0, 302),

('BM_MILITARY_ALLIANCE_ONLY_SHARE_VISION', 'Militiary Alliance Only Vision', 'No Combat Bonus[NEWLINE][NEWLINE]When Military Alliances give a +5 [ICON_Strength] bonus, it amplifies the king-making dynamic already present in ffa games. I mean it''s bad enough that one guy is getting double-teamed by his brothers, why should all their units get +5 for doing so?[NEWLINE][NEWLINE]Second, it squashes the incentive to gift a player a city just to keep him alive for your +5 strength bonus.[NEWLINE][NEWLINE][COLOR_Red]from mod "Better Multiplayer"[ENDCOLOR]', 
'bool', 1, 'Game', 'BM_MILITARY_ALLIANCE_ONLY_SHARE_VISION', 'AdvancedOptions', 1, 0, 
1, 1, 1, 1, 1, 
0, 0, 303),

('BM_ALL_MEN_ARE_MORTAL', 'All Men Are Mortal', 'When Great People die, they die. (Same applies to archeologists and naturalists.)[NEWLINE][NEWLINE][COLOR_Red]from mod "Better Multiplayer"[ENDCOLOR]', 
'bool', 1, 'Game', 'BM_ALL_MEN_ARE_MORTAL', 'AdvancedOptions', 1, 0, 
1, 1, 1, 1, 1, 
0, 0, 304),

('BM_REMOVE_WORLD_CONGRESS', 'Remove World Congress', 'Good riddance[NEWLINE][NEWLINE][COLOR_Red]from mod "Better Multiplayer"[ENDCOLOR]', 
'bool', 1, 'Game', 'BM_REMOVE_WORLD_CONGRESS', 'AdvancedOptions', 1, 0, 
1, 1, 1, 1, 1, 
0, 0, 305),

('BM_REMOVE_CIV_LEADER_TRAITS', 'Remove Civ/Leader Traits', 'Removes all leader and civ traits (bonuses, unique units, start location biases, etc.). No special snowflakes.[NEWLINE][NEWLINE]With single player, it can be fun to have unique traits to guide you as you play through your story. But I feel that in multiplayer the leaders aren''t balanced and so rather than playing a game where it''s one player''s skill against another, it''s mostly about who chose (or was dealt) the strongest leader.[NEWLINE][NEWLINE]Consider playing a chess game where one player starts with an extra knight at the beginning of the game, but 30-moves later the other player gets an extra queen. That could be an interesting game, but it''s less a contest about the players'' own chess skills and more about which "bonus unit" is overall better. This option makes it more like a game where all sides start with the same pieces.[NEWLINE][NEWLINE][COLOR_Red]from mod "Better Multiplayer"[ENDCOLOR]', 
'bool', 1, 'Game', 'BM_REMOVE_CIV_LEADER_TRAITS', 'AdvancedOptions', 1, 0, 
1, 1, 1, 1, 1, 
0, 0, 306),

('BM_REMOVE_EMERGENCIES', 'Remove Emergencies', 'Everything is fine.[NEWLINE][NEWLINE][COLOR_Red]from mod "Better Multiplayer"[ENDCOLOR]', 
'bool', 1, 'Game', 'BM_REMOVE_EMERGENCIES', 'AdvancedOptions', 1, 0, 
1, 1, 1, 1, 1, 
0, 0, 307),

('BM_REMOVE_ONE_TURN_POLICIES', 'Remove 1-Turn Policies', 'Removes:[NEWLINE][ICON_Bullet]Professional Army[NEWLINE][ICON_Bullet]Retinues[NEWLINE][ICON_Bullet]Force Modernization[NEWLINE][ICON_Bullet]Land Surveyors[NEWLINE][ICON_Bullet]Expropriation[NEWLINE][NEWLINE]I don''t like the play where you save up all your cash, and then game the civics tree so that you upgrade all your soldiers (or buy a bunch of tiles) for discount like so:[NEWLINE][NEWLINE]1) Learn all-but-1-turn on civic A, then switch to civic B[NEWLINE]2) When you finish civic B you select civic A and the Professional Army policy[NEWLINE]3) Upgrade all your army for half-price[NEWLINE]4) Next turn you finish civic A and switch off Professional Army[NEWLINE][NEWLINE][COLOR_Red]from mod "Better Multiplayer"[ENDCOLOR]', 
'bool', 1, 'Game', 'BM_REMOVE_ONE_TURN_POLICIES', 'AdvancedOptions', 1, 0, 
1, 1, 1, 1, 1, 
0, 0, 308),

('BM_REMOVE_GOLDEN_DARK_AGES', 'Remove Golden/Dark Ages', 'I''ll define when I''m in a Golden Age.[NEWLINE][NEWLINE][COLOR_Red]from mod "Better Multiplayer"[ENDCOLOR]', 
'bool', 1, 'Game', 'BM_REMOVE_GOLDEN_DARK_AGES', 'AdvancedOptions', 1, 0, 
1, 1, 1, 1, 1, 
0, 0, 309),

('BM_REVEAL_STRATEGIC_RESOURCES', 'Reveal Strategic Resources', 'Strategic resources are visible from the beginning of the game, but the yield bonuses were taken away (e.g. the +Science on Iron). You can build cities and improvements on these resources in the Ancient era, however, you won''t gather, say, Uranium, until you have Combined Arms.[NEWLINE][NEWLINE]Also, the "Hephaestus" belief from Olympic Pantheons and the "I am Death" belief from Soli Deo Gloria are removed.[NEWLINE][NEWLINE][COLOR_Red]from mod "Better Multiplayer"[ENDCOLOR]', 
'bool', 0, 'Game', 'BM_REVEAL_STRATEGIC_RESOURCES', 'AdvancedOptions', 1, 0, 
1, 1, 1, 1, 1, 
0, 0, 310)

;