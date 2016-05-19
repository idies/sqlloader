-----------------------------
--  Inventory.sql
-----------------------------
SET NOCOUNT ON
GO
TRUNCATE TABLE Inventory
GO
--

INSERT Inventory VALUES('FileGroups','PartitionMap','U');
INSERT Inventory VALUES('FileGroups','FileGroupMap','U');
INSERT Inventory VALUES('FileGroups','spTruncateFileGroupMap','P');
INSERT Inventory VALUES('FileGroups','spSetDefaultFileGroup','P');
INSERT Inventory VALUES('DataConstants','DataConstants','U');
INSERT Inventory VALUES('DataConstants','SDSSConstants','U');
INSERT Inventory VALUES('DataConstants','StripeDefs','U');
INSERT Inventory VALUES('DataConstants','RunShift','U');
INSERT Inventory VALUES('DataConstants','ProfileDefs','U');
INSERT Inventory VALUES('ConstantSupport','PhotoFlags','V');
INSERT Inventory VALUES('ConstantSupport','PhotoStatus','V');
INSERT Inventory VALUES('ConstantSupport','CalibStatus','V');
INSERT Inventory VALUES('ConstantSupport','InsideMask','V');
INSERT Inventory VALUES('ConstantSupport','ImageStatus','V');
INSERT Inventory VALUES('ConstantSupport','ResolveStatus','V');
INSERT Inventory VALUES('ConstantSupport','PrimTarget','V');
INSERT Inventory VALUES('ConstantSupport','SecTarget','V');
INSERT Inventory VALUES('ConstantSupport','SpecialTarget1','V');
INSERT Inventory VALUES('ConstantSupport','SpecialTarget2','V');
INSERT Inventory VALUES('ConstantSupport','Segue1Target1','V');
INSERT Inventory VALUES('ConstantSupport','Segue2Target1','V');
INSERT Inventory VALUES('ConstantSupport','Segue1Target2','V');
INSERT Inventory VALUES('ConstantSupport','Segue2Target2','V');
INSERT Inventory VALUES('ConstantSupport','BossTarget1','V');
INSERT Inventory VALUES('ConstantSupport','AncillaryTarget1','V');
INSERT Inventory VALUES('ConstantSupport','AncillaryTarget2','V');
INSERT Inventory VALUES('ConstantSupport','ApogeeTarget1','V');
INSERT Inventory VALUES('ConstantSupport','ApogeeTarget2','V');
INSERT Inventory VALUES('ConstantSupport','ApogeeStarFlag','V');
INSERT Inventory VALUES('ConstantSupport','ApogeeAspcapFlag','V');
INSERT Inventory VALUES('ConstantSupport','ApogeeParamFlag','V');
INSERT Inventory VALUES('ConstantSupport','ApogeeExtraTarg','V');
INSERT Inventory VALUES('ConstantSupport','eBossTarget0','V');
INSERT Inventory VALUES('ConstantSupport','SpecZWarning','V');
INSERT Inventory VALUES('ConstantSupport','SpecPixMask','V');
INSERT Inventory VALUES('ConstantSupport','TiMask','V');
INSERT Inventory VALUES('ConstantSupport','PhotoMode','V');
INSERT Inventory VALUES('ConstantSupport','PhotoType','V');
INSERT Inventory VALUES('ConstantSupport','MaskType','V');
INSERT Inventory VALUES('ConstantSupport','FieldQuality','V');
INSERT Inventory VALUES('ConstantSupport','PspStatus','V');
INSERT Inventory VALUES('ConstantSupport','FramesStatus','V');
INSERT Inventory VALUES('ConstantSupport','HoleType','V');
INSERT Inventory VALUES('ConstantSupport','SourceType','V');
INSERT Inventory VALUES('ConstantSupport','ProgramType','V');
INSERT Inventory VALUES('ConstantSupport','CoordType','V');
INSERT Inventory VALUES('ConstantSupport','fPhotoMode','F');
INSERT Inventory VALUES('ConstantSupport','fPhotoModeN','F');
INSERT Inventory VALUES('ConstantSupport','fPhotoType','F');
INSERT Inventory VALUES('ConstantSupport','fMaskType','F');
INSERT Inventory VALUES('ConstantSupport','fMaskTypeN','F');
INSERT Inventory VALUES('ConstantSupport','fPhotoTypeN','F');
INSERT Inventory VALUES('ConstantSupport','fFieldQuality','F');
INSERT Inventory VALUES('ConstantSupport','fFieldQualityN','F');
INSERT Inventory VALUES('ConstantSupport','fPspStatus','F');
INSERT Inventory VALUES('ConstantSupport','fPspStatusN','F');
INSERT Inventory VALUES('ConstantSupport','fFramesStatus','F');
INSERT Inventory VALUES('ConstantSupport','fFramesStatusN','F');
INSERT Inventory VALUES('ConstantSupport','fHoleType','F');
INSERT Inventory VALUES('ConstantSupport','fHoleTypeN','F');
INSERT Inventory VALUES('ConstantSupport','fSourceType','F');
INSERT Inventory VALUES('ConstantSupport','fSourceTypeN','F');
INSERT Inventory VALUES('ConstantSupport','fProgramType','F');
INSERT Inventory VALUES('ConstantSupport','fProgramTypeN','F');
INSERT Inventory VALUES('ConstantSupport','fCoordType','F');
INSERT Inventory VALUES('ConstantSupport','fCoordTypeN','F');
INSERT Inventory VALUES('ConstantSupport','fFieldMask','F');
INSERT Inventory VALUES('ConstantSupport','fFieldMaskN','F');
INSERT Inventory VALUES('ConstantSupport','fPhotoFlags','F');
INSERT Inventory VALUES('ConstantSupport','fPhotoFlagsN','F');
INSERT Inventory VALUES('ConstantSupport','fPhotoStatus','F');
INSERT Inventory VALUES('ConstantSupport','fPhotoStatusN','F');
INSERT Inventory VALUES('ConstantSupport','fCalibStatus','F');
INSERT Inventory VALUES('ConstantSupport','fCalibStatusN','F');
INSERT Inventory VALUES('ConstantSupport','fInsideMask','F');
INSERT Inventory VALUES('ConstantSupport','fInsideMaskN','F');
INSERT Inventory VALUES('ConstantSupport','fImageStatus','F');
INSERT Inventory VALUES('ConstantSupport','fImageStatusN','F');
INSERT Inventory VALUES('ConstantSupport','fResolveStatus','F');
INSERT Inventory VALUES('ConstantSupport','fResolveStatusN','F');
INSERT Inventory VALUES('ConstantSupport','fPrimTarget','F');
INSERT Inventory VALUES('ConstantSupport','fPrimTargetN','F');
INSERT Inventory VALUES('ConstantSupport','fSecTarget','F');
INSERT Inventory VALUES('ConstantSupport','fSecTargetN','F');
INSERT Inventory VALUES('ConstantSupport','fSpecialTarget1','F');
INSERT Inventory VALUES('ConstantSupport','fSpecialTarget1N','F');
INSERT Inventory VALUES('ConstantSupport','fSpecialTarget2','F');
INSERT Inventory VALUES('ConstantSupport','fSpecialTarget2N','F');
INSERT Inventory VALUES('ConstantSupport','fBossTarget1','F');
INSERT Inventory VALUES('ConstantSupport','fBossTarget1N','F');
INSERT Inventory VALUES('ConstantSupport','fAncillaryTarget1','F');
INSERT Inventory VALUES('ConstantSupport','fAncillaryTarget1N','F');
INSERT Inventory VALUES('ConstantSupport','fAncillaryTarget2','F');
INSERT Inventory VALUES('ConstantSupport','fAncillaryTarget2N','F');
INSERT Inventory VALUES('ConstantSupport','fSegue1Target1','F');
INSERT Inventory VALUES('ConstantSupport','fSegue1Target1N','F');
INSERT Inventory VALUES('ConstantSupport','fSegue2Target1','F');
INSERT Inventory VALUES('ConstantSupport','fSegue2Target1N','F');
INSERT Inventory VALUES('ConstantSupport','fSegue1Target2','F');
INSERT Inventory VALUES('ConstantSupport','fSegue1Target2N','F');
INSERT Inventory VALUES('ConstantSupport','fSegue2Target2','F');
INSERT Inventory VALUES('ConstantSupport','fSegue2Target2N','F');
INSERT Inventory VALUES('ConstantSupport','fApogeeTarget1','F');
INSERT Inventory VALUES('ConstantSupport','fApogeeTarget1N','F');
INSERT Inventory VALUES('ConstantSupport','fApogeeTarget2','F');
INSERT Inventory VALUES('ConstantSupport','fApogeeTarget2N','F');
INSERT Inventory VALUES('ConstantSupport','fApogeeStarFlag','F');
INSERT Inventory VALUES('ConstantSupport','fApogeeStarFlagN','F');
INSERT Inventory VALUES('ConstantSupport','fApogeeAspcapFlag','F');
INSERT Inventory VALUES('ConstantSupport','fApogeeAspcapFlagN','F');
INSERT Inventory VALUES('ConstantSupport','fApogeeParamFlag','F');
INSERT Inventory VALUES('ConstantSupport','fApogeeParamFlagN','F');
INSERT Inventory VALUES('ConstantSupport','fApogeeExtraTarg','F');
INSERT Inventory VALUES('ConstantSupport','fApogeeExtraTargN','F');
INSERT Inventory VALUES('ConstantSupport','fEbossTarget0','F');
INSERT Inventory VALUES('ConstantSupport','fEbossTarget0N','F');
INSERT Inventory VALUES('ConstantSupport','fSpecZWarning','F');
INSERT Inventory VALUES('ConstantSupport','fSpecZWarningN','F');
INSERT Inventory VALUES('ConstantSupport','fSpecPixMask','F');
INSERT Inventory VALUES('ConstantSupport','fSpecPixMaskN','F');
INSERT Inventory VALUES('ConstantSupport','fTiMask','F');
INSERT Inventory VALUES('ConstantSupport','fTiMaskN','F');
INSERT Inventory VALUES('ConstantSupport','fPhotoDescription','F');
INSERT Inventory VALUES('ConstantSupport','fSpecDescription','F');
INSERT Inventory VALUES('MetadataTables','SiteDBs','U');
INSERT Inventory VALUES('MetadataTables','QueryResults','U');
INSERT Inventory VALUES('MetadataTables','RecentQueries','U');
INSERT Inventory VALUES('MetadataTables','SkipFinishPhases','U');
INSERT Inventory VALUES('MetadataTables','SiteConstants','U');
INSERT Inventory VALUES('MetadataTables','DBObjects','U');
INSERT Inventory VALUES('MetadataTables','DBColumns','U');
INSERT Inventory VALUES('MetadataTables','DBViewCols','U');
INSERT Inventory VALUES('MetadataTables','History','U');
INSERT Inventory VALUES('MetadataTables','Inventory','U');
INSERT Inventory VALUES('MetadataTables','Dependency','U');
INSERT Inventory VALUES('MetadataTables','PubHistory','U');
INSERT Inventory VALUES('MetadataTables','LoadHistory','U');
INSERT Inventory VALUES('MetadataTables','Diagnostics','U');
INSERT Inventory VALUES('MetadataTables','SiteDiagnostics','U');
INSERT Inventory VALUES('IndexMap','spNewPhase','P');
INSERT Inventory VALUES('IndexMap','spStartStep','P');
INSERT Inventory VALUES('IndexMap','spEndStep','P');
INSERT Inventory VALUES('IndexMap','IndexMap','U');
INSERT Inventory VALUES('IndexMap','fIndexName','F');
INSERT Inventory VALUES('IndexMap','spIndexCreate','P');
INSERT Inventory VALUES('IndexMap','spIndexBuildList','P');
INSERT Inventory VALUES('IndexMap','spIndexDropList','P');
INSERT Inventory VALUES('IndexMap','spIndexBuildSelection','P');
INSERT Inventory VALUES('IndexMap','spIndexDropSelection','P');
INSERT Inventory VALUES('IndexMap','spIndexDrop','P');
INSERT Inventory VALUES('IndexMap','spDropIndexAll','P');
INSERT Inventory VALUES('IndexMap','spIndexCreatePhotoTag','P');
INSERT Inventory VALUES('Versions','Versions','U');
INSERT Inventory VALUES('PhotoTables','Field','U');
INSERT Inventory VALUES('PhotoTables','PhotoObjAll','U');
INSERT Inventory VALUES('PhotoTables','ProperMotions','U');
INSERT Inventory VALUES('PhotoTables','FieldProfile','U');
INSERT Inventory VALUES('PhotoTables','Run','U');
INSERT Inventory VALUES('PhotoTables','PhotoProfile','U');
INSERT Inventory VALUES('PhotoTables','Mask','U');
INSERT Inventory VALUES('PhotoTables','MaskedObject','U');
INSERT Inventory VALUES('PhotoTables','AtlasOutline','U');
INSERT Inventory VALUES('PhotoTables','PhotoPrimaryDR7','U');
INSERT Inventory VALUES('PhotoTables','PhotoObjDR7','U');
INSERT Inventory VALUES('PhotoTables','TwoMass','U');
INSERT Inventory VALUES('PhotoTables','TwoMassXSC','U');
INSERT Inventory VALUES('PhotoTables','FIRST','U');
INSERT Inventory VALUES('PhotoTables','RC3','U');
INSERT Inventory VALUES('PhotoTables','ROSAT','U');
INSERT Inventory VALUES('PhotoTables','USNO','U');
INSERT Inventory VALUES('PhotoTables','WISE_xmatch','U');
INSERT Inventory VALUES('PhotoTables','WISE_allsky','U');
INSERT Inventory VALUES('PhotoTables','wiseForcedTarget','U');
INSERT Inventory VALUES('PhotoZTables','Photoz','U');
INSERT Inventory VALUES('PhotoZTables','PhotozErrorMap','U');
INSERT Inventory VALUES('galSpecTables','galSpecExtra','U');
INSERT Inventory VALUES('galSpecTables','galSpecIndx','U');
INSERT Inventory VALUES('galSpecTables','galSpecInfo','U');
INSERT Inventory VALUES('galSpecTables','galSpecLine','U');
INSERT Inventory VALUES('spPhoto','fSkyVersion','F');
INSERT Inventory VALUES('spPhoto','fRerun','F');
INSERT Inventory VALUES('spPhoto','fRun','F');
INSERT Inventory VALUES('spPhoto','fCamcol','F');
INSERT Inventory VALUES('spPhoto','fField','F');
INSERT Inventory VALUES('spPhoto','fObj','F');
INSERT Inventory VALUES('spPhoto','fObjID','F');
INSERT Inventory VALUES('spPhoto','fObjidFromSDSS','F');
INSERT Inventory VALUES('spPhoto','fObjidFromSDSSWithFF','F');
INSERT Inventory VALUES('spPhoto','fSDSS','F');
INSERT Inventory VALUES('spPhoto','fSDSSfromObjID','F');
INSERT Inventory VALUES('spPhoto','fStripeOfRun','F');
INSERT Inventory VALUES('spPhoto','fStripOfRun','F');
INSERT Inventory VALUES('spPhoto','fDMSbase','F');
INSERT Inventory VALUES('spPhoto','fHMSbase','F');
INSERT Inventory VALUES('spPhoto','fDMS','F');
INSERT Inventory VALUES('spPhoto','fHMS','F');
INSERT Inventory VALUES('spPhoto','fIAUFromEq','F');
INSERT Inventory VALUES('spPhoto','fFirstFieldBit','F');
INSERT Inventory VALUES('spPhoto','fPrimaryObjID','F');
INSERT Inventory VALUES('spPhoto','fMagToFlux','F');
INSERT Inventory VALUES('spPhoto','fMagToFluxErr','F');
INSERT Inventory VALUES('spPhoto','fGetWCS','F');
INSERT Inventory VALUES('resolveTables','detectionIndex','U');
INSERT Inventory VALUES('resolveTables','thingIndex','U');
INSERT Inventory VALUES('NeighborTables','Neighbors','U');
INSERT Inventory VALUES('NeighborTables','Zone','U');
INSERT Inventory VALUES('SpectroTables','PlateX','U');
INSERT Inventory VALUES('SpectroTables','SpecObjAll','U');
INSERT Inventory VALUES('SpectroTables','SpecPhotoAll','U');
INSERT Inventory VALUES('SpectroTables','SpecDR7','U');
INSERT Inventory VALUES('GalaxyProductTables','stellarMassPCAWiscBC03','U');
INSERT Inventory VALUES('GalaxyProductTables','stellarMassPCAWiscM11','U');
INSERT Inventory VALUES('GalaxyProductTables','stellarMassPassivePort','U');
INSERT Inventory VALUES('GalaxyProductTables','stellarMassStarformingPort','U');
INSERT Inventory VALUES('GalaxyProductTables','stellarMassFSPSGranEarlyDust','U');
INSERT Inventory VALUES('GalaxyProductTables','stellarMassFSPSGranEarlyNoDust','U');
INSERT Inventory VALUES('GalaxyProductTables','stellarMassFSPSGranWideDust','U');
INSERT Inventory VALUES('GalaxyProductTables','stellarMassFSPSGranWideNoDust','U');
INSERT Inventory VALUES('GalaxyProductTables','emissionLinesPort','U');
INSERT Inventory VALUES('spSpectro','fGetBlob','F');
INSERT Inventory VALUES('spSpectro','fSpecidFromSDSS','F');
INSERT Inventory VALUES('spSpectro','fSDSSfromSpecID','F');
INSERT Inventory VALUES('spSpectro','fPlate','F');
INSERT Inventory VALUES('spSpectro','fMJD','F');
INSERT Inventory VALUES('spSpectro','fFiber','F');
INSERT Inventory VALUES('spSpectro','spMakeSpecObjAll','P');
INSERT Inventory VALUES('TilingTables','Target','U');
INSERT Inventory VALUES('TilingTables','TargetInfo','U');
INSERT Inventory VALUES('TilingTables','sdssTargetParam','U');
INSERT Inventory VALUES('TilingTables','sdssTileAll','U');
INSERT Inventory VALUES('TilingTables','sdssTilingRun','U');
INSERT Inventory VALUES('TilingTables','sdssTilingGeometry','U');
INSERT Inventory VALUES('TilingTables','sdssTiledTargetAll','U');
INSERT Inventory VALUES('TilingTables','sdssTilingInfo','U');
INSERT Inventory VALUES('RegionTables','RegionTypes','U');
INSERT Inventory VALUES('RegionTables','Rmatrix','U');
INSERT Inventory VALUES('RegionTables','Region','U');
INSERT Inventory VALUES('RegionTables','RegionPatch','U');
INSERT Inventory VALUES('RegionTables','HalfSpace','U');
INSERT Inventory VALUES('RegionTables','RegionArcs','U');
INSERT Inventory VALUES('RegionTables','sdssSector','U');
INSERT Inventory VALUES('RegionTables','sdssBestTarget2Sector','U');
INSERT Inventory VALUES('RegionTables','sdssSector2Tile','U');
INSERT Inventory VALUES('RegionTables','Region2Box','U');
INSERT Inventory VALUES('RegionTables','RegionConvex','V');
INSERT Inventory VALUES('WindowTables','sdssImagingHalfSpaces','U');
INSERT Inventory VALUES('WindowTables','sdssPolygons','U');
INSERT Inventory VALUES('WindowTables','sdssPolygon2Field','U');
INSERT Inventory VALUES('ssppTables','sppLines','U');
INSERT Inventory VALUES('ssppTables','sppParams','U');
INSERT Inventory VALUES('ssppTables','sppTargets','U');
INSERT Inventory VALUES('ssppTables','Plate2Target','U');
INSERT Inventory VALUES('ssppTables','segueTargetAll','U');
INSERT Inventory VALUES('ApogeeTables','apogeeVisit','U');
INSERT Inventory VALUES('ApogeeTables','apogeeStar','U');
INSERT Inventory VALUES('ApogeeTables','apogeeStarVisit','U');
INSERT Inventory VALUES('ApogeeTables','apogeeStarAllVisit','U');
INSERT Inventory VALUES('ApogeeTables','aspcapStar','U');
INSERT Inventory VALUES('ApogeeTables','aspcapStarCovar','U');
INSERT Inventory VALUES('ApogeeTables','apogeePlate','U');
INSERT Inventory VALUES('ApogeeTables','apogeeDesign','U');
INSERT Inventory VALUES('ApogeeTables','apogeeField','U');
INSERT Inventory VALUES('ApogeeTables','apogeeObject','U');
INSERT Inventory VALUES('MangaTables','mangaDrpAll','U');
INSERT Inventory VALUES('MangaTables','mangatarget','U');
INSERT Inventory VALUES('MangaTables','nsatlas','U');
INSERT Inventory VALUES('QsoVarTables','qsoVarPTF','U');
INSERT Inventory VALUES('QsoVarTables','qsoVarStripe','U');
INSERT Inventory VALUES('FrameTables','Frame','U');
INSERT Inventory VALUES('FrameTables','spComputeFrameHTM','P');
INSERT Inventory VALUES('FrameTables','spMakeFrame','P');
INSERT Inventory VALUES('FrameTables','fTileFileName','F');
INSERT Inventory VALUES('GalaxyZooTables','zooConfidence','U');
INSERT Inventory VALUES('GalaxyZooTables','zooMirrorBias','U');
INSERT Inventory VALUES('GalaxyZooTables','zooMonochromeBias','U');
INSERT Inventory VALUES('GalaxyZooTables','zooNoSpec','U');
INSERT Inventory VALUES('GalaxyZooTables','zooSpec','U');
INSERT Inventory VALUES('GalaxyZooTables','zooVotes','U');
INSERT Inventory VALUES('GalaxyZoo2Tables','zoo2MainPhotoz','U');
INSERT Inventory VALUES('GalaxyZoo2Tables','zoo2MainSpecz','U');
INSERT Inventory VALUES('GalaxyZoo2Tables','zoo2Stripe82Coadd1','U');
INSERT Inventory VALUES('GalaxyZoo2Tables','zoo2Stripe82Coadd2','U');
INSERT Inventory VALUES('GalaxyZoo2Tables','zoo2Stripe82Normal','U');
INSERT Inventory VALUES('MarvelsTables','marvelsVelocityCurveUF1D','U');
INSERT Inventory VALUES('MarvelsTables','marvelsStar','U');
INSERT Inventory VALUES('Views','PhotoObj','V');
INSERT Inventory VALUES('Views','PhotoPrimary','V');
INSERT Inventory VALUES('Views','PhotoSecondary','V');
INSERT Inventory VALUES('Views','PhotoFamily','V');
INSERT Inventory VALUES('Views','Star','V');
INSERT Inventory VALUES('Views','Galaxy','V');
INSERT Inventory VALUES('Views','PhotoTag','V');
INSERT Inventory VALUES('Views','StarTag','V');
INSERT Inventory VALUES('Views','GalaxyTag','V');
INSERT Inventory VALUES('Views','Sky','V');
INSERT Inventory VALUES('Views','Unknown','V');
INSERT Inventory VALUES('Views','SpecPhoto','V');
INSERT Inventory VALUES('Views','SpecObj','V');
INSERT Inventory VALUES('Views','Columns','V');
INSERT Inventory VALUES('Views','segue1SpecObjAll','V');
INSERT Inventory VALUES('Views','segue2SpecObjAll','V');
INSERT Inventory VALUES('Views','segueSpecObjAll','V');
INSERT Inventory VALUES('Views','sdssTile','V');
INSERT Inventory VALUES('Views','sdssTilingBoundary','V');
INSERT Inventory VALUES('Views','sdssTilingMask','V');
INSERT Inventory VALUES('Views','TableDesc','V');
INSERT Inventory VALUES('spSphericalLib','sph.fGetVersion','F');
INSERT Inventory VALUES('spSphericalLib','sph.fGetVersions','F');
INSERT Inventory VALUES('spSphericalLib','sph.fGetArea','F');
INSERT Inventory VALUES('spSphericalLib','sph.fGetRegionStringBin','F');
INSERT Inventory VALUES('spSphericalLib','sph.fConvexAddHalfspace','F');
INSERT Inventory VALUES('spSphericalLib','sph.fSimplifyBinary','F');
INSERT Inventory VALUES('spSphericalLib','sph.fSimplifyBinaryAdvanced','F');
INSERT Inventory VALUES('spSphericalLib','sph.fSimplifyString','F');
INSERT Inventory VALUES('spSphericalLib','sph.fSimplifyStringAdvanced','F');
INSERT Inventory VALUES('spSphericalLib','sph.fSimplifyQuery','F');
INSERT Inventory VALUES('spSphericalLib','sph.fSimplifyQueryAdvanced','F');
INSERT Inventory VALUES('spSphericalLib','sph.fGrowArc','F');
INSERT Inventory VALUES('spSphericalLib','sph.fGrow','F');
INSERT Inventory VALUES('spSphericalLib','sph.fGrowAdvanced','F');
INSERT Inventory VALUES('spSphericalLib','sph.fUnion','F');
INSERT Inventory VALUES('spSphericalLib','sph.fIntersect','F');
INSERT Inventory VALUES('spSphericalLib','sph.fUnionAdvanced','F');
INSERT Inventory VALUES('spSphericalLib','sph.fIntersectAdvanced','F');
INSERT Inventory VALUES('spSphericalLib','sph.fUnionQuery','F');
INSERT Inventory VALUES('spSphericalLib','sph.fIntersectQuery','F');
INSERT Inventory VALUES('spSphericalLib','sph.fDiffAdvanced','F');
INSERT Inventory VALUES('spSphericalLib','sph.fDiff','F');
INSERT Inventory VALUES('spSphericalLib','sph.fGetHalfspaces','F');
INSERT Inventory VALUES('spSphericalLib','sph.fGetConvexes','F');
INSERT Inventory VALUES('spSphericalLib','sph.fGetPatches','F');
INSERT Inventory VALUES('spSphericalLib','sph.fGetArcs','F');
INSERT Inventory VALUES('spSphericalLib','sph.fGetOutlineArcs','F');
INSERT Inventory VALUES('spSphericalLib','sph.fGetHtmRanges','F');
INSERT Inventory VALUES('spSphericalLib','sph.fGetHtmRangesAdvanced','F');
INSERT Inventory VALUES('spSphericalLib','sph.fRegionContainsXYZ','F');
INSERT Inventory VALUES('spSphericalLib','sph.fSimplifyAdvanced','F');
INSERT Inventory VALUES('spSphericalLib','sph.fSimplify','F');
INSERT Inventory VALUES('spSphericalLib','sph.fGetRegionString','F');
INSERT Inventory VALUES('spHtmCSharp','fHtmVersion','F');
INSERT Inventory VALUES('spHtmCSharp','fHtmEq','F');
INSERT Inventory VALUES('spHtmCSharp','fHtmXyz','F');
INSERT Inventory VALUES('spHtmCSharp','fHtmGetString','F');
INSERT Inventory VALUES('spHtmCSharp','fHtmGetCenterPoint','F');
INSERT Inventory VALUES('spHtmCSharp','fHtmGetCornerPoints','F');
INSERT Inventory VALUES('spHtmCSharp','fHtmCoverCircleEq','F');
INSERT Inventory VALUES('spHtmCSharp','fHtmCoverCircleXyz','F');
INSERT Inventory VALUES('spHtmCSharp','fHtmCoverRegion','F');
INSERT Inventory VALUES('spHtmCSharp','fHtmCoverRegionError','F');
INSERT Inventory VALUES('spHtmCSharp','fHtmCoverBinaryAdvanced','F');
INSERT Inventory VALUES('spHtmCSharp','fHtmCoverRegionAdvanced','F');
INSERT Inventory VALUES('spHtmCSharp','fDistanceEq','F');
INSERT Inventory VALUES('spHtmCSharp','fDistanceXyz','F');
INSERT Inventory VALUES('spHtmCSharp','fHtmEqToXyz','F');
INSERT Inventory VALUES('spHtmCSharp','fHtmXyzToEq','F');
INSERT Inventory VALUES('spNearby','fDistanceArcMinEq','F');
INSERT Inventory VALUES('spNearby','fDistanceArcMinXYZ','F');
INSERT Inventory VALUES('spNearby','fGetNearbyObjEq','F');
INSERT Inventory VALUES('spNearby','fGetNearbyObjAllEq','F');
INSERT Inventory VALUES('spNearby','spNearestObjEq','P');
INSERT Inventory VALUES('spNearby','fGetNearestObjEq','F');
INSERT Inventory VALUES('spNearby','fGetNearestObjAllEq','F');
INSERT Inventory VALUES('spNearby','fGetNearestObjIdEq','F');
INSERT Inventory VALUES('spNearby','fGetNearestObjIdAllEq','F');
INSERT Inventory VALUES('spNearby','fGetNearestObjIdEqType','F');
INSERT Inventory VALUES('spNearby','fGetNearestObjIdEqMode','F');
INSERT Inventory VALUES('spNearby','fGetNearbyObjXYZ','F');
INSERT Inventory VALUES('spNearby','fGetNearbyObjAllXYZ','F');
INSERT Inventory VALUES('spNearby','fGetNearestObjXYZ','F');
INSERT Inventory VALUES('spNearby','fGetNearestSpecObjIdEq','F');
INSERT Inventory VALUES('spNearby','fGetNearestSpecObjIdAllEq','F');
INSERT Inventory VALUES('spNearby','fGetNearbySpecObjXYZ','F');
INSERT Inventory VALUES('spNearby','fGetNearbySpecObjAllXYZ','F');
INSERT Inventory VALUES('spNearby','fGetNearestSpecObjXYZ','F');
INSERT Inventory VALUES('spNearby','fGetNearestSpecObjAllXYZ','F');
INSERT Inventory VALUES('spNearby','fGetNearbySpecObjEq','F');
INSERT Inventory VALUES('spNearby','fGetNearbySpecObjAllEq','F');
INSERT Inventory VALUES('spNearby','fGetNearestSpecObjEq','F');
INSERT Inventory VALUES('spNearby','fGetNearestSpecObjAllEq','F');
INSERT Inventory VALUES('spNearby','fGetNearbyApogeeStarEq','F');
INSERT Inventory VALUES('spNearby','fGetNearestApogeeStarEq','F');
INSERT Inventory VALUES('spNearby','fGetNearbyMangaObjEq','F');
INSERT Inventory VALUES('spNearby','fGetNearestMangaObjEq','F');
INSERT Inventory VALUES('spNearby','fGetNearbyFrameEq','F');
INSERT Inventory VALUES('spNearby','fGetNearestFrameEq','F');
INSERT Inventory VALUES('spNearby','fGetNearestFrameidEq','F');
INSERT Inventory VALUES('spNearby','spGetNeighbors','P');
INSERT Inventory VALUES('spNearby','spGetNeighborsRadius','P');
INSERT Inventory VALUES('spNearby','spGetNeighborsPrim','P');
INSERT Inventory VALUES('spNearby','spGetNeighborsAll','P');
INSERT Inventory VALUES('spNearby','spGetSpecNeighborsRadius','P');
INSERT Inventory VALUES('spNearby','spGetSpecNeighborsPrim','P');
INSERT Inventory VALUES('spNearby','spGetSpecNeighborsAll','P');
INSERT Inventory VALUES('spNearby','fGetObjFromRect','F');
INSERT Inventory VALUES('spNearby','fGetObjFromRectEq','F');
INSERT Inventory VALUES('spNearby','fGetObjectsEq','F');
INSERT Inventory VALUES('spNearby','fGetObjectsMaskEq','F');
INSERT Inventory VALUES('spNearby','fGetJpegObjects','F');
INSERT Inventory VALUES('spNearby','spGetMatch','P');
INSERT Inventory VALUES('spApogee','fAspcapParamsAll','F');
INSERT Inventory VALUES('spApogee','fAspcapParams','F');
INSERT Inventory VALUES('spApogee','fAspcapParamErrs','F');
INSERT Inventory VALUES('spApogee','fAspcapParamFlags','F');
INSERT Inventory VALUES('spApogee','fAspcapElemsAll','F');
INSERT Inventory VALUES('spApogee','fAspcapElems','F');
INSERT Inventory VALUES('spApogee','fAspcapElemErrs','F');
INSERT Inventory VALUES('spApogee','fAspcapElemFlags','F');
INSERT Inventory VALUES('spApogee','fAspcapFelemsAll','F');
INSERT Inventory VALUES('spApogee','fAspcapFelems','F');
INSERT Inventory VALUES('spApogee','fAspcapFelemErrs','F');
INSERT Inventory VALUES('spCoordinate','spTransposeRmatrix','P');
INSERT Inventory VALUES('spCoordinate','spBuildRmatrix','P');
INSERT Inventory VALUES('spCoordinate','fRotateV3','F');
INSERT Inventory VALUES('spCoordinate','fGetLonLat','F');
INSERT Inventory VALUES('spCoordinate','fGetLon','F');
INSERT Inventory VALUES('spCoordinate','fGetLat','F');
INSERT Inventory VALUES('spCoordinate','fEqFromMuNu','F');
INSERT Inventory VALUES('spCoordinate','fMuNuFromEq','F');
INSERT Inventory VALUES('spCoordinate','fMuFromEq','F');
INSERT Inventory VALUES('spCoordinate','fNuFromEq','F');
INSERT Inventory VALUES('spCoordinate','fCoordsFromEq','F');
INSERT Inventory VALUES('spCoordinate','fEtaFromEq','F');
INSERT Inventory VALUES('spCoordinate','fLambdaFromEq','F');
INSERT Inventory VALUES('spCoordinate','fEtaToNormal','F');
INSERT Inventory VALUES('spCoordinate','fStripeToNormal','F');
INSERT Inventory VALUES('spCoordinate','fWedgeV3','F');
INSERT Inventory VALUES('spRegion','fTokenNext','F');
INSERT Inventory VALUES('spRegion','fTokenAdvance','F');
INSERT Inventory VALUES('spRegion','fTokenStringToTable','F');
INSERT Inventory VALUES('spRegion','fNormalizeString','F');
INSERT Inventory VALUES('spRegion','fRegionFuzz','F');
INSERT Inventory VALUES('spRegion','fRegionOverlapId','F');
INSERT Inventory VALUES('spRegion','spRegionDelete','P');
INSERT Inventory VALUES('spRegion','spRegionNew','P');
INSERT Inventory VALUES('spRegion','spRegionAnd','P');
INSERT Inventory VALUES('spRegion','spRegionIntersect','P');
INSERT Inventory VALUES('spRegion','spRegionSubtract','P');
INSERT Inventory VALUES('spRegion','spRegionCopy','P');
INSERT Inventory VALUES('spRegion','spRegionSync','P');
INSERT Inventory VALUES('spRegion','fRegionContainsPointXYZ','F');
INSERT Inventory VALUES('spRegion','fRegionContainsPointEq','F');
INSERT Inventory VALUES('spRegion','fRegionGetObjectsFromRegionId','F');
INSERT Inventory VALUES('spRegion','fRegionGetObjectsFromString','F');
INSERT Inventory VALUES('spRegion','fRegionsContainingPointXYZ','F');
INSERT Inventory VALUES('spRegion','fRegionsContainingPointEq','F');
INSERT Inventory VALUES('spRegion','fPolygonsContainingPointXYZ','F');
INSERT Inventory VALUES('spRegion','fPolygonsContainingPointEq','F');
INSERT Inventory VALUES('spRegion','fFootprintEq','F');
INSERT Inventory VALUES('spRegion','fRegionsIntersectingBinary','F');
INSERT Inventory VALUES('spRegion','fRegionsIntersectingString','F');
INSERT Inventory VALUES('spRegion','fInFootprintEq','F');
INSERT Inventory VALUES('spCheckDB','spMakeDiagnostics','P');
INSERT Inventory VALUES('spCheckDB','spUpdateSkyServerCrossCheck','P');
INSERT Inventory VALUES('spCheckDB','spCompareChecksum','P');
INSERT Inventory VALUES('spCheckDB','fGetDiagChecksum','F');
INSERT Inventory VALUES('spCheckDB','spUpdateStatistics','P');
INSERT Inventory VALUES('spCheckDB','spCheckDBColumns','P');
INSERT Inventory VALUES('spCheckDB','spCheckDBObjects','P');
INSERT Inventory VALUES('spCheckDB','spGrantAccess','P');
INSERT Inventory VALUES('spCheckDB','spCheckDBIndexes','P');
INSERT Inventory VALUES('spTestQueries','spTestTimeStart','P');
INSERT Inventory VALUES('spTestQueries','spTestTimeEnd','P');
INSERT Inventory VALUES('spTestQueries','spTestQueries','P');
INSERT Inventory VALUES('spDocSupport','fVarBinToHex','F');
INSERT Inventory VALUES('spDocSupport','fEnum','F');
INSERT Inventory VALUES('spDocSupport','fDocColumns','F');
INSERT Inventory VALUES('spDocSupport','fDocColumnsWithRank','F');
INSERT Inventory VALUES('spDocSupport','fDocFunctionParams','F');
INSERT Inventory VALUES('spDocSupport','spDocEnum','P');
INSERT Inventory VALUES('spDocSupport','spDocKeySearch','P');
INSERT Inventory VALUES('spSQLSupport','fReplace','F');
INSERT Inventory VALUES('spSQLSupport','fIsNumbers','F');
INSERT Inventory VALUES('spSQLSupport','dbo.[spExecuteSQL]','P');
INSERT Inventory VALUES('spSQLSupport','dbo.[spExecuteSQL2]','P');
INSERT Inventory VALUES('spSQLSupport','spLogSqlStatement','P');
INSERT Inventory VALUES('spSQLSupport','spLogSqlPerformance','P');
INSERT Inventory VALUES('spUrlFitsSupport','fGetUrlExpEq','F');
INSERT Inventory VALUES('spUrlFitsSupport','fGetUrlExpId','F');
INSERT Inventory VALUES('spUrlFitsSupport','fGetUrlFrameImg','F');
INSERT Inventory VALUES('spUrlFitsSupport','spGetFiberList','P');
INSERT Inventory VALUES('spUrlFitsSupport','fGetUrlFitsField','F');
INSERT Inventory VALUES('spUrlFitsSupport','fGetUrlFitsCFrame','F');
INSERT Inventory VALUES('spUrlFitsSupport','fGetUrlFitsMask','F');
INSERT Inventory VALUES('spUrlFitsSupport','fGetUrlFitsBin','F');
INSERT Inventory VALUES('spUrlFitsSupport','fGetUrlFitsAtlas','F');
INSERT Inventory VALUES('spUrlFitsSupport','fGetUrlFitsPlate','F');
INSERT Inventory VALUES('spUrlFitsSupport','fGetUrlFitsSpectrum','F');
INSERT Inventory VALUES('spUrlFitsSupport','fGetUrlNavEq','F');
INSERT Inventory VALUES('spUrlFitsSupport','fGetUrlNavId','F');
INSERT Inventory VALUES('spUrlFitsSupport','fGetUrlSpecImg','F');
INSERT Inventory VALUES('spUrlFitsSupport','spSetWebServerUrl','P');
INSERT Inventory VALUES('spUrlFitsSupport','fMJDToGMT','F');
INSERT Inventory VALUES('spNeighbor','fGetAlpha','F');
INSERT Inventory VALUES('spNeighbor','spZoneCreate','P');
INSERT Inventory VALUES('spNeighbor','spNeighbors','P');
INSERT Inventory VALUES('spSetValues','spFillMaskedObject','P');
INSERT Inventory VALUES('spSetValues','spSetInsideMask','P');
INSERT Inventory VALUES('spSetValues','spSetPhotoClean','P');
INSERT Inventory VALUES('spSetValues','spTargetInfoTargetObjID','P');
INSERT Inventory VALUES('spSetValues','spSetLoadVersion','P');
INSERT Inventory VALUES('spSetValues','spSetValues','P');
INSERT Inventory VALUES('spValidate','spTestHtm','P');
INSERT Inventory VALUES('spValidate','fDatediffSec','F');
INSERT Inventory VALUES('spValidate','spGenericTest','P');
INSERT Inventory VALUES('spValidate','spTestUniqueKey','P');
INSERT Inventory VALUES('spValidate','spTestForeignKey','P');
INSERT Inventory VALUES('spValidate','spTestPhotoParentID','P');
INSERT Inventory VALUES('spValidate','spComputePhotoParentID','P');
INSERT Inventory VALUES('spValidate','spValidatePhoto','P');
INSERT Inventory VALUES('spValidate','spValidatePlates','P');
INSERT Inventory VALUES('spValidate','spValidateGalSpec','P');
INSERT Inventory VALUES('spValidate','spValidateGalProd','P');
INSERT Inventory VALUES('spValidate','spValidateTiles','P');
INSERT Inventory VALUES('spValidate','spValidateWindow','P');
INSERT Inventory VALUES('spValidate','spValidateSspp','P');
INSERT Inventory VALUES('spValidate','spValidatePm','P');
INSERT Inventory VALUES('spValidate','spValidateMask','P');
INSERT Inventory VALUES('spValidate','spValidateManga','P');
INSERT Inventory VALUES('spValidate','spValidateNSA','P');
INSERT Inventory VALUES('spValidate','spValidateResolve','P');
INSERT Inventory VALUES('spValidate','spValidateApogee','P');
INSERT Inventory VALUES('spValidate','spValidateWise','P');
INSERT Inventory VALUES('spValidate','spValidateStep','P');
INSERT Inventory VALUES('spPublish','spBackupStep','P');
INSERT Inventory VALUES('spPublish','spCleanupStep','P');
INSERT Inventory VALUES('spPublish','spShrinkDB','P');
INSERT Inventory VALUES('spPublish','spReorg','P');
INSERT Inventory VALUES('spPublish','spCopyATable','P');
INSERT Inventory VALUES('spPublish','spPublishPhoto','P');
INSERT Inventory VALUES('spPublish','spPublishMask','P');
INSERT Inventory VALUES('spPublish','spPublishManga','P');
INSERT Inventory VALUES('spPublish','spPublishNSA','P');
INSERT Inventory VALUES('spPublish','spPublishPlates','P');
INSERT Inventory VALUES('spPublish','spPublishGalProd','P');
INSERT Inventory VALUES('spPublish','spPublishTiling','P');
INSERT Inventory VALUES('spPublish','spPublishWindow','P');
INSERT Inventory VALUES('spPublish','spPublishGalSpec','P');
INSERT Inventory VALUES('spPublish','spPublishSspp','P');
INSERT Inventory VALUES('spPublish','spPublishPm','P');
INSERT Inventory VALUES('spPublish','spPublishResolve','P');
INSERT Inventory VALUES('spPublish','spPublishApogee','P');
INSERT Inventory VALUES('spPublish','spPublishWise','P');
INSERT Inventory VALUES('spPublish','spPublishStep','P');
INSERT Inventory VALUES('spFinish','spFixDetectionIndex','P');
INSERT Inventory VALUES('spFinish','spRunSQLScript','P');
INSERT Inventory VALUES('spFinish','spLoadScienceTables','P');
INSERT Inventory VALUES('spFinish','spSetVersion','P');
INSERT Inventory VALUES('spFinish','spSyncSchema','P');
INSERT Inventory VALUES('spFinish','spRunPatch','P');
INSERT Inventory VALUES('spFinish','spLoadMetaData','P');
INSERT Inventory VALUES('spFinish','spRemoveTaskFromTable','P');
INSERT Inventory VALUES('spFinish','spRemoveTaskPhoto','P');
INSERT Inventory VALUES('spFinish','spRemovePlate','P');
INSERT Inventory VALUES('spFinish','spRemoveTaskSpectro','P');
INSERT Inventory VALUES('spFinish','spRemovePlateList','P');
INSERT Inventory VALUES('spFinish','spTableCopy','P');
INSERT Inventory VALUES('spFinish','spBuildSpecPhotoAll','P');
INSERT Inventory VALUES('spFinish','spSegue2SpectroPhotoMatch','P');
INSERT Inventory VALUES('spFinish','fGetNearbyTiledTargetsEq','F');
INSERT Inventory VALUES('spFinish','spTiledTargetDuplicates','P');
INSERT Inventory VALUES('spFinish','spSynchronize','P');
INSERT Inventory VALUES('spFinish','spFixTargetVersion','P');
INSERT Inventory VALUES('spFinish','spSdssPolygonRegions','P');
INSERT Inventory VALUES('spFinish','spLoadPhotoTag','P');
INSERT Inventory VALUES('spFinish','spLoadPatches','P');
INSERT Inventory VALUES('spFinish','spCreateWeblogDB','P');
INSERT Inventory VALUES('spFinish','spFinishDropIndices','P');
INSERT Inventory VALUES('spFinish','spFinishStep','P');
INSERT Inventory VALUES('spCopyDbSubset','spCopyDbSimpleTable','P');
INSERT Inventory VALUES('spCopyDbSubset','spCopyDbSubset','P');
INSERT Inventory VALUES('spCosmology','fCosmoZfromDl','F');
INSERT Inventory VALUES('spCosmology','fCosmoZfromDa','F');
INSERT Inventory VALUES('spCosmology','fCosmoZfromDm','F');
INSERT Inventory VALUES('spCosmology','fCosmoZfromDc','F');
INSERT Inventory VALUES('spCosmology','fCosmoZfromAgeOfUniverse','F');
INSERT Inventory VALUES('spCosmology','fCosmoZfromLookBackTime','F');
INSERT Inventory VALUES('spCosmology','fCosmoLookBackTime','F');
INSERT Inventory VALUES('spCosmology','fCosmoAgeOfUniverse','F');
INSERT Inventory VALUES('spCosmology','fCosmoTimeInterval','F');
INSERT Inventory VALUES('spCosmology','fCosmoHubbleDistance','F');
INSERT Inventory VALUES('spCosmology','fCosmoDl','F');
INSERT Inventory VALUES('spCosmology','fCosmoDc','F');
INSERT Inventory VALUES('spCosmology','fCosmoComovDist2ObjectsRADEC','F');
INSERT Inventory VALUES('spCosmology','fCosmoComovDist2ObjectsXYZ','F');
INSERT Inventory VALUES('spCosmology','fCosmoDa','F');
INSERT Inventory VALUES('spCosmology','fCosmoDm','F');
INSERT Inventory VALUES('spCosmology','fCosmoComovingVolume','F');
INSERT Inventory VALUES('spCosmology','fCosmoAbsMag','F');
INSERT Inventory VALUES('spCosmology','fCosmoDistanceModulus','F');
INSERT Inventory VALUES('spCosmology','fCosmoQuantities','F');
INSERT Inventory VALUES('spCosmology','fMathGetBin','F');
GO

------------------------------------
PRINT '591 lines inserted into Inventory'
------------------------------------
GO
