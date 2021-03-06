USE [DowntimeManual]
GO
/****** Object:  Table [dbo].[tblImageClick]    Script Date: 09/17/2010 14:29:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblImageClick](
	[ClickID] [int] IDENTITY(1,1) NOT NULL,
	[imageid] [int] NULL,
	[XCoord] [int] NULL,
	[YCoord] [int] NULL,
	[DateClick] [datetime] NULL,
 CONSTRAINT [PK_tblImageClick] PRIMARY KEY CLUSTERED 
(
	[ClickID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
