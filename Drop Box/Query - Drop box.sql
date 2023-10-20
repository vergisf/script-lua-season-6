USE [MuOnline]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DropSystem](
	[IndexBox] [int] NULL,
	[IndexItem] [int] NULL,
	[Drops] [int] NOT NULL
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[DropSystem] ADD  DEFAULT ((0)) FOR [Drops]
GO