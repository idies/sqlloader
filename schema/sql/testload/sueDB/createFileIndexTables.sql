USE [sueDB]
GO
/****** Object:  Table [dbo].[DR13CompFiles]    Script Date: 3/22/2017 3:14:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DR13CompFiles](
	[Database] [sysname] NULL,
	[FileType] [varchar](4) NOT NULL,
	[Filegroup] [nvarchar](128) NOT NULL,
	[FileName] [sysname] NOT NULL,
	[TotalMB] [numeric](18, 2) NOT NULL,
	[UsedMB] [numeric](18, 2) NOT NULL,
	[PctUsed] [numeric](18, 2) NULL,
	[FilePath] [nvarchar](1000) NULL,
	[FileID] [int] NULL,
	[maxsizeMB] [decimal](18, 2) NULL,
	[AutogrowthMB] [decimal](18, 2) NULL
) ON [PRIMARY] 

GO
/****** Object:  Table [dbo].[IndexInfo]    Script Date: 3/22/2017 3:14:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IndexInfo](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[TableName] [sysname] NULL,
	[IndexName] [sysname] NULL,
	[IndexID] [int] NULL,
	[IndexType] [sysname] NULL,
	[IndexSql] [nvarchar](4000) NULL,
	[sourceFG] [sysname] NULL,
	[destFG] [sysname] NULL,
	[IndexStatus] [int] NULL,
 CONSTRAINT [pk_indexinfo] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[DR13CompFiles] ([Database], [FileType], [Filegroup], [FileName], [TotalMB], [UsedMB], [PctUsed], [FilePath], [FileID], [maxsizeMB], [AutogrowthMB]) VALUES (N'BestDR13_CompressedFG', N'Data', N'PRIMARY', N'BESTDR8_Data1', CAST(65.00 AS Numeric(18, 2)), CAST(20.44 AS Numeric(18, 2)), CAST(31.44 AS Numeric(18, 2)), N'D:\data1\sql_db\BestDR13_Compressed_new\BESTDR13Compressed_Data1.MDF', 1, NULL, CAST(0.08 AS Decimal(18, 2)))
GO
INSERT [dbo].[DR13CompFiles] ([Database], [FileType], [Filegroup], [FileName], [TotalMB], [UsedMB], [PctUsed], [FilePath], [FileID], [maxsizeMB], [AutogrowthMB]) VALUES (N'BestDR13_CompressedFG', N'Data', N'PHOTO', N'PHOTO_01', CAST(460800.00 AS Numeric(18, 2)), CAST(427403.50 AS Numeric(18, 2)), CAST(92.75 AS Numeric(18, 2)), N'D:\data1\sql_db\BestDR13_Compressed_new\PHOTO_01.ndf', 13, NULL, CAST(1024.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[DR13CompFiles] ([Database], [FileType], [Filegroup], [FileName], [TotalMB], [UsedMB], [PctUsed], [FilePath], [FileID], [maxsizeMB], [AutogrowthMB]) VALUES (N'BestDR13_CompressedFG', N'Data', N'PHOTO', N'PHOTO_02', CAST(460800.00 AS Numeric(18, 2)), CAST(427398.63 AS Numeric(18, 2)), CAST(92.75 AS Numeric(18, 2)), N'D:\data1\sql_db\BestDR13_Compressed_new\PHOTO_02.ndf', 14, NULL, CAST(1024.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[DR13CompFiles] ([Database], [FileType], [Filegroup], [FileName], [TotalMB], [UsedMB], [PctUsed], [FilePath], [FileID], [maxsizeMB], [AutogrowthMB]) VALUES (N'BestDR13_CompressedFG', N'Data', N'PHOTO', N'PHOTO_03', CAST(460800.00 AS Numeric(18, 2)), CAST(427398.19 AS Numeric(18, 2)), CAST(92.75 AS Numeric(18, 2)), N'D:\data1\sql_db\BestDR13_Compressed_new\PHOTO_03.ndf', 15, NULL, CAST(1024.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[DR13CompFiles] ([Database], [FileType], [Filegroup], [FileName], [TotalMB], [UsedMB], [PctUsed], [FilePath], [FileID], [maxsizeMB], [AutogrowthMB]) VALUES (N'BestDR13_CompressedFG', N'Data', N'PHOTO', N'PHOTO_04', CAST(460800.00 AS Numeric(18, 2)), CAST(427394.38 AS Numeric(18, 2)), CAST(92.75 AS Numeric(18, 2)), N'D:\data1\sql_db\BestDR13_Compressed_new\PHOTO_04.ndf', 16, NULL, CAST(1024.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[DR13CompFiles] ([Database], [FileType], [Filegroup], [FileName], [TotalMB], [UsedMB], [PctUsed], [FilePath], [FileID], [maxsizeMB], [AutogrowthMB]) VALUES (N'BestDR13_CompressedFG', N'Data', N'PHOTO', N'PHOTO_05', CAST(460800.00 AS Numeric(18, 2)), CAST(427389.69 AS Numeric(18, 2)), CAST(92.75 AS Numeric(18, 2)), N'D:\data1\sql_db\BestDR13_Compressed_new\PHOTO_05.ndf', 17, NULL, CAST(1024.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[DR13CompFiles] ([Database], [FileType], [Filegroup], [FileName], [TotalMB], [UsedMB], [PctUsed], [FilePath], [FileID], [maxsizeMB], [AutogrowthMB]) VALUES (N'BestDR13_CompressedFG', N'Data', N'PHOTO', N'PHOTO_06', CAST(460800.00 AS Numeric(18, 2)), CAST(427390.00 AS Numeric(18, 2)), CAST(92.75 AS Numeric(18, 2)), N'D:\data1\sql_db\BestDR13_Compressed_new\PHOTO_06.ndf', 18, NULL, CAST(1024.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[DR13CompFiles] ([Database], [FileType], [Filegroup], [FileName], [TotalMB], [UsedMB], [PctUsed], [FilePath], [FileID], [maxsizeMB], [AutogrowthMB]) VALUES (N'BestDR13_CompressedFG', N'Data', N'PHOTO', N'PHOTO_07', CAST(460800.00 AS Numeric(18, 2)), CAST(427396.06 AS Numeric(18, 2)), CAST(92.75 AS Numeric(18, 2)), N'D:\data1\sql_db\BestDR13_Compressed_new\PHOTO_07.ndf', 19, NULL, CAST(1024.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[DR13CompFiles] ([Database], [FileType], [Filegroup], [FileName], [TotalMB], [UsedMB], [PctUsed], [FilePath], [FileID], [maxsizeMB], [AutogrowthMB]) VALUES (N'BestDR13_CompressedFG', N'Data', N'PHOTO', N'PHOTO_08', CAST(460800.00 AS Numeric(18, 2)), CAST(427403.38 AS Numeric(18, 2)), CAST(92.75 AS Numeric(18, 2)), N'D:\data1\sql_db\BestDR13_Compressed_new\PHOTO_08.ndf', 20, NULL, CAST(1024.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[DR13CompFiles] ([Database], [FileType], [Filegroup], [FileName], [TotalMB], [UsedMB], [PctUsed], [FilePath], [FileID], [maxsizeMB], [AutogrowthMB]) VALUES (N'BestDR13_CompressedFG', N'Data', N'PHOTO', N'PHOTO_09', CAST(460800.00 AS Numeric(18, 2)), CAST(427402.19 AS Numeric(18, 2)), CAST(92.75 AS Numeric(18, 2)), N'D:\data1\sql_db\BestDR13_Compressed_new\PHOTO_09.ndf', 21, NULL, CAST(1024.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[DR13CompFiles] ([Database], [FileType], [Filegroup], [FileName], [TotalMB], [UsedMB], [PctUsed], [FilePath], [FileID], [maxsizeMB], [AutogrowthMB]) VALUES (N'BestDR13_CompressedFG', N'Data', N'PHOTO', N'PHOTO_10', CAST(460800.00 AS Numeric(18, 2)), CAST(427402.44 AS Numeric(18, 2)), CAST(92.75 AS Numeric(18, 2)), N'D:\data1\sql_db\BestDR13_Compressed_new\PHOTO_10.ndf', 22, NULL, CAST(1024.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[DR13CompFiles] ([Database], [FileType], [Filegroup], [FileName], [TotalMB], [UsedMB], [PctUsed], [FilePath], [FileID], [maxsizeMB], [AutogrowthMB]) VALUES (N'BestDR13_CompressedFG', N'Data', N'PHOTO', N'PHOTO_11', CAST(460800.00 AS Numeric(18, 2)), CAST(427402.50 AS Numeric(18, 2)), CAST(92.75 AS Numeric(18, 2)), N'D:\data1\sql_db\BestDR13_Compressed_new\PHOTO_11.ndf', 23, NULL, CAST(1024.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[DR13CompFiles] ([Database], [FileType], [Filegroup], [FileName], [TotalMB], [UsedMB], [PctUsed], [FilePath], [FileID], [maxsizeMB], [AutogrowthMB]) VALUES (N'BestDR13_CompressedFG', N'Data', N'PHOTO', N'PHOTO_12', CAST(460800.00 AS Numeric(18, 2)), CAST(427404.63 AS Numeric(18, 2)), CAST(92.75 AS Numeric(18, 2)), N'D:\data1\sql_db\BestDR13_Compressed_new\PHOTO_12.ndf', 24, NULL, CAST(1024.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[DR13CompFiles] ([Database], [FileType], [Filegroup], [FileName], [TotalMB], [UsedMB], [PctUsed], [FilePath], [FileID], [maxsizeMB], [AutogrowthMB]) VALUES (N'BestDR13_CompressedFG', N'Data', N'SPEC', N'SPEC_01', CAST(16384.00 AS Numeric(18, 2)), CAST(16204.94 AS Numeric(18, 2)), CAST(98.91 AS Numeric(18, 2)), N'D:\data1\sql_db\BestDR13_Compressed_new\SPEC_01.ndf', 25, NULL, CAST(1024.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[DR13CompFiles] ([Database], [FileType], [Filegroup], [FileName], [TotalMB], [UsedMB], [PctUsed], [FilePath], [FileID], [maxsizeMB], [AutogrowthMB]) VALUES (N'BestDR13_CompressedFG', N'Data', N'SPEC', N'SPEC_02', CAST(16384.00 AS Numeric(18, 2)), CAST(16205.75 AS Numeric(18, 2)), CAST(98.91 AS Numeric(18, 2)), N'D:\data1\sql_db\BestDR13_Compressed_new\SPEC_02.ndf', 26, NULL, CAST(1024.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[DR13CompFiles] ([Database], [FileType], [Filegroup], [FileName], [TotalMB], [UsedMB], [PctUsed], [FilePath], [FileID], [maxsizeMB], [AutogrowthMB]) VALUES (N'BestDR13_CompressedFG', N'Data', N'SPEC', N'SPEC_03', CAST(16384.00 AS Numeric(18, 2)), CAST(16209.06 AS Numeric(18, 2)), CAST(98.93 AS Numeric(18, 2)), N'D:\data1\sql_db\BestDR13_Compressed_new\SPEC_03.ndf', 27, NULL, CAST(1024.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[DR13CompFiles] ([Database], [FileType], [Filegroup], [FileName], [TotalMB], [UsedMB], [PctUsed], [FilePath], [FileID], [maxsizeMB], [AutogrowthMB]) VALUES (N'BestDR13_CompressedFG', N'Data', N'SPEC', N'SPEC_04', CAST(16384.00 AS Numeric(18, 2)), CAST(16212.56 AS Numeric(18, 2)), CAST(98.95 AS Numeric(18, 2)), N'D:\data1\sql_db\BestDR13_Compressed_new\SPEC_04.ndf', 28, NULL, CAST(1024.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[DR13CompFiles] ([Database], [FileType], [Filegroup], [FileName], [TotalMB], [UsedMB], [PctUsed], [FilePath], [FileID], [maxsizeMB], [AutogrowthMB]) VALUES (N'BestDR13_CompressedFG', N'Data', N'SPEC', N'SPEC_05', CAST(16384.00 AS Numeric(18, 2)), CAST(16213.88 AS Numeric(18, 2)), CAST(98.96 AS Numeric(18, 2)), N'D:\data1\sql_db\BestDR13_Compressed_new\SPEC_05.ndf', 29, NULL, CAST(1024.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[DR13CompFiles] ([Database], [FileType], [Filegroup], [FileName], [TotalMB], [UsedMB], [PctUsed], [FilePath], [FileID], [maxsizeMB], [AutogrowthMB]) VALUES (N'BestDR13_CompressedFG', N'Data', N'SPEC', N'SPEC_06', CAST(16384.00 AS Numeric(18, 2)), CAST(16208.00 AS Numeric(18, 2)), CAST(98.93 AS Numeric(18, 2)), N'D:\data1\sql_db\BestDR13_Compressed_new\SPEC_06.ndf', 30, NULL, CAST(1024.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[DR13CompFiles] ([Database], [FileType], [Filegroup], [FileName], [TotalMB], [UsedMB], [PctUsed], [FilePath], [FileID], [maxsizeMB], [AutogrowthMB]) VALUES (N'BestDR13_CompressedFG', N'Data', N'SPEC', N'SPEC_07', CAST(16384.00 AS Numeric(18, 2)), CAST(16203.94 AS Numeric(18, 2)), CAST(98.90 AS Numeric(18, 2)), N'D:\data1\sql_db\BestDR13_Compressed_new\SPEC_07.ndf', 31, NULL, CAST(1024.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[DR13CompFiles] ([Database], [FileType], [Filegroup], [FileName], [TotalMB], [UsedMB], [PctUsed], [FilePath], [FileID], [maxsizeMB], [AutogrowthMB]) VALUES (N'BestDR13_CompressedFG', N'Data', N'SPEC', N'SPEC_08', CAST(16384.00 AS Numeric(18, 2)), CAST(16203.25 AS Numeric(18, 2)), CAST(98.90 AS Numeric(18, 2)), N'D:\data1\sql_db\BestDR13_Compressed_new\SPEC_08.ndf', 32, NULL, CAST(1024.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[DR13CompFiles] ([Database], [FileType], [Filegroup], [FileName], [TotalMB], [UsedMB], [PctUsed], [FilePath], [FileID], [maxsizeMB], [AutogrowthMB]) VALUES (N'BestDR13_CompressedFG', N'Data', N'SPEC', N'SPEC_09', CAST(16384.00 AS Numeric(18, 2)), CAST(16211.06 AS Numeric(18, 2)), CAST(98.94 AS Numeric(18, 2)), N'D:\data1\sql_db\BestDR13_Compressed_new\SPEC_09.ndf', 33, NULL, CAST(1024.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[DR13CompFiles] ([Database], [FileType], [Filegroup], [FileName], [TotalMB], [UsedMB], [PctUsed], [FilePath], [FileID], [maxsizeMB], [AutogrowthMB]) VALUES (N'BestDR13_CompressedFG', N'Data', N'SPEC', N'SPEC_10', CAST(16384.00 AS Numeric(18, 2)), CAST(16215.13 AS Numeric(18, 2)), CAST(98.97 AS Numeric(18, 2)), N'D:\data1\sql_db\BestDR13_Compressed_new\SPEC_10.ndf', 34, NULL, CAST(1024.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[DR13CompFiles] ([Database], [FileType], [Filegroup], [FileName], [TotalMB], [UsedMB], [PctUsed], [FilePath], [FileID], [maxsizeMB], [AutogrowthMB]) VALUES (N'BestDR13_CompressedFG', N'Data', N'SPEC', N'SPEC_11', CAST(16384.00 AS Numeric(18, 2)), CAST(16209.25 AS Numeric(18, 2)), CAST(98.93 AS Numeric(18, 2)), N'D:\data1\sql_db\BestDR13_Compressed_new\SPEC_11.ndf', 35, NULL, CAST(1024.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[DR13CompFiles] ([Database], [FileType], [Filegroup], [FileName], [TotalMB], [UsedMB], [PctUsed], [FilePath], [FileID], [maxsizeMB], [AutogrowthMB]) VALUES (N'BestDR13_CompressedFG', N'Data', N'SPEC', N'SPEC_12', CAST(16384.00 AS Numeric(18, 2)), CAST(16216.44 AS Numeric(18, 2)), CAST(98.98 AS Numeric(18, 2)), N'D:\data1\sql_db\BestDR13_Compressed_new\SPEC_12.ndf', 36, NULL, CAST(1024.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[DR13CompFiles] ([Database], [FileType], [Filegroup], [FileName], [TotalMB], [UsedMB], [PctUsed], [FilePath], [FileID], [maxsizeMB], [AutogrowthMB]) VALUES (N'BestDR13_CompressedFG', N'Data', N'ATLAS', N'ATLAS_01', CAST(157696.00 AS Numeric(18, 2)), CAST(157540.06 AS Numeric(18, 2)), CAST(99.90 AS Numeric(18, 2)), N'D:\data1\sql_db\BestDR13_Compressed_new\ATLAS_01.ndf', 37, NULL, CAST(1024.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[DR13CompFiles] ([Database], [FileType], [Filegroup], [FileName], [TotalMB], [UsedMB], [PctUsed], [FilePath], [FileID], [maxsizeMB], [AutogrowthMB]) VALUES (N'BestDR13_CompressedFG', N'Data', N'ATLAS', N'ATLAS_02', CAST(156219.81 AS Numeric(18, 2)), CAST(156065.31 AS Numeric(18, 2)), CAST(99.90 AS Numeric(18, 2)), N'D:\data1\sql_db\BestDR13_Compressed_new\ATLAS_02.ndf', 38, NULL, CAST(1024.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[DR13CompFiles] ([Database], [FileType], [Filegroup], [FileName], [TotalMB], [UsedMB], [PctUsed], [FilePath], [FileID], [maxsizeMB], [AutogrowthMB]) VALUES (N'BestDR13_CompressedFG', N'Data', N'ATLAS', N'ATLAS_03', CAST(157696.00 AS Numeric(18, 2)), CAST(157464.75 AS Numeric(18, 2)), CAST(99.85 AS Numeric(18, 2)), N'D:\data1\sql_db\BestDR13_Compressed_new\ATLAS_03.ndf', 39, NULL, CAST(1024.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[DR13CompFiles] ([Database], [FileType], [Filegroup], [FileName], [TotalMB], [UsedMB], [PctUsed], [FilePath], [FileID], [maxsizeMB], [AutogrowthMB]) VALUES (N'BestDR13_CompressedFG', N'Data', N'ATLAS', N'ATLAS_04', CAST(157696.00 AS Numeric(18, 2)), CAST(157540.06 AS Numeric(18, 2)), CAST(99.90 AS Numeric(18, 2)), N'D:\data1\sql_db\BestDR13_Compressed_new\ATLAS_04.ndf', 40, NULL, CAST(1024.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[DR13CompFiles] ([Database], [FileType], [Filegroup], [FileName], [TotalMB], [UsedMB], [PctUsed], [FilePath], [FileID], [maxsizeMB], [AutogrowthMB]) VALUES (N'BestDR13_CompressedFG', N'Data', N'ATLAS', N'ATLAS_05', CAST(157696.00 AS Numeric(18, 2)), CAST(157539.88 AS Numeric(18, 2)), CAST(99.90 AS Numeric(18, 2)), N'D:\data1\sql_db\BestDR13_Compressed_new\ATLAS_05.ndf', 41, NULL, CAST(1024.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[DR13CompFiles] ([Database], [FileType], [Filegroup], [FileName], [TotalMB], [UsedMB], [PctUsed], [FilePath], [FileID], [maxsizeMB], [AutogrowthMB]) VALUES (N'BestDR13_CompressedFG', N'Data', N'ATLAS', N'ATLAS_06', CAST(157696.00 AS Numeric(18, 2)), CAST(157540.06 AS Numeric(18, 2)), CAST(99.90 AS Numeric(18, 2)), N'D:\data1\sql_db\BestDR13_Compressed_new\ATLAS_06.ndf', 42, NULL, CAST(1024.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[DR13CompFiles] ([Database], [FileType], [Filegroup], [FileName], [TotalMB], [UsedMB], [PctUsed], [FilePath], [FileID], [maxsizeMB], [AutogrowthMB]) VALUES (N'BestDR13_CompressedFG', N'Data', N'ATLAS', N'ATLAS_07', CAST(157696.00 AS Numeric(18, 2)), CAST(157540.06 AS Numeric(18, 2)), CAST(99.90 AS Numeric(18, 2)), N'D:\data1\sql_db\BestDR13_Compressed_new\ATLAS_07.ndf', 43, NULL, CAST(1024.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[DR13CompFiles] ([Database], [FileType], [Filegroup], [FileName], [TotalMB], [UsedMB], [PctUsed], [FilePath], [FileID], [maxsizeMB], [AutogrowthMB]) VALUES (N'BestDR13_CompressedFG', N'Data', N'DATAFG', N'DATA_01', CAST(121856.00 AS Numeric(18, 2)), CAST(121736.25 AS Numeric(18, 2)), CAST(99.90 AS Numeric(18, 2)), N'D:\data1\sql_db\BestDR13_Compressed_new\DATA_01.ndf', 44, NULL, CAST(1024.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[DR13CompFiles] ([Database], [FileType], [Filegroup], [FileName], [TotalMB], [UsedMB], [PctUsed], [FilePath], [FileID], [maxsizeMB], [AutogrowthMB]) VALUES (N'BestDR13_CompressedFG', N'Data', N'DATAFG', N'DATA_02', CAST(120832.00 AS Numeric(18, 2)), CAST(120713.31 AS Numeric(18, 2)), CAST(99.90 AS Numeric(18, 2)), N'D:\data1\sql_db\BestDR13_Compressed_new\DATA_02.ndf', 45, NULL, CAST(1024.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[DR13CompFiles] ([Database], [FileType], [Filegroup], [FileName], [TotalMB], [UsedMB], [PctUsed], [FilePath], [FileID], [maxsizeMB], [AutogrowthMB]) VALUES (N'BestDR13_CompressedFG', N'Data', N'DATAFG', N'DATA_03', CAST(120832.00 AS Numeric(18, 2)), CAST(120712.69 AS Numeric(18, 2)), CAST(99.90 AS Numeric(18, 2)), N'D:\data1\sql_db\BestDR13_Compressed_new\DATA_03.ndf', 46, NULL, CAST(1024.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[DR13CompFiles] ([Database], [FileType], [Filegroup], [FileName], [TotalMB], [UsedMB], [PctUsed], [FilePath], [FileID], [maxsizeMB], [AutogrowthMB]) VALUES (N'BestDR13_CompressedFG', N'Data', N'DATAFG', N'DATA_04', CAST(120832.00 AS Numeric(18, 2)), CAST(120713.19 AS Numeric(18, 2)), CAST(99.90 AS Numeric(18, 2)), N'D:\data1\sql_db\BestDR13_Compressed_new\DATA_04.ndf', 47, NULL, CAST(1024.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[DR13CompFiles] ([Database], [FileType], [Filegroup], [FileName], [TotalMB], [UsedMB], [PctUsed], [FilePath], [FileID], [maxsizeMB], [AutogrowthMB]) VALUES (N'BestDR13_CompressedFG', N'Data', N'DATAFG', N'DATA_05', CAST(121856.00 AS Numeric(18, 2)), CAST(120806.88 AS Numeric(18, 2)), CAST(99.14 AS Numeric(18, 2)), N'D:\data1\sql_db\BestDR13_Compressed_new\DATA_05.ndf', 48, NULL, CAST(1024.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[DR13CompFiles] ([Database], [FileType], [Filegroup], [FileName], [TotalMB], [UsedMB], [PctUsed], [FilePath], [FileID], [maxsizeMB], [AutogrowthMB]) VALUES (N'BestDR13_CompressedFG', N'Data', N'DATAFG', N'DATA_06', CAST(121856.00 AS Numeric(18, 2)), CAST(121732.13 AS Numeric(18, 2)), CAST(99.90 AS Numeric(18, 2)), N'D:\data1\sql_db\BestDR13_Compressed_new\DATA_06.ndf', 49, NULL, CAST(1024.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[DR13CompFiles] ([Database], [FileType], [Filegroup], [FileName], [TotalMB], [UsedMB], [PctUsed], [FilePath], [FileID], [maxsizeMB], [AutogrowthMB]) VALUES (N'BestDR13_CompressedFG', N'Data', N'DATAFG', N'DATA_07', CAST(121856.00 AS Numeric(18, 2)), CAST(121735.75 AS Numeric(18, 2)), CAST(99.90 AS Numeric(18, 2)), N'D:\data1\sql_db\BestDR13_Compressed_new\DATA_07.ndf', 50, NULL, CAST(1024.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[DR13CompFiles] ([Database], [FileType], [Filegroup], [FileName], [TotalMB], [UsedMB], [PctUsed], [FilePath], [FileID], [maxsizeMB], [AutogrowthMB]) VALUES (N'BestDR13_CompressedFG', N'Data', N'DATAFG', N'DATA_08', CAST(121856.00 AS Numeric(18, 2)), CAST(121735.63 AS Numeric(18, 2)), CAST(99.90 AS Numeric(18, 2)), N'D:\data1\sql_db\BestDR13_Compressed_new\DATA_08.ndf', 51, NULL, CAST(1024.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[DR13CompFiles] ([Database], [FileType], [Filegroup], [FileName], [TotalMB], [UsedMB], [PctUsed], [FilePath], [FileID], [maxsizeMB], [AutogrowthMB]) VALUES (N'BestDR13_CompressedFG', N'Data', N'DATAFG', N'DATA_09', CAST(121856.00 AS Numeric(18, 2)), CAST(121736.50 AS Numeric(18, 2)), CAST(99.90 AS Numeric(18, 2)), N'D:\data1\sql_db\BestDR13_Compressed_new\DATA_09.ndf', 52, NULL, CAST(1024.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[DR13CompFiles] ([Database], [FileType], [Filegroup], [FileName], [TotalMB], [UsedMB], [PctUsed], [FilePath], [FileID], [maxsizeMB], [AutogrowthMB]) VALUES (N'BestDR13_CompressedFG', N'Data', N'DATAFG', N'DATA_10', CAST(121856.00 AS Numeric(18, 2)), CAST(121735.63 AS Numeric(18, 2)), CAST(99.90 AS Numeric(18, 2)), N'D:\data1\sql_db\BestDR13_Compressed_new\DATA_10.ndf', 53, NULL, CAST(1024.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[DR13CompFiles] ([Database], [FileType], [Filegroup], [FileName], [TotalMB], [UsedMB], [PctUsed], [FilePath], [FileID], [maxsizeMB], [AutogrowthMB]) VALUES (N'BestDR13_CompressedFG', N'Data', N'DATAFG', N'DATA_11', CAST(121856.00 AS Numeric(18, 2)), CAST(121736.88 AS Numeric(18, 2)), CAST(99.90 AS Numeric(18, 2)), N'D:\data1\sql_db\BestDR13_Compressed_new\DATA_11.ndf', 54, NULL, CAST(1024.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[DR13CompFiles] ([Database], [FileType], [Filegroup], [FileName], [TotalMB], [UsedMB], [PctUsed], [FilePath], [FileID], [maxsizeMB], [AutogrowthMB]) VALUES (N'BestDR13_CompressedFG', N'Data', N'DATAFG', N'DATA_12', CAST(121856.00 AS Numeric(18, 2)), CAST(121735.75 AS Numeric(18, 2)), CAST(99.90 AS Numeric(18, 2)), N'D:\data1\sql_db\BestDR13_Compressed_new\DATA_12.ndf', 55, NULL, CAST(1024.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[DR13CompFiles] ([Database], [FileType], [Filegroup], [FileName], [TotalMB], [UsedMB], [PctUsed], [FilePath], [FileID], [maxsizeMB], [AutogrowthMB]) VALUES (N'BestDR13_CompressedFG', N'Data', N'FRAME', N'FRAME_01', CAST(84992.00 AS Numeric(18, 2)), CAST(84908.00 AS Numeric(18, 2)), CAST(99.90 AS Numeric(18, 2)), N'D:\data1\sql_db\BestDR13_Compressed_new\FRAME_01.ndf', 56, NULL, CAST(1024.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[DR13CompFiles] ([Database], [FileType], [Filegroup], [FileName], [TotalMB], [UsedMB], [PctUsed], [FilePath], [FileID], [maxsizeMB], [AutogrowthMB]) VALUES (N'BestDR13_CompressedFG', N'Data', N'FRAME', N'FRAME_02', CAST(83968.00 AS Numeric(18, 2)), CAST(83885.00 AS Numeric(18, 2)), CAST(99.90 AS Numeric(18, 2)), N'D:\data1\sql_db\BestDR13_Compressed_new\FRAME_02.ndf', 57, NULL, CAST(1024.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[DR13CompFiles] ([Database], [FileType], [Filegroup], [FileName], [TotalMB], [UsedMB], [PctUsed], [FilePath], [FileID], [maxsizeMB], [AutogrowthMB]) VALUES (N'BestDR13_CompressedFG', N'Data', N'FRAME', N'FRAME_03', CAST(83968.00 AS Numeric(18, 2)), CAST(83885.00 AS Numeric(18, 2)), CAST(99.90 AS Numeric(18, 2)), N'D:\data1\sql_db\BestDR13_Compressed_new\FRAME_03.ndf', 58, NULL, CAST(1024.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[DR13CompFiles] ([Database], [FileType], [Filegroup], [FileName], [TotalMB], [UsedMB], [PctUsed], [FilePath], [FileID], [maxsizeMB], [AutogrowthMB]) VALUES (N'BestDR13_CompressedFG', N'Data', N'FRAME', N'FRAME_04', CAST(83968.00 AS Numeric(18, 2)), CAST(83885.00 AS Numeric(18, 2)), CAST(99.90 AS Numeric(18, 2)), N'D:\data1\sql_db\BestDR13_Compressed_new\FRAME_04.ndf', 59, NULL, CAST(1024.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[DR13CompFiles] ([Database], [FileType], [Filegroup], [FileName], [TotalMB], [UsedMB], [PctUsed], [FilePath], [FileID], [maxsizeMB], [AutogrowthMB]) VALUES (N'BestDR13_CompressedFG', N'Data', N'FRAME', N'FRAME_05', CAST(83968.00 AS Numeric(18, 2)), CAST(83885.00 AS Numeric(18, 2)), CAST(99.90 AS Numeric(18, 2)), N'D:\data1\sql_db\BestDR13_Compressed_new\FRAME_05.ndf', 60, NULL, CAST(1024.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[DR13CompFiles] ([Database], [FileType], [Filegroup], [FileName], [TotalMB], [UsedMB], [PctUsed], [FilePath], [FileID], [maxsizeMB], [AutogrowthMB]) VALUES (N'BestDR13_CompressedFG', N'Data', N'FRAME', N'FRAME_06', CAST(84992.00 AS Numeric(18, 2)), CAST(83941.06 AS Numeric(18, 2)), CAST(98.76 AS Numeric(18, 2)), N'D:\data1\sql_db\BestDR13_Compressed_new\FRAME_06.ndf', 61, NULL, CAST(1024.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[DR13CompFiles] ([Database], [FileType], [Filegroup], [FileName], [TotalMB], [UsedMB], [PctUsed], [FilePath], [FileID], [maxsizeMB], [AutogrowthMB]) VALUES (N'BestDR13_CompressedFG', N'Data', N'FRAME', N'FRAME_07', CAST(84992.00 AS Numeric(18, 2)), CAST(84902.56 AS Numeric(18, 2)), CAST(99.89 AS Numeric(18, 2)), N'D:\data1\sql_db\BestDR13_Compressed_new\FRAME_07.ndf', 62, NULL, CAST(1024.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[DR13CompFiles] ([Database], [FileType], [Filegroup], [FileName], [TotalMB], [UsedMB], [PctUsed], [FilePath], [FileID], [maxsizeMB], [AutogrowthMB]) VALUES (N'BestDR13_CompressedFG', N'Data', N'FRAME', N'FRAME_08', CAST(84992.00 AS Numeric(18, 2)), CAST(84907.94 AS Numeric(18, 2)), CAST(99.90 AS Numeric(18, 2)), N'D:\data1\sql_db\BestDR13_Compressed_new\FRAME_08.ndf', 63, NULL, CAST(1024.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[DR13CompFiles] ([Database], [FileType], [Filegroup], [FileName], [TotalMB], [UsedMB], [PctUsed], [FilePath], [FileID], [maxsizeMB], [AutogrowthMB]) VALUES (N'BestDR13_CompressedFG', N'Data', N'FRAME', N'FRAME_09', CAST(84992.00 AS Numeric(18, 2)), CAST(84908.00 AS Numeric(18, 2)), CAST(99.90 AS Numeric(18, 2)), N'D:\data1\sql_db\BestDR13_Compressed_new\FRAME_09.ndf', 64, NULL, CAST(1024.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[DR13CompFiles] ([Database], [FileType], [Filegroup], [FileName], [TotalMB], [UsedMB], [PctUsed], [FilePath], [FileID], [maxsizeMB], [AutogrowthMB]) VALUES (N'BestDR13_CompressedFG', N'Data', N'FRAME', N'FRAME_10', CAST(84992.00 AS Numeric(18, 2)), CAST(84907.94 AS Numeric(18, 2)), CAST(99.90 AS Numeric(18, 2)), N'D:\data1\sql_db\BestDR13_Compressed_new\FRAME_10.ndf', 65, NULL, CAST(1024.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[DR13CompFiles] ([Database], [FileType], [Filegroup], [FileName], [TotalMB], [UsedMB], [PctUsed], [FilePath], [FileID], [maxsizeMB], [AutogrowthMB]) VALUES (N'BestDR13_CompressedFG', N'Data', N'FRAME', N'FRAME_11', CAST(84992.00 AS Numeric(18, 2)), CAST(84907.94 AS Numeric(18, 2)), CAST(99.90 AS Numeric(18, 2)), N'D:\data1\sql_db\BestDR13_Compressed_new\FRAME_11.ndf', 66, NULL, CAST(1024.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[DR13CompFiles] ([Database], [FileType], [Filegroup], [FileName], [TotalMB], [UsedMB], [PctUsed], [FilePath], [FileID], [maxsizeMB], [AutogrowthMB]) VALUES (N'BestDR13_CompressedFG', N'Data', N'FRAME', N'FRAME_12', CAST(84992.00 AS Numeric(18, 2)), CAST(84907.94 AS Numeric(18, 2)), CAST(99.90 AS Numeric(18, 2)), N'D:\data1\sql_db\BestDR13_Compressed_new\FRAME_12.ndf', 67, NULL, CAST(1024.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[DR13CompFiles] ([Database], [FileType], [Filegroup], [FileName], [TotalMB], [UsedMB], [PctUsed], [FilePath], [FileID], [maxsizeMB], [AutogrowthMB]) VALUES (N'BestDR13_CompressedFG', N'Data', N'WISE', N'WISE_01', CAST(53248.00 AS Numeric(18, 2)), CAST(53195.38 AS Numeric(18, 2)), CAST(99.90 AS Numeric(18, 2)), N'D:\data1\sql_db\BestDR13_Compressed_new\WISE_01.ndf', 68, NULL, CAST(1024.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[DR13CompFiles] ([Database], [FileType], [Filegroup], [FileName], [TotalMB], [UsedMB], [PctUsed], [FilePath], [FileID], [maxsizeMB], [AutogrowthMB]) VALUES (N'BestDR13_CompressedFG', N'Data', N'WISE', N'WISE_02', CAST(52224.00 AS Numeric(18, 2)), CAST(52172.44 AS Numeric(18, 2)), CAST(99.90 AS Numeric(18, 2)), N'D:\data1\sql_db\BestDR13_Compressed_new\WISE_02.ndf', 69, NULL, CAST(1024.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[DR13CompFiles] ([Database], [FileType], [Filegroup], [FileName], [TotalMB], [UsedMB], [PctUsed], [FilePath], [FileID], [maxsizeMB], [AutogrowthMB]) VALUES (N'BestDR13_CompressedFG', N'Data', N'WISE', N'WISE_03', CAST(53248.00 AS Numeric(18, 2)), CAST(52477.06 AS Numeric(18, 2)), CAST(98.55 AS Numeric(18, 2)), N'D:\data1\sql_db\BestDR13_Compressed_new\WISE_03.ndf', 70, NULL, CAST(1024.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[DR13CompFiles] ([Database], [FileType], [Filegroup], [FileName], [TotalMB], [UsedMB], [PctUsed], [FilePath], [FileID], [maxsizeMB], [AutogrowthMB]) VALUES (N'BestDR13_CompressedFG', N'Data', N'WISE', N'WISE_04', CAST(53248.00 AS Numeric(18, 2)), CAST(53193.31 AS Numeric(18, 2)), CAST(99.90 AS Numeric(18, 2)), N'D:\data1\sql_db\BestDR13_Compressed_new\WISE_04.ndf', 71, NULL, CAST(1024.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[DR13CompFiles] ([Database], [FileType], [Filegroup], [FileName], [TotalMB], [UsedMB], [PctUsed], [FilePath], [FileID], [maxsizeMB], [AutogrowthMB]) VALUES (N'BestDR13_CompressedFG', N'Data', N'WISE', N'WISE_05', CAST(53248.00 AS Numeric(18, 2)), CAST(53194.50 AS Numeric(18, 2)), CAST(99.90 AS Numeric(18, 2)), N'D:\data1\sql_db\BestDR13_Compressed_new\WISE_05.ndf', 72, NULL, CAST(1024.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[DR13CompFiles] ([Database], [FileType], [Filegroup], [FileName], [TotalMB], [UsedMB], [PctUsed], [FilePath], [FileID], [maxsizeMB], [AutogrowthMB]) VALUES (N'BestDR13_CompressedFG', N'Data', N'WISE', N'WISE_06', CAST(53248.00 AS Numeric(18, 2)), CAST(53195.25 AS Numeric(18, 2)), CAST(99.90 AS Numeric(18, 2)), N'D:\data1\sql_db\BestDR13_Compressed_new\WISE_06.ndf', 73, NULL, CAST(1024.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[DR13CompFiles] ([Database], [FileType], [Filegroup], [FileName], [TotalMB], [UsedMB], [PctUsed], [FilePath], [FileID], [maxsizeMB], [AutogrowthMB]) VALUES (N'BestDR13_CompressedFG', N'Data', N'WISE', N'WISE_07', CAST(53248.00 AS Numeric(18, 2)), CAST(53195.38 AS Numeric(18, 2)), CAST(99.90 AS Numeric(18, 2)), N'D:\data1\sql_db\BestDR13_Compressed_new\WISE_07.ndf', 74, NULL, CAST(1024.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[DR13CompFiles] ([Database], [FileType], [Filegroup], [FileName], [TotalMB], [UsedMB], [PctUsed], [FilePath], [FileID], [maxsizeMB], [AutogrowthMB]) VALUES (N'BestDR13_CompressedFG', N'Data', N'WISE', N'WISE_08', CAST(53248.00 AS Numeric(18, 2)), CAST(53195.38 AS Numeric(18, 2)), CAST(99.90 AS Numeric(18, 2)), N'D:\data1\sql_db\BestDR13_Compressed_new\WISE_08.ndf', 75, NULL, CAST(1024.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[DR13CompFiles] ([Database], [FileType], [Filegroup], [FileName], [TotalMB], [UsedMB], [PctUsed], [FilePath], [FileID], [maxsizeMB], [AutogrowthMB]) VALUES (N'BestDR13_CompressedFG', N'Data', N'WISE', N'WISE_09', CAST(53248.00 AS Numeric(18, 2)), CAST(53195.44 AS Numeric(18, 2)), CAST(99.90 AS Numeric(18, 2)), N'D:\data1\sql_db\BestDR13_Compressed_new\WISE_09.ndf', 76, NULL, CAST(1024.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[DR13CompFiles] ([Database], [FileType], [Filegroup], [FileName], [TotalMB], [UsedMB], [PctUsed], [FilePath], [FileID], [maxsizeMB], [AutogrowthMB]) VALUES (N'BestDR13_CompressedFG', N'Data', N'WISE', N'WISE_10', CAST(53248.00 AS Numeric(18, 2)), CAST(53195.38 AS Numeric(18, 2)), CAST(99.90 AS Numeric(18, 2)), N'D:\data1\sql_db\BestDR13_Compressed_new\WISE_10.ndf', 77, NULL, CAST(1024.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[DR13CompFiles] ([Database], [FileType], [Filegroup], [FileName], [TotalMB], [UsedMB], [PctUsed], [FilePath], [FileID], [maxsizeMB], [AutogrowthMB]) VALUES (N'BestDR13_CompressedFG', N'Data', N'WISE', N'WISE_11', CAST(53248.00 AS Numeric(18, 2)), CAST(53195.38 AS Numeric(18, 2)), CAST(99.90 AS Numeric(18, 2)), N'D:\data1\sql_db\BestDR13_Compressed_new\WISE_11.ndf', 78, NULL, CAST(1024.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[DR13CompFiles] ([Database], [FileType], [Filegroup], [FileName], [TotalMB], [UsedMB], [PctUsed], [FilePath], [FileID], [maxsizeMB], [AutogrowthMB]) VALUES (N'BestDR13_CompressedFG', N'Data', N'WISE', N'WISE_12', CAST(53248.00 AS Numeric(18, 2)), CAST(53195.50 AS Numeric(18, 2)), CAST(99.90 AS Numeric(18, 2)), N'D:\data1\sql_db\BestDR13_Compressed_new\WISE_12.ndf', 79, NULL, CAST(1024.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[DR13CompFiles] ([Database], [FileType], [Filegroup], [FileName], [TotalMB], [UsedMB], [PctUsed], [FilePath], [FileID], [maxsizeMB], [AutogrowthMB]) VALUES (N'BestDR13_CompressedFG', N'Log', N'N/A', N'BESTDR8_Log1', CAST(639.95 AS Numeric(18, 2)), CAST(9.56 AS Numeric(18, 2)), CAST(1.49 AS Numeric(18, 2)), N'D:\data1\sql_db\BestDR13_Compressed_new\BESTDR13Compressed_Log1.LDF', 2, CAST(2097152.00 AS Decimal(18, 2)), CAST(0.08 AS Decimal(18, 2)))
GO
INSERT [dbo].[DR13CompFiles] ([Database], [FileType], [Filegroup], [FileName], [TotalMB], [UsedMB], [PctUsed], [FilePath], [FileID], [maxsizeMB], [AutogrowthMB]) VALUES (N'BestDR13_CompressedFG', N'Log', N'N/A', N'BESTDR8_Log2', CAST(639.95 AS Numeric(18, 2)), CAST(9.56 AS Numeric(18, 2)), CAST(1.49 AS Numeric(18, 2)), N'D:\data1\sql_db\BestDR13_Compressed_new\BESTDR13Compressed_Log2.LDF', 10, CAST(2097152.00 AS Decimal(18, 2)), CAST(0.08 AS Decimal(18, 2)))
GO
INSERT [dbo].[DR13CompFiles] ([Database], [FileType], [Filegroup], [FileName], [TotalMB], [UsedMB], [PctUsed], [FilePath], [FileID], [maxsizeMB], [AutogrowthMB]) VALUES (N'BestDR13_CompressedFG', N'Log', N'N/A', N'BESTDR8_Log3', CAST(639.95 AS Numeric(18, 2)), CAST(9.56 AS Numeric(18, 2)), CAST(1.49 AS Numeric(18, 2)), N'D:\data1\sql_db\BestDR13_Compressed_new\BESTDR13Compressed_Log3.LDF', 11, CAST(2097152.00 AS Decimal(18, 2)), CAST(0.08 AS Decimal(18, 2)))
GO
INSERT [dbo].[DR13CompFiles] ([Database], [FileType], [Filegroup], [FileName], [TotalMB], [UsedMB], [PctUsed], [FilePath], [FileID], [maxsizeMB], [AutogrowthMB]) VALUES (N'BestDR13_CompressedFG', N'Log', N'N/A', N'BESTDR8_Log4', CAST(639.95 AS Numeric(18, 2)), CAST(9.56 AS Numeric(18, 2)), CAST(1.49 AS Numeric(18, 2)), N'D:\data1\sql_db\BestDR13_Compressed_new\BESTDR13Compressed_Log4.LDF', 12, CAST(2097152.00 AS Decimal(18, 2)), CAST(0.08 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[IndexInfo] ON 

GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (1, N'apogeeDesign', NULL, 0, N'HEAP', NULL, N'PRIMARY', NULL, 0)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (2, N'apogeeField', NULL, 0, N'HEAP', NULL, N'PRIMARY', NULL, 0)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (3, N'apogeeObject', N'i_apogeeObject_apogee_id_j_h_k_j', 2, N'NONCLUSTERED', N'CREATE NONCLUSTERED INDEX [i_apogeeObject_apogee_id_j_h_k_j] ON [dbo].[apogeeObject](apogee_id ASC, j ASC, h ASC, k ASC, j_err ASC, h_err ASC, k_err ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, SORT_IN_TEMPDB = ON, FILLFACTOR = 100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (4, N'apogeeObject', N'pk_apogeeObject_target_id', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_apogeeObject_target_id] ON [dbo].[apogeeObject](target_id ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (5, N'apogeePlate', N'pk_apogeePlate_plate_visit_id', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_apogeePlate_plate_visit_id] ON [dbo].[apogeePlate](plate_visit_id ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (6, N'apogeeStar', N'i_apogeeStar_apogee_id', 2, N'NONCLUSTERED', N'CREATE NONCLUSTERED INDEX [i_apogeeStar_apogee_id] ON [dbo].[apogeeStar](apogee_id ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, SORT_IN_TEMPDB = ON, FILLFACTOR = 100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (7, N'apogeeStar', N'i_apogeeStar_htmID', 3, N'NONCLUSTERED', N'CREATE NONCLUSTERED INDEX [i_apogeeStar_htmID] ON [dbo].[apogeeStar](htmID ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, SORT_IN_TEMPDB = ON, FILLFACTOR = 100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (8, N'apogeeStar', N'pk_apogeeStar_apstar_id', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_apogeeStar_apstar_id] ON [dbo].[apogeeStar](apstar_id ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (9, N'apogeeStarAllVisit', N'pk_apogeeStarAllVisit_visit_id_a', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_apogeeStarAllVisit_visit_id_a] ON [dbo].[apogeeStarAllVisit](visit_id ASC, apstar_id ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (10, N'apogeeStarVisit', N'pk_apogeeStarVisit_visit_id', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_apogeeStarVisit_visit_id] ON [dbo].[apogeeStarVisit](visit_id ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (11, N'apogeeVisit', N'i_apogeeVisit_apogee_id', 2, N'NONCLUSTERED', N'CREATE NONCLUSTERED INDEX [i_apogeeVisit_apogee_id] ON [dbo].[apogeeVisit](apogee_id ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, SORT_IN_TEMPDB = ON, FILLFACTOR = 100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (12, N'apogeeVisit', N'i_apogeeVisit_plate_mjd_fiberid', 3, N'NONCLUSTERED', N'CREATE NONCLUSTERED INDEX [i_apogeeVisit_plate_mjd_fiberid] ON [dbo].[apogeeVisit](plate ASC, mjd ASC, fiberid ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, SORT_IN_TEMPDB = ON, FILLFACTOR = 100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (13, N'apogeeVisit', N'pk_apogeeVisit_visit_id', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_apogeeVisit_visit_id] ON [dbo].[apogeeVisit](visit_id ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (14, N'aspcapStar', N'i_aspcapStar_apstar_id', 2, N'NONCLUSTERED', N'CREATE NONCLUSTERED INDEX [i_aspcapStar_apstar_id] ON [dbo].[aspcapStar](apstar_id ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, SORT_IN_TEMPDB = ON, FILLFACTOR = 100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (15, N'aspcapStar', N'pk_aspcapStar_aspcap_id', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_aspcapStar_aspcap_id] ON [dbo].[aspcapStar](aspcap_id ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (16, N'aspcapStarCovar', N'pk_aspcapStarCovar_aspcap_covar_', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_aspcapStarCovar_aspcap_covar_] ON [dbo].[aspcapStarCovar](aspcap_covar_id ASC, aspcap_id ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (17, N'DataConstants', N'i_DataConstants_value', 2, N'NONCLUSTERED', N'CREATE NONCLUSTERED INDEX [i_DataConstants_value] ON [dbo].[DataConstants](value ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, SORT_IN_TEMPDB = ON, FILLFACTOR = 100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (18, N'DataConstants', N'pk_DataConstants_field_name', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_DataConstants_field_name] ON [dbo].[DataConstants](field ASC, name ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (19, N'DBColumns', N'pk_DBColumns_tableName_name', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_DBColumns_tableName_name] ON [dbo].[DBColumns](tablename ASC, name ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (20, N'DBObjects', N'pk_DBObjects_name', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_DBObjects_name] ON [dbo].[DBObjects](name ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (21, N'DBViewCols', N'pk_DBViewCols_viewName_name', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_DBViewCols_viewName_name] ON [dbo].[DBViewCols](name ASC, viewname ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (22, N'Dependency', N'pk_Dependency_parent_child', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_Dependency_parent_child] ON [dbo].[Dependency](parent ASC, child ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (23, N'detectionIndex', N'i_detectionIndex_thingID', 2, N'NONCLUSTERED', N'CREATE NONCLUSTERED INDEX [i_detectionIndex_thingID] ON [dbo].[detectionIndex](thingId ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, SORT_IN_TEMPDB = ON, FILLFACTOR = 100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (24, N'detectionIndex', N'pk_detectionIndex_thingId_objID', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_detectionIndex_thingId_objID] ON [dbo].[detectionIndex](thingId ASC, objId ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (25, N'Diagnostics', N'pk_Diagnostics_name', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_Diagnostics_name] ON [dbo].[Diagnostics](name ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (26, N'Field', N'i_Field_field_camcol_run_rerun', 38, N'NONCLUSTERED', N'CREATE NONCLUSTERED INDEX [i_Field_field_camcol_run_rerun] ON [dbo].[Field](field ASC, camcol ASC, run ASC, rerun ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, SORT_IN_TEMPDB = ON, FILLFACTOR = 100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (27, N'Field', N'i_Field_run_camcol_field_rerun', 39, N'NONCLUSTERED', N'CREATE NONCLUSTERED INDEX [i_Field_run_camcol_field_rerun] ON [dbo].[Field](run ASC, camcol ASC, field ASC, rerun ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, SORT_IN_TEMPDB = ON, FILLFACTOR = 100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (28, N'Field', N'pk_Field_fieldID', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_Field_fieldID] ON [dbo].[Field](fieldID ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (29, N'FieldProfile', N'pk_FieldProfile_fieldID_bin_band', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_FieldProfile_fieldID_bin_band] ON [dbo].[FieldProfile](bin ASC, band ASC, fieldID ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (30, N'FileGroupMap', N'pk_FileGroupMap_tableName', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_FileGroupMap_tableName] ON [dbo].[FileGroupMap](tableName ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (31, N'FIRST', N'pk_First_objID', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_First_objID] ON [dbo].[FIRST](objID ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (32, N'HalfSpace', N'i_HalfSpace_regionID_convexID_x_', 2, N'NONCLUSTERED', N'CREATE NONCLUSTERED INDEX [i_HalfSpace_regionID_convexID_x_] ON [dbo].[HalfSpace](regionid ASC, convexid ASC, x ASC, y ASC, z ASC, c ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, SORT_IN_TEMPDB = ON, FILLFACTOR = 100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (33, N'HalfSpace', N'pk_HalfSpace_constraintid', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_HalfSpace_constraintid] ON [dbo].[HalfSpace](constraintid ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (34, N'History', N'pk_History_id', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_History_id] ON [dbo].[History](id ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (35, N'IndexMap', N'pk_IndexMap_indexmapid', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_IndexMap_indexmapid] ON [dbo].[IndexMap](indexmapid ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (36, N'IndexMap2', NULL, 0, N'HEAP', NULL, N'PRIMARY', NULL, 0)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (37, N'Inventory', N'pk_Inventory_filename_name', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_Inventory_filename_name] ON [dbo].[Inventory](filename ASC, name ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (38, N'LoadHistory', N'pk_LoadHistory_loadVersion_tStar', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_LoadHistory_loadVersion_tStar] ON [dbo].[LoadHistory](loadversion ASC, tstart ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (39, N'mangaDrpAll', N'pk_mangaDrpAll_plateIFU', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_mangaDrpAll_plateIFU] ON [dbo].[mangaDrpAll](plateifu ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (40, N'mangatarget', N'pk_mangaTarget_mangaID', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_mangaTarget_mangaID] ON [dbo].[mangatarget](mangaID ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (41, N'marvelsStar', N'pk_marvelsStar_STARNAME_PLATE', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_marvelsStar_STARNAME_PLATE] ON [dbo].[marvelsStar](STARNAME ASC, Plate ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (42, N'marvelsVelocityCurveUF1D', N'pk_marvelsVelocityCurveUF1D_STAR', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_marvelsVelocityCurveUF1D_STAR] ON [dbo].[marvelsVelocityCurveUF1D](STARNAME ASC, BEAM ASC, RADECID ASC, FCJD ASC, LST-OBS ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (43, N'Mask', N'i_Mask_htmID_ra_dec_cx_cy_cz', 2, N'NONCLUSTERED', N'CREATE NONCLUSTERED INDEX [i_Mask_htmID_ra_dec_cx_cy_cz] ON [dbo].[Mask](htmID ASC, ra ASC, dec ASC, cx ASC, cy ASC, cz ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, SORT_IN_TEMPDB = ON, FILLFACTOR = 100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (44, N'Mask', N'pk_Mask_maskID', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_Mask_maskID] ON [dbo].[Mask](maskID ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (45, N'MaskedObject', N'pk_MaskedObject_objid_maskid', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_MaskedObject_objid_maskid] ON [dbo].[MaskedObject](objid ASC, maskID ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (46, N'nsatlas', NULL, 0, N'HEAP', NULL, N'PRIMARY', NULL, 0)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (47, N'page_compression_estimates', NULL, 0, N'HEAP', NULL, N'PRIMARY', NULL, 0)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (48, N'PartitionMap', N'pk_PartitionMap_fileGroupName', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_PartitionMap_fileGroupName] ON [dbo].[PartitionMap](fileGroupName ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (49, N'Plate2Target', NULL, 0, N'HEAP', NULL, N'PRIMARY', NULL, 0)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (50, N'PlateX', N'i_PlateX_htmID_ra_dec_cx_cy_cz', 2, N'NONCLUSTERED', N'CREATE NONCLUSTERED INDEX [i_PlateX_htmID_ra_dec_cx_cy_cz] ON [dbo].[PlateX](htmID ASC, ra ASC, dec ASC, cx ASC, cy ASC, cz ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, SORT_IN_TEMPDB = ON, FILLFACTOR = 100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (51, N'PlateX', N'pk_PlateX_plateID', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_PlateX_plateID] ON [dbo].[PlateX](plateID ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (52, N'ProfileDefs', N'pk_ProfileDefs_bin', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_ProfileDefs_bin] ON [dbo].[ProfileDefs](bin ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (53, N'ProperMotions', N'pk_ProperMotions_objID', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_ProperMotions_objID] ON [dbo].[ProperMotions](objid ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (54, N'PubHistory', N'pk_PubHistory_name_loadversion', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_PubHistory_name_loadversion] ON [dbo].[PubHistory](name ASC, loadversion ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (55, N'qsoVarPTF', N'pk_qsoVarPTF_VAR_OBJID', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_qsoVarPTF_VAR_OBJID] ON [dbo].[qsoVarPTF](VAR_OBJID ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (56, N'qsoVarStripe', N'pk_qsoVarStripe_VAR_OBJID', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_qsoVarStripe_VAR_OBJID] ON [dbo].[qsoVarStripe](VAR_OBJID ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (57, N'QueryResults', N'pk_QueryResults_query_time', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_QueryResults_query_time] ON [dbo].[QueryResults](query ASC, time ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (58, N'RC3', N'pk_RC3_objID', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_RC3_objID] ON [dbo].[RC3](objID ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (59, N'RecentQueries', N'pk_RecentQueries_ipAddr_lastQuer', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_RecentQueries_ipAddr_lastQuer] ON [dbo].[RecentQueries](ipAddr ASC, lastQueryTime ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (60, N'Region', N'pk_Region_regionId', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_Region_regionId] ON [dbo].[Region](regionid ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (61, N'Region2Box', NULL, 0, N'HEAP', NULL, N'PRIMARY', NULL, 0)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (62, N'RegionArcs', N'pk_RegionArcs_regionId_convexid_', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_RegionArcs_regionId_convexid_] ON [dbo].[RegionArcs](regionid ASC, convexid ASC, arcid ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (63, N'RegionPatch', N'i_RegionPatch_htmID_ra_dec_x_y_z', 2, N'NONCLUSTERED', N'CREATE NONCLUSTERED INDEX [i_RegionPatch_htmID_ra_dec_x_y_z] ON [dbo].[RegionPatch](htmid ASC, ra ASC, dec ASC, x ASC, y ASC, z ASC, type ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, SORT_IN_TEMPDB = ON, FILLFACTOR = 100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (64, N'RegionPatch', N'pk_RegionPatch_regionid_convexid', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_RegionPatch_regionid_convexid] ON [dbo].[RegionPatch](regionid ASC, convexid ASC, patchid ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (65, N'RegionTypes', NULL, 0, N'HEAP', NULL, N'PRIMARY', NULL, 0)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (66, N'Rmatrix', N'pk_RMatrix_mode_row', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_RMatrix_mode_row] ON [dbo].[Rmatrix](mode ASC, row ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (67, N'ROSAT', N'pk_Rosat_objID', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_Rosat_objID] ON [dbo].[ROSAT](OBJID ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (68, N'row_compression_estimates', NULL, 0, N'HEAP', NULL, N'PRIMARY', NULL, 0)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (69, N'Run', NULL, 0, N'HEAP', NULL, N'PRIMARY', NULL, 0)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (70, N'RunShift', N'pk_RunShift_run', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_RunShift_run] ON [dbo].[RunShift](run ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (71, N'sdssBestTarget2Sector', NULL, 0, N'HEAP', NULL, N'PRIMARY', NULL, 0)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (72, N'SDSSConstants', N'pk_SDSSConstants_name', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_SDSSConstants_name] ON [dbo].[SDSSConstants](name ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (73, N'sdssImagingHalfSpaces', N'pk_sdssImagingHalfspaces_sdssPol', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_sdssImagingHalfspaces_sdssPol] ON [dbo].[sdssImagingHalfSpaces](sdssPolygonID ASC, x ASC, y ASC, z ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (74, N'sdssPolygon2Field', N'pk_sdssPolygon2Field_sdssPolygon', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_sdssPolygon2Field_sdssPolygon] ON [dbo].[sdssPolygon2Field](sdssPolygonID ASC, fieldID ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (75, N'sdssPolygons', N'pk_sdssPolygons_sdssPolygonID', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_sdssPolygons_sdssPolygonID] ON [dbo].[sdssPolygons](sdssPolygonID ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (76, N'sdssSector', NULL, 0, N'HEAP', NULL, N'PRIMARY', NULL, 0)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (77, N'sdssSector2Tile', NULL, 0, N'HEAP', NULL, N'PRIMARY', NULL, 0)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (78, N'sdssTargetParam', N'pk_sdssTargetParam_targetVersion', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_sdssTargetParam_targetVersion] ON [dbo].[sdssTargetParam](targetVersion ASC, paramFile ASC, name ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (79, N'sdssTileAll', N'i_sdssTileAll_htmID_racen_deccen', 3, N'NONCLUSTERED', N'CREATE NONCLUSTERED INDEX [i_sdssTileAll_htmID_racen_deccen] ON [dbo].[sdssTileAll](htmID ASC, raCen ASC, decCen ASC, cx ASC, cy ASC, cz ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, SORT_IN_TEMPDB = ON, FILLFACTOR = 100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (80, N'sdssTileAll', N'i_sdssTileAll_tileRun_tile', 2, N'NONCLUSTERED', N'CREATE UNIQUE NONCLUSTERED INDEX [i_sdssTileAll_tileRun_tile] ON [dbo].[sdssTileAll](tileRun ASC, tile ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, SORT_IN_TEMPDB = ON, FILLFACTOR = 100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (81, N'sdssTileAll', N'pk_sdssTileAll_tile', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_sdssTileAll_tile] ON [dbo].[sdssTileAll](tile ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (82, N'sdssTiledTargetAll', N'i_sdssTiledTargetAll_htmID_ra_de', 2, N'NONCLUSTERED', N'CREATE NONCLUSTERED INDEX [i_sdssTiledTargetAll_htmID_ra_de] ON [dbo].[sdssTiledTargetAll](htmID ASC, ra ASC, dec ASC, cx ASC, cy ASC, cz ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, SORT_IN_TEMPDB = ON, FILLFACTOR = 100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (83, N'sdssTiledTargetAll', N'pk_sdssTiledTargetAll_targetID', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_sdssTiledTargetAll_targetID] ON [dbo].[sdssTiledTargetAll](targetID ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (84, N'sdssTilingGeometry', N'pk_sdssTilingGeometry_tilingGeom', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_sdssTilingGeometry_tilingGeom] ON [dbo].[sdssTilingGeometry](tilingGeometryID ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (85, N'sdssTilingInfo', N'i_sdssTilingInfo_targetID_tileRu', 2, N'NONCLUSTERED', N'CREATE UNIQUE NONCLUSTERED INDEX [i_sdssTilingInfo_targetID_tileRu] ON [dbo].[sdssTilingInfo](targetID ASC, tileRun ASC, collisionGroup ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, SORT_IN_TEMPDB = ON, FILLFACTOR = 100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (86, N'sdssTilingInfo', N'i_sdssTilingInfo_tile_collisionG', 4, N'NONCLUSTERED', N'CREATE NONCLUSTERED INDEX [i_sdssTilingInfo_tile_collisionG] ON [dbo].[sdssTilingInfo](tile ASC, collisionGroup ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, SORT_IN_TEMPDB = ON, FILLFACTOR = 100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (87, N'sdssTilingInfo', N'i_sdssTilingInfo_tileRun_tid_col', 3, N'NONCLUSTERED', N'CREATE UNIQUE NONCLUSTERED INDEX [i_sdssTilingInfo_tileRun_tid_col] ON [dbo].[sdssTilingInfo](tileRun ASC, tid ASC, collisionGroup ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, SORT_IN_TEMPDB = ON, FILLFACTOR = 100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (88, N'sdssTilingInfo', N'pk_sdssTilingInfo_tileRun_target', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_sdssTilingInfo_tileRun_target] ON [dbo].[sdssTilingInfo](tileRun ASC, targetID ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (89, N'sdssTilingRun', N'pk_sdssTilingRun_tileRun', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_sdssTilingRun_tileRun] ON [dbo].[sdssTilingRun](tileRun ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (90, N'segueTargetAll', N'i_segueTargetAll_segue1_target1_', 2, N'NONCLUSTERED', N'CREATE NONCLUSTERED INDEX [i_segueTargetAll_segue1_target1_] ON [dbo].[segueTargetAll](segue1_target1 ASC, segue2_target1 ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, SORT_IN_TEMPDB = ON, FILLFACTOR = 100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (91, N'segueTargetAll', N'pk_segueTargetAll_objID', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_segueTargetAll_objID] ON [dbo].[segueTargetAll](objid ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (92, N'SiteConstants', N'pk_SiteConstants_name', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_SiteConstants_name] ON [dbo].[SiteConstants](name ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (93, N'SiteDBs', NULL, 0, N'HEAP', NULL, N'PRIMARY', NULL, 0)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (94, N'SiteDiagnostics', N'pk_SiteDiagnostics_name', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_SiteDiagnostics_name] ON [dbo].[SiteDiagnostics](name ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (95, N'SkipFinishPhases', NULL, 0, N'HEAP', NULL, N'PRIMARY', NULL, 0)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (96, N'sppTargets', NULL, 0, N'HEAP', NULL, N'PRIMARY', NULL, 0)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (97, N'StripeDefs', N'pk_StripeDefs_stripe', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_StripeDefs_stripe] ON [dbo].[StripeDefs](stripe ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (98, N'Target', N'pk_Target_targetID', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_Target_targetID] ON [dbo].[Target](targetID ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (99, N'TargetInfo', N'pk_TargetInfo_skyVersion_targetI', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_TargetInfo_skyVersion_targetI] ON [dbo].[TargetInfo](skyVersion ASC, targetID ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (100, N'thingIndex', N'i_thingIndex_objID', 2, N'NONCLUSTERED', N'CREATE NONCLUSTERED INDEX [i_thingIndex_objID] ON [dbo].[thingIndex](objID ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, SORT_IN_TEMPDB = ON, FILLFACTOR = 100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (101, N'thingIndex', N'pk_thingIndex_thingId', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_thingIndex_thingId] ON [dbo].[thingIndex](thingId ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (102, N'TwoMass', N'i_TwoMass_ccflag', 13, N'NONCLUSTERED', N'CREATE NONCLUSTERED INDEX [i_TwoMass_ccflag] ON [dbo].[TwoMass](ccFlag ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, SORT_IN_TEMPDB = ON, FILLFACTOR = 100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (103, N'TwoMass', N'i_TwoMass_dec', 9, N'NONCLUSTERED', N'CREATE NONCLUSTERED INDEX [i_TwoMass_dec] ON [dbo].[TwoMass](dec ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, SORT_IN_TEMPDB = ON, FILLFACTOR = 100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (104, N'TwoMass', N'i_TwoMass_h', 11, N'NONCLUSTERED', N'CREATE NONCLUSTERED INDEX [i_TwoMass_h] ON [dbo].[TwoMass](h ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, SORT_IN_TEMPDB = ON, FILLFACTOR = 100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (105, N'TwoMass', N'i_TwoMass_j', 10, N'NONCLUSTERED', N'CREATE NONCLUSTERED INDEX [i_TwoMass_j] ON [dbo].[TwoMass](j ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, SORT_IN_TEMPDB = ON, FILLFACTOR = 100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (106, N'TwoMass', N'i_TwoMass_k', 12, N'NONCLUSTERED', N'CREATE NONCLUSTERED INDEX [i_TwoMass_k] ON [dbo].[TwoMass](k ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, SORT_IN_TEMPDB = ON, FILLFACTOR = 100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (107, N'TwoMass', N'i_TwoMass_phqual', 14, N'NONCLUSTERED', N'CREATE NONCLUSTERED INDEX [i_TwoMass_phqual] ON [dbo].[TwoMass](phQual ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, SORT_IN_TEMPDB = ON, FILLFACTOR = 100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (108, N'TwoMass', N'i_TwoMass_ra', 8, N'NONCLUSTERED', N'CREATE NONCLUSTERED INDEX [i_TwoMass_ra] ON [dbo].[TwoMass](ra ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, SORT_IN_TEMPDB = ON, FILLFACTOR = 100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (109, N'TwoMass', N'pk_TwoMass_objID', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_TwoMass_objID] ON [dbo].[TwoMass](objID ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (110, N'TwoMassXSC', N'pk_TwoMassXSC_objID', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_TwoMassXSC_objID] ON [dbo].[TwoMassXSC](objID ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (111, N'USNO', N'pk_USNO_objID', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_USNO_objID] ON [dbo].[USNO](OBJID ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (112, N'Versions', N'pk_Versions_version', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_Versions_version] ON [dbo].[Versions](version ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (113, N'WISE_xmatch', N'pk_WISE_xmatch_sdss_objID_wise_c', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_WISE_xmatch_sdss_objID_wise_c] ON [dbo].[WISE_xmatch](sdss_objid ASC, wise_cntr ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (114, N'Zone', N'pk_Zone_zoneID_ra_objID', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_Zone_zoneID_ra_objID] ON [dbo].[Zone](zoneID ASC, ra ASC, objID ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (115, N'zoo2MainPhotoz', N'pk_zoo2MainPhotoz_dr7objid', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_zoo2MainPhotoz_dr7objid] ON [dbo].[zoo2MainPhotoz](dr7objid ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (116, N'zoo2MainSpecz', N'pk_zoo2MainSpecz_dr7objid', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_zoo2MainSpecz_dr7objid] ON [dbo].[zoo2MainSpecz](dr7objid ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (117, N'zoo2Stripe82Coadd1', N'pk_zoo2Stripe82Coadd1_stripe82ob', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_zoo2Stripe82Coadd1_stripe82ob] ON [dbo].[zoo2Stripe82Coadd1](stripe82objid ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (118, N'zoo2Stripe82Coadd2', N'pk_zoo2Stripe82Coadd2_stripe82ob', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_zoo2Stripe82Coadd2_stripe82ob] ON [dbo].[zoo2Stripe82Coadd2](stripe82objid ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (119, N'zoo2Stripe82Normal', N'pk_zoo2Stripe82Normal_dr7objid', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_zoo2Stripe82Normal_dr7objid] ON [dbo].[zoo2Stripe82Normal](dr7objid ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (120, N'zooMirrorBias', N'i_zooMirrorBias_objID', 5, N'NONCLUSTERED', N'CREATE NONCLUSTERED INDEX [i_zooMirrorBias_objID] ON [dbo].[zooMirrorBias](objid ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, SORT_IN_TEMPDB = ON, FILLFACTOR = 100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (121, N'zooMirrorBias', N'pk_zooMirrorBias_dr7objid', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_zooMirrorBias_dr7objid] ON [dbo].[zooMirrorBias](dr7objid ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (122, N'zooMonochromeBias', N'i_zooMonochromeBias_objID', 4, N'NONCLUSTERED', N'CREATE NONCLUSTERED INDEX [i_zooMonochromeBias_objID] ON [dbo].[zooMonochromeBias](objid ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, SORT_IN_TEMPDB = ON, FILLFACTOR = 100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (123, N'zooMonochromeBias', N'pk_zooMonochromeBias_dr7objid', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_zooMonochromeBias_dr7objid] ON [dbo].[zooMonochromeBias](dr7objid ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (124, N'zooNoSpec', N'i_zooNoSpec_objID', 5, N'NONCLUSTERED', N'CREATE NONCLUSTERED INDEX [i_zooNoSpec_objID] ON [dbo].[zooNoSpec](objid ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, SORT_IN_TEMPDB = ON, FILLFACTOR = 100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (125, N'zooNoSpec', N'pk_zooNoSpec_dr7objid', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_zooNoSpec_dr7objid] ON [dbo].[zooNoSpec](dr7objid ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (126, N'zooVotes', N'i_zooVotes_objID', 4, N'NONCLUSTERED', N'CREATE NONCLUSTERED INDEX [i_zooVotes_objID] ON [dbo].[zooVotes](objid ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, SORT_IN_TEMPDB = ON, FILLFACTOR = 100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (127, N'zooVotes', N'pk_zooVotes_dr7objid', 1, N'CLUSTERED', N'CREATE UNIQUE CLUSTERED INDEX [pk_zooVotes_dr7objid] ON [dbo].[zooVotes](dr7objid ASC) 
WITH (PAD_INDEX = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, SORT_IN_TEMPDB = ON, FILLFACTOR =100, DATA_COMPRESSION=PAGE) ON [DATAFG];', N'PRIMARY', N'DATAFG', 2)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (128, N'apogeeDesign', NULL, 0, N'HEAP', NULL, N'PRIMARY', NULL, 0)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (129, N'apogeeField', NULL, 0, N'HEAP', NULL, N'PRIMARY', NULL, 0)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (130, N'IndexMap2', NULL, 0, N'HEAP', NULL, N'PRIMARY', NULL, 0)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (131, N'marvelsVelocityCurveUF1D', N'pk_marvelsVelocityCurveUF1D_STAR', 1, N'CLUSTERED', NULL, N'PRIMARY', NULL, 0)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (132, N'nsatlas', NULL, 0, N'HEAP', NULL, N'PRIMARY', NULL, 0)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (133, N'page_compression_estimates', NULL, 0, N'HEAP', NULL, N'PRIMARY', NULL, 0)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (134, N'Plate2Target', NULL, 0, N'HEAP', NULL, N'PRIMARY', NULL, 0)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (135, N'Region2Box', NULL, 0, N'HEAP', NULL, N'PRIMARY', NULL, 0)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (136, N'RegionTypes', NULL, 0, N'HEAP', NULL, N'PRIMARY', NULL, 0)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (137, N'row_compression_estimates', NULL, 0, N'HEAP', NULL, N'PRIMARY', NULL, 0)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (138, N'Run', NULL, 0, N'HEAP', NULL, N'PRIMARY', NULL, 0)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (139, N'sdssBestTarget2Sector', NULL, 0, N'HEAP', NULL, N'PRIMARY', NULL, 0)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (140, N'sdssSector', NULL, 0, N'HEAP', NULL, N'PRIMARY', NULL, 0)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (141, N'sdssSector2Tile', NULL, 0, N'HEAP', NULL, N'PRIMARY', NULL, 0)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (142, N'SiteDBs', NULL, 0, N'HEAP', NULL, N'PRIMARY', NULL, 0)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (143, N'SkipFinishPhases', NULL, 0, N'HEAP', NULL, N'PRIMARY', NULL, 0)
GO
INSERT [dbo].[IndexInfo] ([pk], [TableName], [IndexName], [IndexID], [IndexType], [IndexSql], [sourceFG], [destFG], [IndexStatus]) VALUES (144, N'sppTargets', NULL, 0, N'HEAP', NULL, N'PRIMARY', NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[IndexInfo] OFF
GO
ALTER TABLE [dbo].[IndexInfo] ADD  DEFAULT ((0)) FOR [IndexStatus]
GO
