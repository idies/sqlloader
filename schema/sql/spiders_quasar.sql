CREATE TABLE spiders_quasar (
  xray_detection 		varchar(16) NOT NULL,		--/D Flag indicating whether the X-ray source was detected in the 2RXS or XMMSL2 survey.
  name 					varchar(32) NOT NULL,       --/D IAU name of the X-ray detection.
  RA					float NOT NULL,				--/D Right ascension of the X-ray detection (J2000).
  DEC					float NOT NULL,				--/D Declination of the X-ray detection (J2000).
  ExiML_2RXS			real NOT NULL,				--/D Existence likelihood of the 2RXS X-ray detection.
  ExpTime_2RXS			real NOT NULL,				--/D Exposure time of the 2RXS X-ray detection.
  DETML_XMMSL2			real NOT NULL, 				--/D Detection likelihood of the XMMSL2 detection in the 0.2-12 keV range. 
  ExpTime_XMMSL2		real NOT NULL,				--/D Exposure time of the XMMSL2 X-ray detection.
  f_class_2RXS			real NOT NULL,				--/D Classical flux in the 0.1-2.4 keV range (2RXS).
  errf_class_2RXS		real NOT NULL,				--/D Uncertainty in the classical flux in the 0.1-2.4 keV range (2RXS).
  f_bay_2RXS			real NOT NULL,				--/D Bayesian flux in the 0.1-2.4 keV range (2RXS).
  errf_bay_2RXS			real NOT NULL,				--/D Uncertainty in the Bayesian flux in the 0.1-2.4 keV range (2RXS).
  fden_class_2RXS		real NOT NULL,				--/D Classical flux density at 2 keV (2RXS).
  errfden_class_2RXS	real NOT NULL,				--/D Uncertainty in the classical flux density at 2 keV (2RXS).
  fden_bay_2RXS			real NOT NULL,				--/D Bayesian flux density at 2 keV (2RXS).
  errfden_bay_2RXS		real NOT NULL,				--/D Uncertainty in the Bayesian flux density at 2 keV (2RXS).
  l_class_2RXS			real NOT NULL,				--/D Classical luminosity in the 0.1-2.4 keV range (2RXS).
  errl_class_2RXS		real NOT NULL,				--/D Uncertainty in the classical luminosity in the 0.1-2.4 keV range (2RXS).
  l_bay_2RXS			real NOT NULL,				--/D Bayesian luminosity in the 0.1-2.4 keV range (2RXS).
  errl_bay_2RXS			real NOT NULL,				--/D Uncertainty in the Bayesian luminosity in the 0.1-2.4 keV range (2RXS).
  l2keV_class_2RXS		real NOT NULL,				--/D Classical monochromatic luminosity at 2 keV (2RXS).
  errl2keV_class_2RXS	real NOT NULL,				--/D Uncertainty in the classical monochromatic luminosity at 2 keV (2RXS).
  l2keV_bay_2RXS		real NOT NULL,				--/D Bayesian monochromatic luminosity at 2 keV (2RXS).
  errl2keV_bay_2RXS		real NOT NULL,				--/D Uncertainty in the Bayesian monochromatic luminosity at 2 keV (2RXS).
  f_XMMSL2				real NOT NULL,				--/D Flux in the 0.2-12 keV range (XMMSL2; Saxton et al. (2008)).
  errf_XMMSL2			real NOT NULL,				--/D Uncertainty in the flux in the 0.2-12 keV range (XMMSL2; Saxton et al. (2008)).
  l_XMMSL2				real NOT NULL,				--/D Luminosity in the 0.2-12 keV range (XMMSL2; Saxton et al. (2008)).
  errl_XMMSL2			real NOT NULL,				--/D Uncertainty in the luminosity in the 0.2-12keV range (XMMSL2; Saxton et al. (2008)).
  Plate					int NOT NULL,			--/D SDSS plate number.
  MJD					int NOT NULL,			--/D MJD that the SDSS spectrum was taken.
  FiberID				int NOT NULL,			--/D SDSS fiber identification.
  DR16_RUN2D			varchar(32) NOT NULL,		--/D Spectroscopic reprocessing number.
  SPECOBJID				numeric(20) NOT NULL,				--/D Unique spectroscopic object ID.
  DR16_PLUGRA			float NOT NULL,				--/D Right ascension of the drilled fiber position.
  DR16_PLUGDEC			float NOT NULL,				--/D Declination of the drilled fiber position.
  redshift				real NOT NULL,				--/D Source redshift based on the visual inspection results.
  CLASS_BEST			varchar(32) NOT NULL,		--/D Source classification based on the visual inspection results.
  CONF_BEST				bigint NOT NULL,			--/D Visual inspection redshift and classification confidence flag.
  DR16_ZWARNING			bigint NOT NULL,			--/D Warning flag for SDSS spectra.
  DR16_SNMEDIANALL		real NOT NULL,				--/D Median signal to noise ratio per pixel of the spectrum.
  Instrument			varchar(32) NOT NULL,		--/D Flag indicating which spectrograph was used (SDSS or BOSS) to measure the spectrum.
  norm1_mgII			real NOT NULL,				--/D Normalisation of the first Gaussian used to fit the MgII line.
  errnorm1_mgII			real NOT NULL,				--/D Uncertainty in the normalisation of the first Gaussian used to fit the MgII line.
  peak1_mgII			real NOT NULL,				--/D Wavelength of the peak of the first Gaussian used to fit the MgII line.
  errpeak1_mgII			real NOT NULL,				--/D Uncertainty in the wavelength of the peak of the first Gaussian used to fit the MgII line.
  width1_mgII			real NOT NULL,				--/D Width of the first Gaussian used to fit the MgII line.
  errwidth1_mgII		real NOT NULL,				--/D Uncertainty in the width of the first Gaussian used to fit the MgII line.
  fwhm1_mgII			real NOT NULL,				--/D FWHM of the first Gaussian used to fit the MgII line.
  errfwhm1_mgII			real NOT NULL,				--/D Uncertainty in the FWHM of the first Gaussian used to fit the MgII line.
  shift1_mgII			real NOT NULL,				--/D Wavelength shift of the peak of the first Gaussian used to fit the MgII line relative to the rest-frame wavelength.
  norm2_mgII			real NOT NULL,				--/D Normalisation of the second Gaussian used to fit the MgII line.
  errnorm2_mgII			real NOT NULL,				--/D Uncertainty in the normalisation of the second Gaussian used to fit the MgII line.
  peak2_mgII			real NOT NULL,				--/D Wavelength of the peak of the second Gaussian used to fit the MgII line.
  errpeak2_mgII			real NOT NULL,				--/D Uncertainty in the wavelength of the peak of the second Gaussian used to fit the MgII line.
  width2_mgII			real NOT NULL,				--/D Width of the second Gaussian used to fit the MgII line.
  errwidth2_mgII		real NOT NULL,				--/D Uncertainty in the width of the second Gaussian used to fit the MgII line.
  fwhm2_mgII			real NOT NULL,				--/D FWHM of the second Gaussian used to fit the MgII line.
  errfwhm2_mgII			real NOT NULL,				--/D Uncertainty in the FWHM of the second Gaussian used to fit the MgII line.
  shift2_mgII			real NOT NULL,				--/D Wavelength shift of the peak of the second Gaussian used to fit the MgII line relative to the rest-frame wavelength.
  norm3_mgII			real NOT NULL,				--/D Normalisation of the third Gaussian used to fit the MgII line.
  errnorm3_mgII			real NOT NULL,				--/D Uncertainty in the normalisation of the third Gaussian used to fit the MgII line.
  peak3_mgII			real NOT NULL,				--/D Wavelength of the peak of the third Gaussian used to fit the MgII line.
  errpeak3_mgII			real NOT NULL,				--/D Uncertainty in the wavelength of the peak of the third Gaussian used to fit the MgII line.
  width3_mgII			real NOT NULL,				--/D Width of the third Gaussian used to fit the MgII line.
  errwidth3_mgII		real NOT NULL,				--/D Uncertainty in the width of the third Gaussian used to fit the MgII line.
  fwhm3_mgII			real NOT NULL,				--/D FWHM of the third Gaussian used to fit the MgII line.
  errfwhm3_mgII			real NOT NULL,				--/D Uncertainty in the FWHM of the third Gaussian used to fit the MgII line.
  shift3_mgII			real NOT NULL,				--/D Wavelength shift of the peak of the third Gaussian used to fit the MgII line relative to the rest-frame wavelength.
  norm_heII				real NOT NULL,				--/D Normalisation of the Gaussian used to fit the HeII line.
  errnorm_heII			real NOT NULL,				--/D Uncertainty in the normalisation of the Gaussian used to fit the HeII line.
  peak_heII				real NOT NULL,				--/D Wavelength of the peak of the Gaussian used to fit the HeII line.
  errpeak_heII			real NOT NULL,				--/D Uncertainty in the wavelength of the peak of the Gaussian used to fit the HeII line.
  width_heII			real NOT NULL,				--/D Width of the Gaussian used to fit the HeII line.
  errwidth_heII			real NOT NULL,				--/D Uncertainty in the width of the Gaussian used to fit the HeII line.
  fwhm_heII				real NOT NULL,				--/D FWHM of the Gaussian used to fit the HeII line.
  errfwhm_heII			real NOT NULL,				--/D Uncertainty in the FWHM of the Gaussian used to fit the HeII line.
  shift_heII			real NOT NULL,				--/D Wavelength shift of the peak of the Gaussian used to fit the HeII line relative to the rest-frame wavelength.
  norm1_hb				real NOT NULL,				--/D Normalisation of the first Gaussian used to fit the H beta line.
  errnorm1_hb			real NOT NULL,				--/D Uncertainty in the normalisation of the first Gaussian used to fit the H beta line.
  peak1_hb				real NOT NULL,				--/D Wavelength of the peak of the first Gaussian used to fit the H beta line.
  errpeak1_hb			real NOT NULL,				--/D Uncertainty in the wavelength of the peak of the first Gaussian used to fit the H beta line.
  width1_hb				real NOT NULL,				--/D Width of the first Gaussian used to fit the H beta line.
  errwidth1_hb			real NOT NULL,				--/D Uncertainty in the width of the first Gaussian used to fit the H beta line.
  fwhm1_hb				real NOT NULL,				--/D FWHM of the first Gaussian used to fit the H beta line.
  errfwhm1_hb			real NOT NULL,				--/D Uncertainty in the FWHM of the first Gaussian used to fit the H beta line.
  shift1_hb				real NOT NULL,				--/D Wavelength shift of the peak of the first Gaussian used to fit the H beta line relative to the rest-frame wavelength.
  norm2_hb				real NOT NULL,				--/D Normalisation of the second Gaussian used to fit the H beta line.
  errnorm2_hb			real NOT NULL,				--/D Uncertainty in the normalisation of the second Gaussian used to fit the H beta line.
  peak2_hb				real NOT NULL,				--/D Wavelength of the peak of the second Gaussian used to fit the H beta line.
  errpeak2_hb			real NOT NULL,				--/D Uncertainty in the wavelength of the peak of the second Gaussian used to fit the H beta line.
  width2_hb				real NOT NULL,				--/D Width of the second Gaussian used to fit the H beta line.
  errwidth2_hb			real NOT NULL,				--/D Uncertainty in the width of the second Gaussian used to fit the H beta line.
  fwhm2_hb				real NOT NULL,				--/D FWHM of the second Gaussian used to fit the H beta line.
  errfwhm2_hb			real NOT NULL,				--/D Uncertainty in the FWHM of the second Gaussian used to fit the H beta line.
  shift2_hb				real NOT NULL,				--/D Wavelength shift of the peak of the second Gaussian used to fit the H beta line relative to the rest-frame wavelength.
  norm3_hb				real NOT NULL,				--/D Normalisation of the third Gaussian used to fit the H beta line.
  errnorm3_hb			real NOT NULL,				--/D Uncertainty in the normalisation of the third Gaussian used to fit the H beta line.
  peak3_hb				real NOT NULL,				--/D Wavelength of the peak of the third Gaussian used to fit the H beta line.
  errpeak3_hb			real NOT NULL,				--/D Uncertainty in the wavelength of the peak of the third Gaussian used to fit the H beta line.
  width3_hb				real NOT NULL,				--/D Width of the third Gaussian used to fit the H beta line.
  errwidth3_hb			real NOT NULL,				--/D Uncertainty in the width of the third Gaussian used to fit the H beta line.
  fwhm3_hb				real NOT NULL,				--/D FWHM of the third Gaussian used to fit the H beta line.
  errfwhm3_hb			real NOT NULL,				--/D Uncertainty in the FWHM of the third Gaussian used to fit the H beta line.
  shift3_hb				real NOT NULL,				--/D Wavelength shift of the peak of the third Gaussian used to fit the H beta line relative to the rest-frame wavelength.
  norm4_hb				real NOT NULL,				--/D Normalisation of the fourth Gaussian used to fit the H beta line.
  errnorm4_hb			real NOT NULL,				--/D Uncertainty in the normalisation of the fourth Gaussian used to fit the H beta line.
  peak4_hb				real NOT NULL,				--/D Wavelength of the peak of the fourth Gaussian used to fit the H beta line.
  errpeak4_hb			real NOT NULL,				--/D Uncertainty in the wavelength of the peak of the fourth Gaussian used to fit the H beta line.
  width4_hb				real NOT NULL,				--/D Width of the fourth Gaussian used to fit the H beta line.
  errwidth4_hb			real NOT NULL,				--/D Uncertainty in the width of the fourth Gaussian used to fit the H beta line.
  fwhm4_hb				real NOT NULL,				--/D FWHM of the fourth Gaussian used to fit the H beta line.
  errfwhm4_hb			real NOT NULL,				--/D Uncertainty in the FWHM of the fourth Gaussian used to fit the H beta line.
  shift4_hb				real NOT NULL,				--/D Wavelength shift of the peak of the fourth Gaussian used to fit the H beta line relative to the rest-frame wavelength.
  norm1_OIII4959		real NOT NULL,				--/D Normalisation of the first Gaussian used to fit the [OIII]4959 line.
  errnorm1_OIII4959		real NOT NULL,				--/D Uncertainty in the normalisation of the first Gaussian used to fit the [OIII]4959 line.
  peak1_OIII4959		real NOT NULL,				--/D Wavelength of the peak of the first Gaussian used to fit the [OIII]4959 line.
  errpeak1_OIII4959		real NOT NULL,				--/D Uncertainty in the wavelength of the peak of the first Gaussian used to fit the [OIII]4959 line.
  width1_OIII4959		real NOT NULL,				--/D Width of the first Gaussian used to fit the [OIII]4959 line.
  errwidth1_OIII4959	real NOT NULL,				--/D Uncertainty in the width of the first Gaussian used to fit the [OIII]4959 line.
  fwhm1_OIII4959		real NOT NULL,				--/D FWHM of the first Gaussian used to fit the [OIII]4959 line.
  errfwhm1_OIII4959		real NOT NULL,				--/D Uncertainty in the FWHM of the first Gaussian used to fit the [OIII]4959 line.
  shift1_OIII4959		real NOT NULL,				--/D Wavelength shift of the peak of the first Gaussian used to fit the [OIII]4959 line relative to the rest-frame wavelength.
  norm2_OIII4959		real NOT NULL,				--/D Normalisation of the second Gaussian used to fit the [OIII]4959 line.
  errnorm2_OIII4959		real NOT NULL,				--/D Uncertainty in the normalisation of the second Gaussian used to fit the [OIII]4959 line.
  peak2_OIII4959		real NOT NULL,				--/D Wavelength of the peak of the second Gaussian used to fit the [OIII]4959 line.
  errpeak2_OIII4959		real NOT NULL,				--/D Uncertainty in the wavelength of the peak of the second Gaussian used to fit the [OIII]4959 line.
  width2_OIII4959		real NOT NULL,				--/D Width of the second Gaussian used to fit the [OIII]4959 line.
  errwidth2_OIII4959	real NOT NULL,				--/D Uncertainty in the width of the second Gaussian used to fit the [OIII]4959 line.
  fwhm2_OIII4959		real NOT NULL,				--/D FWHM of the second Gaussian used to fit the [OIII]4959 line.
  errfwhm2_OIII4959		real NOT NULL,				--/D Uncertainty in the FWHM of the second Gaussian used to fit the [OIII]4959 line.
  shift2_OIII4959		real NOT NULL,				--/D Wavelength shift of the peak of the second Gaussian used to fit the [OIII]4959 line relative to the rest-frame wavelength.
  norm1_OIII5007		real NOT NULL,				--/D Normalisation of the first Gaussian used to fit the [OIII]5007 line.
  errnorm1_OIII5007		real NOT NULL,				--/D Uncertainty in the normalisation of the first Gaussian used to fit the [OIII]5007 line.
  peak1_OIII5007		real NOT NULL,				--/D Wavelength of the peak of the first Gaussian used to fit the [OIII]5007 line.
  errpeak1_OIII5007		real NOT NULL,				--/D Uncertainty in the wavelength of the peak of the first Gaussian used to fit the [OIII]5007 line.
  width1_OIII5007		real NOT NULL,				--/D Width of the first Gaussian used to fit the [OIII]5007 line.
  errwidth1_OIII5007	real NOT NULL,				--/D Uncertainty in the width of the first Gaussian used to fit the [OIII]5007 line.
  fwhm1_OIII5007		real NOT NULL,				--/D FWHM of the first Gaussian used to fit the [OIII]5007 line.
  errfwhm1_OIII5007		real NOT NULL,				--/D Uncertainty in the FWHM of the first Gaussian used to fit the [OIII]5007 line.
  shift1_OIII5007		real NOT NULL,				--/D Wavelength shift of the peak of the first Gaussian used to fit the [OIII]5007 line relative to the rest-frame wavelength.
  norm2_OIII5007		real NOT NULL,				--/D Normalisation of the second Gaussian used to fit the [OIII]5007 line.
  errnorm2_OIII5007		real NOT NULL,				--/D Uncertainty in the normalisation of the second Gaussian used to fit the [OIII]5007 line.
  peak2_OIII5007		real NOT NULL,				--/D Wavelength of the peak of the second Gaussian used to fit the [OIII]5007 line.
  errpeak2_OIII5007		real NOT NULL,				--/D Uncertainty in the wavelength of the peak of the second Gaussian used to fit the [OIII]5007 line.
  width2_OIII5007		real NOT NULL,				--/D Width of the second Gaussian used to fit the [OIII]5007 line.
  errwidth2_OIII5007	real NOT NULL,				--/D Uncertainty in the width of the second Gaussian used to fit the [OIII]5007 line.
  fwhm2_OIII5007		real NOT NULL,				--/D FWHM of the second Gaussian used to fit the [OIII]5007 line.
  errfwhm2_OIII5007		real NOT NULL,				--/D Uncertainty in the FWHM of the second Gaussian used to fit the [OIII]5007 line.
  shift2_OIII5007		real NOT NULL,				--/D Wavelength shift of the peak of the second Gaussian used to fit the [OIII]5007 line relative to the rest-frame wavelength.
  norm_pl1				float NOT NULL,				--/D Normalisation of the power law fit to the MgII continuum region.
  errnorm_pl1			float NOT NULL,				--/D Uncertainty in the normalisation of the power law fit to the MgII continuum region.
  slope_pl1				real NOT NULL,				--/D Slope of the power law fit to the MgII continuum region.
  errslope_pl1			real NOT NULL,				--/D Uncertainty in the slope of the power law fit to the MgII continuum region.
  norm_pl2				float NOT NULL,				--/D Normalisation of the power law fit to the H beta continuum region.
  errnorm_pl2			float NOT NULL,				--/D Uncertainty in the normalisation of the power law fit to the H beta continuum region.
  slope_pl2				real NOT NULL,				--/D Slope of the power law fit to the H beta continuum region.
  errslope_pl2			real NOT NULL,				--/D Uncertainty in the slope of the power law fit to the H beta continuum region.
  norm_gal1				real NOT NULL,				--/D Normalisation of the galaxy template used to fit the MgII continuum region.
  errnorm_gal1			real NOT NULL,				--/D Uncertainty in the normalisation of the galaxy template used to fit the MgII continuum region.
  norm_gal2				real NOT NULL,				--/D Normalisation of the galaxy template used to fit the H beta continuum region.
  errnorm_gal2			real NOT NULL,				--/D Uncertainty in the normalisation of the galaxy template used to fit the H beta continuum region.
  norm_feII1    		real NOT NULL,				--/D Normalisation of the iron template used to fit the MgII continuum region.
  errnorm_feII1    		real NOT NULL,				--/D Uncertainty in the normalisation of the iron template used to fit the MgII continuum region.
  norm_feII2    		real NOT NULL,				--/D Normalisation of the iron template used to fit the H beta continuum region.
  errnorm_feII2    		real NOT NULL,				--/D Uncertainty in the normalisation of the iron template used to fit the H beta continuum region.
  fwhm_feII1    		real NOT NULL,				--/D FWHM of the Gaussian kernel convolved with the iron template used to fit the MgII continuum region.
  errfwhm_feII1    		real NOT NULL,				--/D Uncertainty in the FWHM of the Gaussian kernel convolved with the iron template used to fit the MgII continuum region.
  fwhm_feII2    		real NOT NULL,				--/D FWHM of the Gaussian kernel convolved with the iron template used to fit the H beta continuum region.
  errfwhm_feII2    		real NOT NULL,				--/D Uncertainty in the FWHM of the Gaussian kernel convolved with the iron template used to fit the H beta continuum region.
  r_feII    			real NOT NULL,				--/D Flux ratio of the 4434-4684 Ang FeII emission to the broad component of H beta.
  OIII_Hbeta_ratio    	real NOT NULL,				--/D Flux ratio of [OIII]5007 Ang to H beta.
  virialfwhm_mgII    	real NOT NULL,				--/D FWHM of the MgII broad line profile.
  errvirialfwhm_mgII1    real NOT NULL,				--/D Uncertainty in the FWHM of the MgII broad line profile.
  virialfwhm_hb    		real NOT NULL,				--/D FWHM of the H beta broad line profile.
  errvirialfwhm_hb    	real NOT NULL,				--/D Uncertainty in the FWHM of the H beta broad line profile.
  mgII_chi    			real NOT NULL,				--/D Reduced chi-squared of the fit to the MgII region.
  hb_chi    			real NOT NULL,				--/D Reduced chi-squared of the fit to the H beta region.
  l2500          		float NOT NULL,				--/D Monochromatic luminosity at 2500 Ang.
  errl2500          	float NOT NULL,				--/D Uncertainty in the monochromatic luminosity at 2500 Ang.
  l3000          		float NOT NULL,				--/D Monochromatic luminosity at 3000 Ang.
  errl3000          	float NOT NULL,				--/D Uncertainty in the monochromatic luminosity at 3000 Ang.
  l5100          		float NOT NULL,				--/D Monochromatic luminosity at 5100 Ang.
  errl5100          	float NOT NULL,				--/D Uncertainty in the monochromatic luminosity at 5100 Ang.
  l_bol1          		float NOT NULL,				--/D Bolometric luminosity derived from the monochromatic luminosity at 3000 Ang.
  errl_bol1          	float NOT NULL,				--/D Uncertainty in the bolometric luminosity derived from the monochromatic luminosity at 3000 Ang.
  l_bol2          		float NOT NULL,				--/D Bolometric luminosity derived from the monochromatic luminosity at 5100 Ang.
  errl_bol2          	float NOT NULL,				--/D Uncertainty in the bolometric luminosity derived from the monochromatic luminosity at 5100 Ang.
  logBHMVP_hb   		real NOT NULL,				--/D Black hole mass derived from the H beta line using the Vestergaard & Peterson (2006) calibration.
  errlogBHMVP_hb   		real NOT NULL,				--/D Uncertainty in the black hole mass derived from the H beta line using the Vestergaard & Peterson (2006) calibration.
  logBHMA_hb   			real NOT NULL,				--/D Black hole mass derived from the H beta line using the Assef et al. (2011) calibration.
  errlogBHMA_hb   		real NOT NULL,				--/D Uncertainty in the black hole mass derived from the H beta line using the Assef et al. (2011) calibration.
  logBHMS_mgII   		real NOT NULL,				--/D Black hole mass derived from the MgII line using the Shen & Liu (2012) calibration.
  errlogBHMS_mgII   	real NOT NULL,				--/D Uncertainty in the black hole mass derived from the MgII line using the Shen & Liu (2012) calibration.
  l_edd1         		float NOT NULL,				--/D Eddington luminosity based on the black hole mass estimate derived using the Shen & Liu (2012) calibration.
  errl_edd1         	float NOT NULL,				--/D Uncertainty in the Eddington luminosity based on the black hole mass estimate derived using the Shen & Liu (2012) calibration.
  l_edd2         		float NOT NULL,				--/D Eddington luminosity based on the black hole mass estimate derived using the Assef et al. (2011) calibration.
  errl_edd2         	float NOT NULL,				--/D Uncertainty in the Eddington luminosity based on the black hole mass estimate derived using the Assef et al. (2011) calibration.
  edd_ratio1    		real NOT NULL,				--/D Eddington ratio defined as l_bol1/l_edd1.
  erredd_ratio1    		real NOT NULL,				--/D Uncertainty in the Eddington ratio defined as l_bol1/l_edd1.
  edd_ratio2    		real NOT NULL,				--/D Eddington ratio defined as l_bol2/l_edd2.
  erredd_ratio2    		real NOT NULL,				--/D Uncertainty in the Eddington ratio defined as l_bol2/l_edd2.
  flag_abs    			smallint NOT NULL,				--/D Flag indicating whether or not strong absorption lines have been observed in the spectrum. flag_abs is set to either 0 (no absorption present) or 1 (absorption present).
  )
