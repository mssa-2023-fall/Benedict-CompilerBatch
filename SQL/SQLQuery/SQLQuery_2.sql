SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ba].[Cities](
	[CityID] [int] NOT NULL Primary Key Clustered,
	[CityName] [nvarchar](50) NOT NULL,
	[StateProvinceID] [int] NOT NULL,
	[Location] [geography] NULL,
	[LatestRecordedPopulation] [bigint] NULL,
	[LastEditedBy] [int] NOT NULL,
	[ValidFrom] [datetime2](7) GENERATED ALWAYS AS ROW START NOT NULL,
	[ValidTo] [datetime2](7) GENERATED ALWAYS AS ROW END NOT NULL,
	PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON (HISTORY_TABLE = [ba].[Cities_Archive])
)
GO
ALTER TABLE [Application].[Cities] ADD  CONSTRAINT [PK_Application_Cities] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [FK_Application_Cities_StateProvinceID] ON [Application].[Cities]
(
	[StateProvinceID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [Application].[Cities] ADD  CONSTRAINT [DF_Application_Cities_CityID]  DEFAULT (NEXT VALUE FOR [Sequences].[CityID]) FOR [CityID]
GO
ALTER TABLE [Application].[Cities]  WITH CHECK ADD  CONSTRAINT [FK_Application_Cities_Application_People] FOREIGN KEY([LastEditedBy])
REFERENCES [Application].[People] ([PersonID])
GO
ALTER TABLE [Application].[Cities] CHECK CONSTRAINT [FK_Application_Cities_Application_People]
GO
ALTER TABLE [Application].[Cities]  WITH CHECK ADD  CONSTRAINT [FK_Application_Cities_StateProvinceID_Application_StateProvinces] FOREIGN KEY([StateProvinceID])
REFERENCES [Application].[StateProvinces] ([StateProvinceID])
GO
ALTER TABLE [Application].[Cities] CHECK CONSTRAINT [FK_Application_Cities_StateProvinceID_Application_StateProvinces]
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Numeric ID used for reference to a city within the database' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'Cities', @level2type=N'COLUMN',@level2name=N'CityID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Formal name of the city' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'Cities', @level2type=N'COLUMN',@level2name=N'CityName'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'State or province for this city' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'Cities', @level2type=N'COLUMN',@level2name=N'StateProvinceID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Geographic location of the city' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'Cities', @level2type=N'COLUMN',@level2name=N'Location'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Latest available population for the City' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'Cities', @level2type=N'COLUMN',@level2name=N'LatestRecordedPopulation'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Cities that are part of any address (including geographic location)' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'Cities'
GO
