--=================================================================
--   spSphericalTest.sql
--	 2007-06-11 Tamas Budavari
-------------------------------------------------------------------
-- Tests whether something simple works
-------------------------------------------------------------------
-- History:
-------------------------------------------------------------------

--====================================================================
PRINT '*** TEST ***'
--
--PRINT dbo.fGetVersion();
--
declare @bin varbinary(max);
set @bin = null;
set @bin = dbo.fConvexAddHalfspace(@bin, 0, 1,0,0, 0.0);
set @bin = dbo.fConvexAddHalfspace(@bin, 0, 0,1,0, 0.0);
set @bin = dbo.fConvexAddHalfspace(@bin, 0, 0,0,1, 0.0);
set @bin = dbo.fConvexAddHalfspace(@bin, 0, 1,1,1, 0.0);

PRINT dbo.fGetRegionString(@bin);
set @bin = dbo.fSimplifyBinaryAdvanced(@bin, 0,0,0,0);
PRINT 'Area: ' + convert(nvarchar,dbo.fGetArea(@bin));
PRINT dbo.fGetRegionString(@bin);
--select * from dbo.fSphGetHalfspaces(@bin);
--select * from dbo.fSphGetPatches(@bin);

--select * from sph.fGetVersions()