-- scripts/create_db_clients.sql
USE master;
GO
-- Création DB FormationDB (chemins à adapter selon l'environnement)
CREATE DATABASE FormationDB;
GO
ALTER DATABASE FormationDB SET RECOVERY FULL;
GO
USE FormationDB;
GO
-- Création table Clients
CREATE TABLE dbo.Clients (
  ClientID INT IDENTITY(1,1) PRIMARY KEY,
  Nom NVARCHAR(100) NOT NULL,
  Email NVARCHAR(200) NULL,
  DateInscription DATE NOT NULL DEFAULT (GETDATE())
);
GO
-- Insert exemples
INSERT INTO dbo.Clients (Nom, Email, DateInscription) VALUES
(N'Jean Dupont', N'jean.dupont@example.com', '2024-01-15'),
(N'Marie Curie', N'marie.curie@example.com', '2024-02-10'),
(N'Paul Martin', N'paul.martin@example.com', '2024-03-05'),
(N'Lucie Bernard', N'lucie.bernard@example.com', '2024-04-01'),
(N'Ahmed Ali', N'ahmed.ali@example.com', GETDATE());
GO
