UPDATE Gossips SET VisibilityLevel = 2 WHERE VisibilityLevel < 2 ;
UPDATE Gossips SET VisibilityLevel = 0 AND Filter = 0 WHERE GossipType = 'GOSSIP_GREATPERSON_CREATED' ;