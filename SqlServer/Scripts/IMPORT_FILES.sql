

-- START
-- CONFIGURATION FOR FILE IMPORT WITH SCRIPT (NECESSARY SA PERMISSION)

--USE [master]
--GO

--sp_configure 'show advanced options', 1
--GO

--RECONFIGURE WITH OverRide
--GO

--sp_configure 'Ad Hoc Distributed Queries', 1
--GO

--RECONFIGURE WITH OverRide
--GO

--EXEC master.dbo.sp_MSset_oledb_prop N'Microsoft.ACE.OLEDB.12.0' , N'AllowInProcess' , 1
--GO

--EXEC master.dbo.sp_MSset_oledb_prop N'Microsoft.ACE.OLEDB.12.0' , N'DynamicParameters' , 1
--GO
-- END

use [DataBase]
go

--CREATING TABLE FROM EXCEL FILE

DECLARE @sqlVersion AS VARCHAR(MAX) = 'Microsoft.ACE.OLEDB.12.0'
DECLARE @filePath AS VARCHAR(MAX) = 'C:\\file\\whole\\path\\'
DECLARE @fileName AS VARCHAR(MAX) = 'file_name.xlsx'
DECLARE @sheetName AS VARCHAR(MAX) = 'sheet_name'


SELECT * 
INTO Tabela_Name
FROM  OPENROWSET(@sqlVersion,
'Excel 12.0; Database='+@filePath+@fileName+'; HDR=YES; IMEX=1',
'SELECT * FROM ['+@sheetName+']') 
GO