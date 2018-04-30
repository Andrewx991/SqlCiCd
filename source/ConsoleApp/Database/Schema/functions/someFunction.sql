/* Example of idempotent Function script */

/* Boilerplate SQL to create function if it does not exist */
DECLARE @Name VarChar(100)
DECLARE @Schema VarChar(100)
DECLARE @Type VarChar(20)
SET @Schema = 'dbo'
SET @Name = 'someFunction'
SET @Type = 'FUNCTION'
IF NOT EXISTS(SELECT * FROM dbo.sysobjects WHERE [name] = @Name)
  BEGIN
	DECLARE @SQL varchar(1000)
	SET @SQL = 'CREATE ' + @Type + ' ' + @Schema + '.' + @Name + ' (@i INT) RETURNS INT
    AS 
      BEGIN 
        RETURN (@i)
      END'
	EXECUTE(@SQL)
  END
Print 'Updating ' + @Type + ' ' + @Schema + '.' + @Name
GO

/* Actual source of function */
ALTER FUNCTION dbo.someFunction (@i INT)
RETURNS DateTime
AS
 BEGIN
  DECLARE @Today DateTime
  
  SELECT @Today = GetDate()
  
  RETURN (@Today)
 END