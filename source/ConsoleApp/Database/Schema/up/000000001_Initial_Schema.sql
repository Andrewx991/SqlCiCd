/* Example of a base schema. These are non-idempotent scripts.  */

-- Store time-series json events from applications
CREATE TABLE [Events]
(
  [DateTimeOffset] datetimeoffset(7) NOT NULL,
  [Application] nvarchar(MAX) NOT NULL,
  [EventId] nvarchar(MAX) NOT NULL,
  [EventJson] nvarchar(MAX) NOT NULL
)
-- Optimize for time based lookups
CREATE CLUSTERED INDEX clustered_index_Events ON [Events] ([DateTimeOffset])

-- Store how many events each application sends per day so we can track usage per application over time
CREATE TABLE [DailyEventPublishingStats]
(
  [Date] date NOT NULL,
  [Application] nvarchar(MAX) NOT NULL,
  [EventCount] bigint NOT NULL,
  [MarketShare] decimal(5,2) NOT NULL,
  CHECK ([MarketShare] >= 0 and [MarketShare] <= 100)
)
-- Optimize for date based lookups
CREATE CLUSTERED INDEX clustered_index_Daily_Event_Pub_Stats ON [DailyEventPublishingStats] ([Date])

