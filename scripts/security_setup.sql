-- scripts/security_setup.sql
-- Créer login serveur (attention mot de passe à adapter)
CREATE LOGIN formation_user WITH PASSWORD = 'P@ssw0rd!Change123';
GO
USE FormationDB;
GO
CREATE USER formation_user FOR LOGIN formation_user;
GO
CREATE ROLE r_lecteur;
GO
GRANT SELECT ON SCHEMA::dbo TO r_lecteur;
EXEC sp_addrolemember 'r_lecteur', 'formation_user';
GO
