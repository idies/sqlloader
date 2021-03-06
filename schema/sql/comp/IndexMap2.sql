
/****** Object:  Table [dbo].[IndexMap2]    Script Date: 11/10/2016 3:40:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IndexMap2](
	[indexmapid] [int] NOT NULL,
	[code] [varchar](2) NOT NULL,
	[type] [varchar](32) NOT NULL,
	[tableName] [varchar](128) NOT NULL,
	[fieldList] [varchar](1000) NOT NULL,
	[foreignKey] [varchar](1000) NOT NULL,
	[indexgroup] [varchar](128) NOT NULL,
	[compression] [varchar](4) NULL
) ON [PRIMARY]

GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (1, N'K', N'primary key', N'PartitionMap', N'fileGroupName', N'', N'META', NULL)
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (2, N'K', N'primary key', N'FileGroupMap', N'tableName', N'', N'META', NULL)
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (3, N'K', N'primary key', N'IndexMap', N'indexmapid', N'', N'META', NULL)
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (4, N'K', N'primary key', N'PubHistory', N'name,loadversion', N'', N'META', NULL)
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (5, N'K', N'primary key', N'QueryResults', N'query, time', N'', N'META', NULL)
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (6, N'K', N'primary key', N'RecentQueries', N'ipAddr,lastQueryTime', N'', N'META', NULL)
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (7, N'K', N'primary key', N'RunShift', N'run', N'', N'META', NULL)
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (8, N'K', N'primary key', N'Versions', N'version', N'', N'META', NULL)
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (9, N'K', N'primary key', N'DBObjects', N'name', N'', N'META', NULL)
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (10, N'K', N'primary key', N'DBColumns', N'tableName,name', N'', N'META', NULL)
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (11, N'K', N'primary key', N'DBViewCols', N'viewName,name', N'', N'META', NULL)
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (12, N'K', N'primary key', N'History', N'id', N'', N'META', NULL)
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (13, N'K', N'primary key', N'Inventory', N'filename,name', N'', N'META', NULL)
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (14, N'K', N'primary key', N'Dependency', N'parent,child', N'', N'META', NULL)
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (15, N'K', N'primary key', N'DataConstants', N'field,name', N'', N'META', NULL)
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (16, N'K', N'primary key', N'Diagnostics', N'name', N'', N'META', NULL)
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (17, N'K', N'primary key', N'SDSSConstants', N'name', N'', N'META', NULL)
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (18, N'K', N'primary key', N'SiteConstants', N'name', N'', N'META', NULL)
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (19, N'K', N'primary key', N'SiteDiagnostics', N'name', N'', N'META', NULL)
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (20, N'K', N'primary key', N'ProfileDefs', N'bin', N'', N'META', NULL)
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (21, N'K', N'primary key', N'LoadHistory', N'loadVersion,tStart', N'', N'META', NULL)
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (22, N'K', N'primary key', N'PhotoObjAll', N'objID', N'', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (23, N'K', N'primary key', N'PhotoProfile', N'objID,bin,band', N'', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (24, N'K', N'primary key', N'AtlasOutline', N'objID', N'', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (25, N'K', N'primary key', N'Frame', N'fieldID,zoom', N'', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (26, N'K', N'primary key', N'PhotoPrimaryDR7', N'dr8objID', N'', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (27, N'K', N'primary key', N'PhotoObjDR7', N'dr8objID', N'', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (28, N'K', N'primary key', N'Photoz', N'objID', N'', N'PHOTO', NULL)
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (29, N'K', N'primary key', N'PhotozErrorMap', N'cellID', N'', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (30, N'K', N'primary key', N'Field', N'fieldID', N'', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (31, N'K', N'primary key', N'FieldProfile', N'fieldID,bin,band', N'', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (32, N'K', N'primary key', N'Mask', N'maskID', N'', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (33, N'K', N'primary key', N'First', N'objID', N'', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (34, N'K', N'primary key', N'RC3', N'objID', N'', N'PHOTO', NULL)
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (35, N'K', N'primary key', N'Rosat', N'objID', N'', N'PHOTO', NULL)
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (36, N'K', N'primary key', N'USNO', N'objID', N'', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (37, N'K', N'primary key', N'TwoMass', N'objID', N'', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (38, N'K', N'primary key', N'TwoMassXSC', N'objID', N'', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (39, N'K', N'primary key', N'WISE_xmatch', N'sdss_objID,wise_cntr', N'', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (40, N'K', N'primary key', N'WISE_allsky', N'cntr', N'', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (41, N'K', N'primary key', N'wiseForcedTarget', N'objID', N'', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (42, N'K', N'primary key', N'thingIndex', N'thingId', N'', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (43, N'K', N'primary key', N'detectionIndex', N'thingId,objID', N'', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (44, N'K', N'primary key', N'ProperMotions', N'objID', N'', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (45, N'K', N'primary key', N'StripeDefs', N'stripe', N'', N'PHOTO', NULL)
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (46, N'K', N'primary key', N'MaskedObject', N'objid,maskid', N'', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (47, N'K', N'primary key', N'zooMirrorBias', N'dr7objid', N'', N'PHOTO', NULL)
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (48, N'K', N'primary key', N'zooMonochromeBias', N'dr7objid', N'', N'PHOTO', NULL)
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (49, N'K', N'primary key', N'zooNoSpec', N'dr7objid', N'', N'PHOTO', NULL)
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (50, N'K', N'primary key', N'zooVotes', N'dr7objid', N'', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (51, N'K', N'primary key', N'zoo2MainPhotoz', N'dr7objid', N'', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (52, N'K', N'primary key', N'PlateX', N'plateID', N'', N'SPECTRO', NULL)
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (53, N'K', N'primary key', N'SpecObjAll', N'specObjID', N'', N'SPECTRO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (54, N'K', N'primary key', N'SpecDR7', N'specObjID', N'', N'SPECTRO', NULL)
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (55, N'K', N'primary key', N'sppParams', N'specObjID', N'', N'SPECTRO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (56, N'K', N'primary key', N'sppLines', N'specObjID', N'', N'SPECTRO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (57, N'K', N'primary key', N'segueTargetAll', N'objID', N'', N'SPECTRO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (58, N'K', N'primary key', N'galSpecExtra', N'specObjID', N'', N'SPECTRO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (59, N'K', N'primary key', N'galSpecIndx', N'specObjID', N'', N'SPECTRO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (60, N'K', N'primary key', N'galSpecInfo', N'specObjID', N'', N'SPECTRO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (61, N'K', N'primary key', N'galSpecLine', N'specObjID', N'', N'SPECTRO', NULL)
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (62, N'K', N'primary key', N'emissionLinesPort', N'specObjID', N'', N'SPECTRO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (63, N'K', N'primary key', N'stellarMassFSPSGranEarlyDust', N'specObjID', N'', N'SPECTRO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (119, N'F', N'foreign key', N'MaskedObject', N'objID', N'PhotoObjAll(objID)', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (120, N'F', N'foreign key', N'MaskedObject', N'maskID', N'Mask(maskID)', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (121, N'F', N'foreign key', N'SpecObjAll', N'plateID', N'PlateX(plateID)', N'SPECTRO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (122, N'F', N'foreign key', N'mangaDrpAll', N'mangaID', N'mangaTarget(mangaID)', N'SPECTRO', NULL)
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (123, N'F', N'foreign key', N'zoo2MainSpecz', N'dr8objid', N'PhotoObjAll(objid)', N'SPECTRO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (124, N'F', N'foreign key', N'zoo2Stripe82Coadd1', N'dr8objid', N'PhotoObjAll(objid)', N'SPECTRO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (125, N'F', N'foreign key', N'zoo2Stripe82Coadd2', N'dr8objid', N'PhotoObjAll(objid)', N'SPECTRO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (126, N'F', N'foreign key', N'zoo2Stripe82Normal', N'dr8objid', N'PhotoObjAll(objid)', N'SPECTRO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (127, N'F', N'foreign key', N'TargetInfo', N'targetID', N'Target(targetID)', N'TILES', NULL)
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (128, N'F', N'foreign key', N'sdssTileAll', N'tileRun', N'sdssTilingRun(tileRun)', N'TILES', NULL)
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (129, N'F', N'foreign key', N'sdssTilingGeometry', N'tileRun', N'sdssTilingRun(tileRun)', N'TILES', NULL)
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (130, N'F', N'foreign key', N'sdssTilingInfo', N'tileRun', N'sdssTilingRun(tileRun)', N'TILES', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (131, N'F', N'foreign key', N'HalfSpace', N'regionID', N'Region(regionID)', N'REGION', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (132, N'F', N'foreign key', N'RegionArcs', N'regionID', N'Region(regionID)', N'REGION', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (133, N'F', N'foreign key', N'RegionPatch', N'regionID', N'Region(regionID)', N'REGION', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (134, N'F', N'foreign key', N'Zone', N'objID', N'PhotoObjAll(objID)', N'ZONE', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (135, N'F', N'foreign key', N'Neighbors', N'objID', N'PhotoObjAll(objID)', N'NEIGHBORS', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (136, N'F', N'foreign key', N'SpecPhotoAll', N'specObjID', N'SpecObjAll(specObjID)', N'FINISH', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (137, N'F', N'foreign key', N'DBColumns', N'tablename', N'DBObjects(name)', N'META', NULL)
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (138, N'F', N'foreign key', N'DBViewCols', N'viewname', N'DBObjects(name)', N'META', NULL)
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (139, N'F', N'foreign key', N'IndexMap', N'tableName', N'DBObjects(name)', N'META', NULL)
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (140, N'F', N'foreign key', N'FileGroupMap', N'tableFileGroup', N'PartitionMap(fileGroupName)', N'META', NULL)
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (141, N'F', N'foreign key', N'Inventory', N'name', N'DBObjects(name)', N'META', NULL)
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (142, N'I', N'index', N'Field', N'field,camcol,run,rerun', N'', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (143, N'I', N'index', N'Field', N'run,camcol,field,rerun', N'', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (144, N'I', N'index', N'Frame', N'field,camcol,run,zoom,rerun', N'', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (145, N'I', N'index', N'Frame', N'htmID,zoom,cx,cy,cz,a,b,c,d,e,f,node,incl', N'', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (146, N'I', N'index', N'Mask', N'htmID,ra,dec,cx,cy,cz', N'', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (147, N'I', N'index', N'PhotoObjAll', N'mode,cy,cx,cz,htmID,type,flags,ra,dec,u,g,r,i,z', N'', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (148, N'I', N'index', N'PhotoObjAll', N'htmID,cx,cy,cz,type,mode,flags,ra,dec,u,g,r,i,z', N'', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (149, N'I', N'index', N'PhotoObjAll', N'htmID,run,camcol,field,rerun,type,mode,flags,cx,cy,cz,g,r', N'', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (150, N'I', N'index', N'PhotoObjAll', N'field,run,rerun,camcol,type,mode,flags,rowc,colc,ra,dec,u,g,r,i,z', N'', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (151, N'I', N'index', N'PhotoObjAll', N'fieldID,objID,ra,dec,r,type,flags', N'', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (152, N'I', N'index', N'PhotoObjAll', N'SpecObjID,cx,cy,cz,mode,type,flags,ra,dec,u,g,r,i,z', N'', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (153, N'I', N'index', N'PhotoObjAll', N'cx,cy,cz,htmID,mode,type,flags,ra,dec,u,g,r,i,z', N'', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (154, N'I', N'index', N'PhotoObjAll', N'run,mode,type,flags,u,g,r,i,z,Err_u,Err_g,Err_r,Err_i,Err_z', N'', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (155, N'I', N'index', N'PhotoObjAll', N'run,camcol,rerun,type,mode,flags,ra,dec,fieldID,field,u,g,r,i,z', N'', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (156, N'I', N'index', N'PhotoObjAll', N'run,camcol,field,mode,parentID,q_r,q_g,u_r,u_g,fiberMag_u,fiberMag_g,fiberMag_r,fiberMag_i,fiberMag_z', N'', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (157, N'I', N'index', N'PhotoObjAll', N'run,camcol,type,mode,cx,cy,cz', N'', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (158, N'I', N'index', N'PhotoObjAll', N'ra,[dec],type,mode,flags,u,g,r,i,z,psfMag_u,psfMag_g,psfMag_r,psfMag_i,psfMag_z', N'', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (159, N'I', N'index', N'PhotoObjAll', N'b,l,type,mode,flags,u,g,r,i,z,psfMag_u,psfMag_g,psfMag_r,psfMag_i,psfMag_z', N'', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (160, N'I', N'index', N'PhotoObjAll', N'phototag', N'', N'SCHEMA', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (161, N'I', N'index', N'PhotoObjAll', N'parentid,mode,type', N'', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (162, N'I', N'index', N'PhotoObjDR7', N'dr7objID', N'', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (64, N'K', N'primary key', N'stellarMassFSPSGranEarlyNoDust', N'specObjID', N'', N'SPECTRO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (65, N'K', N'primary key', N'stellarMassFSPSGranWideDust', N'specObjID', N'', N'SPECTRO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (66, N'K', N'primary key', N'stellarMassFSPSGranWideNoDust', N'specObjID', N'', N'SPECTRO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (67, N'K', N'primary key', N'stellarMassPCAWiscBC03', N'specObjID', N'', N'SPECTRO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (68, N'K', N'primary key', N'stellarMassPCAWiscM11', N'specObjID', N'', N'SPECTRO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (69, N'K', N'primary key', N'stellarMassStarformingPort', N'specObjID', N'', N'SPECTRO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (70, N'K', N'primary key', N'stellarMassPassivePort', N'specObjID', N'', N'SPECTRO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (71, N'K', N'primary key', N'apogeeVisit', N'visit_id', N'', N'SPECTRO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (72, N'K', N'primary key', N'apogeeStar', N'apstar_id', N'', N'SPECTRO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (73, N'K', N'primary key', N'aspcapStar', N'aspcap_id', N'', N'SPECTRO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (74, N'K', N'primary key', N'apogeePlate', N'plate_visit_id', N'', N'SPECTRO', NULL)
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (75, N'K', N'primary key', N'aspcapStarCovar', N'aspcap_covar_id,aspcap_id', N'', N'SPECTRO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (76, N'K', N'primary key', N'apogeeObject', N'target_id', N'', N'SPECTRO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (77, N'K', N'primary key', N'apogeeStarVisit', N'visit_id', N'', N'SPECTRO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (78, N'K', N'primary key', N'apogeeStarAllVisit', N'visit_id,apstar_id', N'', N'SPECTRO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (79, N'K', N'primary key', N'mangaDrpAll', N'plateIFU', N'', N'SPECTRO', NULL)
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (80, N'K', N'primary key', N'mangaTarget', N'mangaID', N'', N'SPECTRO', NULL)
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (81, N'K', N'primary key', N'qsoVarPTF', N'VAR_OBJID', N'', N'SPECTRO', NULL)
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (82, N'K', N'primary key', N'qsoVarStripe', N'VAR_OBJID', N'', N'SPECTRO', NULL)
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (83, N'K', N'primary key', N'zooSpec', N'specObjID', N'', N'SPECTRO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (84, N'K', N'primary key', N'zooConfidence', N'specObjID', N'', N'SPECTRO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (85, N'K', N'primary key', N'zoo2MainSpecz', N'dr7objid', N'', N'SPECTRO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (86, N'K', N'primary key', N'zoo2Stripe82Coadd1', N'stripe82objid', N'', N'SPECTRO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (87, N'K', N'primary key', N'zoo2Stripe82Coadd2', N'stripe82objid', N'', N'SPECTRO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (88, N'K', N'primary key', N'zoo2Stripe82Normal', N'dr7objid', N'', N'SPECTRO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (89, N'K', N'primary key', N'marvelsStar', N'STARNAME,PLATE', N'', N'SPECTRO', NULL)
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (90, N'K', N'primary key', N'marvelsVelocityCurveUF1D', N'STARNAME,BEAM,RADECID,FCJD,[LST-OBS]', N'', N'SPECTRO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (91, N'K', N'primary key', N'Target', N'targetID', N'', N'TILES', NULL)
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (92, N'K', N'primary key', N'TargetInfo', N'skyVersion,targetID', N'', N'TILES', NULL)
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (93, N'K', N'primary key', N'sdssTargetParam', N'targetVersion,paramFile,name', N'', N'TILES', NULL)
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (94, N'K', N'primary key', N'sdssTileAll', N'tile', N'', N'TILES', NULL)
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (95, N'K', N'primary key', N'sdssTilingGeometry', N'tilingGeometryID', N'', N'TILES', NULL)
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (96, N'K', N'primary key', N'sdssTilingRun', N'tileRun', N'', N'TILES', NULL)
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (97, N'K', N'primary key', N'sdssTiledTargetAll', N'targetID', N'', N'TILES', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (98, N'K', N'primary key', N'sdssTilingInfo', N'tileRun,targetID', N'', N'TILES', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (99, N'K', N'primary key', N'RMatrix', N'mode,row', N'', N'REGION', NULL)
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (100, N'K', N'primary key', N'Region', N'regionId', N'', N'REGION', NULL)
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (101, N'K', N'primary key', N'HalfSpace', N'constraintid', N'', N'REGION', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (102, N'K', N'primary key', N'RegionArcs', N'regionId,convexid,arcid', N'', N'REGION', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (103, N'K', N'primary key', N'RegionPatch', N'regionid,convexid,patchid', N'', N'REGION', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (104, N'K', N'primary key', N'sdssImagingHalfspaces', N'sdssPolygonID,x,y,z', N'', N'REGION', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (105, N'K', N'primary key', N'sdssPolygon2Field', N'sdssPolygonID,fieldID', N'', N'REGION', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (106, N'K', N'primary key', N'sdssPolygons', N'sdssPolygonID', N'', N'REGION', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (107, N'K', N'primary key', N'Zone', N'zoneID,ra,objID', N'', N'ZONE', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (108, N'K', N'primary key', N'Neighbors', N'objID,NeighborObjID', N'', N'NEIGHBORS', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (109, N'K', N'primary key', N'SpecPhotoAll', N'specObjID', N'', N'FINISH', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (110, N'F', N'foreign key', N'PhotoObjAll', N'fieldID', N'Field(fieldID)', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (111, N'F', N'foreign key', N'PhotoProfile', N'objID', N'PhotoObjAll(objID)', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (112, N'F', N'foreign key', N'AtlasOutline', N'objID', N'PhotoObjAll(objID)', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (113, N'F', N'foreign key', N'Frame', N'fieldID', N'Field(fieldID)', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (114, N'F', N'foreign key', N'Photoz', N'objID', N'PhotoObjAll(objID)', N'PHOTO', NULL)
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (115, N'F', N'foreign key', N'detectionIndex', N'thingID', N'thingIndex(thingID)', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (116, N'F', N'foreign key', N'thingIndex', N'sdssPolygonID', N'sdssPolygons(sdssPolygonID)', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (117, N'F', N'foreign key', N'FieldProfile', N'fieldID', N'Field(fieldID)', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (118, N'F', N'foreign key', N'ProperMotions', N'objID', N'PhotoObjAll(objID)', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (163, N'I', N'index', N'thingIndex', N'objID', N'', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (164, N'I', N'index', N'detectionIndex', N'thingID', N'', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (165, N'I', N'index', N'TwoMass', N'ra', N'', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (166, N'I', N'index', N'TwoMass', N'dec', N'', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (167, N'I', N'index', N'TwoMass', N'j', N'', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (168, N'I', N'index', N'TwoMass', N'h', N'', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (169, N'I', N'index', N'TwoMass', N'k', N'', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (170, N'I', N'index', N'TwoMass', N'ccflag', N'', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (171, N'I', N'index', N'TwoMass', N'phqual', N'', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (172, N'I', N'index', N'WISE_allsky', N'w1mpro', N'', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (173, N'I', N'index', N'WISE_allsky', N'w2mpro', N'', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (174, N'I', N'index', N'WISE_allsky', N'w3mpro', N'', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (175, N'I', N'index', N'WISE_allsky', N'w4mpro', N'', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (176, N'I', N'index', N'WISE_allsky', N'n_2mass', N'', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (177, N'I', N'index', N'WISE_allsky', N'tmass_key', N'', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (178, N'I', N'index', N'WISE_allsky', N'ra,dec', N'', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (179, N'I', N'index', N'WISE_allsky', N'glat,glon', N'', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (180, N'I', N'index', N'WISE_allsky', N'j_m_2mass', N'', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (181, N'I', N'index', N'WISE_allsky', N'h_m_2mass', N'', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (182, N'I', N'index', N'WISE_allsky', N'k_m_2mass', N'', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (183, N'I', N'index', N'WISE_allsky', N'w1rsemi', N'', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (184, N'I', N'index', N'WISE_allsky', N'blend_ext_flags', N'', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (185, N'I', N'index', N'WISE_allsky', N'w1cc_map', N'', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (186, N'I', N'index', N'WISE_allsky', N'w2cc_map', N'', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (187, N'I', N'index', N'WISE_allsky', N'w3cc_map', N'', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (188, N'I', N'index', N'WISE_allsky', N'w4cc_map', N'', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (189, N'I', N'index', N'WISE_xmatch', N'wise_cntr', N'', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (190, N'I', N'index', N'wiseForcedTarget', N'ra,dec,has_wise_phot,treated_as_pointsource', N'', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (191, N'I', N'index', N'zooNoSpec', N'objID', N'', N'PHOTO', NULL)
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (192, N'I', N'index', N'zooVotes', N'objID', N'', N'PHOTO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (193, N'I', N'index', N'zooMirrorBias', N'objID', N'', N'PHOTO', NULL)
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (194, N'I', N'index', N'zooMonochromeBias', N'objID', N'', N'PHOTO', NULL)
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (195, N'I', N'index', N'PlateX', N'htmID,ra,dec,cx,cy,cz', N'', N'SPECTRO', NULL)
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (196, N'I', N'index', N'SpecObjAll', N'htmID,ra,dec,cx,cy,cz,sciencePrimary', N'', N'SPECTRO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (197, N'I', N'index', N'SpecObjAll', N'BestObjID,sourceType,sciencePrimary,class,htmID,ra,dec,plate,mjd,fiberid,z,zErr', N'', N'SPECTRO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (198, N'I', N'index', N'SpecObjAll', N'class,zWarning,z,sciencePrimary,plateId,bestObjID,targetObjId,htmID,ra,dec', N'', N'SPECTRO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (199, N'I', N'index', N'SpecObjAll', N'targetObjID,sourceType,sciencePrimary,class,htmID,ra,dec', N'', N'SPECTRO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (200, N'I', N'index', N'SpecObjAll', N'ra,[dec],class, plate, tile, z, zErr, sciencePrimary,plateID, bestObjID', N'', N'SPECTRO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (201, N'I', N'index', N'SpecObjAll', N'fluxObjID', N'', N'SPECTRO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (202, N'I', N'index', N'segueTargetAll', N'segue1_target1, segue2_target1', N'', N'SPECTRO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (203, N'I', N'index', N'apogeeObject', N'apogee_id,j,h,k,j_err,h_err,k_err', N'', N'SPECTRO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (204, N'I', N'index', N'apogeeVisit', N'apogee_id', N'', N'SPECTRO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (205, N'I', N'index', N'apogeeVisit', N'plate,mjd,fiberid', N'', N'SPECTRO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (206, N'I', N'index', N'apogeeStar', N'apogee_id', N'', N'SPECTRO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (207, N'I', N'index', N'apogeeStar', N'htmID', N'', N'SPECTRO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (208, N'I', N'index', N'aspcapStar', N'apstar_id', N'', N'SPECTRO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (209, N'I', N'index', N'zooSpec', N'objID', N'', N'SPECTRO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (210, N'I', N'index', N'zooConfidence', N'objID', N'', N'SPECTRO', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (211, N'I', N'unique index', N'sdssTileAll', N'tileRun,tile', N'', N'TILES', NULL)
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (212, N'I', N'index', N'sdssTileAll', N'htmID,racen,deccen,cx,cy,cz', N'', N'TILES', NULL)
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (213, N'I', N'index', N'sdssTiledTargetAll', N'htmID,ra,dec,cx,cy,cz', N'', N'TILES', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (214, N'I', N'unique index', N'sdssTilingInfo', N'targetID,tileRun,collisionGroup', N'', N'TILES', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (215, N'I', N'unique index', N'sdssTilingInfo', N'tileRun,tid,collisionGroup', N'', N'TILES', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (216, N'I', N'index', N'sdssTilingInfo', N'tile,collisionGroup', N'', N'TILES', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (217, N'I', N'index', N'HalfSpace', N'regionID,convexID,x,y,z,c', N'', N'REGION', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (218, N'I', N'index', N'RegionPatch', N'htmID,ra,dec,x,y,z,type', N'', N'REGION', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (219, N'I', N'index', N'WISE_allsky', N'rjce', N'', N'FINISH', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (220, N'I', N'index', N'SpecPhotoAll', N'objID,sciencePrimary,class,z,targetObjid', N'', N'FINISH', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (221, N'I', N'index', N'SpecPhotoAll', N'targetObjID,sciencePrimary,class,z,objid', N'', N'FINISH', N'PAGE')
GO
INSERT [dbo].[IndexMap2] ([indexmapid], [code], [type], [tableName], [fieldList], [foreignKey], [indexgroup], [compression]) VALUES (222, N'I', N'index', N'DataConstants', N'value', N'', N'META', NULL)
GO
