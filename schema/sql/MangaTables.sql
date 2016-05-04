--=========================================================
--  MangaTables.sql
--  2016-03-29	David Law, David Wake, Brian CHerinka et al.	
-----------------------------------------------------------
--  MaNGA table schema for SQL Server
-----------------------------------------------------------
-- History:
--* 2016-03-29  Ani: Adapted from sas-sql/mangadrp.sql.
--* 2016-03-29  Ani: Increased length of mangaTarget.nsa_subdir to 128.
--* 2016-04-22  Ani: Added htmID to mangaDrpAll.
--* 2016-04-26  Ani: Updated schema for mangaDrpAll from D.Law to make
--*                  data types the required precision.
--* 2016-05-03  Ani: Added nsatlas table for NASA-SLoan Atlas.
--=========================================================

--=========================================================
IF EXISTS (SELECT name FROM sysobjects
         WHERE xtype='U' AND name = 'mangaDrpAll')
	DROP TABLE mangaDrpAll
GO
--
EXEC spSetDefaultFileGroup 'mangaDrpAll'
GO
CREATE TABLE mangaDrpAll (
------------------------------------------------------------------------------
--/H Final summary file of the MaNGA Data Reduction Pipeline (DRP).
------------------------------------------------------------------------------
--/T Contains all of the information required to find a given set of spectra
--/T for a target.
------------------------------------------------------------------------------
    plate  int  NOT NULL,   --/U --/D Plate ID
    ifudsgn  varchar(20)  NOT NULL, --/U --/D IFU design id (e.g. 12701)
    plateifu  varchar(20)  NOT NULL, --/U --/D (Primary key) Plate+ifudesign name for this object (e.g. 7443-12701)
    mangaid  varchar(20)  NOT NULL,  --/U --/D MaNGA ID for this object (e.g. 1-114145)
    versdrp2  varchar(20)  NOT NULL, --/U --/D Version of DRP used for 2d reductions
    versdrp3  varchar(20)  NOT NULL, --/U --/D Version of DRP used for 3d reductions
    verscore  varchar(20)  NOT NULL, --/U --/D Version of mangacore used for reductions
    versutil  varchar(20)  NOT NULL, --/U --/D Version of idlutils used for reductions
    versprim  varchar(20)  NOT NULL, --/U --/D Version of mangapreim used for reductions
    platetyp  varchar(20)  NOT NULL, --/U --/D Plate type (e.g. MANGA, APOGEE-2&MANGA)
    srvymode  varchar(20)  NOT NULL, --/U --/D Survey mode (e.g. MANGA dither, MANGA stare, APOGEE lead)
    objra  float  NOT NULL,   --/U degrees --/D Right ascension of the science object in J2000
    objdec  float  NOT NULL,   --/U degrees --/D Declination of the science object in J2000
    ifuglon  float  NOT NULL,   --/U degrees --/D Galactic longitude corresponding to IFURA/DEC
    ifuglat  float  NOT NULL,   --/U degrees --/D Galactic latitude corresponding to IFURA/DEC
    ifura  float  NOT NULL,   --/U degrees --/D Right ascension of this IFU in J2000
    ifudec  float  NOT NULL,   --/U degrees --/D Declination of this IFU in J2000
    ebvgal  real  NOT NULL,   --/U --/D E(B-V) value from SDSS dust routine for this IFUGLON, IFUGLAT
    nexp  int  NOT NULL,   --/U --/D Number of science exposures combined
    exptime  real  NOT NULL,   --/U seconds --/D Total exposure time
    drp3qual  bigint  NOT NULL,   --/U --/D Quality bitmask
    bluesn2  real  NOT NULL,   --/U --/D Total blue SN2 across all nexp exposures
    redsn2  real  NOT NULL,   --/U --/D Total red SN2 across all nexp exposures
    harname  varchar(20)  NOT NULL, --/U --/D IFU harness name
    frlplug  int  NOT NULL,   --/U --/D Frplug hardware code
    cartid  varchar(20)  NOT NULL, --/U --/D Cartridge ID number
    designid  int  NOT NULL,   --/U --/D  Design ID number
    cenra  float  NOT NULL,   --/U degrees --/D Plate center right ascension in J2000
    cendec  float  NOT NULL,   --/U degrees --/D Plate center declination in J2000
    airmsmin  real  NOT NULL,   --/U --/D Minimum airmass across all exposures
    airmsmed  real  NOT NULL,   --/U --/D Median airmass across all exposures
    airmsmax  real  NOT NULL,   --/U --/D Maximum airmass across all exposures
    seemin  real  NOT NULL,   --/U arcsec --/D Best guider seeing
    seemed  real  NOT NULL,   --/U arcsec --/D Median guider seeing
    seemax  real  NOT NULL,   --/U arcsec --/D Worst guider seeing
    transmin  real  NOT NULL,   --/U --/D Worst transparency
    transmed  real  NOT NULL,   --/U --/D Median transparency
    transmax  real  NOT NULL,   --/U --/D Best transparency
    mjdmin  int  NOT NULL,   --/U --/D Minimum MJD across all exposures
    mjdmed  int  NOT NULL,   --/U --/D Median MJD across all exposures
    mjdmax  int  NOT NULL,   --/U --/D Maximum MJD across all exposures
    gfwhm  real  NOT NULL,   --/U arcsec --/D Reconstructed FWHM in g-band
    rfwhm  real  NOT NULL,   --/U arcsec --/D Reconstructed FWHM in r-band
    ifwhm  real  NOT NULL,   --/U arcsec --/D Reconstructed FWHM in i-band
    zfwhm  real  NOT NULL,   --/U arcsec --/D Reconstructed FWHM in z-band
    mngtarg1  bigint  NOT NULL,   --/U --/D Manga-target1 maskbit for galaxy target catalog
    mngtarg2  bigint  NOT NULL,   --/U --/D Manga-target2 maskbit for galaxy target catalog
    mngtarg3  bigint  NOT NULL,   --/U --/D Manga-target3 maskbit for galaxy target catalog
    catidnum  bigint  NOT NULL,   --/U --/D Primary target input catalog (leading digits of mangaid)
    plttarg  varchar(20)  NOT NULL, --/U --/D plateTarget reference file appropriate for this target
    manga_tileid  int  NOT NULL,   --/U  --/D The ID of the tile to which this object has been allocated
    nsa_iauname  varchar(20)  NOT NULL,   --/U  --/D IAU-style designation based on RA/Dec (NSA)
    ifutargetsize int NOT NULL, --/U fibers --/D The ideal IFU size for this object. The intended IFU size is equal to IFUTargetSize except if IFUTargetSize > 127 when it is 127, or < 19 when it is 19
    ifudesignsize int NOT NULL, --/U fibers --/D The allocated IFU size (0 = "unallocated")
    ifudesignwrongsize int NOT NULL, --/U fibers --/D The allocated IFU size if the intended IFU size was not available
    nsa_field  int  NOT NULL,   --/U   --/D SDSS field ID covering the target
    nsa_run  int  NOT NULL,   --/U   --/D SDSS run ID covering the target
    nsa_camcol int NOT NULL, --/U --/D SDSS camcol ID covering the catalog position.
    nsa_version  varchar(20)  NOT NULL,   --/U   --/D Version of NSA catalogue used to select these targets
    nsa_nsaid  int  NOT NULL,   --/U   --/D The NSAID field in the NSA catalogue referenced in nsa_version.
    nsa_nsaid_v1b int NOT NULL, --/U --/D The NSAID of the target in the NSA_v1b_0_0_v2 catalogue (if applicable).
    nsa_z real NOT NULL, --/D Heliocentric redshift (NSA)
    nsa_zdist real NOT NULL, --/D Distance estimate using pecular velocity model of Willick et al. (1997), expressed as a redshift equivalent; multiply by c/H0 for Mpc (NSA)
    nsa_elpetro_mass real NOT NULL, --/U solar masses --/D Stellar mass from K-correction fit (use with caution) for elliptical Petrosian fluxes (NSA)
    nsa_elpetro_absmag_f real NOT NULL, --/F nsa_elpetro_absmag 0 --/U mag --/D Absolute magnitude in rest-frame GALEX far-UV, from elliptical Petrosian fluxes (NSA)
    nsa_elpetro_absmag_n real NOT NULL, --/F nsa_elpetro_absmag 1 --/U mag --/D Absolute magnitude in rest-frame GALEX near-UV, from elliptical Petrosian fluxes (NSA)
    nsa_elpetro_absmag_u real NOT NULL, --/F nsa_elpetro_absmag 2 --/U mag --/D Absolute magnitude in rest-frame SDSS u-band, from elliptical Petrosian fluxes (NSA)
    nsa_elpetro_absmag_g real NOT NULL, --/F nsa_elpetro_absmag 3 --/U mag --/D Absolute magnitude in rest-frame SDSS g-band, from elliptical Petrosian fluxes (NSA)
    nsa_elpetro_absmag_r real NOT NULL, --/F nsa_elpetro_absmag 4 --/U mag --/D Absolute magnitude in rest-frame SDSS r-band, from elliptical Petrosian fluxes (NSA)
    nsa_elpetro_absmag_i real NOT NULL, --/F nsa_elpetro_absmag 5 --/U mag --/D Absolute magnitude in rest-frame SDSS i-band, from elliptical Petrosian fluxes (NSA)
    nsa_elpetro_absmag_z real NOT NULL, --/F nsa_elpetro_absmag 6 --/U mag --/D Absolute magnitude in rest-frame SDSS z-band, from elliptical Petrosian fluxes (NSA)
    nsa_elpetro_amivar_f real NOT NULL, --/F nsa_elpetro_amivar 0 --/U mag^{-2} --/D Inverse variance of elpetro_absmag_f (NSA)
    nsa_elpetro_amivar_n real NOT NULL, --/F nsa_elpetro_amivar 1 --/U mag^{-2} --/D Inverse variance of elpetro_absmag_n (NSA)
    nsa_elpetro_amivar_u real NOT NULL, --/F nsa_elpetro_amivar 2 --/U mag^{-2} --/D Inverse variance of elpetro_absmag_u (NSA)
    nsa_elpetro_amivar_g real NOT NULL, --/F nsa_elpetro_amivar 3 --/U mag^{-2} --/D Inverse variance of elpetro_absmag_g (NSA)
    nsa_elpetro_amivar_r real NOT NULL, --/F nsa_elpetro_amivar 4 --/U mag^{-2} --/D Inverse variance of elpetro_absmag_r (NSA)
    nsa_elpetro_amivar_i real NOT NULL, --/F nsa_elpetro_amivar 5 --/U mag^{-2} --/D Inverse variance of elpetro_absmag_i (NSA)
    nsa_elpetro_amivar_z real NOT NULL, --/F nsa_elpetro_amivar 6 --/U mag^{-2} --/D Inverse variance of elpetro_absmag_z (NSA)
    nsa_elpetro_flux_f real NOT NULL, --/F nsa_elpetro_flux 0 --/U nanomaggies --/D Elliptical SDSS-style Petrosian flux in GALEX far-UV (using r-band aperture) (NSA)
    nsa_elpetro_flux_n real NOT NULL, --/F nsa_elpetro_flux 1 --/U nanomaggies --/D Elliptical SDSS-style Petrosian flux in GALEX near-UV (using r-band aperture) (NSA)
    nsa_elpetro_flux_u real NOT NULL, --/F nsa_elpetro_flux 2 --/U nanomaggies --/D Elliptical SDSS-style Petrosian flux in SDSS u-band (using r-band aperture) (NSA)
    nsa_elpetro_flux_g real NOT NULL, --/F nsa_elpetro_flux 3 --/U nanomaggies --/D Elliptical SDSS-style Petrosian flux in SDSS g-band (using r-band aperture) (NSA)
    nsa_elpetro_flux_r real NOT NULL, --/F nsa_elpetro_flux 4 --/U nanomaggies --/D Elliptical SDSS-style Petrosian flux in SDSS r-band (using r-band aperture) (NSA)
    nsa_elpetro_flux_i real NOT NULL, --/F nsa_elpetro_flux 5 --/U nanomaggies --/D Elliptical SDSS-style Petrosian flux in SDSS i-band (using r-band aperture) (NSA)
    nsa_elpetro_flux_z real NOT NULL, --/F nsa_elpetro_flux 6 --/U nanomaggies --/D Elliptical SDSS-style Petrosian flux in SDSS z-band (using r-band aperture) (NSA)
    nsa_elpetro_flux_ivar_f real NOT NULL, --/F nsa_elpetro_flux_ivar 0 --/U nanomaggies^{-2} --/D Inverse variance of elpetroflux_f (NSA)
    nsa_elpetro_flux_ivar_n real NOT NULL, --/F nsa_elpetro_flux_ivar 1 --/U nanomaggies^{-2} --/D Inverse variance of elpetroflux_n (NSA)
    nsa_elpetro_flux_ivar_u real NOT NULL, --/F nsa_elpetro_flux_ivar 2 --/U nanomaggies^{-2} --/D Inverse variance of elpetroflux_u (NSA)
    nsa_elpetro_flux_ivar_g real NOT NULL, --/F nsa_elpetro_flux_ivar 3 --/U nanomaggies^{-2} --/D Inverse variance of elpetroflux_g (NSA)
    nsa_elpetro_flux_ivar_r real NOT NULL, --/F nsa_elpetro_flux_ivar 4 --/U nanomaggies^{-2} --/D Inverse variance of elpetroflux_r (NSA)
    nsa_elpetro_flux_ivar_i real NOT NULL, --/F nsa_elpetro_flux_ivar 5 --/U nanomaggies^{-2} --/D Inverse variance of elpetroflux_i (NSA)
    nsa_elpetro_flux_ivar_z real NOT NULL, --/F nsa_elpetro_flux_ivar 6 --/U nanomaggies^{-2} --/D Inverse variance of elpetroflux_z (NSA)
    nsa_elpetro_th50_r real NOT NULL, --/U arcsec --/F nsa_elpetro_th50_r --/D Elliptical Petrosian 50% light radius in SDSS r-band (NSA)
    nsa_elpetro_phi real NOT NULL, --/U deg --/D Position angle (east of north) used for elliptical apertures (for this version, same as ba90) (NSA)
    nsa_elpetro_ba real NOT NULL, --/D Axis ratio used for elliptical apertures (for this version, same as ba90) (NSA)
    nsa_sersic_mass real NOT NULL, --/U solar mass --/D Stellar mass from K-correction fit (use with caution) for Sersic fluxes (NSA)
    nsa_sersic_absmag_f real NOT NULL, --/F nsa_sersic_absmag 0 --/U mag --/D Absolute magnitude in rest-frame GALEX near-UV, from Sersic fluxes (NSA)
    nsa_sersic_absmag_n real NOT NULL, --/F nsa_sersic_absmag 1 --/U mag --/D Absolute magnitude in rest-frame GALEX far-UV, from Sersic fluxes (NSA)
    nsa_sersic_absmag_u real NOT NULL, --/F nsa_sersic_absmag 2 --/U mag --/D Absolute magnitude in rest-frame SDSS u-band, from Sersic fluxes (NSA)
    nsa_sersic_absmag_g real NOT NULL, --/F nsa_sersic_absmag 3 --/U mag --/D Absolute magnitude in rest-frame SDSS g-band, from Sersic fluxes (NSA)
    nsa_sersic_absmag_r real NOT NULL, --/F nsa_sersic_absmag 4 --/U mag --/D Absolute magnitude in rest-frame SDSS r-band, from Sersic fluxes (NSA)
    nsa_sersic_absmag_i real NOT NULL, --/F nsa_sersic_absmag 5 --/U mag --/D Absolute magnitude in rest-frame SDSS i-band, from Sersic fluxes (NSA)
    nsa_sersic_absmag_z real NOT NULL, --/F nsa_sersic_absmag 6 --/U mag --/D Absolute magnitude in rest-frame SDSS z-band, from Sersic fluxes (NSA)
    nsa_sersic_flux_f real NOT NULL, --/F nsa_sersic_flux 0 --/U nanomaggies --/D Two-dimensional, single-component Sersic fit flux in GALEX far-UV (fit using r-band structural parameters) (NSA)
    nsa_sersic_flux_n real NOT NULL, --/F nsa_sersic_flux 1 --/U nanomaggies --/D Two-dimensional, single-component Sersic fit flux in GALEX near-UV (fit using r-band structural parameters) (NSA)
    nsa_sersic_flux_u real NOT NULL, --/F nsa_sersic_flux 2 --/U nanomaggies --/D Two-dimensional, single-component Sersic fit flux in SDSS u-band (fit using r-band structural parameters) (NSA)
    nsa_sersic_flux_g real NOT NULL, --/F nsa_sersic_flux 3 --/U nanomaggies --/D Two-dimensional, single-component Sersic fit flux in SDSS g-band (fit using r-band structural parameters) (NSA)
    nsa_sersic_flux_r real NOT NULL, --/F nsa_sersic_flux 4 --/U nanomaggies --/D Two-dimensional, single-component Sersic fit flux in SDSS r-band (fit using r-band structural parameters) (NSA)
    nsa_sersic_flux_i real NOT NULL, --/F nsa_sersic_flux 5 --/U nanomaggies --/D Two-dimensional, single-component Sersic fit flux in SDSS i-band (fit using r-band structural parameters) (NSA)
    nsa_sersic_flux_z real NOT NULL, --/F nsa_sersic_flux 6 --/U nanomaggies --/D Two-dimensional, single-component Sersic fit flux in SDSS z-band (fit using r-band structural parameters) (NSA)
    nsa_sersic_flux_ivar_f real NOT NULL, --/F nsa_sersic_flux_ivar 0 --/U nanomaggies^{-2} --/D Inverse variance of sersic_flux_f (NSA)
    nsa_sersic_flux_ivar_n real NOT NULL, --/F nsa_sersic_flux_ivar 1 --/U nanomaggies^{-2} --/D Inverse variance of sersic_flux_n (NSA)
    nsa_sersic_flux_ivar_u real NOT NULL, --/F nsa_sersic_flux_ivar 2 --/U nanomaggies^{-2} --/D Inverse variance of sersic_flux_u (NSA)
    nsa_sersic_flux_ivar_g real NOT NULL, --/F nsa_sersic_flux_ivar 3 --/U nanomaggies^{-2} --/D Inverse variance of sersic_flux_g (NSA)
    nsa_sersic_flux_ivar_r real NOT NULL, --/F nsa_sersic_flux_ivar 4 --/U nanomaggies^{-2} --/D Inverse variance of sersic_flux_r (NSA)
    nsa_sersic_flux_ivar_i real NOT NULL, --/F nsa_sersic_flux_ivar 5 --/U nanomaggies^{-2} --/D Inverse variance of sersic_flux_i (NSA)
    nsa_sersic_flux_ivar_z real NOT NULL, --/F nsa_sersic_flux_ivar 6 --/U nanomaggies^{-2} --/D Inverse variance of sersic_flux_z (NSA)
    nsa_sersic_th50 real NOT NULL, --/U arcsec --/D 50% light radius of two-dimensional, single-component Sersic fit to r-band (NSA)
    nsa_sersic_phi real NOT NULL, --/U deg --/D Angle (E of N) of major axis in two-dimensional, single-component Sersic fit in r-band (NSA)
    nsa_sersic_ba real NOT NULL, --/D Axis ratio b/a from two-dimensional, single-component Sersic fit in r-band (NSA)
    nsa_sersic_n real NOT NULL, --/D Sersic index from two-dimensional, single-component Sersic fit in r-band (NSA)
    nsa_petro_flux_f real NOT NULL, --/F nsa_petro_flux 0 --/U nanomaggies --/D Azimuthally-averaged SDSS-style Petrosian flux in GALEX far-UV (using r-band aperture) (NSA)
    nsa_petro_flux_n real NOT NULL, --/F nsa_petro_flux 1 --/U nanomaggies --/D Azimuthally-averaged SDSS-style Petrosian flux in GALEX far-UV (using r-band aperture) (NSA)
    nsa_petro_flux_u real NOT NULL, --/F nsa_petro_flux 2 --/U nanomaggies --/D Azimuthally-averaged SDSS-style Petrosian flux in SDSS u-band (using r-band aperture) (NSA)
    nsa_petro_flux_g real NOT NULL, --/F nsa_petro_flux 3 --/U nanomaggies --/D Azimuthally-averaged SDSS-style Petrosian flux in SDSS g-band (using r-band aperture) (NSA)
    nsa_petro_flux_r real NOT NULL, --/F nsa_petro_flux 4 --/U nanomaggies --/D Azimuthally-averaged SDSS-style Petrosian flux in SDSS r-band (using r-band aperture) (NSA)
    nsa_petro_flux_i real NOT NULL, --/F nsa_petro_flux 5 --/U nanomaggies --/D Azimuthally-averaged SDSS-style Petrosian flux in SDSS i-band (using r-band aperture) (NSA)
    nsa_petro_flux_z real NOT NULL, --/F nsa_petro_flux 6 --/U nanomaggies --/D Azimuthally-averaged SDSS-style Petrosian flux in SDSS z-band (using r-band aperture) (NSA)
    nsa_petro_flux_ivar_f real NOT NULL, --/F nsa_petro_flux_ivar 0 --/U nanomaggies^{-2} --/D Inverse variance of petro_flux_f (NSA)
    nsa_petro_flux_ivar_n real NOT NULL, --/F nsa_petro_flux_ivar 1 --/U nanomaggies^{-2} --/D Inverse variance of petro_flux_n (NSA)
    nsa_petro_flux_ivar_u real NOT NULL, --/F nsa_petro_flux_ivar 2 --/U nanomaggies^{-2} --/D Inverse variance of petro_flux_u (NSA)
    nsa_petro_flux_ivar_g real NOT NULL, --/F nsa_petro_flux_ivar 3 --/U nanomaggies^{-2} --/D Inverse variance of petro_flux_g (NSA)
    nsa_petro_flux_ivar_r real NOT NULL, --/F nsa_petro_flux_ivar 4 --/U nanomaggies^{-2} --/D Inverse variance of petro_flux_r (NSA)
    nsa_petro_flux_ivar_i real NOT NULL, --/F nsa_petro_flux_ivar 5 --/U nanomaggies^{-2} --/D Inverse variance of petro_flux_i (NSA)
    nsa_petro_flux_ivar_z real NOT NULL, --/F nsa_petro_flux_ivar 6 --/U nanomaggies^{-2} --/D Inverse variance of petro_flux_z (NSA)
    nsa_petro_th50 real NOT NULL, --/U arcsec --/D Azimuthally averaged SDSS-style Petrosian 50% light radius (derived from r band) (NSA)
    nsa_extinction_f real NOT NULL, --/F nsa_extinction 0 --/U mag --/D Galactic extinction from Schlegel, Finkbeiner, and Davis (1997), in GALEX far-UV (NSA)
    nsa_extinction_n real NOT NULL, --/F nsa_extinction 1 --/U mag --/D Galactic extinction from Schlegel, Finkbeiner, and Davis (1997), in GALEX near-UV (NSA)
    nsa_extinction_u real NOT NULL, --/F nsa_extinction 2 --/U mag --/D Galactic extinction from Schlegel, Finkbeiner, and Davis (1997), in SDSS u-band (NSA)
    nsa_extinction_g real NOT NULL, --/F nsa_extinction 3 --/U mag --/D Galactic extinction from Schlegel, Finkbeiner, and Davis (1997), in SDSS g-band (NSA)
    nsa_extinction_r real NOT NULL, --/F nsa_extinction 4 --/U mag --/D Galactic extinction from Schlegel, Finkbeiner, and Davis (1997), in SDSS r-band (NSA)
    nsa_extinction_i real NOT NULL, --/F nsa_extinction 5 --/U mag --/D Galactic extinction from Schlegel, Finkbeiner, and Davis (1997), in SDSS i-band (NSA)
    nsa_extinction_z real NOT NULL, --/F nsa_extinction 6 --/U mag --/D Galactic extinction from Schlegel, Finkbeiner, and Davis (1997), in SDSS z-band (NSA)
    htmID bigint NOT NULL     	    --/F NOFITS --/D Hierarchical Triangular Mesh ID for fast spatial searches 
)
GO
--



