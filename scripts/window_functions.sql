-- scripts/window_functions.sql
USE FormationDB;
GO
SELECT
  CommandeID,
  ClientID,
  DateCommande,
  Montant,
  ROW_NUMBER() OVER (PARTITION BY ClientID ORDER BY DateCommande) AS RangCommande,
  SUM(Montant) OVER (PARTITION BY ClientID ORDER BY DateCommande ROWS UNBOUNDED PRECEDING) AS CumulParClient
FROM dbo.Commandes
ORDER BY ClientID, DateCommande;
GO
