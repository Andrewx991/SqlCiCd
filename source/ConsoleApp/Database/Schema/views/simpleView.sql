/* Example of idempotent view script */

/* Boilerplate SQL to create view if it does not exist */
DECLARE @Name VarChar(100)
DECLARE @Type VarChar(20)
SET @Name = 'someView'
SET @Type = 'VIEW'
IF NOT EXISTS(SELECT * FROM dbo.sysobjects WHERE [name] = @Name)
  BEGIN
	DECLARE @SQL varchar(1000)
	SET @SQL = 'CREATE ' + @Type + ' ' + @Name + ' AS SELECT * FROM sysobjects'
	EXECUTE(@SQL)
  END
Print 'Updating ' + @Type + ' ' + @Name
GO

/* Actual source of view */
ALTER VIEW [someView] AS
SELECT * FROM [Events]