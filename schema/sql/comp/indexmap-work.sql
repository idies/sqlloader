USE [sueDB]
INSERT [dbo].[IndexMap]   VALUES ('K', 'primary key', 'PartitionMap', 'fileGroupName', '', 'META', NULL, NULL, 0)
INSERT [dbo].[IndexMap]   VALUES ('K', 'primary key', 'FileGroupMap', 'tableName', '', 'META', NULL, NULL, 0)
INSERT [dbo].[IndexMap]   VALUES ('K', 'primary key', 'IndexMap', 'indexmapid', '', 'META', NULL, NULL, 0)
INSERT [dbo].[IndexMap]   VALUES ('K', 'primary key', 'PubHistory', 'name,loadversion', '', 'META', NULL, NULL, 0)
INSERT [dbo].[IndexMap]   VALUES ('K', 'primary key', 'QueryResults', 'query, time', '', 'META', NULL, NULL, 0)
INSERT [dbo].[IndexMap]   VALUES ('K', 'primary key', 'RecentQueries', 'ipAddr,lastQueryTime', '', 'META', NULL, NULL, 0)
INSERT [dbo].[IndexMap]   VALUES ('K', 'primary key', 'RunShift', 'run', '', 'META', NULL, NULL, 0)
INSERT [dbo].[IndexMap]   VALUES ('K', 'primary key', 'Versions', 'version', '', 'META', NULL, NULL, 0)
INSERT [dbo].[IndexMap]   VALUES ('K', 'primary key', 'DBObjects', 'name', '', 'META', NULL, NULL, 0)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'DBColumns', 'tableName,name', '', 'META', NULL, NULL, 0)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'DBViewCols', 'viewName,name', '', 'META', NULL, NULL, 0)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'History', 'id', '', 'META', NULL, NULL, 0)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'Inventory', 'filename,name', '', 'META', NULL, NULL, 0)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'Dependency', 'parent,child', '', 'META', NULL, NULL, 0)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'DataConstants', 'field,name', '', 'META', NULL, NULL, 0)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'Diagnostics', 'name', '', 'META', NULL, NULL, 0)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'SDSSConstants', 'name', '', 'META', NULL, NULL, 0)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'SiteConstants', 'name', '', 'META', NULL, NULL, 0)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'SiteDiagnostics', 'name', '', 'META', NULL, NULL, 0)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'ProfileDefs', 'bin', '', 'META', NULL, NULL, 0)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'LoadHistory', 'loadVersion,tStart', '', 'META', NULL, NULL, 0)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'PhotoObjAll', 'objID', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'PhotoProfile', 'objID,bin,band', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'AtlasOutline', 'objID', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'Frame', 'fieldID,zoom', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'PhotoPrimaryDR7', 'dr8objID', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'PhotoObjDR7', 'dr8objID', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'Photoz', 'objID', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'PhotozErrorMap', 'cellID', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'Field', 'fieldID', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'FieldProfile', 'fieldID,bin,band', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'Mask', 'maskID', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'First', 'objID', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'RC3', 'objID', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'Rosat', 'objID', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'USNO', 'objID', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'TwoMass', 'objID', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'TwoMassXSC', 'objID', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'WISE_xmatch', 'sdss_objID,wise_cntr', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'WISE_allsky', 'cntr', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'wiseForcedTarget', 'objID', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'thingIndex', 'thingId', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'detectionIndex', 'thingId,objID', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'ProperMotions', 'objID', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'StripeDefs', 'stripe', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'MaskedObject', 'objid,maskid', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'zooMirrorBias', 'dr7objid', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'zooMonochromeBias', 'dr7objid', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'zooNoSpec', 'dr7objid', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'zooVotes', 'dr7objid', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'zoo2MainPhotoz', 'dr7objid', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'PlateX', 'plateID', '', 'SPECTRO', 'page', 'SPEC', 0)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'SpecObjAll', 'specObjID', '', 'SPECTRO', 'page', 'SPEC', 0)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'SpecDR7', 'specObjID', '', 'SPECTRO', 'page', 'SPEC', 1)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'sppParams', 'specObjID', '', 'SPECTRO', 'page', 'SPEC', 1)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'sppLines', 'specObjID', '', 'SPECTRO', 'page', 'SPEC', 1)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'segueTargetAll', 'objID', '', 'SPECTRO', 'page', 'SPEC', 1)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'galSpecExtra', 'specObjID', '', 'SPECTRO', 'page', 'SPEC', 1)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'galSpecIndx', 'specObjID', '', 'SPECTRO', 'page', 'SPEC', 1)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'galSpecInfo', 'specObjID', '', 'SPECTRO', 'page', 'SPEC', 1)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'galSpecLine', 'specObjID', '', 'SPECTRO', 'page', 'SPEC', 1)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'emissionLinesPort', 'specObjID', '', 'SPECTRO', 'page', 'SPEC', 1)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'stellarMassFSPSGranEarlyDust', 'specObjID', '', 'SPECTRO', 'page', 'SPEC', 1)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'stellarMassFSPSGranEarlyNoDust', 'specObjID', '', 'SPECTRO', 'page', 'SPEC', 1)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'stellarMassFSPSGranWideDust', 'specObjID', '', 'SPECTRO', 'page', 'SPEC', 1)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'stellarMassFSPSGranWideNoDust', 'specObjID', '', 'SPECTRO', 'page', 'SPEC', 1)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'stellarMassPCAWiscBC03', 'specObjID', '', 'SPECTRO', 'page', 'SPEC', 1)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'stellarMassPCAWiscM11', 'specObjID', '', 'SPECTRO', 'page', 'SPEC', 1)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'stellarMassStarformingPort', 'specObjID', '', 'SPECTRO', 'page', 'SPEC', 1)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'stellarMassPassivePort', 'specObjID', '', 'SPECTRO', 'page', 'SPEC', 1)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'apogeeDesign', 'designid', '', 'SPECTRO', 'page', 'SPEC', 0)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'apogeeField', 'location_id', '', 'SPECTRO', 'page', 'SPEC', 0)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'apogeeVisit', 'visit_id', '', 'SPECTRO', 'page', 'SPEC', 0)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'apogeeStar', 'apstar_id', '', 'SPECTRO', 'page', 'SPEC', 0)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'aspcapStar', 'aspcap_id', '', 'SPECTRO', 'page', 'SPEC', 0)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'apogeePlate', 'plate_visit_id', '', 'SPECTRO', 'page', 'SPEC', 0)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'aspcapStarCovar', 'aspcap_covar_id,aspcap_id', '', 'SPECTRO', 'page', 'SPEC', 0)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'apogeeObject', 'target_id', '', 'SPECTRO', 'page', 'SPEC', 0)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'apogeeStarVisit', 'visit_id', '', 'SPECTRO', 'page', 'SPEC', 0)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'apogeeStarAllVisit', 'visit_id,apstar_id', '', 'SPECTRO', 'page', 'SPEC', 0)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'cannonStar', 'cannon_id', '', 'SPECTRO', 'page', 'SPEC', 0)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'mangaDAPall', 'plateIFU,daptype', '', 'SPECTRO', 'page', 'SPEC', 0)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'mangaDRPall', 'plateIFU', '', 'SPECTRO', 'page', 'SPEC', 0)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'mangaTarget', 'mangaID', '', 'SPECTRO', 'page', 'SPEC', 0)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'nsatlas', 'nsaID', '', 'SPECTRO', 'page', 'SPEC', 0)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'mangaFirefly', 'plateIFU', '', 'SPECTRO', 'page', 'SPEC', 0)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'mangaPipe3D', 'plateIFU', '', 'SPECTRO', 'page', 'SPEC', 0)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'mangaHIall', 'plateIFU', '', 'SPECTRO', 'page', 'SPEC', 0)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'mangaHIbonus', 'plateIFU,bonusid', '', 'SPECTRO', 'page', 'SPEC', 0)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'qsoVarPTF', 'VAR_OBJID', '', 'SPECTRO', 'page', 'SPEC', 0)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'qsoVarStripe', 'VAR_OBJID', '', 'SPECTRO', 'page', 'SPEC', 0)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'zooSpec', 'specObjID', '', 'SPECTRO', 'page', 'SPEC', 0)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'zooConfidence', 'specObjID', '', 'SPECTRO', 'page', 'SPEC', 0)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'zoo2MainSpecz', 'dr7objid', '', 'SPECTRO', 'page', 'SPEC', 0)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'zoo2Stripe82Coadd1', 'stripe82objid', '', 'SPECTRO', 'page', 'SPEC', 0)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'zoo2Stripe82Coadd2', 'stripe82objid', '', 'SPECTRO', 'page', 'SPEC', 0)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'zoo2Stripe82Normal', 'dr7objid', '', 'SPECTRO', 'page', 'SPEC', 0)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'marvelsStar', 'STARNAME,PLATE', '', 'SPECTRO', 'page', 'SPEC', 0)
INSERT [dbo].[IndexMap]   VALUES  ('K', 'primary key', 'marvelsVelocityCurveUF1D', 'STARNAME,BEAM,RADECID,FCJD,[LST-OBS]', '', 'SPECTRO', 'page', 'SPEC', 0)
INSERT [dbo].[IndexMap]   VALUES ( 'K', 'primary key', 'sppTargets', 'TARGETID', '', 'SPECTRO', 'page', 'SPEC', 1)
INSERT [dbo].[IndexMap]   VALUES ( 'K', 'primary key', 'sdssEbossFirefly', 'specObjID', '', 'SPECTRO', 'page', 'SPEC', 0)
INSERT [dbo].[IndexMap]   VALUES ( 'K', 'primary key', 'spiders_quasar', 'name', '', 'SPECTRO', 'page', 'SPEC', 0)
INSERT [dbo].[IndexMap]   VALUES ( 'K', 'primary key', 'mastar_goodstars', 'mangaid', '', 'SPECTRO', 'page', 'SPEC', 0)
INSERT [dbo].[IndexMap]   VALUES ( 'K', 'primary key', 'mastar_goodvisits', 'mangaid,mjd', '', 'SPECTRO', 'page', 'SPEC', 0)
INSERT [dbo].[IndexMap]   VALUES ( 'K', 'primary key', 'Target', 'targetID', '', 'TILES', NULL, NULL, 1)
INSERT [dbo].[IndexMap]   VALUES ( 'K', 'primary key', 'TargetInfo', 'skyVersion,targetID', '', 'TILES', NULL, NULL, 1)
INSERT [dbo].[IndexMap]   VALUES ( 'K', 'primary key', 'sdssTargetParam', 'targetVersion,paramFile,name', '', 'TILES', NULL, NULL, 1)
INSERT [dbo].[IndexMap]   VALUES ( 'K', 'primary key', 'sdssTileAll', 'tile', '', 'TILES', NULL, NULL, 1)
INSERT [dbo].[IndexMap]   VALUES ( 'K', 'primary key', 'sdssTilingGeometry', 'tilingGeometryID', '', 'TILES', NULL, NULL, 1)
INSERT [dbo].[IndexMap]   VALUES ( 'K', 'primary key', 'sdssTilingRun', 'tileRun', '', 'TILES', NULL, NULL, 1)
INSERT [dbo].[IndexMap]   VALUES ( 'K', 'primary key', 'sdssTiledTargetAll', 'targetID', '', 'TILES', NULL, NULL, 1)
INSERT [dbo].[IndexMap]   VALUES ( 'K', 'primary key', 'sdssTilingInfo', 'tileRun,targetID', '', 'TILES', NULL, NULL, 1)
INSERT [dbo].[IndexMap]   VALUES ( 'K', 'primary key', 'plate2Target', 'plate2TargetID,plate,objid', '', 'TILES', NULL, NULL, 1)
INSERT [dbo].[IndexMap]   VALUES ( 'K', 'primary key', 'RMatrix', 'mode,row', '', 'REGION', NULL, NULL, 1)
INSERT [dbo].[IndexMap]   VALUES ( 'K', 'primary key', 'Region', 'regionId', '', 'REGION', NULL, NULL, 1)
INSERT [dbo].[IndexMap]   VALUES ( 'K', 'primary key', 'HalfSpace', 'constraintid', '', 'REGION', NULL, NULL, 1)
INSERT [dbo].[IndexMap]   VALUES ( 'K', 'primary key', 'RegionArcs', 'regionId,convexid,arcid', '', 'REGION', NULL, NULL, 1)
INSERT [dbo].[IndexMap]   VALUES ( 'K', 'primary key', 'RegionPatch', 'regionid,convexid,patchid', '', 'REGION', NULL, NULL, 1)
INSERT [dbo].[IndexMap]   VALUES ( 'K', 'primary key', 'sdssImagingHalfspaces', 'sdssPolygonID,x,y,z', '', 'REGION', NULL, NULL, 1)
INSERT [dbo].[IndexMap]   VALUES ( 'K', 'primary key', 'sdssPolygon2Field', 'sdssPolygonID,fieldID', '', 'REGION', NULL, NULL, 1)
INSERT [dbo].[IndexMap]   VALUES ( 'K', 'primary key', 'sdssPolygons', 'sdssPolygonID', '', 'REGION', NULL, NULL, 1)
INSERT [dbo].[IndexMap]   VALUES ( 'K', 'primary key', 'Zone', 'zoneID,ra,objID', '', 'ZONE', NULL, NULL, 1)
INSERT [dbo].[IndexMap]   VALUES ( 'K', 'primary key', 'Neighbors', 'objID,NeighborObjID', '', 'NEIGHBORS', NULL, NULL, 1)
INSERT [dbo].[IndexMap]   VALUES ( 'K', 'primary key', 'SpecPhotoAll', 'specObjID', '', 'FINISH', NULL, NULL, 0)
INSERT [dbo].[IndexMap]   VALUES ( 'F', 'foreign key', 'PhotoObjAll', 'fieldID', 'Field(fieldID)', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES ( 'F', 'foreign key', 'PhotoProfile', 'objID', 'PhotoObjAll(objID)', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES ( 'F', 'foreign key', 'AtlasOutline', 'objID', 'PhotoObjAll(objID)', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES ( 'F', 'foreign key', 'Frame', 'fieldID', 'Field(fieldID)', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES ( 'F', 'foreign key', 'Photoz', 'objID', 'PhotoObjAll(objID)', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES ( 'F', 'foreign key', 'detectionIndex', 'thingID', 'thingIndex(thingID)', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES ( 'F', 'foreign key', 'thingIndex', 'sdssPolygonID', 'sdssPolygons(sdssPolygonID)', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES ( 'F', 'foreign key', 'FieldProfile', 'fieldID', 'Field(fieldID)', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES ( 'F', 'foreign key', 'ProperMotions', 'objID', 'PhotoObjAll(objID)', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES ( 'F', 'foreign key', 'MaskedObject', 'objID', 'PhotoObjAll(objID)', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES ( 'F', 'foreign key', 'MaskedObject', 'maskID', 'Mask(maskID)', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES ( 'F', 'foreign key', 'SpecObjAll', 'plateID', 'PlateX(plateID)', 'SPECTRO', 'page', 'SPEC', 0)
INSERT [dbo].[IndexMap]   VALUES ( 'F', 'foreign key', 'mangaDAPall', 'mangaID', 'mangaTarget(mangaID)', 'SPECTRO', 'page', 'SPEC', 0)
INSERT [dbo].[IndexMap]   VALUES ( 'F', 'foreign key', 'mangaDRPall', 'mangaID', 'mangaTarget(mangaID)', 'SPECTRO', 'page', 'SPEC', 0)
INSERT [dbo].[IndexMap]   VALUES ( 'F', 'foreign key', 'zoo2MainSpecz', 'dr8objid', 'PhotoObjAll(objid)', 'SPECTRO', 'page', 'SPEC', 0)
INSERT [dbo].[IndexMap]   VALUES ( 'F', 'foreign key', 'zoo2Stripe82Coadd1', 'dr8objid', 'PhotoObjAll(objid)', 'SPECTRO', 'page', 'SPEC', 0)
INSERT [dbo].[IndexMap]   VALUES ( 'F', 'foreign key', 'zoo2Stripe82Coadd2', 'dr8objid', 'PhotoObjAll(objid)', 'SPECTRO', 'page', 'SPEC', 0)
INSERT [dbo].[IndexMap]   VALUES ( 'F', 'foreign key', 'zoo2Stripe82Normal', 'dr8objid', 'PhotoObjAll(objid)', 'SPECTRO', 'page', 'SPEC', 0)
INSERT [dbo].[IndexMap]   VALUES ( 'F', 'foreign key', 'TargetInfo', 'targetID', 'Target(targetID)', 'TILES', NULL, NULL, 1)
INSERT [dbo].[IndexMap]   VALUES ( 'F', 'foreign key', 'sdssTileAll', 'tileRun', 'sdssTilingRun(tileRun)', 'TILES', NULL, NULL, 1)
INSERT [dbo].[IndexMap]   VALUES ( 'F', 'foreign key', 'sdssTilingGeometry', 'tileRun', 'sdssTilingRun(tileRun)', 'TILES', NULL, NULL, 1)
INSERT [dbo].[IndexMap]   VALUES ( 'F', 'foreign key', 'sdssTilingInfo', 'tileRun', 'sdssTilingRun(tileRun)', 'TILES', NULL, NULL, 1)
INSERT [dbo].[IndexMap]   VALUES ( 'F', 'foreign key', 'HalfSpace', 'regionID', 'Region(regionID)', 'REGION', NULL, NULL, 1)
INSERT [dbo].[IndexMap]   VALUES ( 'F', 'foreign key', 'RegionArcs', 'regionID', 'Region(regionID)', 'REGION', NULL, NULL, 1)
INSERT [dbo].[IndexMap]   VALUES ( 'F', 'foreign key', 'RegionPatch', 'regionID', 'Region(regionID)', 'REGION', NULL, NULL, 1)
INSERT [dbo].[IndexMap]   VALUES ( 'F', 'foreign key', 'Zone', 'objID', 'PhotoObjAll(objID)', 'ZONE', NULL, NULL, 1)
INSERT [dbo].[IndexMap]   VALUES ( 'F', 'foreign key', 'Neighbors', 'objID', 'PhotoObjAll(objID)', 'NEIGHBORS', NULL, NULL, 1)
INSERT [dbo].[IndexMap]   VALUES ( 'F', 'foreign key', 'SpecPhotoAll', 'specObjID', 'SpecObjAll(specObjID)', 'FINISH', NULL, NULL, 0)
INSERT [dbo].[IndexMap]   VALUES ( 'F', 'foreign key', 'DBColumns', 'tablename', 'DBObjects(name)', 'META', NULL, NULL, 0)
INSERT [dbo].[IndexMap]   VALUES ( 'F', 'foreign key', 'DBViewCols', 'viewname', 'DBObjects(name)', 'META', NULL, NULL, 0)
INSERT [dbo].[IndexMap]   VALUES ( 'F', 'foreign key', 'IndexMap', 'tableName', 'DBObjects(name)', 'META', NULL, NULL, 0)
INSERT [dbo].[IndexMap]   VALUES ( 'F', 'foreign key', 'FileGroupMap', 'tableFileGroup', 'PartitionMap(fileGroupName)', 'META', NULL, NULL, 0)
INSERT [dbo].[IndexMap]   VALUES ( 'F', 'foreign key', 'Inventory', 'name', 'DBObjects(name)', 'META', NULL, NULL, 0)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'Field', 'field,camcol,run,rerun', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'Field', 'run,camcol,field,rerun', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'Frame', 'field,camcol,run,zoom,rerun', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'Frame', 'htmID,zoom,cx,cy,cz,a,b,c,d,e,f,node,incl', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'Mask', 'htmID,ra,dec,cx,cy,cz', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'PhotoObjAll', 'mode,cy,cx,cz,htmID,type,flags,ra,dec,u,g,r,i,z', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'PhotoObjAll', 'htmID,cx,cy,cz,type,mode,flags,ra,dec,u,g,r,i,z', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'PhotoObjAll', 'htmID,run,camcol,field,rerun,type,mode,flags,cx,cy,cz,g,r', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'PhotoObjAll', 'field,run,rerun,camcol,type,mode,flags,rowc,colc,ra,dec,u,g,r,i,z', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'PhotoObjAll', 'fieldID,objID,ra,dec,r,type,flags', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'PhotoObjAll', 'SpecObjID,cx,cy,cz,mode,type,flags,ra,dec,u,g,r,i,z', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'PhotoObjAll', 'cx,cy,cz,htmID,mode,type,flags,ra,dec,u,g,r,i,z', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'PhotoObjAll', 'run,mode,type,flags,u,g,r,i,z,Err_u,Err_g,Err_r,Err_i,Err_z', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'PhotoObjAll', 'run,camcol,rerun,type,mode,flags,ra,dec,fieldID,field,u,g,r,i,z', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'PhotoObjAll', 'run,camcol,field,mode,parentID,q_r,q_g,u_r,u_g,fiberMag_u,fiberMag_g,fiberMag_r,fiberMag_i,fiberMag_z', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'PhotoObjAll', 'run,camcol,type,mode,cx,cy,cz', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'PhotoObjAll', 'ra,[dec],type,mode,flags,u,g,r,i,z,psfMag_u,psfMag_g,psfMag_r,psfMag_i,psfMag_z', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'PhotoObjAll', 'b,l,type,mode,flags,u,g,r,i,z,psfMag_u,psfMag_g,psfMag_r,psfMag_i,psfMag_z', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'PhotoObjAll', 'phototag', '', 'SCHEMA', NULL, NULL, 1)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'PhotoObjAll', 'parentid,mode,type', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'PhotoObjDR7', 'dr7objID', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'thingIndex', 'objID', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'detectionIndex', 'thingID', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'TwoMass', 'ra', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'TwoMass', 'dec', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'TwoMass', 'j', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'TwoMass', 'h', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'TwoMass', 'k', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'TwoMass', 'ccflag', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'TwoMass', 'phqual', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'WISE_allsky', 'w1mpro', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'WISE_allsky', 'w2mpro', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'WISE_allsky', 'w3mpro', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'WISE_allsky', 'w4mpro', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'WISE_allsky', 'n_2mass', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'WISE_allsky', 'tmass_key', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'WISE_allsky', 'ra,dec', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'WISE_allsky', 'glat,glon', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'WISE_allsky', 'j_m_2mass', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'WISE_allsky', 'h_m_2mass', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'WISE_allsky', 'k_m_2mass', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'WISE_allsky', 'w1rsemi', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'WISE_allsky', 'blend_ext_flags', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'WISE_allsky', 'w1cc_map', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'WISE_allsky', 'w2cc_map', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'WISE_allsky', 'w3cc_map', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'WISE_allsky', 'w4cc_map', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'WISE_xmatch', 'wise_cntr', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'wiseForcedTarget', 'ra,dec,has_wise_phot,treated_as_pointsource', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'zooNoSpec', 'objID', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'zooVotes', 'objID', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'zooMirrorBias', 'objID', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'zooMonochromeBias', 'objID', '', 'PHOTO', 'PAGE', 'PHOTO', 1)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'PlateX', 'htmID,ra,dec,cx,cy,cz', '', 'SPECTRO', 'page', 'SPEC', 0)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'SpecObjAll', 'htmID,ra,dec,cx,cy,cz,sciencePrimary', '', 'SPECTRO', 'page', 'SPEC', 0)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'SpecObjAll', 'BestObjID,sourceType,sciencePrimary,class,htmID,ra,dec,plate,mjd,fiberid,z,zErr', '', 'SPECTRO', 'page', 'SPEC', 0)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'SpecObjAll', 'class,zWarning,z,sciencePrimary,plateId,bestObjID,targetObjId,htmID,ra,dec', '', 'SPECTRO', 'page', 'SPEC', 0)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'SpecObjAll', 'targetObjID,sourceType,sciencePrimary,class,htmID,ra,dec', '', 'SPECTRO', 'page', 'SPEC', 0)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'SpecObjAll', 'ra,[dec],class, plate, tile, z, zErr, sciencePrimary,plateID, bestObjID', '', 'SPECTRO', 'page', 'SPEC', 0)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'SpecObjAll', 'fluxObjID', '', 'SPECTRO', 'page', 'SPEC', 0)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'segueTargetAll', 'segue1_target1, segue2_target1', '', 'SPECTRO', 'page', 'SPEC', 1)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'apogeeObject', 'apogee_id,j,h,k,j_err,h_err,k_err', '', 'SPECTRO', 'page', 'SPEC', 0)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'apogeeVisit', 'apogee_id', '', 'SPECTRO', 'page', 'SPEC', 0)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'apogeeVisit', 'plate,mjd,fiberid', '', 'SPECTRO', 'page', 'SPEC', 0)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'apogeeStar', 'apogee_id', '', 'SPECTRO', 'page', 'SPEC', 0)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'apogeeStar', 'htmID', '', 'SPECTRO', 'page', 'SPEC', 0)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'aspcapStar', 'apstar_id', '', 'SPECTRO', 'page', 'SPEC', 0)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'zooSpec', 'objID', '', 'SPECTRO', 'page', 'SPEC', 0)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'zooConfidence', 'objID', '', 'SPECTRO', 'page', 'SPEC', 0)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'unique index', 'sdssTileAll', 'tileRun,tile', '', 'TILES', NULL, NULL, 1)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'sdssTileAll', 'htmID,racen,deccen,cx,cy,cz', '', 'TILES', NULL, NULL, 1)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'sdssTiledTargetAll', 'htmID,ra,dec,cx,cy,cz', '', 'TILES', NULL, NULL, 1)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'unique index', 'sdssTilingInfo', 'targetID,tileRun,collisionGroup', '', 'TILES', NULL, NULL, 1)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'unique index', 'sdssTilingInfo', 'tileRun,tid,collisionGroup', '', 'TILES', NULL, NULL, 1)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'sdssTilingInfo', 'tile,collisionGroup', '', 'TILES', NULL, NULL, 1)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'HalfSpace', 'regionID,convexID,x,y,z,c', '', 'REGION', NULL, NULL, 1)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'RegionPatch', 'htmID,ra,dec,x,y,z,type', '', 'REGION', NULL, NULL, 1)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'WISE_allsky', 'rjce', '', 'FINISH', NULL, NULL, 1)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'SpecPhotoAll', 'objID,sciencePrimary,class,z,targetObjid', '', 'FINISH', NULL, NULL, 0)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'SpecPhotoAll', 'targetObjID,sciencePrimary,class,z,objid', '', 'FINISH', NULL, NULL, 0)
INSERT [dbo].[IndexMap]   VALUES ( 'I', 'index', 'DataConstants', 'value', '', 'META', NULL, NULL, 0)