--=========================================================
IF EXISTS (SELECT name FROM sysobjects
         WHERE xtype='U' AND name = 'mangaTarget')
	DROP TABLE mangaTarget
GO
--
EXEC spSetDefaultFileGroup 'mangaTarget'
GO
CREATE TABLE mangatarget (
------------------------------------------------------------------------------
--/H MaNGA Target Catalog
------------------------------------------------------------------------------
--/T The MaNGA targeting catalog, v1_2_18. This table contains the details of
--/T the three main MaNGA samples, Primary, Secondary and Color-Enhanced, as
--/T well as the ancillary targets. In addition to the targeting information
--/T there are details of the tile and IFU allocation as of 03/10/2016. This
--/T tiling and allocation details may change slightly as the survey evolves.
--/T Also included are various useful parameters from the NASA-Sloan Atlas
--/T (NSA) catalog, v1_0_1, which was used to select almost all of the targets.
--/T A few ancillary targets may have been selected from elsewhere. Targets
--/T cover the full SDSS spectroscopic DR7 region, although only approximately
--/T 1/3 will be observed in the final survey.
------------------------------------------------------------------------------
    catalog_ra float NOT NULL, --/U deg --/D Right Ascension of measured object center (J2000) as given in the input catalog (NSA for main samples and most ancillaries)
    catalog_dec float NOT NULL, --/U deg --/D Declination of measured object center (J2000) as given in the input catalog (NSA for main samples and most ancillaries)
    nsa_z real NOT NULL, --/D Heliocentric redshift (NSA)
    nsa_zdist real NOT NULL, --/D Distance estimate using pecular velocity model of Willick et al. (1997), expressed as a redshift equivalent; multiply by c/H0 for Mpc (NSA)
    nsa_elpetro_mass real NOT NULL, --/U solar masses --/D Stellar mass from K-correction fit (use with caution) for elliptical Petrosian fluxes (NSA)
    nsa_elpetro_absmag_f real NOT NULL, --/F nsa_elpetro_absmag 0 --/U mag --/D Absolute magnitude in rest-frame GALEX far-UV, from elliptical Petrosian fluxes (NSA)
    nsa_elpetro_absmag_n real NOT NULL, --/F nsa_elpetro_absmag 1 --/U mag --/D Absolute magnitude in rest-frame GALEX near-UV, from elliptical Petrosian fluxes (NSA)
    nsa_elpetro_absmag_u real NOT NULL, --/F nsa_elpetro_absmag 2 --/U mag --/D Absolute magnitude in rest-frame SDSS u-band, from elliptical Petrosian fluxes (NSA)
    nsa_elpetro_absmag_g real NOT NULL, --/F nsa_elpetro_absmag 3 --/U mag --/D Absolute magnitude in rest-frame SDSS g-band, from elliptical Petrosian fluxes (NSA)
    nsa_elpetro_absmag_r real NOT NULL, --/F nsa_elpetro_absmag 4 --/U mag --/D Absolute magnitude in rest-frame SDSS r-band, from elliptical Petrosian fluxes (NSA)
    nsa_elpetro_absmag_i real NOT NULL, --/F nsa_elpetro_absmag 5 --/U mag --/D Absolute magnitude in rest-frame SDSS i-band, from elliptical Petrosian fluxes (NSA)
    nsa_elpetro_absmag_z real NOT NULL, --/F nsa_elpetro_absmag 6 --/U mag --/D Absolute magnitude in rest-frame SDSS z-band, from elliptical Petrosian fluxes (NSA)
    nsa_elpetro_amivar_f real NOT NULL, --/F nsa_elpetro_amivar 0 --/U mag^{-2} --/D Inverse variance of nsa_elpetro_absmag_f (NSA)
    nsa_elpetro_amivar_n real NOT NULL, --/F nsa_elpetro_amivar 1 --/U mag^{-2} --/D Inverse variance of nsa_elpetro_absmag_n (NSA)
    nsa_elpetro_amivar_u real NOT NULL, --/F nsa_elpetro_amivar 2 --/U mag^{-2} --/D Inverse variance of nsa_elpetro_absmag_u (NSA)
    nsa_elpetro_amivar_g real NOT NULL, --/F nsa_elpetro_amivar 3 --/U mag^{-2} --/D Inverse variance of nsa_elpetro_absmag_g (NSA)
    nsa_elpetro_amivar_r real NOT NULL, --/F nsa_elpetro_amivar 4 --/U mag^{-2} --/D Inverse variance of nsa_elpetro_absmag_r (NSA)
    nsa_elpetro_amivar_i real NOT NULL, --/F nsa_elpetro_amivar 5 --/U mag^{-2} --/D Inverse variance of nsa_elpetro_absmag_i (NSA)
    nsa_elpetro_amivar_z real NOT NULL, --/F nsa_elpetro_amivar 6 --/U mag^{-2} --/D Inverse variance of nsa_elpetro_absmag_z (NSA)
    nsa_elpetro_flux_f real NOT NULL, --/F nsa_elpetro_flux 0 --/U nanomaggies --/D Elliptical SDSS-style Petrosian flux in GALEX far-UV (using r-band aperture) (NSA)
    nsa_elpetro_flux_n real NOT NULL, --/F nsa_elpetro_flux 1 --/U nanomaggies --/D Elliptical SDSS-style Petrosian flux in GALEX near-UV (using r-band aperture) (NSA)
    nsa_elpetro_flux_u real NOT NULL, --/F nsa_elpetro_flux 2 --/U nanomaggies --/D Elliptical SDSS-style Petrosian flux in SDSS u-band (using r-band aperture) (NSA)
    nsa_elpetro_flux_g real NOT NULL, --/F nsa_elpetro_flux 3 --/U nanomaggies --/D Elliptical SDSS-style Petrosian flux in SDSS g-band (using r-band aperture) (NSA)
    nsa_elpetro_flux_r real NOT NULL, --/F nsa_elpetro_flux 4 --/U nanomaggies --/D Elliptical SDSS-style Petrosian flux in SDSS r-band (using r-band aperture) (NSA)
    nsa_elpetro_flux_i real NOT NULL, --/F nsa_elpetro_flux 5 --/U nanomaggies --/D Elliptical SDSS-style Petrosian flux in SDSS i-band (using r-band aperture) (NSA)
    nsa_elpetro_flux_z real NOT NULL, --/F nsa_elpetro_flux 6 --/U nanomaggies --/D Elliptical SDSS-style Petrosian flux in SDSS z-band (using r-band aperture) (NSA)
    nsa_elpetro_flux_ivar_f real NOT NULL, --/F nsa_elpetro_flux_ivar 0 --/U nanomaggies^{-2} --/D Inverse variance of nsa_elpetro_flux_f (NSA)
    nsa_elpetro_flux_ivar_n real NOT NULL, --/F nsa_elpetro_flux_ivar 1 --/U nanomaggies^{-2} --/D Inverse variance of nsa_elpetro_flux_n (NSA)
    nsa_elpetro_flux_ivar_u real NOT NULL, --/F nsa_elpetro_flux_ivar 2 --/U nanomaggies^{-2} --/D Inverse variance of nsa_elpetro_flux_u (NSA)
    nsa_elpetro_flux_ivar_g real NOT NULL, --/F nsa_elpetro_flux_ivar 3 --/U nanomaggies^{-2} --/D Inverse variance of nsa_elpetro_flux_g (NSA)
    nsa_elpetro_flux_ivar_r real NOT NULL, --/F nsa_elpetro_flux_ivar 4 --/U nanomaggies^{-2} --/D Inverse variance of nsa_elpetro_flux_r (NSA)
    nsa_elpetro_flux_ivar_i real NOT NULL, --/F nsa_elpetro_flux_ivar 5 --/U nanomaggies^{-2} --/D Inverse variance of nsa_elpetro_flux_i (NSA)
    nsa_elpetro_flux_ivar_z real NOT NULL, --/F nsa_elpetro_flux_ivar 6 --/U nanomaggies^{-2} --/D Inverse variance of nsa_elpetro_flux_z (NSA)
    nsa_elpetro_th50_r_original real NOT NULL, --/F nsa_elpetro_th50_r --/U arcsec --/D Elliptical Petrosian 50% light radius in SDSS r-band (NSA)
    nsa_elpetro_th50_f real NOT NULL, --/F nsa_elpetro_th50 0 --/U arcsec --/D Elliptical Petrosian 50% light radius in GALEX far-UV (NSA)
    nsa_elpetro_th50_n real NOT NULL, --/F nsa_elpetro_th50 1 --/U arcsec --/D Elliptical Petrosian 50% light radius in GALEX near-UV (NSA)
    nsa_elpetro_th50_u real NOT NULL, --/F nsa_elpetro_th50 2 --/U arcsec --/D Elliptical Petrosian 50% light radius in SDSS u-band (NSA)
    nsa_elpetro_th50_g real NOT NULL, --/F nsa_elpetro_th50 3 --/U arcsec --/D Elliptical Petrosian 50% light radius in SDSS g-band (NSA)
    nsa_elpetro_th50_r real NOT NULL, --/F nsa_elpetro_th50 4 --/U arcsec --/D Elliptical Petrosian 50% light radius in SDSS r-band (NSA)
    nsa_elpetro_th50_i real NOT NULL, --/F nsa_elpetro_th50 5 --/U arcsec --/D Elliptical Petrosian 50% light radius in SDSS i-band (NSA)
    nsa_elpetro_th50_z real NOT NULL, --/F nsa_elpetro_th50 6 --/U arcsec --/D Elliptical Petrosian 50% light radius in SDSS z-band (NSA)
    nsa_elpetro_phi real NOT NULL, --/U deg --/D Position angle (east of north) used for elliptical apertures (for this version, same as ba90) (NSA)
    nsa_elpetro_ba real NOT NULL, --/D Axis ratio used for elliptical apertures (for this version, same as ba90) (NSA)
    nsa_sersic_mass real NOT NULL, --/U solar mass --/D Stellar mass from K-correction fit (use with caution) for Sersic fluxes (NSA)
    nsa_sersic_absmag_f real NOT NULL, --/F nsa_sersic_absmag 0 --/U mag --/D Absolute magnitude in rest-frame GALEX near-UV, from Sersic fluxes (NSA)
    nsa_sersic_absmag_n real NOT NULL, --/F nsa_sersic_absmag 1 --/U mag --/D Absolute magnitude in rest-frame GALEX far-UV, from Sersic fluxes (NSA)
    nsa_sersic_absmag_u real NOT NULL, --/F nsa_sersic_absmag 2 --/U mag --/D Absolute magnitude in rest-frame SDSS u-band, from Sersic fluxes (NSA)
    nsa_sersic_absmag_g real NOT NULL, --/F nsa_sersic_absmag 3 --/U mag --/D Absolute magnitude in rest-frame SDSS g-band, from Sersic fluxes (NSA)
    nsa_sersic_absmag_r real NOT NULL, --/F nsa_sersic_absmag 4 --/U mag --/D Absolute magnitude in rest-frame SDSS r-band, from Sersic fluxes (NSA)
    nsa_sersic_absmag_i real NOT NULL, --/F nsa_sersic_absmag 5 --/U mag --/D Absolute magnitude in rest-frame SDSS i-band, from Sersic fluxes (NSA)
    nsa_sersic_absmag_z real NOT NULL, --/F nsa_sersic_absmag 6 --/U mag --/D Absolute magnitude in rest-frame SDSS z-band, from Sersic fluxes (NSA)
    nsa_sersic_amivar_f real NOT NULL, --/F nsa_sersic_amivar 0 --/U mag^{-2} --/D Inverse variance in nsa_sersic_absmag_f (NSA)
    nsa_sersic_amivar_n real NOT NULL, --/F nsa_sersic_amivar 1 --/U mag^{-2} --/D Inverse variance in nsa_sersic_absmag_n (NSA)
    nsa_sersic_amivar_u real NOT NULL, --/F nsa_sersic_amivar 2 --/U mag^{-2} --/D Inverse variance in nsa_sersic_absmag_u (NSA)
    nsa_sersic_amivar_g real NOT NULL, --/F nsa_sersic_amivar 3 --/U mag^{-2} --/D Inverse variance in nsa_sersic_absmag_g (NSA)
    nsa_sersic_amivar_r real NOT NULL, --/F nsa_sersic_amivar 4 --/U mag^{-2} --/D Inverse variance in nsa_sersic_absmag_r (NSA)
    nsa_sersic_amivar_i real NOT NULL, --/F nsa_sersic_amivar 5 --/U mag^{-2} --/D Inverse variance in nsa_sersic_absmag_i (NSA)
    nsa_sersic_amivar_z real NOT NULL, --/F nsa_sersic_amivar 6 --/U mag^{-2} --/D Inverse variance in nsa_sersic_absmag_z (NSA)
    nsa_sersic_flux_f real NOT NULL, --/F nsa_sersic_flux 0 --/U nanomaggies --/D Two-dimensional, single-component Sersic fit flux in GALEX far-UV (fit using r-band structural parameters) (NSA)
    nsa_sersic_flux_n real NOT NULL, --/F nsa_sersic_flux 1 --/U nanomaggies --/D Two-dimensional, single-component Sersic fit flux in GALEX near-UV (fit using r-band structural parameters) (NSA)
    nsa_sersic_flux_u real NOT NULL, --/F nsa_sersic_flux 2 --/U nanomaggies --/D Two-dimensional, single-component Sersic fit flux in SDSS u-band (fit using r-band structural parameters) (NSA)
    nsa_sersic_flux_g real NOT NULL, --/F nsa_sersic_flux 3 --/U nanomaggies --/D Two-dimensional, single-component Sersic fit flux in SDSS g-band (fit using r-band structural parameters) (NSA)
    nsa_sersic_flux_r real NOT NULL, --/F nsa_sersic_flux 4 --/U nanomaggies --/D Two-dimensional, single-component Sersic fit flux in SDSS r-band (fit using r-band structural parameters) (NSA)
    nsa_sersic_flux_i real NOT NULL, --/F nsa_sersic_flux 5 --/U nanomaggies --/D Two-dimensional, single-component Sersic fit flux in SDSS i-band (fit using r-band structural parameters) (NSA)
    nsa_sersic_flux_z real NOT NULL, --/F nsa_sersic_flux 6 --/U nanomaggies --/D Two-dimensional, single-component Sersic fit flux in SDSS z-band (fit using r-band structural parameters) (NSA)
    nsa_sersic_flux_ivar_f real NOT NULL, --/F nsa_sersic_flux_ivar 0 --/U nanomaggies^{-2} --/D Inverse variance of nsa_sersic_flux_f (NSA)
    nsa_sersic_flux_ivar_n real NOT NULL, --/F nsa_sersic_flux_ivar 1 --/U nanomaggies^{-2} --/D Inverse variance of nsa_sersic_flux_n (NSA)
    nsa_sersic_flux_ivar_u real NOT NULL, --/F nsa_sersic_flux_ivar 2 --/U nanomaggies^{-2} --/D Inverse variance of nsa_sersic_flux_u (NSA)
    nsa_sersic_flux_ivar_g real NOT NULL, --/F nsa_sersic_flux_ivar 3 --/U nanomaggies^{-2} --/D Inverse variance of nsa_sersic_flux_g (NSA)
    nsa_sersic_flux_ivar_r real NOT NULL, --/F nsa_sersic_flux_ivar 4 --/U nanomaggies^{-2} --/D Inverse variance of nsa_sersic_flux_r (NSA)
    nsa_sersic_flux_ivar_i real NOT NULL, --/F nsa_sersic_flux_ivar 5 --/U nanomaggies^{-2} --/D Inverse variance of nsa_sersic_flux_i (NSA)
    nsa_sersic_flux_ivar_z real NOT NULL, --/F nsa_sersic_flux_ivar 6 --/U nanomaggies^{-2} --/D Inverse variance of nsa_sersic_flux_z (NSA)
    nsa_sersic_th50 real NOT NULL, --/U arcsec --/D 50% light radius of two-dimensional, single-component Sersic fit to r-band (NSA)
    nsa_sersic_phi real NOT NULL, --/U deg --/D Angle (E of N) of major axis in two-dimensional, single-component Sersic fit in r-band (NSA)
    nsa_sersic_ba real NOT NULL, --/D Axis ratio b/a from two-dimensional, single-component Sersic fit in r-band (NSA)
    nsa_sersic_n real NOT NULL, --/D Sersic index from two-dimensional, single-component Sersic fit in r-band (NSA)
    nsa_petro_flux_f real NOT NULL, --/F nsa_petro_flux 0 --/U nanomaggies --/D Azimuthally-averaged SDSS-style Petrosian flux in GALEX far-UV (using r-band aperture) (NSA)
    nsa_petro_flux_n real NOT NULL, --/F nsa_petro_flux 1 --/U nanomaggies --/D Azimuthally-averaged SDSS-style Petrosian flux in GALEX far-UV (using r-band aperture) (NSA)
    nsa_petro_flux_u real NOT NULL, --/F nsa_petro_flux 2 --/U nanomaggies --/D Azimuthally-averaged SDSS-style Petrosian flux in SDSS u-band (using r-band aperture) (NSA)
    nsa_petro_flux_g real NOT NULL, --/F nsa_petro_flux 3 --/U nanomaggies --/D Azimuthally-averaged SDSS-style Petrosian flux in SDSS g-band (using r-band aperture) (NSA)
    nsa_petro_flux_r real NOT NULL, --/F nsa_petro_flux 4 --/U nanomaggies --/D Azimuthally-averaged SDSS-style Petrosian flux in SDSS r-band (using r-band aperture) (NSA)
    nsa_petro_flux_i real NOT NULL, --/F nsa_petro_flux 5 --/U nanomaggies --/D Azimuthally-averaged SDSS-style Petrosian flux in SDSS i-band (using r-band aperture) (NSA)
    nsa_petro_flux_z real NOT NULL, --/F nsa_petro_flux 6 --/U nanomaggies --/D Azimuthally-averaged SDSS-style Petrosian flux in SDSS z-band (using r-band aperture) (NSA)
    nsa_petro_flux_ivar_f real NOT NULL, --/F nsa_petro_flux_ivar 0 --/U nanomaggies^{-2} --/D Inverse variance of nsa_petro_flux_f (NSA)
    nsa_petro_flux_ivar_n real NOT NULL, --/F nsa_petro_flux_ivar 1 --/U nanomaggies^{-2} --/D Inverse variance of nsa_petro_flux_n (NSA)
    nsa_petro_flux_ivar_u real NOT NULL, --/F nsa_petro_flux_ivar 2 --/U nanomaggies^{-2} --/D Inverse variance of nsa_petro_flux_u (NSA)
    nsa_petro_flux_ivar_g real NOT NULL, --/F nsa_petro_flux_ivar 3 --/U nanomaggies^{-2} --/D Inverse variance of nsa_petro_flux_g (NSA)
    nsa_petro_flux_ivar_r real NOT NULL, --/F nsa_petro_flux_ivar 4 --/U nanomaggies^{-2} --/D Inverse variance of nsa_petro_flux_r (NSA)
    nsa_petro_flux_ivar_i real NOT NULL, --/F nsa_petro_flux_ivar 5 --/U nanomaggies^{-2} --/D Inverse variance of nsa_petro_flux_i (NSA)
    nsa_petro_flux_ivar_z real NOT NULL, --/F nsa_petro_flux_ivar 6 --/U nanomaggies^{-2} --/D Inverse variance of nsa_petro_flux_z (NSA)
    nsa_petro_th50 real NOT NULL, --/U arcsec --/D Azimuthally averaged SDSS-style Petrosian 50% light radius (derived from r band) (NSA)
    nsa_extinction_f real NOT NULL, --/F nsa_extinction 0 --/U mag --/D Galactic extinction from Schlegel, Finkbeiner, and Davis (1997), in GALEX far-UV (NSA)
    nsa_extinction_n real NOT NULL, --/F nsa_extinction 1 --/U mag --/D Galactic extinction from Schlegel, Finkbeiner, and Davis (1997), in GALEX near-UV (NSA)
    nsa_extinction_u real NOT NULL, --/F nsa_extinction 2 --/U mag --/D Galactic extinction from Schlegel, Finkbeiner, and Davis (1997), in SDSS u-band (NSA)
    nsa_extinction_g real NOT NULL, --/F nsa_extinction 3 --/U mag --/D Galactic extinction from Schlegel, Finkbeiner, and Davis (1997), in SDSS g-band (NSA)
    nsa_extinction_r real NOT NULL, --/F nsa_extinction 4 --/U mag --/D Galactic extinction from Schlegel, Finkbeiner, and Davis (1997), in SDSS r-band (NSA)
    nsa_extinction_i real NOT NULL, --/F nsa_extinction 5 --/U mag --/D Galactic extinction from Schlegel, Finkbeiner, and Davis (1997), in SDSS i-band (NSA)
    nsa_extinction_z real NOT NULL, --/F nsa_extinction 6 --/U mag --/D Galactic extinction from Schlegel, Finkbeiner, and Davis (1997), in SDSS z-band (NSA)
    nsa_iauname varchar(20) NOT NULL, --/D IAU-style designation based on RA/Dec (NSA)
    nsa_subdir varchar(128) NOT NULL, --/D Subdirectory for images in the NSA 'detect' directory (NSA)
    nsa_pid int NOT NULL, --/D Parent id within mosaic for this object (NSA)
    nsa_nsaid int NOT NULL, --/D Unique ID within NSA v1 catalog (NSA)
    catind int NOT NULL, --/D Zero-indexed row within the input NSA v1 catalog (NSA)
    manga_target1 bigint NOT NULL, --/D Targeting bitmask for main sample targets
    mangaID varchar(20) NOT NULL, --/D Unique ID for each manga target
    zmin real NOT NULL, --/D The minimum redshift at which the galaxy could still have been included in the Primary sample
    zmax real NOT NULL, --/D The maximum redshift at which the galaxy could still have been included in the Primary sample
    szmin real NOT NULL, --/D The minimum redshift at which the galaxy could still have been included in the Secondary sample
    szmax real NOT NULL, --/D The maximum redshift at which the galaxy could still have been included in the Secondary sample
    ezmin real NOT NULL, --/D The minimum redshift at which the galaxy could still have been included in the Primary+ sample
    ezmax real NOT NULL, --/D The minimum redshift at which the galaxy could still have been included in the Primary+ sample
    ranflag bit NOT NULL, --/D Set to 1 if a target is to be included after random sampling to produce the correct proportions of each sample, otherwise 0
    manga_tileids int NOT NULL, --/D IDs of all tiles that overlap a galaxy's position
    manga_tileid int NOT NULL, --/D The ID of the tile to which this object has been allocated
    tilera float NOT NULL, --/U deg --/D The Right Ascension (J2000) of the tile to which this object has been allocated
    tiledec float NOT NULL, --/U deg --/D The Declination (J2000) of the tile to which this object has been allocated
    ifutargetsize smallint NOT NULL, --/U fibers --/D The ideal IFU size for this object. The intended IFU size is equal to IFUTargetSize except if IFUTargetSize > 127 when it is 127, or < 19 when it is 19
    ifudesignsize smallint NOT NULL, --/U fibers --/D The allocated IFU size (0 = "unallocated")
    ifudesignwrongsize smallint NOT NULL, --/U fibers --/D The allocated IFU size if the intended IFU size was not available
    ifu_ra float NOT NULL, --/U deg --/D The Right Ascension (J2000) of the IFU center
    ifu_dec float NOT NULL, --/U deg --/D The Right Declination (J2000) of the IFU center
    badphotflag bit NOT NULL, --/D Set to 1 if target has been visually inspected to have bad photometry and should not be observed
    starflag bit NOT NULL, --/D Set to 1 if target lies close to a bright star should not be observed
    object_ra float NOT NULL, --/U deg --/D The best estimate of the Right Ascension (J2000) of the center of the object. Normally the same as CATALOG_RA but can be modified particularly as a result of visual inspection
    object_dec float NOT NULL, --/U deg --/D The best estimate of the Declination (J2000) of the center of the object. Normally the same as CATALOG_RA but can be modified particularly as a result of visual inspection
    obsflag bit NOT NULL, --/D Set to 1 if the target has already been included on a plate set to be observed at the time the IFU allocation was made, otherwise 0
    catindanc int NOT NULL, --/D Zero-indexed row within the applicable ancillary catalog
    ifudesignsizemain smallint NOT NULL, --/U fibers --/D The allocated IFU size prior to the addition of the ancillary samples (0 = "unallocated")
    ifuminsizeanc smallint NOT NULL, --/U fibers --/D The minimum acceptable IFU size for the ancillary program
    ifutargsizeanc smallint NOT NULL, --/U fibers --/D The ideal IFU size for the ancillary program
    manga_target3 bigint NOT NULL, --/D Targeting bitmask for the ancillary samples
    priorityanc int NOT NULL, --/D The ancillary program's priority for this object
    unalloc smallint NOT NULL, --/D Set to 1 if an ancillary target has been allocated an IFU the was not allocated to a main sample galaxy, otherwise 0
)
GO
--


