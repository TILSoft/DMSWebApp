USE [DowntimeManual]
GO
/****** Object:  Table [dbo].[tblShortStopImage]    Script Date: 09/17/2010 14:27:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblShortStopImage](
	[imageid] [int] IDENTITY(1,1) NOT NULL,
	[image] [image] NULL,
	[imagetype] [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[imagedesc] [nchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[imageuploaddate] [datetime] NULL,
	[remedyid] [int] NULL,
	[enabled] [bit] NULL,
 CONSTRAINT [PK_tblShortStopImage] PRIMARY KEY CLUSTERED 
(
	[imageid] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
