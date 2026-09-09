-- scripts/transactions_example.sql
USE FormationDB;
GO
-- Sélection clients inscrits après 2024-02-01
SELECT * FROM dbo.Clients
WHERE DateInscription > '2024-02-01'
ORDER BY DateInscription;
GO
-- Ajouter colonne Solde et démontrer transaction + rollback
ALTER TABLE dbo.Clients ADD Solde DECIMAL(10,2) NOT NULL DEFAULT (0.00);
GO
BEGIN TRANSACTION;
UPDATE dbo.Clients
SET Solde = CASE WHEN Nom = N'Jean Dupont' THEN 100.00 ELSE 0 END
WHERE ClientID = 1;
-- Vérifier
SELECT ClientID, Nom, Solde FROM dbo.Clients WHERE ClientID = 1;
ROLLBACK TRANSACTION;
-- Vérifier rollback
SELECT ClientID, Nom, Solde FROM dbo.Clients WHERE ClientID = 1;
GO
