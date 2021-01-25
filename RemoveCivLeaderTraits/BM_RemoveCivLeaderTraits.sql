DELETE FROM CivilizationTraits WHERE CivilizationType != 'CIVILIZATION_BARBARIAN' ;
DELETE FROM LeaderTraits WHERE LeaderType != 'LEADER_BARBARIAN' AND LeaderType != 'LEADER_DEFAULT' AND LeaderType != 'LEADER_FREE_CITIES' AND LeaderType NOT LIKE 'LEADER\_MINOR\_CIV%' ESCAPE '\' ;
DELETE FROM Leaders_XP2 WHERE LeaderType = 'LEADER_KUPE' ;
DELETE FROM StartBiasFeatures ;
DELETE FROM StartBiasTerrains ;
DELETE FROM StartBiasResources ;

DELETE FROM StartBiasRivers WHERE CivilizationType != 'CIVILIZATION_BABYLON_STK' ; -- 2020-11-23 for some reason deleting the new CIVILIZATION_BABYLON_STK from this table causes a lua crash