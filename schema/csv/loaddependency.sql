-----------------------------
--  Dependency.sql
-----------------------------
SET NOCOUNT ON
GO
TRUNCATE TABLE Dependency
GO
--

INSERT Dependency VALUES('ConstantSupport','fPhotoDescription','fPhotoFlagsN');
INSERT Dependency VALUES('ConstantSupport','fPhotoDescription','fPhotoStatusN');
INSERT Dependency VALUES('ConstantSupport','fSpecDescription','fSpecPixMaskN');
INSERT Dependency VALUES('ConstantSupport','fSpecDescription','fSpecZWarningN');
INSERT Dependency VALUES('FrameTables','spComputeFrameHTM','fEqFromMuNu');
INSERT Dependency VALUES('FrameTables','spComputeFrameHTM','fHtmXyz');
INSERT Dependency VALUES('FrameTables','spMakeFrame','fTileFileName');
INSERT Dependency VALUES('IndexMap','spDropIndexAll','spIndexDrop');
INSERT Dependency VALUES('IndexMap','spEndStep','spEndStep');
INSERT Dependency VALUES('IndexMap','spEndStep','spNewPhase');
INSERT Dependency VALUES('IndexMap','spIndexBuildList','spIndexCreate');
INSERT Dependency VALUES('IndexMap','spIndexBuildSelection','spIndexBuildList');
INSERT Dependency VALUES('IndexMap','spIndexCreate','fIndexName');
INSERT Dependency VALUES('IndexMap','spIndexCreate','spNewPhase');
INSERT Dependency VALUES('IndexMap','spIndexDropList','fIndexName');
INSERT Dependency VALUES('IndexMap','spIndexDropList','spNewPhase');
INSERT Dependency VALUES('IndexMap','spIndexDropSelection','spIndexDropList');
INSERT Dependency VALUES('IndexMap','spNewPhase','spNewPhase');
INSERT Dependency VALUES('IndexMap','spStartStep','spNewPhase');
INSERT Dependency VALUES('IndexMap','spStartStep','spStartStep');
INSERT Dependency VALUES('spCheckDB','spCheckDBIndexes','fIndexName');
INSERT Dependency VALUES('spCheckDB','spCompareChecksum','fGetDiagChecksum');
INSERT Dependency VALUES('spCheckDB','spUpdateSkyServerCrossCheck','fGetDiagChecksum');
INSERT Dependency VALUES('spCoordinate','fEtaToNormal','fRotateV3');
INSERT Dependency VALUES('spCoordinate','fGetLat','fRotateV3');
INSERT Dependency VALUES('spCoordinate','fGetLon','fRotateV3');
INSERT Dependency VALUES('spCoordinate','fGetLonLat','fRotateV3');
INSERT Dependency VALUES('spCoordinate','fStripeToNormal','fRotateV3');
INSERT Dependency VALUES('spCoordinate','spBuildRmatrix','spTransposeRmatrix');
INSERT Dependency VALUES('spCopyDbSubset','spCopyDbSimpleTable','spNewPhase');
INSERT Dependency VALUES('spCopyDbSubset','spCopyDbSubset','spCopyDbSimpleTable');
INSERT Dependency VALUES('spCopyDbSubset','spCopyDbSubset','spCreatePartDB2');
INSERT Dependency VALUES('spCopyDbSubset','spCopyDbSubset','spDone');
INSERT Dependency VALUES('spCopyDbSubset','spCopyDbSubset','spEndStep');
INSERT Dependency VALUES('spCopyDbSubset','spCopyDbSubset','spIndexBuildSelection');
INSERT Dependency VALUES('spCopyDbSubset','spCopyDbSubset','spNewPhase');
INSERT Dependency VALUES('spCopyDbSubset','spCopyDbSubset','spNewStep');
INSERT Dependency VALUES('spCopyDbSubset','spCopyDbSubset','spNewTask');
INSERT Dependency VALUES('spCosmology','fCosmoDistanceModulus','fCosmoDl');
INSERT Dependency VALUES('spDocSupport','fEnum','fn_varbintohexstr');
INSERT Dependency VALUES('spDocSupport','spDocEnum','fEnum');
INSERT Dependency VALUES('spFinish','fGetNearbyTiledTargetsEq','fHTMCoverRegion');
INSERT Dependency VALUES('spFinish','spBuildSpecPhotoAll','spIndexBuildSelection');
INSERT Dependency VALUES('spFinish','spBuildSpecPhotoAll','spIndexDropSelection');
INSERT Dependency VALUES('spFinish','spBuildSpecPhotoAll','spNewPhase');
INSERT Dependency VALUES('spFinish','spCreateWeblogDB','spNewPhase');
INSERT Dependency VALUES('spFinish','spCreateWeblogDB','spRunSQLScript');
INSERT Dependency VALUES('spFinish','spFinishDropIndices','spIndexDropSelection');
INSERT Dependency VALUES('spFinish','spFinishDropIndices','spNewPhase');
INSERT Dependency VALUES('spFinish','spFinishDropIndices','spSetFinishPhase');
INSERT Dependency VALUES('spFinish','spFinishStep','spCreateWeblogDB');
INSERT Dependency VALUES('spFinish','spFinishStep','spDone');
INSERT Dependency VALUES('spFinish','spFinishStep','spEndStep');
INSERT Dependency VALUES('spFinish','spFinishStep','spFillMaskedObject');
INSERT Dependency VALUES('spFinish','spFinishStep','spFinishDropIndices');
INSERT Dependency VALUES('spFinish','spFinishStep','spFixDetectionIndex');
INSERT Dependency VALUES('spFinish','spFinishStep','spIndexBuildSelection');
INSERT Dependency VALUES('spFinish','spFinishStep','spLoadPatches');
INSERT Dependency VALUES('spFinish','spFinishStep','spLoadPhotoTag');
INSERT Dependency VALUES('spFinish','spFinishStep','spNewPhase');
INSERT Dependency VALUES('spFinish','spFinishStep','spSdssPolygonRegions');
INSERT Dependency VALUES('spFinish','spFinishStep','spSetFinishPhase');
INSERT Dependency VALUES('spFinish','spFinishStep','spSetInsideMask');
INSERT Dependency VALUES('spFinish','spFinishStep','spStartStep');
INSERT Dependency VALUES('spFinish','spFinishStep','spSynchronize');
INSERT Dependency VALUES('spFinish','spFinishStep','spSyncSchema');
INSERT Dependency VALUES('spFinish','spFinishStep','spTruncateFileGroupMap');
INSERT Dependency VALUES('spFinish','spFinishStep','spUpdateStatistics');
INSERT Dependency VALUES('spFinish','spFixDetectionIndex','spNewPhase');
INSERT Dependency VALUES('spFinish','spFixDetectionIndex','spSetFinishPhase');
INSERT Dependency VALUES('spFinish','spFixTargetVersion','spNewPhase');
INSERT Dependency VALUES('spFinish','spLoadMetaData','spIndexBuildSelection');
INSERT Dependency VALUES('spFinish','spLoadMetaData','spIndexDropSelection');
INSERT Dependency VALUES('spFinish','spLoadMetaData','spNewPhase');
INSERT Dependency VALUES('spFinish','spLoadMetaData','spRunSQLScript');
INSERT Dependency VALUES('spFinish','spLoadPatches','spNewPhase');
INSERT Dependency VALUES('spFinish','spLoadPatches','spRunSQLScript');
INSERT Dependency VALUES('spFinish','spLoadPatches','spSetFinishPhase');
INSERT Dependency VALUES('spFinish','spLoadPhotoTag','spIndexCreatePhotoTag');
INSERT Dependency VALUES('spFinish','spLoadPhotoTag','spNewPhase');
INSERT Dependency VALUES('spFinish','spLoadPhotoTag','spSetFinishPhase');
INSERT Dependency VALUES('spFinish','spLoadScienceTables','fGetNearestObjIdEq');
INSERT Dependency VALUES('spFinish','spRemovePlate','spIndexBuildSelection');
INSERT Dependency VALUES('spFinish','spRemovePlate','spIndexDropSelection');
INSERT Dependency VALUES('spFinish','spRemovePlateList','spRemovePlate');
INSERT Dependency VALUES('spFinish','spRemoveTaskPhoto','spRemoveTaskFromTable');
INSERT Dependency VALUES('spFinish','spRemoveTaskSpectro','spRemovePlate');
INSERT Dependency VALUES('spFinish','spRunPatch','spCompareChecksum');
INSERT Dependency VALUES('spFinish','spRunPatch','spMakeDiagnostics');
INSERT Dependency VALUES('spFinish','spRunPatch','spRunSqlScript');
INSERT Dependency VALUES('spFinish','spRunPatch','spUpdateSkyServerCrossCheck');
INSERT Dependency VALUES('spFinish','spRunPatch','spUpdateStatistics');
INSERT Dependency VALUES('spFinish','spRunSQLScript','spNewPhase');
INSERT Dependency VALUES('spFinish','spSdssPolygonRegions','sph.fGetArea');
INSERT Dependency VALUES('spFinish','spSdssPolygonRegions','spIndexBuildSelection');
INSERT Dependency VALUES('spFinish','spSdssPolygonRegions','spIndexDropSelection');
INSERT Dependency VALUES('spFinish','spSdssPolygonRegions','spNewPhase');
INSERT Dependency VALUES('spFinish','spSdssPolygonRegions','spRegionSync');
INSERT Dependency VALUES('spFinish','spSegue2SpectroPhotoMatch','fGetNearestObjIdEqMode');
INSERT Dependency VALUES('spFinish','spSegue2SpectroPhotoMatch','spNewPhase');
INSERT Dependency VALUES('spFinish','spSegue2SpectroPhotoMatch','sppParams');
INSERT Dependency VALUES('spFinish','spSetVersion','spCheckDBColumns');
INSERT Dependency VALUES('spFinish','spSetVersion','spCheckDBIndexes');
INSERT Dependency VALUES('spFinish','spSetVersion','spCheckDBObjects');
INSERT Dependency VALUES('spFinish','spSetVersion','spCompareChecksum');
INSERT Dependency VALUES('spFinish','spSetVersion','spMakeDiagnostics');
INSERT Dependency VALUES('spFinish','spSetVersion','spUpdateSkyServerCrossCheck');
INSERT Dependency VALUES('spFinish','spSetVersion','spUpdateStatistics');
INSERT Dependency VALUES('spFinish','spSynchronize','fDatediffSec');
INSERT Dependency VALUES('spFinish','spSynchronize','spBuildSpecPhotoAll');
INSERT Dependency VALUES('spFinish','spSynchronize','spNewPhase');
INSERT Dependency VALUES('spFinish','spSynchronize','spSetFinishPhase');
INSERT Dependency VALUES('spFinish','spSyncSchema','spLoadMetaData');
INSERT Dependency VALUES('spFinish','spSyncSchema','spNewPhase');
INSERT Dependency VALUES('spFinish','spSyncSchema','spRunSQLScript');
INSERT Dependency VALUES('spFinish','spSyncSchema','spSetFinishPhase');
INSERT Dependency VALUES('spFinish','spTiledTargetDuplicates','fgetNearbyTiledTargetsEq');
INSERT Dependency VALUES('spFinish','spTiledTargetDuplicates','fSourceType');
INSERT Dependency VALUES('spHtmCSharp','fDistanceEq','SphericalHTM.[Spherical.Htm.Sql.fDistanceEq');
INSERT Dependency VALUES('spHtmCSharp','fDistanceXyz','SphericalHTM.[Spherical.Htm.Sql.fDistanceXyz');
INSERT Dependency VALUES('spHtmCSharp','fHtmCoverBinaryAdvanced','SphericalHTM.[Spherical.Htm.Sql.fHtmCoverBinaryAdvanced');
INSERT Dependency VALUES('spHtmCSharp','fHtmCoverCircleEq','SphericalHTM.[Spherical.Htm.Sql.fHtmCoverCircleEq');
INSERT Dependency VALUES('spHtmCSharp','fHtmCoverCircleXyz','SphericalHTM.[Spherical.Htm.Sql.fHtmCoverCircleXyz');
INSERT Dependency VALUES('spHtmCSharp','fHtmCoverRegion','SphericalHTM.[Spherical.Htm.Sql.fHtmCoverRegion');
INSERT Dependency VALUES('spHtmCSharp','fHtmCoverRegionAdvanced','SphericalHTM.[Spherical.Htm.Sql.fHtmCoverRegionAdvanced');
INSERT Dependency VALUES('spHtmCSharp','fHtmCoverRegionError','SphericalHTM.[Spherical.Htm.Sql.fHtmCoverRegionError');
INSERT Dependency VALUES('spHtmCSharp','fHtmEq','SphericalHTM.[Spherical.Htm.Sql.fHtmEq');
INSERT Dependency VALUES('spHtmCSharp','fHtmEqToXyz','SphericalHTM.[Spherical.Htm.Sql.fHtmEqToXyz');
INSERT Dependency VALUES('spHtmCSharp','fHtmGetCenterPoint','SphericalHTM.[Spherical.Htm.Sql.fHtmGetCenterPoint');
INSERT Dependency VALUES('spHtmCSharp','fHtmGetCornerPoints','SphericalHTM.[Spherical.Htm.Sql.fHtmGetCornerPoints');
INSERT Dependency VALUES('spHtmCSharp','fHtmGetString','SphericalHTM.[Spherical.Htm.Sql.fHtmGetString');
INSERT Dependency VALUES('spHtmCSharp','fHtmVersion','SphericalHTM.[Spherical.Htm.Sql.fHtmVersion');
INSERT Dependency VALUES('spHtmCSharp','fHtmXyz','SphericalHTM.[Spherical.Htm.Sql.fHtmXyz');
INSERT Dependency VALUES('spHtmCSharp','fHtmXyzToEq','SphericalHTM.[Spherical.Htm.Sql.fHtmXyzToEq');
INSERT Dependency VALUES('spNearby','fGetJpegObjects','fGetObjectsEq');
INSERT Dependency VALUES('spNearby','fGetNearbyApogeeStarEq','fDistanceArcMinEq');
INSERT Dependency VALUES('spNearby','fGetNearbyApogeeStarEq','fHtmCoverCircleEq');
INSERT Dependency VALUES('spNearby','fGetNearbyFrameEq','fHtmCoverCircleXyz');
INSERT Dependency VALUES('spNearby','fGetNearbyMangaObjEq','fDistanceArcMinEq');
INSERT Dependency VALUES('spNearby','fGetNearbyMangaObjEq','fHtmCoverCircleEq');
INSERT Dependency VALUES('spNearby','fGetNearbyObjAllEq','fGetNearbyObjAllXYZ');
INSERT Dependency VALUES('spNearby','fGetNearbyObjAllXYZ','fHtmCoverCircleXyz');
INSERT Dependency VALUES('spNearby','fGetNearbyObjEq','fGetNearbyObjXYZ');
INSERT Dependency VALUES('spNearby','fGetNearbyObjXYZ','fHtmCoverCircleXyz');
INSERT Dependency VALUES('spNearby','fGetNearbySpecObjAllEq','fGetNearbySpecObjAllXYZ');
INSERT Dependency VALUES('spNearby','fGetNearbySpecObjAllXYZ','fHtmCoverCircleXyz');
INSERT Dependency VALUES('spNearby','fGetNearbySpecObjEq','fGetNearbySpecObjXYZ');
INSERT Dependency VALUES('spNearby','fGetNearbySpecObjXYZ','fHtmCoverCircleXyz');
INSERT Dependency VALUES('spNearby','fGetNearestApogeeStarEq','fDistanceArcMinEq');
INSERT Dependency VALUES('spNearby','fGetNearestApogeeStarEq','fGetNearbyApogeeStarEq');
INSERT Dependency VALUES('spNearby','fGetNearestFrameidEq','fGetNearestFrameEq');
INSERT Dependency VALUES('spNearby','fGetNearestMangaObjEq','fDistanceArcMinEq');
INSERT Dependency VALUES('spNearby','fGetNearestMangaObjEq','fGetNearbyMangaObjEq');
INSERT Dependency VALUES('spNearby','fGetNearestObjAllEq','fGetNearbyObjAllXYZ');
INSERT Dependency VALUES('spNearby','fGetNearestObjEq','fGetNearbyObjXYZ');
INSERT Dependency VALUES('spNearby','fGetNearestObjIdAllEq','fGetNearestObjAllEq');
INSERT Dependency VALUES('spNearby','fGetNearestObjIdEq','fGetNearestObjEq');
INSERT Dependency VALUES('spNearby','fGetNearestObjIdEqMode','fGetNearbyObjAllXYZ');
INSERT Dependency VALUES('spNearby','fGetNearestObjIdEqType','fGetNearbyObjEq');
INSERT Dependency VALUES('spNearby','fGetNearestObjXYZ','fGetNearbyObjXYZ');
INSERT Dependency VALUES('spNearby','fGetNearestSpecObjAllEq','fGetNearbySpecObjAllXYZ');
INSERT Dependency VALUES('spNearby','fGetNearestSpecObjAllXYZ','fGetNearbySpecObjAllXYZ');
INSERT Dependency VALUES('spNearby','fGetNearestSpecObjEq','fGetNearbySpecObjXYZ');
INSERT Dependency VALUES('spNearby','fGetNearestSpecObjIdAllEq','fGetNearestSpecObjAllEq');
INSERT Dependency VALUES('spNearby','fGetNearestSpecObjIdEq','fGetNearestSpecObjEq');
INSERT Dependency VALUES('spNearby','fGetNearestSpecObjXYZ','fGetNearbySpecObjXYZ');
INSERT Dependency VALUES('spNearby','fGetObjectsEq','fHtmCoverCircleXyz');
INSERT Dependency VALUES('spNearby','fGetObjectsMaskEq','fHtmCoverCircleXyz');
INSERT Dependency VALUES('spNearby','fGetObjFromRect','fGetNearbyObjEq');
INSERT Dependency VALUES('spNearby','fGetObjFromRectEq','fGetObjFromRect');
INSERT Dependency VALUES('spNearby','spGetMatch','fGetNearbyObjXYZ');
INSERT Dependency VALUES('spNearby','spGetNeighbors','fGetNearbyObjAllEq');
INSERT Dependency VALUES('spNearby','spGetNeighborsAll','fGetNearbyObjAllEq');
INSERT Dependency VALUES('spNearby','spGetNeighborsPrim','fGetNearbyObjEq');
INSERT Dependency VALUES('spNearby','spGetNeighborsRadius','fGetNearbyObjAllEq');
INSERT Dependency VALUES('spNearby','spGetSpecNeighborsAll','fGetNearbySpecObjAllEq');
INSERT Dependency VALUES('spNearby','spGetSpecNeighborsPrim','fGetNearbySpecObjEq');
INSERT Dependency VALUES('spNearby','spGetSpecNeighborsRadius','fGetNearbySpecObjAllEq');
INSERT Dependency VALUES('spNearby','spNearestObjEq','fPhotoTypeN');
INSERT Dependency VALUES('spNeighbor','spNeighbors','fDatediffSec');
INSERT Dependency VALUES('spNeighbor','spNeighbors','fGetAlpha');
INSERT Dependency VALUES('spNeighbor','spNeighbors','spIndexBuildSelection');
INSERT Dependency VALUES('spNeighbor','spNeighbors','spIndexDropSelection');
INSERT Dependency VALUES('spNeighbor','spNeighbors','spNewPhase');
INSERT Dependency VALUES('spNeighbor','spNeighbors','spZoneCreate');
INSERT Dependency VALUES('spNeighbor','spZoneCreate','fDatediffSec');
INSERT Dependency VALUES('spNeighbor','spZoneCreate','fGetAlpha');
INSERT Dependency VALUES('spNeighbor','spZoneCreate','spIndexBuildSelection');
INSERT Dependency VALUES('spNeighbor','spZoneCreate','spIndexDropSelection');
INSERT Dependency VALUES('spNeighbor','spZoneCreate','spNewPhase');
INSERT Dependency VALUES('spPhoto','fDMS','fDMSbase');
INSERT Dependency VALUES('spPhoto','fGetWCS','fEqFromMuNu');
INSERT Dependency VALUES('spPhoto','fHMS','fHMSbase');
INSERT Dependency VALUES('spPhoto','fIAUFromEq','fDMSbase');
INSERT Dependency VALUES('spPhoto','fIAUFromEq','fHMSbase');
INSERT Dependency VALUES('spPhoto','fMagToFluxErr','fMagToFlux');
INSERT Dependency VALUES('spPhoto','fSDSS','fCamcol');
INSERT Dependency VALUES('spPhoto','fSDSS','fField');
INSERT Dependency VALUES('spPhoto','fSDSS','fObj');
INSERT Dependency VALUES('spPhoto','fSDSS','fRerun');
INSERT Dependency VALUES('spPhoto','fSDSS','fRun');
INSERT Dependency VALUES('spPhoto','fSDSS','fSkyVersion');
INSERT Dependency VALUES('spPublish','spBackupStep','spEndStep');
INSERT Dependency VALUES('spPublish','spBackupStep','spNewPhase');
INSERT Dependency VALUES('spPublish','spBackupStep','spStartStep');
INSERT Dependency VALUES('spPublish','spCopyATable','spNewPhase');
INSERT Dependency VALUES('spPublish','spPublishApogee','spCopyATable');
INSERT Dependency VALUES('spPublish','spPublishApogee','spNewPhase');
INSERT Dependency VALUES('spPublish','spPublishGalProd','spCopyATable');
INSERT Dependency VALUES('spPublish','spPublishGalProd','spNewPhase');
INSERT Dependency VALUES('spPublish','spPublishGalSpec','spCopyATable');
INSERT Dependency VALUES('spPublish','spPublishGalSpec','spNewPhase');
INSERT Dependency VALUES('spPublish','spPublishManga','spCopyATable');
INSERT Dependency VALUES('spPublish','spPublishManga','spNewPhase');
INSERT Dependency VALUES('spPublish','spPublishMask','spCopyATable');
INSERT Dependency VALUES('spPublish','spPublishMask','spNewPhase');
INSERT Dependency VALUES('spPublish','spPublishMastar','spCopyATable');
INSERT Dependency VALUES('spPublish','spPublishMastar','spNewPhase');
INSERT Dependency VALUES('spPublish','spPublishNSA','spCopyATable');
INSERT Dependency VALUES('spPublish','spPublishNSA','spNewPhase');
INSERT Dependency VALUES('spPublish','spPublishPhoto','spCopyATable');
INSERT Dependency VALUES('spPublish','spPublishPhoto','spNewPhase');
INSERT Dependency VALUES('spPublish','spPublishPlates','spCopyATable');
INSERT Dependency VALUES('spPublish','spPublishPlates','spNewPhase');
INSERT Dependency VALUES('spPublish','spPublishPm','spCopyATable');
INSERT Dependency VALUES('spPublish','spPublishPm','spNewPhase');
INSERT Dependency VALUES('spPublish','spPublishResolve','spCopyATable');
INSERT Dependency VALUES('spPublish','spPublishResolve','spNewPhase');
INSERT Dependency VALUES('spPublish','spPublishSspp','spCopyATable');
INSERT Dependency VALUES('spPublish','spPublishSspp','spNewPhase');
INSERT Dependency VALUES('spPublish','spPublishStep','spEndStep');
INSERT Dependency VALUES('spPublish','spPublishStep','spNewPhase');
INSERT Dependency VALUES('spPublish','spPublishStep','spPublishApogee');
INSERT Dependency VALUES('spPublish','spPublishStep','spPublishGalProd');
INSERT Dependency VALUES('spPublish','spPublishStep','spPublishGalSpec');
INSERT Dependency VALUES('spPublish','spPublishStep','spPublishManga');
INSERT Dependency VALUES('spPublish','spPublishStep','spPublishMask');
INSERT Dependency VALUES('spPublish','spPublishStep','spPublishMastar');
INSERT Dependency VALUES('spPublish','spPublishStep','spPublishNSA');
INSERT Dependency VALUES('spPublish','spPublishStep','spPublishPhoto');
INSERT Dependency VALUES('spPublish','spPublishStep','spPublishPlates');
INSERT Dependency VALUES('spPublish','spPublishStep','spPublishPm');
INSERT Dependency VALUES('spPublish','spPublishStep','spPublishResolve');
INSERT Dependency VALUES('spPublish','spPublishStep','spPublishSspp');
INSERT Dependency VALUES('spPublish','spPublishStep','spPublishTiling');
INSERT Dependency VALUES('spPublish','spPublishStep','spPublishWindow');
INSERT Dependency VALUES('spPublish','spPublishStep','spPublishWise');
INSERT Dependency VALUES('spPublish','spPublishStep','spStartStep');
INSERT Dependency VALUES('spPublish','spPublishTiling','spCopyATable');
INSERT Dependency VALUES('spPublish','spPublishTiling','spNewPhase');
INSERT Dependency VALUES('spPublish','spPublishWindow','spCopyATable');
INSERT Dependency VALUES('spPublish','spPublishWindow','spNewPhase');
INSERT Dependency VALUES('spPublish','spPublishWise','spCopyATable');
INSERT Dependency VALUES('spPublish','spPublishWise','spNewPhase');
INSERT Dependency VALUES('spRegion','fFootprintEq','fPolygonsContainingPointEq');
INSERT Dependency VALUES('spRegion','fPolygonsContainingPointXYZ','fHtmCoverCircleXyz');
INSERT Dependency VALUES('spRegion','fPolygonsContainingPointXYZ','sph.fRegionContainsXYZ');
INSERT Dependency VALUES('spRegion','fRegionGetObjectsFromRegionId','fHtmCoverRegion');
INSERT Dependency VALUES('spRegion','fRegionGetObjectsFromString','fHtmCoverRegion');
INSERT Dependency VALUES('spRegion','fRegionGetObjectsFromString','sph.fGetHalfspaces');
INSERT Dependency VALUES('spRegion','fRegionGetObjectsFromString','sph.fGrow');
INSERT Dependency VALUES('spRegion','fRegionOverlapId','sph.fIntersect');
INSERT Dependency VALUES('spRegion','fRegionsContainingPointEq','fRegionsContainingPointXYZ');
INSERT Dependency VALUES('spRegion','fRegionsContainingPointXYZ','fTokenStringToTable');
INSERT Dependency VALUES('spRegion','fRegionsContainingPointXYZ','sph.fRegionContainsXYZ');
INSERT Dependency VALUES('spRegion','fRegionsIntersectingBinary','fHtmCoverBinaryAdvanced');
INSERT Dependency VALUES('spRegion','fRegionsIntersectingBinary','fTokenStringToTable');
INSERT Dependency VALUES('spRegion','fRegionsIntersectingBinary','sph.fGetArea');
INSERT Dependency VALUES('spRegion','fRegionsIntersectingBinary','sph.fGrow');
INSERT Dependency VALUES('spRegion','fRegionsIntersectingBinary','sph.fIntersect');
INSERT Dependency VALUES('spRegion','fRegionsIntersectingString','fRegionsIntersectingBinary');
INSERT Dependency VALUES('spRegion','fRegionsIntersectingString','sph.fGetArea');
INSERT Dependency VALUES('spRegion','fRegionsIntersectingString','sph.fSimplifyString');
INSERT Dependency VALUES('spRegion','fTokenStringToTable','fNormalizeString');
INSERT Dependency VALUES('spRegion','fTokenStringToTable','fTokenAdvance');
INSERT Dependency VALUES('spRegion','fTokenStringToTable','fTokenNext');
INSERT Dependency VALUES('spRegion','spRegionAnd','sph.fIntersectAdvanced');
INSERT Dependency VALUES('spRegion','spRegionIntersect','sph.fGetArea');
INSERT Dependency VALUES('spRegion','spRegionIntersect','sph.fGetPatches');
INSERT Dependency VALUES('spRegion','spRegionIntersect','sph.fGetRegionString');
INSERT Dependency VALUES('spRegion','spRegionIntersect','spRegionDelete');
INSERT Dependency VALUES('spRegion','spRegionSubtract','sph.fDiff');
INSERT Dependency VALUES('spRegion','spRegionSubtract','sph.fGetArea');
INSERT Dependency VALUES('spRegion','spRegionSubtract','sph.fGetPatches');
INSERT Dependency VALUES('spRegion','spRegionSubtract','sph.fGetRegionString');
INSERT Dependency VALUES('spRegion','spRegionSubtract','spRegionDelete');
INSERT Dependency VALUES('spRegion','spRegionSync','sph.fGetPatches');
INSERT Dependency VALUES('spSetValues','spFillMaskedObject','fRegionGetObjectsFromString');
INSERT Dependency VALUES('spSetValues','spFillMaskedObject','spEndStep');
INSERT Dependency VALUES('spSetValues','spFillMaskedObject','spIndexCreate');
INSERT Dependency VALUES('spSetValues','spFillMaskedObject','spIndexDropSelection');
INSERT Dependency VALUES('spSetValues','spFillMaskedObject','spNewPhase');
INSERT Dependency VALUES('spSetValues','spSetInsideMask','fHtmXyz');
INSERT Dependency VALUES('spSetValues','spSetInsideMask','spEndStep');
INSERT Dependency VALUES('spSetValues','spSetInsideMask','spIndexBuildSelection');
INSERT Dependency VALUES('spSetValues','spSetInsideMask','spIndexDropSelection');
INSERT Dependency VALUES('spSetValues','spSetInsideMask','spNewPhase');
INSERT Dependency VALUES('spSetValues','spSetLoadVersion','spEndStep');
INSERT Dependency VALUES('spSetValues','spSetLoadVersion','spNewPhase');
INSERT Dependency VALUES('spSetValues','spSetPhotoClean','spNewPhase');
INSERT Dependency VALUES('spSetValues','spSetValues','fHtmEq');
INSERT Dependency VALUES('spSetValues','spSetValues','fHtmXYZ');
INSERT Dependency VALUES('spSetValues','spSetValues','spanREPLACE');
INSERT Dependency VALUES('spSetValues','spSetValues','spComputeFrameHTM');
INSERT Dependency VALUES('spSetValues','spSetValues','spEndStep');
INSERT Dependency VALUES('spSetValues','spSetValues','spFillMaskedObject');
INSERT Dependency VALUES('spSetValues','spSetValues','spNewPhase');
INSERT Dependency VALUES('spSetValues','spSetValues','spSetInsideMask');
INSERT Dependency VALUES('spSetValues','spSetValues','spSetLoadVersion');
INSERT Dependency VALUES('spSetValues','spSetValues','spTargetInfoTargetObjid');
INSERT Dependency VALUES('spSetValues','spTargetInfoTargetObjID','ffirstfieldbit');
INSERT Dependency VALUES('spSetValues','spTargetInfoTargetObjID','spNewPhase');
INSERT Dependency VALUES('spSpectro','spMakeSpecObjAll','fGetBlob');
INSERT Dependency VALUES('spSphericalLib','sph.fGetArcs','SphericalSql.[Spherical.Sql.UserDefinedFunctions.GetArcs');
INSERT Dependency VALUES('spSphericalLib','sph.fGetConvexes','SphericalSql.[Spherical.Sql.UserDefinedFunctions.GetConvexes');
INSERT Dependency VALUES('spSphericalLib','sph.fGetHalfspaces','SphericalSql.[Spherical.Sql.UserDefinedFunctions.GetHalfspaces');
INSERT Dependency VALUES('spSphericalLib','sph.fGetHtmRanges','SphericalSql.[Spherical.Sql.UserDefinedFunctions.GetHtmRanges');
INSERT Dependency VALUES('spSphericalLib','sph.fGetHtmRangesAdvanced','SphericalSql.[Spherical.Sql.UserDefinedFunctions.GetHtmRangesAdvanced');
INSERT Dependency VALUES('spSphericalLib','sph.fGetOutlineArcs','SphericalSql.[Spherical.Sql.UserDefinedFunctions.GetOutlineArcs');
INSERT Dependency VALUES('spSphericalLib','sph.fGetPatches','SphericalSql.[Spherical.Sql.UserDefinedFunctions.GetPatches');
INSERT Dependency VALUES('spSphericalLib','sph.fRegionContainsXYZ','SphericalSql.[Spherical.Sql.UserDefinedFunctions.ContainsXYZ');
INSERT Dependency VALUES('spSphericalLib','sph.fSimplify','sph.fSimplifyAdvanced');
INSERT Dependency VALUES('spSphericalLib','sph.fSimplifyAdvanced','sph.fSimplifyQueryAdvanced');
INSERT Dependency VALUES('spSQLSupport','dbo.[spExecuteSQL]','fIsNumbers');
INSERT Dependency VALUES('spSQLSupport','dbo.[spExecuteSQL]','fReplaceMax');
INSERT Dependency VALUES('spTestQueries','spTestQueries','fGetNearbyObjEq');
INSERT Dependency VALUES('spTestQueries','spTestQueries','fHtmCoverRegion');
INSERT Dependency VALUES('spTestQueries','spTestQueries','fPhotoFlags');
INSERT Dependency VALUES('spTestQueries','spTestQueries','fPhotoType');
INSERT Dependency VALUES('spTestQueries','spTestQueries','spTestTimeEnd');
INSERT Dependency VALUES('spTestQueries','spTestQueries','spTestTimeStart');
INSERT Dependency VALUES('spUrlFitsSupport','fGetUrlFitsField','fSkyVersion');
INSERT Dependency VALUES('spValidate','spComputePhotoParentID','spNewPhase');
INSERT Dependency VALUES('spValidate','spGenericTest','spNewPhase');
INSERT Dependency VALUES('spValidate','spTestForeignKey','spNewPhase');
INSERT Dependency VALUES('spValidate','spTestHtm','fHtmEq');
INSERT Dependency VALUES('spValidate','spTestHtm','spNewPhase');
INSERT Dependency VALUES('spValidate','spTestPhotoParentID','spNewPhase');
INSERT Dependency VALUES('spValidate','spTestUniqueKey','spNewPhase');
INSERT Dependency VALUES('spValidate','spValidateApogee','fDatediffSec');
INSERT Dependency VALUES('spValidate','spValidateApogee','spNewPhase');
INSERT Dependency VALUES('spValidate','spValidateApogee','spTestUniqueKey');
INSERT Dependency VALUES('spValidate','spValidateGalProd','fDatediffSec');
INSERT Dependency VALUES('spValidate','spValidateGalProd','spNewPhase');
INSERT Dependency VALUES('spValidate','spValidateGalProd','spTestUniqueKey');
INSERT Dependency VALUES('spValidate','spValidateGalSpec','fDatediffSec');
INSERT Dependency VALUES('spValidate','spValidateGalSpec','spNewPhase');
INSERT Dependency VALUES('spValidate','spValidateGalSpec','spTestUniqueKey');
INSERT Dependency VALUES('spValidate','spValidateManga','fDatediffSec');
INSERT Dependency VALUES('spValidate','spValidateManga','spNewPhase');
INSERT Dependency VALUES('spValidate','spValidateManga','spTestUniqueKey');
INSERT Dependency VALUES('spValidate','spValidateMask','fDatediffSec');
INSERT Dependency VALUES('spValidate','spValidateMask','spNewPhase');
INSERT Dependency VALUES('spValidate','spValidateMask','spTestUniqueKey');
INSERT Dependency VALUES('spValidate','spValidateMastar','fDatediffSec');
INSERT Dependency VALUES('spValidate','spValidateMastar','spNewPhase');
INSERT Dependency VALUES('spValidate','spValidateMastar','spTestUniqueKey');
INSERT Dependency VALUES('spValidate','spValidateNSA','fDatediffSec');
INSERT Dependency VALUES('spValidate','spValidateNSA','spNewPhase');
INSERT Dependency VALUES('spValidate','spValidateNSA','spTestUniqueKey');
INSERT Dependency VALUES('spValidate','spValidatePhoto','fDatediffSec');
INSERT Dependency VALUES('spValidate','spValidatePhoto','spComputePhotoParentID');
INSERT Dependency VALUES('spValidate','spValidatePhoto','spGenericTest');
INSERT Dependency VALUES('spValidate','spValidatePhoto','spNewPhase');
INSERT Dependency VALUES('spValidate','spValidatePhoto','spTestForeignKey');
INSERT Dependency VALUES('spValidate','spValidatePhoto','spTestPhotoParentID');
INSERT Dependency VALUES('spValidate','spValidatePhoto','spTestUniqueKey');
INSERT Dependency VALUES('spValidate','spValidatePlates','fDatediffSec');
INSERT Dependency VALUES('spValidate','spValidatePlates','spNewPhase');
INSERT Dependency VALUES('spValidate','spValidatePlates','spTestForeignKey');
INSERT Dependency VALUES('spValidate','spValidatePlates','spTestHtm');
INSERT Dependency VALUES('spValidate','spValidatePlates','spTestUniqueKey');
INSERT Dependency VALUES('spValidate','spValidatePm','fDatediffSec');
INSERT Dependency VALUES('spValidate','spValidatePm','spNewPhase');
INSERT Dependency VALUES('spValidate','spValidatePm','spTestUniqueKey');
INSERT Dependency VALUES('spValidate','spValidateResolve','fDatediffSec');
INSERT Dependency VALUES('spValidate','spValidateResolve','spNewPhase');
INSERT Dependency VALUES('spValidate','spValidateResolve','spTestUniqueKey');
INSERT Dependency VALUES('spValidate','spValidateSspp','fDatediffSec');
INSERT Dependency VALUES('spValidate','spValidateSspp','spNewPhase');
INSERT Dependency VALUES('spValidate','spValidateSspp','spTestUniqueKey');
INSERT Dependency VALUES('spValidate','spValidateStep','spEndStep');
INSERT Dependency VALUES('spValidate','spValidateStep','spNewPhase');
INSERT Dependency VALUES('spValidate','spValidateStep','spStartStep');
INSERT Dependency VALUES('spValidate','spValidateStep','spValidateApogee');
INSERT Dependency VALUES('spValidate','spValidateStep','spValidateGalProd');
INSERT Dependency VALUES('spValidate','spValidateStep','spValidateGalSpec');
INSERT Dependency VALUES('spValidate','spValidateStep','spValidateManga');
INSERT Dependency VALUES('spValidate','spValidateStep','spValidateMask');
INSERT Dependency VALUES('spValidate','spValidateStep','spValidateMastar');
INSERT Dependency VALUES('spValidate','spValidateStep','spValidateNSA');
INSERT Dependency VALUES('spValidate','spValidateStep','spValidatePhoto');
INSERT Dependency VALUES('spValidate','spValidateStep','spValidatePlates');
INSERT Dependency VALUES('spValidate','spValidateStep','spValidatePm');
INSERT Dependency VALUES('spValidate','spValidateStep','spValidateResolve');
INSERT Dependency VALUES('spValidate','spValidateStep','spValidateSspp');
INSERT Dependency VALUES('spValidate','spValidateStep','spValidateTiles');
INSERT Dependency VALUES('spValidate','spValidateStep','spValidateWindow');
INSERT Dependency VALUES('spValidate','spValidateStep','spValidateWise');
INSERT Dependency VALUES('spValidate','spValidateTiles','fDatediffSec');
INSERT Dependency VALUES('spValidate','spValidateTiles','spNewPhase');
INSERT Dependency VALUES('spValidate','spValidateTiles','spTestForeignKey');
INSERT Dependency VALUES('spValidate','spValidateTiles','spTestUniqueKey');
INSERT Dependency VALUES('spValidate','spValidateWindow','fDatediffSec');
INSERT Dependency VALUES('spValidate','spValidateWindow','spNewPhase');
INSERT Dependency VALUES('spValidate','spValidateWindow','spTestUniqueKey');
INSERT Dependency VALUES('spValidate','spValidateWise','fDatediffSec');
INSERT Dependency VALUES('spValidate','spValidateWise','spNewPhase');
INSERT Dependency VALUES('spValidate','spValidateWise','spTestUniqueKey');
GO

------------------------------------
PRINT '409 lines inserted into Dependency'
------------------------------------
GO
