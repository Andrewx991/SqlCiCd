/* 
   Example indexes
   Note unlike stored procedures, which are safe to alter every time, indexes are not.
   Thus changes to existing indexes should be handled via a one-time up script, or by dropping and recreating the index if safe to do so.
*/

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'clustered_index_Events' AND object_id = OBJECT_ID('DateTimeOffset'))
BEGIN
    CREATE CLUSTERED INDEX [clustered_index_Events] ON [Events] ([DateTimeOffset])
END

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'clustered_index_Events' AND object_id = OBJECT_ID('DateTimeOffset'))
BEGIN
    CREATE CLUSTERED INDEX [clustered_index_Daily_Event_Pub_Stats] ON [DailyEventPublishingStats] ([Date])
END