--=========================================================
IF EXISTS (SELECT name FROM sysobjects
         WHERE xtype='U' AND name = 'nsatlas')
	DROP TABLE nsatlas
GO
--
EXEC spSetDefaultFileGroup 'nsatlas'
GO
CREATE TABLE nsatlas (
------------------------------------------------------------------------------
--/H NASA-Sloan Atlas catalog
------------------------------------------------------------------------------
--/T The NASA-Sloan Atlas (NSA) catalog, v1_0_1. This NSA sample was
--/T selected to include virtually all known redshifts out to about
--/T z &lt; 0.15 for galaxies within the coverage of SDSS DR11. For each
--/T such galaxy, we have created image mosaics from SDSS and GALEX and
--/T rephotometered the ugriz bands plus the far and near ultraviolet
--/T bands in a self-consistent manner. After cleaning a number of
--/T suspicious cases the final catalog contains about 640,000
--/T galaxies. See http://nsatlas.org for more information.
--/T 
--/T We recommend the use of the elliptical Petrosian photometry from 
--/T this catalog. K-corrected absolute magnitudes are provided using
--/T kcorrect v4_2. 
------------------------------------------------------------------------------
	nsaid     int  NOT NULL,  --/D Unique ID within NSA v1 catalog
	iauname   varchar(20)  NOT NULL,  --/D IAU-style designation based on RA/Dec
	subdir    varchar(20)  NOT NULL,  --/D Subdirectory for images in the NSA 'detect' directory
	ra        float  NOT NULL,  --/U deg  --/D Right Ascension of measured object center (J2000)
	dec       float  NOT NULL,  --/U deg  --/D Declination of measured object center (J2000)
	isdss     int  NOT NULL,  --/D Zero-indexed row of SDSS source file for NSA (-1 if no match)
	ined      int  NOT NULL,  --/D Zero-indexed row of NED source file for NSA (-1 if no match)
	isixdf    int  NOT NULL,  --/D Zero-indexed row of 6dFGRS source file for NSA (-1 if no match)
	ialfalfa  int  NOT NULL,  --/D Zero-indexed row of ALFALFA source file for NSA (-1 if no match)
	izcat     int  NOT NULL,  --/D Zero-indexed row of ZCAT source file for NSA (-1 if no match)
	itwodf    int  NOT NULL,  --/D Zero-indexed row of 2dFGRS source file for NSA (-1 if no match)
	mag       real  NOT NULL,  --/U mag  --/D Nominal B magnitude; not reliable, only used to set size of image for analysis
	z         real  NOT NULL,  --/D Heliocentric redshift
	zsrc      varchar(20)  NOT NULL,  --/D Source of redshift determination (alfalfa, ned, sdss, sixdf, twodf, or zcat)
	size      real  NOT NULL,  --/U deg  --/D Size of analyzed mosaics
	run       smallint  NOT NULL,  --/D SDSS drift scan run covering catalog position (racat, deccat)
	camcol    tinyint  NOT NULL,  --/D SDSS camcol covering catalog position (racat, deccat)
	field     smallint  NOT NULL,  --/D SDSS field covering catalog position (racat, deccat)
	rerun     varchar(20)  NOT NULL,  --/D Photometric rerun of SDSS used to determine SDSS coverage
	xpos      real  NOT NULL,  --/U pix  --/D SDSS camera column of catalog position (racat, deccat)
	ypos      real  NOT NULL,  --/U pix  --/D SDSS camera row of catalog position (racat, deccat)
	zdist     real  NOT NULL,  --/D Distance estimate using pecular velocity model of Willick et al. (1997), expressed as a redshift equivalent; multiply by <var>c/H<sub>0</sub></var> for Mpc
	plate  int  NOT NULL,   --/D SDSS plate number (0 if not observed)
	fiberid  smallint  NOT NULL,   --/D SDSS fiber number (0 if not observed)
	mjd  int  NOT NULL,   --/U days  --/D SDSS MJD of spectroscopic observation (0 if not observed)
	racat  float  NOT NULL,   --/U deg  --/D Right Ascension of catalog object (J2000)
	deccat  float  NOT NULL,   --/U deg  --/D Declination of catalog object (J2000)
	survey  varchar(20)  NOT NULL,   --/D Survey within SDSS that observed the plate
	programname  varchar(20)  NOT NULL,   --/D Program name within the survey that observed the plate
	platequality  varchar(20)  NOT NULL,   --/D Quality of plate
	tile  int  NOT NULL,   --/D Tile number for plate containing spectrum
	plug_ra  float  NOT NULL,   --/U deg  --/D Right Ascension of spectroscopic fiber (J2000)
	plug_dec  float  NOT NULL,   --/U deg  --/D Declination of spectroscopic fiber (J2000)
	in_dr7_lss  tinyint  NOT NULL,   --/D Set to 1 if spectrum is in SDSS Legacy survey large-scale structure sample (based on the NYU Value Added Galaxy Catalog for DR7, specifically lss_geometry.dr72.ply)
	petro_ba_el  real  NOT NULL,   --/D Axis ratio used for elliptical apertures (for this version, same as ba90)
	petro_phi_el  real  NOT NULL,   --/U deg  --/D Position angle (east of north) used for elliptical apertures (for this version, same as ba90)
	petrotheta_el  real  NOT NULL,   --/U arcsec  --/D Elliptical SDSS-style Petrosian radius (r-band)
	petroflux_el_f  real  NOT NULL,   --/F petroflux_el 0 --/U nanomaggies  --/D Elliptical SDSS-style Petrosian flux in GALEX far-UV (using r-band aperture)
	petroflux_el_n  real  NOT NULL,   --/F petroflux_el 1 --/U nanomaggies  --/D Elliptical SDSS-style Petrosian flux in GALEX near-UV (using r-band aperture)
	petroflux_el_u  real  NOT NULL,   --/F petroflux_el 2 --/U nanomaggies  --/D Elliptical SDSS-style Petrosian flux in SDSS u-band (using r-band aperture)
	petroflux_el_g  real  NOT NULL,   --/F petroflux_el 3 --/U nanomaggies  --/D Elliptical SDSS-style Petrosian flux in SDSS g-band (using r-band aperture)
	petroflux_el_r  real  NOT NULL,   --/F petroflux_el 4 --/U nanomaggies  --/D Elliptical SDSS-style Petrosian flux in SDSS r-band (using r-band aperture)
	petroflux_el_i  real  NOT NULL,   --/F petroflux_el 5 --/U nanomaggies  --/D Elliptical SDSS-style Petrosian flux in SDSS i-band (using r-band aperture)
	petroflux_el_z  real  NOT NULL,   --/F petroflux_el 6 --/U nanomaggies  --/D Elliptical SDSS-style Petrosian flux in SDSS z-band (using r-band aperture)
	petroflux_ivar_el_f  real  NOT NULL,   --/F petroflux_ivar_el 0 --/U nanomaggies^{-2}  --/D Inverse variance of petroflux_el_f
	petroflux_ivar_el_n  real  NOT NULL,   --/F petroflux_ivar_el 1 --/U nanomaggies^{-2}  --/D Inverse variance of petroflux_el_n
	petroflux_ivar_el_u  real  NOT NULL,   --/F petroflux_ivar_el 2 --/U nanomaggies^{-2}  --/D Inverse variance of petroflux_el_u
	petroflux_ivar_el_g  real  NOT NULL,   --/F petroflux_ivar_el 3 --/U nanomaggies^{-2}  --/D Inverse variance of petroflux_el_g
	petroflux_ivar_el_r  real  NOT NULL,   --/F petroflux_ivar_el 4 --/U nanomaggies^{-2}  --/D Inverse variance of petroflux_el_r
	petroflux_ivar_el_i  real  NOT NULL,   --/F petroflux_ivar_el 5 --/U nanomaggies^{-2}  --/D Inverse variance of petroflux_el_i
	petroflux_ivar_el_z  real  NOT NULL,   --/F petroflux_ivar_el 6 --/U nanomaggies^{-2}  --/D Inverse variance of petroflux_el_z
	petroth50_el_f  real  NOT NULL,   --/F petroth50_el 0 --/U arcsec  --/D Elliptical Petrosian 50% light radius in GALEX far-UV
	petroth50_el_n  real  NOT NULL,   --/F petroth50_el 1 --/U arcsec  --/D Elliptical Petrosian 50% light radius in GALEX near-UV
	petroth50_el_u  real  NOT NULL,   --/F petroth50_el 2 --/U arcsec  --/D Elliptical Petrosian 50% light radius in SDSS u-band
	petroth50_el_g  real  NOT NULL,   --/F petroth50_el 3 --/U arcsec  --/D Elliptical Petrosian 50% light radius in SDSS g-band
	petroth50_el_r  real  NOT NULL,   --/F petroth50_el 4 --/U arcsec  --/D Elliptical Petrosian 50% light radius in SDSS r-band
	petroth50_el_i  real  NOT NULL,   --/F petroth50_el 5 --/U arcsec  --/D Elliptical Petrosian 50% light radius in SDSS i-band
	petroth50_el_z  real  NOT NULL,   --/F petroth50_el 6 --/U arcsec  --/D Elliptical Petrosian 50% light radius in SDSS z-band
	petroth90_el_f  real  NOT NULL,   --/F petroth90_el 0 --/U arcsec  --/D Elliptical Petrosian 90% light radius in GALEX far-UV
	petroth90_el_n  real  NOT NULL,   --/F petroth90_el 1 --/U arcsec  --/D Elliptical Petrosian 90% light radius in GALEX near-UV
	petroth90_el_u  real  NOT NULL,   --/F petroth90_el 2 --/U arcsec  --/D Elliptical Petrosian 90% light radius in SDSS u-band
	petroth90_el_g  real  NOT NULL,   --/F petroth90_el 3 --/U arcsec  --/D Elliptical Petrosian 90% light radius in SDSS g-band
	petroth90_el_r  real  NOT NULL,   --/F petroth90_el 4 --/U arcsec  --/D Elliptical Petrosian 90% light radius in SDSS r-band
	petroth90_el_i  real  NOT NULL,   --/F petroth90_el 5 --/U arcsec  --/D Elliptical Petrosian 90% light radius in SDSS i-band
	petroth90_el_z  real  NOT NULL,   --/F petroth90_el 6 --/U arcsec  --/D Elliptical Petrosian 90% light radius in SDSS z-band
	petro_nmgy_el_f  real  NOT NULL,   --/F petro_nmgy_el 0 --/U nanomaggies  --/D Galactic-extinction corrected AB flux in GALEX far-UV used for K-correction (from petroflux_el_f)
	petro_nmgy_el_n  real  NOT NULL,   --/F petro_nmgy_el 1 --/U nanomaggies  --/D Galactic-extinction corrected AB flux in GALEX near-UV used for K-correction (from petroflux_el_f)
	petro_nmgy_el_u  real  NOT NULL,   --/F petro_nmgy_el 2 --/U nanomaggies  --/D Galactic-extinction corrected AB flux in SDSS u-band used for K-correction (from petroflux_el_f)
	petro_nmgy_el_g  real  NOT NULL,   --/F petro_nmgy_el 3 --/U nanomaggies  --/D Galactic-extinction corrected AB flux in SDSS g-band used for K-correction (from petroflux_el_f)
	petro_nmgy_el_r  real  NOT NULL,   --/F petro_nmgy_el 4 --/U nanomaggies  --/D Galactic-extinction corrected AB flux in SDSS r-band used for K-correction (from petroflux_el_f)
	petro_nmgy_el_i  real  NOT NULL,   --/F petro_nmgy_el 5 --/U nanomaggies  --/D Galactic-extinction corrected AB flux in SDSS i-band used for K-correction (from petroflux_el_f)
	petro_nmgy_el_z  real  NOT NULL,   --/F petro_nmgy_el 6 --/U nanomaggies  --/D Galactic-extinction corrected AB flux in SDSS z-band used for K-correction (from petroflux_el_f)
	petro_nmgy_ivar_el_f  real  NOT NULL,   --/F petro_nmgy_ivar_el 0 --/U nanomaggies^{-2}  --/D Inverse variance of petro_nmgy_el_f
	petro_nmgy_ivar_el_n  real  NOT NULL,   --/F petro_nmgy_ivar_el 1 --/U nanomaggies^{-2}  --/D Inverse variance of petro_nmgy_el_n
	petro_nmgy_ivar_el_u  real  NOT NULL,   --/F petro_nmgy_ivar_el 2 --/U nanomaggies^{-2}  --/D Inverse variance of petro_nmgy_el_u
	petro_nmgy_ivar_el_g  real  NOT NULL,   --/F petro_nmgy_ivar_el 3 --/U nanomaggies^{-2}  --/D Inverse variance of petro_nmgy_el_g
	petro_nmgy_ivar_el_r  real  NOT NULL,   --/F petro_nmgy_ivar_el 4 --/U nanomaggies^{-2}  --/D Inverse variance of petro_nmgy_el_r
	petro_nmgy_ivar_el_i  real  NOT NULL,   --/F petro_nmgy_ivar_el 5 --/U nanomaggies^{-2}  --/D Inverse variance of petro_nmgy_el_i
	petro_nmgy_ivar_el_z  real  NOT NULL,   --/F petro_nmgy_ivar_el 6 --/U nanomaggies^{-2}  --/D Inverse variance of petro_nmgy_el_z
	petro_ok_el  smallint  NOT NULL,   --/D For elliptical Petrosian fluxes, 1 if K-correction was performed, 0 if not (should all be 1)
	petro_rnmgy_el_f  real  NOT NULL,   --/F petro_rnmgy_el 0 --/U nanomaggies  --/D Reconstructed AB nanomaggies in GALEX far-UV from K-correction fit, for elliptical Petrosian fluxes
	petro_rnmgy_el_n  real  NOT NULL,   --/F petro_rnmgy_el 1 --/U nanomaggies  --/D Reconstructed AB nanomaggies in GALEX near-UV from K-correction fit, for elliptical Petrosian fluxes
	petro_rnmgy_el_u  real  NOT NULL,   --/F petro_rnmgy_el 2 --/U nanomaggies  --/D Reconstructed AB nanomaggies in SDSS u-band from K-correction fit, for elliptical Petrosian fluxes
	petro_rnmgy_el_g  real  NOT NULL,   --/F petro_rnmgy_el 3 --/U nanomaggies  --/D Reconstructed AB nanomaggies in SDSS g-band from K-correction fit, for elliptical Petrosian fluxes
	petro_rnmgy_el_r  real  NOT NULL,   --/F petro_rnmgy_el 4 --/U nanomaggies  --/D Reconstructed AB nanomaggies in SDSS r-band from K-correction fit, for elliptical Petrosian fluxes
	petro_rnmgy_el_i  real  NOT NULL,   --/F petro_rnmgy_el 5 --/U nanomaggies  --/D Reconstructed AB nanomaggies in SDSS i-band from K-correction fit, for elliptical Petrosian fluxes
	petro_rnmgy_el_z  real  NOT NULL,   --/F petro_rnmgy_el 6 --/U nanomaggies  --/D Reconstructed AB nanomaggies in SDSS z-band from K-correction fit, for elliptical Petrosian fluxes
	petro_absmag_el_f  real  NOT NULL,   --/F petro_absmag_el 0 --/U mag  --/D Absolute magnitude in rest-frame GALEX far-UV, from elliptical Petrosian fluxes
	petro_absmag_el_n  real  NOT NULL,   --/F petro_absmag_el 1 --/U mag  --/D Absolute magnitude in rest-frame GALEX near-UV, from elliptical Petrosian fluxes
	petro_absmag_el_u  real  NOT NULL,   --/F petro_absmag_el 2 --/U mag  --/D Absolute magnitude in rest-frame SDSS u-band, from elliptical Petrosian fluxes
	petro_absmag_el_g  real  NOT NULL,   --/F petro_absmag_el 3 --/U mag  --/D Absolute magnitude in rest-frame SDSS g-band, from elliptical Petrosian fluxes
	petro_absmag_el_r  real  NOT NULL,   --/F petro_absmag_el 4 --/U mag  --/D Absolute magnitude in rest-frame SDSS r-band, from elliptical Petrosian fluxes
	petro_absmag_el_i  real  NOT NULL,   --/F petro_absmag_el 5 --/U mag  --/D Absolute magnitude in rest-frame SDSS i-band, from elliptical Petrosian fluxes
	petro_absmag_el_z  real  NOT NULL,   --/F petro_absmag_el 6 --/U mag  --/D Absolute magnitude in rest-frame SDSS z-band, from elliptical Petrosian fluxes
	petro_amivar_el_f  real  NOT NULL,   --/F petro_amivar_el 0 --/U mag^{-2}  --/D Inverse variance of petro_absmag_el_f
	petro_amivar_el_n  real  NOT NULL,   --/F petro_amivar_el 1 --/U mag^{-2}  --/D Inverse variance of petro_absmag_el_n
	petro_amivar_el_u  real  NOT NULL,   --/F petro_amivar_el 2 --/U mag^{-2}  --/D Inverse variance of petro_absmag_el_u
	petro_amivar_el_g  real  NOT NULL,   --/F petro_amivar_el 3 --/U mag^{-2}  --/D Inverse variance of petro_absmag_el_g
	petro_amivar_el_r  real  NOT NULL,   --/F petro_amivar_el 4 --/U mag^{-2}  --/D Inverse variance of petro_absmag_el_r
	petro_amivar_el_i  real  NOT NULL,   --/F petro_amivar_el 5 --/U mag^{-2}  --/D Inverse variance of petro_absmag_el_i
	petro_amivar_el_z  real  NOT NULL,   --/F petro_amivar_el 6 --/U mag^{-2}  --/D Inverse variance of petro_absmag_el_z
	petro_kcorrect_el_f  real  NOT NULL,   --/F petro_kcorrect_el 0 --/U mag  --/D K-correction value used for absolute magnitude in the GALEX far-UV for elliptical Petrosian fluxes 
	petro_kcorrect_el_n  real  NOT NULL,   --/F petro_kcorrect_el 1 --/U mag  --/D K-correction value used for absolute magnitude in the GALEX near-UV for elliptical Petrosian fluxes 
	petro_kcorrect_el_u  real  NOT NULL,   --/F petro_kcorrect_el 2 --/U mag  --/D K-correction value used for absolute magnitude in the SDSS u-band for elliptical Petrosian fluxes 
	petro_kcorrect_el_g  real  NOT NULL,   --/F petro_kcorrect_el 3 --/U mag  --/D K-correction value used for absolute magnitude in the SDSS g-band for elliptical Petrosian fluxes 
	petro_kcorrect_el_r  real  NOT NULL,   --/F petro_kcorrect_el 4 --/U mag  --/D K-correction value used for absolute magnitude in the SDSS r-band for elliptical Petrosian fluxes 
	petro_kcorrect_el_i  real  NOT NULL,   --/F petro_kcorrect_el 5 --/U mag  --/D K-correction value used for absolute magnitude in the SDSS i-band for elliptical Petrosian fluxes 
	petro_kcorrect_el_z  real  NOT NULL,   --/F petro_kcorrect_el 6 --/U mag  --/D K-correction value used for absolute magnitude in the SDSS z-band for elliptical Petrosian fluxes 
	petro_kcoeff_el_0  real  NOT NULL,   --/F petro_kcoeff_el 0  --/D Coefficient 0 of templates in K-correction fit (see Blanton &amp; Roweis 2007) for elliptical Petrosian fluxes
	petro_kcoeff_el_1  real  NOT NULL,   --/F petro_kcoeff_el 1  --/D Coefficient 1 of templates in K-correction fit (see Blanton &amp; Roweis 2007) for elliptical Petrosian fluxes
	petro_kcoeff_el_2  real  NOT NULL,   --/F petro_kcoeff_el 2  --/D Coefficient 2 of templates in K-correction fit (see Blanton &amp; Roweis 2007) for elliptical Petrosian fluxes
	petro_kcoeff_el_3  real  NOT NULL,   --/F petro_kcoeff_el 3  --/D Coefficient 3 of templates in K-correction fit (see Blanton &amp; Roweis 2007) for elliptical Petrosian fluxes
	petro_kcoeff_el_4  real  NOT NULL,   --/F petro_kcoeff_el 4  --/D Coefficient 4 of templates in K-correction fit (see Blanton &amp; Roweis 2007) for elliptical Petrosian fluxes
	petro_mass_el  real  NOT NULL,   --/U  solar masses --/D Stellar mass from K-correction fit (use with caution) for elliptical Petrosian fluxes
	petro_mtol_el_f  real  NOT NULL,   --/F petro_mtol_el 0 --/U solar  --/D Mass-to-light ratio derived in K-correction fit for GALEX far-UV for elliptical Petrosian fluxes
	petro_mtol_el_n  real  NOT NULL,   --/F petro_mtol_el 1 --/U solar  --/D Mass-to-light ratio derived in K-correction fit for GALEX near-UV for elliptical Petrosian fluxes
	petro_mtol_el_u  real  NOT NULL,   --/F petro_mtol_el 2 --/U solar  --/D Mass-to-light ratio derived in K-correction fit for SDSS u-band for elliptical Petrosian fluxes
	petro_mtol_el_g  real  NOT NULL,   --/F petro_mtol_el 3 --/U solar  --/D Mass-to-light ratio derived in K-correction fit for SDSS g-band for elliptical Petrosian fluxes
	petro_mtol_el_r  real  NOT NULL,   --/F petro_mtol_el 4 --/U solar  --/D Mass-to-light ratio derived in K-correction fit for SDSS r-band for elliptical Petrosian fluxes
	petro_mtol_el_i  real  NOT NULL,   --/F petro_mtol_el 5 --/U solar  --/D Mass-to-light ratio derived in K-correction fit for SDSS i-band for elliptical Petrosian fluxes
	petro_mtol_el_z  real  NOT NULL,   --/F petro_mtol_el 6 --/U solar  --/D Mass-to-light ratio derived in K-correction fit for SDSS z-band for elliptical Petrosian fluxes
	petro_b300_el  real  NOT NULL,   --/D Star-formation rate b-parameter (current over past average) for last 300 Myrs (from K-correction fit, use with caution) for elliptical Petrosian fluxes
	petro_b1000_el  real  NOT NULL,  --/D Star-formation rate b-parameter (current over past average) for last 1 Gyrs (from K-correction fit, use with caution) for elliptical Petrosian fluxes
	petro_mets_el  real  NOT NULL,   --/D Metallicity from K-correction fit (use with caution) for elliptical Petrosian fluxes
	petrotheta  real  NOT NULL,   --/U arcsec  --/D Azimuthally averaged SDSS-style Petrosian radius (derived from r band)
	petroth50  real  NOT NULL,   --/U arcsec  --/D Azimuthally averaged SDSS-style Petrosian 50% light radius (derived from r band)
	petroth90  real  NOT NULL,   --/U arcsec  --/D Azimuthally averaged SDSS-style Petrosian 90% light radius (derived from r band)
	ba50  real  NOT NULL,   --/D Axis ratio b/a from Stokes parameters at 50% light radius (based on r-band)
	phi50  real  NOT NULL,   --/U deg  --/D Angle (E of N) from Stokes parameters at 50% light radius(based on r-band)
	ba90  real  NOT NULL,   --/D Axis ratio b/a from Stokes parameters at 90% light radius (based on r-band)
	phi90  real  NOT NULL,   --/U deg  --/D Angle (E of N) from Stokes parameters at 90% light radius(based on r-band)
	petroflux_f  real  NOT NULL,   --/F petroflux 0 --/U nanomaggies  --/D Azimuthally-averaged SDSS-style Petrosian flux in GALEX far-UV (using r-band aperture)
	petroflux_n  real  NOT NULL,   --/F petroflux 1 --/U nanomaggies  --/D Azimuthally-averaged SDSS-style Petrosian flux in GALEX far-UV (using r-band aperture)
	petroflux_u  real  NOT NULL,   --/F petroflux 2 --/U nanomaggies  --/D Azimuthally-averaged SDSS-style Petrosian flux in SDSS u-band (using r-band aperture)
	petroflux_g  real  NOT NULL,   --/F petroflux 3 --/U nanomaggies  --/D Azimuthally-averaged SDSS-style Petrosian flux in SDSS g-band (using r-band aperture)
	petroflux_r  real  NOT NULL,   --/F petroflux 4 --/U nanomaggies  --/D Azimuthally-averaged SDSS-style Petrosian flux in SDSS r-band (using r-band aperture)
	petroflux_i  real  NOT NULL,   --/F petroflux 5 --/U nanomaggies  --/D Azimuthally-averaged SDSS-style Petrosian flux in SDSS i-band (using r-band aperture)
	petroflux_z  real  NOT NULL,   --/F petroflux 6 --/U nanomaggies  --/D Azimuthally-averaged SDSS-style Petrosian flux in SDSS z-band (using r-band aperture)
	petroflux_ivar_f  real  NOT NULL,   --/F petroflux_ivar 0 --/U nanomaggies^{-2}  --/D Inverse variance of petroflux_f
	petroflux_ivar_n  real  NOT NULL,   --/F petroflux_ivar 1 --/U nanomaggies^{-2}  --/D Inverse variance of petroflux_n
	petroflux_ivar_u  real  NOT NULL,   --/F petroflux_ivar 2 --/U nanomaggies^{-2}  --/D Inverse variance of petroflux_u
	petroflux_ivar_g  real  NOT NULL,   --/F petroflux_ivar 3 --/U nanomaggies^{-2}  --/D Inverse variance of petroflux_g
	petroflux_ivar_r  real  NOT NULL,   --/F petroflux_ivar 4 --/U nanomaggies^{-2}  --/D Inverse variance of petroflux_r
	petroflux_ivar_i  real  NOT NULL,   --/F petroflux_ivar 5 --/U nanomaggies^{-2}  --/D Inverse variance of petroflux_i
	petroflux_ivar_z  real  NOT NULL,   --/F petroflux_ivar 6 --/U nanomaggies^{-2}  --/D Inverse variance of petroflux_z
	fiberflux_f  real  NOT NULL,   --/F fiberflux 0 --/U nanomaggies  --/D Flux in 3-arcsec diameter aperture (not apodized) in GALEX far-UV
	fiberflux_n  real  NOT NULL,   --/F fiberflux 1 --/U nanomaggies  --/D Flux in 3-arcsec diameter aperture (not apodized) in GALEX near-UV
	fiberflux_u  real  NOT NULL,   --/F fiberflux 2 --/U nanomaggies  --/D Flux in 3-arcsec diameter aperture (not apodized) in SDSS u-band
	fiberflux_g  real  NOT NULL,   --/F fiberflux 3 --/U nanomaggies  --/D Flux in 3-arcsec diameter aperture (not apodized) in SDSS g-band
	fiberflux_r  real  NOT NULL,   --/F fiberflux 4 --/U nanomaggies  --/D Flux in 3-arcsec diameter aperture (not apodized) in SDSS r-band
	fiberflux_i  real  NOT NULL,   --/F fiberflux 5 --/U nanomaggies  --/D Flux in 3-arcsec diameter aperture (not apodized) in SDSS i-band
	fiberflux_z  real  NOT NULL,   --/F fiberflux 6 --/U nanomaggies  --/D Flux in 3-arcsec diameter aperture (not apodized) in SDSS z-band
	fiberflux_ivar_f  real  NOT NULL,   --/F fiberflux_ivar 0 --/U nanomaggies^{-2}  --/D Inverse variance of fiberflux_f
	fiberflux_ivar_n  real  NOT NULL,   --/F fiberflux_ivar 1 --/U nanomaggies^{-2}  --/D Inverse variance of fiberflux_n
	fiberflux_ivar_u  real  NOT NULL,   --/F fiberflux_ivar 2 --/U nanomaggies^{-2}  --/D Inverse variance of fiberflux_u
	fiberflux_ivar_g  real  NOT NULL,   --/F fiberflux_ivar 3 --/U nanomaggies^{-2}  --/D Inverse variance of fiberflux_g
	fiberflux_ivar_r  real  NOT NULL,   --/F fiberflux_ivar 4 --/U nanomaggies^{-2}  --/D Inverse variance of fiberflux_r
	fiberflux_ivar_i  real  NOT NULL,   --/F fiberflux_ivar 5 --/U nanomaggies^{-2}  --/D Inverse variance of fiberflux_i
	fiberflux_ivar_z  real  NOT NULL,   --/F fiberflux_ivar 6 --/U nanomaggies^{-2}  --/D Inverse variance of fiberflux_z
	sersic_n  real  NOT NULL,   --/D Sersic index from two-dimensional, single-component Sersic fit in r-band
	sersic_ba  real  NOT NULL,   --/D Axis ratio b/a from two-dimensional, single-component Sersic fit in r-band
	sersic_phi  real  NOT NULL,   --/U deg  --/D Angle (E of N) of major axis in two-dimensional, single-component Sersic fit in r-band
	sersic_th50  real  NOT NULL,   --/U arcsec  --/D 50% light radius of two-dimensional, single-component Sersic fit to r-band
	sersicflux_f  real  NOT NULL,   --/F sersicflux 0 --/U nanomaggies  --/D Two-dimensional, single-component Sersic fit flux in GALEX far-UV (fit using r-band structural parameters)
	sersicflux_n  real  NOT NULL,   --/F sersicflux 1 --/U nanomaggies  --/D Two-dimensional, single-component Sersic fit flux in GALEX near-UV (fit using r-band structural parameters)
	sersicflux_u  real  NOT NULL,   --/F sersicflux 2 --/U nanomaggies  --/D Two-dimensional, single-component Sersic fit flux in SDSS u-band (fit using r-band structural parameters)
	sersicflux_g  real  NOT NULL,   --/F sersicflux 3 --/U nanomaggies  --/D Two-dimensional, single-component Sersic fit flux in SDSS g-band (fit using r-band structural parameters)
	sersicflux_r  real  NOT NULL,   --/F sersicflux 4 --/U nanomaggies  --/D Two-dimensional, single-component Sersic fit flux in SDSS r-band (fit using r-band structural parameters)
	sersicflux_i  real  NOT NULL,   --/F sersicflux 5 --/U nanomaggies  --/D Two-dimensional, single-component Sersic fit flux in SDSS i-band (fit using r-band structural parameters)
	sersicflux_z  real  NOT NULL,   --/F sersicflux 6 --/U nanomaggies  --/D Two-dimensional, single-component Sersic fit flux in SDSS z-band (fit using r-band structural parameters)
	sersicflux_ivar_f  real  NOT NULL,   --/F sersicflux_ivar 0 --/U nanomaggies^{-2}  --/D Inverse variance of sersicflux_f
	sersicflux_ivar_n  real  NOT NULL,   --/F sersicflux_ivar 1 --/U nanomaggies^{-2}  --/D Inverse variance of sersicflux_n
	sersicflux_ivar_u  real  NOT NULL,   --/F sersicflux_ivar 2 --/U nanomaggies^{-2}  --/D Inverse variance of sersicflux_u
	sersicflux_ivar_g  real  NOT NULL,   --/F sersicflux_ivar 3 --/U nanomaggies^{-2}  --/D Inverse variance of sersicflux_g
	sersicflux_ivar_r  real  NOT NULL,   --/F sersicflux_ivar 4 --/U nanomaggies^{-2}  --/D Inverse variance of sersicflux_r
	sersicflux_ivar_i  real  NOT NULL,   --/F sersicflux_ivar 5 --/U nanomaggies^{-2}  --/D Inverse variance of sersicflux_i
	sersicflux_ivar_z  real  NOT NULL,   --/F sersicflux_ivar 6 --/U nanomaggies^{-2}  --/D Inverse variance of sersicflux_z
	sersic_nmgy_f  real  NOT NULL,  --/F sersic_nmgy 0 --/U nanomaggies  --/D Galactic-extinction corrected AB flux in GALEX far-UV used for K-correction (from sersicflux_f)
	sersic_nmgy_n  real  NOT NULL,  --/F sersic_nmgy 1 --/U nanomaggies  --/D Galactic-extinction corrected AB flux in GALEX near-UV used for K-correction (from sersicflux_n)
	sersic_nmgy_u  real  NOT NULL,  --/F sersic_nmgy 2 --/U nanomaggies  --/D Galactic-extinction corrected AB flux in SDSS u-band used for K-correction (from sersicflux_u)
	sersic_nmgy_g  real  NOT NULL,  --/F sersic_nmgy 3 --/U nanomaggies  --/D Galactic-extinction corrected AB flux in SDSS g-band used for K-correction (from sersicflux_g)
	sersic_nmgy_r  real  NOT NULL,  --/F sersic_nmgy 4 --/U nanomaggies  --/D Galactic-extinction corrected AB flux in SDSS r-band used for K-correction (from sersicflux_r)
	sersic_nmgy_i  real  NOT NULL,  --/F sersic_nmgy 5 --/U nanomaggies  --/D Galactic-extinction corrected AB flux in SDSS i-band used for K-correction (from sersicflux_i)
	sersic_nmgy_z  real  NOT NULL,  --/F sersic_nmgy 6 --/U nanomaggies  --/D Galactic-extinction corrected AB flux in SDSS z-band used for K-correction (from sersicflux_z)
	sersic_nmgy_ivar_f  real  NOT NULL,  --/F sersic_nmgy_ivar 0 --/U nanomaggies^{-2}  --/D Inverse variance of sersic_nmgy_f
	sersic_nmgy_ivar_n  real  NOT NULL,  --/F sersic_nmgy_ivar 1 --/U nanomaggies^{-2}  --/D Inverse variance of sersic_nmgy_n
	sersic_nmgy_ivar_u  real  NOT NULL,  --/F sersic_nmgy_ivar 2 --/U nanomaggies^{-2}  --/D Inverse variance of sersic_nmgy_u
	sersic_nmgy_ivar_g  real  NOT NULL,  --/F sersic_nmgy_ivar 3 --/U nanomaggies^{-2}  --/D Inverse variance of sersic_nmgy_g
	sersic_nmgy_ivar_r  real  NOT NULL,  --/F sersic_nmgy_ivar 4 --/U nanomaggies^{-2}  --/D Inverse variance of sersic_nmgy_r
	sersic_nmgy_ivar_i  real  NOT NULL,  --/F sersic_nmgy_ivar 5 --/U nanomaggies^{-2}  --/D Inverse variance of sersic_nmgy_i
	sersic_nmgy_ivar_z  real  NOT NULL,  --/F sersic_nmgy_ivar 6 --/U nanomaggies^{-2}  --/D Inverse variance of sersic_nmgy_z
	sersic_ok  smallint  NOT NULL,  --/D For Sersic fluxes, 1 if K-correction was performed, 0 if not (should all be 1)
	sersic_rnmgy_f  real  NOT NULL,  --/F sersic_rnmgy 0 --/U nanomaggies  --/D Reconstructed AB nanomaggies in GALEX far-UV from K-correction fit, for Sersic fluxes
	sersic_rnmgy_n  real  NOT NULL,  --/F sersic_rnmgy 1 --/U nanomaggies  --/D Reconstructed AB nanomaggies in GALEX near-UV from K-correction fit, for Sersic fluxes
	sersic_rnmgy_u  real  NOT NULL,  --/F sersic_rnmgy 2 --/U nanomaggies  --/D Reconstructed AB nanomaggies in SDSS u-band from K-correction fit, for Sersic fluxes
	sersic_rnmgy_g  real  NOT NULL,  --/F sersic_rnmgy 3 --/U nanomaggies  --/D Reconstructed AB nanomaggies in SDSS g-band from K-correction fit, for Sersic fluxes
	sersic_rnmgy_r  real  NOT NULL,  --/F sersic_rnmgy 4 --/U nanomaggies  --/D Reconstructed AB nanomaggies in SDSS r-band from K-correction fit, for Sersic fluxes
	sersic_rnmgy_i  real  NOT NULL,  --/F sersic_rnmgy 5 --/U nanomaggies  --/D Reconstructed AB nanomaggies in SDSS i-band from K-correction fit, for Sersic fluxes
	sersic_rnmgy_z  real  NOT NULL,  --/F sersic_rnmgy 6 --/U nanomaggies  --/D Reconstructed AB nanomaggies in SDSS z-band from K-correction fit, for Sersic fluxes
	sersic_absmag_f  real  NOT NULL,  --/F sersic_absmag 0 --/U mag  --/D Absolute magnitude in rest-frame GALEX near-UV, from Sersic fluxes
	sersic_absmag_n  real  NOT NULL,  --/F sersic_absmag 1 --/U mag  --/D Absolute magnitude in rest-frame GALEX far-UV, from Sersic fluxes
	sersic_absmag_u  real  NOT NULL,  --/F sersic_absmag 2 --/U mag  --/D Absolute magnitude in rest-frame SDSS u-band, from Sersic fluxes
	sersic_absmag_g  real  NOT NULL,  --/F sersic_absmag 3 --/U mag  --/D Absolute magnitude in rest-frame SDSS g-band, from Sersic fluxes
	sersic_absmag_r  real  NOT NULL,  --/F sersic_absmag 4 --/U mag  --/D Absolute magnitude in rest-frame SDSS r-band, from Sersic fluxes
	sersic_absmag_i  real  NOT NULL,  --/F sersic_absmag 5 --/U mag  --/D Absolute magnitude in rest-frame SDSS i-band, from Sersic fluxes
	sersic_absmag_z  real  NOT NULL,  --/F sersic_absmag 6 --/U mag  --/D Absolute magnitude in rest-frame SDSS z-band, from Sersic fluxes
	sersic_amivar_f  real  NOT NULL,  --/F sersic_amivar 0 --/U mag^{-2}  --/D Inverse variance in sersic_absmag_f
	sersic_amivar_n  real  NOT NULL,  --/F sersic_amivar 1 --/U mag^{-2}  --/D Inverse variance in sersic_absmag_n
	sersic_amivar_u  real  NOT NULL,  --/F sersic_amivar 2 --/U mag^{-2}  --/D Inverse variance in sersic_absmag_u
	sersic_amivar_g  real  NOT NULL,  --/F sersic_amivar 3 --/U mag^{-2}  --/D Inverse variance in sersic_absmag_g
	sersic_amivar_r  real  NOT NULL,  --/F sersic_amivar 4 --/U mag^{-2}  --/D Inverse variance in sersic_absmag_r
	sersic_amivar_i  real  NOT NULL,  --/F sersic_amivar 5 --/U mag^{-2}  --/D Inverse variance in sersic_absmag_i
	sersic_amivar_z  real  NOT NULL,  --/F sersic_amivar 6 --/U mag^{-2}  --/D Inverse variance in sersic_absmag_z
	sersic_kcorrect_f  real  NOT NULL,  --/F sersic_kcorrect 0 --/U mag  --/D K-correction value used for absolute magnitude in the GALEX far-UV for Sersic fluxes
	sersic_kcorrect_n  real  NOT NULL,  --/F sersic_kcorrect 1 --/U mag  --/D K-correction value used for absolute magnitude in the GALEX near-UV for Sersic fluxes
	sersic_kcorrect_u  real  NOT NULL,  --/F sersic_kcorrect 2 --/U mag  --/D K-correction value used for absolute magnitude in the SDSS u-band for Sersic fluxes
	sersic_kcorrect_g  real  NOT NULL,  --/F sersic_kcorrect 3 --/U mag  --/D K-correction value used for absolute magnitude in the SDSS g-band for Sersic fluxes
	sersic_kcorrect_r  real  NOT NULL,  --/F sersic_kcorrect 4 --/U mag  --/D K-correction value used for absolute magnitude in the SDSS r-band for Sersic fluxes
	sersic_kcorrect_i  real  NOT NULL,  --/F sersic_kcorrect 5 --/U mag  --/D K-correction value used for absolute magnitude in the SDSS i-band for Sersic fluxes
	sersic_kcorrect_z  real  NOT NULL,  --/F sersic_kcorrect 6 --/U mag  --/D K-correction value used for absolute magnitude in the SDSS z-band for Sersic fluxes
	sersic_kcoeff_0  real  NOT NULL,  --/F sersic_kcoeff 0 --/D Coefficient 0 of templates in K-correction fit (see Blanton &amp; Roweis 2007) for Sersic fluxes
	sersic_kcoeff_1  real  NOT NULL,  --/F sersic_kcoeff 1 --/D Coefficient 1 of templates in K-correction fit (see Blanton &amp; Roweis 2007) for Sersic fluxes
	sersic_kcoeff_2  real  NOT NULL,  --/F sersic_kcoeff 2 --/D Coefficient 2 of templates in K-correction fit (see Blanton &amp; Roweis 2007) for Sersic fluxes
	sersic_kcoeff_3  real  NOT NULL,  --/F sersic_kcoeff 3 --/D Coefficient 3 of templates in K-correction fit (see Blanton &amp; Roweis 2007) for Sersic fluxes
	sersic_kcoeff_4  real  NOT NULL,  --/F sersic_kcoeff 4 --/D Coefficient 4 of templates in K-correction fit (see Blanton &amp; Roweis 2007) for Sersic fluxes
	sersic_mass  real  NOT NULL,   --/U   --/D Stellar mass from K-correction fit (use with caution) for Sersic fluxes
	sersic_mtol_f  real  NOT NULL,   --/F sersic_mtol 0 --/U solar mass per solar luminosity --/D Mass-to-light ratio derived in K-correction fit for GALEX far-UV for Sersic fluxes
	sersic_mtol_n  real  NOT NULL,   --/F sersic_mtol 1 --/U solar mass per solar luminosity --/D Mass-to-light ratio derived in K-correction fit for GALEX near-UV for Sersic fluxes
	sersic_mtol_u  real  NOT NULL,   --/F sersic_mtol 2 --/U solar mass per solar luminosity --/D Mass-to-light ratio derived in K-correction fit for SDSS u-band for Sersic fluxes
	sersic_mtol_g  real  NOT NULL,   --/F sersic_mtol 3 --/U solar mass per solar luminosity --/D Mass-to-light ratio derived in K-correction fit for SDSS g-band for Sersic fluxes
	sersic_mtol_r  real  NOT NULL,   --/F sersic_mtol 4 --/U solar mass per solar luminosity --/D Mass-to-light ratio derived in K-correction fit for SDSS r-band for Sersic fluxes
	sersic_mtol_i  real  NOT NULL,   --/F sersic_mtol 5 --/U solar mass per solar luminosity --/D Mass-to-light ratio derived in K-correction fit for SDSS i-band for Sersic fluxes
	sersic_mtol_z  real  NOT NULL,   --/F sersic_mtol 6 --/U solar mass per solar luminosity --/D Mass-to-light ratio derived in K-correction fit for SDSS z-band for Sersic fluxes
	sersic_b300  real  NOT NULL,   --/U   --/D Star-formation rate b-parameter (current over past average) for last 300 Myrs (from K-correction fit, use with caution) for Sersic fluxes
	sersic_b1000  real  NOT NULL,   --/U   --/D Star-formation rate b-parameter (current over past average) for last 1 Gyrs (from K-correction fit, use with caution) for Sersic fluxes
	sersic_mets  real  NOT NULL,   --/U   --/D Metallicity from K-correction fit (use with caution) for Sersic fluxes
	asymmetry_f  real  NOT NULL,   --/F asymmetry 0 --/D Asymmetry parameter (use with caution) in GALEX far-UV 
	asymmetry_n  real  NOT NULL,   --/F asymmetry 1 --/D Asymmetry parameter (use with caution) in GALEX near-UV 
	asymmetry_u  real  NOT NULL,   --/F asymmetry 2 --/D Asymmetry parameter (use with caution) in SDSS u-band 
	asymmetry_g  real  NOT NULL,   --/F asymmetry 3 --/D Asymmetry parameter (use with caution) in SDSS g-band 
	asymmetry_r  real  NOT NULL,   --/F asymmetry 4 --/D Asymmetry parameter (use with caution) in SDSS r-band 
	asymmetry_i  real  NOT NULL,   --/F asymmetry 5 --/D Asymmetry parameter (use with caution) in SDSS i-band 
	asymmetry_z  real  NOT NULL,   --/F asymmetry 6 --/D Asymmetry parameter (use with caution) in SDSS z-band 
	clumpy_f  real  NOT NULL,   --/F clumpy 0 --/D Clumpiness parameter (use with caution)in GALEX far-UV
	clumpy_n  real  NOT NULL,   --/F clumpy 1 --/D Clumpiness parameter (use with caution)in GALEX near-UV
	clumpy_u  real  NOT NULL,   --/F clumpy 2 --/D Clumpiness parameter (use with caution)in SDSS u-band
	clumpy_g  real  NOT NULL,   --/F clumpy 3 --/D Clumpiness parameter (use with caution)in SDSS g-band
	clumpy_r  real  NOT NULL,   --/F clumpy 4 --/D Clumpiness parameter (use with caution)in SDSS r-band
	clumpy_i  real  NOT NULL,   --/F clumpy 5 --/D Clumpiness parameter (use with caution)in SDSS i-band
	clumpy_z  real  NOT NULL,   --/F clumpy 6 --/D Clumpiness parameter (use with caution)in SDSS z-band
	extinction_f  real  NOT NULL,  --/F extinction 0 --/U mag  --/D Galactic extinction from Schlegel, Finkbeiner, and Davis (1997), in GALEX far-UV
	extinction_n  real  NOT NULL,  --/F extinction 1 --/U mag  --/D Galactic extinction from Schlegel, Finkbeiner, and Davis (1997), in GALEX near-UV
	extinction_u  real  NOT NULL,  --/F extinction 2 --/U mag  --/D Galactic extinction from Schlegel, Finkbeiner, and Davis (1997), in SDSS u-band
	extinction_g  real  NOT NULL,  --/F extinction 3 --/U mag  --/D Galactic extinction from Schlegel, Finkbeiner, and Davis (1997), in SDSS g-band
	extinction_r  real  NOT NULL,  --/F extinction 4 --/U mag  --/D Galactic extinction from Schlegel, Finkbeiner, and Davis (1997), in SDSS r-band
	extinction_i  real  NOT NULL,  --/F extinction 5 --/U mag  --/D Galactic extinction from Schlegel, Finkbeiner, and Davis (1997), in SDSS i-band
	extinction_z  real  NOT NULL,  --/F extinction 6 --/U mag  --/D Galactic extinction from Schlegel, Finkbeiner, and Davis (1997), in SDSS z-band
	aid  int  NOT NULL,   --/D Child id within parent
	pid  int  NOT NULL,   --/D Parent id within mosaic for this object
	xcen  float  NOT NULL,   --/U   --/D X centroid in child atlas image
	ycen  float  NOT NULL,   --/U   --/D Y centroid in child atlas image
	dflags_f  int  NOT NULL,   --/F dflags 0 --/D Bitmask flags from photometric measurement for GALEX far-UV
	dflags_n  int  NOT NULL,   --/F dflags 1 --/D Bitmask flags from photometric measurement for GALEX near-UV
	dflags_u  int  NOT NULL,   --/F dflags 2 --/D Bitmask flags from photometric measurement for SDSS u-band
	dflags_g  int  NOT NULL,   --/F dflags 3 --/D Bitmask flags from photometric measurement for SDSS g-band
	dflags_r  int  NOT NULL,   --/F dflags 4 --/D Bitmask flags from photometric measurement for SDSS r-band
	dflags_i  int  NOT NULL,   --/F dflags 5 --/D Bitmask flags from photometric measurement for SDSS i-band
	dflags_z  int  NOT NULL,   --/F dflags 6 --/D Bitmask flags from photometric measurement for SDSS z-band
	dversion  varchar(20)  NOT NULL,   --/D Version of dimage software used for object detection and initial measurement
)
GO
--



EXEC spSetDefaultFileGroup 'PrimaryFileGroup'
GO
--
PRINT '[MangaTables.sql]: MaNGA tables created'
GO


