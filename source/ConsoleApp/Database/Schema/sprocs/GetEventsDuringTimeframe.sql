/* Example of idempotent Stored Procedure script */

/* Boilerplate SQL to create procedure if it does not exist already */
DECLARE @Name VarChar(100)
DECLARE @Type VarChar(20)
SET @Name = 'GetEventsInTimeRange'
SET @Type = 'PROCEDURE'
IF NOT EXISTS(SELECT * FROM dbo.sysobjects WHERE [name] = @Name)
  BEGIN
	DECLARE @SQL varchar(1000)
	SET @SQL = 'CREATE ' + @Type + ' ' + @Name + ' AS SELECT * FROM sysobjects' /* This is just a placeholder proc until the alter below. */
	EXECUTE(@SQL)
  END
Print 'Updating ' + @Type + ' ' + @Name
GO

/* Actual source of procedure */
ALTER PROCEDURE [dbo].[GetEventsInTimeRange] 
	@StartDateTimeOffset datetimeoffset(7),
	@EndDateTimeOffset datetimeoffset(7)
AS
	SELECT *
	FROM [Events]
	WHERE [DateTimeOffset] >= @StartDateTimeOffset
	AND [DateTimeOffset] <= @EndDateTimeOffset 	




