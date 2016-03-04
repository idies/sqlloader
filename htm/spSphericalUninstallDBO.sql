--=================================================================
--   spSphericalUninstall.sql
--	 2007-06-11 Tamas Budavari
-------------------------------------------------------------------
-- Drops the HTM and Spherical SQL/CLR routines and assemblies
-------------------------------------------------------------------
-- History:
-------------------------------------------------------------------

--====================================================================
BEGIN TRY DROP FUNCTION fHtmVersion END TRY BEGIN CATCH END CATCH
BEGIN TRY DROP FUNCTION fHtmEq END TRY BEGIN CATCH END CATCH
BEGIN TRY DROP FUNCTION fHtmXyz END TRY BEGIN CATCH END CATCH
BEGIN TRY DROP FUNCTION fHtmGetString END TRY BEGIN CATCH END CATCH
BEGIN TRY DROP FUNCTION fHtmCoverCircleEq END TRY BEGIN CATCH END CATCH
BEGIN TRY DROP FUNCTION fHtmCoverCircleXyz END TRY BEGIN CATCH END CATCH
BEGIN TRY DROP FUNCTION fHtmGetCenterPoint END TRY BEGIN CATCH END CATCH
BEGIN TRY DROP FUNCTION fHtmGetCornerPoints END TRY BEGIN CATCH END CATCH
BEGIN TRY DROP FUNCTION fDistanceEq END TRY BEGIN CATCH END CATCH
BEGIN TRY DROP FUNCTION fDistanceXyz END TRY BEGIN CATCH END CATCH
BEGIN TRY DROP FUNCTION fHtmEqToXyz END TRY BEGIN CATCH END CATCH
BEGIN TRY DROP FUNCTION fHtmXyzToEq END TRY BEGIN CATCH END CATCH
BEGIN TRY DROP FUNCTION fHtmCoverRegion END TRY BEGIN CATCH END CATCH
BEGIN TRY DROP FUNCTION fHtmCoverRegionError END TRY BEGIN CATCH END CATCH
BEGIN TRY DROP FUNCTION fHtmCoverRegionList END TRY BEGIN CATCH END CATCH
BEGIN TRY DROP FUNCTION fHtmCoverRegionAdvanced END TRY BEGIN CATCH END CATCH
BEGIN TRY DROP FUNCTION fHtmCoverBinaryAdvanced END TRY BEGIN CATCH END CATCH
--
BEGIN TRY DROP FUNCTION fSphGetVersion END TRY BEGIN CATCH END CATCH
--
BEGIN TRY DROP FUNCTION fSphGetArea END TRY BEGIN CATCH END CATCH
BEGIN TRY DROP FUNCTION fSphGetArcs END TRY BEGIN CATCH END CATCH
BEGIN TRY DROP FUNCTION fSphGetOutlineArcs END TRY BEGIN CATCH END CATCH
BEGIN TRY DROP FUNCTION fSphGetPatches END TRY BEGIN CATCH END CATCH
BEGIN TRY DROP FUNCTION fSphGetHalfspaces END TRY BEGIN CATCH END CATCH
BEGIN TRY DROP FUNCTION fSphGetConvexes END TRY BEGIN CATCH END CATCH
BEGIN TRY DROP FUNCTION fSphGetRegionString END TRY BEGIN CATCH END CATCH
BEGIN TRY DROP FUNCTION fSphGetRegionStringBin END TRY BEGIN CATCH END CATCH
--
BEGIN TRY DROP FUNCTION fSphSimplify END TRY BEGIN CATCH END CATCH
BEGIN TRY DROP FUNCTION fSphSimplifyAdvanced END TRY BEGIN CATCH END CATCH
BEGIN TRY DROP FUNCTION fSphSimplifyQuery END TRY BEGIN CATCH END CATCH
BEGIN TRY DROP FUNCTION fSphSimplifyQueryAdvanced END TRY BEGIN CATCH END CATCH
BEGIN TRY DROP FUNCTION fSphSimplifyBinary END TRY BEGIN CATCH END CATCH
BEGIN TRY DROP FUNCTION fSphSimplifyBinaryAdvanced END TRY BEGIN CATCH END CATCH
BEGIN TRY DROP FUNCTION fSphSimplifyString END TRY BEGIN CATCH END CATCH
BEGIN TRY DROP FUNCTION fSphSimplifyStringAdvanced END TRY BEGIN CATCH END CATCH
--
BEGIN TRY DROP FUNCTION fSphGrow END TRY BEGIN CATCH END CATCH
BEGIN TRY DROP FUNCTION fSphGrowAdvanced END TRY BEGIN CATCH END CATCH
BEGIN TRY DROP FUNCTION fSphUnion END TRY BEGIN CATCH END CATCH
BEGIN TRY DROP FUNCTION fSphUnionAdvanced END TRY BEGIN CATCH END CATCH
BEGIN TRY DROP FUNCTION fSphUnionQuery END TRY BEGIN CATCH END CATCH
BEGIN TRY DROP FUNCTION fSphIntersect END TRY BEGIN CATCH END CATCH
BEGIN TRY DROP FUNCTION fSphIntersectAdvanced END TRY BEGIN CATCH END CATCH
BEGIN TRY DROP FUNCTION fSphIntersectQuery END TRY BEGIN CATCH END CATCH
BEGIN TRY DROP FUNCTION fSphDiff END TRY BEGIN CATCH END CATCH
BEGIN TRY DROP FUNCTION fSphDiffAdvanced END TRY BEGIN CATCH END CATCH
--
BEGIN TRY DROP FUNCTION fSphRegionContainsXYZ END TRY BEGIN CATCH END CATCH
--
BEGIN TRY DROP FUNCTION fSphConvexAddHalfspace END TRY BEGIN CATCH END CATCH
--
BEGIN TRY DROP FUNCTION fSphGetHtmRanges END TRY BEGIN CATCH END CATCH
BEGIN TRY DROP FUNCTION fSphGetHtmRangesAdvanced END TRY BEGIN CATCH END CATCH
--
BEGIN TRY DROP PROCEDURE spSphSyncRegion END TRY BEGIN CATCH END CATCH
BEGIN TRY DROP PROCEDURE Sph.spSyncRegion END TRY BEGIN CATCH END CATCH
--
BEGIN TRY
	DROP ASSEMBLY [SphericalSql]
	PRINT 'Dropped assembly SphericalSql'
END TRY
BEGIN CATCH END CATCH
--
BEGIN TRY
	DROP ASSEMBLY [SphericalHTM]
	PRINT 'Dropped assembly SphericalHTM'
END TRY
BEGIN CATCH END CATCH
--
BEGIN TRY
	DROP ASSEMBLY [SphericalQuickhull]
	PRINT 'Dropped assembly SphericalQuickhull'
END TRY
BEGIN CATCH END CATCH
--
BEGIN TRY
	DROP ASSEMBLY [Spherical.Quickhull]
	PRINT 'Dropped assembly Spherical.Quickhull'
END TRY
BEGIN CATCH END CATCH
--
BEGIN TRY
	DROP ASSEMBLY [SphericalIO]
	PRINT 'Dropped assembly SphericalIO'
END TRY
BEGIN CATCH END CATCH
--
BEGIN TRY
	DROP ASSEMBLY [SphericalLib]
	PRINT 'Dropped assembly SphericalLib'
END TRY
BEGIN CATCH END CATCH
--
