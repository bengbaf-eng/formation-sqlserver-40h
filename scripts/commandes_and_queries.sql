-- scripts/commandes_and_queries.sql
USE FormationDB;
GO
-- Création table Commandes
CREATE TABLE dbo.Commandes (
  CommandeID INT IDENTITY(1,1) PRIMARY KEY,
  ClientID INT NOT NULL,
  Montant DECIMAL(10,2) NOT NULL,
  DateCommande DATE NOT NULL,
  CONSTRAINT FK_Commandes_Clients FOREIGN KEY (ClientID) REFERENCES dbo.Clients(ClientID)
);
GO
-- Insert commandes exemples
INSERT INTO dbo.Commandes (ClientID, Montant, DateCommande) VALUES
(1, 50.00, '2024-02-01'),
(1, 75.50, '2024-03-01'),
(2, 10.00, '2024-02-15'),
(3, 200.00, '2024-04-10'),
(4, 30.00, '2024-04-12'),
(5, 150.00, '2024-05-01'),
(1, 20.00, '2024-05-10'),
(3, 10.00, '2024-06-01'),
(5, 5.00, '2024-06-10'),
(2, 90.00, '2024-06-20');
GO
-- Total par client > 100
SELECT c.ClientID, c.Nom, SUM(co.Montant) AS TotalCommandes
FROM dbo.Clients c
JOIN dbo.Commandes co ON co.ClientID = c.ClientID
GROUP BY c.ClientID, c.Nom
HAVING SUM(co.Montant) > 100;
GO
