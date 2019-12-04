

/****** Object:  Table [dbo].[PlateX]    Script Date: 12/3/2019 12:29:39 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

drop table if exists dbo.PlateX
go


CREATE TABLE [dbo].[PlateX](
	[plateID] [numeric](20, 0) NOT NULL,
	[firstRelease] [varchar](32) NOT NULL,
	[plate] [smallint] NOT NULL,
	[mjd] [int] NOT NULL,
	[mjdList] [varchar](512) NOT NULL,
	[survey] [varchar](32) NOT NULL,
	[programName] [varchar](32) NOT NULL,
	[instrument] [varchar](32) NOT NULL,
	[chunk] [varchar](32) NOT NULL,
	[plateRun] [varchar](128) NOT NULL,
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
	[loadVersion] [int] NOT NULL,
 CONSTRAINT [pk_PlateX_plateID] PRIMARY KEY CLUSTERED 
(
	[plateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [SPEC]
) ON [SPEC]
GO


insert PlateX with (tablock)
select * from BESTTEST.dbo.PlateX

SET ANSI_NULLS ON; SET ANSI_PADDING ON; SET ANSI_WARNINGS ON; SET ARITHABORT OFF; SET CONCAT_NULL_YIELDS_NULL ON;  SET NUMERIC_ROUNDABORT OFF; SET QUOTED_IDENTIFIER ON; CREATE INDEX i_PlateX_htmID_ra_dec_cx_cy_cz ON PlateX(htmID,ra,dec,cx,cy,cz) WITH (SORT_IN_TEMPDB=ON ,DATA_COMPRESSION = page) ON [SPEC]




