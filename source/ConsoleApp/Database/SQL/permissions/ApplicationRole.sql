IF DATABASE_PRINCIPAL_ID('sampleApplicationRole') IS NULL
BEGIN
	CREATE ROLE [sampleApplicationRole];
END

GRANT INSERT, UPDATE, SELECT, DELETE TO sampleApplicationRole