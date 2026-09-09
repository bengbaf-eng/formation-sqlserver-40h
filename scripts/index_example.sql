-- scripts/index_example.sql
USE FormationDB;
GO
-- Mesurer performance avant
SET STATISTICS TIME ON;
SELECT c.ClientID, c.Nom, SUM(co.Montant) AS TotalCommandes
FROM dbo.Clients c
JOIN dbo.Commandes co ON co.ClientID = c.ClientID
GROUP BY c.ClientID, c.Nom
HAVING SUM(co.Montant) > 100;
SET STATISTICS TIME OFF;
GO
-- Créer index non-cluster sur Commandes(ClientID)
CREATE INDEX IX_Commandes_ClientID ON dbo.Commandes(ClientID);
GO
-- Re-exécuter la même requête pour comparer
SET STATISTICS TIME ON;
SELECT c.ClientID, c.Nom, SUM(co.Montant) AS TotalCommandes
FROM dbo.Clients c
JOIN dbo.Commandes co ON co.ClientID = c.ClientID
GROUP BY c.ClientID, c.Nom
HAVING SUM(co.Montant) > 100;
SET STATISTICS TIME OFF;
GO
