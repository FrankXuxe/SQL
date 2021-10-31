--GRANT SELECT,INSERT,UPDATE TO Brandon_Alcaraz
--GRANT SELECT,INSERT,UPDATE TO Hal
--GRANT SELECT,INSERT,UPDATE TO Jorge_Cortes
--GRANT SELECT,INSERT,UPDATE TO Josh_McFarland
-- Granting certain permissions to access our database. GRANT SELECT,INSERT,UPDATE TO (Users name)

-- Access certain files from others database. 
--use JoshMcFarland
--SELECT * FROM MyOrders

-- Create a role (which is like a group)
--CREATE ROLE	Yankee

-- Add group members to the role.
--ALTER ROLE Yankee ADD MEMBER Brandon_Alcaraz
--ALTER ROLE Yankee ADD MEMBER Hal
--ALTER ROLE Yankee ADD MEMBER Jorge_Cortes
--ALTER ROLE Yankee ADD MEMBER Josh_McFarland

-- Give permissions to the role
--GRANT control to Yankee

