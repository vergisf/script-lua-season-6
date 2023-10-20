USE [MuOnline]
GO

/****** [dbo].[RankingRaward] ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[RankingReward](
	[id] [int] NOT NULL IDENTITY(1,1),
	[memb___id] [varchar](10) NOT NULL,
	[name] [varchar](10) NOT NULL,
	[rankingNumber] [int] NOT NULL,
	[rankingPosition] [int] NOT NULL,
	[withdrawn] [int] NOT NULL,
 CONSTRAINT [PK_RANKING_REWARD] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[RankingReward] ADD  DEFAULT ((0)) FOR [rankingNumber]
GO
ALTER TABLE [dbo].[RankingReward] ADD  DEFAULT ((0)) FOR [rankingPosition]
GO
ALTER TABLE [dbo].[RankingReward] ADD  DEFAULT ((0)) FOR [withdrawn]
GO