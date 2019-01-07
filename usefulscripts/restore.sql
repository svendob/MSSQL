RESTORE DATABASE ADW
FROM DISK = 'D:\bu\adw.bak'
WITH MOVE 'AdventureWorks2014_Data' TO 'E:\data\adwnew.mdb',
MOVE 'AdventureWorks2014_Log' TO 'F:\log\adwnewlog.ldb',
NORECOVERY;