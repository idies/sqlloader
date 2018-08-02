USE [sueDB]
GO
/****** Object:  Table [dbo].[DRxTables]    Script Date: 8/2/2018 12:46:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DRxTables](
	[id] [int] NOT NULL,
	[tablename] [sysname] NOT NULL,
	[indexgroup] [sysname] NOT NULL,
	[common] [bit] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (1, N'SpecPhotoAll', N'FINISH', 0)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (2, N'PartitionMap', N'META', 0)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (3, N'FileGroupMap', N'META', 0)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (4, N'IndexMap', N'META', 0)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (5, N'PubHistory', N'META', 0)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (6, N'QueryResults', N'META', 0)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (7, N'RecentQueries', N'META', 0)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (8, N'RunShift', N'META', 0)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (9, N'Versions', N'META', 0)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (10, N'DBObjects', N'META', 0)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (11, N'DBColumns', N'META', 0)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (12, N'DBViewCols', N'META', 0)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (13, N'History', N'META', 0)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (14, N'Inventory', N'META', 0)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (15, N'Dependency', N'META', 0)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (16, N'DataConstants', N'META', 0)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (17, N'Diagnostics', N'META', 0)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (18, N'SDSSConstants', N'META', 0)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (19, N'SiteConstants', N'META', 0)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (20, N'SiteDiagnostics', N'META', 0)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (21, N'ProfileDefs', N'META', 0)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (22, N'LoadHistory', N'META', 0)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (23, N'sdssEbossFirefly', N'SPECTRO', 0)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (24, N'PlateX', N'SPECTRO', 0)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (25, N'SpecObjAll', N'SPECTRO', 0)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (26, N'apogeeDesign', N'SPECTRO', 0)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (27, N'apogeeField', N'SPECTRO', 0)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (28, N'apogeeVisit', N'SPECTRO', 0)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (29, N'apogeeStar', N'SPECTRO', 0)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (30, N'aspcapStar', N'SPECTRO', 0)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (31, N'apogeePlate', N'SPECTRO', 0)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (32, N'aspcapStarCovar', N'SPECTRO', 0)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (33, N'apogeeObject', N'SPECTRO', 0)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (34, N'apogeeStarVisit', N'SPECTRO', 0)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (35, N'apogeeStarAllVisit', N'SPECTRO', 0)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (36, N'cannonStar', N'SPECTRO', 0)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (37, N'mangaDrpAll', N'SPECTRO', 0)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (38, N'mangaTarget', N'SPECTRO', 0)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (39, N'nsatlas', N'SPECTRO', 0)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (40, N'mangaFirefly', N'SPECTRO', 0)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (41, N'mangaPipe3D', N'SPECTRO', 0)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (42, N'qsoVarPTF', N'SPECTRO', 0)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (43, N'qsoVarStripe', N'SPECTRO', 0)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (44, N'zooSpec', N'SPECTRO', 0)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (45, N'zooConfidence', N'SPECTRO', 0)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (46, N'zoo2MainSpecz', N'SPECTRO', 0)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (47, N'zoo2Stripe82Coadd1', N'SPECTRO', 0)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (48, N'zoo2Stripe82Coadd2', N'SPECTRO', 0)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (49, N'zoo2Stripe82Normal', N'SPECTRO', 0)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (50, N'marvelsStar', N'SPECTRO', 0)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (51, N'marvelsVelocityCurveUF1D', N'SPECTRO', 0)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (52, N'Neighbors', N'NEIGHBORS', 1)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (53, N'PhotoObjAll', N'PHOTO', 1)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (54, N'PhotoProfile', N'PHOTO', 1)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (55, N'AtlasOutline', N'PHOTO', 1)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (56, N'Frame', N'PHOTO', 1)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (57, N'PhotoPrimaryDR7', N'PHOTO', 1)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (58, N'PhotoObjDR7', N'PHOTO', 1)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (59, N'Field', N'PHOTO', 1)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (60, N'FieldProfile', N'PHOTO', 1)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (61, N'Mask', N'PHOTO', 1)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (62, N'First', N'PHOTO', 1)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (63, N'RC3', N'PHOTO', 1)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (64, N'Rosat', N'PHOTO', 1)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (65, N'USNO', N'PHOTO', 1)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (66, N'TwoMass', N'PHOTO', 1)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (67, N'TwoMassXSC', N'PHOTO', 1)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (68, N'WISE_xmatch', N'PHOTO', 1)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (69, N'WISE_allsky', N'PHOTO', 1)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (70, N'wiseForcedTarget', N'PHOTO', 1)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (71, N'thingIndex', N'PHOTO', 1)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (72, N'detectionIndex', N'PHOTO', 1)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (73, N'ProperMotions', N'PHOTO', 1)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (74, N'StripeDefs', N'PHOTO', 1)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (75, N'MaskedObject', N'PHOTO', 1)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (76, N'zooMirrorBias', N'PHOTO', 1)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (77, N'zooMonochromeBias', N'PHOTO', 1)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (78, N'zooNoSpec', N'PHOTO', 1)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (79, N'zooVotes', N'PHOTO', 1)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (80, N'zoo2MainPhotoz', N'PHOTO', 1)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (81, N'RMatrix', N'REGION', 1)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (82, N'Region', N'REGION', 1)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (83, N'HalfSpace', N'REGION', 1)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (84, N'RegionArcs', N'REGION', 1)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (85, N'RegionPatch', N'REGION', 1)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (86, N'sdssImagingHalfspaces', N'REGION', 1)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (87, N'sdssPolygon2Field', N'REGION', 1)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (88, N'sdssPolygons', N'REGION', 1)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (89, N'SpecDR7', N'SPECTRO', 1)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (90, N'sppParams', N'SPECTRO', 1)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (91, N'sppLines', N'SPECTRO', 1)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (92, N'segueTargetAll', N'SPECTRO', 1)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (93, N'galSpecExtra', N'SPECTRO', 1)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (94, N'galSpecIndx', N'SPECTRO', 1)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (95, N'galSpecInfo', N'SPECTRO', 1)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (96, N'galSpecLine', N'SPECTRO', 1)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (97, N'emissionLinesPort', N'SPECTRO', 1)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (98, N'stellarMassFSPSGranEarlyDust', N'SPECTRO', 1)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (99, N'stellarMassFSPSGranEarlyNoDust', N'SPECTRO', 1)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (100, N'stellarMassFSPSGranWideDust', N'SPECTRO', 1)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (101, N'stellarMassFSPSGranWideNoDust', N'SPECTRO', 1)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (102, N'stellarMassPCAWiscBC03', N'SPECTRO', 1)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (103, N'stellarMassPCAWiscM11', N'SPECTRO', 1)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (104, N'stellarMassStarformingPort', N'SPECTRO', 1)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (105, N'stellarMassPassivePort', N'SPECTRO', 1)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (106, N'sppTargets', N'SPECTRO', 1)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (107, N'Target', N'TILES', 1)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (108, N'TargetInfo', N'TILES', 1)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (109, N'sdssTargetParam', N'TILES', 1)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (110, N'sdssTileAll', N'TILES', 1)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (111, N'sdssTilingGeometry', N'TILES', 1)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (112, N'sdssTilingRun', N'TILES', 1)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (113, N'sdssTiledTargetAll', N'TILES', 1)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (114, N'sdssTilingInfo', N'TILES', 1)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (115, N'plate2Target', N'TILES', 1)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (116, N'Zone', N'ZONE', 1)
GO
INSERT [dbo].[DRxTables] ([id], [tablename], [indexgroup], [common]) VALUES (117, N'PhotoZ', N'PHOTO', 1)
GO
