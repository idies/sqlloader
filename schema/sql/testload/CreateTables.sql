
/****** Object:  Table [dbo].[apogeeDesign]    Script Date: 3/22/2017 2:03:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[apogeeDesign](
	[designid] [varchar](64) NOT NULL,
	[ra] [float] NOT NULL,
	[dec] [float] NOT NULL,
	[location_id] [bigint] NOT NULL,
	[radius] [real] NOT NULL,
	[shared] [tinyint] NOT NULL,
	[comments] [varchar](200) NOT NULL,
	[short_cohort_version] [int] NOT NULL,
	[medium_cohort_version] [int] NOT NULL,
	[long_cohort_version] [int] NOT NULL,
	[number_of_short_fibers] [int] NOT NULL,
	[number_of_medium_fibers] [int] NOT NULL,
	[number_of_long_fibers] [int] NOT NULL,
	[short_cohort_min_h] [real] NOT NULL,
	[short_cohort_max_h] [real] NOT NULL,
	[medium_cohort_min_h] [real] NOT NULL,
	[medium_cohort_max_h] [real] NOT NULL,
	[long_cohort_min_h] [real] NOT NULL,
	[long_cohort_max_h] [real] NOT NULL,
	[dereddened_min_j_ks_color] [real] NOT NULL,
	[number_of_visits] [int] NOT NULL,
	[number_of_tellurics] [int] NOT NULL,
	[number_of_sky] [int] NOT NULL,
	[number_of_science] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[apogeeField]    Script Date: 3/22/2017 2:03:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[apogeeField](
	[field_name] [varchar](100) NOT NULL,
	[location_id] [bigint] NOT NULL,
	[ra] [float] NOT NULL,
	[dec] [float] NOT NULL,
	[expected_no_of_visits] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[apogeeObject]    Script Date: 3/22/2017 2:03:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[apogeeObject](
	[apogee_id] [varchar](64) NOT NULL,
	[target_id] [varchar](64) NOT NULL,
	[alt_id] [varchar](64) NOT NULL,
	[location_id] [bigint] NOT NULL,
	[ra] [float] NOT NULL,
	[dec] [float] NOT NULL,
	[j] [real] NOT NULL,
	[j_err] [real] NOT NULL,
	[h] [real] NOT NULL,
	[src_h] [varchar](100) NOT NULL,
	[h_err] [real] NOT NULL,
	[k] [real] NOT NULL,
	[k_err] [real] NOT NULL,
	[irac_3_6] [real] NOT NULL,
	[irac_3_6_err] [real] NOT NULL,
	[irac_4_5] [real] NOT NULL,
	[irac_4_5_err] [real] NOT NULL,
	[src_4_5] [varchar](100) NOT NULL,
	[irac_5_8] [real] NOT NULL,
	[irac_5_8_err] [real] NOT NULL,
	[irac_8_0] [real] NOT NULL,
	[irac_8_0_err] [real] NOT NULL,
	[wise_4_5] [real] NOT NULL,
	[wise_4_5_err] [real] NOT NULL,
	[ak_wise] [real] NOT NULL,
	[sfd_ebv] [real] NOT NULL,
	[wash_m] [real] NOT NULL,
	[wash_m_err] [real] NOT NULL,
	[wash_t2] [real] NOT NULL,
	[wash_t2_err] [real] NOT NULL,
	[DDO51] [real] NOT NULL,
	[DDO51_err] [real] NOT NULL,
	[wash_ddo51_giant_flag] [int] NOT NULL,
	[wash_ddo51_star_flag] [int] NOT NULL,
	[targ_4_5] [real] NOT NULL,
	[targ_4_5_err] [real] NOT NULL,
	[ak_targ] [real] NOT NULL,
	[ak_targ_method] [varchar](32) NOT NULL,
	[pmra] [real] NOT NULL,
	[pmra_err] [real] NOT NULL,
	[pmdec] [real] NOT NULL,
	[pmdec_err] [real] NOT NULL,
	[pm_src] [varchar](100) NOT NULL,
	[tmass_a] [varchar](32) NOT NULL,
	[tmass_pxpa] [real] NOT NULL,
	[tmass_prox] [real] NOT NULL,
	[tmass_phqual] [varchar](32) NOT NULL,
	[tmass_rdflg] [varchar](32) NOT NULL,
	[tmass_ccflg] [varchar](32) NOT NULL,
	[tmass_extkey] [bigint] NOT NULL,
	[tmass_gal_contam] [varchar](32) NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[apogeePlate]    Script Date: 3/22/2017 2:03:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[apogeePlate](
	[plate_visit_id] [varchar](64) NOT NULL,
	[location_id] [bigint] NOT NULL,
	[plate] [varchar](32) NOT NULL,
	[mjd] [bigint] NOT NULL,
	[apred_version] [varchar](32) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[racen] [float] NOT NULL,
	[deccen] [float] NOT NULL,
	[radius] [real] NOT NULL,
	[shared] [tinyint] NOT NULL,
	[field_type] [tinyint] NOT NULL,
	[survey] [varchar](50) NOT NULL,
	[programname] [varchar](50) NOT NULL,
	[platerun] [varchar](50) NOT NULL,
	[designid] [bigint] NOT NULL,
	[nStandard] [bigint] NOT NULL,
	[nScience] [bigint] NOT NULL,
	[nSky] [bigint] NOT NULL,
	[platedesign_version] [varchar](10) NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[apogeeStar]    Script Date: 3/22/2017 2:03:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[apogeeStar](
	[apstar_id] [varchar](64) NOT NULL,
	[target_id] [varchar](64) NOT NULL,
	[reduction_id] [varchar](32) NOT NULL,
	[file] [varchar](128) NOT NULL,
	[apogee_id] [varchar](32) NOT NULL,
	[telescope] [varchar](32) NOT NULL,
	[location_id] [bigint] NOT NULL,
	[field] [varchar](100) NOT NULL,
	[ra] [float] NOT NULL,
	[dec] [float] NOT NULL,
	[glon] [float] NOT NULL,
	[glat] [float] NOT NULL,
	[apogee_target1] [bigint] NOT NULL,
	[apogee_target2] [bigint] NOT NULL,
	[extratarg] [bigint] NOT NULL,
	[nvisits] [bigint] NOT NULL,
	[commiss] [bigint] NOT NULL,
	[snr] [real] NOT NULL,
	[starflag] [bigint] NOT NULL,
	[andflag] [bigint] NOT NULL,
	[vhelio_avg] [real] NOT NULL,
	[vscatter] [real] NOT NULL,
	[verr] [real] NOT NULL,
	[verr_med] [real] NOT NULL,
	[synthvhelio_avg] [real] NOT NULL,
	[synthvscatter] [real] NOT NULL,
	[synthverr] [real] NOT NULL,
	[synthverr_med] [real] NOT NULL,
	[rv_teff] [real] NOT NULL,
	[rv_logg] [real] NOT NULL,
	[rv_feh] [real] NOT NULL,
	[rv_ccfwhm] [real] NOT NULL,
	[rv_autofwhm] [real] NOT NULL,
	[synthscatter] [real] NOT NULL,
	[stablerv_chi2] [real] NOT NULL,
	[stablerv_rchi2] [real] NOT NULL,
	[chi2_threshold] [real] NOT NULL,
	[stablerv_chi2_prob] [real] NOT NULL,
	[apstar_version] [varchar](32) NOT NULL,
	[htmID] [bigint] NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[apogeeStarAllVisit]    Script Date: 3/22/2017 2:03:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[apogeeStarAllVisit](
	[visit_id] [varchar](64) NOT NULL,
	[apstar_id] [varchar](64) NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[apogeeStarVisit]    Script Date: 3/22/2017 2:03:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[apogeeStarVisit](
	[visit_id] [varchar](64) NOT NULL,
	[apstar_id] [varchar](64) NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[apogeeVisit]    Script Date: 3/22/2017 2:03:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[apogeeVisit](
	[visit_id] [varchar](64) NOT NULL,
	[apred_version] [varchar](32) NOT NULL,
	[apogee_id] [varchar](64) NOT NULL,
	[target_id] [varchar](64) NOT NULL,
	[reduction_id] [varchar](32) NOT NULL,
	[file] [varchar](128) NOT NULL,
	[fiberid] [bigint] NOT NULL,
	[plate] [varchar](32) NOT NULL,
	[mjd] [bigint] NOT NULL,
	[telescope] [varchar](32) NOT NULL,
	[location_id] [bigint] NOT NULL,
	[ra] [float] NOT NULL,
	[dec] [float] NOT NULL,
	[glon] [float] NOT NULL,
	[glat] [float] NOT NULL,
	[apogee_target1] [bigint] NOT NULL,
	[apogee_target2] [bigint] NOT NULL,
	[extratarg] [bigint] NOT NULL,
	[snr] [real] NOT NULL,
	[starflag] [bigint] NOT NULL,
	[dateobs] [varchar](100) NOT NULL,
	[jd] [float] NOT NULL,
	[bc] [real] NOT NULL,
	[vtype] [real] NOT NULL,
	[vrel] [real] NOT NULL,
	[vrelerr] [real] NOT NULL,
	[vhelio] [real] NOT NULL,
	[chisq] [real] NOT NULL,
	[rv_feh] [real] NOT NULL,
	[rv_teff] [real] NOT NULL,
	[rv_logg] [real] NOT NULL,
	[rv_alpha] [real] NOT NULL,
	[rv_carb] [real] NOT NULL,
	[synthfile] [varchar](100) NOT NULL,
	[estvtype] [bigint] NOT NULL,
	[estvrel] [real] NOT NULL,
	[estvrelerr] [real] NOT NULL,
	[estvhelio] [real] NOT NULL,
	[synthvrel] [real] NOT NULL,
	[synthvrelerr] [real] NOT NULL,
	[synthvhelio] [real] NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[aspcapStar]    Script Date: 3/22/2017 2:03:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspcapStar](
	[apstar_id] [varchar](64) NOT NULL,
	[target_id] [varchar](64) NOT NULL,
	[aspcap_id] [varchar](64) NOT NULL,
	[apogee_id] [varchar](32) NOT NULL,
	[aspcap_version] [varchar](32) NOT NULL,
	[results_version] [varchar](32) NOT NULL,
	[teff] [real] NOT NULL,
	[teff_err] [real] NOT NULL,
	[teff_flag] [int] NOT NULL,
	[logg] [real] NOT NULL,
	[logg_err] [real] NOT NULL,
	[logg_flag] [int] NOT NULL,
	[vmicro] [real] NOT NULL,
	[vmacro] [real] NOT NULL,
	[vsini] [real] NOT NULL,
	[m_h] [real] NOT NULL,
	[m_h_err] [real] NOT NULL,
	[m_h_flag] [int] NOT NULL,
	[alpha_m] [real] NOT NULL,
	[alpha_m_err] [real] NOT NULL,
	[alpha_m_flag] [int] NOT NULL,
	[aspcap_chi2] [real] NOT NULL,
	[aspcap_class] [varchar](100) NOT NULL,
	[aspcapflag] [bigint] NOT NULL,
	[fparam_teff] [real] NOT NULL,
	[fparam_logg] [real] NOT NULL,
	[fparam_logvmicro] [real] NOT NULL,
	[fparam_m_h] [real] NOT NULL,
	[fparam_c_m] [real] NOT NULL,
	[fparam_n_m] [real] NOT NULL,
	[fparam_alpha_m] [real] NOT NULL,
	[param_c_m] [real] NOT NULL,
	[param_c_m_flag] [int] NOT NULL,
	[param_n_m] [real] NOT NULL,
	[param_n_m_flag] [int] NOT NULL,
	[c_fe] [real] NOT NULL,
	[c_fe_err] [real] NOT NULL,
	[c_fe_flag] [int] NOT NULL,
	[ci_fe] [real] NOT NULL,
	[ci_fe_err] [real] NOT NULL,
	[ci_fe_flag] [int] NOT NULL,
	[n_fe] [real] NOT NULL,
	[n_fe_err] [real] NOT NULL,
	[n_fe_flag] [int] NOT NULL,
	[o_fe] [real] NOT NULL,
	[o_fe_err] [real] NOT NULL,
	[o_fe_flag] [int] NOT NULL,
	[na_fe] [real] NOT NULL,
	[na_fe_err] [real] NOT NULL,
	[na_fe_flag] [int] NOT NULL,
	[mg_fe] [real] NOT NULL,
	[mg_fe_err] [real] NOT NULL,
	[mg_fe_flag] [int] NOT NULL,
	[al_fe] [real] NOT NULL,
	[al_fe_err] [real] NOT NULL,
	[al_fe_flag] [int] NOT NULL,
	[si_fe] [real] NOT NULL,
	[si_fe_err] [real] NOT NULL,
	[si_fe_flag] [int] NOT NULL,
	[p_fe] [real] NOT NULL,
	[p_fe_err] [real] NOT NULL,
	[p_fe_flag] [int] NOT NULL,
	[s_fe] [real] NOT NULL,
	[s_fe_err] [real] NOT NULL,
	[s_fe_flag] [int] NOT NULL,
	[k_fe] [real] NOT NULL,
	[k_fe_err] [real] NOT NULL,
	[k_fe_flag] [int] NOT NULL,
	[ca_fe] [real] NOT NULL,
	[ca_fe_err] [real] NOT NULL,
	[ca_fe_flag] [int] NOT NULL,
	[ti_fe] [real] NOT NULL,
	[ti_fe_err] [real] NOT NULL,
	[ti_fe_flag] [int] NOT NULL,
	[tiii_fe] [real] NOT NULL,
	[tiii_fe_err] [real] NOT NULL,
	[tiii_fe_flag] [int] NOT NULL,
	[v_fe] [real] NOT NULL,
	[v_fe_err] [real] NOT NULL,
	[v_fe_flag] [int] NOT NULL,
	[cr_fe] [real] NOT NULL,
	[cr_fe_err] [real] NOT NULL,
	[cr_fe_flag] [int] NOT NULL,
	[mn_fe] [real] NOT NULL,
	[mn_fe_err] [real] NOT NULL,
	[mn_fe_flag] [int] NOT NULL,
	[fe_h] [real] NOT NULL,
	[fe_h_err] [real] NOT NULL,
	[fe_h_flag] [int] NOT NULL,
	[co_fe] [real] NOT NULL,
	[co_fe_err] [real] NOT NULL,
	[co_fe_flag] [int] NOT NULL,
	[ni_fe] [real] NOT NULL,
	[ni_fe_err] [real] NOT NULL,
	[ni_fe_flag] [int] NOT NULL,
	[cu_fe] [real] NOT NULL,
	[cu_fe_err] [real] NOT NULL,
	[cu_fe_flag] [int] NOT NULL,
	[ge_fe] [real] NOT NULL,
	[ge_fe_err] [real] NOT NULL,
	[ge_fe_flag] [int] NOT NULL,
	[rb_fe] [real] NOT NULL,
	[rb_fe_err] [real] NOT NULL,
	[rb_fe_flag] [int] NOT NULL,
	[y_fe] [real] NOT NULL,
	[y_fe_err] [real] NOT NULL,
	[y_fe_flag] [int] NOT NULL,
	[nd_fe] [real] NOT NULL,
	[nd_fe_err] [real] NOT NULL,
	[nd_fe_flag] [int] NOT NULL,
	[felem_c_m] [real] NOT NULL,
	[felem_c_m_err] [real] NOT NULL,
	[felem_ci_m] [real] NOT NULL,
	[felem_ci_m_err] [real] NOT NULL,
	[felem_n_m] [real] NOT NULL,
	[felem_n_m_err] [real] NOT NULL,
	[felem_o_m] [real] NOT NULL,
	[felem_o_m_err] [real] NOT NULL,
	[felem_na_h] [real] NOT NULL,
	[felem_na_h_err] [real] NOT NULL,
	[felem_mg_m] [real] NOT NULL,
	[felem_mg_m_err] [real] NOT NULL,
	[felem_al_h] [real] NOT NULL,
	[felem_al_h_err] [real] NOT NULL,
	[felem_si_m] [real] NOT NULL,
	[felem_si_m_err] [real] NOT NULL,
	[felem_p_m] [real] NOT NULL,
	[felem_p_m_err] [real] NOT NULL,
	[felem_s_m] [real] NOT NULL,
	[felem_s_m_err] [real] NOT NULL,
	[felem_k_h] [real] NOT NULL,
	[felem_k_h_err] [real] NOT NULL,
	[felem_ca_m] [real] NOT NULL,
	[felem_ca_m_err] [real] NOT NULL,
	[felem_ti_m] [real] NOT NULL,
	[felem_ti_m_err] [real] NOT NULL,
	[felem_tiii_m] [real] NOT NULL,
	[felem_tiii_m_err] [real] NOT NULL,
	[felem_v_h] [real] NOT NULL,
	[felem_v_h_err] [real] NOT NULL,
	[felem_cr_h] [real] NOT NULL,
	[felem_cr_h_err] [real] NOT NULL,
	[felem_mn_h] [real] NOT NULL,
	[felem_mn_h_err] [real] NOT NULL,
	[felem_fe_h] [real] NOT NULL,
	[felem_fe_h_err] [real] NOT NULL,
	[felem_co_h] [real] NOT NULL,
	[felem_co_h_err] [real] NOT NULL,
	[felem_ni_h] [real] NOT NULL,
	[felem_ni_h_err] [real] NOT NULL,
	[felem_cu_h] [real] NOT NULL,
	[felem_cu_h_err] [real] NOT NULL,
	[felem_ge_h] [real] NOT NULL,
	[felem_ge_h_err] [real] NOT NULL,
	[felem_rb_h] [real] NOT NULL,
	[felem_rb_h_err] [real] NOT NULL,
	[felem_y_h] [real] NOT NULL,
	[felem_y_h_err] [real] NOT NULL,
	[felem_nd_h] [real] NOT NULL,
	[felem_nd_h_err] [real] NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[aspcapStarCovar]    Script Date: 3/22/2017 2:03:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspcapStarCovar](
	[aspcap_covar_id] [varchar](64) NOT NULL,
	[aspcap_id] [varchar](64) NOT NULL,
	[param_1] [tinyint] NOT NULL,
	[param_2] [tinyint] NOT NULL,
	[covar] [real] NOT NULL,
	[fit_covar] [real] NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[AtlasOutline]    Script Date: 3/22/2017 2:03:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AtlasOutline](
	[objID] [bigint] NOT NULL,
	[size] [int] NOT NULL,
	[nspan] [int] NOT NULL,
	[row0] [int] NOT NULL,
	[col0] [int] NOT NULL,
	[rmin] [int] NOT NULL,
	[rmax] [int] NOT NULL,
	[cmin] [int] NOT NULL,
	[cmax] [int] NOT NULL,
	[npix] [int] NOT NULL,
	[span] [varchar](max) NOT NULL
) ON [ATLAS] TEXTIMAGE_ON [ATLAS]

GO
/****** Object:  Table [dbo].[DataConstants]    Script Date: 3/22/2017 2:03:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DataConstants](
	[field] [varchar](128) NOT NULL,
	[name] [varchar](128) NOT NULL,
	[value] [binary](8) NOT NULL,
	[description] [varchar](2000) NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[DBColumns]    Script Date: 3/22/2017 2:03:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DBColumns](
	[tablename] [varchar](128) NOT NULL,
	[name] [varchar](64) NOT NULL,
	[unit] [varchar](64) NOT NULL,
	[ucd] [varchar](128) NOT NULL,
	[enum] [varchar](64) NOT NULL,
	[description] [varchar](2000) NOT NULL,
	[rank] [int] NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[DBObjects]    Script Date: 3/22/2017 2:03:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DBObjects](
	[name] [varchar](128) NOT NULL,
	[type] [varchar](64) NOT NULL,
	[access] [varchar](8) NOT NULL,
	[description] [varchar](256) NOT NULL,
	[text] [varchar](7200) NOT NULL,
	[rank] [int] NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[DBViewCols]    Script Date: 3/22/2017 2:03:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DBViewCols](
	[name] [varchar](64) NOT NULL,
	[viewname] [varchar](128) NOT NULL,
	[parent] [varchar](128) NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[Dependency]    Script Date: 3/22/2017 2:03:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dependency](
	[filename] [varchar](128) NOT NULL,
	[parent] [varchar](128) NOT NULL,
	[child] [varchar](128) NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[detectionIndex]    Script Date: 3/22/2017 2:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detectionIndex](
	[thingId] [bigint] NOT NULL,
	[objId] [bigint] NOT NULL,
	[loadVersion] [int] NOT NULL,
	[isPrimary] [tinyint] NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[Diagnostics]    Script Date: 3/22/2017 2:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Diagnostics](
	[name] [varchar](64) NOT NULL,
	[type] [varchar](8) NOT NULL,
	[count] [bigint] NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[emissionLinesPort]    Script Date: 3/22/2017 2:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[emissionLinesPort](
	[specObjID] [numeric](20, 0) NOT NULL,
	[plate] [smallint] NOT NULL,
	[fiberID] [smallint] NOT NULL,
	[mjd] [int] NOT NULL,
	[ra] [float] NOT NULL,
	[dec] [float] NOT NULL,
	[z] [real] NOT NULL,
	[zErr] [real] NOT NULL,
	[zNum] [int] NOT NULL,
	[velStars] [real] NOT NULL,
	[redshift] [real] NOT NULL,
	[sigmaStars] [real] NOT NULL,
	[sigmaStarsErr] [real] NOT NULL,
	[chisq] [real] NOT NULL,
	[bpt] [varchar](32) NOT NULL,
	[ebmv] [real] NOT NULL,
	[ebmv_err] [real] NOT NULL,
	[Error_Warning] [tinyint] NOT NULL,
	[V_HeII_3203] [real] NOT NULL,
	[V_HeII_3203_Err] [real] NOT NULL,
	[Sigma_HeII_3203] [real] NOT NULL,
	[Sigma_HeII_3203_Err] [real] NOT NULL,
	[Amplitude_HeII_3203] [real] NOT NULL,
	[Amplitude_HeII_3203_Err] [real] NOT NULL,
	[Flux_HeII_3203] [real] NOT NULL,
	[Flux_HeII_3203_Err] [real] NOT NULL,
	[EW_HeII_3203] [real] NOT NULL,
	[EW_HeII_3203_Err] [real] NOT NULL,
	[Flux_Cont_HeII_3203] [real] NOT NULL,
	[Flux_Cont_HeII_3203_Err] [real] NOT NULL,
	[Fit_Warning_HeII_3203] [tinyint] NOT NULL,
	[AoN_HeII_3203] [real] NOT NULL,
	[V_NeV_3345] [real] NOT NULL,
	[V_NeV_3345_Err] [real] NOT NULL,
	[Sigma_NeV_3345] [real] NOT NULL,
	[Sigma_NeV_3345_Err] [real] NOT NULL,
	[Amplitude_NeV_3345] [real] NOT NULL,
	[Amplitude_NeV_3345_Err] [real] NOT NULL,
	[Flux_NeV_3345] [real] NOT NULL,
	[Flux_NeV_3345_Err] [real] NOT NULL,
	[EW_NeV_3345] [real] NOT NULL,
	[EW_NeV_3345_Err] [real] NOT NULL,
	[Flux_Cont_NeV_3345] [real] NOT NULL,
	[Flux_Cont_NeV_3345_Err] [real] NOT NULL,
	[Fit_Warning_NeV_3345] [tinyint] NOT NULL,
	[AoN_NeV_3345] [real] NOT NULL,
	[V_NeV_3425] [real] NOT NULL,
	[V_NeV_3425_Err] [real] NOT NULL,
	[Sigma_NeV_3425] [real] NOT NULL,
	[Sigma_NeV_3425_Err] [real] NOT NULL,
	[Amplitude_NeV_3425] [real] NOT NULL,
	[Amplitude_NeV_3425_Err] [real] NOT NULL,
	[Flux_NeV_3425] [real] NOT NULL,
	[Flux_NeV_3425_Err] [real] NOT NULL,
	[EW_NeV_3425] [real] NOT NULL,
	[EW_NeV_3425_Err] [real] NOT NULL,
	[Flux_Cont_NeV_3425] [real] NOT NULL,
	[Flux_Cont_NeV_3425_Err] [real] NOT NULL,
	[Fit_Warning_NeV_3425] [tinyint] NOT NULL,
	[AoN_NeV_3425] [real] NOT NULL,
	[V_OII_3726] [real] NOT NULL,
	[V_OII_3726_Err] [real] NOT NULL,
	[Sigma_OII_3726] [real] NOT NULL,
	[Sigma_OII_3726_Err] [real] NOT NULL,
	[Amplitude_OII_3726] [real] NOT NULL,
	[Amplitude_OII_3726_Err] [real] NOT NULL,
	[Flux_OII_3726] [real] NOT NULL,
	[Flux_OII_3726_Err] [real] NOT NULL,
	[EW_OII_3726] [real] NOT NULL,
	[EW_OII_3726_Err] [real] NOT NULL,
	[Flux_Cont_OII_3726] [real] NOT NULL,
	[Flux_Cont_OII_3726_Err] [real] NOT NULL,
	[Fit_Warning_OII_3726] [tinyint] NOT NULL,
	[AoN_OII_3726] [real] NOT NULL,
	[V_OII_3728] [real] NOT NULL,
	[V_OII_3728_Err] [real] NOT NULL,
	[Sigma_OII_3728] [real] NOT NULL,
	[Sigma_OII_3728_Err] [real] NOT NULL,
	[Amplitude_OII_3728] [real] NOT NULL,
	[Amplitude_OII_3728_Err] [real] NOT NULL,
	[Flux_OII_3728] [real] NOT NULL,
	[Flux_OII_3728_Err] [real] NOT NULL,
	[EW_OII_3728] [real] NOT NULL,
	[EW_OII_3728_Err] [real] NOT NULL,
	[Flux_Cont_OII_3728] [real] NOT NULL,
	[Flux_Cont_OII_3728_Err] [real] NOT NULL,
	[Fit_Warning_OII_3728] [tinyint] NOT NULL,
	[AoN_OII_3728] [real] NOT NULL,
	[V_NeIII_3868] [real] NOT NULL,
	[V_NeIII_3868_Err] [real] NOT NULL,
	[Sigma_NeIII_3868] [real] NOT NULL,
	[Sigma_NeIII_3868_Err] [real] NOT NULL,
	[Amplitude_NeIII_3868] [real] NOT NULL,
	[Amplitude_NeIII_3868_Err] [real] NOT NULL,
	[Flux_NeIII_3868] [real] NOT NULL,
	[Flux_NeIII_3868_Err] [real] NOT NULL,
	[EW_NeIII_3868] [real] NOT NULL,
	[EW_NeIII_3868_Err] [real] NOT NULL,
	[Flux_Cont_NeIII_3868] [real] NOT NULL,
	[Flux_Cont_NeIII_3868_Err] [real] NOT NULL,
	[Fit_Warning_NeIII_3868] [tinyint] NOT NULL,
	[AoN_NeIII_3868] [real] NOT NULL,
	[V_NeIII_3967] [real] NOT NULL,
	[V_NeIII_3967_Err] [real] NOT NULL,
	[Sigma_NeIII_3967] [real] NOT NULL,
	[Sigma_NeIII_3967_Err] [real] NOT NULL,
	[Amplitude_NeIII_3967] [real] NOT NULL,
	[Amplitude_NeIII_3967_Err] [real] NOT NULL,
	[Flux_NeIII_3967] [real] NOT NULL,
	[Flux_NeIII_3967_Err] [real] NOT NULL,
	[EW_NeIII_3967] [real] NOT NULL,
	[EW_NeIII_3967_Err] [real] NOT NULL,
	[Flux_Cont_NeIII_3967] [real] NOT NULL,
	[Flux_Cont_NeIII_3967_Err] [real] NOT NULL,
	[Fit_Warning_NeIII_3967] [tinyint] NOT NULL,
	[AoN_NeIII_3967] [real] NOT NULL,
	[V_H5_3889] [real] NOT NULL,
	[V_H5_3889_Err] [real] NOT NULL,
	[Sigma_H5_3889] [real] NOT NULL,
	[Sigma_H5_3889_Err] [real] NOT NULL,
	[Amplitude_H5_3889] [real] NOT NULL,
	[Amplitude_H5_3889_Err] [real] NOT NULL,
	[Flux_H5_3889] [real] NOT NULL,
	[Flux_H5_3889_Err] [real] NOT NULL,
	[EW_H5_3889] [real] NOT NULL,
	[EW_H5_3889_Err] [real] NOT NULL,
	[Flux_Cont_H5_3889] [real] NOT NULL,
	[Flux_Cont_H5_3889_Err] [real] NOT NULL,
	[Fit_Warning_H5_3889] [tinyint] NOT NULL,
	[AoN_H5_3889] [real] NOT NULL,
	[V_He_3970] [real] NOT NULL,
	[V_He_3970_Err] [real] NOT NULL,
	[Sigma_He_3970] [real] NOT NULL,
	[Sigma_He_3970_Err] [real] NOT NULL,
	[Amplitude_He_3970] [real] NOT NULL,
	[Amplitude_He_3970_Err] [real] NOT NULL,
	[Flux_He_3970] [real] NOT NULL,
	[Flux_He_3970_Err] [real] NOT NULL,
	[EW_He_3970] [real] NOT NULL,
	[EW_He_3970_Err] [real] NOT NULL,
	[Flux_Cont_He_3970] [real] NOT NULL,
	[Flux_Cont_He_3970_Err] [real] NOT NULL,
	[Fit_Warning_He_3970] [tinyint] NOT NULL,
	[AoN_He_3970] [real] NOT NULL,
	[V_Hd_4101] [real] NOT NULL,
	[V_Hd_4101_Err] [real] NOT NULL,
	[Sigma_Hd_4101] [real] NOT NULL,
	[Sigma_Hd_4101_Err] [real] NOT NULL,
	[Amplitude_Hd_4101] [real] NOT NULL,
	[Amplitude_Hd_4101_Err] [real] NOT NULL,
	[Flux_Hd_4101] [real] NOT NULL,
	[Flux_Hd_4101_Err] [real] NOT NULL,
	[EW_Hd_4101] [real] NOT NULL,
	[EW_Hd_4101_Err] [real] NOT NULL,
	[Flux_Cont_Hd_4101] [real] NOT NULL,
	[Flux_Cont_Hd_4101_Err] [real] NOT NULL,
	[Fit_Warning_Hd_4101] [tinyint] NOT NULL,
	[AoN_Hd_4101] [real] NOT NULL,
	[V_Hg_4340] [real] NOT NULL,
	[V_Hg_4340_Err] [real] NOT NULL,
	[Sigma_Hg_4340] [real] NOT NULL,
	[Sigma_Hg_4340_Err] [real] NOT NULL,
	[Amplitude_Hg_4340] [real] NOT NULL,
	[Amplitude_Hg_4340_Err] [real] NOT NULL,
	[Flux_Hg_4340] [real] NOT NULL,
	[Flux_Hg_4340_Err] [real] NOT NULL,
	[EW_Hg_4340] [real] NOT NULL,
	[EW_Hg_4340_Err] [real] NOT NULL,
	[Flux_Cont_Hg_4340] [real] NOT NULL,
	[Flux_Cont_Hg_4340_Err] [real] NOT NULL,
	[Fit_Warning_Hg_4340] [tinyint] NOT NULL,
	[AoN_Hg_4340] [real] NOT NULL,
	[V_OIII_4363] [real] NOT NULL,
	[V_OIII_4363_Err] [real] NOT NULL,
	[Sigma_OIII_4363] [real] NOT NULL,
	[Sigma_OIII_4363_Err] [real] NOT NULL,
	[Amplitude_OIII_4363] [real] NOT NULL,
	[Amplitude_OIII_4363_Err] [real] NOT NULL,
	[Flux_OIII_4363] [real] NOT NULL,
	[Flux_OIII_4363_Err] [real] NOT NULL,
	[EW_OIII_4363] [real] NOT NULL,
	[EW_OIII_4363_Err] [real] NOT NULL,
	[Flux_Cont_OIII_4363] [real] NOT NULL,
	[Flux_Cont_OIII_4363_Err] [real] NOT NULL,
	[Fit_Warning_OIII_4363] [tinyint] NOT NULL,
	[AoN_OIII_4363] [real] NOT NULL,
	[V_HeII_4685] [real] NOT NULL,
	[V_HeII_4685_Err] [real] NOT NULL,
	[Sigma_HeII_4685] [real] NOT NULL,
	[Sigma_HeII_4685_Err] [real] NOT NULL,
	[Amplitude_HeII_4685] [real] NOT NULL,
	[Amplitude_HeII_4685_Err] [real] NOT NULL,
	[Flux_HeII_4685] [real] NOT NULL,
	[Flux_HeII_4685_Err] [real] NOT NULL,
	[EW_HeII_4685] [real] NOT NULL,
	[EW_HeII_4685_Err] [real] NOT NULL,
	[Flux_Cont_HeII_4685] [real] NOT NULL,
	[Flux_Cont_HeII_4685_Err] [real] NOT NULL,
	[Fit_Warning_HeII_4685] [tinyint] NOT NULL,
	[AoN_HeII_4685] [real] NOT NULL,
	[V_ArIV_4711] [real] NOT NULL,
	[V_ArIV_4711_Err] [real] NOT NULL,
	[Sigma_ArIV_4711] [real] NOT NULL,
	[Sigma_ArIV_4711_Err] [real] NOT NULL,
	[Amplitude_ArIV_4711] [real] NOT NULL,
	[Amplitude_ArIV_4711_Err] [real] NOT NULL,
	[Flux_ArIV_4711] [real] NOT NULL,
	[Flux_ArIV_4711_Err] [real] NOT NULL,
	[EW_ArIV_4711] [real] NOT NULL,
	[EW_ArIV_4711_Err] [real] NOT NULL,
	[Flux_Cont_ArIV_4711] [real] NOT NULL,
	[Flux_Cont_ArIV_4711_Err] [real] NOT NULL,
	[Fit_Warning_ArIV_4711] [tinyint] NOT NULL,
	[AoN_ArIV_4711] [real] NOT NULL,
	[V_ArIV_4740] [real] NOT NULL,
	[V_ArIV_4740_Err] [real] NOT NULL,
	[Sigma_ArIV_4740] [real] NOT NULL,
	[Sigma_ArIV_4740_Err] [real] NOT NULL,
	[Amplitude_ArIV_4740] [real] NOT NULL,
	[Amplitude_ArIV_4740_Err] [real] NOT NULL,
	[Flux_ArIV_4740] [real] NOT NULL,
	[Flux_ArIV_4740_Err] [real] NOT NULL,
	[EW_ArIV_4740] [real] NOT NULL,
	[EW_ArIV_4740_Err] [real] NOT NULL,
	[Flux_Cont_ArIV_4740] [real] NOT NULL,
	[Flux_Cont_ArIV_4740_Err] [real] NOT NULL,
	[Fit_Warning_ArIV_4740] [tinyint] NOT NULL,
	[AoN_ArIV_4740] [real] NOT NULL,
	[V_Hb_4861] [real] NOT NULL,
	[V_Hb_4861_Err] [real] NOT NULL,
	[Sigma_Hb_4861] [real] NOT NULL,
	[Sigma_Hb_4861_Err] [real] NOT NULL,
	[Amplitude_Hb_4861] [real] NOT NULL,
	[Amplitude_Hb_4861_Err] [real] NOT NULL,
	[Flux_Hb_4861] [real] NOT NULL,
	[Flux_Hb_4861_Err] [real] NOT NULL,
	[EW_Hb_4861] [real] NOT NULL,
	[EW_Hb_4861_Err] [real] NOT NULL,
	[Flux_Cont_Hb_4861] [real] NOT NULL,
	[Flux_Cont_Hb_4861_Err] [real] NOT NULL,
	[Fit_Warning_Hb_4861] [tinyint] NOT NULL,
	[AoN_Hb_4861] [real] NOT NULL,
	[V_OIII_4958] [real] NOT NULL,
	[V_OIII_4958_Err] [real] NOT NULL,
	[Sigma_OIII_4958] [real] NOT NULL,
	[Sigma_OIII_4958_Err] [real] NOT NULL,
	[Amplitude_OIII_4958] [real] NOT NULL,
	[Amplitude_OIII_4958_Err] [real] NOT NULL,
	[Flux_OIII_4958] [real] NOT NULL,
	[Flux_OIII_4958_Err] [real] NOT NULL,
	[EW_OIII_4958] [real] NOT NULL,
	[EW_OIII_4958_Err] [real] NOT NULL,
	[Flux_Cont_OIII_4958] [real] NOT NULL,
	[Flux_Cont_OIII_4958_Err] [real] NOT NULL,
	[Fit_Warning_OIII_4958] [tinyint] NOT NULL,
	[V_OIII_5006] [real] NOT NULL,
	[V_OIII_5006_Err] [real] NOT NULL,
	[Sigma_OIII_5006] [real] NOT NULL,
	[Sigma_OIII_5006_Err] [real] NOT NULL,
	[Amplitude_OIII_5006] [real] NOT NULL,
	[Amplitude_OIII_5006_Err] [real] NOT NULL,
	[Flux_OIII_5006] [real] NOT NULL,
	[Flux_OIII_5006_Err] [real] NOT NULL,
	[EW_OIII_5006] [real] NOT NULL,
	[EW_OIII_5006_Err] [real] NOT NULL,
	[Flux_Cont_OIII_5006] [real] NOT NULL,
	[Flux_Cont_OIII_5006_Err] [real] NOT NULL,
	[Fit_Warning_OIII_5006] [tinyint] NOT NULL,
	[AoN_OIII_5006] [real] NOT NULL,
	[V_NI_5197] [real] NOT NULL,
	[V_NI_5197_Err] [real] NOT NULL,
	[Sigma_NI_5197] [real] NOT NULL,
	[Sigma_NI_5197_Err] [real] NOT NULL,
	[Amplitude_NI_5197] [real] NOT NULL,
	[Amplitude_NI_5197_Err] [real] NOT NULL,
	[Flux_NI_5197] [real] NOT NULL,
	[Flux_NI_5197_Err] [real] NOT NULL,
	[EW_NI_5197] [real] NOT NULL,
	[EW_NI_5197_Err] [real] NOT NULL,
	[Flux_Cont_NI_5197] [real] NOT NULL,
	[Flux_Cont_NI_5197_Err] [real] NOT NULL,
	[Fit_Warning_NI_5197] [tinyint] NOT NULL,
	[AoN_NI_5197] [real] NOT NULL,
	[V_NI_5200] [real] NOT NULL,
	[V_NI_5200_Err] [real] NOT NULL,
	[Sigma_NI_5200] [real] NOT NULL,
	[Sigma_NI_5200_Err] [real] NOT NULL,
	[Amplitude_NI_5200] [real] NOT NULL,
	[Amplitude_NI_5200_Err] [real] NOT NULL,
	[Flux_NI_5200] [real] NOT NULL,
	[Flux_NI_5200_Err] [real] NOT NULL,
	[EW_NI_5200] [real] NOT NULL,
	[EW_NI_5200_Err] [real] NOT NULL,
	[Flux_Cont_NI_5200] [real] NOT NULL,
	[Flux_Cont_NI_5200_Err] [real] NOT NULL,
	[Fit_Warning_NI_5200] [tinyint] NOT NULL,
	[AoN_NI_5200] [real] NOT NULL,
	[V_HeI_5875] [real] NOT NULL,
	[V_HeI_5875_Err] [real] NOT NULL,
	[Sigma_HeI_5875] [real] NOT NULL,
	[Sigma_HeI_5875_Err] [real] NOT NULL,
	[Amplitude_HeI_5875] [real] NOT NULL,
	[Amplitude_HeI_5875_Err] [real] NOT NULL,
	[Flux_HeI_5875] [real] NOT NULL,
	[Flux_HeI_5875_Err] [real] NOT NULL,
	[EW_HeI_5875] [real] NOT NULL,
	[EW_HeI_5875_Err] [real] NOT NULL,
	[Flux_Cont_HeI_5875] [real] NOT NULL,
	[Flux_Cont_HeI_5875_Err] [real] NOT NULL,
	[Fit_Warning_HeI_5875] [tinyint] NOT NULL,
	[AoN_HeI_5875] [real] NOT NULL,
	[V_OI_6300] [real] NOT NULL,
	[V_OI_6300_Err] [real] NOT NULL,
	[Sigma_OI_6300] [real] NOT NULL,
	[Sigma_OI_6300_Err] [real] NOT NULL,
	[Amplitude_OI_6300] [real] NOT NULL,
	[Amplitude_OI_6300_Err] [real] NOT NULL,
	[Flux_OI_6300] [real] NOT NULL,
	[Flux_OI_6300_Err] [real] NOT NULL,
	[EW_OI_6300] [real] NOT NULL,
	[EW_OI_6300_Err] [real] NOT NULL,
	[Flux_Cont_OI_6300] [real] NOT NULL,
	[Flux_Cont_OI_6300_Err] [real] NOT NULL,
	[Fit_Warning_OI_6300] [tinyint] NOT NULL,
	[AoN_OI_6300] [real] NOT NULL,
	[V_OI_6363] [real] NOT NULL,
	[V_OI_6363_Err] [real] NOT NULL,
	[Sigma_OI_6363] [real] NOT NULL,
	[Sigma_OI_6363_Err] [real] NOT NULL,
	[Amplitude_OI_6363] [real] NOT NULL,
	[Amplitude_OI_6363_Err] [real] NOT NULL,
	[Flux_OI_6363] [real] NOT NULL,
	[Flux_OI_6363_Err] [real] NOT NULL,
	[EW_OI_6363] [real] NOT NULL,
	[EW_OI_6363_Err] [real] NOT NULL,
	[Flux_Cont_OI_6363] [real] NOT NULL,
	[Flux_Cont_OI_6363_Err] [real] NOT NULL,
	[Fit_Warning_OI_6363] [tinyint] NOT NULL,
	[AoN_OI_6363] [real] NOT NULL,
	[V_NII_6547] [real] NOT NULL,
	[V_NII_6547_Err] [real] NOT NULL,
	[Sigma_NII_6547] [real] NOT NULL,
	[Sigma_NII_6547_Err] [real] NOT NULL,
	[Amplitude_NII_6547] [real] NOT NULL,
	[Amplitude_NII_6547_Err] [real] NOT NULL,
	[Flux_NII_6547] [real] NOT NULL,
	[Flux_NII_6547_Err] [real] NOT NULL,
	[EW_NII_6547] [real] NOT NULL,
	[EW_NII_6547_Err] [real] NOT NULL,
	[Flux_Cont_NII_6547] [real] NOT NULL,
	[Flux_Cont_NII_6547_Err] [real] NOT NULL,
	[Fit_Warning_NII_6547] [tinyint] NOT NULL,
	[V_Ha_6562] [real] NOT NULL,
	[V_Ha_6562_Err] [real] NOT NULL,
	[Sigma_Ha_6562] [real] NOT NULL,
	[Sigma_Ha_6562_Err] [real] NOT NULL,
	[Amplitude_Ha_6562] [real] NOT NULL,
	[Amplitude_Ha_6562_Err] [real] NOT NULL,
	[Flux_Ha_6562] [real] NOT NULL,
	[Flux_Ha_6562_Err] [real] NOT NULL,
	[EW_Ha_6562] [real] NOT NULL,
	[EW_Ha_6562_Err] [real] NOT NULL,
	[Flux_Cont_Ha_6562] [real] NOT NULL,
	[Flux_Cont_Ha_6562_Err] [real] NOT NULL,
	[Fit_Warning_Ha_6562] [tinyint] NOT NULL,
	[AoN_Ha_6562] [real] NOT NULL,
	[V_NII_6583] [real] NOT NULL,
	[V_NII_6583_Err] [real] NOT NULL,
	[Sigma_NII_6583] [real] NOT NULL,
	[Sigma_NII_6583_Err] [real] NOT NULL,
	[Amplitude_NII_6583] [real] NOT NULL,
	[Amplitude_NII_6583_Err] [real] NOT NULL,
	[Flux_NII_6583] [real] NOT NULL,
	[Flux_NII_6583_Err] [real] NOT NULL,
	[EW_NII_6583] [real] NOT NULL,
	[EW_NII_6583_Err] [real] NOT NULL,
	[Flux_Cont_NII_6583] [real] NOT NULL,
	[Flux_Cont_NII_6583_Err] [real] NOT NULL,
	[Fit_Warning_NII_6583] [tinyint] NOT NULL,
	[AoN_NII_6583] [real] NOT NULL,
	[V_SII_6716] [real] NOT NULL,
	[V_SII_6716_Err] [real] NOT NULL,
	[Sigma_SII_6716] [real] NOT NULL,
	[Sigma_SII_6716_Err] [real] NOT NULL,
	[Amplitude_SII_6716] [real] NOT NULL,
	[Amplitude_SII_6716_Err] [real] NOT NULL,
	[Flux_SII_6716] [real] NOT NULL,
	[Flux_SII_6716_Err] [real] NOT NULL,
	[EW_SII_6716] [real] NOT NULL,
	[EW_SII_6716_Err] [real] NOT NULL,
	[Flux_Cont_SII_6716] [real] NOT NULL,
	[Flux_Cont_SII_6716_Err] [real] NOT NULL,
	[Fit_Warning_SII_6716] [tinyint] NOT NULL,
	[AoN_SII_6716] [real] NOT NULL,
	[V_SII_6730] [real] NOT NULL,
	[V_SII_6730_Err] [real] NOT NULL,
	[Sigma_SII_6730] [real] NOT NULL,
	[Sigma_SII_6730_Err] [real] NOT NULL,
	[Amplitude_SII_6730] [real] NOT NULL,
	[Amplitude_SII_6730_Err] [real] NOT NULL,
	[Flux_SII_6730] [real] NOT NULL,
	[Flux_SII_6730_Err] [real] NOT NULL,
	[EW_SII_6730] [real] NOT NULL,
	[EW_SII_6730_Err] [real] NOT NULL,
	[Flux_Cont_SII_6730] [real] NOT NULL,
	[Flux_Cont_SII_6730_Err] [real] NOT NULL,
	[Fit_Warning_SII_6730] [tinyint] NOT NULL,
	[AoN_SII_6730] [real] NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[Field]    Script Date: 3/22/2017 2:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Field](
	[fieldID] [bigint] NOT NULL,
	[skyVersion] [tinyint] NOT NULL,
	[run] [smallint] NOT NULL,
	[rerun] [smallint] NOT NULL,
	[camcol] [tinyint] NOT NULL,
	[field] [smallint] NOT NULL,
	[nTotal] [smallint] NOT NULL,
	[nObjects] [smallint] NOT NULL,
	[nChild] [smallint] NOT NULL,
	[nGalaxy] [smallint] NOT NULL,
	[nStars] [smallint] NOT NULL,
	[nCR_u] [smallint] NOT NULL,
	[nCR_g] [smallint] NOT NULL,
	[nCR_r] [smallint] NOT NULL,
	[nCR_i] [smallint] NOT NULL,
	[nCR_z] [smallint] NOT NULL,
	[nBrightObj_u] [smallint] NOT NULL,
	[nBrightObj_g] [smallint] NOT NULL,
	[nBrightObj_r] [smallint] NOT NULL,
	[nBrightObj_i] [smallint] NOT NULL,
	[nBrightObj_z] [smallint] NOT NULL,
	[nFaintObj_u] [smallint] NOT NULL,
	[nFaintObj_g] [smallint] NOT NULL,
	[nFaintObj_r] [smallint] NOT NULL,
	[nFaintObj_i] [smallint] NOT NULL,
	[nFaintObj_z] [smallint] NOT NULL,
	[quality] [int] NOT NULL,
	[mjd_u] [float] NOT NULL,
	[mjd_g] [float] NOT NULL,
	[mjd_r] [float] NOT NULL,
	[mjd_i] [float] NOT NULL,
	[mjd_z] [float] NOT NULL,
	[a_u] [float] NOT NULL,
	[a_g] [float] NOT NULL,
	[a_r] [float] NOT NULL,
	[a_i] [float] NOT NULL,
	[a_z] [float] NOT NULL,
	[b_u] [float] NOT NULL,
	[b_g] [float] NOT NULL,
	[b_r] [float] NOT NULL,
	[b_i] [float] NOT NULL,
	[b_z] [float] NOT NULL,
	[c_u] [float] NOT NULL,
	[c_g] [float] NOT NULL,
	[c_r] [float] NOT NULL,
	[c_i] [float] NOT NULL,
	[c_z] [float] NOT NULL,
	[d_u] [float] NOT NULL,
	[d_g] [float] NOT NULL,
	[d_r] [float] NOT NULL,
	[d_i] [float] NOT NULL,
	[d_z] [float] NOT NULL,
	[e_u] [float] NOT NULL,
	[e_g] [float] NOT NULL,
	[e_r] [float] NOT NULL,
	[e_i] [float] NOT NULL,
	[e_z] [float] NOT NULL,
	[f_u] [float] NOT NULL,
	[f_g] [float] NOT NULL,
	[f_r] [float] NOT NULL,
	[f_i] [float] NOT NULL,
	[f_z] [float] NOT NULL,
	[dRow0_u] [real] NOT NULL,
	[dRow0_g] [real] NOT NULL,
	[dRow0_r] [real] NOT NULL,
	[dRow0_i] [real] NOT NULL,
	[dRow0_z] [real] NOT NULL,
	[dRow1_u] [real] NOT NULL,
	[dRow1_g] [real] NOT NULL,
	[dRow1_r] [real] NOT NULL,
	[dRow1_i] [real] NOT NULL,
	[dRow1_z] [real] NOT NULL,
	[dRow2_u] [real] NOT NULL,
	[dRow2_g] [real] NOT NULL,
	[dRow2_r] [real] NOT NULL,
	[dRow2_i] [real] NOT NULL,
	[dRow2_z] [real] NOT NULL,
	[dRow3_u] [real] NOT NULL,
	[dRow3_g] [real] NOT NULL,
	[dRow3_r] [real] NOT NULL,
	[dRow3_i] [real] NOT NULL,
	[dRow3_z] [real] NOT NULL,
	[dCol0_u] [real] NOT NULL,
	[dCol0_g] [real] NOT NULL,
	[dCol0_r] [real] NOT NULL,
	[dCol0_i] [real] NOT NULL,
	[dCol0_z] [real] NOT NULL,
	[dCol1_u] [real] NOT NULL,
	[dCol1_g] [real] NOT NULL,
	[dCol1_r] [real] NOT NULL,
	[dCol1_i] [real] NOT NULL,
	[dCol1_z] [real] NOT NULL,
	[dCol2_u] [real] NOT NULL,
	[dCol2_g] [real] NOT NULL,
	[dCol2_r] [real] NOT NULL,
	[dCol2_i] [real] NOT NULL,
	[dCol2_z] [real] NOT NULL,
	[dCol3_u] [real] NOT NULL,
	[dCol3_g] [real] NOT NULL,
	[dCol3_r] [real] NOT NULL,
	[dCol3_i] [real] NOT NULL,
	[dCol3_z] [real] NOT NULL,
	[csRow_u] [real] NOT NULL,
	[csRow_g] [real] NOT NULL,
	[csRow_r] [real] NOT NULL,
	[csRow_i] [real] NOT NULL,
	[csRow_z] [real] NOT NULL,
	[csCol_u] [real] NOT NULL,
	[csCol_g] [real] NOT NULL,
	[csCol_r] [real] NOT NULL,
	[csCol_i] [real] NOT NULL,
	[csCol_z] [real] NOT NULL,
	[ccRow_u] [real] NOT NULL,
	[ccRow_g] [real] NOT NULL,
	[ccRow_r] [real] NOT NULL,
	[ccRow_i] [real] NOT NULL,
	[ccRow_z] [real] NOT NULL,
	[ccCol_u] [real] NOT NULL,
	[ccCol_g] [real] NOT NULL,
	[ccCol_r] [real] NOT NULL,
	[ccCol_i] [real] NOT NULL,
	[ccCol_z] [real] NOT NULL,
	[riCut_u] [real] NOT NULL,
	[riCut_g] [real] NOT NULL,
	[riCut_r] [real] NOT NULL,
	[riCut_i] [real] NOT NULL,
	[riCut_z] [real] NOT NULL,
	[airmass_u] [real] NOT NULL,
	[airmass_g] [real] NOT NULL,
	[airmass_r] [real] NOT NULL,
	[airmass_i] [real] NOT NULL,
	[airmass_z] [real] NOT NULL,
	[muErr_u] [real] NOT NULL,
	[muErr_g] [real] NOT NULL,
	[muErr_r] [real] NOT NULL,
	[muErr_i] [real] NOT NULL,
	[muErr_z] [real] NOT NULL,
	[nuErr_u] [real] NOT NULL,
	[nuErr_g] [real] NOT NULL,
	[nuErr_r] [real] NOT NULL,
	[nuErr_i] [real] NOT NULL,
	[nuErr_z] [real] NOT NULL,
	[ra] [float] NOT NULL,
	[dec] [float] NOT NULL,
	[raMin] [float] NOT NULL,
	[raMax] [float] NOT NULL,
	[decMin] [float] NOT NULL,
	[decMax] [float] NOT NULL,
	[pixScale] [float] NOT NULL,
	[primaryArea] [float] NOT NULL,
	[photoStatus] [int] NOT NULL,
	[rowOffset_u] [real] NOT NULL,
	[rowOffset_g] [real] NOT NULL,
	[rowOffset_r] [real] NOT NULL,
	[rowOffset_i] [real] NOT NULL,
	[rowOffset_z] [real] NOT NULL,
	[colOffset_u] [real] NOT NULL,
	[colOffset_g] [real] NOT NULL,
	[colOffset_r] [real] NOT NULL,
	[colOffset_i] [real] NOT NULL,
	[colOffset_z] [real] NOT NULL,
	[saturationLevel_u] [int] NOT NULL,
	[saturationLevel_g] [int] NOT NULL,
	[saturationLevel_r] [int] NOT NULL,
	[saturationLevel_i] [int] NOT NULL,
	[saturationLevel_z] [int] NOT NULL,
	[nEffPsf_u] [real] NOT NULL,
	[nEffPsf_g] [real] NOT NULL,
	[nEffPsf_r] [real] NOT NULL,
	[nEffPsf_i] [real] NOT NULL,
	[nEffPsf_z] [real] NOT NULL,
	[skyPsp_u] [real] NOT NULL,
	[skyPsp_g] [real] NOT NULL,
	[skyPsp_r] [real] NOT NULL,
	[skyPsp_i] [real] NOT NULL,
	[skyPsp_z] [real] NOT NULL,
	[skyFrames_u] [real] NOT NULL,
	[skyFrames_g] [real] NOT NULL,
	[skyFrames_r] [real] NOT NULL,
	[skyFrames_i] [real] NOT NULL,
	[skyFrames_z] [real] NOT NULL,
	[skyFramesSub_u] [real] NOT NULL,
	[skyFramesSub_g] [real] NOT NULL,
	[skyFramesSub_r] [real] NOT NULL,
	[skyFramesSub_i] [real] NOT NULL,
	[skyFramesSub_z] [real] NOT NULL,
	[sigPix_u] [real] NOT NULL,
	[sigPix_g] [real] NOT NULL,
	[sigPix_r] [real] NOT NULL,
	[sigPix_i] [real] NOT NULL,
	[sigPix_z] [real] NOT NULL,
	[devApCorrection_u] [real] NOT NULL,
	[devApCorrection_g] [real] NOT NULL,
	[devApCorrection_r] [real] NOT NULL,
	[devApCorrection_i] [real] NOT NULL,
	[devApCorrection_z] [real] NOT NULL,
	[devApCorrectionErr_u] [real] NOT NULL,
	[devApCorrectionErr_g] [real] NOT NULL,
	[devApCorrectionErr_r] [real] NOT NULL,
	[devApCorrectionErr_i] [real] NOT NULL,
	[devApCorrectionErr_z] [real] NOT NULL,
	[expApCorrection_u] [real] NOT NULL,
	[expApCorrection_g] [real] NOT NULL,
	[expApCorrection_r] [real] NOT NULL,
	[expApCorrection_i] [real] NOT NULL,
	[expApCorrection_z] [real] NOT NULL,
	[expApCorrectionErr_u] [real] NOT NULL,
	[expApCorrectionErr_g] [real] NOT NULL,
	[expApCorrectionErr_r] [real] NOT NULL,
	[expApCorrectionErr_i] [real] NOT NULL,
	[expApCorrectionErr_z] [real] NOT NULL,
	[devModelApCorrection_u] [real] NOT NULL,
	[devModelApCorrection_g] [real] NOT NULL,
	[devModelApCorrection_r] [real] NOT NULL,
	[devModelApCorrection_i] [real] NOT NULL,
	[devModelApCorrection_z] [real] NOT NULL,
	[devModelApCorrectionErr_u] [real] NOT NULL,
	[devModelApCorrectionErr_g] [real] NOT NULL,
	[devModelApCorrectionErr_r] [real] NOT NULL,
	[devModelApCorrectionErr_i] [real] NOT NULL,
	[devModelApCorrectionErr_z] [real] NOT NULL,
	[expModelApCorrection_u] [real] NOT NULL,
	[expModelApCorrection_g] [real] NOT NULL,
	[expModelApCorrection_r] [real] NOT NULL,
	[expModelApCorrection_i] [real] NOT NULL,
	[expModelApCorrection_z] [real] NOT NULL,
	[expModelApCorrectionErr_u] [real] NOT NULL,
	[expModelApCorrectionErr_g] [real] NOT NULL,
	[expModelApCorrectionErr_r] [real] NOT NULL,
	[expModelApCorrectionErr_i] [real] NOT NULL,
	[expModelApCorrectionErr_z] [real] NOT NULL,
	[medianFiberColor_u] [real] NOT NULL,
	[medianFiberColor_g] [real] NOT NULL,
	[medianFiberColor_r] [real] NOT NULL,
	[medianFiberColor_i] [real] NOT NULL,
	[medianFiberColor_z] [real] NOT NULL,
	[medianPsfColor_u] [real] NOT NULL,
	[medianPsfColor_g] [real] NOT NULL,
	[medianPsfColor_r] [real] NOT NULL,
	[medianPsfColor_i] [real] NOT NULL,
	[medianPsfColor_z] [real] NOT NULL,
	[q_u] [real] NOT NULL,
	[q_g] [real] NOT NULL,
	[q_r] [real] NOT NULL,
	[q_i] [real] NOT NULL,
	[q_z] [real] NOT NULL,
	[u_u] [real] NOT NULL,
	[u_g] [real] NOT NULL,
	[u_r] [real] NOT NULL,
	[u_i] [real] NOT NULL,
	[u_z] [real] NOT NULL,
	[pspStatus] [smallint] NOT NULL,
	[sky_u] [real] NOT NULL,
	[sky_g] [real] NOT NULL,
	[sky_r] [real] NOT NULL,
	[sky_i] [real] NOT NULL,
	[sky_z] [real] NOT NULL,
	[skySig_u] [real] NOT NULL,
	[skySig_g] [real] NOT NULL,
	[skySig_r] [real] NOT NULL,
	[skySig_i] [real] NOT NULL,
	[skySig_z] [real] NOT NULL,
	[skyErr_u] [real] NOT NULL,
	[skyErr_g] [real] NOT NULL,
	[skyErr_r] [real] NOT NULL,
	[skyErr_i] [real] NOT NULL,
	[skyErr_z] [real] NOT NULL,
	[skySlope_u] [real] NOT NULL,
	[skySlope_g] [real] NOT NULL,
	[skySlope_r] [real] NOT NULL,
	[skySlope_i] [real] NOT NULL,
	[skySlope_z] [real] NOT NULL,
	[lbias_u] [real] NOT NULL,
	[lbias_g] [real] NOT NULL,
	[lbias_r] [real] NOT NULL,
	[lbias_i] [real] NOT NULL,
	[lbias_z] [real] NOT NULL,
	[rbias_u] [real] NOT NULL,
	[rbias_g] [real] NOT NULL,
	[rbias_r] [real] NOT NULL,
	[rbias_i] [real] NOT NULL,
	[rbias_z] [real] NOT NULL,
	[nProf_u] [int] NOT NULL,
	[nProf_g] [int] NOT NULL,
	[nProf_r] [int] NOT NULL,
	[nProf_i] [int] NOT NULL,
	[nProf_z] [int] NOT NULL,
	[psfNStar_u] [int] NOT NULL,
	[psfNStar_g] [int] NOT NULL,
	[psfNStar_r] [int] NOT NULL,
	[psfNStar_i] [int] NOT NULL,
	[psfNStar_z] [int] NOT NULL,
	[psfApCorrectionErr_u] [real] NOT NULL,
	[psfApCorrectionErr_g] [real] NOT NULL,
	[psfApCorrectionErr_r] [real] NOT NULL,
	[psfApCorrectionErr_i] [real] NOT NULL,
	[psfApCorrectionErr_z] [real] NOT NULL,
	[psfSigma1_u] [real] NOT NULL,
	[psfSigma1_g] [real] NOT NULL,
	[psfSigma1_r] [real] NOT NULL,
	[psfSigma1_i] [real] NOT NULL,
	[psfSigma1_z] [real] NOT NULL,
	[psfSigma2_u] [real] NOT NULL,
	[psfSigma2_g] [real] NOT NULL,
	[psfSigma2_r] [real] NOT NULL,
	[psfSigma2_i] [real] NOT NULL,
	[psfSigma2_z] [real] NOT NULL,
	[psfB_u] [real] NOT NULL,
	[psfB_g] [real] NOT NULL,
	[psfB_r] [real] NOT NULL,
	[psfB_i] [real] NOT NULL,
	[psfB_z] [real] NOT NULL,
	[psfP0_u] [real] NOT NULL,
	[psfP0_g] [real] NOT NULL,
	[psfP0_r] [real] NOT NULL,
	[psfP0_i] [real] NOT NULL,
	[psfP0_z] [real] NOT NULL,
	[psfBeta_u] [real] NOT NULL,
	[psfBeta_g] [real] NOT NULL,
	[psfBeta_r] [real] NOT NULL,
	[psfBeta_i] [real] NOT NULL,
	[psfBeta_z] [real] NOT NULL,
	[psfSigmaP_u] [real] NOT NULL,
	[psfSigmaP_g] [real] NOT NULL,
	[psfSigmaP_r] [real] NOT NULL,
	[psfSigmaP_i] [real] NOT NULL,
	[psfSigmaP_z] [real] NOT NULL,
	[psfWidth_u] [real] NOT NULL,
	[psfWidth_g] [real] NOT NULL,
	[psfWidth_r] [real] NOT NULL,
	[psfWidth_i] [real] NOT NULL,
	[psfWidth_z] [real] NOT NULL,
	[psfPsfCounts_u] [real] NOT NULL,
	[psfPsfCounts_g] [real] NOT NULL,
	[psfPsfCounts_r] [real] NOT NULL,
	[psfPsfCounts_i] [real] NOT NULL,
	[psfPsfCounts_z] [real] NOT NULL,
	[psf2GSigma1_u] [real] NOT NULL,
	[psf2GSigma1_g] [real] NOT NULL,
	[psf2GSigma1_r] [real] NOT NULL,
	[psf2GSigma1_i] [real] NOT NULL,
	[psf2GSigma1_z] [real] NOT NULL,
	[psf2GSigma2_u] [real] NOT NULL,
	[psf2GSigma2_g] [real] NOT NULL,
	[psf2GSigma2_r] [real] NOT NULL,
	[psf2GSigma2_i] [real] NOT NULL,
	[psf2GSigma2_z] [real] NOT NULL,
	[psf2GB_u] [real] NOT NULL,
	[psf2GB_g] [real] NOT NULL,
	[psf2GB_r] [real] NOT NULL,
	[psf2GB_i] [real] NOT NULL,
	[psf2GB_z] [real] NOT NULL,
	[psfCounts_u] [real] NOT NULL,
	[psfCounts_g] [real] NOT NULL,
	[psfCounts_r] [real] NOT NULL,
	[psfCounts_i] [real] NOT NULL,
	[psfCounts_z] [real] NOT NULL,
	[gain_u] [real] NOT NULL,
	[gain_g] [real] NOT NULL,
	[gain_r] [real] NOT NULL,
	[gain_i] [real] NOT NULL,
	[gain_z] [real] NOT NULL,
	[darkVariance_u] [real] NOT NULL,
	[darkVariance_g] [real] NOT NULL,
	[darkVariance_r] [real] NOT NULL,
	[darkVariance_i] [real] NOT NULL,
	[darkVariance_z] [real] NOT NULL,
	[score] [real] NOT NULL,
	[aterm_u] [real] NOT NULL,
	[aterm_g] [real] NOT NULL,
	[aterm_r] [real] NOT NULL,
	[aterm_i] [real] NOT NULL,
	[aterm_z] [real] NOT NULL,
	[kterm_u] [real] NOT NULL,
	[kterm_g] [real] NOT NULL,
	[kterm_r] [real] NOT NULL,
	[kterm_i] [real] NOT NULL,
	[kterm_z] [real] NOT NULL,
	[kdot_u] [real] NOT NULL,
	[kdot_g] [real] NOT NULL,
	[kdot_r] [real] NOT NULL,
	[kdot_i] [real] NOT NULL,
	[kdot_z] [real] NOT NULL,
	[reftai_u] [float] NOT NULL,
	[reftai_g] [float] NOT NULL,
	[reftai_r] [float] NOT NULL,
	[reftai_i] [float] NOT NULL,
	[reftai_z] [float] NOT NULL,
	[tai_u] [float] NOT NULL,
	[tai_g] [float] NOT NULL,
	[tai_r] [float] NOT NULL,
	[tai_i] [float] NOT NULL,
	[tai_z] [float] NOT NULL,
	[nStarsOffset_u] [int] NOT NULL,
	[nStarsOffset_g] [int] NOT NULL,
	[nStarsOffset_r] [int] NOT NULL,
	[nStarsOffset_i] [int] NOT NULL,
	[nStarsOffset_z] [int] NOT NULL,
	[fieldOffset_u] [real] NOT NULL,
	[fieldOffset_g] [real] NOT NULL,
	[fieldOffset_r] [real] NOT NULL,
	[fieldOffset_i] [real] NOT NULL,
	[fieldOffset_z] [real] NOT NULL,
	[calibStatus_u] [int] NOT NULL,
	[calibStatus_g] [int] NOT NULL,
	[calibStatus_r] [int] NOT NULL,
	[calibStatus_i] [int] NOT NULL,
	[calibStatus_z] [int] NOT NULL,
	[imageStatus_u] [int] NOT NULL,
	[imageStatus_g] [int] NOT NULL,
	[imageStatus_r] [int] NOT NULL,
	[imageStatus_i] [int] NOT NULL,
	[imageStatus_z] [int] NOT NULL,
	[nMgyPerCount_u] [real] NOT NULL,
	[nMgyPerCount_g] [real] NOT NULL,
	[nMgyPerCount_r] [real] NOT NULL,
	[nMgyPerCount_i] [real] NOT NULL,
	[nMgyPerCount_z] [real] NOT NULL,
	[nMgyPerCountIvar_u] [real] NOT NULL,
	[nMgyPerCountIvar_g] [real] NOT NULL,
	[nMgyPerCountIvar_r] [real] NOT NULL,
	[nMgyPerCountIvar_i] [real] NOT NULL,
	[nMgyPerCountIvar_z] [real] NOT NULL,
	[ifield] [int] NOT NULL,
	[muStart] [float] NOT NULL,
	[muEnd] [float] NOT NULL,
	[nuStart] [float] NOT NULL,
	[nuEnd] [float] NOT NULL,
	[ifindx] [int] NOT NULL,
	[nBalkans] [int] NOT NULL,
	[loadVersion] [int] NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[FieldProfile]    Script Date: 3/22/2017 2:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FieldProfile](
	[bin] [tinyint] NOT NULL,
	[band] [tinyint] NOT NULL,
	[profMean] [real] NOT NULL,
	[profMed] [real] NOT NULL,
	[profSig] [real] NOT NULL,
	[fieldID] [bigint] NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[FileGroupMap]    Script Date: 3/22/2017 2:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FileGroupMap](
	[tableName] [varchar](128) NOT NULL,
	[tableFileGroup] [varchar](100) NOT NULL,
	[indexFileGroup] [varchar](100) NOT NULL,
	[comment] [varchar](4000) NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[FIRST]    Script Date: 3/22/2017 2:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FIRST](
	[objID] [bigint] NOT NULL,
	[ra] [float] NOT NULL,
	[dec] [float] NOT NULL,
	[warning] [varchar](50) NOT NULL,
	[peak] [real] NOT NULL,
	[integr] [real] NOT NULL,
	[rms] [real] NOT NULL,
	[major] [real] NOT NULL,
	[minor] [real] NOT NULL,
	[pa] [real] NOT NULL,
	[skyrms] [real] NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[Frame]    Script Date: 3/22/2017 2:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Frame](
	[fieldID] [bigint] NOT NULL,
	[zoom] [int] NOT NULL,
	[run] [int] NOT NULL,
	[rerun] [int] NOT NULL,
	[camcol] [int] NOT NULL,
	[field] [int] NOT NULL,
	[stripe] [int] NOT NULL,
	[strip] [varchar](32) NOT NULL,
	[a] [float] NOT NULL,
	[b] [float] NOT NULL,
	[c] [float] NOT NULL,
	[d] [float] NOT NULL,
	[e] [float] NOT NULL,
	[f] [float] NOT NULL,
	[node] [float] NOT NULL,
	[incl] [float] NOT NULL,
	[raMin] [float] NOT NULL,
	[raMax] [float] NOT NULL,
	[decMin] [float] NOT NULL,
	[decMax] [float] NOT NULL,
	[mu] [float] NOT NULL,
	[nu] [float] NOT NULL,
	[ra] [float] NOT NULL,
	[dec] [float] NOT NULL,
	[cx] [float] NOT NULL,
	[cy] [float] NOT NULL,
	[cz] [float] NOT NULL,
	[htmID] [bigint] NOT NULL,
	[img] [varbinary](max) NOT NULL
) ON [FRAME] TEXTIMAGE_ON [FRAME]

GO
/****** Object:  Table [dbo].[galSpecExtra]    Script Date: 3/22/2017 2:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[galSpecExtra](
	[specObjID] [numeric](20, 0) NOT NULL,
	[bptclass] [smallint] NOT NULL,
	[oh_p2p5] [real] NOT NULL,
	[oh_p16] [real] NOT NULL,
	[oh_p50] [real] NOT NULL,
	[oh_p84] [real] NOT NULL,
	[oh_p97p5] [real] NOT NULL,
	[oh_entropy] [real] NOT NULL,
	[lgm_tot_p2p5] [real] NOT NULL,
	[lgm_tot_p16] [real] NOT NULL,
	[lgm_tot_p50] [real] NOT NULL,
	[lgm_tot_p84] [real] NOT NULL,
	[lgm_tot_p97p5] [real] NOT NULL,
	[lgm_fib_p2p5] [real] NOT NULL,
	[lgm_fib_p16] [real] NOT NULL,
	[lgm_fib_p50] [real] NOT NULL,
	[lgm_fib_p84] [real] NOT NULL,
	[lgm_fib_p97p5] [real] NOT NULL,
	[sfr_tot_p2p5] [real] NOT NULL,
	[sfr_tot_p16] [real] NOT NULL,
	[sfr_tot_p50] [real] NOT NULL,
	[sfr_tot_p84] [real] NOT NULL,
	[sfr_tot_p97p5] [real] NOT NULL,
	[sfr_tot_entropy] [real] NOT NULL,
	[sfr_fib_p2p5] [real] NOT NULL,
	[sfr_fib_p16] [real] NOT NULL,
	[sfr_fib_p50] [real] NOT NULL,
	[sfr_fib_p84] [real] NOT NULL,
	[sfr_fib_p97p5] [real] NOT NULL,
	[sfr_fib_entropy] [real] NOT NULL,
	[specsfr_tot_p2p5] [real] NOT NULL,
	[specsfr_tot_p16] [real] NOT NULL,
	[specsfr_tot_p50] [real] NOT NULL,
	[specsfr_tot_p84] [real] NOT NULL,
	[specsfr_tot_p97p5] [real] NOT NULL,
	[specsfr_tot_entropy] [real] NOT NULL,
	[specsfr_fib_p2p5] [real] NOT NULL,
	[specsfr_fib_p16] [real] NOT NULL,
	[specsfr_fib_p50] [real] NOT NULL,
	[specsfr_fib_p84] [real] NOT NULL,
	[specsfr_fib_p97p5] [real] NOT NULL,
	[specsfr_fib_entropy] [real] NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[galSpecIndx]    Script Date: 3/22/2017 2:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[galSpecIndx](
	[specObjID] [numeric](20, 0) NOT NULL,
	[lick_cn1] [real] NOT NULL,
	[lick_cn1_err] [real] NOT NULL,
	[lick_cn1_model] [real] NOT NULL,
	[lick_cn1_sub] [real] NOT NULL,
	[lick_cn1_sub_err] [real] NOT NULL,
	[lick_cn2] [real] NOT NULL,
	[lick_cn2_err] [real] NOT NULL,
	[lick_cn2_model] [real] NOT NULL,
	[lick_cn2_sub] [real] NOT NULL,
	[lick_cn2_sub_err] [real] NOT NULL,
	[lick_ca4227] [real] NOT NULL,
	[lick_ca4227_err] [real] NOT NULL,
	[lick_ca4227_model] [real] NOT NULL,
	[lick_ca4227_sub] [real] NOT NULL,
	[lick_ca4227_sub_err] [real] NOT NULL,
	[lick_g4300] [real] NOT NULL,
	[lick_g4300_err] [real] NOT NULL,
	[lick_g4300_model] [real] NOT NULL,
	[lick_g4300_sub] [real] NOT NULL,
	[lick_g4300_sub_err] [real] NOT NULL,
	[lick_fe4383] [real] NOT NULL,
	[lick_fe4383_err] [real] NOT NULL,
	[lick_fe4383_model] [real] NOT NULL,
	[lick_fe4383_sub] [real] NOT NULL,
	[lick_fe4383_sub_err] [real] NOT NULL,
	[lick_ca4455] [real] NOT NULL,
	[lick_ca4455_err] [real] NOT NULL,
	[lick_ca4455_model] [real] NOT NULL,
	[lick_ca4455_sub] [real] NOT NULL,
	[lick_ca4455_sub_err] [real] NOT NULL,
	[lick_fe4531] [real] NOT NULL,
	[lick_fe4531_err] [real] NOT NULL,
	[lick_fe4531_model] [real] NOT NULL,
	[lick_fe4531_sub] [real] NOT NULL,
	[lick_fe4531_sub_err] [real] NOT NULL,
	[lick_c4668] [real] NOT NULL,
	[lick_c4668_err] [real] NOT NULL,
	[lick_c4668_model] [real] NOT NULL,
	[lick_c4668_sub] [real] NOT NULL,
	[lick_c4668_sub_err] [real] NOT NULL,
	[lick_hb] [real] NOT NULL,
	[lick_hb_err] [real] NOT NULL,
	[lick_hb_model] [real] NOT NULL,
	[lick_hb_sub] [real] NOT NULL,
	[lick_hb_sub_err] [real] NOT NULL,
	[lick_fe5015] [real] NOT NULL,
	[lick_fe5015_err] [real] NOT NULL,
	[lick_fe5015_model] [real] NOT NULL,
	[lick_fe5015_sub] [real] NOT NULL,
	[lick_fe5015_sub_err] [real] NOT NULL,
	[lick_mg1] [real] NOT NULL,
	[lick_mg1_err] [real] NOT NULL,
	[lick_mg1_model] [real] NOT NULL,
	[lick_mg1_sub] [real] NOT NULL,
	[lick_mg1_sub_err] [real] NOT NULL,
	[lick_mg2] [real] NOT NULL,
	[lick_mg2_err] [real] NOT NULL,
	[lick_mg2_model] [real] NOT NULL,
	[lick_mg2_sub] [real] NOT NULL,
	[lick_mg2_sub_err] [real] NOT NULL,
	[lick_mgb] [real] NOT NULL,
	[lick_mgb_err] [real] NOT NULL,
	[lick_mgb_model] [real] NOT NULL,
	[lick_mgb_sub] [real] NOT NULL,
	[lick_mgb_sub_err] [real] NOT NULL,
	[lick_fe5270] [real] NOT NULL,
	[lick_fe5270_err] [real] NOT NULL,
	[lick_fe5270_model] [real] NOT NULL,
	[lick_fe5270_sub] [real] NOT NULL,
	[lick_fe5270_sub_err] [real] NOT NULL,
	[lick_fe5335] [real] NOT NULL,
	[lick_fe5335_err] [real] NOT NULL,
	[lick_fe5335_model] [real] NOT NULL,
	[lick_fe5335_sub] [real] NOT NULL,
	[lick_fe5335_sub_err] [real] NOT NULL,
	[lick_fe5406] [real] NOT NULL,
	[lick_fe5406_err] [real] NOT NULL,
	[lick_fe5406_model] [real] NOT NULL,
	[lick_fe5406_sub] [real] NOT NULL,
	[lick_fe5406_sub_err] [real] NOT NULL,
	[lick_fe5709] [real] NOT NULL,
	[lick_fe5709_err] [real] NOT NULL,
	[lick_fe5709_model] [real] NOT NULL,
	[lick_fe5709_sub] [real] NOT NULL,
	[lick_fe5709_sub_err] [real] NOT NULL,
	[lick_fe5782] [real] NOT NULL,
	[lick_fe5782_err] [real] NOT NULL,
	[lick_fe5782_model] [real] NOT NULL,
	[lick_fe5782_sub] [real] NOT NULL,
	[lick_fe5782_sub_err] [real] NOT NULL,
	[lick_nad] [real] NOT NULL,
	[lick_nad_err] [real] NOT NULL,
	[lick_nad_model] [real] NOT NULL,
	[lick_nad_sub] [real] NOT NULL,
	[lick_nad_sub_err] [real] NOT NULL,
	[lick_tio1] [real] NOT NULL,
	[lick_tio1_err] [real] NOT NULL,
	[lick_tio1_model] [real] NOT NULL,
	[lick_tio1_sub] [real] NOT NULL,
	[lick_tio1_sub_err] [real] NOT NULL,
	[lick_tio2] [real] NOT NULL,
	[lick_tio2_err] [real] NOT NULL,
	[lick_tio2_model] [real] NOT NULL,
	[lick_tio2_sub] [real] NOT NULL,
	[lick_tio2_sub_err] [real] NOT NULL,
	[lick_hd_a] [real] NOT NULL,
	[lick_hd_a_err] [real] NOT NULL,
	[lick_hd_a_model] [real] NOT NULL,
	[lick_hd_a_sub] [real] NOT NULL,
	[lick_hd_a_sub_err] [real] NOT NULL,
	[lick_hg_a] [real] NOT NULL,
	[lick_hg_a_err] [real] NOT NULL,
	[lick_hg_a_model] [real] NOT NULL,
	[lick_hg_a_sub] [real] NOT NULL,
	[lick_hg_a_sub_err] [real] NOT NULL,
	[lick_hd_f] [real] NOT NULL,
	[lick_hd_f_err] [real] NOT NULL,
	[lick_hd_f_model] [real] NOT NULL,
	[lick_hd_f_sub] [real] NOT NULL,
	[lick_hd_f_sub_err] [real] NOT NULL,
	[lick_hg_f] [real] NOT NULL,
	[lick_hg_f_err] [real] NOT NULL,
	[lick_hg_f_model] [real] NOT NULL,
	[lick_hg_f_sub] [real] NOT NULL,
	[lick_hg_f_sub_err] [real] NOT NULL,
	[dtt_caii8498] [real] NOT NULL,
	[dtt_caii8498_err] [real] NOT NULL,
	[dtt_caii8498_model] [real] NOT NULL,
	[dtt_caii8498_sub] [real] NOT NULL,
	[dtt_caii8498_sub_err] [real] NOT NULL,
	[dtt_caii8542] [real] NOT NULL,
	[dtt_caii8542_err] [real] NOT NULL,
	[dtt_caii8542_model] [real] NOT NULL,
	[dtt_caii8542_sub] [real] NOT NULL,
	[dtt_caii8542_sub_err] [real] NOT NULL,
	[dtt_caii8662] [real] NOT NULL,
	[dtt_caii8662_err] [real] NOT NULL,
	[dtt_caii8662_model] [real] NOT NULL,
	[dtt_caii8662_sub] [real] NOT NULL,
	[dtt_caii8662_sub_err] [real] NOT NULL,
	[dtt_mgi8807] [real] NOT NULL,
	[dtt_mgi8807_err] [real] NOT NULL,
	[dtt_mgi8807_model] [real] NOT NULL,
	[dtt_mgi8807_sub] [real] NOT NULL,
	[dtt_mgi8807_sub_err] [real] NOT NULL,
	[bh_cnb] [real] NOT NULL,
	[bh_cnb_err] [real] NOT NULL,
	[bh_cnb_model] [real] NOT NULL,
	[bh_cnb_sub] [real] NOT NULL,
	[bh_cnb_sub_err] [real] NOT NULL,
	[bh_hk] [real] NOT NULL,
	[bh_hk_err] [real] NOT NULL,
	[bh_hk_model] [real] NOT NULL,
	[bh_hk_sub] [real] NOT NULL,
	[bh_hk_sub_err] [real] NOT NULL,
	[bh_cai] [real] NOT NULL,
	[bh_cai_err] [real] NOT NULL,
	[bh_cai_model] [real] NOT NULL,
	[bh_cai_sub] [real] NOT NULL,
	[bh_cai_sub_err] [real] NOT NULL,
	[bh_g] [real] NOT NULL,
	[bh_g_err] [real] NOT NULL,
	[bh_g_model] [real] NOT NULL,
	[bh_g_sub] [real] NOT NULL,
	[bh_g_sub_err] [real] NOT NULL,
	[bh_hb] [real] NOT NULL,
	[bh_hb_err] [real] NOT NULL,
	[bh_hb_model] [real] NOT NULL,
	[bh_hb_sub] [real] NOT NULL,
	[bh_hb_sub_err] [real] NOT NULL,
	[bh_mgg] [real] NOT NULL,
	[bh_mgg_err] [real] NOT NULL,
	[bh_mgg_model] [real] NOT NULL,
	[bh_mgg_sub] [real] NOT NULL,
	[bh_mgg_sub_err] [real] NOT NULL,
	[bh_mh] [real] NOT NULL,
	[bh_mh_err] [real] NOT NULL,
	[bh_mh_model] [real] NOT NULL,
	[bh_mh_sub] [real] NOT NULL,
	[bh_mh_sub_err] [real] NOT NULL,
	[bh_fc] [real] NOT NULL,
	[bh_fc_err] [real] NOT NULL,
	[bh_fc_model] [real] NOT NULL,
	[bh_fc_sub] [real] NOT NULL,
	[bh_fc_sub_err] [real] NOT NULL,
	[bh_nad] [real] NOT NULL,
	[bh_nad_err] [real] NOT NULL,
	[bh_nad_model] [real] NOT NULL,
	[bh_nad_sub] [real] NOT NULL,
	[bh_nad_sub_err] [real] NOT NULL,
	[d4000] [real] NOT NULL,
	[d4000_err] [real] NOT NULL,
	[d4000_model] [real] NOT NULL,
	[d4000_sub] [real] NOT NULL,
	[d4000_sub_err] [real] NOT NULL,
	[d4000_n] [real] NOT NULL,
	[d4000_n_err] [real] NOT NULL,
	[d4000_n_model] [real] NOT NULL,
	[d4000_n_sub] [real] NOT NULL,
	[d4000_n_sub_err] [real] NOT NULL,
	[d4000_red] [real] NOT NULL,
	[d4000_blue] [real] NOT NULL,
	[d4000_n_red] [real] NOT NULL,
	[d4000_n_blue] [real] NOT NULL,
	[d4000_sub_red] [real] NOT NULL,
	[d4000_sub_blue] [real] NOT NULL,
	[d4000_n_sub_red] [real] NOT NULL,
	[d4000_n_sub_blue] [real] NOT NULL,
	[tauv_model_040] [real] NOT NULL,
	[model_coef_040] [real] NOT NULL,
	[model_chisq_040] [real] NOT NULL,
	[tauv_model_080] [real] NOT NULL,
	[model_coef_080] [real] NOT NULL,
	[model_chisq_080] [real] NOT NULL,
	[tauv_model_170] [real] NOT NULL,
	[model_coef_170] [real] NOT NULL,
	[model_chisq_170] [real] NOT NULL,
	[tauv_model_400] [real] NOT NULL,
	[model_coef_400] [real] NOT NULL,
	[model_chisq_400] [real] NOT NULL,
	[best_model_z] [real] NOT NULL,
	[tauv_cont] [real] NOT NULL,
	[model_coef] [real] NOT NULL,
	[model_chisq] [real] NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[galSpecInfo]    Script Date: 3/22/2017 2:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[galSpecInfo](
	[specObjID] [numeric](20, 0) NOT NULL,
	[plateid] [smallint] NOT NULL,
	[mjd] [int] NOT NULL,
	[fiberid] [smallint] NOT NULL,
	[ra] [real] NOT NULL,
	[dec] [real] NOT NULL,
	[primtarget] [smallint] NOT NULL,
	[sectarget] [smallint] NOT NULL,
	[targettype] [varchar](32) NOT NULL,
	[spectrotype] [varchar](32) NOT NULL,
	[subclass] [varchar](32) NOT NULL,
	[z] [real] NOT NULL,
	[z_err] [real] NOT NULL,
	[z_warning] [smallint] NOT NULL,
	[v_disp] [real] NOT NULL,
	[v_disp_err] [real] NOT NULL,
	[sn_median] [real] NOT NULL,
	[e_bv_sfd] [real] NOT NULL,
	[release] [varchar](32) NOT NULL,
	[reliable] [smallint] NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[galSpecLine]    Script Date: 3/22/2017 2:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[galSpecLine](
	[specObjID] [numeric](20, 0) NOT NULL,
	[sigma_balmer] [real] NOT NULL,
	[sigma_balmer_err] [real] NOT NULL,
	[sigma_forbidden] [real] NOT NULL,
	[sigma_forbidden_err] [real] NOT NULL,
	[v_off_balmer] [real] NOT NULL,
	[v_off_balmer_err] [real] NOT NULL,
	[v_off_forbidden] [real] NOT NULL,
	[v_off_forbidden_err] [real] NOT NULL,
	[oii_3726_cont] [real] NOT NULL,
	[oii_3726_cont_err] [real] NOT NULL,
	[oii_3726_reqw] [real] NOT NULL,
	[oii_3726_reqw_err] [real] NOT NULL,
	[oii_3726_eqw] [real] NOT NULL,
	[oii_3726_eqw_err] [real] NOT NULL,
	[oii_3726_flux] [real] NOT NULL,
	[oii_3726_flux_err] [real] NOT NULL,
	[oii_3726_inst_res] [real] NOT NULL,
	[oii_3726_chisq] [real] NOT NULL,
	[oii_3729_cont] [real] NOT NULL,
	[oii_3729_cont_err] [real] NOT NULL,
	[oii_3729_reqw] [real] NOT NULL,
	[oii_3729_reqw_err] [real] NOT NULL,
	[oii_3729_eqw] [real] NOT NULL,
	[oii_3729_eqw_err] [real] NOT NULL,
	[oii_3729_flux] [real] NOT NULL,
	[oii_3729_flux_err] [real] NOT NULL,
	[oii_3729_inst_res] [real] NOT NULL,
	[oii_3729_chisq] [real] NOT NULL,
	[neiii_3869_cont] [real] NOT NULL,
	[neiii_3869_cont_err] [real] NOT NULL,
	[neiii_3869_reqw] [real] NOT NULL,
	[neiii_3869_reqw_err] [real] NOT NULL,
	[neiii_3869_eqw] [real] NOT NULL,
	[neiii_3869_eqw_err] [real] NOT NULL,
	[neiii_3869_flux] [real] NOT NULL,
	[neiii_3869_flux_err] [real] NOT NULL,
	[neiii_3869_inst_res] [real] NOT NULL,
	[neiii_3869_chisq] [real] NOT NULL,
	[h_delta_cont] [real] NOT NULL,
	[h_delta_cont_err] [real] NOT NULL,
	[h_delta_reqw] [real] NOT NULL,
	[h_delta_reqw_err] [real] NOT NULL,
	[h_delta_eqw] [real] NOT NULL,
	[h_delta_eqw_err] [real] NOT NULL,
	[h_delta_flux] [real] NOT NULL,
	[h_delta_flux_err] [real] NOT NULL,
	[h_delta_inst_res] [real] NOT NULL,
	[h_delta_chisq] [real] NOT NULL,
	[h_gamma_cont] [real] NOT NULL,
	[h_gamma_cont_err] [real] NOT NULL,
	[h_gamma_reqw] [real] NOT NULL,
	[h_gamma_reqw_err] [real] NOT NULL,
	[h_gamma_eqw] [real] NOT NULL,
	[h_gamma_eqw_err] [real] NOT NULL,
	[h_gamma_flux] [real] NOT NULL,
	[h_gamma_flux_err] [real] NOT NULL,
	[h_gamma_inst_res] [real] NOT NULL,
	[h_gamma_chisq] [real] NOT NULL,
	[oiii_4363_cont] [real] NOT NULL,
	[oiii_4363_cont_err] [real] NOT NULL,
	[oiii_4363_reqw] [real] NOT NULL,
	[oiii_4363_reqw_err] [real] NOT NULL,
	[oiii_4363_eqw] [real] NOT NULL,
	[oiii_4363_eqw_err] [real] NOT NULL,
	[oiii_4363_flux] [real] NOT NULL,
	[oiii_4363_flux_err] [real] NOT NULL,
	[oiii_4363_inst_res] [real] NOT NULL,
	[oiii_4363_chisq] [real] NOT NULL,
	[h_beta_cont] [real] NOT NULL,
	[h_beta_cont_err] [real] NOT NULL,
	[h_beta_reqw] [real] NOT NULL,
	[h_beta_reqw_err] [real] NOT NULL,
	[h_beta_eqw] [real] NOT NULL,
	[h_beta_eqw_err] [real] NOT NULL,
	[h_beta_flux] [real] NOT NULL,
	[h_beta_flux_err] [real] NOT NULL,
	[h_beta_inst_res] [real] NOT NULL,
	[h_beta_chisq] [real] NOT NULL,
	[oiii_4959_cont] [real] NOT NULL,
	[oiii_4959_cont_err] [real] NOT NULL,
	[oiii_4959_reqw] [real] NOT NULL,
	[oiii_4959_reqw_err] [real] NOT NULL,
	[oiii_4959_eqw] [real] NOT NULL,
	[oiii_4959_eqw_err] [real] NOT NULL,
	[oiii_4959_flux] [real] NOT NULL,
	[oiii_4959_flux_err] [real] NOT NULL,
	[oiii_4959_inst_res] [real] NOT NULL,
	[oiii_4959_chisq] [real] NOT NULL,
	[oiii_5007_cont] [real] NOT NULL,
	[oiii_5007_cont_err] [real] NOT NULL,
	[oiii_5007_reqw] [real] NOT NULL,
	[oiii_5007_reqw_err] [real] NOT NULL,
	[oiii_5007_eqw] [real] NOT NULL,
	[oiii_5007_eqw_err] [real] NOT NULL,
	[oiii_5007_flux] [real] NOT NULL,
	[oiii_5007_flux_err] [real] NOT NULL,
	[oiii_5007_inst_res] [real] NOT NULL,
	[oiii_5007_chisq] [real] NOT NULL,
	[hei_5876_cont] [real] NOT NULL,
	[hei_5876_cont_err] [real] NOT NULL,
	[hei_5876_reqw] [real] NOT NULL,
	[hei_5876_reqw_err] [real] NOT NULL,
	[hei_5876_eqw] [real] NOT NULL,
	[hei_5876_eqw_err] [real] NOT NULL,
	[hei_5876_flux] [real] NOT NULL,
	[hei_5876_flux_err] [real] NOT NULL,
	[hei_5876_inst_res] [real] NOT NULL,
	[hei_5876_chisq] [real] NOT NULL,
	[oi_6300_cont] [real] NOT NULL,
	[oi_6300_cont_err] [real] NOT NULL,
	[oi_6300_reqw] [real] NOT NULL,
	[oi_6300_reqw_err] [real] NOT NULL,
	[oi_6300_eqw] [real] NOT NULL,
	[oi_6300_eqw_err] [real] NOT NULL,
	[oi_6300_flux] [real] NOT NULL,
	[oi_6300_flux_err] [real] NOT NULL,
	[oi_6300_inst_res] [real] NOT NULL,
	[oi_6300_chisq] [real] NOT NULL,
	[nii_6548_cont] [real] NOT NULL,
	[nii_6548_cont_err] [real] NOT NULL,
	[nii_6548_reqw] [real] NOT NULL,
	[nii_6548_reqw_err] [real] NOT NULL,
	[nii_6548_eqw] [real] NOT NULL,
	[nii_6548_eqw_err] [real] NOT NULL,
	[nii_6548_flux] [real] NOT NULL,
	[nii_6548_flux_err] [real] NOT NULL,
	[nii_6548_inst_res] [real] NOT NULL,
	[nii_6548_chisq] [real] NOT NULL,
	[h_alpha_cont] [real] NOT NULL,
	[h_alpha_cont_err] [real] NOT NULL,
	[h_alpha_reqw] [real] NOT NULL,
	[h_alpha_reqw_err] [real] NOT NULL,
	[h_alpha_eqw] [real] NOT NULL,
	[h_alpha_eqw_err] [real] NOT NULL,
	[h_alpha_flux] [real] NOT NULL,
	[h_alpha_flux_err] [real] NOT NULL,
	[h_alpha_inst_res] [real] NOT NULL,
	[h_alpha_chisq] [real] NOT NULL,
	[nii_6584_cont] [real] NOT NULL,
	[nii_6584_cont_err] [real] NOT NULL,
	[nii_6584_reqw] [real] NOT NULL,
	[nii_6584_reqw_err] [real] NOT NULL,
	[nii_6584_eqw] [real] NOT NULL,
	[nii_6584_eqw_err] [real] NOT NULL,
	[nii_6584_flux] [real] NOT NULL,
	[nii_6584_flux_err] [real] NOT NULL,
	[nii_6584_inst_res] [real] NOT NULL,
	[nii_6584_chisq] [real] NOT NULL,
	[sii_6717_cont] [real] NOT NULL,
	[sii_6717_cont_err] [real] NOT NULL,
	[sii_6717_reqw] [real] NOT NULL,
	[sii_6717_reqw_err] [real] NOT NULL,
	[sii_6717_eqw] [real] NOT NULL,
	[sii_6717_eqw_err] [real] NOT NULL,
	[sii_6717_flux] [real] NOT NULL,
	[sii_6717_flux_err] [real] NOT NULL,
	[sii_6717_inst_res] [real] NOT NULL,
	[sii_6717_chisq] [real] NOT NULL,
	[sii_6731_cont] [real] NOT NULL,
	[sii_6731_cont_err] [real] NOT NULL,
	[sii_6731_reqw] [real] NOT NULL,
	[sii_6731_reqw_err] [real] NOT NULL,
	[sii_6731_eqw] [real] NOT NULL,
	[sii_6731_eqw_err] [real] NOT NULL,
	[sii_6731_flux] [real] NOT NULL,
	[sii_6731_flux_err] [real] NOT NULL,
	[sii_6731_inst_res] [real] NOT NULL,
	[sii_6731_chisq] [real] NOT NULL,
	[ariii7135_cont] [real] NOT NULL,
	[ariii7135_cont_err] [real] NOT NULL,
	[ariii7135_reqw] [real] NOT NULL,
	[ariii7135_reqw_err] [real] NOT NULL,
	[ariii7135_eqw] [real] NOT NULL,
	[ariii7135_eqw_err] [real] NOT NULL,
	[ariii7135_flux] [real] NOT NULL,
	[ariii7135_flux_err] [real] NOT NULL,
	[ariii7135_inst_res] [real] NOT NULL,
	[ariii7135_chisq] [real] NOT NULL,
	[oii_sigma] [real] NOT NULL,
	[oii_flux] [real] NOT NULL,
	[oii_flux_err] [real] NOT NULL,
	[oii_voff] [real] NOT NULL,
	[oii_chi2] [real] NOT NULL,
	[oiii_sigma] [real] NOT NULL,
	[oiii_flux] [real] NOT NULL,
	[oiii_flux_err] [real] NOT NULL,
	[oiii_voff] [real] NOT NULL,
	[oiii_chi2] [real] NOT NULL,
	[spectofiber] [real] NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[HalfSpace]    Script Date: 3/22/2017 2:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HalfSpace](
	[constraintid] [bigint] IDENTITY(1,1) NOT NULL,
	[regionid] [bigint] NOT NULL,
	[convexid] [bigint] NOT NULL,
	[x] [float] NOT NULL,
	[y] [float] NOT NULL,
	[z] [float] NOT NULL,
	[c] [float] NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[History]    Script Date: 3/22/2017 2:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[History](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[filename] [varchar](128) NOT NULL,
	[date] [varchar](64) NOT NULL,
	[name] [varchar](64) NOT NULL,
	[description] [varchar](7200) NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[IndexMap]    Script Date: 3/22/2017 2:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IndexMap](
	[indexmapid] [int] IDENTITY(1,1) NOT NULL,
	[code] [varchar](2) NOT NULL,
	[type] [varchar](32) NOT NULL,
	[tableName] [varchar](128) NOT NULL,
	[fieldList] [varchar](1000) NOT NULL,
	[foreignKey] [varchar](1000) NOT NULL,
	[indexgroup] [varchar](128) NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[IndexMap2]    Script Date: 3/22/2017 2:03:33 PM ******/
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
/****** Object:  Table [dbo].[Inventory]    Script Date: 3/22/2017 2:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory](
	[filename] [varchar](128) NOT NULL,
	[name] [varchar](128) NOT NULL,
	[type] [varchar](2) NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[LoadHistory]    Script Date: 3/22/2017 2:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoadHistory](
	[loadversion] [int] NOT NULL,
	[tstart] [datetime] NOT NULL,
	[tend] [datetime] NOT NULL,
	[dbname] [varchar](64) NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[mangaDrpAll]    Script Date: 3/22/2017 2:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mangaDrpAll](
	[plate] [int] NOT NULL,
	[ifudsgn] [varchar](20) NOT NULL,
	[plateifu] [varchar](20) NOT NULL,
	[mangaid] [varchar](20) NOT NULL,
	[versdrp2] [varchar](20) NOT NULL,
	[versdrp3] [varchar](20) NOT NULL,
	[verscore] [varchar](20) NOT NULL,
	[versutil] [varchar](20) NOT NULL,
	[versprim] [varchar](20) NOT NULL,
	[platetyp] [varchar](20) NOT NULL,
	[srvymode] [varchar](20) NOT NULL,
	[objra] [float] NOT NULL,
	[objdec] [float] NOT NULL,
	[ifuglon] [float] NOT NULL,
	[ifuglat] [float] NOT NULL,
	[ifura] [float] NOT NULL,
	[ifudec] [float] NOT NULL,
	[ebvgal] [real] NOT NULL,
	[nexp] [int] NOT NULL,
	[exptime] [real] NOT NULL,
	[drp3qual] [bigint] NOT NULL,
	[bluesn2] [real] NOT NULL,
	[redsn2] [real] NOT NULL,
	[harname] [varchar](20) NOT NULL,
	[frlplug] [int] NOT NULL,
	[cartid] [varchar](20) NOT NULL,
	[designid] [int] NOT NULL,
	[cenra] [float] NOT NULL,
	[cendec] [float] NOT NULL,
	[airmsmin] [real] NOT NULL,
	[airmsmed] [real] NOT NULL,
	[airmsmax] [real] NOT NULL,
	[seemin] [real] NOT NULL,
	[seemed] [real] NOT NULL,
	[seemax] [real] NOT NULL,
	[transmin] [real] NOT NULL,
	[transmed] [real] NOT NULL,
	[transmax] [real] NOT NULL,
	[mjdmin] [int] NOT NULL,
	[mjdmed] [int] NOT NULL,
	[mjdmax] [int] NOT NULL,
	[gfwhm] [real] NOT NULL,
	[rfwhm] [real] NOT NULL,
	[ifwhm] [real] NOT NULL,
	[zfwhm] [real] NOT NULL,
	[mngtarg1] [bigint] NOT NULL,
	[mngtarg2] [bigint] NOT NULL,
	[mngtarg3] [bigint] NOT NULL,
	[catidnum] [bigint] NOT NULL,
	[plttarg] [varchar](20) NOT NULL,
	[manga_tileid] [int] NOT NULL,
	[nsa_iauname] [varchar](20) NOT NULL,
	[ifutargetsize] [int] NOT NULL,
	[ifudesignsize] [int] NOT NULL,
	[ifudesignwrongsize] [int] NOT NULL,
	[nsa_field] [int] NOT NULL,
	[nsa_run] [int] NOT NULL,
	[nsa_camcol] [int] NOT NULL,
	[nsa_version] [varchar](20) NOT NULL,
	[nsa_nsaid] [int] NOT NULL,
	[nsa_nsaid_v1b] [int] NOT NULL,
	[nsa_z] [real] NOT NULL,
	[nsa_zdist] [real] NOT NULL,
	[nsa_elpetro_mass] [real] NOT NULL,
	[nsa_elpetro_absmag_f] [real] NOT NULL,
	[nsa_elpetro_absmag_n] [real] NOT NULL,
	[nsa_elpetro_absmag_u] [real] NOT NULL,
	[nsa_elpetro_absmag_g] [real] NOT NULL,
	[nsa_elpetro_absmag_r] [real] NOT NULL,
	[nsa_elpetro_absmag_i] [real] NOT NULL,
	[nsa_elpetro_absmag_z] [real] NOT NULL,
	[nsa_elpetro_amivar_f] [real] NOT NULL,
	[nsa_elpetro_amivar_n] [real] NOT NULL,
	[nsa_elpetro_amivar_u] [real] NOT NULL,
	[nsa_elpetro_amivar_g] [real] NOT NULL,
	[nsa_elpetro_amivar_r] [real] NOT NULL,
	[nsa_elpetro_amivar_i] [real] NOT NULL,
	[nsa_elpetro_amivar_z] [real] NOT NULL,
	[nsa_elpetro_flux_f] [real] NOT NULL,
	[nsa_elpetro_flux_n] [real] NOT NULL,
	[nsa_elpetro_flux_u] [real] NOT NULL,
	[nsa_elpetro_flux_g] [real] NOT NULL,
	[nsa_elpetro_flux_r] [real] NOT NULL,
	[nsa_elpetro_flux_i] [real] NOT NULL,
	[nsa_elpetro_flux_z] [real] NOT NULL,
	[nsa_elpetro_flux_ivar_f] [real] NOT NULL,
	[nsa_elpetro_flux_ivar_n] [real] NOT NULL,
	[nsa_elpetro_flux_ivar_u] [real] NOT NULL,
	[nsa_elpetro_flux_ivar_g] [real] NOT NULL,
	[nsa_elpetro_flux_ivar_r] [real] NOT NULL,
	[nsa_elpetro_flux_ivar_i] [real] NOT NULL,
	[nsa_elpetro_flux_ivar_z] [real] NOT NULL,
	[nsa_elpetro_th50_r] [real] NOT NULL,
	[nsa_elpetro_phi] [real] NOT NULL,
	[nsa_elpetro_ba] [real] NOT NULL,
	[nsa_sersic_mass] [real] NOT NULL,
	[nsa_sersic_absmag_f] [real] NOT NULL,
	[nsa_sersic_absmag_n] [real] NOT NULL,
	[nsa_sersic_absmag_u] [real] NOT NULL,
	[nsa_sersic_absmag_g] [real] NOT NULL,
	[nsa_sersic_absmag_r] [real] NOT NULL,
	[nsa_sersic_absmag_i] [real] NOT NULL,
	[nsa_sersic_absmag_z] [real] NOT NULL,
	[nsa_sersic_flux_f] [real] NOT NULL,
	[nsa_sersic_flux_n] [real] NOT NULL,
	[nsa_sersic_flux_u] [real] NOT NULL,
	[nsa_sersic_flux_g] [real] NOT NULL,
	[nsa_sersic_flux_r] [real] NOT NULL,
	[nsa_sersic_flux_i] [real] NOT NULL,
	[nsa_sersic_flux_z] [real] NOT NULL,
	[nsa_sersic_flux_ivar_f] [real] NOT NULL,
	[nsa_sersic_flux_ivar_n] [real] NOT NULL,
	[nsa_sersic_flux_ivar_u] [real] NOT NULL,
	[nsa_sersic_flux_ivar_g] [real] NOT NULL,
	[nsa_sersic_flux_ivar_r] [real] NOT NULL,
	[nsa_sersic_flux_ivar_i] [real] NOT NULL,
	[nsa_sersic_flux_ivar_z] [real] NOT NULL,
	[nsa_sersic_th50] [real] NOT NULL,
	[nsa_sersic_phi] [real] NOT NULL,
	[nsa_sersic_ba] [real] NOT NULL,
	[nsa_sersic_n] [real] NOT NULL,
	[nsa_petro_flux_f] [real] NOT NULL,
	[nsa_petro_flux_n] [real] NOT NULL,
	[nsa_petro_flux_u] [real] NOT NULL,
	[nsa_petro_flux_g] [real] NOT NULL,
	[nsa_petro_flux_r] [real] NOT NULL,
	[nsa_petro_flux_i] [real] NOT NULL,
	[nsa_petro_flux_z] [real] NOT NULL,
	[nsa_petro_flux_ivar_f] [real] NOT NULL,
	[nsa_petro_flux_ivar_n] [real] NOT NULL,
	[nsa_petro_flux_ivar_u] [real] NOT NULL,
	[nsa_petro_flux_ivar_g] [real] NOT NULL,
	[nsa_petro_flux_ivar_r] [real] NOT NULL,
	[nsa_petro_flux_ivar_i] [real] NOT NULL,
	[nsa_petro_flux_ivar_z] [real] NOT NULL,
	[nsa_petro_th50] [real] NOT NULL,
	[nsa_extinction_f] [real] NOT NULL,
	[nsa_extinction_n] [real] NOT NULL,
	[nsa_extinction_u] [real] NOT NULL,
	[nsa_extinction_g] [real] NOT NULL,
	[nsa_extinction_r] [real] NOT NULL,
	[nsa_extinction_i] [real] NOT NULL,
	[nsa_extinction_z] [real] NOT NULL,
	[htmID] [bigint] NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[mangatarget]    Script Date: 3/22/2017 2:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mangatarget](
	[catalog_ra] [float] NOT NULL,
	[catalog_dec] [float] NOT NULL,
	[nsa_z] [real] NOT NULL,
	[nsa_zdist] [real] NOT NULL,
	[nsa_elpetro_mass] [real] NOT NULL,
	[nsa_elpetro_absmag_f] [real] NOT NULL,
	[nsa_elpetro_absmag_n] [real] NOT NULL,
	[nsa_elpetro_absmag_u] [real] NOT NULL,
	[nsa_elpetro_absmag_g] [real] NOT NULL,
	[nsa_elpetro_absmag_r] [real] NOT NULL,
	[nsa_elpetro_absmag_i] [real] NOT NULL,
	[nsa_elpetro_absmag_z] [real] NOT NULL,
	[nsa_elpetro_amivar_f] [real] NOT NULL,
	[nsa_elpetro_amivar_n] [real] NOT NULL,
	[nsa_elpetro_amivar_u] [real] NOT NULL,
	[nsa_elpetro_amivar_g] [real] NOT NULL,
	[nsa_elpetro_amivar_r] [real] NOT NULL,
	[nsa_elpetro_amivar_i] [real] NOT NULL,
	[nsa_elpetro_amivar_z] [real] NOT NULL,
	[nsa_elpetro_flux_f] [real] NOT NULL,
	[nsa_elpetro_flux_n] [real] NOT NULL,
	[nsa_elpetro_flux_u] [real] NOT NULL,
	[nsa_elpetro_flux_g] [real] NOT NULL,
	[nsa_elpetro_flux_r] [real] NOT NULL,
	[nsa_elpetro_flux_i] [real] NOT NULL,
	[nsa_elpetro_flux_z] [real] NOT NULL,
	[nsa_elpetro_flux_ivar_f] [real] NOT NULL,
	[nsa_elpetro_flux_ivar_n] [real] NOT NULL,
	[nsa_elpetro_flux_ivar_u] [real] NOT NULL,
	[nsa_elpetro_flux_ivar_g] [real] NOT NULL,
	[nsa_elpetro_flux_ivar_r] [real] NOT NULL,
	[nsa_elpetro_flux_ivar_i] [real] NOT NULL,
	[nsa_elpetro_flux_ivar_z] [real] NOT NULL,
	[nsa_elpetro_th50_r_original] [real] NOT NULL,
	[nsa_elpetro_th50_f] [real] NOT NULL,
	[nsa_elpetro_th50_n] [real] NOT NULL,
	[nsa_elpetro_th50_u] [real] NOT NULL,
	[nsa_elpetro_th50_g] [real] NOT NULL,
	[nsa_elpetro_th50_r] [real] NOT NULL,
	[nsa_elpetro_th50_i] [real] NOT NULL,
	[nsa_elpetro_th50_z] [real] NOT NULL,
	[nsa_elpetro_phi] [real] NOT NULL,
	[nsa_elpetro_ba] [real] NOT NULL,
	[nsa_sersic_mass] [real] NOT NULL,
	[nsa_sersic_absmag_f] [real] NOT NULL,
	[nsa_sersic_absmag_n] [real] NOT NULL,
	[nsa_sersic_absmag_u] [real] NOT NULL,
	[nsa_sersic_absmag_g] [real] NOT NULL,
	[nsa_sersic_absmag_r] [real] NOT NULL,
	[nsa_sersic_absmag_i] [real] NOT NULL,
	[nsa_sersic_absmag_z] [real] NOT NULL,
	[nsa_sersic_amivar_f] [real] NOT NULL,
	[nsa_sersic_amivar_n] [real] NOT NULL,
	[nsa_sersic_amivar_u] [real] NOT NULL,
	[nsa_sersic_amivar_g] [real] NOT NULL,
	[nsa_sersic_amivar_r] [real] NOT NULL,
	[nsa_sersic_amivar_i] [real] NOT NULL,
	[nsa_sersic_amivar_z] [real] NOT NULL,
	[nsa_sersic_flux_f] [real] NOT NULL,
	[nsa_sersic_flux_n] [real] NOT NULL,
	[nsa_sersic_flux_u] [real] NOT NULL,
	[nsa_sersic_flux_g] [real] NOT NULL,
	[nsa_sersic_flux_r] [real] NOT NULL,
	[nsa_sersic_flux_i] [real] NOT NULL,
	[nsa_sersic_flux_z] [real] NOT NULL,
	[nsa_sersic_flux_ivar_f] [real] NOT NULL,
	[nsa_sersic_flux_ivar_n] [real] NOT NULL,
	[nsa_sersic_flux_ivar_u] [real] NOT NULL,
	[nsa_sersic_flux_ivar_g] [real] NOT NULL,
	[nsa_sersic_flux_ivar_r] [real] NOT NULL,
	[nsa_sersic_flux_ivar_i] [real] NOT NULL,
	[nsa_sersic_flux_ivar_z] [real] NOT NULL,
	[nsa_sersic_th50] [real] NOT NULL,
	[nsa_sersic_phi] [real] NOT NULL,
	[nsa_sersic_ba] [real] NOT NULL,
	[nsa_sersic_n] [real] NOT NULL,
	[nsa_petro_flux_f] [real] NOT NULL,
	[nsa_petro_flux_n] [real] NOT NULL,
	[nsa_petro_flux_u] [real] NOT NULL,
	[nsa_petro_flux_g] [real] NOT NULL,
	[nsa_petro_flux_r] [real] NOT NULL,
	[nsa_petro_flux_i] [real] NOT NULL,
	[nsa_petro_flux_z] [real] NOT NULL,
	[nsa_petro_flux_ivar_f] [real] NOT NULL,
	[nsa_petro_flux_ivar_n] [real] NOT NULL,
	[nsa_petro_flux_ivar_u] [real] NOT NULL,
	[nsa_petro_flux_ivar_g] [real] NOT NULL,
	[nsa_petro_flux_ivar_r] [real] NOT NULL,
	[nsa_petro_flux_ivar_i] [real] NOT NULL,
	[nsa_petro_flux_ivar_z] [real] NOT NULL,
	[nsa_petro_th50] [real] NOT NULL,
	[nsa_extinction_f] [real] NOT NULL,
	[nsa_extinction_n] [real] NOT NULL,
	[nsa_extinction_u] [real] NOT NULL,
	[nsa_extinction_g] [real] NOT NULL,
	[nsa_extinction_r] [real] NOT NULL,
	[nsa_extinction_i] [real] NOT NULL,
	[nsa_extinction_z] [real] NOT NULL,
	[nsa_iauname] [varchar](20) NOT NULL,
	[nsa_subdir] [varchar](128) NOT NULL,
	[nsa_pid] [int] NOT NULL,
	[nsa_nsaid] [int] NOT NULL,
	[catind] [int] NOT NULL,
	[manga_target1] [bigint] NOT NULL,
	[mangaID] [varchar](20) NOT NULL,
	[zmin] [real] NOT NULL,
	[zmax] [real] NOT NULL,
	[szmin] [real] NOT NULL,
	[szmax] [real] NOT NULL,
	[ezmin] [real] NOT NULL,
	[ezmax] [real] NOT NULL,
	[ranflag] [bit] NOT NULL,
	[manga_tileids] [int] NOT NULL,
	[manga_tileid] [int] NOT NULL,
	[tilera] [float] NOT NULL,
	[tiledec] [float] NOT NULL,
	[ifutargetsize] [smallint] NOT NULL,
	[ifudesignsize] [smallint] NOT NULL,
	[ifudesignwrongsize] [smallint] NOT NULL,
	[ifu_ra] [float] NOT NULL,
	[ifu_dec] [float] NOT NULL,
	[badphotflag] [bit] NOT NULL,
	[starflag] [bit] NOT NULL,
	[object_ra] [float] NOT NULL,
	[object_dec] [float] NOT NULL,
	[obsflag] [bit] NOT NULL,
	[catindanc] [int] NOT NULL,
	[ifudesignsizemain] [smallint] NOT NULL,
	[ifuminsizeanc] [smallint] NOT NULL,
	[ifutargsizeanc] [smallint] NOT NULL,
	[manga_target3] [bigint] NOT NULL,
	[priorityanc] [int] NOT NULL,
	[unalloc] [smallint] NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[marvelsStar]    Script Date: 3/22/2017 2:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[marvelsStar](
	[STARNAME] [varchar](64) NOT NULL,
	[TWOMASS_NAME] [varchar](64) NOT NULL,
	[Plate] [varchar](32) NOT NULL,
	[GSC_Name] [varchar](64) NOT NULL,
	[TYC_Name] [varchar](64) NOT NULL,
	[HIP_Name] [varchar](62) NOT NULL,
	[RA_Final] [float] NOT NULL,
	[DEC_Final] [float] NOT NULL,
	[GSC_B] [float] NOT NULL,
	[GSC_V] [float] NOT NULL,
	[TWOMASS_J] [real] NOT NULL,
	[TWOMASS_H] [real] NOT NULL,
	[TWOMASS_K] [real] NOT NULL,
	[SP1] [varchar](16) NOT NULL,
	[SP2] [varchar](16) NOT NULL,
	[RPM_LOG_g] [varchar](32) NOT NULL,
	[Teff] [real] NOT NULL,
	[log_g] [real] NOT NULL,
	[FeH] [real] NOT NULL,
	[GSC_B_E] [real] NOT NULL,
	[GSC_V_E] [real] NOT NULL,
	[TWOMASS_J_E] [real] NOT NULL,
	[TWOMASS_H_E] [real] NOT NULL,
	[TWOMASS_K_E] [real] NOT NULL,
	[Teff_E] [real] NOT NULL,
	[log_g_E] [real] NOT NULL,
	[FeH_E] [real] NOT NULL,
	[Epoch_0] [real] NOT NULL,
	[RA_0] [float] NOT NULL,
	[DEC_0] [float] NOT NULL,
	[RA_TWOMASS] [float] NOT NULL,
	[DEC_TWOMASS] [float] NOT NULL,
	[GSC_PM_RA] [float] NOT NULL,
	[GSC_PM_DEC] [float] NOT NULL,
	[GSC_PM_RA_E] [float] NOT NULL,
	[GSC_PM_DEC_E] [float] NOT NULL,
	[TYC_B] [real] NOT NULL,
	[TYC_B_E] [real] NOT NULL,
	[TYC_V] [real] NOT NULL,
	[TYC_V_E] [real] NOT NULL,
	[HIP_PLX] [real] NOT NULL,
	[HIP_PLX_E] [real] NOT NULL,
	[HIP_SPTYPE] [varchar](32) NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[marvelsVelocityCurveUF1D]    Script Date: 3/22/2017 2:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[marvelsVelocityCurveUF1D](
	[STARNAME] [varchar](64) NOT NULL,
	[FCJD] [float] NOT NULL,
	[RV] [float] NOT NULL,
	[PHOTONERR] [float] NOT NULL,
	[STATERROR] [float] NOT NULL,
	[OFFSETERROR] [float] NOT NULL,
	[Keep] [float] NOT NULL,
	[TOTALPHOTONS] [bigint] NOT NULL,
	[BARYCENTRICVEL] [float] NOT NULL,
	[SPECNO] [smallint] NOT NULL,
	[EPOCHFILE] [varchar](256) NOT NULL,
	[TEMPLATEFILE] [varchar](256) NOT NULL,
	[RADECID] [varchar](32) NOT NULL,
	[OBJECT] [varchar](32) NOT NULL,
	[EXPTYPE] [varchar](32) NOT NULL,
	[PLATEID] [varchar](32) NOT NULL,
	[CARTID] [int] NOT NULL,
	[EXPTIME] [int] NOT NULL,
	[DATE-OBS] [varchar](64) NOT NULL,
	[TIME] [varchar](64) NOT NULL,
	[UTC-OBS] [varchar](32) NOT NULL,
	[LST-OBS] [varchar](32) NOT NULL,
	[JD] [real] NOT NULL,
	[FCJD_IMG] [real] NOT NULL,
	[MJD] [real] NOT NULL,
	[RA] [float] NOT NULL,
	[DEC] [float] NOT NULL,
	[EPOCH] [int] NOT NULL,
	[ALT] [real] NOT NULL,
	[AZ] [real] NOT NULL,
	[PMTAVG] [real] NOT NULL,
	[PMTRMS] [real] NOT NULL,
	[PMTMIN] [real] NOT NULL,
	[PMTMAX] [real] NOT NULL,
	[OBSFLAG] [varchar](16) NOT NULL,
	[IMGAVG] [real] NOT NULL,
	[IMGMAX] [real] NOT NULL,
	[IMGMIN] [real] NOT NULL,
	[SNRMAX] [real] NOT NULL,
	[SNRMEDN] [real] NOT NULL,
	[SNRMIN] [real] NOT NULL,
	[SNRAVG] [real] NOT NULL,
	[SNRSTDEV] [real] NOT NULL,
	[SEEING] [real] NOT NULL,
	[CCDTEMP] [real] NOT NULL,
	[CCDPRES] [real] NOT NULL,
	[P1] [real] NOT NULL,
	[P1RMS] [real] NOT NULL,
	[P2] [real] NOT NULL,
	[P2RMS] [real] NOT NULL,
	[P3] [real] NOT NULL,
	[P3RMS] [real] NOT NULL,
	[T1] [real] NOT NULL,
	[T1RMS] [real] NOT NULL,
	[T2] [real] NOT NULL,
	[T2RMS] [real] NOT NULL,
	[T3] [real] NOT NULL,
	[T3RMS] [real] NOT NULL,
	[T4] [real] NOT NULL,
	[T4RMS] [real] NOT NULL,
	[T5] [real] NOT NULL,
	[T5RMS] [real] NOT NULL,
	[T6] [real] NOT NULL,
	[T6RMS] [real] NOT NULL,
	[T7] [real] NOT NULL,
	[T7RMS] [real] NOT NULL,
	[T8] [real] NOT NULL,
	[T8RMS] [real] NOT NULL,
	[T9] [real] NOT NULL,
	[T9RMS] [real] NOT NULL,
	[T10] [real] NOT NULL,
	[T10RMS] [real] NOT NULL,
	[T11] [real] NOT NULL,
	[T11RMS] [real] NOT NULL,
	[T12] [real] NOT NULL,
	[T12RMS] [real] NOT NULL,
	[T13] [real] NOT NULL,
	[T13RMS] [real] NOT NULL,
	[T14] [real] NOT NULL,
	[T14RMS] [real] NOT NULL,
	[T15] [real] NOT NULL,
	[T15RMS] [real] NOT NULL,
	[T16] [real] NOT NULL,
	[T16RMS] [real] NOT NULL,
	[BEAM] [tinyint] NOT NULL,
	[SURVEY] [varchar](16) NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[Mask]    Script Date: 3/22/2017 2:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mask](
	[maskID] [bigint] NOT NULL,
	[run] [smallint] NOT NULL,
	[rerun] [smallint] NOT NULL,
	[camcol] [tinyint] NOT NULL,
	[field] [smallint] NOT NULL,
	[mask] [smallint] NOT NULL,
	[filter] [tinyint] NOT NULL,
	[ra] [float] NOT NULL,
	[dec] [float] NOT NULL,
	[radius] [float] NOT NULL,
	[area] [varchar](4096) NOT NULL,
	[type] [int] NOT NULL,
	[seeing] [real] NOT NULL,
	[cx] [float] NOT NULL,
	[cy] [float] NOT NULL,
	[cz] [float] NOT NULL,
	[htmID] [bigint] NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[MaskedObject]    Script Date: 3/22/2017 2:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaskedObject](
	[objid] [bigint] NOT NULL,
	[maskID] [bigint] NOT NULL,
	[maskType] [int] NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[neighbors]    Script Date: 3/22/2017 2:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[neighbors](
	[objID] [bigint] NOT NULL,
	[NeighborObjID] [bigint] NOT NULL,
	[distance] [float] NULL,
	[type] [smallint] NOT NULL,
	[neighborType] [smallint] NOT NULL,
	[mode] [tinyint] NOT NULL,
	[neighborMode] [tinyint] NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[nsatlas]    Script Date: 3/22/2017 2:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nsatlas](
	[nsaid] [int] NOT NULL,
	[iauname] [varchar](20) NOT NULL,
	[subdir] [varchar](128) NOT NULL,
	[ra] [float] NOT NULL,
	[dec] [float] NOT NULL,
	[isdss] [int] NOT NULL,
	[ined] [int] NOT NULL,
	[isixdf] [int] NOT NULL,
	[ialfalfa] [int] NOT NULL,
	[izcat] [int] NOT NULL,
	[itwodf] [int] NOT NULL,
	[mag] [real] NOT NULL,
	[z] [real] NOT NULL,
	[zsrc] [varchar](20) NOT NULL,
	[size] [real] NOT NULL,
	[run] [smallint] NOT NULL,
	[camcol] [tinyint] NOT NULL,
	[field] [smallint] NOT NULL,
	[rerun] [varchar](20) NOT NULL,
	[xpos] [real] NOT NULL,
	[ypos] [real] NOT NULL,
	[zdist] [real] NOT NULL,
	[plate] [int] NOT NULL,
	[fiberid] [smallint] NOT NULL,
	[mjd] [int] NOT NULL,
	[racat] [float] NOT NULL,
	[deccat] [float] NOT NULL,
	[survey] [varchar](32) NOT NULL,
	[programname] [varchar](32) NOT NULL,
	[platequality] [varchar](32) NOT NULL,
	[tile] [int] NOT NULL,
	[plug_ra] [float] NOT NULL,
	[plug_dec] [float] NOT NULL,
	[in_dr7_lss] [tinyint] NOT NULL,
	[elpetro_ba] [real] NOT NULL,
	[elpetro_phi] [real] NOT NULL,
	[elpetro_theta] [real] NOT NULL,
	[elpetro_theta_r_original] [real] NOT NULL,
	[elpetro_flux_f] [real] NOT NULL,
	[elpetro_flux_n] [real] NOT NULL,
	[elpetro_flux_u] [real] NOT NULL,
	[elpetro_flux_g] [real] NOT NULL,
	[elpetro_flux_r] [real] NOT NULL,
	[elpetro_flux_i] [real] NOT NULL,
	[elpetro_flux_z] [real] NOT NULL,
	[elpetro_flux_r_original] [real] NOT NULL,
	[elpetro_flux_ivar_f] [real] NOT NULL,
	[elpetro_flux_ivar_n] [real] NOT NULL,
	[elpetro_flux_ivar_u] [real] NOT NULL,
	[elpetro_flux_ivar_g] [real] NOT NULL,
	[elpetro_flux_ivar_r] [real] NOT NULL,
	[elpetro_flux_ivar_i] [real] NOT NULL,
	[elpetro_flux_ivar_z] [real] NOT NULL,
	[elpetro_flux_ivar_r_original] [real] NOT NULL,
	[elpetro_th50_f] [real] NOT NULL,
	[elpetro_th50_n] [real] NOT NULL,
	[elpetro_th50_u] [real] NOT NULL,
	[elpetro_th50_g] [real] NOT NULL,
	[elpetro_th50_r] [real] NOT NULL,
	[elpetro_th50_i] [real] NOT NULL,
	[elpetro_th50_z] [real] NOT NULL,
	[elpetro_th90_f] [real] NOT NULL,
	[elpetro_th50_r_original] [real] NOT NULL,
	[elpetro_th90_n] [real] NOT NULL,
	[elpetro_th90_u] [real] NOT NULL,
	[elpetro_th90_g] [real] NOT NULL,
	[elpetro_th90_r] [real] NOT NULL,
	[elpetro_th90_i] [real] NOT NULL,
	[elpetro_th90_z] [real] NOT NULL,
	[elpetro_th90_r_original] [real] NOT NULL,
	[elpetro_nmgy_f] [real] NOT NULL,
	[elpetro_nmgy_n] [real] NOT NULL,
	[elpetro_nmgy_u] [real] NOT NULL,
	[elpetro_nmgy_g] [real] NOT NULL,
	[elpetro_nmgy_r] [real] NOT NULL,
	[elpetro_nmgy_i] [real] NOT NULL,
	[elpetro_nmgy_z] [real] NOT NULL,
	[elpetro_nmgy_ivar_f] [real] NOT NULL,
	[elpetro_nmgy_ivar_n] [real] NOT NULL,
	[elpetro_nmgy_ivar_u] [real] NOT NULL,
	[elpetro_nmgy_ivar_g] [real] NOT NULL,
	[elpetro_nmgy_ivar_r] [real] NOT NULL,
	[elpetro_nmgy_ivar_i] [real] NOT NULL,
	[elpetro_nmgy_ivar_z] [real] NOT NULL,
	[elpetro_ok] [smallint] NOT NULL,
	[elpetro_rnmgy_f] [real] NOT NULL,
	[elpetro_rnmgy_n] [real] NOT NULL,
	[elpetro_rnmgy_u] [real] NOT NULL,
	[elpetro_rnmgy_g] [real] NOT NULL,
	[elpetro_rnmgy_r] [real] NOT NULL,
	[elpetro_rnmgy_i] [real] NOT NULL,
	[elpetro_rnmgy_z] [real] NOT NULL,
	[elpetro_absmag_f] [real] NOT NULL,
	[elpetro_absmag_n] [real] NOT NULL,
	[elpetro_absmag_u] [real] NOT NULL,
	[elpetro_absmag_g] [real] NOT NULL,
	[elpetro_absmag_r] [real] NOT NULL,
	[elpetro_absmag_i] [real] NOT NULL,
	[elpetro_absmag_z] [real] NOT NULL,
	[elpetro_amivar_f] [real] NOT NULL,
	[elpetro_amivar_n] [real] NOT NULL,
	[elpetro_amivar_u] [real] NOT NULL,
	[elpetro_amivar_g] [real] NOT NULL,
	[elpetro_amivar_r] [real] NOT NULL,
	[elpetro_amivar_i] [real] NOT NULL,
	[elpetro_amivar_z] [real] NOT NULL,
	[elpetro_kcorrect_f] [real] NOT NULL,
	[elpetro_kcorrect_n] [real] NOT NULL,
	[elpetro_kcorrect_u] [real] NOT NULL,
	[elpetro_kcorrect_g] [real] NOT NULL,
	[elpetro_kcorrect_r] [real] NOT NULL,
	[elpetro_kcorrect_i] [real] NOT NULL,
	[elpetro_kcorrect_z] [real] NOT NULL,
	[elpetro_kcoeff_0] [real] NOT NULL,
	[elpetro_kcoeff_1] [real] NOT NULL,
	[elpetro_kcoeff_2] [real] NOT NULL,
	[elpetro_kcoeff_3] [real] NOT NULL,
	[elpetro_kcoeff_4] [real] NOT NULL,
	[elpetro_mass] [real] NOT NULL,
	[elpetro_mtol_f] [real] NOT NULL,
	[elpetro_mtol_n] [real] NOT NULL,
	[elpetro_mtol_u] [real] NOT NULL,
	[elpetro_mtol_g] [real] NOT NULL,
	[elpetro_mtol_r] [real] NOT NULL,
	[elpetro_mtol_i] [real] NOT NULL,
	[elpetro_mtol_z] [real] NOT NULL,
	[elpetro_b300] [real] NOT NULL,
	[elpetro_b1000] [real] NOT NULL,
	[elpetro_mets] [real] NOT NULL,
	[petro_theta] [real] NOT NULL,
	[petro_th50] [real] NOT NULL,
	[petro_th90] [real] NOT NULL,
	[petro_ba50] [real] NOT NULL,
	[petro_phi50] [real] NOT NULL,
	[petro_ba90] [real] NOT NULL,
	[petro_phi90] [real] NOT NULL,
	[petro_flux_f] [real] NOT NULL,
	[petro_flux_n] [real] NOT NULL,
	[petro_flux_u] [real] NOT NULL,
	[petro_flux_g] [real] NOT NULL,
	[petro_flux_r] [real] NOT NULL,
	[petro_flux_i] [real] NOT NULL,
	[petro_flux_z] [real] NOT NULL,
	[petro_flux_ivar_f] [real] NOT NULL,
	[petro_flux_ivar_n] [real] NOT NULL,
	[petro_flux_ivar_u] [real] NOT NULL,
	[petro_flux_ivar_g] [real] NOT NULL,
	[petro_flux_ivar_r] [real] NOT NULL,
	[petro_flux_ivar_i] [real] NOT NULL,
	[petro_flux_ivar_z] [real] NOT NULL,
	[fiber_flux_f] [real] NOT NULL,
	[fiber_flux_n] [real] NOT NULL,
	[fiber_flux_u] [real] NOT NULL,
	[fiber_flux_g] [real] NOT NULL,
	[fiber_flux_r] [real] NOT NULL,
	[fiber_flux_i] [real] NOT NULL,
	[fiber_flux_z] [real] NOT NULL,
	[fiber_flux_ivar_f] [real] NOT NULL,
	[fiber_flux_ivar_n] [real] NOT NULL,
	[fiber_flux_ivar_u] [real] NOT NULL,
	[fiber_flux_ivar_g] [real] NOT NULL,
	[fiber_flux_ivar_r] [real] NOT NULL,
	[fiber_flux_ivar_i] [real] NOT NULL,
	[fiber_flux_ivar_z] [real] NOT NULL,
	[sersic_n] [real] NOT NULL,
	[sersic_ba] [real] NOT NULL,
	[sersic_phi] [real] NOT NULL,
	[sersic_th50] [real] NOT NULL,
	[sersic_flux_f] [real] NOT NULL,
	[sersic_flux_n] [real] NOT NULL,
	[sersic_flux_u] [real] NOT NULL,
	[sersic_flux_g] [real] NOT NULL,
	[sersic_flux_r] [real] NOT NULL,
	[sersic_flux_i] [real] NOT NULL,
	[sersic_flux_z] [real] NOT NULL,
	[sersic_flux_ivar_f] [real] NOT NULL,
	[sersic_flux_ivar_n] [real] NOT NULL,
	[sersic_flux_ivar_u] [real] NOT NULL,
	[sersic_flux_ivar_g] [real] NOT NULL,
	[sersic_flux_ivar_r] [real] NOT NULL,
	[sersic_flux_ivar_i] [real] NOT NULL,
	[sersic_flux_ivar_z] [real] NOT NULL,
	[sersic_nmgy_f] [real] NOT NULL,
	[sersic_nmgy_n] [real] NOT NULL,
	[sersic_nmgy_u] [real] NOT NULL,
	[sersic_nmgy_g] [real] NOT NULL,
	[sersic_nmgy_r] [real] NOT NULL,
	[sersic_nmgy_i] [real] NOT NULL,
	[sersic_nmgy_z] [real] NOT NULL,
	[sersic_nmgy_ivar_f] [real] NOT NULL,
	[sersic_nmgy_ivar_n] [real] NOT NULL,
	[sersic_nmgy_ivar_u] [real] NOT NULL,
	[sersic_nmgy_ivar_g] [real] NOT NULL,
	[sersic_nmgy_ivar_r] [real] NOT NULL,
	[sersic_nmgy_ivar_i] [real] NOT NULL,
	[sersic_nmgy_ivar_z] [real] NOT NULL,
	[sersic_ok] [smallint] NOT NULL,
	[sersic_rnmgy_f] [real] NOT NULL,
	[sersic_rnmgy_n] [real] NOT NULL,
	[sersic_rnmgy_u] [real] NOT NULL,
	[sersic_rnmgy_g] [real] NOT NULL,
	[sersic_rnmgy_r] [real] NOT NULL,
	[sersic_rnmgy_i] [real] NOT NULL,
	[sersic_rnmgy_z] [real] NOT NULL,
	[sersic_absmag_f] [real] NOT NULL,
	[sersic_absmag_n] [real] NOT NULL,
	[sersic_absmag_u] [real] NOT NULL,
	[sersic_absmag_g] [real] NOT NULL,
	[sersic_absmag_r] [real] NOT NULL,
	[sersic_absmag_i] [real] NOT NULL,
	[sersic_absmag_z] [real] NOT NULL,
	[sersic_amivar_f] [real] NOT NULL,
	[sersic_amivar_n] [real] NOT NULL,
	[sersic_amivar_u] [real] NOT NULL,
	[sersic_amivar_g] [real] NOT NULL,
	[sersic_amivar_r] [real] NOT NULL,
	[sersic_amivar_i] [real] NOT NULL,
	[sersic_amivar_z] [real] NOT NULL,
	[sersic_kcorrect_f] [real] NOT NULL,
	[sersic_kcorrect_n] [real] NOT NULL,
	[sersic_kcorrect_u] [real] NOT NULL,
	[sersic_kcorrect_g] [real] NOT NULL,
	[sersic_kcorrect_r] [real] NOT NULL,
	[sersic_kcorrect_i] [real] NOT NULL,
	[sersic_kcorrect_z] [real] NOT NULL,
	[sersic_kcoeff_0] [real] NOT NULL,
	[sersic_kcoeff_1] [real] NOT NULL,
	[sersic_kcoeff_2] [real] NOT NULL,
	[sersic_kcoeff_3] [real] NOT NULL,
	[sersic_kcoeff_4] [real] NOT NULL,
	[sersic_mass] [real] NOT NULL,
	[sersic_mtol_f] [real] NOT NULL,
	[sersic_mtol_n] [real] NOT NULL,
	[sersic_mtol_u] [real] NOT NULL,
	[sersic_mtol_g] [real] NOT NULL,
	[sersic_mtol_r] [real] NOT NULL,
	[sersic_mtol_i] [real] NOT NULL,
	[sersic_mtol_z] [real] NOT NULL,
	[sersic_b300] [real] NOT NULL,
	[sersic_b1000] [real] NOT NULL,
	[sersic_mets] [real] NOT NULL,
	[asymmetry_f] [real] NOT NULL,
	[asymmetry_n] [real] NOT NULL,
	[asymmetry_u] [real] NOT NULL,
	[asymmetry_g] [real] NOT NULL,
	[asymmetry_r] [real] NOT NULL,
	[asymmetry_i] [real] NOT NULL,
	[asymmetry_z] [real] NOT NULL,
	[clumpy_f] [real] NOT NULL,
	[clumpy_n] [real] NOT NULL,
	[clumpy_u] [real] NOT NULL,
	[clumpy_g] [real] NOT NULL,
	[clumpy_r] [real] NOT NULL,
	[clumpy_i] [real] NOT NULL,
	[clumpy_z] [real] NOT NULL,
	[extinction_f] [real] NOT NULL,
	[extinction_n] [real] NOT NULL,
	[extinction_u] [real] NOT NULL,
	[extinction_g] [real] NOT NULL,
	[extinction_r] [real] NOT NULL,
	[extinction_i] [real] NOT NULL,
	[extinction_z] [real] NOT NULL,
	[aid] [int] NOT NULL,
	[pid] [int] NOT NULL,
	[xcen] [float] NOT NULL,
	[ycen] [float] NOT NULL,
	[dflags_f] [int] NOT NULL,
	[dflags_n] [int] NOT NULL,
	[dflags_u] [int] NOT NULL,
	[dflags_g] [int] NOT NULL,
	[dflags_r] [int] NOT NULL,
	[dflags_i] [int] NOT NULL,
	[dflags_z] [int] NOT NULL,
	[dversion] [varchar](20) NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[page_compression_estimates]    Script Date: 3/22/2017 2:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[page_compression_estimates](
	[object_name] [sysname] NOT NULL,
	[schema_name] [sysname] NOT NULL,
	[index_id] [int] NOT NULL,
	[partition_number] [int] NOT NULL,
	[size_with_current_compression_setting(KB)] [bigint] NOT NULL,
	[size_with_requested_compression_setting(KB)] [bigint] NOT NULL,
	[sample_size_with_current_compression_setting(KB)] [bigint] NOT NULL,
	[sample_size_with_requested_compression_setting(KB)] [bigint] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PartitionMap]    Script Date: 3/22/2017 2:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartitionMap](
	[fileGroupName] [varchar](100) NOT NULL,
	[size] [real] NOT NULL,
	[comment] [varchar](4000) NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[PhotoObjAll]    Script Date: 3/22/2017 2:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhotoObjAll](
	[objID] [bigint] NOT NULL,
	[skyVersion] [tinyint] NOT NULL,
	[run] [smallint] NOT NULL,
	[rerun] [smallint] NOT NULL,
	[camcol] [tinyint] NOT NULL,
	[field] [smallint] NOT NULL,
	[obj] [smallint] NOT NULL,
	[mode] [tinyint] NOT NULL,
	[nChild] [smallint] NOT NULL,
	[type] [smallint] NOT NULL,
	[clean] [int] NOT NULL,
	[probPSF] [real] NOT NULL,
	[insideMask] [tinyint] NOT NULL,
	[flags] [bigint] NOT NULL,
	[rowc] [real] NOT NULL,
	[rowcErr] [real] NOT NULL,
	[colc] [real] NOT NULL,
	[colcErr] [real] NOT NULL,
	[rowv] [real] NOT NULL,
	[rowvErr] [real] NOT NULL,
	[colv] [real] NOT NULL,
	[colvErr] [real] NOT NULL,
	[rowc_u] [real] NOT NULL,
	[rowc_g] [real] NOT NULL,
	[rowc_r] [real] NOT NULL,
	[rowc_i] [real] NOT NULL,
	[rowc_z] [real] NOT NULL,
	[rowcErr_u] [real] NOT NULL,
	[rowcErr_g] [real] NOT NULL,
	[rowcErr_r] [real] NOT NULL,
	[rowcErr_i] [real] NOT NULL,
	[rowcErr_z] [real] NOT NULL,
	[colc_u] [real] NOT NULL,
	[colc_g] [real] NOT NULL,
	[colc_r] [real] NOT NULL,
	[colc_i] [real] NOT NULL,
	[colc_z] [real] NOT NULL,
	[colcErr_u] [real] NOT NULL,
	[colcErr_g] [real] NOT NULL,
	[colcErr_r] [real] NOT NULL,
	[colcErr_i] [real] NOT NULL,
	[colcErr_z] [real] NOT NULL,
	[sky_u] [real] NOT NULL,
	[sky_g] [real] NOT NULL,
	[sky_r] [real] NOT NULL,
	[sky_i] [real] NOT NULL,
	[sky_z] [real] NOT NULL,
	[skyIvar_u] [real] NOT NULL,
	[skyIvar_g] [real] NOT NULL,
	[skyIvar_r] [real] NOT NULL,
	[skyIvar_i] [real] NOT NULL,
	[skyIvar_z] [real] NOT NULL,
	[psfMag_u] [real] NOT NULL,
	[psfMag_g] [real] NOT NULL,
	[psfMag_r] [real] NOT NULL,
	[psfMag_i] [real] NOT NULL,
	[psfMag_z] [real] NOT NULL,
	[psfMagErr_u] [real] NOT NULL,
	[psfMagErr_g] [real] NOT NULL,
	[psfMagErr_r] [real] NOT NULL,
	[psfMagErr_i] [real] NOT NULL,
	[psfMagErr_z] [real] NOT NULL,
	[fiberMag_u] [real] NOT NULL,
	[fiberMag_g] [real] NOT NULL,
	[fiberMag_r] [real] NOT NULL,
	[fiberMag_i] [real] NOT NULL,
	[fiberMag_z] [real] NOT NULL,
	[fiberMagErr_u] [real] NOT NULL,
	[fiberMagErr_g] [real] NOT NULL,
	[fiberMagErr_r] [real] NOT NULL,
	[fiberMagErr_i] [real] NOT NULL,
	[fiberMagErr_z] [real] NOT NULL,
	[fiber2Mag_u] [real] NOT NULL,
	[fiber2Mag_g] [real] NOT NULL,
	[fiber2Mag_r] [real] NOT NULL,
	[fiber2Mag_i] [real] NOT NULL,
	[fiber2Mag_z] [real] NOT NULL,
	[fiber2MagErr_u] [real] NOT NULL,
	[fiber2MagErr_g] [real] NOT NULL,
	[fiber2MagErr_r] [real] NOT NULL,
	[fiber2MagErr_i] [real] NOT NULL,
	[fiber2MagErr_z] [real] NOT NULL,
	[petroMag_u] [real] NOT NULL,
	[petroMag_g] [real] NOT NULL,
	[petroMag_r] [real] NOT NULL,
	[petroMag_i] [real] NOT NULL,
	[petroMag_z] [real] NOT NULL,
	[petroMagErr_u] [real] NOT NULL,
	[petroMagErr_g] [real] NOT NULL,
	[petroMagErr_r] [real] NOT NULL,
	[petroMagErr_i] [real] NOT NULL,
	[petroMagErr_z] [real] NOT NULL,
	[psfFlux_u] [real] NOT NULL,
	[psfFlux_g] [real] NOT NULL,
	[psfFlux_r] [real] NOT NULL,
	[psfFlux_i] [real] NOT NULL,
	[psfFlux_z] [real] NOT NULL,
	[psfFluxIvar_u] [real] NOT NULL,
	[psfFluxIvar_g] [real] NOT NULL,
	[psfFluxIvar_r] [real] NOT NULL,
	[psfFluxIvar_i] [real] NOT NULL,
	[psfFluxIvar_z] [real] NOT NULL,
	[fiberFlux_u] [real] NOT NULL,
	[fiberFlux_g] [real] NOT NULL,
	[fiberFlux_r] [real] NOT NULL,
	[fiberFlux_i] [real] NOT NULL,
	[fiberFlux_z] [real] NOT NULL,
	[fiberFluxIvar_u] [real] NOT NULL,
	[fiberFluxIvar_g] [real] NOT NULL,
	[fiberFluxIvar_r] [real] NOT NULL,
	[fiberFluxIvar_i] [real] NOT NULL,
	[fiberFluxIvar_z] [real] NOT NULL,
	[fiber2Flux_u] [real] NOT NULL,
	[fiber2Flux_g] [real] NOT NULL,
	[fiber2Flux_r] [real] NOT NULL,
	[fiber2Flux_i] [real] NOT NULL,
	[fiber2Flux_z] [real] NOT NULL,
	[fiber2FluxIvar_u] [real] NOT NULL,
	[fiber2FluxIvar_g] [real] NOT NULL,
	[fiber2FluxIvar_r] [real] NOT NULL,
	[fiber2FluxIvar_i] [real] NOT NULL,
	[fiber2FluxIvar_z] [real] NOT NULL,
	[petroFlux_u] [real] NOT NULL,
	[petroFlux_g] [real] NOT NULL,
	[petroFlux_r] [real] NOT NULL,
	[petroFlux_i] [real] NOT NULL,
	[petroFlux_z] [real] NOT NULL,
	[petroFluxIvar_u] [real] NOT NULL,
	[petroFluxIvar_g] [real] NOT NULL,
	[petroFluxIvar_r] [real] NOT NULL,
	[petroFluxIvar_i] [real] NOT NULL,
	[petroFluxIvar_z] [real] NOT NULL,
	[petroRad_u] [real] NOT NULL,
	[petroRad_g] [real] NOT NULL,
	[petroRad_r] [real] NOT NULL,
	[petroRad_i] [real] NOT NULL,
	[petroRad_z] [real] NOT NULL,
	[petroRadErr_u] [real] NOT NULL,
	[petroRadErr_g] [real] NOT NULL,
	[petroRadErr_r] [real] NOT NULL,
	[petroRadErr_i] [real] NOT NULL,
	[petroRadErr_z] [real] NOT NULL,
	[petroR50_u] [real] NOT NULL,
	[petroR50_g] [real] NOT NULL,
	[petroR50_r] [real] NOT NULL,
	[petroR50_i] [real] NOT NULL,
	[petroR50_z] [real] NOT NULL,
	[petroR50Err_u] [real] NOT NULL,
	[petroR50Err_g] [real] NOT NULL,
	[petroR50Err_r] [real] NOT NULL,
	[petroR50Err_i] [real] NOT NULL,
	[petroR50Err_z] [real] NOT NULL,
	[petroR90_u] [real] NOT NULL,
	[petroR90_g] [real] NOT NULL,
	[petroR90_r] [real] NOT NULL,
	[petroR90_i] [real] NOT NULL,
	[petroR90_z] [real] NOT NULL,
	[petroR90Err_u] [real] NOT NULL,
	[petroR90Err_g] [real] NOT NULL,
	[petroR90Err_r] [real] NOT NULL,
	[petroR90Err_i] [real] NOT NULL,
	[petroR90Err_z] [real] NOT NULL,
	[q_u] [real] NOT NULL,
	[q_g] [real] NOT NULL,
	[q_r] [real] NOT NULL,
	[q_i] [real] NOT NULL,
	[q_z] [real] NOT NULL,
	[qErr_u] [real] NOT NULL,
	[qErr_g] [real] NOT NULL,
	[qErr_r] [real] NOT NULL,
	[qErr_i] [real] NOT NULL,
	[qErr_z] [real] NOT NULL,
	[u_u] [real] NOT NULL,
	[u_g] [real] NOT NULL,
	[u_r] [real] NOT NULL,
	[u_i] [real] NOT NULL,
	[u_z] [real] NOT NULL,
	[uErr_u] [real] NOT NULL,
	[uErr_g] [real] NOT NULL,
	[uErr_r] [real] NOT NULL,
	[uErr_i] [real] NOT NULL,
	[uErr_z] [real] NOT NULL,
	[mE1_u] [real] NOT NULL,
	[mE1_g] [real] NOT NULL,
	[mE1_r] [real] NOT NULL,
	[mE1_i] [real] NOT NULL,
	[mE1_z] [real] NOT NULL,
	[mE2_u] [real] NOT NULL,
	[mE2_g] [real] NOT NULL,
	[mE2_r] [real] NOT NULL,
	[mE2_i] [real] NOT NULL,
	[mE2_z] [real] NOT NULL,
	[mE1E1Err_u] [real] NOT NULL,
	[mE1E1Err_g] [real] NOT NULL,
	[mE1E1Err_r] [real] NOT NULL,
	[mE1E1Err_i] [real] NOT NULL,
	[mE1E1Err_z] [real] NOT NULL,
	[mE1E2Err_u] [real] NOT NULL,
	[mE1E2Err_g] [real] NOT NULL,
	[mE1E2Err_r] [real] NOT NULL,
	[mE1E2Err_i] [real] NOT NULL,
	[mE1E2Err_z] [real] NOT NULL,
	[mE2E2Err_u] [real] NOT NULL,
	[mE2E2Err_g] [real] NOT NULL,
	[mE2E2Err_r] [real] NOT NULL,
	[mE2E2Err_i] [real] NOT NULL,
	[mE2E2Err_z] [real] NOT NULL,
	[mRrCc_u] [real] NOT NULL,
	[mRrCc_g] [real] NOT NULL,
	[mRrCc_r] [real] NOT NULL,
	[mRrCc_i] [real] NOT NULL,
	[mRrCc_z] [real] NOT NULL,
	[mRrCcErr_u] [real] NOT NULL,
	[mRrCcErr_g] [real] NOT NULL,
	[mRrCcErr_r] [real] NOT NULL,
	[mRrCcErr_i] [real] NOT NULL,
	[mRrCcErr_z] [real] NOT NULL,
	[mCr4_u] [real] NOT NULL,
	[mCr4_g] [real] NOT NULL,
	[mCr4_r] [real] NOT NULL,
	[mCr4_i] [real] NOT NULL,
	[mCr4_z] [real] NOT NULL,
	[mE1PSF_u] [real] NOT NULL,
	[mE1PSF_g] [real] NOT NULL,
	[mE1PSF_r] [real] NOT NULL,
	[mE1PSF_i] [real] NOT NULL,
	[mE1PSF_z] [real] NOT NULL,
	[mE2PSF_u] [real] NOT NULL,
	[mE2PSF_g] [real] NOT NULL,
	[mE2PSF_r] [real] NOT NULL,
	[mE2PSF_i] [real] NOT NULL,
	[mE2PSF_z] [real] NOT NULL,
	[mRrCcPSF_u] [real] NOT NULL,
	[mRrCcPSF_g] [real] NOT NULL,
	[mRrCcPSF_r] [real] NOT NULL,
	[mRrCcPSF_i] [real] NOT NULL,
	[mRrCcPSF_z] [real] NOT NULL,
	[mCr4PSF_u] [real] NOT NULL,
	[mCr4PSF_g] [real] NOT NULL,
	[mCr4PSF_r] [real] NOT NULL,
	[mCr4PSF_i] [real] NOT NULL,
	[mCr4PSF_z] [real] NOT NULL,
	[deVRad_u] [real] NOT NULL,
	[deVRad_g] [real] NOT NULL,
	[deVRad_r] [real] NOT NULL,
	[deVRad_i] [real] NOT NULL,
	[deVRad_z] [real] NOT NULL,
	[deVRadErr_u] [real] NOT NULL,
	[deVRadErr_g] [real] NOT NULL,
	[deVRadErr_r] [real] NOT NULL,
	[deVRadErr_i] [real] NOT NULL,
	[deVRadErr_z] [real] NOT NULL,
	[deVAB_u] [real] NOT NULL,
	[deVAB_g] [real] NOT NULL,
	[deVAB_r] [real] NOT NULL,
	[deVAB_i] [real] NOT NULL,
	[deVAB_z] [real] NOT NULL,
	[deVABErr_u] [real] NOT NULL,
	[deVABErr_g] [real] NOT NULL,
	[deVABErr_r] [real] NOT NULL,
	[deVABErr_i] [real] NOT NULL,
	[deVABErr_z] [real] NOT NULL,
	[deVPhi_u] [real] NOT NULL,
	[deVPhi_g] [real] NOT NULL,
	[deVPhi_r] [real] NOT NULL,
	[deVPhi_i] [real] NOT NULL,
	[deVPhi_z] [real] NOT NULL,
	[deVMag_u] [real] NOT NULL,
	[deVMag_g] [real] NOT NULL,
	[deVMag_r] [real] NOT NULL,
	[deVMag_i] [real] NOT NULL,
	[deVMag_z] [real] NOT NULL,
	[deVMagErr_u] [real] NOT NULL,
	[deVMagErr_g] [real] NOT NULL,
	[deVMagErr_r] [real] NOT NULL,
	[deVMagErr_i] [real] NOT NULL,
	[deVMagErr_z] [real] NOT NULL,
	[deVFlux_u] [real] NOT NULL,
	[deVFlux_g] [real] NOT NULL,
	[deVFlux_r] [real] NOT NULL,
	[deVFlux_i] [real] NOT NULL,
	[deVFlux_z] [real] NOT NULL,
	[deVFluxIvar_u] [real] NOT NULL,
	[deVFluxIvar_g] [real] NOT NULL,
	[deVFluxIvar_r] [real] NOT NULL,
	[deVFluxIvar_i] [real] NOT NULL,
	[deVFluxIvar_z] [real] NOT NULL,
	[expRad_u] [real] NOT NULL,
	[expRad_g] [real] NOT NULL,
	[expRad_r] [real] NOT NULL,
	[expRad_i] [real] NOT NULL,
	[expRad_z] [real] NOT NULL,
	[expRadErr_u] [real] NOT NULL,
	[expRadErr_g] [real] NOT NULL,
	[expRadErr_r] [real] NOT NULL,
	[expRadErr_i] [real] NOT NULL,
	[expRadErr_z] [real] NOT NULL,
	[expAB_u] [real] NOT NULL,
	[expAB_g] [real] NOT NULL,
	[expAB_r] [real] NOT NULL,
	[expAB_i] [real] NOT NULL,
	[expAB_z] [real] NOT NULL,
	[expABErr_u] [real] NOT NULL,
	[expABErr_g] [real] NOT NULL,
	[expABErr_r] [real] NOT NULL,
	[expABErr_i] [real] NOT NULL,
	[expABErr_z] [real] NOT NULL,
	[expPhi_u] [real] NOT NULL,
	[expPhi_g] [real] NOT NULL,
	[expPhi_r] [real] NOT NULL,
	[expPhi_i] [real] NOT NULL,
	[expPhi_z] [real] NOT NULL,
	[expMag_u] [real] NOT NULL,
	[expMag_g] [real] NOT NULL,
	[expMag_r] [real] NOT NULL,
	[expMag_i] [real] NOT NULL,
	[expMag_z] [real] NOT NULL,
	[expMagErr_u] [real] NOT NULL,
	[expMagErr_g] [real] NOT NULL,
	[expMagErr_r] [real] NOT NULL,
	[expMagErr_i] [real] NOT NULL,
	[expMagErr_z] [real] NOT NULL,
	[modelMag_u] [real] NOT NULL,
	[modelMag_g] [real] NOT NULL,
	[modelMag_r] [real] NOT NULL,
	[modelMag_i] [real] NOT NULL,
	[modelMag_z] [real] NOT NULL,
	[modelMagErr_u] [real] NOT NULL,
	[modelMagErr_g] [real] NOT NULL,
	[modelMagErr_r] [real] NOT NULL,
	[modelMagErr_i] [real] NOT NULL,
	[modelMagErr_z] [real] NOT NULL,
	[cModelMag_u] [real] NOT NULL,
	[cModelMag_g] [real] NOT NULL,
	[cModelMag_r] [real] NOT NULL,
	[cModelMag_i] [real] NOT NULL,
	[cModelMag_z] [real] NOT NULL,
	[cModelMagErr_u] [real] NOT NULL,
	[cModelMagErr_g] [real] NOT NULL,
	[cModelMagErr_r] [real] NOT NULL,
	[cModelMagErr_i] [real] NOT NULL,
	[cModelMagErr_z] [real] NOT NULL,
	[expFlux_u] [real] NOT NULL,
	[expFlux_g] [real] NOT NULL,
	[expFlux_r] [real] NOT NULL,
	[expFlux_i] [real] NOT NULL,
	[expFlux_z] [real] NOT NULL,
	[expFluxIvar_u] [real] NOT NULL,
	[expFluxIvar_g] [real] NOT NULL,
	[expFluxIvar_r] [real] NOT NULL,
	[expFluxIvar_i] [real] NOT NULL,
	[expFluxIvar_z] [real] NOT NULL,
	[modelFlux_u] [real] NOT NULL,
	[modelFlux_g] [real] NOT NULL,
	[modelFlux_r] [real] NOT NULL,
	[modelFlux_i] [real] NOT NULL,
	[modelFlux_z] [real] NOT NULL,
	[modelFluxIvar_u] [real] NOT NULL,
	[modelFluxIvar_g] [real] NOT NULL,
	[modelFluxIvar_r] [real] NOT NULL,
	[modelFluxIvar_i] [real] NOT NULL,
	[modelFluxIvar_z] [real] NOT NULL,
	[cModelFlux_u] [real] NOT NULL,
	[cModelFlux_g] [real] NOT NULL,
	[cModelFlux_r] [real] NOT NULL,
	[cModelFlux_i] [real] NOT NULL,
	[cModelFlux_z] [real] NOT NULL,
	[cModelFluxIvar_u] [real] NOT NULL,
	[cModelFluxIvar_g] [real] NOT NULL,
	[cModelFluxIvar_r] [real] NOT NULL,
	[cModelFluxIvar_i] [real] NOT NULL,
	[cModelFluxIvar_z] [real] NOT NULL,
	[aperFlux7_u] [real] NOT NULL,
	[aperFlux7_g] [real] NOT NULL,
	[aperFlux7_r] [real] NOT NULL,
	[aperFlux7_i] [real] NOT NULL,
	[aperFlux7_z] [real] NOT NULL,
	[aperFlux7Ivar_u] [real] NOT NULL,
	[aperFlux7Ivar_g] [real] NOT NULL,
	[aperFlux7Ivar_r] [real] NOT NULL,
	[aperFlux7Ivar_i] [real] NOT NULL,
	[aperFlux7Ivar_z] [real] NOT NULL,
	[lnLStar_u] [real] NOT NULL,
	[lnLStar_g] [real] NOT NULL,
	[lnLStar_r] [real] NOT NULL,
	[lnLStar_i] [real] NOT NULL,
	[lnLStar_z] [real] NOT NULL,
	[lnLExp_u] [real] NOT NULL,
	[lnLExp_g] [real] NOT NULL,
	[lnLExp_r] [real] NOT NULL,
	[lnLExp_i] [real] NOT NULL,
	[lnLExp_z] [real] NOT NULL,
	[lnLDeV_u] [real] NOT NULL,
	[lnLDeV_g] [real] NOT NULL,
	[lnLDeV_r] [real] NOT NULL,
	[lnLDeV_i] [real] NOT NULL,
	[lnLDeV_z] [real] NOT NULL,
	[fracDeV_u] [real] NOT NULL,
	[fracDeV_g] [real] NOT NULL,
	[fracDeV_r] [real] NOT NULL,
	[fracDeV_i] [real] NOT NULL,
	[fracDeV_z] [real] NOT NULL,
	[flags_u] [bigint] NOT NULL,
	[flags_g] [bigint] NOT NULL,
	[flags_r] [bigint] NOT NULL,
	[flags_i] [bigint] NOT NULL,
	[flags_z] [bigint] NOT NULL,
	[type_u] [int] NOT NULL,
	[type_g] [int] NOT NULL,
	[type_r] [int] NOT NULL,
	[type_i] [int] NOT NULL,
	[type_z] [int] NOT NULL,
	[probPSF_u] [real] NOT NULL,
	[probPSF_g] [real] NOT NULL,
	[probPSF_r] [real] NOT NULL,
	[probPSF_i] [real] NOT NULL,
	[probPSF_z] [real] NOT NULL,
	[ra] [float] NOT NULL,
	[dec] [float] NOT NULL,
	[cx] [float] NOT NULL,
	[cy] [float] NOT NULL,
	[cz] [float] NOT NULL,
	[raErr] [float] NOT NULL,
	[decErr] [float] NOT NULL,
	[b] [float] NOT NULL,
	[l] [float] NOT NULL,
	[offsetRa_u] [real] NOT NULL,
	[offsetRa_g] [real] NOT NULL,
	[offsetRa_r] [real] NOT NULL,
	[offsetRa_i] [real] NOT NULL,
	[offsetRa_z] [real] NOT NULL,
	[offsetDec_u] [real] NOT NULL,
	[offsetDec_g] [real] NOT NULL,
	[offsetDec_r] [real] NOT NULL,
	[offsetDec_i] [real] NOT NULL,
	[offsetDec_z] [real] NOT NULL,
	[extinction_u] [real] NOT NULL,
	[extinction_g] [real] NOT NULL,
	[extinction_r] [real] NOT NULL,
	[extinction_i] [real] NOT NULL,
	[extinction_z] [real] NOT NULL,
	[psffwhm_u] [real] NOT NULL,
	[psffwhm_g] [real] NOT NULL,
	[psffwhm_r] [real] NOT NULL,
	[psffwhm_i] [real] NOT NULL,
	[psffwhm_z] [real] NOT NULL,
	[mjd] [int] NOT NULL,
	[airmass_u] [real] NOT NULL,
	[airmass_g] [real] NOT NULL,
	[airmass_r] [real] NOT NULL,
	[airmass_i] [real] NOT NULL,
	[airmass_z] [real] NOT NULL,
	[phioffset_u] [real] NOT NULL,
	[phioffset_g] [real] NOT NULL,
	[phioffset_r] [real] NOT NULL,
	[phioffset_i] [real] NOT NULL,
	[phioffset_z] [real] NOT NULL,
	[nProf_u] [int] NOT NULL,
	[nProf_g] [int] NOT NULL,
	[nProf_r] [int] NOT NULL,
	[nProf_i] [int] NOT NULL,
	[nProf_z] [int] NOT NULL,
	[loadVersion] [int] NOT NULL,
	[htmID] [bigint] NOT NULL,
	[fieldID] [bigint] NOT NULL,
	[parentID] [bigint] NOT NULL,
	[specObjID] [numeric](20, 0) NOT NULL,
	[u] [real] NOT NULL,
	[g] [real] NOT NULL,
	[r] [real] NOT NULL,
	[i] [real] NOT NULL,
	[z] [real] NOT NULL,
	[err_u] [real] NOT NULL,
	[err_g] [real] NOT NULL,
	[err_r] [real] NOT NULL,
	[err_i] [real] NOT NULL,
	[err_z] [real] NOT NULL,
	[dered_u] [real] NOT NULL,
	[dered_g] [real] NOT NULL,
	[dered_r] [real] NOT NULL,
	[dered_i] [real] NOT NULL,
	[dered_z] [real] NOT NULL,
	[cloudCam_u] [int] NOT NULL,
	[cloudCam_g] [int] NOT NULL,
	[cloudCam_r] [int] NOT NULL,
	[cloudCam_i] [int] NOT NULL,
	[cloudCam_z] [int] NOT NULL,
	[resolveStatus] [int] NOT NULL,
	[thingId] [int] NOT NULL,
	[balkanId] [int] NOT NULL,
	[nObserve] [int] NOT NULL,
	[nDetect] [int] NOT NULL,
	[nEdge] [int] NOT NULL,
	[score] [real] NOT NULL,
	[calibStatus_u] [int] NOT NULL,
	[calibStatus_g] [int] NOT NULL,
	[calibStatus_r] [int] NOT NULL,
	[calibStatus_i] [int] NOT NULL,
	[calibStatus_z] [int] NOT NULL,
	[nMgyPerCount_u] [real] NOT NULL,
	[nMgyPerCount_g] [real] NOT NULL,
	[nMgyPerCount_r] [real] NOT NULL,
	[nMgyPerCount_i] [real] NOT NULL,
	[nMgyPerCount_z] [real] NOT NULL,
	[TAI_u] [float] NOT NULL,
	[TAI_g] [float] NOT NULL,
	[TAI_r] [float] NOT NULL,
	[TAI_i] [float] NOT NULL,
	[TAI_z] [float] NOT NULL
) ON [PHOTO]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[PhotoObjDR7]    Script Date: 3/22/2017 2:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhotoObjDR7](
	[dr7objid] [bigint] NOT NULL,
	[dr8objid] [bigint] NOT NULL,
	[distance] [float] NULL,
	[modeDR7] [tinyint] NOT NULL,
	[modeDR8] [tinyint] NOT NULL,
	[skyVersion] [tinyint] NULL,
	[run] [smallint] NULL,
	[rerun] [smallint] NULL,
	[camcol] [tinyint] NULL,
	[field] [smallint] NULL,
	[obj] [smallint] NULL,
	[nChild] [smallint] NULL,
	[type] [smallint] NULL,
	[probPSF] [real] NULL,
	[insideMask] [tinyint] NULL,
	[flags] [bigint] NULL,
	[psfMag_u] [real] NULL,
	[psfMag_g] [real] NULL,
	[psfMag_r] [real] NULL,
	[psfMag_i] [real] NULL,
	[psfMag_z] [real] NULL,
	[psfMagErr_u] [real] NULL,
	[psfMagErr_g] [real] NULL,
	[psfMagErr_r] [real] NULL,
	[psfMagErr_i] [real] NULL,
	[psfMagErr_z] [real] NULL,
	[petroMag_u] [real] NULL,
	[petroMag_g] [real] NULL,
	[petroMag_r] [real] NULL,
	[petroMag_i] [real] NULL,
	[petroMag_z] [real] NULL,
	[petroMagErr_u] [real] NULL,
	[petroMagErr_g] [real] NULL,
	[petroMagErr_r] [real] NULL,
	[petroMagErr_i] [real] NULL,
	[petroMagErr_z] [real] NULL,
	[petroR50_r] [real] NULL,
	[petroR90_r] [real] NULL,
	[modelMag_u] [real] NULL,
	[modelMag_g] [real] NULL,
	[modelMag_r] [real] NULL,
	[modelMag_i] [real] NULL,
	[modelMag_z] [real] NULL,
	[modelMagErr_u] [real] NULL,
	[modelMagErr_g] [real] NULL,
	[modelMagErr_r] [real] NULL,
	[modelMagErr_i] [real] NULL,
	[modelMagErr_z] [real] NULL,
	[mRrCc_r] [real] NULL,
	[mRrCcErr_r] [real] NULL,
	[lnLStar_r] [real] NULL,
	[lnLExp_r] [real] NULL,
	[lnLDeV_r] [real] NULL,
	[status] [int] NULL,
	[ra] [float] NULL,
	[dec] [float] NULL,
	[cx] [float] NULL,
	[cy] [float] NULL,
	[cz] [float] NULL,
	[primTarget] [int] NULL,
	[secTarget] [int] NULL,
	[extinction_u] [real] NULL,
	[extinction_g] [real] NULL,
	[extinction_r] [real] NULL,
	[extinction_i] [real] NULL,
	[extinction_z] [real] NULL,
	[htmID] [bigint] NULL,
	[fieldID] [bigint] NULL,
	[SpecObjID] [bigint] NULL,
	[size] [real] NULL
) ON [PHOTO]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[PhotoPrimaryDR7]    Script Date: 3/22/2017 2:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhotoPrimaryDR7](
	[dr7objid] [bigint] NOT NULL,
	[dr8objid] [bigint] NOT NULL,
	[distance] [float] NULL,
	[skyVersion] [tinyint] NULL,
	[run] [smallint] NULL,
	[rerun] [smallint] NULL,
	[camcol] [tinyint] NULL,
	[field] [smallint] NULL,
	[obj] [smallint] NULL,
	[nChild] [smallint] NULL,
	[type] [smallint] NULL,
	[probPSF] [real] NULL,
	[insideMask] [tinyint] NULL,
	[flags] [bigint] NULL,
	[psfMag_u] [real] NULL,
	[psfMag_g] [real] NULL,
	[psfMag_r] [real] NULL,
	[psfMag_i] [real] NULL,
	[psfMag_z] [real] NULL,
	[psfMagErr_u] [real] NULL,
	[psfMagErr_g] [real] NULL,
	[psfMagErr_r] [real] NULL,
	[psfMagErr_i] [real] NULL,
	[psfMagErr_z] [real] NULL,
	[petroMag_u] [real] NULL,
	[petroMag_g] [real] NULL,
	[petroMag_r] [real] NULL,
	[petroMag_i] [real] NULL,
	[petroMag_z] [real] NULL,
	[petroMagErr_u] [real] NULL,
	[petroMagErr_g] [real] NULL,
	[petroMagErr_r] [real] NULL,
	[petroMagErr_i] [real] NULL,
	[petroMagErr_z] [real] NULL,
	[petroR50_r] [real] NULL,
	[petroR90_r] [real] NULL,
	[modelMag_u] [real] NULL,
	[modelMag_g] [real] NULL,
	[modelMag_r] [real] NULL,
	[modelMag_i] [real] NULL,
	[modelMag_z] [real] NULL,
	[modelMagErr_u] [real] NULL,
	[modelMagErr_g] [real] NULL,
	[modelMagErr_r] [real] NULL,
	[modelMagErr_i] [real] NULL,
	[modelMagErr_z] [real] NULL,
	[mRrCc_r] [real] NULL,
	[mRrCcErr_r] [real] NULL,
	[lnLStar_r] [real] NULL,
	[lnLExp_r] [real] NULL,
	[lnLDeV_r] [real] NULL,
	[status] [int] NULL,
	[ra] [float] NULL,
	[dec] [float] NULL,
	[cx] [float] NULL,
	[cy] [float] NULL,
	[cz] [float] NULL,
	[primTarget] [int] NULL,
	[secTarget] [int] NULL,
	[extinction_u] [real] NULL,
	[extinction_g] [real] NULL,
	[extinction_r] [real] NULL,
	[extinction_i] [real] NULL,
	[extinction_z] [real] NULL,
	[htmID] [bigint] NULL,
	[fieldID] [bigint] NULL,
	[SpecObjID] [bigint] NULL,
	[size] [real] NULL
) ON [PHOTO]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[PhotoProfile]    Script Date: 3/22/2017 2:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhotoProfile](
	[bin] [tinyint] NOT NULL,
	[band] [tinyint] NOT NULL,
	[profMean] [real] NOT NULL,
	[profErr] [real] NOT NULL,
	[objID] [bigint] NOT NULL
) ON [PHOTO]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[Photoz]    Script Date: 3/22/2017 2:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Photoz](
	[objID] [bigint] NOT NULL,
	[z] [real] NOT NULL,
	[zErr] [real] NOT NULL,
	[nnCount] [smallint] NOT NULL,
	[nnVol] [real] NOT NULL,
	[photoErrorClass] [smallint] NOT NULL,
	[nnObjID] [bigint] NOT NULL,
	[nnSpecz] [real] NOT NULL,
	[nnFarObjID] [bigint] NOT NULL,
	[nnAvgZ] [real] NOT NULL,
	[distMod] [real] NOT NULL,
	[lumDist] [real] NOT NULL,
	[chisq] [real] NOT NULL,
	[rnorm] [real] NOT NULL,
	[bestFitTemplateID] [int] NOT NULL,
	[synthU] [real] NOT NULL,
	[synthG] [real] NOT NULL,
	[synthR] [real] NOT NULL,
	[synthI] [real] NOT NULL,
	[synthZ] [real] NOT NULL,
	[kcorrU] [real] NOT NULL,
	[kcorrG] [real] NOT NULL,
	[kcorrR] [real] NOT NULL,
	[kcorrI] [real] NOT NULL,
	[kcorrZ] [real] NOT NULL,
	[kcorrU01] [real] NOT NULL,
	[kcorrG01] [real] NOT NULL,
	[kcorrR01] [real] NOT NULL,
	[kcorrI01] [real] NOT NULL,
	[kcorrZ01] [real] NOT NULL,
	[absMagU] [real] NOT NULL,
	[absMagG] [real] NOT NULL,
	[absMagR] [real] NOT NULL,
	[absMagI] [real] NOT NULL,
	[absMagZ] [real] NOT NULL
) ON [PHOTO]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[PhotozErrorMap]    Script Date: 3/22/2017 2:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhotozErrorMap](
	[CellID] [int] NOT NULL,
	[rMag] [real] NULL,
	[gMag_Minus_rMag] [real] NULL,
	[rMag_Minus_iMag] [real] NULL,
	[countInCell] [int] NULL,
	[avgPhotoZ] [real] NULL,
	[avgSpectroZ] [real] NULL,
	[avgRMS] [real] NULL,
	[avgEstimatedError] [real] NULL,
	[avgNeighborZStDev] [real] NULL
) ON [PHOTO]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[Plate2Target]    Script Date: 3/22/2017 2:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Plate2Target](
	[plate2targetid] [int] NOT NULL,
	[plate] [int] NOT NULL,
	[plateid] [bigint] NOT NULL,
	[objid] [bigint] NOT NULL,
	[loadVersion] [int] NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[PlateX]    Script Date: 3/22/2017 2:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlateX](
	[plateID] [bigint] NOT NULL,
	[firstRelease] [varchar](32) NOT NULL,
	[plate] [smallint] NOT NULL,
	[mjd] [int] NOT NULL,
	[mjdList] [varchar](512) NOT NULL,
	[survey] [varchar](32) NOT NULL,
	[programName] [varchar](32) NOT NULL,
	[instrument] [varchar](32) NOT NULL,
	[chunk] [varchar](32) NOT NULL,
	[plateRun] [varchar](32) NOT NULL,
	[designComments] [varchar](128) NOT NULL,
	[plateQuality] [varchar](32) NOT NULL,
	[qualityComments] [varchar](100) NOT NULL,
	[plateSN2] [real] NOT NULL,
	[deredSN2] [real] NOT NULL,
	[ra] [float] NOT NULL,
	[dec] [float] NOT NULL,
	[run2d] [varchar](32) NOT NULL,
	[run1d] [varchar](32) NOT NULL,
	[runsspp] [varchar](32) NOT NULL,
	[tile] [smallint] NOT NULL,
	[designID] [int] NOT NULL,
	[locationID] [int] NOT NULL,
	[iopVersion] [varchar](64) NOT NULL,
	[camVersion] [varchar](64) NOT NULL,
	[taiHMS] [varchar](64) NOT NULL,
	[dateObs] [varchar](32) NOT NULL,
	[timeSys] [varchar](8) NOT NULL,
	[cx] [float] NOT NULL,
	[cy] [float] NOT NULL,
	[cz] [float] NOT NULL,
	[cartridgeID] [smallint] NOT NULL,
	[tai] [float] NOT NULL,
	[taiBegin] [float] NOT NULL,
	[taiEnd] [float] NOT NULL,
	[airmass] [real] NOT NULL,
	[mapMjd] [int] NOT NULL,
	[mapName] [varchar](32) NOT NULL,
	[plugFile] [varchar](32) NOT NULL,
	[expTime] [real] NOT NULL,
	[expTimeB1] [real] NOT NULL,
	[expTimeB2] [real] NOT NULL,
	[expTimeR1] [real] NOT NULL,
	[expTimeR2] [real] NOT NULL,
	[vers2d] [varchar](32) NOT NULL,
	[verscomb] [varchar](32) NOT NULL,
	[vers1d] [varchar](32) NOT NULL,
	[snturnoff] [real] NOT NULL,
	[nturnoff] [real] NOT NULL,
	[nExp] [smallint] NOT NULL,
	[nExpB1] [smallint] NOT NULL,
	[nExpB2] [smallint] NOT NULL,
	[nExpR1] [smallint] NOT NULL,
	[nExpR2] [smallint] NOT NULL,
	[sn1_g] [real] NOT NULL,
	[sn1_r] [real] NOT NULL,
	[sn1_i] [real] NOT NULL,
	[sn2_g] [real] NOT NULL,
	[sn2_r] [real] NOT NULL,
	[sn2_i] [real] NOT NULL,
	[dered_sn1_g] [real] NOT NULL,
	[dered_sn1_r] [real] NOT NULL,
	[dered_sn1_i] [real] NOT NULL,
	[dered_sn2_g] [real] NOT NULL,
	[dered_sn2_r] [real] NOT NULL,
	[dered_sn2_i] [real] NOT NULL,
	[helioRV] [real] NOT NULL,
	[gOffStd] [real] NOT NULL,
	[gRMSStd] [real] NOT NULL,
	[rOffStd] [real] NOT NULL,
	[rRMSStd] [real] NOT NULL,
	[iOffStd] [real] NOT NULL,
	[iRMSStd] [real] NOT NULL,
	[grOffStd] [real] NOT NULL,
	[grRMSStd] [real] NOT NULL,
	[riOffStd] [real] NOT NULL,
	[riRMSStd] [real] NOT NULL,
	[gOffGal] [real] NOT NULL,
	[gRMSGal] [real] NOT NULL,
	[rOffGal] [real] NOT NULL,
	[rRMSGal] [real] NOT NULL,
	[iOffGal] [real] NOT NULL,
	[iRMSGal] [real] NOT NULL,
	[grOffGal] [real] NOT NULL,
	[grRMSGal] [real] NOT NULL,
	[riOffGal] [real] NOT NULL,
	[riRMSGal] [real] NOT NULL,
	[nGuide] [int] NOT NULL,
	[seeing20] [real] NOT NULL,
	[seeing50] [real] NOT NULL,
	[seeing80] [real] NOT NULL,
	[rmsoff20] [real] NOT NULL,
	[rmsoff50] [real] NOT NULL,
	[rmsoff80] [real] NOT NULL,
	[airtemp] [real] NOT NULL,
	[sfd_used] [tinyint] NOT NULL,
	[xSigma] [real] NOT NULL,
	[xSigMin] [real] NOT NULL,
	[xSigMax] [real] NOT NULL,
	[wSigma] [real] NOT NULL,
	[wSigMin] [real] NOT NULL,
	[wSigMax] [real] NOT NULL,
	[xChi2] [real] NOT NULL,
	[xChi2Min] [real] NOT NULL,
	[xChi2Max] [real] NOT NULL,
	[skyChi2] [real] NOT NULL,
	[skyChi2Min] [real] NOT NULL,
	[skyChi2Max] [real] NOT NULL,
	[fBadPix] [real] NOT NULL,
	[fBadPix1] [real] NOT NULL,
	[fBadPix2] [real] NOT NULL,
	[status2d] [varchar](32) NOT NULL,
	[statuscombine] [varchar](32) NOT NULL,
	[status1d] [varchar](32) NOT NULL,
	[nTotal] [int] NOT NULL,
	[nGalaxy] [int] NOT NULL,
	[nQSO] [int] NOT NULL,
	[nStar] [int] NOT NULL,
	[nSky] [int] NOT NULL,
	[nUnknown] [int] NOT NULL,
	[isBest] [tinyint] NOT NULL,
	[isPrimary] [tinyint] NOT NULL,
	[isTile] [tinyint] NOT NULL,
	[ha] [real] NOT NULL,
	[mjdDesign] [int] NOT NULL,
	[theta] [real] NOT NULL,
	[fscanVersion] [varchar](32) NOT NULL,
	[fmapVersion] [varchar](32) NOT NULL,
	[fscanMode] [varchar](32) NOT NULL,
	[fscanSpeed] [int] NOT NULL,
	[htmID] [bigint] NOT NULL,
	[loadVersion] [int] NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[ProfileDefs]    Script Date: 3/22/2017 2:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProfileDefs](
	[bin] [int] NOT NULL,
	[cell] [int] NOT NULL,
	[sinc] [int] NOT NULL,
	[rInner] [float] NOT NULL,
	[rOuter] [float] NOT NULL,
	[aAnn] [float] NOT NULL,
	[aDisk] [float] NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[ProperMotions]    Script Date: 3/22/2017 2:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProperMotions](
	[delta] [real] NOT NULL,
	[match] [int] NOT NULL,
	[pmL] [real] NOT NULL,
	[pmB] [real] NOT NULL,
	[pmRa] [real] NOT NULL,
	[pmDec] [real] NOT NULL,
	[pmRaErr] [real] NOT NULL,
	[pmDecErr] [real] NOT NULL,
	[sigRa] [real] NOT NULL,
	[sigDec] [real] NOT NULL,
	[nFit] [int] NOT NULL,
	[O] [real] NOT NULL,
	[E] [real] NOT NULL,
	[J] [real] NOT NULL,
	[F] [real] NOT NULL,
	[N] [real] NOT NULL,
	[dist20] [real] NOT NULL,
	[dist22] [real] NOT NULL,
	[objid] [bigint] NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[PubHistory]    Script Date: 3/22/2017 2:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PubHistory](
	[name] [varchar](64) NOT NULL,
	[nrows] [bigint] NOT NULL,
	[tend] [datetime] NOT NULL,
	[loadversion] [int] NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[qsoVarPTF]    Script Date: 3/22/2017 2:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qsoVarPTF](
	[VAR_OBJID] [bigint] NOT NULL,
	[THING_ID_TARGETING] [int] NOT NULL,
	[RA] [float] NOT NULL,
	[DEC] [float] NOT NULL,
	[VAR_MATCHED] [smallint] NOT NULL,
	[VAR_CHI2] [real] NOT NULL,
	[VAR_A] [real] NOT NULL,
	[VAR_GAMMA] [real] NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[qsoVarStripe]    Script Date: 3/22/2017 2:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qsoVarStripe](
	[VAR_OBJID] [bigint] NOT NULL,
	[RA] [float] NOT NULL,
	[DEC] [float] NOT NULL,
	[VAR_CHI2] [real] NOT NULL,
	[VAR_A] [real] NOT NULL,
	[VAR_GAMMA] [real] NOT NULL,
	[NEPOQS] [int] NOT NULL,
	[CHI2_U] [real] NOT NULL,
	[CHI2_G] [real] NOT NULL,
	[CHI2_R] [real] NOT NULL,
	[CHI2_I] [real] NOT NULL,
	[CHI2_Z] [real] NOT NULL,
	[VAR_NN] [real] NOT NULL,
	[MJD_FIRST] [real] NOT NULL,
	[MJD_LAST] [real] NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[QueryResults]    Script Date: 3/22/2017 2:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QueryResults](
	[query] [varchar](10) NOT NULL,
	[cpu_sec] [float] NOT NULL,
	[elapsed_time] [float] NOT NULL,
	[physical_IO] [float] NOT NULL,
	[row_count] [bigint] NOT NULL,
	[time] [datetime] NOT NULL,
	[comment] [varchar](100) NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[RC3]    Script Date: 3/22/2017 2:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RC3](
	[objID] [bigint] NOT NULL,
	[RA] [float] NOT NULL,
	[DEC] [float] NOT NULL,
	[NAME1] [varchar](100) NOT NULL,
	[NAME2] [varchar](100) NOT NULL,
	[NAME3] [varchar](100) NOT NULL,
	[PGC] [varchar](100) NOT NULL,
	[HUBBLE] [varchar](100) NOT NULL,
	[LOGD_25] [real] NOT NULL,
	[LOGD_25Q] [varchar](100) NOT NULL,
	[LOGD_25ERR] [real] NOT NULL,
	[PA] [real] NOT NULL,
	[BT] [real] NOT NULL,
	[BT_S] [varchar](100) NOT NULL,
	[BTQ] [varchar](100) NOT NULL,
	[BTERR] [real] NOT NULL,
	[BMVT] [real] NOT NULL,
	[BMVTQ] [varchar](100) NOT NULL,
	[BMVTERR] [real] NOT NULL,
	[BMVE] [real] NOT NULL,
	[BMVEQ] [varchar](100) NOT NULL,
	[BMVEERR] [real] NOT NULL,
	[M21] [real] NOT NULL,
	[M21Q] [varchar](100) NOT NULL,
	[M21ERR] [real] NOT NULL,
	[V21] [real] NOT NULL,
	[V21Q] [varchar](100) NOT NULL,
	[V21ERR] [real] NOT NULL,
	[HUBBLE_SRC] [varchar](100) NOT NULL,
	[N_L] [smallint] NOT NULL,
	[LOGR_25] [real] NOT NULL,
	[LOGR_25Q] [varchar](100) NOT NULL,
	[LOGR_25ERR] [real] NOT NULL,
	[AGB] [real] NOT NULL,
	[MB] [real] NOT NULL,
	[MBQ] [varchar](100) NOT NULL,
	[MBERR] [real] NOT NULL,
	[UMBT] [real] NOT NULL,
	[UMBTQ] [varchar](100) NOT NULL,
	[UMBTERR] [real] NOT NULL,
	[UMBE] [real] NOT NULL,
	[UMBEQ] [varchar](100) NOT NULL,
	[UMBEERR] [real] NOT NULL,
	[W20] [real] NOT NULL,
	[W20Q] [varchar](100) NOT NULL,
	[W20ERR] [real] NOT NULL,
	[VOPT] [real] NOT NULL,
	[VOPTQ] [varchar](100) NOT NULL,
	[VOPTERR] [real] NOT NULL,
	[SGL] [float] NOT NULL,
	[SGB] [float] NOT NULL,
	[TYPE] [real] NOT NULL,
	[TYPEQ] [varchar](100) NOT NULL,
	[TYPEERR] [real] NOT NULL,
	[LOGA_E] [real] NOT NULL,
	[LOGA_EQ] [varchar](100) NOT NULL,
	[LOGA_EERR] [real] NOT NULL,
	[AIB] [real] NOT NULL,
	[MFIR] [real] NOT NULL,
	[BMVT0] [real] NOT NULL,
	[MPE] [real] NOT NULL,
	[MPEQ] [varchar](100) NOT NULL,
	[MPEERR] [real] NOT NULL,
	[W50] [real] NOT NULL,
	[W50Q] [varchar](100) NOT NULL,
	[W50ERR] [real] NOT NULL,
	[VGSR] [real] NOT NULL,
	[L] [real] NOT NULL,
	[LQ] [varchar](100) NOT NULL,
	[LERR] [real] NOT NULL,
	[LOGD0] [real] NOT NULL,
	[SA21] [real] NOT NULL,
	[BT0] [real] NOT NULL,
	[UMBT0] [real] NOT NULL,
	[MP25] [real] NOT NULL,
	[MP25Q] [varchar](100) NOT NULL,
	[MP25ERR] [real] NOT NULL,
	[HI] [real] NOT NULL,
	[V3K] [real] NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[RecentQueries]    Script Date: 3/22/2017 2:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecentQueries](
	[ipAddr] [varchar](30) NOT NULL,
	[lastQueryTime] [datetime] NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[Region]    Script Date: 3/22/2017 2:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Region](
	[regionid] [bigint] IDENTITY(1,1) NOT NULL,
	[id] [bigint] NOT NULL,
	[type] [varchar](16) NOT NULL,
	[comment] [varchar](1024) NOT NULL,
	[ismask] [tinyint] NOT NULL,
	[area] [float] NOT NULL,
	[regionString] [varchar](max) NULL,
	[regionBinary] [varbinary](max) NULL
) ON [DATAFG] TEXTIMAGE_ON [PRIMARY]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[Region2Box]    Script Date: 3/22/2017 2:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Region2Box](
	[regionType] [varchar](16) NOT NULL,
	[id] [bigint] NOT NULL,
	[boxType] [varchar](16) NOT NULL,
	[boxid] [bigint] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RegionArcs]    Script Date: 3/22/2017 2:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegionArcs](
	[arcid] [int] IDENTITY(1,1) NOT NULL,
	[regionid] [bigint] NOT NULL,
	[convexid] [bigint] NOT NULL,
	[constraintid] [bigint] NOT NULL,
	[patch] [int] NOT NULL,
	[state] [int] NOT NULL,
	[draw] [int] NOT NULL,
	[ra1] [float] NOT NULL,
	[dec1] [float] NOT NULL,
	[ra2] [float] NOT NULL,
	[dec2] [float] NOT NULL,
	[x] [float] NOT NULL,
	[y] [float] NOT NULL,
	[z] [float] NOT NULL,
	[c] [float] NOT NULL,
	[length] [float] NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[RegionPatch]    Script Date: 3/22/2017 2:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegionPatch](
	[regionid] [bigint] NOT NULL,
	[convexid] [bigint] NOT NULL,
	[patchid] [int] NOT NULL,
	[type] [varchar](16) NOT NULL,
	[radius] [float] NOT NULL,
	[ra] [float] NOT NULL,
	[dec] [float] NOT NULL,
	[x] [float] NOT NULL,
	[y] [float] NOT NULL,
	[z] [float] NOT NULL,
	[c] [float] NOT NULL,
	[htmid] [bigint] NOT NULL,
	[area] [float] NOT NULL,
	[convexString] [varchar](max) NULL
) ON [DATAFG] TEXTIMAGE_ON [PRIMARY]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[RegionTypes]    Script Date: 3/22/2017 2:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegionTypes](
	[type] [varchar](16) NOT NULL,
	[radius] [float] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rmatrix]    Script Date: 3/22/2017 2:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rmatrix](
	[mode] [varchar](16) NOT NULL,
	[row] [smallint] NOT NULL,
	[x] [float] NOT NULL,
	[y] [float] NOT NULL,
	[z] [float] NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[ROSAT]    Script Date: 3/22/2017 2:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ROSAT](
	[OBJID] [bigint] NOT NULL,
	[SOURCENAME] [varchar](100) NOT NULL,
	[RA] [float] NOT NULL,
	[DEC] [float] NOT NULL,
	[RADECERR] [real] NOT NULL,
	[FLAGS] [varchar](100) NOT NULL,
	[FLAGS2] [varchar](100) NOT NULL,
	[CPS] [real] NOT NULL,
	[CPS_ERR] [real] NOT NULL,
	[BGCPS] [real] NOT NULL,
	[EXPTIME] [real] NOT NULL,
	[HR1] [real] NOT NULL,
	[HR1_ERR] [real] NOT NULL,
	[HR2] [real] NOT NULL,
	[HR2_ERR] [real] NOT NULL,
	[EXT] [real] NOT NULL,
	[EXTL] [real] NOT NULL,
	[SRCL] [real] NOT NULL,
	[EXTR] [real] NOT NULL,
	[PRIORITY] [varchar](100) NOT NULL,
	[ERANGE] [varchar](100) NOT NULL,
	[VIGF] [real] NOT NULL,
	[ORGDAT] [varchar](100) NOT NULL,
	[MODDAT] [varchar](100) NOT NULL,
	[ID] [int] NOT NULL,
	[FIELDID] [int] NOT NULL,
	[SRCNUM] [int] NOT NULL,
	[RCT1] [smallint] NOT NULL,
	[RCT2] [smallint] NOT NULL,
	[RCT3] [smallint] NOT NULL,
	[ITB] [varchar](100) NOT NULL,
	[ITE] [varchar](100) NOT NULL,
	[RL] [smallint] NOT NULL,
	[CAT] [varchar](100) NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[row_compression_estimates]    Script Date: 3/22/2017 2:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[row_compression_estimates](
	[object_name] [sysname] NOT NULL,
	[schema_name] [sysname] NOT NULL,
	[index_id] [int] NOT NULL,
	[partition_number] [int] NOT NULL,
	[size_with_current_compression_setting(KB)] [bigint] NOT NULL,
	[size_with_requested_compression_setting(KB)] [bigint] NOT NULL,
	[sample_size_with_current_compression_setting(KB)] [bigint] NOT NULL,
	[sample_size_with_requested_compression_setting(KB)] [bigint] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Run]    Script Date: 3/22/2017 2:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Run](
	[skyVersion] [tinyint] NOT NULL,
	[run] [smallint] NOT NULL,
	[rerun] [smallint] NOT NULL,
	[mjd] [int] NOT NULL,
	[datestring] [varchar](32) NOT NULL,
	[stripe] [int] NOT NULL,
	[strip] [varchar](32) NOT NULL,
	[xBore] [float] NOT NULL,
	[fieldRef] [int] NOT NULL,
	[lastField] [int] NOT NULL,
	[flavor] [varchar](32) NOT NULL,
	[xBin] [int] NOT NULL,
	[yBin] [int] NOT NULL,
	[nRow] [int] NOT NULL,
	[mjdRef] [float] NOT NULL,
	[muRef] [float] NOT NULL,
	[lineStart] [int] NOT NULL,
	[tracking] [float] NOT NULL,
	[node] [float] NOT NULL,
	[incl] [float] NOT NULL,
	[comments] [varchar](128) NOT NULL,
	[qterm] [real] NOT NULL,
	[maxMuResid] [real] NOT NULL,
	[maxNuResid] [real] NOT NULL,
	[startField] [int] NOT NULL,
	[endField] [int] NOT NULL,
	[photoVersion] [varchar](32) NOT NULL,
	[dervishVersion] [varchar](32) NOT NULL,
	[astromVersion] [varchar](32) NOT NULL,
	[sasVersion] [varchar](32) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RunShift]    Script Date: 3/22/2017 2:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RunShift](
	[run] [int] NOT NULL,
	[shift] [float] NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[sdssBestTarget2Sector]    Script Date: 3/22/2017 2:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sdssBestTarget2Sector](
	[objID] [bigint] NOT NULL,
	[regionID] [bigint] NOT NULL,
	[status] [int] NOT NULL,
	[primTarget] [int] NOT NULL,
	[secTarget] [int] NOT NULL,
	[petroMag_r] [real] NOT NULL,
	[extinction_r] [real] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SDSSConstants]    Script Date: 3/22/2017 2:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SDSSConstants](
	[name] [varchar](32) NOT NULL,
	[value] [float] NOT NULL,
	[unit] [varchar](32) NOT NULL,
	[description] [varchar](2000) NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[sdssImagingHalfSpaces]    Script Date: 3/22/2017 2:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sdssImagingHalfSpaces](
	[sdssPolygonID] [int] NOT NULL,
	[x] [float] NOT NULL,
	[y] [float] NOT NULL,
	[z] [float] NOT NULL,
	[c] [float] NOT NULL,
	[xMangle] [float] NOT NULL,
	[yMangle] [float] NOT NULL,
	[zMangle] [float] NOT NULL,
	[cMangle] [float] NOT NULL,
	[loadVersion] [int] NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[sdssPolygon2Field]    Script Date: 3/22/2017 2:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sdssPolygon2Field](
	[sdssPolygonID] [int] NOT NULL,
	[fieldID] [bigint] NOT NULL,
	[loadVersion] [int] NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[sdssPolygons]    Script Date: 3/22/2017 2:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sdssPolygons](
	[sdssPolygonID] [int] NOT NULL,
	[nField] [int] NOT NULL,
	[primaryFieldID] [bigint] NOT NULL,
	[ra] [float] NOT NULL,
	[dec] [float] NOT NULL,
	[area] [float] NOT NULL,
	[loadVersion] [int] NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[sdssSector]    Script Date: 3/22/2017 2:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sdssSector](
	[regionID] [bigint] NOT NULL,
	[nTiles] [int] NOT NULL,
	[tiles] [varchar](256) NOT NULL,
	[targetVersion] [varchar](64) NOT NULL,
	[area] [real] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sdssSector2Tile]    Script Date: 3/22/2017 2:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sdssSector2Tile](
	[regionID] [bigint] NOT NULL,
	[type] [varchar](16) NOT NULL,
	[tile] [smallint] NOT NULL,
	[isMask] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sdssTargetParam]    Script Date: 3/22/2017 2:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sdssTargetParam](
	[targetVersion] [varchar](32) NOT NULL,
	[paramFile] [varchar](32) NOT NULL,
	[name] [varchar](32) NOT NULL,
	[value] [varchar](512) NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[sdssTileAll]    Script Date: 3/22/2017 2:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sdssTileAll](
	[tile] [smallint] NOT NULL,
	[tileRun] [smallint] NOT NULL,
	[raCen] [float] NOT NULL,
	[decCen] [float] NOT NULL,
	[htmID] [bigint] NOT NULL,
	[cx] [float] NOT NULL,
	[cy] [float] NOT NULL,
	[cz] [float] NOT NULL,
	[untiled] [tinyint] NOT NULL,
	[nTargets] [int] NOT NULL,
	[loadVersion] [int] NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[sdssTiledTargetAll]    Script Date: 3/22/2017 2:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sdssTiledTargetAll](
	[targetID] [bigint] NOT NULL,
	[run] [smallint] NOT NULL,
	[rerun] [smallint] NOT NULL,
	[camcol] [smallint] NOT NULL,
	[field] [smallint] NOT NULL,
	[obj] [smallint] NOT NULL,
	[ra] [float] NOT NULL,
	[dec] [float] NOT NULL,
	[htmID] [bigint] NOT NULL,
	[cx] [float] NOT NULL,
	[cy] [float] NOT NULL,
	[cz] [float] NOT NULL,
	[primTarget] [int] NOT NULL,
	[secTarget] [int] NOT NULL,
	[tiPriority] [int] NOT NULL,
	[tileAll] [int] NOT NULL,
	[tiMaskAll] [smallint] NOT NULL,
	[collisionGroupAll] [int] NOT NULL,
	[photoObjID] [bigint] NOT NULL,
	[specObjID] [bigint] NOT NULL,
	[regionID] [int] NOT NULL,
	[loadVersion] [int] NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[sdssTilingGeometry]    Script Date: 3/22/2017 2:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sdssTilingGeometry](
	[tilingGeometryID] [int] NOT NULL,
	[tileRun] [smallint] NOT NULL,
	[stripe] [int] NOT NULL,
	[nsbx] [varchar](1) NOT NULL,
	[isMask] [tinyint] NOT NULL,
	[coordType] [int] NOT NULL,
	[lambdamu_0] [float] NOT NULL,
	[lambdamu_1] [float] NOT NULL,
	[etanu_0] [float] NOT NULL,
	[etanu_1] [float] NOT NULL,
	[lambdaLimit_0] [float] NOT NULL,
	[lambdaLimit_1] [float] NOT NULL,
	[targetVersion] [varchar](32) NOT NULL,
	[firstArea] [float] NOT NULL,
	[loadVersion] [int] NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[sdssTilingInfo]    Script Date: 3/22/2017 2:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sdssTilingInfo](
	[targetID] [bigint] NOT NULL,
	[tileRun] [smallint] NOT NULL,
	[tid] [int] NOT NULL,
	[tiMask] [smallint] NOT NULL,
	[collisionGroup] [int] NOT NULL,
	[tile] [int] NOT NULL,
	[loadVersion] [int] NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[sdssTilingRun]    Script Date: 3/22/2017 2:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sdssTilingRun](
	[tileRun] [smallint] NOT NULL,
	[ctileVersion] [varchar](32) NOT NULL,
	[tilepId] [varchar](32) NOT NULL,
	[programName] [varchar](32) NOT NULL,
	[primTargetMask] [int] NOT NULL,
	[secTargetMask] [int] NOT NULL,
	[loadVersion] [int] NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[segueTargetAll]    Script Date: 3/22/2017 2:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[segueTargetAll](
	[objid] [bigint] NOT NULL,
	[segue1_target1] [int] NOT NULL,
	[segue1_target2] [int] NOT NULL,
	[segue2_target1] [int] NOT NULL,
	[segue2_target2] [int] NOT NULL,
	[lcolor] [real] NOT NULL,
	[scolor] [real] NOT NULL,
	[p1s] [real] NOT NULL,
	[totalpm] [real] NOT NULL,
	[hg] [real] NOT NULL,
	[Mi] [real] NOT NULL,
	[disti] [real] NOT NULL,
	[Hr] [real] NOT NULL,
	[vmi_trans1] [real] NOT NULL,
	[vmi_trans2] [real] NOT NULL,
	[vmag_trans] [real] NOT NULL,
	[Mv_trans] [real] NOT NULL,
	[distv_kpc] [real] NOT NULL,
	[vtrans_galrest] [real] NOT NULL,
	[mutrans_galradrest] [real] NOT NULL,
	[murad_galradrest] [real] NOT NULL,
	[vtot_galradrest] [real] NOT NULL,
	[mg_tohv] [real] NOT NULL,
	[vtrans_tohv] [real] NOT NULL,
	[pm1sigma_tohv] [real] NOT NULL,
	[v1sigmaerr_tohv] [real] NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[SiteConstants]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SiteConstants](
	[name] [varchar](64) NOT NULL,
	[value] [varchar](64) NOT NULL,
	[comment] [varchar](256) NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[SiteDBs]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SiteDBs](
	[dbname] [varchar](64) NOT NULL,
	[description] [varchar](128) NOT NULL,
	[active] [char](1) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SiteDiagnostics]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SiteDiagnostics](
	[name] [varchar](64) NOT NULL,
	[type] [varchar](8) NOT NULL,
	[count] [bigint] NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[SkipFinishPhases]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SkipFinishPhases](
	[phase] [varchar](32) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SpecDR7]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpecDR7](
	[specObjID] [bigint] NOT NULL,
	[dr7ObjID] [bigint] NOT NULL,
	[ra] [float] NOT NULL,
	[dec] [float] NOT NULL,
	[cx] [float] NOT NULL,
	[cy] [float] NOT NULL,
	[cz] [float] NOT NULL,
	[skyVersion] [tinyint] NOT NULL,
	[run] [smallint] NOT NULL,
	[rerun] [smallint] NOT NULL,
	[camcol] [tinyint] NOT NULL,
	[field] [smallint] NOT NULL,
	[obj] [smallint] NOT NULL,
	[nChild] [smallint] NOT NULL,
	[type] [smallint] NOT NULL,
	[probPSF] [real] NOT NULL,
	[insideMask] [tinyint] NOT NULL,
	[flags] [bigint] NOT NULL,
	[psfMag_u] [real] NOT NULL,
	[psfMag_g] [real] NOT NULL,
	[psfMag_r] [real] NOT NULL,
	[psfMag_i] [real] NOT NULL,
	[psfMag_z] [real] NOT NULL,
	[psfMagErr_u] [real] NOT NULL,
	[psfMagErr_g] [real] NOT NULL,
	[psfMagErr_r] [real] NOT NULL,
	[psfMagErr_i] [real] NOT NULL,
	[psfMagErr_z] [real] NOT NULL,
	[petroMag_u] [real] NOT NULL,
	[petroMag_g] [real] NOT NULL,
	[petroMag_r] [real] NOT NULL,
	[petroMag_i] [real] NOT NULL,
	[petroMag_z] [real] NOT NULL,
	[petroMagErr_u] [real] NOT NULL,
	[petroMagErr_g] [real] NOT NULL,
	[petroMagErr_r] [real] NOT NULL,
	[petroMagErr_i] [real] NOT NULL,
	[petroMagErr_z] [real] NOT NULL,
	[petroR50_r] [real] NOT NULL,
	[petroR90_r] [real] NOT NULL,
	[modelMag_u] [real] NOT NULL,
	[modelMag_g] [real] NOT NULL,
	[modelMag_r] [real] NOT NULL,
	[modelMag_i] [real] NOT NULL,
	[modelMag_z] [real] NOT NULL,
	[modelMagErr_u] [real] NOT NULL,
	[modelMagErr_g] [real] NOT NULL,
	[modelMagErr_r] [real] NOT NULL,
	[modelMagErr_i] [real] NOT NULL,
	[modelMagErr_z] [real] NOT NULL,
	[mRrCc_r] [real] NOT NULL,
	[mRrCcErr_r] [real] NOT NULL,
	[lnLStar_r] [real] NOT NULL,
	[lnLExp_r] [real] NOT NULL,
	[lnLDeV_r] [real] NOT NULL,
	[status] [int] NOT NULL,
	[primTarget] [int] NOT NULL,
	[secTarget] [int] NOT NULL,
	[extinction_u] [real] NOT NULL,
	[extinction_g] [real] NOT NULL,
	[extinction_r] [real] NOT NULL,
	[extinction_i] [real] NOT NULL,
	[extinction_z] [real] NOT NULL,
	[htmID] [bigint] NOT NULL,
	[fieldID] [bigint] NOT NULL,
	[size] [real] NOT NULL,
	[pmRa] [real] NOT NULL,
	[pmDec] [real] NOT NULL,
	[pmL] [real] NOT NULL,
	[pmB] [real] NOT NULL,
	[pmRaErr] [real] NOT NULL,
	[pmDecErr] [real] NOT NULL,
	[delta] [real] NOT NULL,
	[match] [int] NOT NULL
) ON [SPEC]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[SpecObjAll]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpecObjAll](
	[specObjID] [numeric](20, 0) NOT NULL,
	[bestObjID] [bigint] NOT NULL,
	[fluxObjID] [bigint] NOT NULL,
	[targetObjID] [bigint] NOT NULL,
	[plateID] [bigint] NOT NULL,
	[sciencePrimary] [smallint] NOT NULL,
	[legacyPrimary] [smallint] NOT NULL,
	[seguePrimary] [smallint] NOT NULL,
	[segue1Primary] [smallint] NOT NULL,
	[segue2Primary] [smallint] NOT NULL,
	[bossPrimary] [smallint] NOT NULL,
	[sdssPrimary] [smallint] NOT NULL,
	[bossSpecObjID] [int] NOT NULL,
	[firstRelease] [varchar](32) NOT NULL,
	[survey] [varchar](32) NOT NULL,
	[instrument] [varchar](32) NOT NULL,
	[programname] [varchar](32) NOT NULL,
	[chunk] [varchar](32) NOT NULL,
	[platerun] [varchar](32) NOT NULL,
	[mjd] [int] NOT NULL,
	[plate] [smallint] NOT NULL,
	[fiberID] [smallint] NOT NULL,
	[run1d] [varchar](32) NOT NULL,
	[run2d] [varchar](32) NOT NULL,
	[tile] [int] NOT NULL,
	[designID] [int] NOT NULL,
	[legacy_target1] [bigint] NOT NULL,
	[legacy_target2] [bigint] NOT NULL,
	[special_target1] [bigint] NOT NULL,
	[special_target2] [bigint] NOT NULL,
	[segue1_target1] [bigint] NOT NULL,
	[segue1_target2] [bigint] NOT NULL,
	[segue2_target1] [bigint] NOT NULL,
	[segue2_target2] [bigint] NOT NULL,
	[boss_target1] [bigint] NOT NULL,
	[eboss_target0] [bigint] NOT NULL,
	[ancillary_target1] [bigint] NOT NULL,
	[ancillary_target2] [bigint] NOT NULL,
	[primTarget] [bigint] NOT NULL,
	[secTarget] [bigint] NOT NULL,
	[spectrographID] [smallint] NOT NULL,
	[sourceType] [varchar](128) NOT NULL,
	[targetType] [varchar](128) NOT NULL,
	[ra] [float] NOT NULL,
	[dec] [float] NOT NULL,
	[cx] [float] NOT NULL,
	[cy] [float] NOT NULL,
	[cz] [float] NOT NULL,
	[xFocal] [real] NOT NULL,
	[yFocal] [real] NOT NULL,
	[lambdaEff] [real] NOT NULL,
	[blueFiber] [int] NOT NULL,
	[zOffset] [real] NOT NULL,
	[z] [real] NOT NULL,
	[zErr] [real] NOT NULL,
	[zWarning] [int] NOT NULL,
	[class] [varchar](32) NOT NULL,
	[subClass] [varchar](32) NOT NULL,
	[rChi2] [real] NOT NULL,
	[DOF] [real] NOT NULL,
	[rChi2Diff] [real] NOT NULL,
	[z_noqso] [real] NOT NULL,
	[zErr_noqso] [real] NOT NULL,
	[zWarning_noqso] [int] NOT NULL,
	[class_noqso] [varchar](32) NOT NULL,
	[subClass_noqso] [varchar](32) NOT NULL,
	[rChi2Diff_noqso] [real] NOT NULL,
	[z_person] [real] NOT NULL,
	[class_person] [varchar](32) NOT NULL,
	[comments_person] [varchar](200) NOT NULL,
	[tFile] [varchar](32) NOT NULL,
	[tColumn_0] [smallint] NOT NULL,
	[tColumn_1] [smallint] NOT NULL,
	[tColumn_2] [smallint] NOT NULL,
	[tColumn_3] [smallint] NOT NULL,
	[tColumn_4] [smallint] NOT NULL,
	[tColumn_5] [smallint] NOT NULL,
	[tColumn_6] [smallint] NOT NULL,
	[tColumn_7] [smallint] NOT NULL,
	[tColumn_8] [smallint] NOT NULL,
	[tColumn_9] [smallint] NOT NULL,
	[nPoly] [real] NOT NULL,
	[theta_0] [real] NOT NULL,
	[theta_1] [real] NOT NULL,
	[theta_2] [real] NOT NULL,
	[theta_3] [real] NOT NULL,
	[theta_4] [real] NOT NULL,
	[theta_5] [real] NOT NULL,
	[theta_6] [real] NOT NULL,
	[theta_7] [real] NOT NULL,
	[theta_8] [real] NOT NULL,
	[theta_9] [real] NOT NULL,
	[velDisp] [real] NOT NULL,
	[velDispErr] [real] NOT NULL,
	[velDispZ] [real] NOT NULL,
	[velDispZErr] [real] NOT NULL,
	[velDispChi2] [real] NOT NULL,
	[velDispNPix] [int] NOT NULL,
	[velDispDOF] [int] NOT NULL,
	[waveMin] [real] NOT NULL,
	[waveMax] [real] NOT NULL,
	[wCoverage] [real] NOT NULL,
	[snMedian_u] [real] NOT NULL,
	[snMedian_g] [real] NOT NULL,
	[snMedian_r] [real] NOT NULL,
	[snMedian_i] [real] NOT NULL,
	[snMedian_z] [real] NOT NULL,
	[snMedian] [real] NOT NULL,
	[chi68p] [real] NOT NULL,
	[fracNSigma_1] [real] NOT NULL,
	[fracNSigma_2] [real] NOT NULL,
	[fracNSigma_3] [real] NOT NULL,
	[fracNSigma_4] [real] NOT NULL,
	[fracNSigma_5] [real] NOT NULL,
	[fracNSigma_6] [real] NOT NULL,
	[fracNSigma_7] [real] NOT NULL,
	[fracNSigma_8] [real] NOT NULL,
	[fracNSigma_9] [real] NOT NULL,
	[fracNSigma_10] [real] NOT NULL,
	[fracNSigHi_1] [real] NOT NULL,
	[fracNSigHi_2] [real] NOT NULL,
	[fracNSigHi_3] [real] NOT NULL,
	[fracNSigHi_4] [real] NOT NULL,
	[fracNSigHi_5] [real] NOT NULL,
	[fracNSigHi_6] [real] NOT NULL,
	[fracNSigHi_7] [real] NOT NULL,
	[fracNSigHi_8] [real] NOT NULL,
	[fracNSigHi_9] [real] NOT NULL,
	[fracNSigHi_10] [real] NOT NULL,
	[fracNSigLo_1] [real] NOT NULL,
	[fracNSigLo_2] [real] NOT NULL,
	[fracNSigLo_3] [real] NOT NULL,
	[fracNSigLo_4] [real] NOT NULL,
	[fracNSigLo_5] [real] NOT NULL,
	[fracNSigLo_6] [real] NOT NULL,
	[fracNSigLo_7] [real] NOT NULL,
	[fracNSigLo_8] [real] NOT NULL,
	[fracNSigLo_9] [real] NOT NULL,
	[fracNSigLo_10] [real] NOT NULL,
	[spectroFlux_u] [real] NOT NULL,
	[spectroFlux_g] [real] NOT NULL,
	[spectroFlux_r] [real] NOT NULL,
	[spectroFlux_i] [real] NOT NULL,
	[spectroFlux_z] [real] NOT NULL,
	[spectroSynFlux_u] [real] NOT NULL,
	[spectroSynFlux_g] [real] NOT NULL,
	[spectroSynFlux_r] [real] NOT NULL,
	[spectroSynFlux_i] [real] NOT NULL,
	[spectroSynFlux_z] [real] NOT NULL,
	[spectroFluxIvar_u] [real] NOT NULL,
	[spectroFluxIvar_g] [real] NOT NULL,
	[spectroFluxIvar_r] [real] NOT NULL,
	[spectroFluxIvar_i] [real] NOT NULL,
	[spectroFluxIvar_z] [real] NOT NULL,
	[spectroSynFluxIvar_u] [real] NOT NULL,
	[spectroSynFluxIvar_g] [real] NOT NULL,
	[spectroSynFluxIvar_r] [real] NOT NULL,
	[spectroSynFluxIvar_i] [real] NOT NULL,
	[spectroSynFluxIvar_z] [real] NOT NULL,
	[spectroSkyFlux_u] [real] NOT NULL,
	[spectroSkyFlux_g] [real] NOT NULL,
	[spectroSkyFlux_r] [real] NOT NULL,
	[spectroSkyFlux_i] [real] NOT NULL,
	[spectroSkyFlux_z] [real] NOT NULL,
	[anyAndMask] [int] NOT NULL,
	[anyOrMask] [int] NOT NULL,
	[plateSN2] [real] NOT NULL,
	[deredSN2] [real] NOT NULL,
	[snTurnoff] [real] NOT NULL,
	[sn1_g] [real] NOT NULL,
	[sn1_r] [real] NOT NULL,
	[sn1_i] [real] NOT NULL,
	[sn2_g] [real] NOT NULL,
	[sn2_r] [real] NOT NULL,
	[sn2_i] [real] NOT NULL,
	[elodieFileName] [varchar](32) NOT NULL,
	[elodieObject] [varchar](32) NOT NULL,
	[elodieSpType] [varchar](32) NOT NULL,
	[elodieBV] [real] NOT NULL,
	[elodieTEff] [real] NOT NULL,
	[elodieLogG] [real] NOT NULL,
	[elodieFeH] [real] NOT NULL,
	[elodieZ] [real] NOT NULL,
	[elodieZErr] [real] NOT NULL,
	[elodieZModelErr] [real] NOT NULL,
	[elodieRChi2] [real] NOT NULL,
	[elodieDOF] [real] NOT NULL,
	[htmID] [bigint] NOT NULL,
	[loadVersion] [int] NOT NULL,
	[img] [varbinary](max) NOT NULL
) ON [SPEC] TEXTIMAGE_ON [SPEC]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[SpecPhotoAll]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpecPhotoAll](
	[specObjID] [numeric](20, 0) NOT NULL,
	[mjd] [int] NOT NULL,
	[plate] [smallint] NOT NULL,
	[tile] [smallint] NOT NULL,
	[fiberID] [smallint] NOT NULL,
	[z] [real] NOT NULL,
	[zErr] [real] NOT NULL,
	[class] [varchar](32) NOT NULL,
	[subClass] [varchar](32) NOT NULL,
	[zWarning] [int] NOT NULL,
	[ra] [float] NOT NULL,
	[dec] [float] NOT NULL,
	[cx] [float] NOT NULL,
	[cy] [float] NOT NULL,
	[cz] [float] NOT NULL,
	[htmID] [bigint] NOT NULL,
	[sciencePrimary] [smallint] NOT NULL,
	[legacyPrimary] [smallint] NOT NULL,
	[seguePrimary] [smallint] NOT NULL,
	[segue1Primary] [smallint] NOT NULL,
	[segue2Primary] [smallint] NOT NULL,
	[bossPrimary] [smallint] NOT NULL,
	[sdssPrimary] [smallint] NOT NULL,
	[survey] [varchar](32) NOT NULL,
	[programname] [varchar](32) NOT NULL,
	[legacy_target1] [bigint] NOT NULL,
	[legacy_target2] [bigint] NOT NULL,
	[special_target1] [bigint] NOT NULL,
	[special_target2] [bigint] NOT NULL,
	[segue1_target1] [bigint] NOT NULL,
	[segue1_target2] [bigint] NOT NULL,
	[segue2_target1] [bigint] NOT NULL,
	[segue2_target2] [bigint] NOT NULL,
	[boss_target1] [bigint] NOT NULL,
	[ancillary_target1] [bigint] NOT NULL,
	[ancillary_target2] [bigint] NOT NULL,
	[plateID] [bigint] NOT NULL,
	[sourceType] [varchar](32) NOT NULL,
	[targetObjID] [bigint] NOT NULL,
	[objID] [bigint] NULL,
	[skyVersion] [int] NULL,
	[run] [int] NULL,
	[rerun] [int] NULL,
	[camcol] [int] NULL,
	[field] [int] NULL,
	[obj] [int] NULL,
	[mode] [int] NULL,
	[nChild] [int] NULL,
	[type] [int] NULL,
	[flags] [bigint] NULL,
	[psfMag_u] [real] NULL,
	[psfMag_g] [real] NULL,
	[psfMag_r] [real] NULL,
	[psfMag_i] [real] NULL,
	[psfMag_z] [real] NULL,
	[psfMagErr_u] [real] NULL,
	[psfMagErr_g] [real] NULL,
	[psfMagErr_r] [real] NULL,
	[psfMagErr_i] [real] NULL,
	[psfMagErr_z] [real] NULL,
	[fiberMag_u] [real] NULL,
	[fiberMag_g] [real] NULL,
	[fiberMag_r] [real] NULL,
	[fiberMag_i] [real] NULL,
	[fiberMag_z] [real] NULL,
	[fiberMagErr_u] [real] NULL,
	[fiberMagErr_g] [real] NULL,
	[fiberMagErr_r] [real] NULL,
	[fiberMagErr_i] [real] NULL,
	[fiberMagErr_z] [real] NULL,
	[petroMag_u] [real] NULL,
	[petroMag_g] [real] NULL,
	[petroMag_r] [real] NULL,
	[petroMag_i] [real] NULL,
	[petroMag_z] [real] NULL,
	[petroMagErr_u] [real] NULL,
	[petroMagErr_g] [real] NULL,
	[petroMagErr_r] [real] NULL,
	[petroMagErr_i] [real] NULL,
	[petroMagErr_z] [real] NULL,
	[modelMag_u] [real] NULL,
	[modelMag_g] [real] NULL,
	[modelMag_r] [real] NULL,
	[modelMag_i] [real] NULL,
	[modelMag_z] [real] NULL,
	[modelMagErr_u] [real] NULL,
	[modelMagErr_g] [real] NULL,
	[modelMagErr_r] [real] NULL,
	[modelMagErr_i] [real] NULL,
	[modelMagErr_z] [real] NULL,
	[cModelMag_u] [real] NULL,
	[cModelMag_g] [real] NULL,
	[cModelMag_r] [real] NULL,
	[cModelMag_i] [real] NULL,
	[cModelMag_z] [real] NULL,
	[cModelMagErr_u] [real] NULL,
	[cModelMagErr_g] [real] NULL,
	[cModelMagErr_r] [real] NULL,
	[cModelMagErr_i] [real] NULL,
	[cModelMagErr_z] [real] NULL,
	[mRrCc_r] [real] NULL,
	[mRrCcErr_r] [real] NULL,
	[score] [real] NULL,
	[resolveStatus] [int] NULL,
	[calibStatus_u] [int] NULL,
	[calibStatus_g] [int] NULL,
	[calibStatus_r] [int] NULL,
	[calibStatus_i] [int] NULL,
	[calibStatus_z] [int] NULL,
	[photoRa] [float] NULL,
	[photoDec] [float] NULL,
	[extinction_u] [real] NULL,
	[extinction_g] [real] NULL,
	[extinction_r] [real] NULL,
	[extinction_i] [real] NULL,
	[extinction_z] [real] NULL,
	[fieldID] [bigint] NULL,
	[dered_u] [real] NULL,
	[dered_g] [real] NULL,
	[dered_r] [real] NULL,
	[dered_i] [real] NULL,
	[dered_z] [real] NULL
) ON [SPEC]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[sppLines]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sppLines](
	[SPECOBJID] [numeric](20, 0) NOT NULL,
	[bestObjID] [bigint] NOT NULL,
	[TARGETOBJID] [bigint] NOT NULL,
	[sciencePrimary] [smallint] NOT NULL,
	[legacyPrimary] [smallint] NOT NULL,
	[seguePrimary] [smallint] NOT NULL,
	[PLATE] [bigint] NOT NULL,
	[MJD] [bigint] NOT NULL,
	[FIBER] [bigint] NOT NULL,
	[RUN2D] [varchar](32) NOT NULL,
	[RUN1D] [varchar](32) NOT NULL,
	[RUNSSPP] [varchar](32) NOT NULL,
	[H83side] [real] NOT NULL,
	[H83cont] [real] NOT NULL,
	[H83err] [real] NOT NULL,
	[H83mask] [tinyint] NOT NULL,
	[H812side] [real] NOT NULL,
	[H812cont] [real] NOT NULL,
	[H812err] [real] NOT NULL,
	[H812mask] [tinyint] NOT NULL,
	[H824side] [real] NOT NULL,
	[H824cont] [real] NOT NULL,
	[H824err] [real] NOT NULL,
	[H824mask] [tinyint] NOT NULL,
	[H848side] [real] NOT NULL,
	[H848cont] [real] NOT NULL,
	[H848err] [real] NOT NULL,
	[H848mask] [tinyint] NOT NULL,
	[KP12side] [real] NOT NULL,
	[KP12cont] [real] NOT NULL,
	[KP12err] [real] NOT NULL,
	[KP12mask] [tinyint] NOT NULL,
	[KP18side] [real] NOT NULL,
	[KP18cont] [real] NOT NULL,
	[KP18err] [real] NOT NULL,
	[KP18mask] [tinyint] NOT NULL,
	[KP6side] [real] NOT NULL,
	[KP6cont] [real] NOT NULL,
	[KP6err] [real] NOT NULL,
	[KP6mask] [tinyint] NOT NULL,
	[CaIIKside] [real] NOT NULL,
	[CaIIKcont] [real] NOT NULL,
	[CaIIKerr] [real] NOT NULL,
	[CaIIKmask] [tinyint] NOT NULL,
	[CaIIHKside] [real] NOT NULL,
	[CaIIHKcont] [real] NOT NULL,
	[CaIIHKerr] [real] NOT NULL,
	[CaIIHKmask] [tinyint] NOT NULL,
	[Hepsside] [real] NOT NULL,
	[Hepscont] [real] NOT NULL,
	[Hepserr] [real] NOT NULL,
	[Hepsmask] [tinyint] NOT NULL,
	[KP16side] [real] NOT NULL,
	[KP16cont] [real] NOT NULL,
	[KP16err] [real] NOT NULL,
	[KP16mask] [tinyint] NOT NULL,
	[SrII1side] [real] NOT NULL,
	[SrII1cont] [real] NOT NULL,
	[SrII1err] [real] NOT NULL,
	[SrII1mask] [tinyint] NOT NULL,
	[HeI121side] [real] NOT NULL,
	[HeI121cont] [real] NOT NULL,
	[HeI121err] [real] NOT NULL,
	[HeI121mask] [tinyint] NOT NULL,
	[Hdelta12side] [real] NOT NULL,
	[Hdelta12cont] [real] NOT NULL,
	[Hdelta12err] [real] NOT NULL,
	[Hdelta12mask] [tinyint] NOT NULL,
	[Hdelta24side] [real] NOT NULL,
	[Hdelta24cont] [real] NOT NULL,
	[Hdelta24err] [real] NOT NULL,
	[Hdelta24mask] [tinyint] NOT NULL,
	[Hdelta48side] [real] NOT NULL,
	[Hdelta48cont] [real] NOT NULL,
	[Hdelta48err] [real] NOT NULL,
	[Hdelta48mask] [tinyint] NOT NULL,
	[Hdeltaside] [real] NOT NULL,
	[Hdeltacont] [real] NOT NULL,
	[Hdeltaerr] [real] NOT NULL,
	[Hdeltamask] [tinyint] NOT NULL,
	[CaI4side] [real] NOT NULL,
	[CaI4cont] [real] NOT NULL,
	[CaI4err] [real] NOT NULL,
	[CaI4mask] [tinyint] NOT NULL,
	[CaI12side] [real] NOT NULL,
	[CaI12cont] [real] NOT NULL,
	[CaI12err] [real] NOT NULL,
	[CaI12mask] [tinyint] NOT NULL,
	[CaI24side] [real] NOT NULL,
	[CaI24cont] [real] NOT NULL,
	[CaI24err] [real] NOT NULL,
	[CaI24mask] [tinyint] NOT NULL,
	[CaI6side] [real] NOT NULL,
	[CaI6cont] [real] NOT NULL,
	[CaI6err] [real] NOT NULL,
	[CaI6mask] [tinyint] NOT NULL,
	[Gside] [real] NOT NULL,
	[Gcont] [real] NOT NULL,
	[Gerr] [real] NOT NULL,
	[Gmask] [tinyint] NOT NULL,
	[Hgamma12side] [real] NOT NULL,
	[Hgamma12cont] [real] NOT NULL,
	[Hgamma12err] [real] NOT NULL,
	[Hgamma12mask] [tinyint] NOT NULL,
	[Hgamma24side] [real] NOT NULL,
	[Hgamma24cont] [real] NOT NULL,
	[Hgamma24err] [real] NOT NULL,
	[Hgamma24mask] [tinyint] NOT NULL,
	[Hgamma48side] [real] NOT NULL,
	[Hgamma48cont] [real] NOT NULL,
	[Hgamma48err] [real] NOT NULL,
	[Hgamma48mask] [tinyint] NOT NULL,
	[Hgammaside] [real] NOT NULL,
	[Hgammacont] [real] NOT NULL,
	[Hgammaerr] [real] NOT NULL,
	[Hgammamask] [tinyint] NOT NULL,
	[HeI122side] [real] NOT NULL,
	[HeI122cont] [real] NOT NULL,
	[HeI122err] [real] NOT NULL,
	[HeI122mask] [tinyint] NOT NULL,
	[Gblueside] [real] NOT NULL,
	[Gbluecont] [real] NOT NULL,
	[Gblueerr] [real] NOT NULL,
	[Gbluemask] [tinyint] NOT NULL,
	[Gwholeside] [real] NOT NULL,
	[Gwholecont] [real] NOT NULL,
	[Gwholeerr] [real] NOT NULL,
	[Gwholemask] [tinyint] NOT NULL,
	[Baside] [real] NOT NULL,
	[Bacont] [real] NOT NULL,
	[Baerr] [real] NOT NULL,
	[Bamask] [tinyint] NOT NULL,
	[C12C13side] [real] NOT NULL,
	[C12C13cont] [real] NOT NULL,
	[C12C13err] [real] NOT NULL,
	[C12C13mask] [tinyint] NOT NULL,
	[CC12side] [real] NOT NULL,
	[CC12cont] [real] NOT NULL,
	[CC12err] [real] NOT NULL,
	[CC12mask] [tinyint] NOT NULL,
	[metal1side] [real] NOT NULL,
	[metal1cont] [real] NOT NULL,
	[metal1err] [real] NOT NULL,
	[metal1mask] [tinyint] NOT NULL,
	[Hbeta12side] [real] NOT NULL,
	[Hbeta12cont] [real] NOT NULL,
	[Hbeta12err] [real] NOT NULL,
	[Hbeta12mask] [tinyint] NOT NULL,
	[Hbeta24side] [real] NOT NULL,
	[Hbeta24cont] [real] NOT NULL,
	[Hbeta24err] [real] NOT NULL,
	[Hbeta24mask] [tinyint] NOT NULL,
	[Hbeta48side] [real] NOT NULL,
	[Hbeta48cont] [real] NOT NULL,
	[Hbeta48err] [real] NOT NULL,
	[Hbeta48mask] [tinyint] NOT NULL,
	[Hbetaside] [real] NOT NULL,
	[Hbetacont] [real] NOT NULL,
	[Hbetaerr] [real] NOT NULL,
	[Hbetamask] [tinyint] NOT NULL,
	[C2side] [real] NOT NULL,
	[C2cont] [real] NOT NULL,
	[C2err] [real] NOT NULL,
	[C2mask] [tinyint] NOT NULL,
	[C2MgIside] [real] NOT NULL,
	[C2MgIcont] [real] NOT NULL,
	[C2MgIerr] [real] NOT NULL,
	[C2MgImask] [tinyint] NOT NULL,
	[MgHMgIC2side] [real] NOT NULL,
	[MgHMgIC2cont] [real] NOT NULL,
	[MgHMgIC2err] [real] NOT NULL,
	[MgHMgIC2mask] [tinyint] NOT NULL,
	[MgHMgIside] [real] NOT NULL,
	[MgHMgIcont] [real] NOT NULL,
	[MgHMgIerr] [real] NOT NULL,
	[MgHMgImask] [tinyint] NOT NULL,
	[MgHside] [real] NOT NULL,
	[MgHcont] [real] NOT NULL,
	[MgHerr] [real] NOT NULL,
	[MgHmask] [tinyint] NOT NULL,
	[CrIside] [real] NOT NULL,
	[CrIcont] [real] NOT NULL,
	[CrIerr] [real] NOT NULL,
	[CrImask] [tinyint] NOT NULL,
	[MgIFeIIside] [real] NOT NULL,
	[MgIFeIIcont] [real] NOT NULL,
	[MgIFeIIerr] [real] NOT NULL,
	[MgIFeIImask] [tinyint] NOT NULL,
	[MgI2side] [real] NOT NULL,
	[MgI2cont] [real] NOT NULL,
	[MgI2err] [real] NOT NULL,
	[MgI2mask] [tinyint] NOT NULL,
	[MgI121side] [real] NOT NULL,
	[MgI121cont] [real] NOT NULL,
	[MgI121err] [real] NOT NULL,
	[MgI121mask] [tinyint] NOT NULL,
	[MgI24side] [real] NOT NULL,
	[MgI24cont] [real] NOT NULL,
	[MgI24err] [real] NOT NULL,
	[MgI24mask] [tinyint] NOT NULL,
	[MgI122side] [real] NOT NULL,
	[MgI122cont] [real] NOT NULL,
	[MgI122err] [real] NOT NULL,
	[MgI122mask] [tinyint] NOT NULL,
	[NaI20side] [real] NOT NULL,
	[NaI20cont] [real] NOT NULL,
	[NaI20err] [real] NOT NULL,
	[NaI20mask] [tinyint] NOT NULL,
	[Na12side] [real] NOT NULL,
	[Na12cont] [real] NOT NULL,
	[Na12err] [real] NOT NULL,
	[Na12mask] [tinyint] NOT NULL,
	[Na24side] [real] NOT NULL,
	[Na24cont] [real] NOT NULL,
	[Na24err] [real] NOT NULL,
	[Na24mask] [tinyint] NOT NULL,
	[Halpha12side] [real] NOT NULL,
	[Halpha12cont] [real] NOT NULL,
	[Halpha12err] [real] NOT NULL,
	[Halpha12mask] [tinyint] NOT NULL,
	[Halpha24side] [real] NOT NULL,
	[Halpha24cont] [real] NOT NULL,
	[Halpha24err] [real] NOT NULL,
	[Halpha24mask] [tinyint] NOT NULL,
	[Halpha48side] [real] NOT NULL,
	[Halpha48cont] [real] NOT NULL,
	[Halpha48err] [real] NOT NULL,
	[Halpha48mask] [tinyint] NOT NULL,
	[Halpha70side] [real] NOT NULL,
	[Halpha70cont] [real] NOT NULL,
	[Halpha70err] [real] NOT NULL,
	[Halpha70mask] [tinyint] NOT NULL,
	[CaHside] [real] NOT NULL,
	[CaHcont] [real] NOT NULL,
	[CaHerr] [real] NOT NULL,
	[CaHmask] [tinyint] NOT NULL,
	[TiOside] [real] NOT NULL,
	[TiOcont] [real] NOT NULL,
	[TiOerr] [real] NOT NULL,
	[TiOmask] [tinyint] NOT NULL,
	[CNside] [real] NOT NULL,
	[CNcont] [real] NOT NULL,
	[CNerr] [real] NOT NULL,
	[CNmask] [tinyint] NOT NULL,
	[OItripside] [real] NOT NULL,
	[OItripcont] [real] NOT NULL,
	[OItriperr] [real] NOT NULL,
	[OItripmask] [tinyint] NOT NULL,
	[KI34side] [real] NOT NULL,
	[KI34cont] [real] NOT NULL,
	[KI34err] [real] NOT NULL,
	[KI34mask] [tinyint] NOT NULL,
	[KI95side] [real] NOT NULL,
	[KI95cont] [real] NOT NULL,
	[KI95err] [real] NOT NULL,
	[KI95mask] [tinyint] NOT NULL,
	[NaI15side] [real] NOT NULL,
	[NaI15cont] [real] NOT NULL,
	[NaI15err] [real] NOT NULL,
	[NaI15mask] [tinyint] NOT NULL,
	[NaIredside] [real] NOT NULL,
	[NaIredcont] [real] NOT NULL,
	[NaIrederr] [real] NOT NULL,
	[NaIredmask] [tinyint] NOT NULL,
	[CaII26side] [real] NOT NULL,
	[CaII26cont] [real] NOT NULL,
	[CaII26err] [real] NOT NULL,
	[CaII26mask] [tinyint] NOT NULL,
	[Paschen13side] [real] NOT NULL,
	[Paschen13cont] [real] NOT NULL,
	[Paschen13err] [real] NOT NULL,
	[Paschen13mask] [tinyint] NOT NULL,
	[CaII29side] [real] NOT NULL,
	[CaII29cont] [real] NOT NULL,
	[CaII29err] [real] NOT NULL,
	[CaII29mask] [tinyint] NOT NULL,
	[CaII401side] [real] NOT NULL,
	[CaII401cont] [real] NOT NULL,
	[CaII401err] [real] NOT NULL,
	[CaII401mask] [tinyint] NOT NULL,
	[CaII161side] [real] NOT NULL,
	[CaII161cont] [real] NOT NULL,
	[CaII161err] [real] NOT NULL,
	[CaII161mask] [tinyint] NOT NULL,
	[Paschen421side] [real] NOT NULL,
	[Paschen421cont] [real] NOT NULL,
	[Paschen421err] [real] NOT NULL,
	[Paschen421mask] [tinyint] NOT NULL,
	[CaII162side] [real] NOT NULL,
	[CaII162cont] [real] NOT NULL,
	[CaII162err] [real] NOT NULL,
	[CaII162mask] [tinyint] NOT NULL,
	[CaII402side] [real] NOT NULL,
	[CaII402cont] [real] NOT NULL,
	[CaII402err] [real] NOT NULL,
	[CaII402mask] [tinyint] NOT NULL,
	[Paschen422side] [real] NOT NULL,
	[Paschen422cont] [real] NOT NULL,
	[Paschen422err] [real] NOT NULL,
	[Paschen422mask] [tinyint] NOT NULL,
	[TiO5side] [real] NOT NULL,
	[TiO5cont] [real] NOT NULL,
	[TiO5err] [real] NOT NULL,
	[TiO5mask] [tinyint] NOT NULL,
	[TiO8side] [real] NOT NULL,
	[TiO8cont] [real] NOT NULL,
	[TiO8err] [real] NOT NULL,
	[TiO8mask] [tinyint] NOT NULL,
	[CaH1side] [real] NOT NULL,
	[CaH1cont] [real] NOT NULL,
	[CaH1err] [real] NOT NULL,
	[CaH1mask] [tinyint] NOT NULL,
	[CaH2side] [real] NOT NULL,
	[CaH2cont] [real] NOT NULL,
	[CaH2err] [real] NOT NULL,
	[CaH2mask] [tinyint] NOT NULL,
	[CaH3side] [real] NOT NULL,
	[CaH3cont] [real] NOT NULL,
	[CaH3err] [real] NOT NULL,
	[CaH3mask] [tinyint] NOT NULL,
	[UVCNside] [real] NOT NULL,
	[UVCNcont] [real] NOT NULL,
	[UVCNerr] [real] NOT NULL,
	[UVCNmask] [tinyint] NOT NULL,
	[BLCNside] [real] NOT NULL,
	[BLCNcont] [real] NOT NULL,
	[BLCNerr] [real] NOT NULL,
	[BLCNmask] [tinyint] NOT NULL,
	[FEI1side] [real] NOT NULL,
	[FEI1cont] [real] NOT NULL,
	[FEI1err] [real] NOT NULL,
	[FEI1mask] [tinyint] NOT NULL,
	[FEI2side] [real] NOT NULL,
	[FEI2cont] [real] NOT NULL,
	[FEI2err] [real] NOT NULL,
	[FEI2mask] [tinyint] NOT NULL,
	[FEI3side] [real] NOT NULL,
	[FEI3cont] [real] NOT NULL,
	[FEI3err] [real] NOT NULL,
	[FEI3mask] [tinyint] NOT NULL,
	[SRII2side] [real] NOT NULL,
	[SRII2cont] [real] NOT NULL,
	[SRII2err] [real] NOT NULL,
	[SRII2mask] [tinyint] NOT NULL,
	[FEI4side] [real] NOT NULL,
	[FEI4cont] [real] NOT NULL,
	[FEI4err] [real] NOT NULL,
	[FEI4mask] [tinyint] NOT NULL,
	[FEI5side] [real] NOT NULL,
	[FEI5cont] [real] NOT NULL,
	[FEI5err] [real] NOT NULL,
	[FEI5mask] [tinyint] NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[sppParams]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sppParams](
	[SPECOBJID] [numeric](20, 0) NOT NULL,
	[BESTOBJID] [bigint] NOT NULL,
	[FLUXOBJID] [bigint] NOT NULL,
	[TARGETOBJID] [bigint] NOT NULL,
	[PLATEID] [bigint] NOT NULL,
	[sciencePrimary] [smallint] NOT NULL,
	[legacyPrimary] [smallint] NOT NULL,
	[seguePrimary] [smallint] NOT NULL,
	[FIRSTRELEASE] [varchar](32) NOT NULL,
	[SURVEY] [varchar](32) NOT NULL,
	[PROGRAMNAME] [varchar](32) NOT NULL,
	[CHUNK] [varchar](32) NOT NULL,
	[PLATERUN] [varchar](32) NOT NULL,
	[MJD] [bigint] NOT NULL,
	[PLATE] [bigint] NOT NULL,
	[FIBERID] [bigint] NOT NULL,
	[RUN2D] [varchar](32) NOT NULL,
	[RUN1D] [varchar](32) NOT NULL,
	[RUNSSPP] [varchar](32) NOT NULL,
	[TARGETSTRING] [varchar](32) NOT NULL,
	[PRIMTARGET] [bigint] NOT NULL,
	[SECTARGET] [bigint] NOT NULL,
	[LEGACY_TARGET1] [bigint] NOT NULL,
	[LEGACY_TARGET2] [bigint] NOT NULL,
	[SPECIAL_TARGET1] [bigint] NOT NULL,
	[SPECIAL_TARGET2] [bigint] NOT NULL,
	[SEGUE1_TARGET1] [bigint] NOT NULL,
	[SEGUE1_TARGET2] [bigint] NOT NULL,
	[SEGUE2_TARGET1] [bigint] NOT NULL,
	[SEGUE2_TARGET2] [bigint] NOT NULL,
	[SPECTYPEHAMMER] [varchar](32) NOT NULL,
	[SPECTYPESUBCLASS] [varchar](32) NOT NULL,
	[FLAG] [varchar](32) NOT NULL,
	[TEFFADOP] [real] NOT NULL,
	[TEFFADOPN] [tinyint] NOT NULL,
	[TEFFADOPUNC] [real] NOT NULL,
	[TEFFHA24] [real] NOT NULL,
	[TEFFHD24] [real] NOT NULL,
	[TEFFNGS1] [real] NOT NULL,
	[TEFFANNSR] [real] NOT NULL,
	[TEFFANNRR] [real] NOT NULL,
	[TEFFWBG] [real] NOT NULL,
	[TEFFK24] [real] NOT NULL,
	[TEFFKI13] [real] NOT NULL,
	[TEFFHA24IND] [tinyint] NOT NULL,
	[TEFFHD24IND] [tinyint] NOT NULL,
	[TEFFNGS1IND] [tinyint] NOT NULL,
	[TEFFANNSRIND] [tinyint] NOT NULL,
	[TEFFANNRRIND] [tinyint] NOT NULL,
	[TEFFWBGIND] [tinyint] NOT NULL,
	[TEFFK24IND] [tinyint] NOT NULL,
	[TEFFKI13IND] [tinyint] NOT NULL,
	[TEFFHA24UNC] [real] NOT NULL,
	[TEFFHD24UNC] [real] NOT NULL,
	[TEFFNGS1UNC] [real] NOT NULL,
	[TEFFANNSRUNC] [real] NOT NULL,
	[TEFFANNRRUNC] [real] NOT NULL,
	[TEFFWBGUNC] [real] NOT NULL,
	[TEFFK24UNC] [real] NOT NULL,
	[TEFFKI13UNC] [real] NOT NULL,
	[LOGGADOP] [real] NOT NULL,
	[LOGGADOPN] [tinyint] NOT NULL,
	[LOGGADOPUNC] [real] NOT NULL,
	[LOGGNGS2] [real] NOT NULL,
	[LOGGNGS1] [real] NOT NULL,
	[LOGGANNSR] [real] NOT NULL,
	[LOGGANNRR] [real] NOT NULL,
	[LOGGCAI1] [real] NOT NULL,
	[LOGGWBG] [real] NOT NULL,
	[LOGGK24] [real] NOT NULL,
	[LOGGKI13] [real] NOT NULL,
	[LOGGNGS2IND] [tinyint] NOT NULL,
	[LOGGNGS1IND] [tinyint] NOT NULL,
	[LOGGANNSRIND] [tinyint] NOT NULL,
	[LOGGANNRRIND] [tinyint] NOT NULL,
	[LOGGCAI1IND] [tinyint] NOT NULL,
	[LOGGWBGIND] [tinyint] NOT NULL,
	[LOGGK24IND] [tinyint] NOT NULL,
	[LOGGKI13IND] [tinyint] NOT NULL,
	[LOGGNGS2UNC] [real] NOT NULL,
	[LOGGNGS1UNC] [real] NOT NULL,
	[LOGGANNSRUNC] [real] NOT NULL,
	[LOGGANNRRUNC] [real] NOT NULL,
	[LOGGCAI1UNC] [real] NOT NULL,
	[LOGGWBGUNC] [real] NOT NULL,
	[LOGGK24UNC] [real] NOT NULL,
	[LOGGKI13UNC] [real] NOT NULL,
	[FEHADOP] [real] NOT NULL,
	[FEHADOPN] [tinyint] NOT NULL,
	[FEHADOPUNC] [real] NOT NULL,
	[FEHNGS2] [real] NOT NULL,
	[FEHNGS1] [real] NOT NULL,
	[FEHANNSR] [real] NOT NULL,
	[FEHANNRR] [real] NOT NULL,
	[FEHCAIIK1] [real] NOT NULL,
	[FEHCAIIK2] [real] NOT NULL,
	[FEHCAIIK3] [real] NOT NULL,
	[FEHWBG] [real] NOT NULL,
	[FEHK24] [real] NOT NULL,
	[FEHKI13] [real] NOT NULL,
	[FEHNGS2IND] [tinyint] NOT NULL,
	[FEHNGS1IND] [tinyint] NOT NULL,
	[FEHANNSRIND] [tinyint] NOT NULL,
	[FEHANNRRIND] [tinyint] NOT NULL,
	[FEHCAIIK1IND] [tinyint] NOT NULL,
	[FEHCAIIK2IND] [tinyint] NOT NULL,
	[FEHCAIIK3IND] [tinyint] NOT NULL,
	[FEHWBGIND] [tinyint] NOT NULL,
	[FEHK24IND] [tinyint] NOT NULL,
	[FEHKI13IND] [tinyint] NOT NULL,
	[FEHNGS2UNC] [real] NOT NULL,
	[FEHNGS1UNC] [real] NOT NULL,
	[FEHANNSRUNC] [real] NOT NULL,
	[FEHANNRRUNC] [real] NOT NULL,
	[FEHCAIIK1UNC] [real] NOT NULL,
	[FEHCAIIK2UNC] [real] NOT NULL,
	[FEHCAIIK3UNC] [real] NOT NULL,
	[FEHWBGUNC] [real] NOT NULL,
	[FEHK24UNC] [real] NOT NULL,
	[FEHKI13UNC] [real] NOT NULL,
	[SNR] [real] NOT NULL,
	[QA] [tinyint] NOT NULL,
	[CCCAHK] [real] NOT NULL,
	[CCMGH] [real] NOT NULL,
	[TEFFSPEC] [real] NOT NULL,
	[TEFFSPECN] [tinyint] NOT NULL,
	[TEFFSPECUNC] [real] NOT NULL,
	[LOGGSPEC] [real] NOT NULL,
	[LOGGSPECN] [tinyint] NOT NULL,
	[LOGGSPECUNC] [real] NOT NULL,
	[FEHSPEC] [real] NOT NULL,
	[FEHSPECN] [tinyint] NOT NULL,
	[FEHSPECUNC] [real] NOT NULL,
	[ACF1] [real] NOT NULL,
	[ACF1SNR] [real] NOT NULL,
	[ACF2] [real] NOT NULL,
	[ACF2SNR] [real] NOT NULL,
	[INSPECT] [varchar](32) NOT NULL,
	[ELODIERVFINAL] [real] NOT NULL,
	[ELODIERVFINALERR] [real] NOT NULL,
	[ZWARNING] [bigint] NOT NULL,
	[TEFFIRFM] [real] NOT NULL,
	[TEFFIRFMIND] [tinyint] NOT NULL,
	[TEFFIRFMUNC] [real] NOT NULL,
	[LOGGNGS1IRFM] [real] NOT NULL,
	[LOGGNGS1IRFMIND] [tinyint] NOT NULL,
	[LOGGNGS1IRFMUNC] [real] NOT NULL,
	[FEHNGS1IRFM] [real] NOT NULL,
	[FEHNGS1IRFMIND] [tinyint] NOT NULL,
	[FEHNGS1IRFMUNC] [real] NOT NULL,
	[LOGGCAI1IRFM] [real] NOT NULL,
	[LOGGCAI1IRFMIND] [tinyint] NOT NULL,
	[LOGGCAI1IRFMUNC] [real] NOT NULL,
	[FEHCAIIK1IRFM] [real] NOT NULL,
	[FEHCAIIK1IRFMIND] [tinyint] NOT NULL,
	[FEHCAIIK1IRFMUNC] [real] NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[sppTargets]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sppTargets](
	[OBJID] [bigint] NOT NULL,
	[RUN] [bigint] NOT NULL,
	[RERUN] [bigint] NOT NULL,
	[CAMCOL] [bigint] NOT NULL,
	[FIELD] [bigint] NOT NULL,
	[OBJ] [bigint] NOT NULL,
	[RA] [float] NOT NULL,
	[DEC] [float] NOT NULL,
	[L] [float] NOT NULL,
	[B] [float] NOT NULL,
	[FIBERMAG_u] [real] NOT NULL,
	[FIBERMAG_g] [real] NOT NULL,
	[FIBERMAG_r] [real] NOT NULL,
	[FIBERMAG_i] [real] NOT NULL,
	[FIBERMAG_z] [real] NOT NULL,
	[PSFMAG_u] [real] NOT NULL,
	[PSFMAG_g] [real] NOT NULL,
	[PSFMAG_r] [real] NOT NULL,
	[PSFMAG_i] [real] NOT NULL,
	[PSFMAG_z] [real] NOT NULL,
	[EXTINCTION_u] [real] NOT NULL,
	[EXTINCTION_g] [real] NOT NULL,
	[EXTINCTION_r] [real] NOT NULL,
	[EXTINCTION_i] [real] NOT NULL,
	[EXTINCTION_z] [real] NOT NULL,
	[ROWC] [int] NOT NULL,
	[COLC] [int] NOT NULL,
	[TYPE] [int] NOT NULL,
	[FLAGS] [bigint] NOT NULL,
	[FLAGS_u] [bigint] NOT NULL,
	[FLAGS_g] [bigint] NOT NULL,
	[FLAGS_r] [bigint] NOT NULL,
	[FLAGS_i] [bigint] NOT NULL,
	[FLAGS_z] [bigint] NOT NULL,
	[PSFMAGERR_u] [real] NOT NULL,
	[PSFMAGERR_g] [real] NOT NULL,
	[PSFMAGERR_r] [real] NOT NULL,
	[PSFMAGERR_i] [real] NOT NULL,
	[PSFMAGERR_z] [real] NOT NULL,
	[PLATEID] [bigint] NOT NULL,
	[SPECOBJID] [bigint] NOT NULL,
	[PLATE] [bigint] NOT NULL,
	[MJD] [bigint] NOT NULL,
	[FIBERID] [bigint] NOT NULL,
	[ORIGINALPLATEID] [bigint] NOT NULL,
	[ORIGINALSPECOBJID] [bigint] NOT NULL,
	[ORIGINALPLATE] [bigint] NOT NULL,
	[ORIGINALMJD] [bigint] NOT NULL,
	[ORIGINALFIBERID] [bigint] NOT NULL,
	[BESTOBJID] [bigint] NOT NULL,
	[TARGETOBJID] [bigint] NOT NULL,
	[PRIMTARGET] [int] NOT NULL,
	[SECTARGET] [int] NOT NULL,
	[SEGUE1_TARGET1] [bigint] NOT NULL,
	[SEGUE1_TARGET2] [bigint] NOT NULL,
	[SEGUE2_TARGET1] [int] NOT NULL,
	[SEGUE2_TARGET2] [int] NOT NULL,
	[MATCH] [bigint] NOT NULL,
	[DELTA] [float] NOT NULL,
	[PML] [float] NOT NULL,
	[PMB] [float] NOT NULL,
	[PMRA] [float] NOT NULL,
	[PMDEC] [float] NOT NULL,
	[PMRAERR] [float] NOT NULL,
	[PMDECERR] [float] NOT NULL,
	[PMSIGRA] [float] NOT NULL,
	[PMSIGDEC] [float] NOT NULL,
	[NFIT] [int] NOT NULL,
	[DIST22] [float] NOT NULL,
	[DIST20] [float] NOT NULL,
	[uMAG0] [real] NOT NULL,
	[gMAG0] [real] NOT NULL,
	[rMAG0] [real] NOT NULL,
	[iMAG0] [real] NOT NULL,
	[zMAG0] [real] NOT NULL,
	[umg0] [real] NOT NULL,
	[gmr0] [real] NOT NULL,
	[rmi0] [real] NOT NULL,
	[imz0] [real] NOT NULL,
	[gmi0] [real] NOT NULL,
	[umgERR] [real] NOT NULL,
	[gmrERR] [real] NOT NULL,
	[rmiERR] [real] NOT NULL,
	[imzERR] [real] NOT NULL,
	[PSFMAG_umg] [real] NOT NULL,
	[PSFMAG_gmr] [real] NOT NULL,
	[PSFMAG_rmi] [real] NOT NULL,
	[PSFMAG_imz] [real] NOT NULL,
	[PSFMAG_gmi] [real] NOT NULL,
	[lcolor] [real] NOT NULL,
	[scolor] [real] NOT NULL,
	[p1s] [real] NOT NULL,
	[TOTALPM] [real] NOT NULL,
	[Hg] [real] NOT NULL,
	[Mi] [real] NOT NULL,
	[DISTi] [real] NOT NULL,
	[Hr] [real] NOT NULL,
	[VMI_TRANS1] [real] NOT NULL,
	[VMI_TRANS2] [real] NOT NULL,
	[VMAG_TRANS] [real] NOT NULL,
	[MV_TRANS] [real] NOT NULL,
	[DISTV_KPC] [real] NOT NULL,
	[VTRANS_GALREST] [real] NOT NULL,
	[MUTRANS_GALRADREST] [real] NOT NULL,
	[MURAD_GALRADREST] [real] NOT NULL,
	[VTOT_GALRADREST] [real] NOT NULL,
	[MG_TOHV] [real] NOT NULL,
	[VTRANS_TOHV] [real] NOT NULL,
	[PM1SIGMA_TOHV] [real] NOT NULL,
	[V1SIGMAERR_TOHV] [real] NOT NULL,
	[TARGET_VERSION] [varchar](100) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[stellarMassFSPSGranEarlyDust]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stellarMassFSPSGranEarlyDust](
	[specObjID] [numeric](20, 0) NOT NULL,
	[plate] [smallint] NULL,
	[fiberID] [smallint] NULL,
	[MJD] [int] NULL,
	[ra] [float] NULL,
	[dec] [float] NULL,
	[z] [real] NULL,
	[z_err] [real] NULL,
	[ke_u] [float] NULL,
	[ke_g] [float] NULL,
	[ke_r] [float] NULL,
	[ke_i] [float] NULL,
	[ke_z] [float] NULL,
	[cModelAbsMag_u] [float] NULL,
	[cModelAbsMag_g] [float] NULL,
	[cModelAbsMag_r] [float] NULL,
	[cModelAbsMag_i] [float] NULL,
	[cModelAbsMag_z] [float] NULL,
	[m2l_u] [float] NULL,
	[m2l_g] [float] NULL,
	[m2l_r] [float] NULL,
	[m2l_i] [float] NULL,
	[m2l_z] [float] NULL,
	[m2l_median_u] [float] NULL,
	[m2l_median_g] [float] NULL,
	[m2l_median_r] [float] NULL,
	[m2l_median_i] [float] NULL,
	[m2l_median_z] [float] NULL,
	[m2l_err_u] [float] NULL,
	[m2l_err_g] [float] NULL,
	[m2l_err_r] [float] NULL,
	[m2l_err_i] [float] NULL,
	[m2l_err_z] [float] NULL,
	[m2l_min_u] [float] NULL,
	[m2l_min_g] [float] NULL,
	[m2l_min_r] [float] NULL,
	[m2l_min_i] [float] NULL,
	[m2l_min_z] [float] NULL,
	[m2l_max_u] [float] NULL,
	[m2l_max_g] [float] NULL,
	[m2l_max_r] [float] NULL,
	[m2l_max_i] [float] NULL,
	[m2l_max_z] [float] NULL,
	[logMass] [float] NULL,
	[logMass_median] [float] NULL,
	[logMass_err] [float] NULL,
	[logMass_min] [float] NULL,
	[logMass_max] [float] NULL,
	[chi2] [float] NULL,
	[nFilter] [smallint] NULL,
	[t_age] [float] NULL,
	[t_age_mean] [float] NULL,
	[t_age_err] [float] NULL,
	[t_age_min] [float] NULL,
	[t_age_max] [float] NULL,
	[metallicity] [float] NULL,
	[metallicity_mean] [float] NULL,
	[metallicity_err] [float] NULL,
	[metallicity_min] [float] NULL,
	[metallicity_max] [float] NULL,
	[dust1] [float] NULL,
	[dust1_mean] [float] NULL,
	[dust1_err] [float] NULL,
	[dust1_min] [float] NULL,
	[dust1_max] [float] NULL,
	[dust2] [float] NULL,
	[dust2_mean] [float] NULL,
	[dust2_err] [float] NULL,
	[dust2_min] [float] NULL,
	[dust2_max] [float] NULL,
	[tau] [float] NULL,
	[tau_mean] [float] NULL,
	[tau_err] [float] NULL,
	[tau_min] [float] NULL,
	[tau_max] [float] NULL,
	[age] [float] NULL,
	[age_mean] [float] NULL,
	[age_min] [float] NULL,
	[age_max] [float] NULL,
	[ssfr] [float] NULL,
	[ssfr_mean] [float] NULL,
	[ssfr_min] [float] NULL,
	[ssfr_max] [float] NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[stellarMassFSPSGranEarlyNoDust]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stellarMassFSPSGranEarlyNoDust](
	[specObjID] [numeric](20, 0) NOT NULL,
	[plate] [smallint] NULL,
	[fiberID] [smallint] NULL,
	[MJD] [int] NULL,
	[ra] [float] NULL,
	[dec] [float] NULL,
	[z] [real] NULL,
	[z_err] [real] NULL,
	[ke_u] [float] NULL,
	[ke_g] [float] NULL,
	[ke_r] [float] NULL,
	[ke_i] [float] NULL,
	[ke_z] [float] NULL,
	[cModelAbsMag_u] [float] NULL,
	[cModelAbsMag_g] [float] NULL,
	[cModelAbsMag_r] [float] NULL,
	[cModelAbsMag_i] [float] NULL,
	[cModelAbsMag_z] [float] NULL,
	[m2l_u] [float] NULL,
	[m2l_g] [float] NULL,
	[m2l_r] [float] NULL,
	[m2l_i] [float] NULL,
	[m2l_z] [float] NULL,
	[m2l_median_u] [float] NULL,
	[m2l_median_g] [float] NULL,
	[m2l_median_r] [float] NULL,
	[m2l_median_i] [float] NULL,
	[m2l_median_z] [float] NULL,
	[m2l_err_u] [float] NULL,
	[m2l_err_g] [float] NULL,
	[m2l_err_r] [float] NULL,
	[m2l_err_i] [float] NULL,
	[m2l_err_z] [float] NULL,
	[m2l_min_u] [float] NULL,
	[m2l_min_g] [float] NULL,
	[m2l_min_r] [float] NULL,
	[m2l_min_i] [float] NULL,
	[m2l_min_z] [float] NULL,
	[m2l_max_u] [float] NULL,
	[m2l_max_g] [float] NULL,
	[m2l_max_r] [float] NULL,
	[m2l_max_i] [float] NULL,
	[m2l_max_z] [float] NULL,
	[logMass] [float] NULL,
	[logMass_median] [float] NULL,
	[logMass_err] [float] NULL,
	[logMass_min] [float] NULL,
	[logMass_max] [float] NULL,
	[chi2] [float] NULL,
	[nFilter] [smallint] NULL,
	[t_age] [float] NULL,
	[t_age_mean] [float] NULL,
	[t_age_err] [float] NULL,
	[t_age_min] [float] NULL,
	[t_age_max] [float] NULL,
	[metallicity] [float] NULL,
	[metallicity_mean] [float] NULL,
	[metallicity_err] [float] NULL,
	[metallicity_min] [float] NULL,
	[metallicity_max] [float] NULL,
	[dust1] [float] NULL,
	[dust1_mean] [float] NULL,
	[dust1_err] [float] NULL,
	[dust1_min] [float] NULL,
	[dust1_max] [float] NULL,
	[dust2] [float] NULL,
	[dust2_mean] [float] NULL,
	[dust2_err] [float] NULL,
	[dust2_min] [float] NULL,
	[dust2_max] [float] NULL,
	[tau] [float] NULL,
	[tau_mean] [float] NULL,
	[tau_err] [float] NULL,
	[tau_min] [float] NULL,
	[tau_max] [float] NULL,
	[age] [float] NULL,
	[age_mean] [float] NULL,
	[age_min] [float] NULL,
	[age_max] [float] NULL,
	[ssfr] [float] NULL,
	[ssfr_mean] [float] NULL,
	[ssfr_min] [float] NULL,
	[ssfr_max] [float] NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[stellarMassFSPSGranWideDust]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stellarMassFSPSGranWideDust](
	[specObjID] [numeric](20, 0) NOT NULL,
	[plate] [smallint] NULL,
	[fiberID] [smallint] NULL,
	[MJD] [int] NULL,
	[ra] [float] NULL,
	[dec] [float] NULL,
	[z] [real] NULL,
	[z_err] [real] NULL,
	[ke_u] [float] NULL,
	[ke_g] [float] NULL,
	[ke_r] [float] NULL,
	[ke_i] [float] NULL,
	[ke_z] [float] NULL,
	[cModelAbsMag_u] [float] NULL,
	[cModelAbsMag_g] [float] NULL,
	[cModelAbsMag_r] [float] NULL,
	[cModelAbsMag_i] [float] NULL,
	[cModelAbsMag_z] [float] NULL,
	[m2l_u] [float] NULL,
	[m2l_g] [float] NULL,
	[m2l_r] [float] NULL,
	[m2l_i] [float] NULL,
	[m2l_z] [float] NULL,
	[m2l_median_u] [float] NULL,
	[m2l_median_g] [float] NULL,
	[m2l_median_r] [float] NULL,
	[m2l_median_i] [float] NULL,
	[m2l_median_z] [float] NULL,
	[m2l_err_u] [float] NULL,
	[m2l_err_g] [float] NULL,
	[m2l_err_r] [float] NULL,
	[m2l_err_i] [float] NULL,
	[m2l_err_z] [float] NULL,
	[m2l_min_u] [float] NULL,
	[m2l_min_g] [float] NULL,
	[m2l_min_r] [float] NULL,
	[m2l_min_i] [float] NULL,
	[m2l_min_z] [float] NULL,
	[m2l_max_u] [float] NULL,
	[m2l_max_g] [float] NULL,
	[m2l_max_r] [float] NULL,
	[m2l_max_i] [float] NULL,
	[m2l_max_z] [float] NULL,
	[logMass] [float] NULL,
	[logMass_median] [float] NULL,
	[logMass_err] [float] NULL,
	[logMass_min] [float] NULL,
	[logMass_max] [float] NULL,
	[chi2] [float] NULL,
	[nFilter] [smallint] NULL,
	[t_age] [float] NULL,
	[t_age_mean] [float] NULL,
	[t_age_err] [float] NULL,
	[t_age_min] [float] NULL,
	[t_age_max] [float] NULL,
	[metallicity] [float] NULL,
	[metallicity_mean] [float] NULL,
	[metallicity_err] [float] NULL,
	[metallicity_min] [float] NULL,
	[metallicity_max] [float] NULL,
	[dust1] [float] NULL,
	[dust1_mean] [float] NULL,
	[dust1_err] [float] NULL,
	[dust1_min] [float] NULL,
	[dust1_max] [float] NULL,
	[dust2] [float] NULL,
	[dust2_mean] [float] NULL,
	[dust2_err] [float] NULL,
	[dust2_min] [float] NULL,
	[dust2_max] [float] NULL,
	[tau] [float] NULL,
	[tau_mean] [float] NULL,
	[tau_err] [float] NULL,
	[tau_min] [float] NULL,
	[tau_max] [float] NULL,
	[age] [float] NULL,
	[age_mean] [float] NULL,
	[age_min] [float] NULL,
	[age_max] [float] NULL,
	[ssfr] [float] NULL,
	[ssfr_mean] [float] NULL,
	[ssfr_min] [float] NULL,
	[ssfr_max] [float] NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[stellarMassFSPSGranWideNoDust]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stellarMassFSPSGranWideNoDust](
	[specObjID] [numeric](20, 0) NOT NULL,
	[plate] [smallint] NULL,
	[fiberID] [smallint] NULL,
	[MJD] [int] NULL,
	[ra] [float] NULL,
	[dec] [float] NULL,
	[z] [real] NULL,
	[z_err] [real] NULL,
	[ke_u] [float] NULL,
	[ke_g] [float] NULL,
	[ke_r] [float] NULL,
	[ke_i] [float] NULL,
	[ke_z] [float] NULL,
	[cModelAbsMag_u] [float] NULL,
	[cModelAbsMag_g] [float] NULL,
	[cModelAbsMag_r] [float] NULL,
	[cModelAbsMag_i] [float] NULL,
	[cModelAbsMag_z] [float] NULL,
	[m2l_u] [float] NULL,
	[m2l_g] [float] NULL,
	[m2l_r] [float] NULL,
	[m2l_i] [float] NULL,
	[m2l_z] [float] NULL,
	[m2l_median_u] [float] NULL,
	[m2l_median_g] [float] NULL,
	[m2l_median_r] [float] NULL,
	[m2l_median_i] [float] NULL,
	[m2l_median_z] [float] NULL,
	[m2l_err_u] [float] NULL,
	[m2l_err_g] [float] NULL,
	[m2l_err_r] [float] NULL,
	[m2l_err_i] [float] NULL,
	[m2l_err_z] [float] NULL,
	[m2l_min_u] [float] NULL,
	[m2l_min_g] [float] NULL,
	[m2l_min_r] [float] NULL,
	[m2l_min_i] [float] NULL,
	[m2l_min_z] [float] NULL,
	[m2l_max_u] [float] NULL,
	[m2l_max_g] [float] NULL,
	[m2l_max_r] [float] NULL,
	[m2l_max_i] [float] NULL,
	[m2l_max_z] [float] NULL,
	[logMass] [float] NULL,
	[logMass_median] [float] NULL,
	[logMass_err] [float] NULL,
	[logMass_min] [float] NULL,
	[logMass_max] [float] NULL,
	[chi2] [float] NULL,
	[nFilter] [smallint] NULL,
	[t_age] [float] NULL,
	[t_age_mean] [float] NULL,
	[t_age_err] [float] NULL,
	[t_age_min] [float] NULL,
	[t_age_max] [float] NULL,
	[metallicity] [float] NULL,
	[metallicity_mean] [float] NULL,
	[metallicity_err] [float] NULL,
	[metallicity_min] [float] NULL,
	[metallicity_max] [float] NULL,
	[dust1] [float] NULL,
	[dust1_mean] [float] NULL,
	[dust1_err] [float] NULL,
	[dust1_min] [float] NULL,
	[dust1_max] [float] NULL,
	[dust2] [float] NULL,
	[dust2_mean] [float] NULL,
	[dust2_err] [float] NULL,
	[dust2_min] [float] NULL,
	[dust2_max] [float] NULL,
	[tau] [float] NULL,
	[tau_mean] [float] NULL,
	[tau_err] [float] NULL,
	[tau_min] [float] NULL,
	[tau_max] [float] NULL,
	[age] [float] NULL,
	[age_mean] [float] NULL,
	[age_min] [float] NULL,
	[age_max] [float] NULL,
	[ssfr] [float] NULL,
	[ssfr_mean] [float] NULL,
	[ssfr_min] [float] NULL,
	[ssfr_max] [float] NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[stellarMassPassivePort]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stellarMassPassivePort](
	[specObjID] [numeric](20, 0) NOT NULL,
	[plate] [smallint] NOT NULL,
	[fiberID] [smallint] NOT NULL,
	[mjd] [int] NOT NULL,
	[ra] [float] NOT NULL,
	[dec] [float] NOT NULL,
	[z] [real] NOT NULL,
	[zErr] [real] NOT NULL,
	[logMass] [real] NOT NULL,
	[minLogMass] [real] NOT NULL,
	[maxLogMass] [real] NOT NULL,
	[medianPDF] [real] NOT NULL,
	[PDF16] [real] NOT NULL,
	[PDF84] [real] NOT NULL,
	[peakPDF] [real] NOT NULL,
	[logMass_noMassLoss] [real] NOT NULL,
	[minLogMass_noMassLoss] [real] NOT NULL,
	[maxLogMass_noMassLoss] [real] NOT NULL,
	[medianPDF_noMassLoss] [real] NOT NULL,
	[PDF16_noMassLoss] [real] NOT NULL,
	[PDF84_noMassLoss] [real] NOT NULL,
	[peakPDF_noMassLoss] [real] NOT NULL,
	[reducedChi2] [real] NOT NULL,
	[age] [real] NOT NULL,
	[minAge] [real] NOT NULL,
	[maxAge] [real] NOT NULL,
	[SFR] [real] NOT NULL,
	[minSFR] [real] NOT NULL,
	[maxSFR] [real] NOT NULL,
	[absMagK] [real] NOT NULL,
	[SFH] [varchar](32) NOT NULL,
	[Metallicity] [varchar](32) NOT NULL,
	[reddeninglaw] [smallint] NOT NULL,
	[nFilter] [smallint] NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[stellarMassPCAWiscBC03]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stellarMassPCAWiscBC03](
	[specObjID] [numeric](20, 0) NOT NULL,
	[plate] [smallint] NOT NULL,
	[fiberID] [smallint] NOT NULL,
	[mjd] [int] NOT NULL,
	[ra] [float] NOT NULL,
	[dec] [float] NOT NULL,
	[z] [real] NOT NULL,
	[zErr] [real] NOT NULL,
	[zNum] [int] NOT NULL,
	[mstellar_median] [float] NOT NULL,
	[mstellar_err] [float] NOT NULL,
	[mstellar_p2p5] [float] NOT NULL,
	[mstellar_p16] [float] NOT NULL,
	[mstellar_p84] [float] NOT NULL,
	[mstellar_p97p5] [float] NOT NULL,
	[vdisp_median] [float] NOT NULL,
	[vdisp_err] [float] NOT NULL,
	[vdisp_p2p5] [float] NOT NULL,
	[vdisp_p16] [float] NOT NULL,
	[vdisp_p84] [float] NOT NULL,
	[vdisp_p97p5] [float] NOT NULL,
	[calpha_0] [real] NOT NULL,
	[calpha_1] [real] NOT NULL,
	[calpha_2] [real] NOT NULL,
	[calpha_3] [real] NOT NULL,
	[calpha_4] [real] NOT NULL,
	[calpha_5] [real] NOT NULL,
	[calpha_6] [real] NOT NULL,
	[calpha_norm] [real] NOT NULL,
	[warning] [int] NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[stellarMassPCAWiscM11]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stellarMassPCAWiscM11](
	[specObjID] [numeric](20, 0) NOT NULL,
	[plate] [smallint] NOT NULL,
	[fiberID] [smallint] NOT NULL,
	[mjd] [int] NOT NULL,
	[ra] [float] NOT NULL,
	[dec] [float] NOT NULL,
	[z] [real] NOT NULL,
	[zErr] [real] NOT NULL,
	[zNum] [int] NOT NULL,
	[mstellar_median] [float] NOT NULL,
	[mstellar_err] [float] NOT NULL,
	[mstellar_p2p5] [float] NOT NULL,
	[mstellar_p16] [float] NOT NULL,
	[mstellar_p84] [float] NOT NULL,
	[mstellar_p97p5] [float] NOT NULL,
	[vdisp_median] [float] NOT NULL,
	[vdisp_err] [float] NOT NULL,
	[vdisp_p2p5] [float] NOT NULL,
	[vdisp_p16] [float] NOT NULL,
	[vdisp_p84] [float] NOT NULL,
	[vdisp_p97p5] [float] NOT NULL,
	[calpha_0] [real] NOT NULL,
	[calpha_1] [real] NOT NULL,
	[calpha_2] [real] NOT NULL,
	[calpha_3] [real] NOT NULL,
	[calpha_4] [real] NOT NULL,
	[calpha_5] [real] NOT NULL,
	[calpha_6] [real] NOT NULL,
	[calpha_norm] [real] NOT NULL,
	[warning] [int] NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[stellarMassStarformingPort]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stellarMassStarformingPort](
	[specObjID] [numeric](20, 0) NOT NULL,
	[plate] [smallint] NOT NULL,
	[fiberID] [smallint] NOT NULL,
	[mjd] [int] NOT NULL,
	[ra] [float] NOT NULL,
	[dec] [float] NOT NULL,
	[z] [real] NOT NULL,
	[zErr] [real] NOT NULL,
	[logMass] [real] NOT NULL,
	[minLogMass] [real] NOT NULL,
	[maxLogMass] [real] NOT NULL,
	[medianPDF] [real] NOT NULL,
	[PDF16] [real] NOT NULL,
	[PDF84] [real] NOT NULL,
	[peakPDF] [real] NOT NULL,
	[logMass_noMassLoss] [real] NOT NULL,
	[minLogMass_noMassLoss] [real] NOT NULL,
	[maxLogMass_noMassLoss] [real] NOT NULL,
	[medianPDF_noMassLoss] [real] NOT NULL,
	[PDF16_noMassLoss] [real] NOT NULL,
	[PDF84_noMassLoss] [real] NOT NULL,
	[peakPDF_noMassLoss] [real] NOT NULL,
	[reducedChi2] [real] NOT NULL,
	[age] [real] NOT NULL,
	[minAge] [real] NOT NULL,
	[maxAge] [real] NOT NULL,
	[SFR] [real] NOT NULL,
	[minSFR] [real] NOT NULL,
	[maxSFR] [real] NOT NULL,
	[absMagK] [real] NOT NULL,
	[SFH] [varchar](32) NOT NULL,
	[Metallicity] [varchar](32) NOT NULL,
	[reddeninglaw] [smallint] NOT NULL,
	[nFilter] [smallint] NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[StripeDefs]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StripeDefs](
	[stripe] [int] NOT NULL,
	[hemisphere] [varchar](64) NOT NULL,
	[eta] [float] NOT NULL,
	[lambdaMin] [float] NOT NULL,
	[lambdaMax] [float] NOT NULL,
	[htmArea] [varchar](1024) NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[Target]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Target](
	[targetID] [bigint] NOT NULL,
	[run] [smallint] NOT NULL,
	[rerun] [smallint] NOT NULL,
	[camcol] [tinyint] NOT NULL,
	[field] [int] NOT NULL,
	[obj] [int] NOT NULL,
	[regionID] [int] NOT NULL,
	[ra] [float] NOT NULL,
	[dec] [float] NOT NULL,
	[duplicate] [tinyint] NOT NULL,
	[htmID] [bigint] NOT NULL,
	[cx] [float] NOT NULL,
	[cy] [float] NOT NULL,
	[cz] [float] NOT NULL,
	[bestObjID] [bigint] NOT NULL,
	[specObjID] [bigint] NOT NULL,
	[bestMode] [tinyint] NOT NULL,
	[loadVersion] [int] NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[TargetInfo]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TargetInfo](
	[targetObjID] [bigint] NOT NULL,
	[targetID] [bigint] NOT NULL,
	[skyVersion] [int] NOT NULL,
	[primTarget] [int] NOT NULL,
	[secTarget] [int] NOT NULL,
	[priority] [int] NOT NULL,
	[programType] [int] NOT NULL,
	[programName] [varchar](32) NOT NULL,
	[targetMode] [tinyint] NOT NULL,
	[loadVersion] [int] NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[thingIndex]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[thingIndex](
	[thingId] [bigint] NOT NULL,
	[sdssPolygonID] [int] NOT NULL,
	[fieldID] [bigint] NOT NULL,
	[objID] [bigint] NOT NULL,
	[isPrimary] [tinyint] NOT NULL,
	[nDetect] [int] NOT NULL,
	[nEdge] [int] NOT NULL,
	[ra] [float] NOT NULL,
	[dec] [float] NOT NULL,
	[loadVersion] [int] NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[TwoMass]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TwoMass](
	[objID] [bigint] NOT NULL,
	[ra] [float] NOT NULL,
	[dec] [float] NOT NULL,
	[errMaj] [real] NOT NULL,
	[errMin] [real] NOT NULL,
	[errAng] [real] NOT NULL,
	[j] [real] NOT NULL,
	[jIvar] [real] NOT NULL,
	[h] [real] NOT NULL,
	[hIvar] [real] NOT NULL,
	[k] [real] NOT NULL,
	[kIvar] [real] NOT NULL,
	[phQual] [varchar](32) NOT NULL,
	[rdFlag] [varchar](32) NOT NULL,
	[blFlag] [varchar](32) NOT NULL,
	[ccFlag] [varchar](32) NOT NULL,
	[nDetectJ] [tinyint] NOT NULL,
	[nDetectH] [tinyint] NOT NULL,
	[nDetectK] [tinyint] NOT NULL,
	[nObserveJ] [tinyint] NOT NULL,
	[nObserveH] [tinyint] NOT NULL,
	[nObserveK] [tinyint] NOT NULL,
	[galContam] [tinyint] NOT NULL,
	[mpFlag] [tinyint] NOT NULL,
	[ptsKey] [int] NOT NULL,
	[hemis] [varchar](32) NOT NULL,
	[jDate] [float] NOT NULL,
	[dupSource] [tinyint] NOT NULL,
	[useSource] [tinyint] NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[TwoMassXSC]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TwoMassXSC](
	[objID] [bigint] NOT NULL,
	[tmassxsc_ra] [float] NOT NULL,
	[tmassxsc_dec] [float] NOT NULL,
	[jDate] [float] NOT NULL,
	[designation] [varchar](100) NOT NULL,
	[sup_ra] [float] NOT NULL,
	[sup_dec] [float] NOT NULL,
	[density] [real] NOT NULL,
	[R_K20FE] [real] NOT NULL,
	[J_M_K20FE] [real] NOT NULL,
	[J_MSIG_K20FE] [real] NOT NULL,
	[J_FLG_K20FE] [smallint] NOT NULL,
	[H_M_K20FE] [real] NOT NULL,
	[H_MSIG_K20FE] [real] NOT NULL,
	[H_FLG_K20FE] [smallint] NOT NULL,
	[K_M_K20FE] [real] NOT NULL,
	[K_MSIG_K20FE] [real] NOT NULL,
	[K_FLG_K20FE] [smallint] NOT NULL,
	[R_3SIG] [real] NOT NULL,
	[J_BA] [real] NOT NULL,
	[J_PHI] [smallint] NOT NULL,
	[H_BA] [real] NOT NULL,
	[H_PHI] [smallint] NOT NULL,
	[K_BA] [real] NOT NULL,
	[K_PHI] [smallint] NOT NULL,
	[SUP_R_3SIG] [real] NOT NULL,
	[SUP_BA] [real] NOT NULL,
	[SUP_PHI] [smallint] NOT NULL,
	[R_FE] [real] NOT NULL,
	[J_M_FE] [real] NOT NULL,
	[J_MSIG_FE] [real] NOT NULL,
	[J_FLG_FE] [smallint] NOT NULL,
	[H_M_FE] [real] NOT NULL,
	[H_MSIG_FE] [real] NOT NULL,
	[H_FLG_FE] [smallint] NOT NULL,
	[K_M_FE] [real] NOT NULL,
	[K_MSIG_FE] [real] NOT NULL,
	[K_FLG_FE] [smallint] NOT NULL,
	[R_EXT] [real] NOT NULL,
	[J_M_EXT] [real] NOT NULL,
	[J_MSIG_EXT] [real] NOT NULL,
	[J_PCHI] [real] NOT NULL,
	[H_M_EXT] [real] NOT NULL,
	[H_MSIG_EXT] [real] NOT NULL,
	[H_PCHI] [real] NOT NULL,
	[K_M_EXT] [real] NOT NULL,
	[K_MSIG_EXT] [real] NOT NULL,
	[K_PCHI] [real] NOT NULL,
	[J_R_EFF] [real] NOT NULL,
	[J_MNSURFB_EFF] [real] NOT NULL,
	[H_R_EFF] [real] NOT NULL,
	[H_MNSURFB_EFF] [real] NOT NULL,
	[K_R_EFF] [real] NOT NULL,
	[K_MNSURFB_EFF] [real] NOT NULL,
	[J_CON_INDX] [real] NOT NULL,
	[H_CON_INDX] [real] NOT NULL,
	[K_CON_INDX] [real] NOT NULL,
	[J_PEAK] [real] NOT NULL,
	[H_PEAK] [real] NOT NULL,
	[K_PEAK] [real] NOT NULL,
	[J_5SURF] [real] NOT NULL,
	[H_5SURF] [real] NOT NULL,
	[K_5SURF] [real] NOT NULL,
	[E_SCORE] [real] NOT NULL,
	[G_SCORE] [real] NOT NULL,
	[VC] [smallint] NOT NULL,
	[CC_FLG] [varchar](100) NOT NULL,
	[IM_NX] [smallint] NOT NULL,
	[R_K20FC] [real] NOT NULL,
	[J_M_K20FC] [real] NOT NULL,
	[J_MSIG_K20FC] [real] NOT NULL,
	[J_FLG_K20FC] [smallint] NOT NULL,
	[H_M_K20FC] [real] NOT NULL,
	[H_MSIG_K20FC] [real] NOT NULL,
	[H_FLG_K20FC] [smallint] NOT NULL,
	[K_M_K20FC] [real] NOT NULL,
	[K_MSIG_K20FC] [real] NOT NULL,
	[K_FLG_K20FC] [smallint] NOT NULL,
	[J_R_E] [real] NOT NULL,
	[J_M_E] [real] NOT NULL,
	[J_MSIG_E] [real] NOT NULL,
	[J_FLG_E] [smallint] NOT NULL,
	[H_R_E] [real] NOT NULL,
	[H_M_E] [real] NOT NULL,
	[H_MSIG_E] [real] NOT NULL,
	[H_FLG_E] [smallint] NOT NULL,
	[K_R_E] [real] NOT NULL,
	[K_M_E] [real] NOT NULL,
	[K_MSIG_E] [real] NOT NULL,
	[K_FLG_E] [smallint] NOT NULL,
	[J_R_C] [real] NOT NULL,
	[J_M_C] [real] NOT NULL,
	[J_MSIG_C] [real] NOT NULL,
	[J_FLG_C] [smallint] NOT NULL,
	[H_R_C] [real] NOT NULL,
	[H_M_C] [real] NOT NULL,
	[H_MSIG_C] [real] NOT NULL,
	[H_FLG_C] [smallint] NOT NULL,
	[K_R_C] [real] NOT NULL,
	[K_M_C] [real] NOT NULL,
	[K_MSIG_C] [real] NOT NULL,
	[K_FLG_C] [smallint] NOT NULL,
	[R_FC] [real] NOT NULL,
	[J_M_FC] [real] NOT NULL,
	[J_MSIG_FC] [real] NOT NULL,
	[J_FLG_FC] [smallint] NOT NULL,
	[H_M_FC] [real] NOT NULL,
	[H_MSIG_FC] [real] NOT NULL,
	[H_FLG_FC] [smallint] NOT NULL,
	[K_M_FC] [real] NOT NULL,
	[K_MSIG_FC] [real] NOT NULL,
	[K_FLG_FC] [smallint] NOT NULL,
	[J_R_I20E] [real] NOT NULL,
	[J_M_I20E] [real] NOT NULL,
	[J_MSIG_I20E] [real] NOT NULL,
	[J_FLG_I20E] [smallint] NOT NULL,
	[H_R_I20E] [real] NOT NULL,
	[H_M_I20E] [real] NOT NULL,
	[H_MSIG_I20E] [real] NOT NULL,
	[H_FLG_I20E] [smallint] NOT NULL,
	[K_R_I20E] [real] NOT NULL,
	[K_M_I20E] [real] NOT NULL,
	[K_MSIG_I20E] [real] NOT NULL,
	[K_FLG_I20E] [smallint] NOT NULL,
	[J_R_I20C] [real] NOT NULL,
	[J_M_I20C] [real] NOT NULL,
	[J_MSIG_I20C] [real] NOT NULL,
	[J_FLG_I20C] [smallint] NOT NULL,
	[H_R_I20C] [real] NOT NULL,
	[H_M_I20C] [real] NOT NULL,
	[H_MSIG_I20C] [real] NOT NULL,
	[H_FLG_I20C] [smallint] NOT NULL,
	[K_R_I20C] [real] NOT NULL,
	[K_M_I20C] [real] NOT NULL,
	[K_MSIG_I20C] [real] NOT NULL,
	[K_FLG_I20C] [smallint] NOT NULL,
	[J_R_I21E] [real] NOT NULL,
	[J_M_I21E] [real] NOT NULL,
	[J_MSIG_I21E] [real] NOT NULL,
	[J_FLG_I21E] [smallint] NOT NULL,
	[H_R_I21E] [real] NOT NULL,
	[H_M_I21E] [real] NOT NULL,
	[H_MSIG_I21E] [real] NOT NULL,
	[H_FLG_I21E] [smallint] NOT NULL,
	[K_R_I21E] [real] NOT NULL,
	[K_M_I21E] [real] NOT NULL,
	[K_MSIG_I21E] [real] NOT NULL,
	[K_FLG_I21E] [smallint] NOT NULL,
	[R_J21FE] [real] NOT NULL,
	[J_M_J21FE] [real] NOT NULL,
	[J_MSIG_J21FE] [real] NOT NULL,
	[J_FLG_J21FE] [smallint] NOT NULL,
	[H_M_J21FE] [real] NOT NULL,
	[H_MSIG_J21FE] [real] NOT NULL,
	[H_FLG_J21FE] [smallint] NOT NULL,
	[K_M_J21FE] [real] NOT NULL,
	[K_MSIG_J21FE] [real] NOT NULL,
	[K_FLG_J21FE] [smallint] NOT NULL,
	[J_R_I21C] [real] NOT NULL,
	[J_M_I21C] [real] NOT NULL,
	[J_MSIG_I21C] [real] NOT NULL,
	[J_FLG_I21C] [smallint] NOT NULL,
	[H_R_I21C] [real] NOT NULL,
	[H_M_I21C] [real] NOT NULL,
	[H_MSIG_I21C] [real] NOT NULL,
	[H_FLG_I21C] [smallint] NOT NULL,
	[K_R_I21C] [real] NOT NULL,
	[K_M_I21C] [real] NOT NULL,
	[K_MSIG_I21C] [real] NOT NULL,
	[K_FLG_I21C] [smallint] NOT NULL,
	[R_J21FC] [real] NOT NULL,
	[J_M_J21FC] [real] NOT NULL,
	[J_MSIG_J21FC] [real] NOT NULL,
	[J_FLG_J21FC] [smallint] NOT NULL,
	[H_M_J21FC] [real] NOT NULL,
	[H_MSIG_J21FC] [real] NOT NULL,
	[H_FLG_J21FC] [smallint] NOT NULL,
	[K_M_J21FC] [real] NOT NULL,
	[K_MSIG_J21FC] [real] NOT NULL,
	[K_FLG_J21FC] [smallint] NOT NULL,
	[J_M_SYS] [real] NOT NULL,
	[J_MSIG_SYS] [real] NOT NULL,
	[H_M_SYS] [real] NOT NULL,
	[H_MSIG_SYS] [real] NOT NULL,
	[K_M_SYS] [real] NOT NULL,
	[K_MSIG_SYS] [real] NOT NULL,
	[SYS_FLG] [smallint] NOT NULL,
	[CONTAM_FLG] [smallint] NOT NULL,
	[J_5SIG_BA] [real] NOT NULL,
	[J_5SIG_PHI] [smallint] NOT NULL,
	[H_5SIG_BA] [real] NOT NULL,
	[H_5SIG_PHI] [smallint] NOT NULL,
	[K_5SIG_BA] [real] NOT NULL,
	[K_5SIG_PHI] [smallint] NOT NULL,
	[J_D_AREA] [smallint] NOT NULL,
	[J_PERC_DAREA] [smallint] NOT NULL,
	[H_D_AREA] [smallint] NOT NULL,
	[H_PERC_DAREA] [smallint] NOT NULL,
	[K_D_AREA] [smallint] NOT NULL,
	[K_PERC_DAREA] [smallint] NOT NULL,
	[J_BISYM_RAT] [real] NOT NULL,
	[J_BISYM_CHI] [real] NOT NULL,
	[H_BISYM_RAT] [real] NOT NULL,
	[H_BISYM_CHI] [real] NOT NULL,
	[K_BISYM_RAT] [real] NOT NULL,
	[K_BISYM_CHI] [real] NOT NULL,
	[J_SH0] [real] NOT NULL,
	[J_SIG_SH0] [real] NOT NULL,
	[H_SH0] [real] NOT NULL,
	[H_SIG_SH0] [real] NOT NULL,
	[K_SH0] [real] NOT NULL,
	[K_SIG_SH0] [real] NOT NULL,
	[J_SC_MXDN] [real] NOT NULL,
	[J_SC_SH] [real] NOT NULL,
	[J_SC_WSH] [real] NOT NULL,
	[J_SC_R23] [real] NOT NULL,
	[J_SC_1MM] [real] NOT NULL,
	[J_SC_2MM] [real] NOT NULL,
	[J_SC_VINT] [real] NOT NULL,
	[J_SC_R1] [real] NOT NULL,
	[J_SC_MSH] [real] NOT NULL,
	[H_SC_MXDN] [real] NOT NULL,
	[H_SC_SH] [real] NOT NULL,
	[H_SC_WSH] [real] NOT NULL,
	[H_SC_R23] [real] NOT NULL,
	[H_SC_1MM] [real] NOT NULL,
	[H_SC_2MM] [real] NOT NULL,
	[H_SC_VINT] [real] NOT NULL,
	[H_SC_R1] [real] NOT NULL,
	[H_SC_MSH] [real] NOT NULL,
	[K_SC_MXDN] [real] NOT NULL,
	[K_SC_SH] [real] NOT NULL,
	[K_SC_WSH] [real] NOT NULL,
	[K_SC_R23] [real] NOT NULL,
	[K_SC_1MM] [real] NOT NULL,
	[K_SC_2MM] [real] NOT NULL,
	[K_SC_VINT] [real] NOT NULL,
	[K_SC_R1] [real] NOT NULL,
	[K_SC_MSH] [real] NOT NULL,
	[J_CHIF_ELLF] [real] NOT NULL,
	[K_CHIF_ELLF] [real] NOT NULL,
	[ELLFIT_FLG] [smallint] NOT NULL,
	[SUP_CHIF_ELLF] [real] NOT NULL,
	[N_BLANK] [smallint] NOT NULL,
	[N_SUB] [smallint] NOT NULL,
	[BL_SUB_FLG] [smallint] NOT NULL,
	[ID_FLG] [smallint] NOT NULL,
	[ID_CAT] [varchar](100) NOT NULL,
	[FG_FLG] [varchar](100) NOT NULL,
	[BLK_FAC] [smallint] NOT NULL,
	[DUP_SRC] [smallint] NOT NULL,
	[USE_SRC] [smallint] NOT NULL,
	[PROX] [real] NOT NULL,
	[PXPA] [smallint] NOT NULL,
	[PXCNTR] [int] NOT NULL,
	[DIST_EDGE_NS] [int] NOT NULL,
	[DIST_EDGE_EW] [smallint] NOT NULL,
	[DIST_EDGE_FLG] [varchar](100) NOT NULL,
	[PTS_KEY] [int] NOT NULL,
	[MP_KEY] [int] NOT NULL,
	[NIGHT_KEY] [smallint] NOT NULL,
	[SCAN_KEY] [int] NOT NULL,
	[COADD_KEY] [int] NOT NULL,
	[HEMIS] [varchar](100) NOT NULL,
	[DATE] [varchar](100) NOT NULL,
	[SCAN] [smallint] NOT NULL,
	[COADD] [smallint] NOT NULL,
	[X_COADD] [real] NOT NULL,
	[Y_COADD] [real] NOT NULL,
	[J_SUBST2] [real] NOT NULL,
	[H_SUBST2] [real] NOT NULL,
	[K_SUBST2] [real] NOT NULL,
	[J_BACK] [real] NOT NULL,
	[H_BACK] [real] NOT NULL,
	[K_BACK] [real] NOT NULL,
	[J_RESID_ANN] [real] NOT NULL,
	[H_RESID_ANN] [real] NOT NULL,
	[K_RESID_ANN] [real] NOT NULL,
	[J_BNDG_PER] [int] NOT NULL,
	[J_BNDG_AMP] [real] NOT NULL,
	[H_BNDG_PER] [int] NOT NULL,
	[H_BNDG_AMP] [real] NOT NULL,
	[K_BNDG_PER] [int] NOT NULL,
	[K_BNDG_AMP] [real] NOT NULL,
	[J_SEETRACK] [real] NOT NULL,
	[H_SEETRACK] [real] NOT NULL,
	[K_SEETRACK] [real] NOT NULL,
	[EXT_KEY] [int] NOT NULL,
	[TMASSXSC_ID] [int] NOT NULL,
	[J_M_5] [real] NOT NULL,
	[J_MSIG_5] [real] NOT NULL,
	[J_FLG_5] [smallint] NOT NULL,
	[J_M_7] [real] NOT NULL,
	[J_MSIG_7] [real] NOT NULL,
	[J_FLG_7] [smallint] NOT NULL,
	[J_M_10] [real] NOT NULL,
	[J_MSIG_10] [real] NOT NULL,
	[J_FLG_10] [smallint] NOT NULL,
	[J_M_15] [real] NOT NULL,
	[J_MSIG_15] [real] NOT NULL,
	[J_FLG_15] [smallint] NOT NULL,
	[J_M_20] [real] NOT NULL,
	[J_MSIG_20] [real] NOT NULL,
	[J_FLG_20] [smallint] NOT NULL,
	[J_M_25] [real] NOT NULL,
	[J_MSIG_25] [real] NOT NULL,
	[J_FLG_25] [smallint] NOT NULL,
	[J_M_30] [real] NOT NULL,
	[J_MSIG_30] [real] NOT NULL,
	[J_FLG_30] [smallint] NOT NULL,
	[J_M_40] [real] NOT NULL,
	[J_MSIG_40] [real] NOT NULL,
	[J_FLG_40] [smallint] NOT NULL,
	[J_M_50] [real] NOT NULL,
	[J_MSIG_50] [real] NOT NULL,
	[J_FLG_50] [smallint] NOT NULL,
	[J_M_60] [real] NOT NULL,
	[J_MSIG_60] [real] NOT NULL,
	[J_FLG_60] [smallint] NOT NULL,
	[J_M_70] [real] NOT NULL,
	[J_MSIG_70] [real] NOT NULL,
	[J_FLG_70] [smallint] NOT NULL,
	[H_M_5] [real] NOT NULL,
	[H_MSIG_5] [real] NOT NULL,
	[H_FLG_5] [smallint] NOT NULL,
	[H_M_7] [real] NOT NULL,
	[H_MSIG_7] [real] NOT NULL,
	[H_FLG_7] [smallint] NOT NULL,
	[H_M_10] [real] NOT NULL,
	[H_MSIG_10] [real] NOT NULL,
	[H_FLG_10] [smallint] NOT NULL,
	[H_M_15] [real] NOT NULL,
	[H_MSIG_15] [real] NOT NULL,
	[H_FLG_15] [smallint] NOT NULL,
	[H_M_20] [real] NOT NULL,
	[H_MSIG_20] [real] NOT NULL,
	[H_FLG_20] [smallint] NOT NULL,
	[H_M_25] [real] NOT NULL,
	[H_MSIG_25] [real] NOT NULL,
	[H_FLG_25] [smallint] NOT NULL,
	[H_M_30] [real] NOT NULL,
	[H_MSIG_30] [real] NOT NULL,
	[H_FLG_30] [smallint] NOT NULL,
	[H_M_40] [real] NOT NULL,
	[H_MSIG_40] [real] NOT NULL,
	[H_FLG_40] [smallint] NOT NULL,
	[H_M_50] [real] NOT NULL,
	[H_MSIG_50] [real] NOT NULL,
	[H_FLG_50] [smallint] NOT NULL,
	[H_M_60] [real] NOT NULL,
	[H_MSIG_60] [real] NOT NULL,
	[H_FLG_60] [smallint] NOT NULL,
	[H_M_70] [real] NOT NULL,
	[H_MSIG_70] [real] NOT NULL,
	[H_FLG_70] [smallint] NOT NULL,
	[K_M_5] [real] NOT NULL,
	[K_MSIG_5] [real] NOT NULL,
	[K_FLG_5] [smallint] NOT NULL,
	[K_M_7] [real] NOT NULL,
	[K_MSIG_7] [real] NOT NULL,
	[K_FLG_7] [smallint] NOT NULL,
	[K_M_10] [real] NOT NULL,
	[K_MSIG_10] [real] NOT NULL,
	[K_FLG_10] [smallint] NOT NULL,
	[K_M_15] [real] NOT NULL,
	[K_MSIG_15] [real] NOT NULL,
	[K_FLG_15] [smallint] NOT NULL,
	[K_M_20] [real] NOT NULL,
	[K_MSIG_20] [real] NOT NULL,
	[K_FLG_20] [smallint] NOT NULL,
	[K_M_25] [real] NOT NULL,
	[K_MSIG_25] [real] NOT NULL,
	[K_FLG_25] [smallint] NOT NULL,
	[K_M_30] [real] NOT NULL,
	[K_MSIG_30] [real] NOT NULL,
	[K_FLG_30] [smallint] NOT NULL,
	[K_M_40] [real] NOT NULL,
	[K_MSIG_40] [real] NOT NULL,
	[K_FLG_40] [smallint] NOT NULL,
	[K_M_50] [real] NOT NULL,
	[K_MSIG_50] [real] NOT NULL,
	[K_FLG_50] [smallint] NOT NULL,
	[K_M_60] [real] NOT NULL,
	[K_MSIG_60] [real] NOT NULL,
	[K_FLG_60] [smallint] NOT NULL,
	[K_M_70] [real] NOT NULL,
	[K_MSIG_70] [real] NOT NULL,
	[K_FLG_70] [smallint] NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[USNO]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USNO](
	[OBJID] [bigint] NOT NULL,
	[RA] [float] NOT NULL,
	[DEC] [float] NOT NULL,
	[RAERR] [float] NOT NULL,
	[DECERR] [float] NOT NULL,
	[MEANEPOCH] [float] NOT NULL,
	[MURA] [real] NOT NULL,
	[MUDEC] [real] NOT NULL,
	[PROPERMOTION] [real] NOT NULL,
	[ANGLE] [real] NOT NULL,
	[MURAERR] [real] NOT NULL,
	[MUDECERR] [real] NOT NULL,
	[MUPROB] [real] NOT NULL,
	[MUFLAG] [int] NOT NULL,
	[SFITRA] [real] NOT NULL,
	[SFITDEC] [real] NOT NULL,
	[NFITPT] [int] NOT NULL,
	[MAG_B1] [real] NOT NULL,
	[MAG_R1] [real] NOT NULL,
	[MAG_B2] [real] NOT NULL,
	[MAG_R2] [real] NOT NULL,
	[MAG_I2] [real] NOT NULL,
	[FLDID_B1] [smallint] NOT NULL,
	[FLDID_R1] [smallint] NOT NULL,
	[FLDID_B2] [smallint] NOT NULL,
	[FLDID_R2] [smallint] NOT NULL,
	[FLDID_I2] [smallint] NOT NULL,
	[SG_B1] [tinyint] NOT NULL,
	[SG_R1] [tinyint] NOT NULL,
	[SG_B2] [tinyint] NOT NULL,
	[SG_R2] [tinyint] NOT NULL,
	[SG_I2] [tinyint] NOT NULL,
	[FLDEPOCH_B1] [real] NOT NULL,
	[FLDEPOCH_R1] [real] NOT NULL,
	[FLDEPOCH_B2] [real] NOT NULL,
	[FLDEPOCH_R2] [real] NOT NULL,
	[FLDEPOCH_I2] [real] NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[Versions]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Versions](
	[event] [varchar](256) NOT NULL,
	[previous] [varchar](64) NOT NULL,
	[checksum] [varchar](64) NOT NULL,
	[version] [varchar](64) NOT NULL,
	[description] [varchar](256) NOT NULL,
	[text] [varchar](2000) NOT NULL,
	[who] [varchar](256) NOT NULL,
	[when] [varchar](256) NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[WISE_allsky]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WISE_allsky](
	[cntr] [bigint] NOT NULL,
	[ra] [float] NOT NULL,
	[dec] [float] NOT NULL,
	[sigra] [real] NOT NULL,
	[sigdec] [real] NOT NULL,
	[sigradec] [real] NOT NULL,
	[wx] [real] NOT NULL,
	[wy] [real] NOT NULL,
	[coadd_id] [varchar](13) NOT NULL,
	[src] [int] NOT NULL,
	[rchi2] [real] NOT NULL,
	[xsc_prox] [real] NOT NULL,
	[tmass_key] [int] NOT NULL,
	[r_2mass] [real] NOT NULL,
	[pa_2mass] [real] NOT NULL,
	[n_2mass] [tinyint] NOT NULL,
	[j_m_2mass] [real] NOT NULL,
	[j_msig_2mass] [real] NOT NULL,
	[h_m_2mass] [real] NOT NULL,
	[h_msig_2mass] [real] NOT NULL,
	[k_m_2mass] [real] NOT NULL,
	[k_msig_2mass] [real] NOT NULL,
	[rho12] [smallint] NOT NULL,
	[rho23] [smallint] NOT NULL,
	[rho34] [smallint] NOT NULL,
	[q12] [tinyint] NOT NULL,
	[q23] [tinyint] NOT NULL,
	[q34] [tinyint] NOT NULL,
	[blend_ext_flags] [tinyint] NOT NULL,
	[w1mpro] [real] NOT NULL,
	[w1sigmpro] [real] NOT NULL,
	[w1snr] [real] NOT NULL,
	[w1rchi2] [real] NOT NULL,
	[w1sat] [real] NOT NULL,
	[w1nm] [tinyint] NOT NULL,
	[w1m] [tinyint] NOT NULL,
	[w1cov] [real] NOT NULL,
	[w1frtr] [real] NOT NULL,
	[w1flux] [real] NOT NULL,
	[w1sigflux] [real] NOT NULL,
	[w1sky] [real] NOT NULL,
	[w1sigsky] [real] NOT NULL,
	[w1conf] [real] NOT NULL,
	[w1mag] [real] NOT NULL,
	[w1sigmag] [real] NOT NULL,
	[w1mcor] [real] NOT NULL,
	[w1magp] [real] NOT NULL,
	[w1sigp1] [real] NOT NULL,
	[w1sigp2] [real] NOT NULL,
	[w1dmag] [real] NOT NULL,
	[w1mjdmin] [float] NOT NULL,
	[w1mjdmax] [float] NOT NULL,
	[w1mjdmean] [float] NOT NULL,
	[w1rsemi] [real] NOT NULL,
	[w1ba] [real] NOT NULL,
	[w1pa] [real] NOT NULL,
	[w1gmag] [real] NOT NULL,
	[w1siggmag] [real] NOT NULL,
	[w1flg] [tinyint] NOT NULL,
	[w1gflg] [tinyint] NOT NULL,
	[ph_qual_det1] [tinyint] NOT NULL,
	[w1ndf] [tinyint] NOT NULL,
	[w1mlq] [tinyint] NOT NULL,
	[w1cc_map] [tinyint] NOT NULL,
	[var_flg1] [tinyint] NOT NULL,
	[moon_lev1] [tinyint] NOT NULL,
	[satnum1] [tinyint] NOT NULL,
	[w2mpro] [real] NOT NULL,
	[w2sigmpro] [real] NOT NULL,
	[w2snr] [real] NOT NULL,
	[w2rchi2] [real] NOT NULL,
	[w2sat] [real] NOT NULL,
	[w2nm] [tinyint] NOT NULL,
	[w2m] [tinyint] NOT NULL,
	[w2cov] [real] NOT NULL,
	[w2frtr] [real] NOT NULL,
	[w2flux] [real] NOT NULL,
	[w2sigflux] [real] NOT NULL,
	[w2sky] [real] NOT NULL,
	[w2sigsky] [real] NOT NULL,
	[w2conf] [real] NOT NULL,
	[w2mag] [real] NOT NULL,
	[w2sigmag] [real] NOT NULL,
	[w2mcor] [real] NOT NULL,
	[w2magp] [real] NOT NULL,
	[w2sigp1] [real] NOT NULL,
	[w2sigp2] [real] NOT NULL,
	[w2dmag] [real] NOT NULL,
	[w2mjdmin] [float] NOT NULL,
	[w2mjdmax] [float] NOT NULL,
	[w2mjdmean] [float] NOT NULL,
	[w2rsemi] [real] NOT NULL,
	[w2ba] [real] NOT NULL,
	[w2pa] [real] NOT NULL,
	[w2gmag] [real] NOT NULL,
	[w2siggmag] [real] NOT NULL,
	[w2flg] [tinyint] NOT NULL,
	[w2gflg] [tinyint] NOT NULL,
	[ph_qual_det2] [tinyint] NOT NULL,
	[w2ndf] [tinyint] NOT NULL,
	[w2mlq] [tinyint] NOT NULL,
	[w2cc_map] [tinyint] NOT NULL,
	[var_flg2] [tinyint] NOT NULL,
	[moon_lev2] [tinyint] NOT NULL,
	[satnum2] [tinyint] NOT NULL,
	[w3mpro] [real] NOT NULL,
	[w3sigmpro] [real] NOT NULL,
	[w3snr] [real] NOT NULL,
	[w3rchi2] [real] NOT NULL,
	[w3sat] [real] NOT NULL,
	[w3nm] [tinyint] NOT NULL,
	[w3m] [tinyint] NOT NULL,
	[w3cov] [real] NOT NULL,
	[w3frtr] [real] NOT NULL,
	[w3flux] [real] NOT NULL,
	[w3sigflux] [real] NOT NULL,
	[w3sky] [real] NOT NULL,
	[w3sigsky] [real] NOT NULL,
	[w3conf] [real] NOT NULL,
	[w3mag] [real] NOT NULL,
	[w3sigmag] [real] NOT NULL,
	[w3mcor] [real] NOT NULL,
	[w3magp] [real] NOT NULL,
	[w3sigp1] [real] NOT NULL,
	[w3sigp2] [real] NOT NULL,
	[w3dmag] [real] NOT NULL,
	[w3mjdmin] [float] NOT NULL,
	[w3mjdmax] [float] NOT NULL,
	[w3mjdmean] [float] NOT NULL,
	[w3rsemi] [real] NOT NULL,
	[w3ba] [real] NOT NULL,
	[w3pa] [real] NOT NULL,
	[w3gmag] [real] NOT NULL,
	[w3siggmag] [real] NOT NULL,
	[w3flg] [tinyint] NOT NULL,
	[w3gflg] [tinyint] NOT NULL,
	[ph_qual_det3] [tinyint] NOT NULL,
	[w3ndf] [tinyint] NOT NULL,
	[w3mlq] [tinyint] NOT NULL,
	[w3cc_map] [tinyint] NOT NULL,
	[var_flg3] [tinyint] NOT NULL,
	[moon_lev3] [tinyint] NOT NULL,
	[satnum3] [tinyint] NOT NULL,
	[w4mpro] [real] NOT NULL,
	[w4sigmpro] [real] NOT NULL,
	[w4snr] [real] NOT NULL,
	[w4rchi2] [real] NOT NULL,
	[w4sat] [real] NOT NULL,
	[w4nm] [tinyint] NOT NULL,
	[w4m] [tinyint] NOT NULL,
	[w4cov] [real] NOT NULL,
	[w4frtr] [real] NOT NULL,
	[w4flux] [real] NOT NULL,
	[w4sigflux] [real] NOT NULL,
	[w4sky] [real] NOT NULL,
	[w4sigsky] [real] NOT NULL,
	[w4conf] [real] NOT NULL,
	[w4mag] [real] NOT NULL,
	[w4sigmag] [real] NOT NULL,
	[w4mcor] [real] NOT NULL,
	[w4magp] [real] NOT NULL,
	[w4sigp1] [real] NOT NULL,
	[w4sigp2] [real] NOT NULL,
	[w4dmag] [real] NOT NULL,
	[w4mjdmin] [float] NOT NULL,
	[w4mjdmax] [float] NOT NULL,
	[w4mjdmean] [float] NOT NULL,
	[w4rsemi] [real] NOT NULL,
	[w4ba] [real] NOT NULL,
	[w4pa] [real] NOT NULL,
	[w4gmag] [real] NOT NULL,
	[w4siggmag] [real] NOT NULL,
	[w4flg] [tinyint] NOT NULL,
	[w4gflg] [tinyint] NOT NULL,
	[ph_qual_det4] [tinyint] NOT NULL,
	[w4ndf] [tinyint] NOT NULL,
	[w4mlq] [tinyint] NOT NULL,
	[w4cc_map] [tinyint] NOT NULL,
	[var_flg4] [tinyint] NOT NULL,
	[moon_lev4] [tinyint] NOT NULL,
	[satnum4] [tinyint] NOT NULL,
	[w1mag_1] [real] NOT NULL,
	[w1sigmag_1] [real] NOT NULL,
	[w1flg_1] [tinyint] NOT NULL,
	[w1mag_2] [real] NOT NULL,
	[w1sigmag_2] [real] NOT NULL,
	[w1flg_2] [tinyint] NOT NULL,
	[w1mag_3] [real] NOT NULL,
	[w1sigmag_3] [real] NOT NULL,
	[w1flg_3] [tinyint] NOT NULL,
	[w1mag_4] [real] NOT NULL,
	[w1sigmag_4] [real] NOT NULL,
	[w1flg_4] [tinyint] NOT NULL,
	[w1mag_5] [real] NOT NULL,
	[w1sigmag_5] [real] NOT NULL,
	[w1flg_5] [tinyint] NOT NULL,
	[w1mag_6] [real] NOT NULL,
	[w1sigmag_6] [real] NOT NULL,
	[w1flg_6] [tinyint] NOT NULL,
	[w1mag_7] [real] NOT NULL,
	[w1sigmag_7] [real] NOT NULL,
	[w1flg_7] [tinyint] NOT NULL,
	[w1mag_8] [real] NOT NULL,
	[w1sigmag_8] [real] NOT NULL,
	[w1flg_8] [tinyint] NOT NULL,
	[w2mag_1] [real] NOT NULL,
	[w2sigmag_1] [real] NOT NULL,
	[w2flg_1] [tinyint] NOT NULL,
	[w2mag_2] [real] NOT NULL,
	[w2sigmag_2] [real] NOT NULL,
	[w2flg_2] [tinyint] NOT NULL,
	[w2mag_3] [real] NOT NULL,
	[w2sigmag_3] [real] NOT NULL,
	[w2flg_3] [tinyint] NOT NULL,
	[w2mag_4] [real] NOT NULL,
	[w2sigmag_4] [real] NOT NULL,
	[w2flg_4] [tinyint] NOT NULL,
	[w2mag_5] [real] NOT NULL,
	[w2sigmag_5] [real] NOT NULL,
	[w2flg_5] [tinyint] NOT NULL,
	[w2mag_6] [real] NOT NULL,
	[w2sigmag_6] [real] NOT NULL,
	[w2flg_6] [tinyint] NOT NULL,
	[w2mag_7] [real] NOT NULL,
	[w2sigmag_7] [real] NOT NULL,
	[w2flg_7] [tinyint] NOT NULL,
	[w2mag_8] [real] NOT NULL,
	[w2sigmag_8] [real] NOT NULL,
	[w2flg_8] [tinyint] NOT NULL,
	[w3mag_1] [real] NOT NULL,
	[w3sigmag_1] [real] NOT NULL,
	[w3flg_1] [tinyint] NOT NULL,
	[w3mag_2] [real] NOT NULL,
	[w3sigmag_2] [real] NOT NULL,
	[w3flg_2] [tinyint] NOT NULL,
	[w3mag_3] [real] NOT NULL,
	[w3sigmag_3] [real] NOT NULL,
	[w3flg_3] [tinyint] NOT NULL,
	[w3mag_4] [real] NOT NULL,
	[w3sigmag_4] [real] NOT NULL,
	[w3flg_4] [tinyint] NOT NULL,
	[w3mag_5] [real] NOT NULL,
	[w3sigmag_5] [real] NOT NULL,
	[w3flg_5] [tinyint] NOT NULL,
	[w3mag_6] [real] NOT NULL,
	[w3sigmag_6] [real] NOT NULL,
	[w3flg_6] [tinyint] NOT NULL,
	[w3mag_7] [real] NOT NULL,
	[w3sigmag_7] [real] NOT NULL,
	[w3flg_7] [tinyint] NOT NULL,
	[w3mag_8] [real] NOT NULL,
	[w3sigmag_8] [real] NOT NULL,
	[w3flg_8] [tinyint] NOT NULL,
	[w4mag_1] [real] NOT NULL,
	[w4sigmag_1] [real] NOT NULL,
	[w4flg_1] [tinyint] NOT NULL,
	[w4mag_2] [real] NOT NULL,
	[w4sigmag_2] [real] NOT NULL,
	[w4flg_2] [tinyint] NOT NULL,
	[w4mag_3] [real] NOT NULL,
	[w4sigmag_3] [real] NOT NULL,
	[w4flg_3] [tinyint] NOT NULL,
	[w4mag_4] [real] NOT NULL,
	[w4sigmag_4] [real] NOT NULL,
	[w4flg_4] [tinyint] NOT NULL,
	[w4mag_5] [real] NOT NULL,
	[w4sigmag_5] [real] NOT NULL,
	[w4flg_5] [tinyint] NOT NULL,
	[w4mag_6] [real] NOT NULL,
	[w4sigmag_6] [real] NOT NULL,
	[w4flg_6] [tinyint] NOT NULL,
	[w4mag_7] [real] NOT NULL,
	[w4sigmag_7] [real] NOT NULL,
	[w4flg_7] [tinyint] NOT NULL,
	[w4mag_8] [real] NOT NULL,
	[w4sigmag_8] [real] NOT NULL,
	[w4flg_8] [tinyint] NOT NULL,
	[glat] [float] NOT NULL,
	[glon] [float] NOT NULL,
	[rjce]  AS (([j_m_2mass]-[k_m_2mass])-(1.377)*(([h_m_2mass]-[w2mag])-(0.05))) PERSISTED NOT NULL
) ON [WISE]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[WISE_xmatch]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WISE_xmatch](
	[sdss_objid] [bigint] NOT NULL,
	[wise_cntr] [bigint] NOT NULL,
	[match_dist] [real] NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[wiseForcedTarget]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wiseForcedTarget](
	[objID] [bigint] NOT NULL,
	[ra] [float] NOT NULL,
	[dec] [float] NOT NULL,
	[has_wise_phot] [bit] NOT NULL,
	[x] [real] NOT NULL,
	[y] [real] NOT NULL,
	[treated_as_pointsource] [bit] NOT NULL,
	[coadd_id] [char](8) NOT NULL,
	[w1_nanomaggies] [real] NOT NULL,
	[w1_nanomaggies_ivar] [real] NOT NULL,
	[w1_mag] [real] NOT NULL,
	[w1_mag_err] [real] NOT NULL,
	[w1_prochi2] [real] NOT NULL,
	[w1_pronpix] [real] NOT NULL,
	[w1_profracflux] [real] NOT NULL,
	[w1_proflux] [real] NOT NULL,
	[w1_npix] [real] NOT NULL,
	[w2_nanomaggies] [real] NOT NULL,
	[w2_nanomaggies_ivar] [real] NOT NULL,
	[w2_mag] [real] NOT NULL,
	[w2_mag_err] [real] NOT NULL,
	[w2_prochi2] [real] NOT NULL,
	[w2_pronpix] [real] NOT NULL,
	[w2_profracflux] [real] NOT NULL,
	[w2_proflux] [real] NOT NULL,
	[w2_npix] [real] NOT NULL
) ON [WISE]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[Zone]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zone](
	[zoneID] [int] NOT NULL,
	[ra] [float] NOT NULL,
	[dec] [float] NOT NULL,
	[objID] [bigint] NOT NULL,
	[type] [smallint] NOT NULL,
	[mode] [tinyint] NOT NULL,
	[cx] [float] NOT NULL,
	[cy] [float] NOT NULL,
	[cz] [float] NOT NULL,
	[native] [tinyint] NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[zoo2MainPhotoz]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zoo2MainPhotoz](
	[dr8objid] [bigint] NOT NULL,
	[dr7objid] [bigint] NOT NULL,
	[ra] [real] NOT NULL,
	[dec] [real] NOT NULL,
	[rastring] [varchar](16) NOT NULL,
	[decstring] [varchar](16) NOT NULL,
	[sample] [varchar](32) NOT NULL,
	[total_classifications] [int] NOT NULL,
	[total_votes] [int] NOT NULL,
	[t01_smooth_or_features_a01_smooth_count] [int] NOT NULL,
	[t01_smooth_or_features_a01_smooth_weight] [float] NOT NULL,
	[t01_smooth_or_features_a01_smooth_fraction] [float] NOT NULL,
	[t01_smooth_or_features_a01_smooth_weighted_fraction] [float] NOT NULL,
	[t01_smooth_or_features_a01_smooth_debiased] [float] NOT NULL,
	[t01_smooth_or_features_a01_smooth_flag] [int] NOT NULL,
	[t01_smooth_or_features_a02_features_or_disk_count] [int] NOT NULL,
	[t01_smooth_or_features_a02_features_or_disk_weight] [float] NOT NULL,
	[t01_smooth_or_features_a02_features_or_disk_fraction] [float] NOT NULL,
	[t01_smooth_or_features_a02_features_or_disk_weighted_fraction] [float] NOT NULL,
	[t01_smooth_or_features_a02_features_or_disk_debiased] [float] NOT NULL,
	[t01_smooth_or_features_a02_features_or_disk_flag] [int] NOT NULL,
	[t01_smooth_or_features_a03_star_or_artifact_count] [int] NOT NULL,
	[t01_smooth_or_features_a03_star_or_artifact_weight] [float] NOT NULL,
	[t01_smooth_or_features_a03_star_or_artifact_fraction] [float] NOT NULL,
	[t01_smooth_or_features_a03_star_or_artifact_weighted_fraction] [float] NOT NULL,
	[t01_smooth_or_features_a03_star_or_artifact_debiased] [float] NOT NULL,
	[t01_smooth_or_features_a03_star_or_artifact_flag] [int] NOT NULL,
	[t02_edgeon_a04_yes_count] [int] NOT NULL,
	[t02_edgeon_a04_yes_weight] [float] NOT NULL,
	[t02_edgeon_a04_yes_fraction] [float] NOT NULL,
	[t02_edgeon_a04_yes_weighted_fraction] [float] NOT NULL,
	[t02_edgeon_a04_yes_debiased] [float] NOT NULL,
	[t02_edgeon_a04_yes_flag] [int] NOT NULL,
	[t02_edgeon_a05_no_count] [int] NOT NULL,
	[t02_edgeon_a05_no_weight] [float] NOT NULL,
	[t02_edgeon_a05_no_fraction] [float] NOT NULL,
	[t02_edgeon_a05_no_weighted_fraction] [float] NOT NULL,
	[t02_edgeon_a05_no_debiased] [float] NOT NULL,
	[t02_edgeon_a05_no_flag] [int] NOT NULL,
	[t03_bar_a06_bar_count] [int] NOT NULL,
	[t03_bar_a06_bar_weight] [float] NOT NULL,
	[t03_bar_a06_bar_fraction] [float] NOT NULL,
	[t03_bar_a06_bar_weighted_fraction] [float] NOT NULL,
	[t03_bar_a06_bar_debiased] [float] NOT NULL,
	[t03_bar_a06_bar_flag] [int] NOT NULL,
	[t03_bar_a07_no_bar_count] [int] NOT NULL,
	[t03_bar_a07_no_bar_weight] [float] NOT NULL,
	[t03_bar_a07_no_bar_fraction] [float] NOT NULL,
	[t03_bar_a07_no_bar_weighted_fraction] [float] NOT NULL,
	[t03_bar_a07_no_bar_debiased] [float] NOT NULL,
	[t03_bar_a07_no_bar_flag] [int] NOT NULL,
	[t04_spiral_a08_spiral_count] [int] NOT NULL,
	[t04_spiral_a08_spiral_weight] [float] NOT NULL,
	[t04_spiral_a08_spiral_fraction] [float] NOT NULL,
	[t04_spiral_a08_spiral_weighted_fraction] [float] NOT NULL,
	[t04_spiral_a08_spiral_debiased] [float] NOT NULL,
	[t04_spiral_a08_spiral_flag] [int] NOT NULL,
	[t04_spiral_a09_no_spiral_count] [int] NOT NULL,
	[t04_spiral_a09_no_spiral_weight] [float] NOT NULL,
	[t04_spiral_a09_no_spiral_fraction] [float] NOT NULL,
	[t04_spiral_a09_no_spiral_weighted_fraction] [float] NOT NULL,
	[t04_spiral_a09_no_spiral_debiased] [float] NOT NULL,
	[t04_spiral_a09_no_spiral_flag] [int] NOT NULL,
	[t05_bulge_prominence_a10_no_bulge_count] [int] NOT NULL,
	[t05_bulge_prominence_a10_no_bulge_weight] [float] NOT NULL,
	[t05_bulge_prominence_a10_no_bulge_fraction] [float] NOT NULL,
	[t05_bulge_prominence_a10_no_bulge_weighted_fraction] [float] NOT NULL,
	[t05_bulge_prominence_a10_no_bulge_debiased] [float] NOT NULL,
	[t05_bulge_prominence_a10_no_bulge_flag] [int] NOT NULL,
	[t05_bulge_prominence_a11_just_noticeable_count] [int] NOT NULL,
	[t05_bulge_prominence_a11_just_noticeable_weight] [float] NOT NULL,
	[t05_bulge_prominence_a11_just_noticeable_fraction] [float] NOT NULL,
	[t05_bulge_prominence_a11_just_noticeable_weighted_fraction] [float] NOT NULL,
	[t05_bulge_prominence_a11_just_noticeable_debiased] [float] NOT NULL,
	[t05_bulge_prominence_a11_just_noticeable_flag] [int] NOT NULL,
	[t05_bulge_prominence_a12_obvious_count] [int] NOT NULL,
	[t05_bulge_prominence_a12_obvious_weight] [float] NOT NULL,
	[t05_bulge_prominence_a12_obvious_fraction] [float] NOT NULL,
	[t05_bulge_prominence_a12_obvious_weighted_fraction] [float] NOT NULL,
	[t05_bulge_prominence_a12_obvious_debiased] [float] NOT NULL,
	[t05_bulge_prominence_a12_obvious_flag] [int] NOT NULL,
	[t05_bulge_prominence_a13_dominant_count] [int] NOT NULL,
	[t05_bulge_prominence_a13_dominant_weight] [float] NOT NULL,
	[t05_bulge_prominence_a13_dominant_fraction] [float] NOT NULL,
	[t05_bulge_prominence_a13_dominant_weighted_fraction] [float] NOT NULL,
	[t05_bulge_prominence_a13_dominant_debiased] [float] NOT NULL,
	[t05_bulge_prominence_a13_dominant_flag] [int] NOT NULL,
	[t06_odd_a14_yes_count] [int] NOT NULL,
	[t06_odd_a14_yes_weight] [float] NOT NULL,
	[t06_odd_a14_yes_fraction] [float] NOT NULL,
	[t06_odd_a14_yes_weighted_fraction] [float] NOT NULL,
	[t06_odd_a14_yes_debiased] [float] NOT NULL,
	[t06_odd_a14_yes_flag] [int] NOT NULL,
	[t06_odd_a15_no_count] [int] NOT NULL,
	[t06_odd_a15_no_weight] [float] NOT NULL,
	[t06_odd_a15_no_fraction] [float] NOT NULL,
	[t06_odd_a15_no_weighted_fraction] [float] NOT NULL,
	[t06_odd_a15_no_debiased] [float] NOT NULL,
	[t06_odd_a15_no_flag] [int] NOT NULL,
	[t07_rounded_a16_completely_round_count] [int] NOT NULL,
	[t07_rounded_a16_completely_round_weight] [float] NOT NULL,
	[t07_rounded_a16_completely_round_fraction] [float] NOT NULL,
	[t07_rounded_a16_completely_round_weighted_fraction] [float] NOT NULL,
	[t07_rounded_a16_completely_round_debiased] [float] NOT NULL,
	[t07_rounded_a16_completely_round_flag] [int] NOT NULL,
	[t07_rounded_a17_in_between_count] [int] NOT NULL,
	[t07_rounded_a17_in_between_weight] [float] NOT NULL,
	[t07_rounded_a17_in_between_fraction] [float] NOT NULL,
	[t07_rounded_a17_in_between_weighted_fraction] [float] NOT NULL,
	[t07_rounded_a17_in_between_debiased] [float] NOT NULL,
	[t07_rounded_a17_in_between_flag] [int] NOT NULL,
	[t07_rounded_a18_cigar_shaped_count] [int] NOT NULL,
	[t07_rounded_a18_cigar_shaped_weight] [float] NOT NULL,
	[t07_rounded_a18_cigar_shaped_fraction] [float] NOT NULL,
	[t07_rounded_a18_cigar_shaped_weighted_fraction] [float] NOT NULL,
	[t07_rounded_a18_cigar_shaped_debiased] [float] NOT NULL,
	[t07_rounded_a18_cigar_shaped_flag] [int] NOT NULL,
	[t08_odd_feature_a19_ring_count] [int] NOT NULL,
	[t08_odd_feature_a19_ring_weight] [float] NOT NULL,
	[t08_odd_feature_a19_ring_fraction] [float] NOT NULL,
	[t08_odd_feature_a19_ring_weighted_fraction] [float] NOT NULL,
	[t08_odd_feature_a19_ring_debiased] [float] NOT NULL,
	[t08_odd_feature_a19_ring_flag] [int] NOT NULL,
	[t08_odd_feature_a20_lens_or_arc_count] [int] NOT NULL,
	[t08_odd_feature_a20_lens_or_arc_weight] [float] NOT NULL,
	[t08_odd_feature_a20_lens_or_arc_fraction] [float] NOT NULL,
	[t08_odd_feature_a20_lens_or_arc_weighted_fraction] [float] NOT NULL,
	[t08_odd_feature_a20_lens_or_arc_debiased] [float] NOT NULL,
	[t08_odd_feature_a20_lens_or_arc_flag] [int] NOT NULL,
	[t08_odd_feature_a21_disturbed_count] [int] NOT NULL,
	[t08_odd_feature_a21_disturbed_weight] [float] NOT NULL,
	[t08_odd_feature_a21_disturbed_fraction] [float] NOT NULL,
	[t08_odd_feature_a21_disturbed_weighted_fraction] [float] NOT NULL,
	[t08_odd_feature_a21_disturbed_debiased] [float] NOT NULL,
	[t08_odd_feature_a21_disturbed_flag] [int] NOT NULL,
	[t08_odd_feature_a22_irregular_count] [int] NOT NULL,
	[t08_odd_feature_a22_irregular_weight] [float] NOT NULL,
	[t08_odd_feature_a22_irregular_fraction] [float] NOT NULL,
	[t08_odd_feature_a22_irregular_weighted_fraction] [float] NOT NULL,
	[t08_odd_feature_a22_irregular_debiased] [float] NOT NULL,
	[t08_odd_feature_a22_irregular_flag] [int] NOT NULL,
	[t08_odd_feature_a23_other_count] [int] NOT NULL,
	[t08_odd_feature_a23_other_weight] [float] NOT NULL,
	[t08_odd_feature_a23_other_fraction] [float] NOT NULL,
	[t08_odd_feature_a23_other_weighted_fraction] [float] NOT NULL,
	[t08_odd_feature_a23_other_debiased] [float] NOT NULL,
	[t08_odd_feature_a23_other_flag] [int] NOT NULL,
	[t08_odd_feature_a24_merger_count] [int] NOT NULL,
	[t08_odd_feature_a24_merger_weight] [float] NOT NULL,
	[t08_odd_feature_a24_merger_fraction] [float] NOT NULL,
	[t08_odd_feature_a24_merger_weighted_fraction] [float] NOT NULL,
	[t08_odd_feature_a24_merger_debiased] [float] NOT NULL,
	[t08_odd_feature_a24_merger_flag] [int] NOT NULL,
	[t08_odd_feature_a38_dust_lane_count] [int] NOT NULL,
	[t08_odd_feature_a38_dust_lane_weight] [float] NOT NULL,
	[t08_odd_feature_a38_dust_lane_fraction] [float] NOT NULL,
	[t08_odd_feature_a38_dust_lane_weighted_fraction] [float] NOT NULL,
	[t08_odd_feature_a38_dust_lane_debiased] [float] NOT NULL,
	[t08_odd_feature_a38_dust_lane_flag] [int] NOT NULL,
	[t09_bulge_shape_a25_rounded_count] [int] NOT NULL,
	[t09_bulge_shape_a25_rounded_weight] [float] NOT NULL,
	[t09_bulge_shape_a25_rounded_fraction] [float] NOT NULL,
	[t09_bulge_shape_a25_rounded_weighted_fraction] [float] NOT NULL,
	[t09_bulge_shape_a25_rounded_debiased] [float] NOT NULL,
	[t09_bulge_shape_a25_rounded_flag] [int] NOT NULL,
	[t09_bulge_shape_a26_boxy_count] [int] NOT NULL,
	[t09_bulge_shape_a26_boxy_weight] [float] NOT NULL,
	[t09_bulge_shape_a26_boxy_fraction] [float] NOT NULL,
	[t09_bulge_shape_a26_boxy_weighted_fraction] [float] NOT NULL,
	[t09_bulge_shape_a26_boxy_debiased] [float] NOT NULL,
	[t09_bulge_shape_a26_boxy_flag] [int] NOT NULL,
	[t09_bulge_shape_a27_no_bulge_count] [int] NOT NULL,
	[t09_bulge_shape_a27_no_bulge_weight] [float] NOT NULL,
	[t09_bulge_shape_a27_no_bulge_fraction] [float] NOT NULL,
	[t09_bulge_shape_a27_no_bulge_weighted_fraction] [float] NOT NULL,
	[t09_bulge_shape_a27_no_bulge_debiased] [float] NOT NULL,
	[t09_bulge_shape_a27_no_bulge_flag] [int] NOT NULL,
	[t10_arms_winding_a28_tight_count] [int] NOT NULL,
	[t10_arms_winding_a28_tight_weight] [float] NOT NULL,
	[t10_arms_winding_a28_tight_fraction] [float] NOT NULL,
	[t10_arms_winding_a28_tight_weighted_fraction] [float] NOT NULL,
	[t10_arms_winding_a28_tight_debiased] [float] NOT NULL,
	[t10_arms_winding_a28_tight_flag] [int] NOT NULL,
	[t10_arms_winding_a29_medium_count] [int] NOT NULL,
	[t10_arms_winding_a29_medium_weight] [float] NOT NULL,
	[t10_arms_winding_a29_medium_fraction] [float] NOT NULL,
	[t10_arms_winding_a29_medium_weighted_fraction] [float] NOT NULL,
	[t10_arms_winding_a29_medium_debiased] [float] NOT NULL,
	[t10_arms_winding_a29_medium_flag] [int] NOT NULL,
	[t10_arms_winding_a30_loose_count] [int] NOT NULL,
	[t10_arms_winding_a30_loose_weight] [float] NOT NULL,
	[t10_arms_winding_a30_loose_fraction] [float] NOT NULL,
	[t10_arms_winding_a30_loose_weighted_fraction] [float] NOT NULL,
	[t10_arms_winding_a30_loose_debiased] [float] NOT NULL,
	[t10_arms_winding_a30_loose_flag] [int] NOT NULL,
	[t11_arms_number_a31_1_count] [int] NOT NULL,
	[t11_arms_number_a31_1_weight] [float] NOT NULL,
	[t11_arms_number_a31_1_fraction] [float] NOT NULL,
	[t11_arms_number_a31_1_weighted_fraction] [float] NOT NULL,
	[t11_arms_number_a31_1_debiased] [float] NOT NULL,
	[t11_arms_number_a31_1_flag] [int] NOT NULL,
	[t11_arms_number_a32_2_count] [int] NOT NULL,
	[t11_arms_number_a32_2_weight] [float] NOT NULL,
	[t11_arms_number_a32_2_fraction] [float] NOT NULL,
	[t11_arms_number_a32_2_weighted_fraction] [float] NOT NULL,
	[t11_arms_number_a32_2_debiased] [float] NOT NULL,
	[t11_arms_number_a32_2_flag] [int] NOT NULL,
	[t11_arms_number_a33_3_count] [int] NOT NULL,
	[t11_arms_number_a33_3_weight] [float] NOT NULL,
	[t11_arms_number_a33_3_fraction] [float] NOT NULL,
	[t11_arms_number_a33_3_weighted_fraction] [float] NOT NULL,
	[t11_arms_number_a33_3_debiased] [float] NOT NULL,
	[t11_arms_number_a33_3_flag] [int] NOT NULL,
	[t11_arms_number_a34_4_count] [int] NOT NULL,
	[t11_arms_number_a34_4_weight] [float] NOT NULL,
	[t11_arms_number_a34_4_fraction] [float] NOT NULL,
	[t11_arms_number_a34_4_weighted_fraction] [float] NOT NULL,
	[t11_arms_number_a34_4_debiased] [float] NOT NULL,
	[t11_arms_number_a34_4_flag] [int] NOT NULL,
	[t11_arms_number_a36_more_than_4_count] [int] NOT NULL,
	[t11_arms_number_a36_more_than_4_weight] [float] NOT NULL,
	[t11_arms_number_a36_more_than_4_fraction] [float] NOT NULL,
	[t11_arms_number_a36_more_than_4_weighted_fraction] [float] NOT NULL,
	[t11_arms_number_a36_more_than_4_debiased] [float] NOT NULL,
	[t11_arms_number_a36_more_than_4_flag] [int] NOT NULL,
	[t11_arms_number_a37_cant_tell_count] [int] NOT NULL,
	[t11_arms_number_a37_cant_tell_weight] [float] NOT NULL,
	[t11_arms_number_a37_cant_tell_fraction] [float] NOT NULL,
	[t11_arms_number_a37_cant_tell_weighted_fraction] [float] NOT NULL,
	[t11_arms_number_a37_cant_tell_debiased] [float] NOT NULL,
	[t11_arms_number_a37_cant_tell_flag] [int] NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[zoo2MainSpecz]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zoo2MainSpecz](
	[specobjid] [bigint] NOT NULL,
	[dr8objid] [bigint] NOT NULL,
	[dr7objid] [bigint] NOT NULL,
	[ra] [real] NOT NULL,
	[dec] [real] NOT NULL,
	[rastring] [varchar](16) NOT NULL,
	[decstring] [varchar](16) NOT NULL,
	[sample] [varchar](32) NOT NULL,
	[total_classifications] [int] NOT NULL,
	[total_votes] [int] NOT NULL,
	[t01_smooth_or_features_a01_smooth_count] [int] NOT NULL,
	[t01_smooth_or_features_a01_smooth_weight] [float] NOT NULL,
	[t01_smooth_or_features_a01_smooth_fraction] [float] NOT NULL,
	[t01_smooth_or_features_a01_smooth_weighted_fraction] [float] NOT NULL,
	[t01_smooth_or_features_a01_smooth_debiased] [float] NOT NULL,
	[t01_smooth_or_features_a01_smooth_flag] [int] NOT NULL,
	[t01_smooth_or_features_a02_features_or_disk_count] [int] NOT NULL,
	[t01_smooth_or_features_a02_features_or_disk_weight] [float] NOT NULL,
	[t01_smooth_or_features_a02_features_or_disk_fraction] [float] NOT NULL,
	[t01_smooth_or_features_a02_features_or_disk_weighted_fraction] [float] NOT NULL,
	[t01_smooth_or_features_a02_features_or_disk_debiased] [float] NOT NULL,
	[t01_smooth_or_features_a02_features_or_disk_flag] [int] NOT NULL,
	[t01_smooth_or_features_a03_star_or_artifact_count] [int] NOT NULL,
	[t01_smooth_or_features_a03_star_or_artifact_weight] [float] NOT NULL,
	[t01_smooth_or_features_a03_star_or_artifact_fraction] [float] NOT NULL,
	[t01_smooth_or_features_a03_star_or_artifact_weighted_fraction] [float] NOT NULL,
	[t01_smooth_or_features_a03_star_or_artifact_debiased] [float] NOT NULL,
	[t01_smooth_or_features_a03_star_or_artifact_flag] [int] NOT NULL,
	[t02_edgeon_a04_yes_count] [int] NOT NULL,
	[t02_edgeon_a04_yes_weight] [float] NOT NULL,
	[t02_edgeon_a04_yes_fraction] [float] NOT NULL,
	[t02_edgeon_a04_yes_weighted_fraction] [float] NOT NULL,
	[t02_edgeon_a04_yes_debiased] [float] NOT NULL,
	[t02_edgeon_a04_yes_flag] [int] NOT NULL,
	[t02_edgeon_a05_no_count] [int] NOT NULL,
	[t02_edgeon_a05_no_weight] [float] NOT NULL,
	[t02_edgeon_a05_no_fraction] [float] NOT NULL,
	[t02_edgeon_a05_no_weighted_fraction] [float] NOT NULL,
	[t02_edgeon_a05_no_debiased] [float] NOT NULL,
	[t02_edgeon_a05_no_flag] [int] NOT NULL,
	[t03_bar_a06_bar_count] [int] NOT NULL,
	[t03_bar_a06_bar_weight] [float] NOT NULL,
	[t03_bar_a06_bar_fraction] [float] NOT NULL,
	[t03_bar_a06_bar_weighted_fraction] [float] NOT NULL,
	[t03_bar_a06_bar_debiased] [float] NOT NULL,
	[t03_bar_a06_bar_flag] [int] NOT NULL,
	[t03_bar_a07_no_bar_count] [int] NOT NULL,
	[t03_bar_a07_no_bar_weight] [float] NOT NULL,
	[t03_bar_a07_no_bar_fraction] [float] NOT NULL,
	[t03_bar_a07_no_bar_weighted_fraction] [float] NOT NULL,
	[t03_bar_a07_no_bar_debiased] [float] NOT NULL,
	[t03_bar_a07_no_bar_flag] [int] NOT NULL,
	[t04_spiral_a08_spiral_count] [int] NOT NULL,
	[t04_spiral_a08_spiral_weight] [float] NOT NULL,
	[t04_spiral_a08_spiral_fraction] [float] NOT NULL,
	[t04_spiral_a08_spiral_weighted_fraction] [float] NOT NULL,
	[t04_spiral_a08_spiral_debiased] [float] NOT NULL,
	[t04_spiral_a08_spiral_flag] [int] NOT NULL,
	[t04_spiral_a09_no_spiral_count] [int] NOT NULL,
	[t04_spiral_a09_no_spiral_weight] [float] NOT NULL,
	[t04_spiral_a09_no_spiral_fraction] [float] NOT NULL,
	[t04_spiral_a09_no_spiral_weighted_fraction] [float] NOT NULL,
	[t04_spiral_a09_no_spiral_debiased] [float] NOT NULL,
	[t04_spiral_a09_no_spiral_flag] [int] NOT NULL,
	[t05_bulge_prominence_a10_no_bulge_count] [int] NOT NULL,
	[t05_bulge_prominence_a10_no_bulge_weight] [float] NOT NULL,
	[t05_bulge_prominence_a10_no_bulge_fraction] [float] NOT NULL,
	[t05_bulge_prominence_a10_no_bulge_weighted_fraction] [float] NOT NULL,
	[t05_bulge_prominence_a10_no_bulge_debiased] [float] NOT NULL,
	[t05_bulge_prominence_a10_no_bulge_flag] [int] NOT NULL,
	[t05_bulge_prominence_a11_just_noticeable_count] [int] NOT NULL,
	[t05_bulge_prominence_a11_just_noticeable_weight] [float] NOT NULL,
	[t05_bulge_prominence_a11_just_noticeable_fraction] [float] NOT NULL,
	[t05_bulge_prominence_a11_just_noticeable_weighted_fraction] [float] NOT NULL,
	[t05_bulge_prominence_a11_just_noticeable_debiased] [float] NOT NULL,
	[t05_bulge_prominence_a11_just_noticeable_flag] [int] NOT NULL,
	[t05_bulge_prominence_a12_obvious_count] [int] NOT NULL,
	[t05_bulge_prominence_a12_obvious_weight] [float] NOT NULL,
	[t05_bulge_prominence_a12_obvious_fraction] [float] NOT NULL,
	[t05_bulge_prominence_a12_obvious_weighted_fraction] [float] NOT NULL,
	[t05_bulge_prominence_a12_obvious_debiased] [float] NOT NULL,
	[t05_bulge_prominence_a12_obvious_flag] [int] NOT NULL,
	[t05_bulge_prominence_a13_dominant_count] [int] NOT NULL,
	[t05_bulge_prominence_a13_dominant_weight] [float] NOT NULL,
	[t05_bulge_prominence_a13_dominant_fraction] [float] NOT NULL,
	[t05_bulge_prominence_a13_dominant_weighted_fraction] [float] NOT NULL,
	[t05_bulge_prominence_a13_dominant_debiased] [float] NOT NULL,
	[t05_bulge_prominence_a13_dominant_flag] [int] NOT NULL,
	[t06_odd_a14_yes_count] [int] NOT NULL,
	[t06_odd_a14_yes_weight] [float] NOT NULL,
	[t06_odd_a14_yes_fraction] [float] NOT NULL,
	[t06_odd_a14_yes_weighted_fraction] [float] NOT NULL,
	[t06_odd_a14_yes_debiased] [float] NOT NULL,
	[t06_odd_a14_yes_flag] [int] NOT NULL,
	[t06_odd_a15_no_count] [int] NOT NULL,
	[t06_odd_a15_no_weight] [float] NOT NULL,
	[t06_odd_a15_no_fraction] [float] NOT NULL,
	[t06_odd_a15_no_weighted_fraction] [float] NOT NULL,
	[t06_odd_a15_no_debiased] [float] NOT NULL,
	[t06_odd_a15_no_flag] [int] NOT NULL,
	[t07_rounded_a16_completely_round_count] [int] NOT NULL,
	[t07_rounded_a16_completely_round_weight] [float] NOT NULL,
	[t07_rounded_a16_completely_round_fraction] [float] NOT NULL,
	[t07_rounded_a16_completely_round_weighted_fraction] [float] NOT NULL,
	[t07_rounded_a16_completely_round_debiased] [float] NOT NULL,
	[t07_rounded_a16_completely_round_flag] [int] NOT NULL,
	[t07_rounded_a17_in_between_count] [int] NOT NULL,
	[t07_rounded_a17_in_between_weight] [float] NOT NULL,
	[t07_rounded_a17_in_between_fraction] [float] NOT NULL,
	[t07_rounded_a17_in_between_weighted_fraction] [float] NOT NULL,
	[t07_rounded_a17_in_between_debiased] [float] NOT NULL,
	[t07_rounded_a17_in_between_flag] [int] NOT NULL,
	[t07_rounded_a18_cigar_shaped_count] [int] NOT NULL,
	[t07_rounded_a18_cigar_shaped_weight] [float] NOT NULL,
	[t07_rounded_a18_cigar_shaped_fraction] [float] NOT NULL,
	[t07_rounded_a18_cigar_shaped_weighted_fraction] [float] NOT NULL,
	[t07_rounded_a18_cigar_shaped_debiased] [float] NOT NULL,
	[t07_rounded_a18_cigar_shaped_flag] [int] NOT NULL,
	[t08_odd_feature_a19_ring_count] [int] NOT NULL,
	[t08_odd_feature_a19_ring_weight] [float] NOT NULL,
	[t08_odd_feature_a19_ring_fraction] [float] NOT NULL,
	[t08_odd_feature_a19_ring_weighted_fraction] [float] NOT NULL,
	[t08_odd_feature_a19_ring_debiased] [float] NOT NULL,
	[t08_odd_feature_a19_ring_flag] [int] NOT NULL,
	[t08_odd_feature_a20_lens_or_arc_count] [int] NOT NULL,
	[t08_odd_feature_a20_lens_or_arc_weight] [float] NOT NULL,
	[t08_odd_feature_a20_lens_or_arc_fraction] [float] NOT NULL,
	[t08_odd_feature_a20_lens_or_arc_weighted_fraction] [float] NOT NULL,
	[t08_odd_feature_a20_lens_or_arc_debiased] [float] NOT NULL,
	[t08_odd_feature_a20_lens_or_arc_flag] [int] NOT NULL,
	[t08_odd_feature_a21_disturbed_count] [int] NOT NULL,
	[t08_odd_feature_a21_disturbed_weight] [float] NOT NULL,
	[t08_odd_feature_a21_disturbed_fraction] [float] NOT NULL,
	[t08_odd_feature_a21_disturbed_weighted_fraction] [float] NOT NULL,
	[t08_odd_feature_a21_disturbed_debiased] [float] NOT NULL,
	[t08_odd_feature_a21_disturbed_flag] [int] NOT NULL,
	[t08_odd_feature_a22_irregular_count] [int] NOT NULL,
	[t08_odd_feature_a22_irregular_weight] [float] NOT NULL,
	[t08_odd_feature_a22_irregular_fraction] [float] NOT NULL,
	[t08_odd_feature_a22_irregular_weighted_fraction] [float] NOT NULL,
	[t08_odd_feature_a22_irregular_debiased] [float] NOT NULL,
	[t08_odd_feature_a22_irregular_flag] [int] NOT NULL,
	[t08_odd_feature_a23_other_count] [int] NOT NULL,
	[t08_odd_feature_a23_other_weight] [float] NOT NULL,
	[t08_odd_feature_a23_other_fraction] [float] NOT NULL,
	[t08_odd_feature_a23_other_weighted_fraction] [float] NOT NULL,
	[t08_odd_feature_a23_other_debiased] [float] NOT NULL,
	[t08_odd_feature_a23_other_flag] [int] NOT NULL,
	[t08_odd_feature_a24_merger_count] [int] NOT NULL,
	[t08_odd_feature_a24_merger_weight] [float] NOT NULL,
	[t08_odd_feature_a24_merger_fraction] [float] NOT NULL,
	[t08_odd_feature_a24_merger_weighted_fraction] [float] NOT NULL,
	[t08_odd_feature_a24_merger_debiased] [float] NOT NULL,
	[t08_odd_feature_a24_merger_flag] [int] NOT NULL,
	[t08_odd_feature_a38_dust_lane_count] [int] NOT NULL,
	[t08_odd_feature_a38_dust_lane_weight] [float] NOT NULL,
	[t08_odd_feature_a38_dust_lane_fraction] [float] NOT NULL,
	[t08_odd_feature_a38_dust_lane_weighted_fraction] [float] NOT NULL,
	[t08_odd_feature_a38_dust_lane_debiased] [float] NOT NULL,
	[t08_odd_feature_a38_dust_lane_flag] [int] NOT NULL,
	[t09_bulge_shape_a25_rounded_count] [int] NOT NULL,
	[t09_bulge_shape_a25_rounded_weight] [float] NOT NULL,
	[t09_bulge_shape_a25_rounded_fraction] [float] NOT NULL,
	[t09_bulge_shape_a25_rounded_weighted_fraction] [float] NOT NULL,
	[t09_bulge_shape_a25_rounded_debiased] [float] NOT NULL,
	[t09_bulge_shape_a25_rounded_flag] [int] NOT NULL,
	[t09_bulge_shape_a26_boxy_count] [int] NOT NULL,
	[t09_bulge_shape_a26_boxy_weight] [float] NOT NULL,
	[t09_bulge_shape_a26_boxy_fraction] [float] NOT NULL,
	[t09_bulge_shape_a26_boxy_weighted_fraction] [float] NOT NULL,
	[t09_bulge_shape_a26_boxy_debiased] [float] NOT NULL,
	[t09_bulge_shape_a26_boxy_flag] [int] NOT NULL,
	[t09_bulge_shape_a27_no_bulge_count] [int] NOT NULL,
	[t09_bulge_shape_a27_no_bulge_weight] [float] NOT NULL,
	[t09_bulge_shape_a27_no_bulge_fraction] [float] NOT NULL,
	[t09_bulge_shape_a27_no_bulge_weighted_fraction] [float] NOT NULL,
	[t09_bulge_shape_a27_no_bulge_debiased] [float] NOT NULL,
	[t09_bulge_shape_a27_no_bulge_flag] [int] NOT NULL,
	[t10_arms_winding_a28_tight_count] [int] NOT NULL,
	[t10_arms_winding_a28_tight_weight] [float] NOT NULL,
	[t10_arms_winding_a28_tight_fraction] [float] NOT NULL,
	[t10_arms_winding_a28_tight_weighted_fraction] [float] NOT NULL,
	[t10_arms_winding_a28_tight_debiased] [float] NOT NULL,
	[t10_arms_winding_a28_tight_flag] [int] NOT NULL,
	[t10_arms_winding_a29_medium_count] [int] NOT NULL,
	[t10_arms_winding_a29_medium_weight] [float] NOT NULL,
	[t10_arms_winding_a29_medium_fraction] [float] NOT NULL,
	[t10_arms_winding_a29_medium_weighted_fraction] [float] NOT NULL,
	[t10_arms_winding_a29_medium_debiased] [float] NOT NULL,
	[t10_arms_winding_a29_medium_flag] [int] NOT NULL,
	[t10_arms_winding_a30_loose_count] [int] NOT NULL,
	[t10_arms_winding_a30_loose_weight] [float] NOT NULL,
	[t10_arms_winding_a30_loose_fraction] [float] NOT NULL,
	[t10_arms_winding_a30_loose_weighted_fraction] [float] NOT NULL,
	[t10_arms_winding_a30_loose_debiased] [float] NOT NULL,
	[t10_arms_winding_a30_loose_flag] [int] NOT NULL,
	[t11_arms_number_a31_1_count] [int] NOT NULL,
	[t11_arms_number_a31_1_weight] [float] NOT NULL,
	[t11_arms_number_a31_1_fraction] [float] NOT NULL,
	[t11_arms_number_a31_1_weighted_fraction] [float] NOT NULL,
	[t11_arms_number_a31_1_debiased] [float] NOT NULL,
	[t11_arms_number_a31_1_flag] [int] NOT NULL,
	[t11_arms_number_a32_2_count] [int] NOT NULL,
	[t11_arms_number_a32_2_weight] [float] NOT NULL,
	[t11_arms_number_a32_2_fraction] [float] NOT NULL,
	[t11_arms_number_a32_2_weighted_fraction] [float] NOT NULL,
	[t11_arms_number_a32_2_debiased] [float] NOT NULL,
	[t11_arms_number_a32_2_flag] [int] NOT NULL,
	[t11_arms_number_a33_3_count] [int] NOT NULL,
	[t11_arms_number_a33_3_weight] [float] NOT NULL,
	[t11_arms_number_a33_3_fraction] [float] NOT NULL,
	[t11_arms_number_a33_3_weighted_fraction] [float] NOT NULL,
	[t11_arms_number_a33_3_debiased] [float] NOT NULL,
	[t11_arms_number_a33_3_flag] [int] NOT NULL,
	[t11_arms_number_a34_4_count] [int] NOT NULL,
	[t11_arms_number_a34_4_weight] [float] NOT NULL,
	[t11_arms_number_a34_4_fraction] [float] NOT NULL,
	[t11_arms_number_a34_4_weighted_fraction] [float] NOT NULL,
	[t11_arms_number_a34_4_debiased] [float] NOT NULL,
	[t11_arms_number_a34_4_flag] [int] NOT NULL,
	[t11_arms_number_a36_more_than_4_count] [int] NOT NULL,
	[t11_arms_number_a36_more_than_4_weight] [float] NOT NULL,
	[t11_arms_number_a36_more_than_4_fraction] [float] NOT NULL,
	[t11_arms_number_a36_more_than_4_weighted_fraction] [float] NOT NULL,
	[t11_arms_number_a36_more_than_4_debiased] [float] NOT NULL,
	[t11_arms_number_a36_more_than_4_flag] [int] NOT NULL,
	[t11_arms_number_a37_cant_tell_count] [int] NOT NULL,
	[t11_arms_number_a37_cant_tell_weight] [float] NOT NULL,
	[t11_arms_number_a37_cant_tell_fraction] [float] NOT NULL,
	[t11_arms_number_a37_cant_tell_weighted_fraction] [float] NOT NULL,
	[t11_arms_number_a37_cant_tell_debiased] [float] NOT NULL,
	[t11_arms_number_a37_cant_tell_flag] [int] NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[zoo2Stripe82Coadd1]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zoo2Stripe82Coadd1](
	[specobjid] [bigint] NOT NULL,
	[stripe82objid] [bigint] NOT NULL,
	[dr8objid] [bigint] NOT NULL,
	[dr7objid] [bigint] NOT NULL,
	[ra] [real] NOT NULL,
	[dec] [real] NOT NULL,
	[rastring] [varchar](11) NOT NULL,
	[decstring] [varchar](11) NOT NULL,
	[sample] [varchar](32) NOT NULL,
	[total_classifications] [int] NOT NULL,
	[total_votes] [int] NOT NULL,
	[t01_smooth_or_features_a01_smooth_count] [int] NOT NULL,
	[t01_smooth_or_features_a01_smooth_weight] [float] NOT NULL,
	[t01_smooth_or_features_a01_smooth_fraction] [float] NOT NULL,
	[t01_smooth_or_features_a01_smooth_weighted_fraction] [float] NOT NULL,
	[t01_smooth_or_features_a01_smooth_debiased] [float] NOT NULL,
	[t01_smooth_or_features_a01_smooth_flag] [int] NOT NULL,
	[t01_smooth_or_features_a02_features_or_disk_count] [int] NOT NULL,
	[t01_smooth_or_features_a02_features_or_disk_weight] [float] NOT NULL,
	[t01_smooth_or_features_a02_features_or_disk_fraction] [float] NOT NULL,
	[t01_smooth_or_features_a02_features_or_disk_weighted_fraction] [float] NOT NULL,
	[t01_smooth_or_features_a02_features_or_disk_debiased] [float] NOT NULL,
	[t01_smooth_or_features_a02_features_or_disk_flag] [int] NOT NULL,
	[t01_smooth_or_features_a03_star_or_artifact_count] [int] NOT NULL,
	[t01_smooth_or_features_a03_star_or_artifact_weight] [float] NOT NULL,
	[t01_smooth_or_features_a03_star_or_artifact_fraction] [float] NOT NULL,
	[t01_smooth_or_features_a03_star_or_artifact_weighted_fraction] [float] NOT NULL,
	[t01_smooth_or_features_a03_star_or_artifact_debiased] [float] NOT NULL,
	[t01_smooth_or_features_a03_star_or_artifact_flag] [int] NOT NULL,
	[t02_edgeon_a04_yes_count] [int] NOT NULL,
	[t02_edgeon_a04_yes_weight] [float] NOT NULL,
	[t02_edgeon_a04_yes_fraction] [float] NOT NULL,
	[t02_edgeon_a04_yes_weighted_fraction] [float] NOT NULL,
	[t02_edgeon_a04_yes_debiased] [float] NOT NULL,
	[t02_edgeon_a04_yes_flag] [int] NOT NULL,
	[t02_edgeon_a05_no_count] [int] NOT NULL,
	[t02_edgeon_a05_no_weight] [float] NOT NULL,
	[t02_edgeon_a05_no_fraction] [float] NOT NULL,
	[t02_edgeon_a05_no_weighted_fraction] [float] NOT NULL,
	[t02_edgeon_a05_no_debiased] [float] NOT NULL,
	[t02_edgeon_a05_no_flag] [int] NOT NULL,
	[t03_bar_a06_bar_count] [int] NOT NULL,
	[t03_bar_a06_bar_weight] [float] NOT NULL,
	[t03_bar_a06_bar_fraction] [float] NOT NULL,
	[t03_bar_a06_bar_weighted_fraction] [float] NOT NULL,
	[t03_bar_a06_bar_debiased] [float] NOT NULL,
	[t03_bar_a06_bar_flag] [int] NOT NULL,
	[t03_bar_a07_no_bar_count] [int] NOT NULL,
	[t03_bar_a07_no_bar_weight] [float] NOT NULL,
	[t03_bar_a07_no_bar_fraction] [float] NOT NULL,
	[t03_bar_a07_no_bar_weighted_fraction] [float] NOT NULL,
	[t03_bar_a07_no_bar_debiased] [float] NOT NULL,
	[t03_bar_a07_no_bar_flag] [int] NOT NULL,
	[t04_spiral_a08_spiral_count] [int] NOT NULL,
	[t04_spiral_a08_spiral_weight] [float] NOT NULL,
	[t04_spiral_a08_spiral_fraction] [float] NOT NULL,
	[t04_spiral_a08_spiral_weighted_fraction] [float] NOT NULL,
	[t04_spiral_a08_spiral_debiased] [float] NOT NULL,
	[t04_spiral_a08_spiral_flag] [int] NOT NULL,
	[t04_spiral_a09_no_spiral_count] [int] NOT NULL,
	[t04_spiral_a09_no_spiral_weight] [float] NOT NULL,
	[t04_spiral_a09_no_spiral_fraction] [float] NOT NULL,
	[t04_spiral_a09_no_spiral_weighted_fraction] [float] NOT NULL,
	[t04_spiral_a09_no_spiral_debiased] [float] NOT NULL,
	[t04_spiral_a09_no_spiral_flag] [int] NOT NULL,
	[t05_bulge_prominence_a10_no_bulge_count] [int] NOT NULL,
	[t05_bulge_prominence_a10_no_bulge_weight] [float] NOT NULL,
	[t05_bulge_prominence_a10_no_bulge_fraction] [float] NOT NULL,
	[t05_bulge_prominence_a10_no_bulge_weighted_fraction] [float] NOT NULL,
	[t05_bulge_prominence_a10_no_bulge_debiased] [float] NOT NULL,
	[t05_bulge_prominence_a10_no_bulge_flag] [int] NOT NULL,
	[t05_bulge_prominence_a11_just_noticeable_count] [int] NOT NULL,
	[t05_bulge_prominence_a11_just_noticeable_weight] [float] NOT NULL,
	[t05_bulge_prominence_a11_just_noticeable_fraction] [float] NOT NULL,
	[t05_bulge_prominence_a11_just_noticeable_weighted_fraction] [float] NOT NULL,
	[t05_bulge_prominence_a11_just_noticeable_debiased] [float] NOT NULL,
	[t05_bulge_prominence_a11_just_noticeable_flag] [int] NOT NULL,
	[t05_bulge_prominence_a12_obvious_count] [int] NOT NULL,
	[t05_bulge_prominence_a12_obvious_weight] [float] NOT NULL,
	[t05_bulge_prominence_a12_obvious_fraction] [float] NOT NULL,
	[t05_bulge_prominence_a12_obvious_weighted_fraction] [float] NOT NULL,
	[t05_bulge_prominence_a12_obvious_debiased] [float] NOT NULL,
	[t05_bulge_prominence_a12_obvious_flag] [int] NOT NULL,
	[t05_bulge_prominence_a13_dominant_count] [int] NOT NULL,
	[t05_bulge_prominence_a13_dominant_weight] [float] NOT NULL,
	[t05_bulge_prominence_a13_dominant_fraction] [float] NOT NULL,
	[t05_bulge_prominence_a13_dominant_weighted_fraction] [float] NOT NULL,
	[t05_bulge_prominence_a13_dominant_debiased] [float] NOT NULL,
	[t05_bulge_prominence_a13_dominant_flag] [int] NOT NULL,
	[t06_odd_a14_yes_count] [int] NOT NULL,
	[t06_odd_a14_yes_weight] [float] NOT NULL,
	[t06_odd_a14_yes_fraction] [float] NOT NULL,
	[t06_odd_a14_yes_weighted_fraction] [float] NOT NULL,
	[t06_odd_a14_yes_debiased] [float] NOT NULL,
	[t06_odd_a14_yes_flag] [int] NOT NULL,
	[t06_odd_a15_no_count] [int] NOT NULL,
	[t06_odd_a15_no_weight] [float] NOT NULL,
	[t06_odd_a15_no_fraction] [float] NOT NULL,
	[t06_odd_a15_no_weighted_fraction] [float] NOT NULL,
	[t06_odd_a15_no_debiased] [float] NOT NULL,
	[t06_odd_a15_no_flag] [int] NOT NULL,
	[t07_rounded_a16_completely_round_count] [int] NOT NULL,
	[t07_rounded_a16_completely_round_weight] [float] NOT NULL,
	[t07_rounded_a16_completely_round_fraction] [float] NOT NULL,
	[t07_rounded_a16_completely_round_weighted_fraction] [float] NOT NULL,
	[t07_rounded_a16_completely_round_debiased] [float] NOT NULL,
	[t07_rounded_a16_completely_round_flag] [int] NOT NULL,
	[t07_rounded_a17_in_between_count] [int] NOT NULL,
	[t07_rounded_a17_in_between_weight] [float] NOT NULL,
	[t07_rounded_a17_in_between_fraction] [float] NOT NULL,
	[t07_rounded_a17_in_between_weighted_fraction] [float] NOT NULL,
	[t07_rounded_a17_in_between_debiased] [float] NOT NULL,
	[t07_rounded_a17_in_between_flag] [int] NOT NULL,
	[t07_rounded_a18_cigar_shaped_count] [int] NOT NULL,
	[t07_rounded_a18_cigar_shaped_weight] [float] NOT NULL,
	[t07_rounded_a18_cigar_shaped_fraction] [float] NOT NULL,
	[t07_rounded_a18_cigar_shaped_weighted_fraction] [float] NOT NULL,
	[t07_rounded_a18_cigar_shaped_debiased] [float] NOT NULL,
	[t07_rounded_a18_cigar_shaped_flag] [int] NOT NULL,
	[t08_odd_feature_a19_ring_count] [int] NOT NULL,
	[t08_odd_feature_a19_ring_weight] [float] NOT NULL,
	[t08_odd_feature_a19_ring_fraction] [float] NOT NULL,
	[t08_odd_feature_a19_ring_weighted_fraction] [float] NOT NULL,
	[t08_odd_feature_a19_ring_debiased] [float] NOT NULL,
	[t08_odd_feature_a19_ring_flag] [int] NOT NULL,
	[t08_odd_feature_a20_lens_or_arc_count] [int] NOT NULL,
	[t08_odd_feature_a20_lens_or_arc_weight] [float] NOT NULL,
	[t08_odd_feature_a20_lens_or_arc_fraction] [float] NOT NULL,
	[t08_odd_feature_a20_lens_or_arc_weighted_fraction] [float] NOT NULL,
	[t08_odd_feature_a20_lens_or_arc_debiased] [float] NOT NULL,
	[t08_odd_feature_a20_lens_or_arc_flag] [int] NOT NULL,
	[t08_odd_feature_a21_disturbed_count] [int] NOT NULL,
	[t08_odd_feature_a21_disturbed_weight] [float] NOT NULL,
	[t08_odd_feature_a21_disturbed_fraction] [float] NOT NULL,
	[t08_odd_feature_a21_disturbed_weighted_fraction] [float] NOT NULL,
	[t08_odd_feature_a21_disturbed_debiased] [float] NOT NULL,
	[t08_odd_feature_a21_disturbed_flag] [int] NOT NULL,
	[t08_odd_feature_a22_irregular_count] [int] NOT NULL,
	[t08_odd_feature_a22_irregular_weight] [float] NOT NULL,
	[t08_odd_feature_a22_irregular_fraction] [float] NOT NULL,
	[t08_odd_feature_a22_irregular_weighted_fraction] [float] NOT NULL,
	[t08_odd_feature_a22_irregular_debiased] [float] NOT NULL,
	[t08_odd_feature_a22_irregular_flag] [int] NOT NULL,
	[t08_odd_feature_a23_other_count] [int] NOT NULL,
	[t08_odd_feature_a23_other_weight] [float] NOT NULL,
	[t08_odd_feature_a23_other_fraction] [float] NOT NULL,
	[t08_odd_feature_a23_other_weighted_fraction] [float] NOT NULL,
	[t08_odd_feature_a23_other_debiased] [float] NOT NULL,
	[t08_odd_feature_a23_other_flag] [int] NOT NULL,
	[t08_odd_feature_a24_merger_count] [int] NOT NULL,
	[t08_odd_feature_a24_merger_weight] [float] NOT NULL,
	[t08_odd_feature_a24_merger_fraction] [float] NOT NULL,
	[t08_odd_feature_a24_merger_weighted_fraction] [float] NOT NULL,
	[t08_odd_feature_a24_merger_debiased] [float] NOT NULL,
	[t08_odd_feature_a24_merger_flag] [int] NOT NULL,
	[t08_odd_feature_a38_dust_lane_count] [int] NOT NULL,
	[t08_odd_feature_a38_dust_lane_weight] [float] NOT NULL,
	[t08_odd_feature_a38_dust_lane_fraction] [float] NOT NULL,
	[t08_odd_feature_a38_dust_lane_weighted_fraction] [float] NOT NULL,
	[t08_odd_feature_a38_dust_lane_debiased] [float] NOT NULL,
	[t08_odd_feature_a38_dust_lane_flag] [int] NOT NULL,
	[t09_bulge_shape_a25_rounded_count] [int] NOT NULL,
	[t09_bulge_shape_a25_rounded_weight] [float] NOT NULL,
	[t09_bulge_shape_a25_rounded_fraction] [float] NOT NULL,
	[t09_bulge_shape_a25_rounded_weighted_fraction] [float] NOT NULL,
	[t09_bulge_shape_a25_rounded_debiased] [float] NOT NULL,
	[t09_bulge_shape_a25_rounded_flag] [int] NOT NULL,
	[t09_bulge_shape_a26_boxy_count] [int] NOT NULL,
	[t09_bulge_shape_a26_boxy_weight] [float] NOT NULL,
	[t09_bulge_shape_a26_boxy_fraction] [float] NOT NULL,
	[t09_bulge_shape_a26_boxy_weighted_fraction] [float] NOT NULL,
	[t09_bulge_shape_a26_boxy_debiased] [float] NOT NULL,
	[t09_bulge_shape_a26_boxy_flag] [int] NOT NULL,
	[t09_bulge_shape_a27_no_bulge_count] [int] NOT NULL,
	[t09_bulge_shape_a27_no_bulge_weight] [float] NOT NULL,
	[t09_bulge_shape_a27_no_bulge_fraction] [float] NOT NULL,
	[t09_bulge_shape_a27_no_bulge_weighted_fraction] [float] NOT NULL,
	[t09_bulge_shape_a27_no_bulge_debiased] [float] NOT NULL,
	[t09_bulge_shape_a27_no_bulge_flag] [int] NOT NULL,
	[t10_arms_winding_a28_tight_count] [int] NOT NULL,
	[t10_arms_winding_a28_tight_weight] [float] NOT NULL,
	[t10_arms_winding_a28_tight_fraction] [float] NOT NULL,
	[t10_arms_winding_a28_tight_weighted_fraction] [float] NOT NULL,
	[t10_arms_winding_a28_tight_debiased] [float] NOT NULL,
	[t10_arms_winding_a28_tight_flag] [int] NOT NULL,
	[t10_arms_winding_a29_medium_count] [int] NOT NULL,
	[t10_arms_winding_a29_medium_weight] [float] NOT NULL,
	[t10_arms_winding_a29_medium_fraction] [float] NOT NULL,
	[t10_arms_winding_a29_medium_weighted_fraction] [float] NOT NULL,
	[t10_arms_winding_a29_medium_debiased] [float] NOT NULL,
	[t10_arms_winding_a29_medium_flag] [int] NOT NULL,
	[t10_arms_winding_a30_loose_count] [int] NOT NULL,
	[t10_arms_winding_a30_loose_weight] [float] NOT NULL,
	[t10_arms_winding_a30_loose_fraction] [float] NOT NULL,
	[t10_arms_winding_a30_loose_weighted_fraction] [float] NOT NULL,
	[t10_arms_winding_a30_loose_debiased] [float] NOT NULL,
	[t10_arms_winding_a30_loose_flag] [int] NOT NULL,
	[t11_arms_number_a31_1_count] [int] NOT NULL,
	[t11_arms_number_a31_1_weight] [float] NOT NULL,
	[t11_arms_number_a31_1_fraction] [float] NOT NULL,
	[t11_arms_number_a31_1_weighted_fraction] [float] NOT NULL,
	[t11_arms_number_a31_1_debiased] [float] NOT NULL,
	[t11_arms_number_a31_1_flag] [int] NOT NULL,
	[t11_arms_number_a32_2_count] [int] NOT NULL,
	[t11_arms_number_a32_2_weight] [float] NOT NULL,
	[t11_arms_number_a32_2_fraction] [float] NOT NULL,
	[t11_arms_number_a32_2_weighted_fraction] [float] NOT NULL,
	[t11_arms_number_a32_2_debiased] [float] NOT NULL,
	[t11_arms_number_a32_2_flag] [int] NOT NULL,
	[t11_arms_number_a33_3_count] [int] NOT NULL,
	[t11_arms_number_a33_3_weight] [float] NOT NULL,
	[t11_arms_number_a33_3_fraction] [float] NOT NULL,
	[t11_arms_number_a33_3_weighted_fraction] [float] NOT NULL,
	[t11_arms_number_a33_3_debiased] [float] NOT NULL,
	[t11_arms_number_a33_3_flag] [int] NOT NULL,
	[t11_arms_number_a34_4_count] [int] NOT NULL,
	[t11_arms_number_a34_4_weight] [float] NOT NULL,
	[t11_arms_number_a34_4_fraction] [float] NOT NULL,
	[t11_arms_number_a34_4_weighted_fraction] [float] NOT NULL,
	[t11_arms_number_a34_4_debiased] [float] NOT NULL,
	[t11_arms_number_a34_4_flag] [int] NOT NULL,
	[t11_arms_number_a36_more_than_4_count] [int] NOT NULL,
	[t11_arms_number_a36_more_than_4_weight] [float] NOT NULL,
	[t11_arms_number_a36_more_than_4_fraction] [float] NOT NULL,
	[t11_arms_number_a36_more_than_4_weighted_fraction] [float] NOT NULL,
	[t11_arms_number_a36_more_than_4_debiased] [float] NOT NULL,
	[t11_arms_number_a36_more_than_4_flag] [int] NOT NULL,
	[t11_arms_number_a37_cant_tell_count] [int] NOT NULL,
	[t11_arms_number_a37_cant_tell_weight] [float] NOT NULL,
	[t11_arms_number_a37_cant_tell_fraction] [float] NOT NULL,
	[t11_arms_number_a37_cant_tell_weighted_fraction] [float] NOT NULL,
	[t11_arms_number_a37_cant_tell_debiased] [float] NOT NULL,
	[t11_arms_number_a37_cant_tell_flag] [int] NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[zoo2Stripe82Coadd2]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zoo2Stripe82Coadd2](
	[specobjid] [bigint] NOT NULL,
	[stripe82objid] [bigint] NOT NULL,
	[dr8objid] [bigint] NOT NULL,
	[dr7objid] [bigint] NOT NULL,
	[ra] [real] NOT NULL,
	[dec] [real] NOT NULL,
	[rastring] [varchar](11) NOT NULL,
	[decstring] [varchar](11) NOT NULL,
	[sample] [varchar](32) NOT NULL,
	[total_classifications] [int] NOT NULL,
	[total_votes] [int] NOT NULL,
	[t01_smooth_or_features_a01_smooth_count] [int] NOT NULL,
	[t01_smooth_or_features_a01_smooth_weight] [float] NOT NULL,
	[t01_smooth_or_features_a01_smooth_fraction] [float] NOT NULL,
	[t01_smooth_or_features_a01_smooth_weighted_fraction] [float] NOT NULL,
	[t01_smooth_or_features_a01_smooth_debiased] [float] NOT NULL,
	[t01_smooth_or_features_a01_smooth_flag] [int] NOT NULL,
	[t01_smooth_or_features_a02_features_or_disk_count] [int] NOT NULL,
	[t01_smooth_or_features_a02_features_or_disk_weight] [float] NOT NULL,
	[t01_smooth_or_features_a02_features_or_disk_fraction] [float] NOT NULL,
	[t01_smooth_or_features_a02_features_or_disk_weighted_fraction] [float] NOT NULL,
	[t01_smooth_or_features_a02_features_or_disk_debiased] [float] NOT NULL,
	[t01_smooth_or_features_a02_features_or_disk_flag] [int] NOT NULL,
	[t01_smooth_or_features_a03_star_or_artifact_count] [int] NOT NULL,
	[t01_smooth_or_features_a03_star_or_artifact_weight] [float] NOT NULL,
	[t01_smooth_or_features_a03_star_or_artifact_fraction] [float] NOT NULL,
	[t01_smooth_or_features_a03_star_or_artifact_weighted_fraction] [float] NOT NULL,
	[t01_smooth_or_features_a03_star_or_artifact_debiased] [float] NOT NULL,
	[t01_smooth_or_features_a03_star_or_artifact_flag] [int] NOT NULL,
	[t02_edgeon_a04_yes_count] [int] NOT NULL,
	[t02_edgeon_a04_yes_weight] [float] NOT NULL,
	[t02_edgeon_a04_yes_fraction] [float] NOT NULL,
	[t02_edgeon_a04_yes_weighted_fraction] [float] NOT NULL,
	[t02_edgeon_a04_yes_debiased] [float] NOT NULL,
	[t02_edgeon_a04_yes_flag] [int] NOT NULL,
	[t02_edgeon_a05_no_count] [int] NOT NULL,
	[t02_edgeon_a05_no_weight] [float] NOT NULL,
	[t02_edgeon_a05_no_fraction] [float] NOT NULL,
	[t02_edgeon_a05_no_weighted_fraction] [float] NOT NULL,
	[t02_edgeon_a05_no_debiased] [float] NOT NULL,
	[t02_edgeon_a05_no_flag] [int] NOT NULL,
	[t03_bar_a06_bar_count] [int] NOT NULL,
	[t03_bar_a06_bar_weight] [float] NOT NULL,
	[t03_bar_a06_bar_fraction] [float] NOT NULL,
	[t03_bar_a06_bar_weighted_fraction] [float] NOT NULL,
	[t03_bar_a06_bar_debiased] [float] NOT NULL,
	[t03_bar_a06_bar_flag] [int] NOT NULL,
	[t03_bar_a07_no_bar_count] [int] NOT NULL,
	[t03_bar_a07_no_bar_weight] [float] NOT NULL,
	[t03_bar_a07_no_bar_fraction] [float] NOT NULL,
	[t03_bar_a07_no_bar_weighted_fraction] [float] NOT NULL,
	[t03_bar_a07_no_bar_debiased] [float] NOT NULL,
	[t03_bar_a07_no_bar_flag] [int] NOT NULL,
	[t04_spiral_a08_spiral_count] [int] NOT NULL,
	[t04_spiral_a08_spiral_weight] [float] NOT NULL,
	[t04_spiral_a08_spiral_fraction] [float] NOT NULL,
	[t04_spiral_a08_spiral_weighted_fraction] [float] NOT NULL,
	[t04_spiral_a08_spiral_debiased] [float] NOT NULL,
	[t04_spiral_a08_spiral_flag] [int] NOT NULL,
	[t04_spiral_a09_no_spiral_count] [int] NOT NULL,
	[t04_spiral_a09_no_spiral_weight] [float] NOT NULL,
	[t04_spiral_a09_no_spiral_fraction] [float] NOT NULL,
	[t04_spiral_a09_no_spiral_weighted_fraction] [float] NOT NULL,
	[t04_spiral_a09_no_spiral_debiased] [float] NOT NULL,
	[t04_spiral_a09_no_spiral_flag] [int] NOT NULL,
	[t05_bulge_prominence_a10_no_bulge_count] [int] NOT NULL,
	[t05_bulge_prominence_a10_no_bulge_weight] [float] NOT NULL,
	[t05_bulge_prominence_a10_no_bulge_fraction] [float] NOT NULL,
	[t05_bulge_prominence_a10_no_bulge_weighted_fraction] [float] NOT NULL,
	[t05_bulge_prominence_a10_no_bulge_debiased] [float] NOT NULL,
	[t05_bulge_prominence_a10_no_bulge_flag] [int] NOT NULL,
	[t05_bulge_prominence_a11_just_noticeable_count] [int] NOT NULL,
	[t05_bulge_prominence_a11_just_noticeable_weight] [float] NOT NULL,
	[t05_bulge_prominence_a11_just_noticeable_fraction] [float] NOT NULL,
	[t05_bulge_prominence_a11_just_noticeable_weighted_fraction] [float] NOT NULL,
	[t05_bulge_prominence_a11_just_noticeable_debiased] [float] NOT NULL,
	[t05_bulge_prominence_a11_just_noticeable_flag] [int] NOT NULL,
	[t05_bulge_prominence_a12_obvious_count] [int] NOT NULL,
	[t05_bulge_prominence_a12_obvious_weight] [float] NOT NULL,
	[t05_bulge_prominence_a12_obvious_fraction] [float] NOT NULL,
	[t05_bulge_prominence_a12_obvious_weighted_fraction] [float] NOT NULL,
	[t05_bulge_prominence_a12_obvious_debiased] [float] NOT NULL,
	[t05_bulge_prominence_a12_obvious_flag] [int] NOT NULL,
	[t05_bulge_prominence_a13_dominant_count] [int] NOT NULL,
	[t05_bulge_prominence_a13_dominant_weight] [float] NOT NULL,
	[t05_bulge_prominence_a13_dominant_fraction] [float] NOT NULL,
	[t05_bulge_prominence_a13_dominant_weighted_fraction] [float] NOT NULL,
	[t05_bulge_prominence_a13_dominant_debiased] [float] NOT NULL,
	[t05_bulge_prominence_a13_dominant_flag] [int] NOT NULL,
	[t06_odd_a14_yes_count] [int] NOT NULL,
	[t06_odd_a14_yes_weight] [float] NOT NULL,
	[t06_odd_a14_yes_fraction] [float] NOT NULL,
	[t06_odd_a14_yes_weighted_fraction] [float] NOT NULL,
	[t06_odd_a14_yes_debiased] [float] NOT NULL,
	[t06_odd_a14_yes_flag] [int] NOT NULL,
	[t06_odd_a15_no_count] [int] NOT NULL,
	[t06_odd_a15_no_weight] [float] NOT NULL,
	[t06_odd_a15_no_fraction] [float] NOT NULL,
	[t06_odd_a15_no_weighted_fraction] [float] NOT NULL,
	[t06_odd_a15_no_debiased] [float] NOT NULL,
	[t06_odd_a15_no_flag] [int] NOT NULL,
	[t07_rounded_a16_completely_round_count] [int] NOT NULL,
	[t07_rounded_a16_completely_round_weight] [float] NOT NULL,
	[t07_rounded_a16_completely_round_fraction] [float] NOT NULL,
	[t07_rounded_a16_completely_round_weighted_fraction] [float] NOT NULL,
	[t07_rounded_a16_completely_round_debiased] [float] NOT NULL,
	[t07_rounded_a16_completely_round_flag] [int] NOT NULL,
	[t07_rounded_a17_in_between_count] [int] NOT NULL,
	[t07_rounded_a17_in_between_weight] [float] NOT NULL,
	[t07_rounded_a17_in_between_fraction] [float] NOT NULL,
	[t07_rounded_a17_in_between_weighted_fraction] [float] NOT NULL,
	[t07_rounded_a17_in_between_debiased] [float] NOT NULL,
	[t07_rounded_a17_in_between_flag] [int] NOT NULL,
	[t07_rounded_a18_cigar_shaped_count] [int] NOT NULL,
	[t07_rounded_a18_cigar_shaped_weight] [float] NOT NULL,
	[t07_rounded_a18_cigar_shaped_fraction] [float] NOT NULL,
	[t07_rounded_a18_cigar_shaped_weighted_fraction] [float] NOT NULL,
	[t07_rounded_a18_cigar_shaped_debiased] [float] NOT NULL,
	[t07_rounded_a18_cigar_shaped_flag] [int] NOT NULL,
	[t08_odd_feature_a19_ring_count] [int] NOT NULL,
	[t08_odd_feature_a19_ring_weight] [float] NOT NULL,
	[t08_odd_feature_a19_ring_fraction] [float] NOT NULL,
	[t08_odd_feature_a19_ring_weighted_fraction] [float] NOT NULL,
	[t08_odd_feature_a19_ring_debiased] [float] NOT NULL,
	[t08_odd_feature_a19_ring_flag] [int] NOT NULL,
	[t08_odd_feature_a20_lens_or_arc_count] [int] NOT NULL,
	[t08_odd_feature_a20_lens_or_arc_weight] [float] NOT NULL,
	[t08_odd_feature_a20_lens_or_arc_fraction] [float] NOT NULL,
	[t08_odd_feature_a20_lens_or_arc_weighted_fraction] [float] NOT NULL,
	[t08_odd_feature_a20_lens_or_arc_debiased] [float] NOT NULL,
	[t08_odd_feature_a20_lens_or_arc_flag] [int] NOT NULL,
	[t08_odd_feature_a21_disturbed_count] [int] NOT NULL,
	[t08_odd_feature_a21_disturbed_weight] [float] NOT NULL,
	[t08_odd_feature_a21_disturbed_fraction] [float] NOT NULL,
	[t08_odd_feature_a21_disturbed_weighted_fraction] [float] NOT NULL,
	[t08_odd_feature_a21_disturbed_debiased] [float] NOT NULL,
	[t08_odd_feature_a21_disturbed_flag] [int] NOT NULL,
	[t08_odd_feature_a22_irregular_count] [int] NOT NULL,
	[t08_odd_feature_a22_irregular_weight] [float] NOT NULL,
	[t08_odd_feature_a22_irregular_fraction] [float] NOT NULL,
	[t08_odd_feature_a22_irregular_weighted_fraction] [float] NOT NULL,
	[t08_odd_feature_a22_irregular_debiased] [float] NOT NULL,
	[t08_odd_feature_a22_irregular_flag] [int] NOT NULL,
	[t08_odd_feature_a23_other_count] [int] NOT NULL,
	[t08_odd_feature_a23_other_weight] [float] NOT NULL,
	[t08_odd_feature_a23_other_fraction] [float] NOT NULL,
	[t08_odd_feature_a23_other_weighted_fraction] [float] NOT NULL,
	[t08_odd_feature_a23_other_debiased] [float] NOT NULL,
	[t08_odd_feature_a23_other_flag] [int] NOT NULL,
	[t08_odd_feature_a24_merger_count] [int] NOT NULL,
	[t08_odd_feature_a24_merger_weight] [float] NOT NULL,
	[t08_odd_feature_a24_merger_fraction] [float] NOT NULL,
	[t08_odd_feature_a24_merger_weighted_fraction] [float] NOT NULL,
	[t08_odd_feature_a24_merger_debiased] [float] NOT NULL,
	[t08_odd_feature_a24_merger_flag] [int] NOT NULL,
	[t08_odd_feature_a38_dust_lane_count] [int] NOT NULL,
	[t08_odd_feature_a38_dust_lane_weight] [float] NOT NULL,
	[t08_odd_feature_a38_dust_lane_fraction] [float] NOT NULL,
	[t08_odd_feature_a38_dust_lane_weighted_fraction] [float] NOT NULL,
	[t08_odd_feature_a38_dust_lane_debiased] [float] NOT NULL,
	[t08_odd_feature_a38_dust_lane_flag] [int] NOT NULL,
	[t09_bulge_shape_a25_rounded_count] [int] NOT NULL,
	[t09_bulge_shape_a25_rounded_weight] [float] NOT NULL,
	[t09_bulge_shape_a25_rounded_fraction] [float] NOT NULL,
	[t09_bulge_shape_a25_rounded_weighted_fraction] [float] NOT NULL,
	[t09_bulge_shape_a25_rounded_debiased] [float] NOT NULL,
	[t09_bulge_shape_a25_rounded_flag] [int] NOT NULL,
	[t09_bulge_shape_a26_boxy_count] [int] NOT NULL,
	[t09_bulge_shape_a26_boxy_weight] [float] NOT NULL,
	[t09_bulge_shape_a26_boxy_fraction] [float] NOT NULL,
	[t09_bulge_shape_a26_boxy_weighted_fraction] [float] NOT NULL,
	[t09_bulge_shape_a26_boxy_debiased] [float] NOT NULL,
	[t09_bulge_shape_a26_boxy_flag] [int] NOT NULL,
	[t09_bulge_shape_a27_no_bulge_count] [int] NOT NULL,
	[t09_bulge_shape_a27_no_bulge_weight] [float] NOT NULL,
	[t09_bulge_shape_a27_no_bulge_fraction] [float] NOT NULL,
	[t09_bulge_shape_a27_no_bulge_weighted_fraction] [float] NOT NULL,
	[t09_bulge_shape_a27_no_bulge_debiased] [float] NOT NULL,
	[t09_bulge_shape_a27_no_bulge_flag] [int] NOT NULL,
	[t10_arms_winding_a28_tight_count] [int] NOT NULL,
	[t10_arms_winding_a28_tight_weight] [float] NOT NULL,
	[t10_arms_winding_a28_tight_fraction] [float] NOT NULL,
	[t10_arms_winding_a28_tight_weighted_fraction] [float] NOT NULL,
	[t10_arms_winding_a28_tight_debiased] [float] NOT NULL,
	[t10_arms_winding_a28_tight_flag] [int] NOT NULL,
	[t10_arms_winding_a29_medium_count] [int] NOT NULL,
	[t10_arms_winding_a29_medium_weight] [float] NOT NULL,
	[t10_arms_winding_a29_medium_fraction] [float] NOT NULL,
	[t10_arms_winding_a29_medium_weighted_fraction] [float] NOT NULL,
	[t10_arms_winding_a29_medium_debiased] [float] NOT NULL,
	[t10_arms_winding_a29_medium_flag] [int] NOT NULL,
	[t10_arms_winding_a30_loose_count] [int] NOT NULL,
	[t10_arms_winding_a30_loose_weight] [float] NOT NULL,
	[t10_arms_winding_a30_loose_fraction] [float] NOT NULL,
	[t10_arms_winding_a30_loose_weighted_fraction] [float] NOT NULL,
	[t10_arms_winding_a30_loose_debiased] [float] NOT NULL,
	[t10_arms_winding_a30_loose_flag] [int] NOT NULL,
	[t11_arms_number_a31_1_count] [int] NOT NULL,
	[t11_arms_number_a31_1_weight] [float] NOT NULL,
	[t11_arms_number_a31_1_fraction] [float] NOT NULL,
	[t11_arms_number_a31_1_weighted_fraction] [float] NOT NULL,
	[t11_arms_number_a31_1_debiased] [float] NOT NULL,
	[t11_arms_number_a31_1_flag] [int] NOT NULL,
	[t11_arms_number_a32_2_count] [int] NOT NULL,
	[t11_arms_number_a32_2_weight] [float] NOT NULL,
	[t11_arms_number_a32_2_fraction] [float] NOT NULL,
	[t11_arms_number_a32_2_weighted_fraction] [float] NOT NULL,
	[t11_arms_number_a32_2_debiased] [float] NOT NULL,
	[t11_arms_number_a32_2_flag] [int] NOT NULL,
	[t11_arms_number_a33_3_count] [int] NOT NULL,
	[t11_arms_number_a33_3_weight] [float] NOT NULL,
	[t11_arms_number_a33_3_fraction] [float] NOT NULL,
	[t11_arms_number_a33_3_weighted_fraction] [float] NOT NULL,
	[t11_arms_number_a33_3_debiased] [float] NOT NULL,
	[t11_arms_number_a33_3_flag] [int] NOT NULL,
	[t11_arms_number_a34_4_count] [int] NOT NULL,
	[t11_arms_number_a34_4_weight] [float] NOT NULL,
	[t11_arms_number_a34_4_fraction] [float] NOT NULL,
	[t11_arms_number_a34_4_weighted_fraction] [float] NOT NULL,
	[t11_arms_number_a34_4_debiased] [float] NOT NULL,
	[t11_arms_number_a34_4_flag] [int] NOT NULL,
	[t11_arms_number_a36_more_than_4_count] [int] NOT NULL,
	[t11_arms_number_a36_more_than_4_weight] [float] NOT NULL,
	[t11_arms_number_a36_more_than_4_fraction] [float] NOT NULL,
	[t11_arms_number_a36_more_than_4_weighted_fraction] [float] NOT NULL,
	[t11_arms_number_a36_more_than_4_debiased] [float] NOT NULL,
	[t11_arms_number_a36_more_than_4_flag] [int] NOT NULL,
	[t11_arms_number_a37_cant_tell_count] [int] NOT NULL,
	[t11_arms_number_a37_cant_tell_weight] [float] NOT NULL,
	[t11_arms_number_a37_cant_tell_fraction] [float] NOT NULL,
	[t11_arms_number_a37_cant_tell_weighted_fraction] [float] NOT NULL,
	[t11_arms_number_a37_cant_tell_debiased] [float] NOT NULL,
	[t11_arms_number_a37_cant_tell_flag] [int] NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[zoo2Stripe82Normal]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zoo2Stripe82Normal](
	[specobjid] [bigint] NOT NULL,
	[dr8objid] [bigint] NOT NULL,
	[dr7objid] [bigint] NOT NULL,
	[ra] [real] NOT NULL,
	[dec] [real] NOT NULL,
	[rastring] [varchar](16) NOT NULL,
	[decstring] [varchar](16) NOT NULL,
	[sample] [varchar](32) NOT NULL,
	[total_classifications] [int] NOT NULL,
	[total_votes] [int] NOT NULL,
	[t01_smooth_or_features_a01_smooth_count] [int] NOT NULL,
	[t01_smooth_or_features_a01_smooth_weight] [float] NOT NULL,
	[t01_smooth_or_features_a01_smooth_fraction] [float] NOT NULL,
	[t01_smooth_or_features_a01_smooth_weighted_fraction] [float] NOT NULL,
	[t01_smooth_or_features_a01_smooth_debiased] [float] NOT NULL,
	[t01_smooth_or_features_a01_smooth_flag] [int] NOT NULL,
	[t01_smooth_or_features_a02_features_or_disk_count] [int] NOT NULL,
	[t01_smooth_or_features_a02_features_or_disk_weight] [float] NOT NULL,
	[t01_smooth_or_features_a02_features_or_disk_fraction] [float] NOT NULL,
	[t01_smooth_or_features_a02_features_or_disk_weighted_fraction] [float] NOT NULL,
	[t01_smooth_or_features_a02_features_or_disk_debiased] [float] NOT NULL,
	[t01_smooth_or_features_a02_features_or_disk_flag] [int] NOT NULL,
	[t01_smooth_or_features_a03_star_or_artifact_count] [int] NOT NULL,
	[t01_smooth_or_features_a03_star_or_artifact_weight] [float] NOT NULL,
	[t01_smooth_or_features_a03_star_or_artifact_fraction] [float] NOT NULL,
	[t01_smooth_or_features_a03_star_or_artifact_weighted_fraction] [float] NOT NULL,
	[t01_smooth_or_features_a03_star_or_artifact_debiased] [float] NOT NULL,
	[t01_smooth_or_features_a03_star_or_artifact_flag] [int] NOT NULL,
	[t02_edgeon_a04_yes_count] [int] NOT NULL,
	[t02_edgeon_a04_yes_weight] [float] NOT NULL,
	[t02_edgeon_a04_yes_fraction] [float] NOT NULL,
	[t02_edgeon_a04_yes_weighted_fraction] [float] NOT NULL,
	[t02_edgeon_a04_yes_debiased] [float] NOT NULL,
	[t02_edgeon_a04_yes_flag] [int] NOT NULL,
	[t02_edgeon_a05_no_count] [int] NOT NULL,
	[t02_edgeon_a05_no_weight] [float] NOT NULL,
	[t02_edgeon_a05_no_fraction] [float] NOT NULL,
	[t02_edgeon_a05_no_weighted_fraction] [float] NOT NULL,
	[t02_edgeon_a05_no_debiased] [float] NOT NULL,
	[t02_edgeon_a05_no_flag] [int] NOT NULL,
	[t03_bar_a06_bar_count] [int] NOT NULL,
	[t03_bar_a06_bar_weight] [float] NOT NULL,
	[t03_bar_a06_bar_fraction] [float] NOT NULL,
	[t03_bar_a06_bar_weighted_fraction] [float] NOT NULL,
	[t03_bar_a06_bar_debiased] [float] NOT NULL,
	[t03_bar_a06_bar_flag] [int] NOT NULL,
	[t03_bar_a07_no_bar_count] [int] NOT NULL,
	[t03_bar_a07_no_bar_weight] [float] NOT NULL,
	[t03_bar_a07_no_bar_fraction] [float] NOT NULL,
	[t03_bar_a07_no_bar_weighted_fraction] [float] NOT NULL,
	[t03_bar_a07_no_bar_debiased] [float] NOT NULL,
	[t03_bar_a07_no_bar_flag] [int] NOT NULL,
	[t04_spiral_a08_spiral_count] [int] NOT NULL,
	[t04_spiral_a08_spiral_weight] [float] NOT NULL,
	[t04_spiral_a08_spiral_fraction] [float] NOT NULL,
	[t04_spiral_a08_spiral_weighted_fraction] [float] NOT NULL,
	[t04_spiral_a08_spiral_debiased] [float] NOT NULL,
	[t04_spiral_a08_spiral_flag] [int] NOT NULL,
	[t04_spiral_a09_no_spiral_count] [int] NOT NULL,
	[t04_spiral_a09_no_spiral_weight] [float] NOT NULL,
	[t04_spiral_a09_no_spiral_fraction] [float] NOT NULL,
	[t04_spiral_a09_no_spiral_weighted_fraction] [float] NOT NULL,
	[t04_spiral_a09_no_spiral_debiased] [float] NOT NULL,
	[t04_spiral_a09_no_spiral_flag] [int] NOT NULL,
	[t05_bulge_prominence_a10_no_bulge_count] [int] NOT NULL,
	[t05_bulge_prominence_a10_no_bulge_weight] [float] NOT NULL,
	[t05_bulge_prominence_a10_no_bulge_fraction] [float] NOT NULL,
	[t05_bulge_prominence_a10_no_bulge_weighted_fraction] [float] NOT NULL,
	[t05_bulge_prominence_a10_no_bulge_debiased] [float] NOT NULL,
	[t05_bulge_prominence_a10_no_bulge_flag] [int] NOT NULL,
	[t05_bulge_prominence_a11_just_noticeable_count] [int] NOT NULL,
	[t05_bulge_prominence_a11_just_noticeable_weight] [float] NOT NULL,
	[t05_bulge_prominence_a11_just_noticeable_fraction] [float] NOT NULL,
	[t05_bulge_prominence_a11_just_noticeable_weighted_fraction] [float] NOT NULL,
	[t05_bulge_prominence_a11_just_noticeable_debiased] [float] NOT NULL,
	[t05_bulge_prominence_a11_just_noticeable_flag] [int] NOT NULL,
	[t05_bulge_prominence_a12_obvious_count] [int] NOT NULL,
	[t05_bulge_prominence_a12_obvious_weight] [float] NOT NULL,
	[t05_bulge_prominence_a12_obvious_fraction] [float] NOT NULL,
	[t05_bulge_prominence_a12_obvious_weighted_fraction] [float] NOT NULL,
	[t05_bulge_prominence_a12_obvious_debiased] [float] NOT NULL,
	[t05_bulge_prominence_a12_obvious_flag] [int] NOT NULL,
	[t05_bulge_prominence_a13_dominant_count] [int] NOT NULL,
	[t05_bulge_prominence_a13_dominant_weight] [float] NOT NULL,
	[t05_bulge_prominence_a13_dominant_fraction] [float] NOT NULL,
	[t05_bulge_prominence_a13_dominant_weighted_fraction] [float] NOT NULL,
	[t05_bulge_prominence_a13_dominant_debiased] [float] NOT NULL,
	[t05_bulge_prominence_a13_dominant_flag] [int] NOT NULL,
	[t06_odd_a14_yes_count] [int] NOT NULL,
	[t06_odd_a14_yes_weight] [float] NOT NULL,
	[t06_odd_a14_yes_fraction] [float] NOT NULL,
	[t06_odd_a14_yes_weighted_fraction] [float] NOT NULL,
	[t06_odd_a14_yes_debiased] [float] NOT NULL,
	[t06_odd_a14_yes_flag] [int] NOT NULL,
	[t06_odd_a15_no_count] [int] NOT NULL,
	[t06_odd_a15_no_weight] [float] NOT NULL,
	[t06_odd_a15_no_fraction] [float] NOT NULL,
	[t06_odd_a15_no_weighted_fraction] [float] NOT NULL,
	[t06_odd_a15_no_debiased] [float] NOT NULL,
	[t06_odd_a15_no_flag] [int] NOT NULL,
	[t07_rounded_a16_completely_round_count] [int] NOT NULL,
	[t07_rounded_a16_completely_round_weight] [float] NOT NULL,
	[t07_rounded_a16_completely_round_fraction] [float] NOT NULL,
	[t07_rounded_a16_completely_round_weighted_fraction] [float] NOT NULL,
	[t07_rounded_a16_completely_round_debiased] [float] NOT NULL,
	[t07_rounded_a16_completely_round_flag] [int] NOT NULL,
	[t07_rounded_a17_in_between_count] [int] NOT NULL,
	[t07_rounded_a17_in_between_weight] [float] NOT NULL,
	[t07_rounded_a17_in_between_fraction] [float] NOT NULL,
	[t07_rounded_a17_in_between_weighted_fraction] [float] NOT NULL,
	[t07_rounded_a17_in_between_debiased] [float] NOT NULL,
	[t07_rounded_a17_in_between_flag] [int] NOT NULL,
	[t07_rounded_a18_cigar_shaped_count] [int] NOT NULL,
	[t07_rounded_a18_cigar_shaped_weight] [float] NOT NULL,
	[t07_rounded_a18_cigar_shaped_fraction] [float] NOT NULL,
	[t07_rounded_a18_cigar_shaped_weighted_fraction] [float] NOT NULL,
	[t07_rounded_a18_cigar_shaped_debiased] [float] NOT NULL,
	[t07_rounded_a18_cigar_shaped_flag] [int] NOT NULL,
	[t08_odd_feature_a19_ring_count] [int] NOT NULL,
	[t08_odd_feature_a19_ring_weight] [float] NOT NULL,
	[t08_odd_feature_a19_ring_fraction] [float] NOT NULL,
	[t08_odd_feature_a19_ring_weighted_fraction] [float] NOT NULL,
	[t08_odd_feature_a19_ring_debiased] [float] NOT NULL,
	[t08_odd_feature_a19_ring_flag] [int] NOT NULL,
	[t08_odd_feature_a20_lens_or_arc_count] [int] NOT NULL,
	[t08_odd_feature_a20_lens_or_arc_weight] [float] NOT NULL,
	[t08_odd_feature_a20_lens_or_arc_fraction] [float] NOT NULL,
	[t08_odd_feature_a20_lens_or_arc_weighted_fraction] [float] NOT NULL,
	[t08_odd_feature_a20_lens_or_arc_debiased] [float] NOT NULL,
	[t08_odd_feature_a20_lens_or_arc_flag] [int] NOT NULL,
	[t08_odd_feature_a21_disturbed_count] [int] NOT NULL,
	[t08_odd_feature_a21_disturbed_weight] [float] NOT NULL,
	[t08_odd_feature_a21_disturbed_fraction] [float] NOT NULL,
	[t08_odd_feature_a21_disturbed_weighted_fraction] [float] NOT NULL,
	[t08_odd_feature_a21_disturbed_debiased] [float] NOT NULL,
	[t08_odd_feature_a21_disturbed_flag] [int] NOT NULL,
	[t08_odd_feature_a22_irregular_count] [int] NOT NULL,
	[t08_odd_feature_a22_irregular_weight] [float] NOT NULL,
	[t08_odd_feature_a22_irregular_fraction] [float] NOT NULL,
	[t08_odd_feature_a22_irregular_weighted_fraction] [float] NOT NULL,
	[t08_odd_feature_a22_irregular_debiased] [float] NOT NULL,
	[t08_odd_feature_a22_irregular_flag] [int] NOT NULL,
	[t08_odd_feature_a23_other_count] [int] NOT NULL,
	[t08_odd_feature_a23_other_weight] [float] NOT NULL,
	[t08_odd_feature_a23_other_fraction] [float] NOT NULL,
	[t08_odd_feature_a23_other_weighted_fraction] [float] NOT NULL,
	[t08_odd_feature_a23_other_debiased] [float] NOT NULL,
	[t08_odd_feature_a23_other_flag] [int] NOT NULL,
	[t08_odd_feature_a24_merger_count] [int] NOT NULL,
	[t08_odd_feature_a24_merger_weight] [float] NOT NULL,
	[t08_odd_feature_a24_merger_fraction] [float] NOT NULL,
	[t08_odd_feature_a24_merger_weighted_fraction] [float] NOT NULL,
	[t08_odd_feature_a24_merger_debiased] [float] NOT NULL,
	[t08_odd_feature_a24_merger_flag] [int] NOT NULL,
	[t08_odd_feature_a38_dust_lane_count] [int] NOT NULL,
	[t08_odd_feature_a38_dust_lane_weight] [float] NOT NULL,
	[t08_odd_feature_a38_dust_lane_fraction] [float] NOT NULL,
	[t08_odd_feature_a38_dust_lane_weighted_fraction] [float] NOT NULL,
	[t08_odd_feature_a38_dust_lane_debiased] [float] NOT NULL,
	[t08_odd_feature_a38_dust_lane_flag] [int] NOT NULL,
	[t09_bulge_shape_a25_rounded_count] [int] NOT NULL,
	[t09_bulge_shape_a25_rounded_weight] [float] NOT NULL,
	[t09_bulge_shape_a25_rounded_fraction] [float] NOT NULL,
	[t09_bulge_shape_a25_rounded_weighted_fraction] [float] NOT NULL,
	[t09_bulge_shape_a25_rounded_debiased] [float] NOT NULL,
	[t09_bulge_shape_a25_rounded_flag] [int] NOT NULL,
	[t09_bulge_shape_a26_boxy_count] [int] NOT NULL,
	[t09_bulge_shape_a26_boxy_weight] [float] NOT NULL,
	[t09_bulge_shape_a26_boxy_fraction] [float] NOT NULL,
	[t09_bulge_shape_a26_boxy_weighted_fraction] [float] NOT NULL,
	[t09_bulge_shape_a26_boxy_debiased] [float] NOT NULL,
	[t09_bulge_shape_a26_boxy_flag] [int] NOT NULL,
	[t09_bulge_shape_a27_no_bulge_count] [int] NOT NULL,
	[t09_bulge_shape_a27_no_bulge_weight] [float] NOT NULL,
	[t09_bulge_shape_a27_no_bulge_fraction] [float] NOT NULL,
	[t09_bulge_shape_a27_no_bulge_weighted_fraction] [float] NOT NULL,
	[t09_bulge_shape_a27_no_bulge_debiased] [float] NOT NULL,
	[t09_bulge_shape_a27_no_bulge_flag] [int] NOT NULL,
	[t10_arms_winding_a28_tight_count] [int] NOT NULL,
	[t10_arms_winding_a28_tight_weight] [float] NOT NULL,
	[t10_arms_winding_a28_tight_fraction] [float] NOT NULL,
	[t10_arms_winding_a28_tight_weighted_fraction] [float] NOT NULL,
	[t10_arms_winding_a28_tight_debiased] [float] NOT NULL,
	[t10_arms_winding_a28_tight_flag] [int] NOT NULL,
	[t10_arms_winding_a29_medium_count] [int] NOT NULL,
	[t10_arms_winding_a29_medium_weight] [float] NOT NULL,
	[t10_arms_winding_a29_medium_fraction] [float] NOT NULL,
	[t10_arms_winding_a29_medium_weighted_fraction] [float] NOT NULL,
	[t10_arms_winding_a29_medium_debiased] [float] NOT NULL,
	[t10_arms_winding_a29_medium_flag] [int] NOT NULL,
	[t10_arms_winding_a30_loose_count] [int] NOT NULL,
	[t10_arms_winding_a30_loose_weight] [float] NOT NULL,
	[t10_arms_winding_a30_loose_fraction] [float] NOT NULL,
	[t10_arms_winding_a30_loose_weighted_fraction] [float] NOT NULL,
	[t10_arms_winding_a30_loose_debiased] [float] NOT NULL,
	[t10_arms_winding_a30_loose_flag] [int] NOT NULL,
	[t11_arms_number_a31_1_count] [int] NOT NULL,
	[t11_arms_number_a31_1_weight] [float] NOT NULL,
	[t11_arms_number_a31_1_fraction] [float] NOT NULL,
	[t11_arms_number_a31_1_weighted_fraction] [float] NOT NULL,
	[t11_arms_number_a31_1_debiased] [float] NOT NULL,
	[t11_arms_number_a31_1_flag] [int] NOT NULL,
	[t11_arms_number_a32_2_count] [int] NOT NULL,
	[t11_arms_number_a32_2_weight] [float] NOT NULL,
	[t11_arms_number_a32_2_fraction] [float] NOT NULL,
	[t11_arms_number_a32_2_weighted_fraction] [float] NOT NULL,
	[t11_arms_number_a32_2_debiased] [float] NOT NULL,
	[t11_arms_number_a32_2_flag] [int] NOT NULL,
	[t11_arms_number_a33_3_count] [int] NOT NULL,
	[t11_arms_number_a33_3_weight] [float] NOT NULL,
	[t11_arms_number_a33_3_fraction] [float] NOT NULL,
	[t11_arms_number_a33_3_weighted_fraction] [float] NOT NULL,
	[t11_arms_number_a33_3_debiased] [float] NOT NULL,
	[t11_arms_number_a33_3_flag] [int] NOT NULL,
	[t11_arms_number_a34_4_count] [int] NOT NULL,
	[t11_arms_number_a34_4_weight] [float] NOT NULL,
	[t11_arms_number_a34_4_fraction] [float] NOT NULL,
	[t11_arms_number_a34_4_weighted_fraction] [float] NOT NULL,
	[t11_arms_number_a34_4_debiased] [float] NOT NULL,
	[t11_arms_number_a34_4_flag] [int] NOT NULL,
	[t11_arms_number_a36_more_than_4_count] [int] NOT NULL,
	[t11_arms_number_a36_more_than_4_weight] [float] NOT NULL,
	[t11_arms_number_a36_more_than_4_fraction] [float] NOT NULL,
	[t11_arms_number_a36_more_than_4_weighted_fraction] [float] NOT NULL,
	[t11_arms_number_a36_more_than_4_debiased] [float] NOT NULL,
	[t11_arms_number_a36_more_than_4_flag] [int] NOT NULL,
	[t11_arms_number_a37_cant_tell_count] [int] NOT NULL,
	[t11_arms_number_a37_cant_tell_weight] [float] NOT NULL,
	[t11_arms_number_a37_cant_tell_fraction] [float] NOT NULL,
	[t11_arms_number_a37_cant_tell_weighted_fraction] [float] NOT NULL,
	[t11_arms_number_a37_cant_tell_debiased] [float] NOT NULL,
	[t11_arms_number_a37_cant_tell_flag] [int] NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[zooConfidence]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zooConfidence](
	[specobjid] [numeric](20, 0) NOT NULL,
	[objid] [bigint] NOT NULL,
	[dr7objid] [bigint] NOT NULL,
	[ra] [real] NOT NULL,
	[dec] [real] NOT NULL,
	[rastring] [varchar](11) NOT NULL,
	[decstring] [varchar](11) NOT NULL,
	[f_unclass_clean] [float] NOT NULL,
	[f_misclass_clean] [float] NOT NULL,
	[avcorr_clean] [float] NOT NULL,
	[stdcorr_clean] [float] NOT NULL,
	[f_misclass_greater] [float] NOT NULL,
	[avcorr_greater] [float] NOT NULL,
	[stdcorr_greater] [float] NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[zooMirrorBias]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zooMirrorBias](
	[specobjid] [bigint] NOT NULL,
	[objid] [bigint] NOT NULL,
	[dr7objid] [bigint] NOT NULL,
	[ra] [real] NOT NULL,
	[dec] [real] NOT NULL,
	[rastring] [varchar](11) NOT NULL,
	[decstring] [varchar](11) NOT NULL,
	[nvote_mr1] [int] NOT NULL,
	[p_el_mr1] [float] NOT NULL,
	[p_cw_mr1] [float] NOT NULL,
	[p_acw_mr1] [float] NOT NULL,
	[p_edge_mr1] [float] NOT NULL,
	[p_dk_mr1] [float] NOT NULL,
	[p_mg_mr1] [float] NOT NULL,
	[p_cs_mr1] [float] NOT NULL,
	[nvote_mr2] [int] NOT NULL,
	[p_el_mr2] [float] NOT NULL,
	[p_cw_mr2] [float] NOT NULL,
	[p_acw_mr2] [float] NOT NULL,
	[p_edge_mr2] [float] NOT NULL,
	[p_dk_mr2] [float] NOT NULL,
	[p_mg_mr2] [float] NOT NULL,
	[p_cs_mr2] [float] NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[zooMonochromeBias]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zooMonochromeBias](
	[specobjid] [bigint] NOT NULL,
	[objid] [bigint] NOT NULL,
	[dr7objid] [bigint] NOT NULL,
	[ra] [real] NOT NULL,
	[dec] [real] NOT NULL,
	[rastring] [varchar](11) NOT NULL,
	[decstring] [varchar](11) NOT NULL,
	[nvote_mon] [int] NOT NULL,
	[p_el_mon] [float] NOT NULL,
	[p_cw_mon] [float] NOT NULL,
	[p_acw_mon] [float] NOT NULL,
	[p_edge_mon] [float] NOT NULL,
	[p_dk_mon] [float] NOT NULL,
	[p_mg_mon] [float] NOT NULL,
	[p_cs_mon] [float] NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[zooNoSpec]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zooNoSpec](
	[specobjid] [bigint] NOT NULL,
	[objid] [bigint] NOT NULL,
	[dr7objid] [bigint] NOT NULL,
	[ra] [real] NOT NULL,
	[dec] [real] NOT NULL,
	[rastring] [varchar](11) NOT NULL,
	[nvote] [int] NOT NULL,
	[p_el] [float] NOT NULL,
	[p_cw] [float] NOT NULL,
	[p_acw] [float] NOT NULL,
	[p_edge] [float] NOT NULL,
	[p_dk] [float] NOT NULL,
	[p_mg] [float] NOT NULL,
	[p_cs] [float] NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[zooSpec]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zooSpec](
	[specobjid] [numeric](20, 0) NOT NULL,
	[objid] [bigint] NOT NULL,
	[dr7objid] [bigint] NOT NULL,
	[ra] [real] NOT NULL,
	[dec] [real] NOT NULL,
	[rastring] [varchar](11) NOT NULL,
	[decstring] [varchar](11) NOT NULL,
	[nvote] [int] NOT NULL,
	[p_el] [float] NOT NULL,
	[p_cw] [float] NOT NULL,
	[p_acw] [float] NOT NULL,
	[p_edge] [float] NOT NULL,
	[p_dk] [float] NOT NULL,
	[p_mg] [float] NOT NULL,
	[p_cs] [float] NOT NULL,
	[p_el_debiased] [float] NOT NULL,
	[p_cs_debiased] [float] NOT NULL,
	[spiral] [int] NOT NULL,
	[elliptical] [int] NOT NULL,
	[uncertain] [int] NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  Table [dbo].[zooVotes]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zooVotes](
	[specobjid] [bigint] NOT NULL,
	[objid] [bigint] NOT NULL,
	[dr7objid] [bigint] NOT NULL,
	[ra] [real] NOT NULL,
	[dec] [real] NOT NULL,
	[rastring] [varchar](11) NOT NULL,
	[decstring] [varchar](11) NOT NULL,
	[nvote_tot] [int] NOT NULL,
	[nvote_std] [int] NOT NULL,
	[nvote_mr1] [int] NOT NULL,
	[nvote_mr2] [int] NOT NULL,
	[nvote_mon] [int] NOT NULL,
	[p_el] [float] NOT NULL,
	[p_cw] [float] NOT NULL,
	[p_acw] [float] NOT NULL,
	[p_edge] [float] NOT NULL,
	[p_dk] [float] NOT NULL,
	[p_mg] [float] NOT NULL,
	[p_cs] [float] NOT NULL
) ON [DATAFG]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
/****** Object:  View [dbo].[PhotoPrimary]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[PhotoPrimary] 
----------------------------------------------------------------------
--/H These objects are the primary survey objects. 
--
--/T Each physical object 
--/T on the sky has only one primary object associated with it. Upon 
--/T subsequent observations secondary objects are generated. Since the 
--/T survey stripes overlap, there will be secondary objects for over 10% 
--/T of all primary objects, and in the southern stripes there will be a 
--/T multitude of secondary objects for each primary (i.e. reobservations). 
----------------------------------------------------------------------
AS
SELECT * FROM PhotoObjAll WITH(NOLOCK)
    WHERE mode=1

GO
/****** Object:  View [dbo].[Star]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[Star]
--------------------------------------------------------------
--/H The objects classified as stars from PhotoPrimary
--
--/T The Star view essentially contains the photometric parameters
--/T (no redshifts or spectroscopic parameters) for all primary
--/T point-like objects, including quasars.
--------------------------------------------------------------
AS
SELECT * 
    FROM PhotoPrimary
    WHERE type = 6

GO
/****** Object:  View [dbo].[Galaxy]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[Galaxy]
---------------------------------------------------------------
--/H The objects classified as galaxies from PhotoPrimary.
--
--/T The Galaxy view contains the photometric parameters (no
--/T redshifts or spectroscopic parameters) measured for
--/T resolved primary objects.
---------------------------------------------------------------
AS
SELECT * 
    FROM PhotoPrimary
    WHERE type = 3

GO
/****** Object:  View [dbo].[PhotoTag]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[PhotoTag]
--------------------------------------------------------------
--/H The most popular columns from PhotoObjAll.
--
--/T This view contains the most popular columns from the
--/T PhotoObjAll table, and is intended to enable faster
--/T queries if they only request these columns by making 
--/T use of the cache.  Performance is also enhanced by
--/T an index covering the columns in this view in the base
--/T table (PhotoObjAll).
--------------------------------------------------------------
AS
SELECT [objID]
      ,[skyVersion]
      ,[run]
      ,[rerun]
      ,[camcol]
      ,[field]
      ,[obj]
      ,[mode]
      ,[nChild]
      ,[type]
      ,[clean]
      ,[probPSF]
      ,[insideMask]
      ,[flags]
      ,[flags_u]
      ,[flags_g]
      ,[flags_r]
      ,[flags_i]
      ,[flags_z]
      ,[psfMag_u]
      ,[psfMag_g]
      ,[psfMag_r]
      ,[psfMag_i]
      ,[psfMag_z]
      ,[psfMagErr_u]
      ,[psfMagErr_g]
      ,[psfMagErr_r]
      ,[psfMagErr_i]
      ,[psfMagErr_z]
      ,[petroMag_u]
      ,[petroMag_g]
      ,[petroMag_r]
      ,[petroMag_i]
      ,[petroMag_z]
      ,[petroMagErr_u]
      ,[petroMagErr_g]
      ,[petroMagErr_r]
      ,[petroMagErr_i]
      ,[petroMagErr_z]
      ,[petroR50_r]
      ,[petroR90_r]
      ,u as [modelMag_u]
      ,g as [modelMag_g]
      ,r as [modelMag_r]
      ,i as [modelMag_i]
      ,z as [modelMag_z]
      ,err_u  as [modelMagErr_u] 
      ,err_g  as [modelMagErr_g]
      ,err_r  as [modelMagErr_r]
      ,err_i  as [modelMagErr_i]
      ,err_z  as [modelMagErr_z]
      ,[cModelMag_u]
      ,[cModelMag_g]
      ,[cModelMag_r]
      ,[cModelMag_i]
      ,[cModelMag_z]
      ,[cModelMagErr_u]
      ,[cModelMagErr_g]
      ,[cModelMagErr_r]
      ,[cModelMagErr_i]
      ,[cModelMagErr_z]
      ,[mRrCc_r]
      ,[mRrCcErr_r]
      ,[mRrCcPsf_r]
      ,[fracDeV_u]
      ,[fracDeV_g]
      ,[fracDeV_r]
      ,[fracDeV_i]
      ,[fracDeV_z]
      ,[psffwhm_u]
      ,[psffwhm_g]
      ,[psffwhm_r]
      ,[psffwhm_i]
      ,[psffwhm_z]
      ,[resolveStatus]
      ,[thingId]
      ,[balkanId]
      ,[nObserve]
      ,[nDetect]
      ,[calibStatus_u]
      ,[calibStatus_g]
      ,[calibStatus_r]
      ,[calibStatus_i]
      ,[calibStatus_z]
      ,[ra]
      ,[dec]
      ,[cx]
      ,[cy]
      ,[cz]
      ,[extinction_u]
      ,[extinction_g]
      ,[extinction_r]
      ,[extinction_i]
      ,[extinction_z]
      ,[htmID]
      ,[fieldID]
      ,[specObjID]
      ,( case when mRrCc_r > 0 then SQRT(mRrCc_r/2.0)else 0 end) as size
  FROM PhotoObjAll

GO
/****** Object:  View [dbo].[StarTag]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[StarTag]
--------------------------------------------------------------
--/H The objects classified as stars from primary PhotoTag objects.
--
--/T The StarTag view essentially contains the abbreviated photometric 
--/T parameters from the PhotoTag table (no redshifts or spectroscopic
--/T parameters) for all primary point-like objects, including quasars.
--------------------------------------------------------------
AS
SELECT * 
    FROM PhotoTag WITH(NOLOCK)
    WHERE type = 6 and mode=1

GO
/****** Object:  View [dbo].[GalaxyTag]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[GalaxyTag]
---------------------------------------------------------------
--/H The objects classified as galaxies from primary PhotoTag objects.
--
--/T The GalaxyTag view essentially contains the abbreviated photometric 
--/T parameters from the PhotoTag table (no redshifts or spectroscopic
--/T parameters) for all primary point-like objects, including quasars.
---------------------------------------------------------------
AS
SELECT * 
    FROM PhotoTag WITH(NOLOCK)
    WHERE type = 3 and mode=1

GO
/****** Object:  View [dbo].[Sky]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[Sky]
---------------------------------------------------------------
--/H The objects selected as sky samples in PhotoPrimary
---------------------------------------------------------------
AS
SELECT * 
    FROM PhotoPrimary
    WHERE type = 8

GO
/****** Object:  View [dbo].[Unknown]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[Unknown]
---------------------------------------------------------------------
--/H Everything in PhotoPrimary, which is not a galaxy, star or sky
--------------------------------------------------------------------
AS
SELECT * 
    FROM PhotoPrimary
    WHERE type not in (3,6,8)

GO
/****** Object:  View [dbo].[AncillaryTarget1]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[AncillaryTarget1]
------------------------------------------
--/H Contains the AncillaryTarget1 flag values from DataConstants as binary(8).
------------------------------------------
--/T Please see the ANCILLARY_TARGET1 entry in Algorithms under Bitmasks
--/T for further information.
------------------------------------------
AS
SELECT name, 
       value,
       description
    FROM DataConstants
    WHERE field='AncillaryTarget1' AND name != ''

GO
/****** Object:  View [dbo].[AncillaryTarget2]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[AncillaryTarget2]
------------------------------------------
--/H Contains the AncillaryTarget2 flag values from DataConstants as binary(8).
------------------------------------------
--/T Please see the ANCILLARY_TARGET2 entry in Algorithms under Bitmasks
--/T for further information.
------------------------------------------
AS
SELECT name, 
        value,
	description
    FROM DataConstants
    WHERE field='AncillaryTarget2' AND name != ''

GO
/****** Object:  View [dbo].[ApogeeAspcapFlag]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[ApogeeAspcapFlag]
------------------------------------------
--/H Contains the ApogeeAspcapFlag flag values from DataConstants as binary(4).
------------------------------------------
--/T Please see the APOGEE_ASPCAPFLAG entry in Algorithms under Bitmasks
--/T for further information.
------------------------------------------
AS
SELECT name, 
	cast((value^power(cast(2 as bigint),32)) as binary(4)) as value, 
	description
    FROM DataConstants
    WHERE field='ApogeeAspcapFlag' AND name != ''

GO
/****** Object:  View [dbo].[ApogeeExtraTarg]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[ApogeeExtraTarg]
------------------------------------------
--/H Contains the ApogeeExtraTarg flag values from DataConstants as binary(4).
------------------------------------------
--/T Please see the APOGEE_EXTRATARG entry in Algorithms under Bitmasks
--/T for further information.
------------------------------------------
AS
SELECT name, 
	cast((value^power(cast(2 as bigint),32)) as binary(4)) as value, 
	description
    FROM DataConstants
    WHERE field='ApogeeExtraTarg' AND name != ''

GO
/****** Object:  View [dbo].[ApogeeParamFlag]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[ApogeeParamFlag]
------------------------------------------
--/H Contains the ApogeeParamFlag flag values from DataConstants as binary(4).
------------------------------------------
--/T Please see the APOGEE_PARAMFLAG entry in Algorithms under Bitmasks
--/T for further information.
------------------------------------------
AS
SELECT name, 
	cast((value^power(cast(2 as bigint),32)) as binary(4)) as value, 
	description
    FROM DataConstants
    WHERE field='ApogeeParamFlag' AND name != ''

GO
/****** Object:  View [dbo].[ApogeeStarFlag]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[ApogeeStarFlag]
------------------------------------------
--/H Contains the ApogeeStarFlag flag values from DataConstants as binary(4).
------------------------------------------
--/T Please see the APOGEE_STARFLAG entry in Algorithms under Bitmasks
--/T for further information.
------------------------------------------
AS
SELECT name, 
	cast((value^power(cast(2 as bigint),32)) as binary(4)) as value, 
	description
    FROM DataConstants
    WHERE field='ApogeeStarFlag' AND name != ''

GO
/****** Object:  View [dbo].[ApogeeTarget1]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[ApogeeTarget1]
------------------------------------------
--/H Contains the ApogeeTarget1 flag values from DataConstants as binary(4).
------------------------------------------
--/T Please see the APOGEE_TARGET1 entry in Algorithms under Bitmasks
--/T for further information.
------------------------------------------
AS
SELECT name, 
	cast((value^power(cast(2 as bigint),32)) as binary(4)) as value, 
	description
    FROM DataConstants
    WHERE field='ApogeeTarget1' AND name != ''

GO
/****** Object:  View [dbo].[ApogeeTarget2]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[ApogeeTarget2]
------------------------------------------
--/H Contains the ApogeeTarget2 flag values from DataConstants as binary(4).
------------------------------------------
--/T Please see the APOGEE_TARGET2 entry in Algorithms under Bitmasks
--/T for further information.
------------------------------------------
AS
SELECT name, 
	cast((value^power(cast(2 as bigint),32)) as binary(4)) as value, 
	description
    FROM DataConstants
    WHERE field='ApogeeTarget2' AND name != ''

GO
/****** Object:  View [dbo].[BossTarget1]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[BossTarget1]
------------------------------------------
--/H Contains the BossTarget1 flag values from DataConstants as binary(4).
------------------------------------------
--/T Please see the BOSS_TARGET1 entry in Algorithms under Bitmasks
--/T for further information.
------------------------------------------
AS
SELECT name, 
       value,
       description
    FROM DataConstants
    WHERE field='BossTarget1' AND name != ''

GO
/****** Object:  View [dbo].[CalibStatus]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[CalibStatus]
------------------------------------------
--/H Contains the CalibStatus flag values from DataConstants as binary(2).
------------------------------------------
--/T Please see the CALIB_STATUS entry in Algorithms under Bitmasks
--/T for further information.
------------------------------------------
AS
SELECT name, 
	cast(value as binary(2)) as value, 
	description
    FROM DataConstants
    WHERE field='CalibStatus' AND name != ''

GO
/****** Object:  View [dbo].[Columns]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[Columns] 
---------------------------------------------------------------
--/H Aliias the DBColumns table also as Columns, for legacy SkyQuery
---------------------------------------------------------------
AS
SELECT * 
    FROM DBColumns WITH(NOLOCK)

GO
/****** Object:  View [dbo].[CoordType]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[CoordType]
------------------------------------------
--/H Contains the CoordType enumerated values from DataConstants as int
------------------------------------------
AS
SELECT name,
        cast(value as int) as value,
        description
    FROM DataConstants
    WHERE field='CoordType' AND name != ''

GO
/****** Object:  View [dbo].[eBossTarget0]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[eBossTarget0]
------------------------------------------
--/H Contains the eBossTarget0 flag values from DataConstants as binary(4).
------------------------------------------
--/T Please see the EBOSS_TARGET0 entry in Algorithms under Bitmasks
--/T for further information.
------------------------------------------
AS
SELECT name, 
       value,
       description
    FROM DataConstants
    WHERE field='eBossTarget0' AND name != ''

GO
/****** Object:  View [dbo].[FieldQuality]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[FieldQuality]
------------------------------------------
--/H Contains the FieldQuality enumerated values from DataConstants as int
------------------------------------------
AS
SELECT name, 
	cast(value as int) as value, 
	description
    FROM DataConstants
    WHERE field='FieldQuality' AND name != ''

GO
/****** Object:  View [dbo].[FramesStatus]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[FramesStatus]
------------------------------------------
--/H Contains the FramesStatus enumerated values from DataConstants as int
------------------------------------------
AS
SELECT name, 
	cast(value as int) as value, 
	description
    FROM DataConstants
    WHERE field='FramesStatus' AND name != ''

GO
/****** Object:  View [dbo].[HoleType]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[HoleType]
------------------------------------------
--/H Contains the HoleType enumerated values from DataConstants as int
------------------------------------------
AS
SELECT name,
        cast(value as int) as value,
        description
    FROM DataConstants
    WHERE field='HoleType' AND name != ''

GO
/****** Object:  View [dbo].[ImageStatus]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[ImageStatus]
------------------------------------------
--/H Contains the ImageStatus flag values from DataConstants as binary(4).
------------------------------------------
--/T Please see the IMAGE_STATUS entry in Algorithms under Bitmasks
--/T for further information.
------------------------------------------
AS
SELECT name, 
	cast((value^power(cast(2 as bigint),32)) as binary(4)) as value, 
	description
    FROM DataConstants
    WHERE field='ImageStatus' AND name != ''

GO
/****** Object:  View [dbo].[InsideMask]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[InsideMask]
------------------------------------------
--/H Contains the InsideMask flag values from DataConstants as binary(1)
------------------------------------------
AS
SELECT name, 
       convert(char(4),cast(value/power((cast(2 as bigint)),56) as binary(1)),1) as value,
       --	cast(value as binary(1)) as value, 
       description
    FROM DataConstants
    WHERE field='InsideMask' AND name != ''

GO
/****** Object:  View [dbo].[MaskType]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[MaskType]
------------------------------------------
--/H Contains the MaskType enumerated values from DataConstants as int
------------------------------------------
AS
SELECT name, 
	cast(value as int) as value, 
	description
    FROM DataConstants
    WHERE field='MaskType' AND name != ''

GO
/****** Object:  View [dbo].[PhotoFamily]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[PhotoFamily]
----------------------------------------------------------------------
--/H These are in PhotoObj, but neither PhotoPrimary or Photosecondary.
--
--/T These objects are generated if they are neither primary nor 
--/T secondary survey objects but a composite object that has been 
--/T deblended or the part of an object that has been deblended 
--/T wrongfully (like the spiral arms of a galaxy). These objects 
--/T are kept to track how the deblender is working. It inherits 
--/T all members of the PhotoObj class. 
----------------------------------------------------------------------
AS
SELECT * FROM PhotoObjAll WITH(NOLOCK)
    WHERE mode=3

--(status & 0x00001000 = 0)  -- not a secondary
--	and NOT ( (status & 0x00002000>0) and (status & 0x0010 >0)) -- not a primary either

GO
/****** Object:  View [dbo].[PhotoFlags]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[PhotoFlags]
------------------------------------------
--/H Contains the PhotoFlags flag values from DataConstants as binary(8).
------------------------------------------
--/T Please see the FLAGS1 and FLAGS2 entries in Algorithms under Bitmasks
--/T for further information.
------------------------------------------
AS
SELECT 
	name, 
	value, 
	description
    FROM DataConstants
    WHERE field='PhotoFlags' AND name != ''

GO
/****** Object:  View [dbo].[PhotoMode]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[PhotoMode]
------------------------------------------
--/H Contains the PhotoMode enumerated values from DataConstants as int
------------------------------------------
AS
SELECT name, 
	cast(value as int) as value, 
	description
    FROM DataConstants
    WHERE field = 'PhotoMode' AND name != ''

GO
/****** Object:  View [dbo].[PhotoObj]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[PhotoObj]
----------------------------------------------------------------------
--/H All primary and secondary objects in the PhotoObjAll table, which contains all the attributes of each photometric (image) object. 
--
--/T It selects PhotoObj with mode=1 or 2.
----------------------------------------------------------------------
AS
SELECT * FROM PhotoObjAll WITH(NOLOCK)
	WHERE mode in (1,2)

GO
/****** Object:  View [dbo].[PhotoSecondary]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[PhotoSecondary]
----------------------------------------------------------------------
--/H Secondary objects are reobservations of the same primary object.
----------------------------------------------------------------------
AS
SELECT * FROM PhotoObjAll WITH(NOLOCK)
    WHERE mode=2
--status & 0x00001000 > 0 

GO
/****** Object:  View [dbo].[PhotoStatus]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[PhotoStatus]
------------------------------------------
--/H Contains the PhotoStatus flag values from DataConstants as binary(4).
------------------------------------------
AS
SELECT name, 
	cast((value^power(cast(2 as bigint),32)) as binary(4)) as value, 
	description
    FROM DataConstants
    WHERE field='PhotoStatus' AND name != ''

GO
/****** Object:  View [dbo].[PhotoType]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[PhotoType]
------------------------------------------
--/H Contains the PhotoType enumerated values from DataConstants as int
------------------------------------------
AS
SELECT name, 
	cast(value as int) as value, 
	description
    FROM DataConstants
    WHERE field='PhotoType' AND name != ''

GO
/****** Object:  View [dbo].[PrimTarget]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[PrimTarget]
------------------------------------------
--/H Contains the PrimTarget flag values from DataConstants as binary(4)
------------------------------------------
AS
SELECT name, 
	cast((value^power(cast(2 as bigint),32)) as binary(4)) as value, 
	description
    FROM DataConstants
    WHERE field='PrimTarget' AND name != ''

GO
/****** Object:  View [dbo].[ProgramType]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[ProgramType]
------------------------------------------
--/H Contains the ProgramType enumerated values from DataConstants as int
------------------------------------------
AS
SELECT name,
        cast(value as int) as value,
        description
    FROM DataConstants
    WHERE field='ProgramType' AND name != ''

GO
/****** Object:  View [dbo].[PspStatus]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[PspStatus]
------------------------------------------
--/H Contains the PspStatus enumerated values from DataConstants as int
------------------------------------------
AS
SELECT name, 
	cast(value as int) as value, 
	description
    FROM DataConstants
    WHERE field='PspStatus' AND name != ''

GO
/****** Object:  View [dbo].[RegionConvex]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[RegionConvex]
---------------------------------------------------------------
--/H Emulates the old RegionConvex table for compatibility
--/U ----------------------------------------------------------
--/T Implemented as a view, translates patchid to patch
---------------------------------------------------------------
AS
	SELECT	regionid, convexid, patchid as patch, type, 
			radius, ra,dec,x,y,z,c, htmid, convexString
	FROM RegionPatch

GO
/****** Object:  View [dbo].[ResolveStatus]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[ResolveStatus]
------------------------------------------
--/H Contains the ResolveStatus flag values from DataConstants as binary(4).
------------------------------------------
--/T Please see the RESOLVE_STATUS entry in Algorithms under Bitmasks
--/T for further information.
------------------------------------------
AS
SELECT name, 
	cast((value^power(cast(2 as bigint),32)) as binary(4)) as value, 
	description
    FROM DataConstants
    WHERE field='ResolveStatus' AND name != ''

GO
/****** Object:  View [dbo].[sdssTile]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[sdssTile]
---------------------------------------------------------------
--/H A view of sdssTileAll that have untiled=0
--
--/T The view excludes those sdssTiles that have been untiled.
---------------------------------------------------------------
AS
SELECT * 
    FROM sdssTileAll WITH(NOLOCK)
    WHERE untiled = 0

GO
/****** Object:  View [dbo].[sdssTilingBoundary]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[sdssTilingBoundary]
---------------------------------------------------------------
--/H A view of sdssTilingGeometry objects that have isMask = 0
--
--/T The view excludes those sdssTilingGeometry objects that have 
--/T isMask = 1.  See also sdssTilingMask.
---------------------------------------------------------------
AS
SELECT * 
    FROM sdssTilingGeometry WITH(NOLOCK)
    WHERE isMask = 0

GO
/****** Object:  View [dbo].[sdssTilingMask]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[sdssTilingMask]
---------------------------------------------------------------
--/H A view of sdssTilingGeometry objects that have isMask = 1
--
--/T The view excludes those sdssTilingGeometry objects that have 
--/T isMask = 0.  See also sdssTilingBoundary.
---------------------------------------------------------------
AS
SELECT * 
    FROM sdssTilingGeometry WITH(NOLOCK)
    WHERE isMask = 1

GO
/****** Object:  View [dbo].[SecTarget]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[SecTarget]
------------------------------------------
--/H Contains the SecTarget flag values from DataConstants as binary(4)
------------------------------------------
AS
SELECT name, 
	cast((value^power(cast(2 as bigint),32)) as binary(4)) as value, 
	description
    FROM DataConstants
    WHERE field='SecTarget' AND name != ''

GO
/****** Object:  View [dbo].[segue1SpecObjAll]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE VIEW [dbo].[segue1SpecObjAll]
---------------------------------------------------------------
--/H A view of specObjAll that includes only SEGUE1 spectra
--
--/T The view excludes spectra that are not part of the SEGUE1 program.
---------------------------------------------------------------
AS
SELECT s.* 
	FROM specObjAll 
	   AS s JOIN plateX AS p ON s.plateId = p.plateId
	WHERE p.programName like 'seg%' and p.programName not like 'segue2%'

GO
/****** Object:  View [dbo].[Segue1Target1]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[Segue1Target1]
------------------------------------------
--/H Contains the Segue1Target1 flag values from DataConstants as binary(4).
------------------------------------------
--/T Please see the SEGUE1_TARGET1 entry in Algorithms under Bitmasks
--/T for further information.
------------------------------------------
AS
SELECT name, 
	cast((value^power(cast(2 as bigint),32)) as binary(4)) as value, 
	description
    FROM DataConstants
    WHERE field='Segue1Target1' AND name != ''

GO
/****** Object:  View [dbo].[Segue1Target2]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[Segue1Target2]
------------------------------------------
--/H Contains the Segue1Target2 flag values from DataConstants as binary(4).
------------------------------------------
--/T Please see the SEGUE1_TARGET2 entry in Algorithms under Bitmasks
--/T for further information.
------------------------------------------
AS
SELECT name, 
	cast((value^power(cast(2 as bigint),32)) as binary(4)) as value, 
	description
    FROM DataConstants
    WHERE field='Segue1Target2' AND name != ''

GO
/****** Object:  View [dbo].[segue2SpecObjAll]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE VIEW [dbo].[segue2SpecObjAll]
---------------------------------------------------------------
--/H A view of specObjAll that includes only SEGUE2 spectra
--
--/T The view excludes spectra that are not part of the SEGUE2 program.
---------------------------------------------------------------
AS
SELECT s.* 
	FROM specObjAll 
	   AS s JOIN plateX AS p ON s.plateId = p.plateId
	WHERE p.programName like 'segue2%'

GO
/****** Object:  View [dbo].[Segue2Target1]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[Segue2Target1]
------------------------------------------
--/H Contains the Segue2Target1 flag values from DataConstants as binary(4).
------------------------------------------
--/T Please see the SEGUE2_TARGET1 entry in Algorithms under Bitmasks
--/T for further information.
------------------------------------------
AS
SELECT name, 
	cast((value^power(cast(2 as bigint),32)) as binary(4)) as value, 
	description
    FROM DataConstants
    WHERE field='Segue2Target1' AND name != ''

GO
/****** Object:  View [dbo].[Segue2Target2]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[Segue2Target2]
------------------------------------------
--/H Contains the Segue2Target2 flag values from DataConstants as binary(4).
------------------------------------------
--/T Please see the SEGUE2_TARGET2 entry in Algorithms under Bitmasks
--/T for further information.
------------------------------------------
AS
SELECT name, 
	cast((value^power(cast(2 as bigint),32)) as binary(4)) as value, 
	description
    FROM DataConstants
    WHERE field='Segue2Target2' AND name != ''

GO
/****** Object:  View [dbo].[segueSpecObjAll]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[segueSpecObjAll]
---------------------------------------------------------------
--/H A view of specObjAll that includes only SEGUE1+SEGUE2 spectra
--
--/T The view excludes spectra that are not part of the SEGUE1
--/T or SEGUE2 programs.
---------------------------------------------------------------
AS
SELECT s.* 
	FROM specObjAll 
	   AS s JOIN plateX AS p ON s.plateId = p.plateId
	WHERE p.programName like 'seg%'

GO
/****** Object:  View [dbo].[SourceType]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[SourceType]
------------------------------------------
--/H Contains the SourceType enumerated values from DataConstants as int
------------------------------------------
AS
SELECT name,
        cast(value as int) as value,
        description
    FROM DataConstants
    WHERE field='SourceType' AND name != ''

GO
/****** Object:  View [dbo].[SpecialTarget1]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[SpecialTarget1]
------------------------------------------
--/H Contains the SpecialTarget1 flag values from DataConstants as binary(4).
------------------------------------------
--/T Please see the SPECIAL_TARGET1 entry in Algorithms under Bitmasks
--/T for further information.
------------------------------------------
AS
SELECT name, 
       value,
       description
    FROM DataConstants
    WHERE field='SpecialTarget1' AND name != ''

GO
/****** Object:  View [dbo].[SpecialTarget2]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[SpecialTarget2]
------------------------------------------
--/H Contains the SpecialTarget2 flag values from DataConstants as binary(4).
------------------------------------------
--/T Please see the SPECIAL_TARGET2 entry in Algorithms under Bitmasks
--/T for further information.
------------------------------------------
AS
SELECT name, 
	cast((value^power(cast(2 as bigint),32)) as binary(4)) as value, 
	description
    FROM DataConstants
    WHERE field='SpecialTarget2' AND name != ''

GO
/****** Object:  View [dbo].[SpecObj]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE VIEW [dbo].[SpecObj] 
---------------------------------------------------------------
--/H A view of Spectro objects that just has the clean spectra.
--
--/T The view excludes QA and Sky and duplicates. Use this as the main
--/T way to access the spectro objects.
---------------------------------------------------------------
AS
SELECT * 
    FROM specObjAll WITH(NOLOCK)
    WHERE sciencePrimary = 1 

GO
/****** Object:  View [dbo].[SpecPhoto]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[SpecPhoto] 
---------------------------------------------------------------
--/H A view of joined Spectro and Photo objects that have the clean spectra.
--
--/T The view includes only those pairs where the SpecObj is a
--/T sciencePrimary, and the BEST PhotoObj is a PRIMARY (mode=1).
---------------------------------------------------------------
AS
SELECT * 
    FROM SpecPhotoAll WITH(NOLOCK)
    WHERE sciencePrimary = 1 and mode=1

GO
/****** Object:  View [dbo].[SpecPixMask]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[SpecPixMask]
------------------------------------------
--/H Contains the SpecPixMask flag values from DataConstants as binary(4).
------------------------------------------
--/T Please see the SPPIXMASK entry in Algorithms under Bitmasks
--/T for further information.
------------------------------------------
AS
SELECT name, 
	cast((value^power(cast(2 as bigint),32)) as binary(4)) as value, 
	description
    FROM DataConstants
    WHERE field='SpecPixMask' AND name != ''

GO
/****** Object:  View [dbo].[SpecZWarning]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[SpecZWarning]
------------------------------------------
--/H Contains the SpecZWarning flag values from DataConstants as binary(4).
------------------------------------------
--/T Please see the ZWARNING entry in Algorithms under Bitmasks
--/T for further information.
------------------------------------------
AS
SELECT name, 
	cast((value^power(cast(2 as bigint),32)) as binary(4)) as value, 
	description
    FROM DataConstants
    WHERE field='SpecZWarning' AND name != ''

GO
/****** Object:  View [dbo].[TableDesc]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[TableDesc] 
---------------------------------------------------------------
--/H Extract the description and index group of each table in schema.
--
--/T The view extracts the description of each table from the 
--/T DBObjects table and the index group from the IndexMap table.
--/T This allows all table descriptions to be viewed in one list.
---------------------------------------------------------------
AS 
SELECT DISTINCT o.name AS [key], 
	ISNULL(i.indexgroup,' ') as type, 
	(o.description+'<br>'+o.text) as text 
FROM DBObjects o LEFT OUTER JOIN IndexMap i ON o.name=i.tableName 
WHERE o.type='U'	-- type is table

GO
/****** Object:  View [dbo].[TiMask]    Script Date: 3/22/2017 2:03:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[TiMask]
------------------------------------------
--/H Contains the TiMask flag values from DataConstants as binary(4)
------------------------------------------
AS
SELECT name,
        cast((value^power(cast(2 as bigint),32)) as binary(4)) as value,
        description
    FROM DataConstants
    WHERE field='TiMask' AND name != ''

GO
ALTER TABLE [dbo].[DBColumns] ADD  DEFAULT ((0)) FOR [rank]
GO
ALTER TABLE [dbo].[DBObjects] ADD  DEFAULT ((0)) FOR [rank]
GO
ALTER TABLE [dbo].[detectionIndex] ADD  DEFAULT ((0)) FOR [isPrimary]
GO
ALTER TABLE [dbo].[Mask] ADD  DEFAULT ((0)) FOR [cx]
GO
ALTER TABLE [dbo].[Mask] ADD  DEFAULT ((0)) FOR [cy]
GO
ALTER TABLE [dbo].[Mask] ADD  DEFAULT ((0)) FOR [cz]
GO
ALTER TABLE [dbo].[Mask] ADD  DEFAULT ((0)) FOR [htmID]
GO
ALTER TABLE [dbo].[PhotoObjAll] ADD  DEFAULT ((0)) FOR [parentID]
GO
ALTER TABLE [dbo].[PhotoObjAll] ADD  DEFAULT ((0)) FOR [specObjID]
GO
ALTER TABLE [dbo].[QueryResults] ADD  DEFAULT (getdate()) FOR [time]
GO
ALTER TABLE [dbo].[QueryResults] ADD  DEFAULT ('') FOR [comment]
GO
ALTER TABLE [dbo].[Region] ADD  DEFAULT ((0)) FOR [ismask]
GO
ALTER TABLE [dbo].[Region] ADD  DEFAULT ((0)) FOR [area]
GO
ALTER TABLE [dbo].[Region] ADD  DEFAULT ('') FOR [regionString]
GO
ALTER TABLE [dbo].[Region] ADD  DEFAULT (0x00) FOR [regionBinary]
GO
ALTER TABLE [dbo].[RegionArcs] ADD  DEFAULT ((0.0)) FOR [length]
GO
ALTER TABLE [dbo].[RegionPatch] ADD  DEFAULT ((0)) FOR [radius]
GO
ALTER TABLE [dbo].[RegionPatch] ADD  DEFAULT ((0)) FOR [ra]
GO
ALTER TABLE [dbo].[RegionPatch] ADD  DEFAULT ((0)) FOR [dec]
GO
ALTER TABLE [dbo].[RegionPatch] ADD  DEFAULT ((0)) FOR [x]
GO
ALTER TABLE [dbo].[RegionPatch] ADD  DEFAULT ((0)) FOR [y]
GO
ALTER TABLE [dbo].[RegionPatch] ADD  DEFAULT ((0)) FOR [z]
GO
ALTER TABLE [dbo].[RegionPatch] ADD  DEFAULT ((0)) FOR [c]
GO
ALTER TABLE [dbo].[RegionPatch] ADD  DEFAULT ((0)) FOR [htmid]
GO
ALTER TABLE [dbo].[RegionPatch] ADD  DEFAULT ((0)) FOR [area]
GO
ALTER TABLE [dbo].[RegionPatch] ADD  DEFAULT ('') FOR [convexString]
GO
ALTER TABLE [dbo].[SpecObjAll] ADD  DEFAULT (0x1111) FOR [img]
GO
ALTER TABLE [dbo].[WISE_allsky] ADD  DEFAULT ((0)) FOR [glat]
GO
ALTER TABLE [dbo].[WISE_allsky] ADD  DEFAULT ((0)) FOR [glon]
GO
