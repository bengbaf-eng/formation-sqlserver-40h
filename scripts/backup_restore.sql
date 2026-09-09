-- scripts/backup_restore.sql
-- Backup FULL
BACKUP DATABASE FormationDB
TO DISK = N'FormationDB_FULL.bak'
WITH INIT, NAME = N'FormationDB-FULL';
GO
-- Exemple d'insertion
INSERT INTO dbo.Clients (Nom, Email) VALUES (N'Test Restore', N'test@example.com');
GO
-- Backup LOG (nécessite RECOVERY FULL)
BACKUP LOG FormationDB
TO DISK = N'FormationDB_LOG.trn'
WITH INIT, NAME = N'FormationDB-LOG';
GO
-- Restore FULL to new DB (adapter chemins si nécessaire)
RESTORE DATABASE FormationDB_Restored
FROM DISK = N'FormationDB_FULL.bak'
WITH MOVE 'FormationDB' TO 'FormationDB_Restored.mdf',
     MOVE 'FormationDB_log' TO 'FormationDB_Restored.ldf',
     RECOVERY;
GO
