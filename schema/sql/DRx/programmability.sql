
/****** Object:  UserDefinedType [dbo].[Point]    Script Date: 4/6/2018 11:07:18 AM ******/
CREATE TYPE [dbo].[Point]
EXTERNAL NAME [SphericalSql].[Spherical.Sql.PointUDT]
GO
/****** Object:  UserDefinedType [dbo].[Region]    Script Date: 4/6/2018 11:07:18 AM ******/
CREATE TYPE [dbo].[Region]
EXTERNAL NAME [SphericalSql].[Spherical.Sql.RegionUDT]
GO
/****** Object:  UserDefinedFunction [dbo].[fAncillaryTarget1]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fAncillaryTarget1](@name varchar(40))
-------------------------------------------------------------
--/H Returns the AncillaryTarget1 value corresponding to a name
-------------------------------------------------------------
--/T the spectro ancillaryTarget1 flags can be shown with Select * from AncillaryTarget1 
--/T <br>
--/T Sample call to find spec objects that are low-redshift galaxy ancillary primary targets
--/T <samp> 
--/T <br> select top 10 * 
--/T <br> from specObj 
--/T <br> where ancillary_target1 & dbo.fAncillaryTarget1('LOWZ_GALAXY') > 0 
--/T </samp> 
--/T <br> see also fSecTarget
-------------------------------------------------------------
RETURNS bigint
AS BEGIN
RETURN ( SELECT cast(value as bigint)
	FROM AncillaryTarget1
	WHERE name = UPPER(@name)
	)
END
GO
/****** Object:  UserDefinedFunction [dbo].[fAncillaryTarget1N]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fAncillaryTarget1N](@value bigint)
---------------------------------------------------
--/H Returns the expanded AncillaryTarget1 corresponding to the flag value as a string
---------------------------------------------------
--/T The spectro ancillaryTarget1 flags can be shown with Select * from AncillaryTarget1 
--/T <br>
--/T Sample call to show the ancillary target flags of some spec objects is
--/T <samp> 
--/T <br> select top 10 specObjId, dbo.fAncillaryTarget1N(ancillary_target1) as ancillaryTarget1
--/T <br> from specObj 
--/T <br> where ancillary_target1 > 0
--/T </samp> 
--/T <br> see also fAncillaryTarget1, fSecTargetN
-------------------------------------------------------------
RETURNS varchar(1000)
BEGIN
    DECLARE @bit int, @mask bigint, @out varchar(2000);
    SET @bit=32;
    SET @out ='';
    WHILE (@bit>0)
	BEGIN
	    SET @bit = @bit-1;
	    SET @mask = power(cast(2 as bigint),@bit);
	    SET @out = @out + (CASE 
		WHEN (@mask & @value)=0 THEN '' 
		ELSE coalesce((select name from AncillaryTarget1 where value=@mask),'')+' '
	    	END);
	END
    RETURN @out;
END
GO
/****** Object:  UserDefinedFunction [dbo].[fAncillaryTarget2]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fAncillaryTarget2](@name varchar(40))
-------------------------------------------------------------
--/H Returns the AncillaryTarget2 value corresponding to a name
-------------------------------------------------------------
--/T the spectro ancillaryTarget2 flags can be shown with Select * from AncillaryTarget2 
--/T <br>
--/T Sample call to find high-z quasar candidate spec objects that are BOSS ancillary targets
--/T <samp> 
--/T <br> select top 10 * 
--/T <br> from specObj 
--/T <br> where ancillary_target2 & dbo.fAncillaryTarget2('HIZQSOIR') > 0 
--/T </samp> 
--/T <br> see also fAncillaryTarget1
-------------------------------------------------------------
RETURNS bigint
AS BEGIN
RETURN ( SELECT cast(value as bigint)
	FROM AncillaryTarget2
	WHERE name = UPPER(@name)
	)
END
GO
/****** Object:  UserDefinedFunction [dbo].[fAncillaryTarget2N]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fAncillaryTarget2N](@value bigint)
---------------------------------------------------
--/H Returns the expanded AncillaryTarget2 corresponding to the flag value as a string
---------------------------------------------------
--/T The spectro ancillaryTarget2 flags can be shown with Select * from AncillaryTarget2 
--/T <br>
--/T Sample call to show the ancillary target flags of some spec objects is
--/T <samp> 
--/T <br> select top 10 specObjId, dbo.fAncillaryTarget2N(ancillary_target2) as ancillaryTarget2
--/T <br> from specObj 
--/T <br> where ancillary_target2 > 0
--/T </samp> 
--/T <br> see also fAncillaryTarget2, fSecTargetN
-------------------------------------------------------------
RETURNS varchar(1000)
BEGIN
    DECLARE @bit int, @mask bigint, @out varchar(2000);
    SET @bit=32;
    SET @out ='';
    WHILE (@bit>0)
	BEGIN
	    SET @bit = @bit-1;
	    SET @mask = power(cast(2 as bigint),@bit);
	    SET @out = @out + (CASE 
		WHEN (@mask & @value)=0 THEN '' 
		ELSE coalesce((select name from AncillaryTarget2 where value=@mask),'')+' '
	    	END);
	END
    RETURN @out;
END
GO
/****** Object:  UserDefinedFunction [dbo].[fApogeeAspcapFlag]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fApogeeAspcapFlag](@name varchar(40))
-------------------------------------------------------------
--/H Returns the ApogeeAspcapFlag value corresponding to a name
-------------------------------------------------------------
--/T the spectro ApogeeAspcapFlag flags can be shown with Select * from ApogeeAspcapFlag 
--/T <br>
--/T Sample call to find APOGEE 
--/T <samp> 
--/T <br> select top 10 * 
--/T <br> from aspcapStar
--/T <br> where ApogeeAspcapFlag & dbo.fApogeeAspcapFlag('CRPIX') > 0 
--/T </samp> 
--/T <br> see also fApogeeTarget1
-------------------------------------------------------------
RETURNS bigint
AS BEGIN
RETURN ( SELECT cast(value as bigint)
	FROM ApogeeAspcapFlag
	WHERE name = UPPER(@name)
	)
END
GO
/****** Object:  UserDefinedFunction [dbo].[fApogeeAspcapFlagN]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fApogeeAspcapFlagN](@value bigint)
---------------------------------------------------
--/H Returns the expanded ApogeeAspcapFlag corresponding to the flag value as a string
---------------------------------------------------
--/T The APOGEE ASPCAP flags can be shown with Select * from ApogeeAspcapFlag 
--/T <br>
--/T Sample call to show the APOGEE ASPCAP flags of some APOGEE objects is
--/T <samp> 
--/T <br> select top 10 apstar_id, dbo.fApogeeAspcapFlagN(aspcap_flag) as apogeeAspcapFLag
--/T <br> from aspcapStar
--/T </samp> 
--/T <br> see also fApogeeAspcapFlag, fApogeeTarget1N
-------------------------------------------------------------
RETURNS varchar(1000)
BEGIN
    DECLARE @bit int, @mask bigint, @out varchar(2000);
    SET @bit=32;
    SET @out ='';
    WHILE (@bit>0)
	BEGIN
	    SET @bit = @bit-1;
	    SET @mask = power(cast(2 as bigint),@bit);
	    SET @out = @out + (CASE 
		WHEN (@mask & @value)=0 THEN '' 
		ELSE coalesce((select name from ApogeeAspcapFlag where value=@mask),'')+' '
	    	END);
	END
    RETURN @out;
END
GO
/****** Object:  UserDefinedFunction [dbo].[fApogeeExtraTarg]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fApogeeExtraTarg](@name varchar(40))
-------------------------------------------------------------
--/H Returns the ApogeeExtraTarg value corresponding to a name
-------------------------------------------------------------
--/T the spectro ApogeeExtraTarg flags can be shown with Select * from ApogeeExtraTarg 
--/T <br>
--/T Sample call to find APOGEE 
--/T <samp> 
--/T <br> select top 10 * 
--/T <br> from apogeeVisit
--/T <br> where ApogeeExtraTarg & dbo.fApogeeExtraTarg('TELLURIC') > 0 
--/T </samp> 
--/T <br> see also fApogeeTarget1
-------------------------------------------------------------
RETURNS bigint
AS BEGIN
RETURN ( SELECT cast(value as bigint)
	FROM ApogeeExtraTarg
	WHERE name = UPPER(@name)
	)
END
GO
/****** Object:  UserDefinedFunction [dbo].[fApogeeExtraTargN]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fApogeeExtraTargN](@value int)
---------------------------------------------------
--/H Returns the expanded ApogeeExtraTarg corresponding to the flag value as a string
---------------------------------------------------
--/T The APOGEE extraTarg flags can be shown with Select * from ApogeeExtraTarg 
--/T <br>
--/T Sample call to show the apogee target flags of some spec objects is
--/T <samp> 
--/T <br> select top 10 visit_id, dbo.fApogeeExtraTargN(extraTarg) as apogeeTarget2
--/T <br> from apogeeVisit
--/T </samp> 
--/T <br> see also fApogeeExtraTarg, fApogeeTarget1N
-------------------------------------------------------------
RETURNS varchar(1000)
BEGIN
    DECLARE @bit int, @mask bigint, @out varchar(2000);
    SET @bit=32;
    SET @out ='';
    WHILE (@bit>0)
	BEGIN
	    SET @bit = @bit-1;
	    SET @mask = power(cast(2 as bigint),@bit);
	    SET @out = @out + (CASE 
		WHEN (@mask & @value)=0 THEN '' 
		ELSE coalesce((select name from ApogeeExtraTarg where value=@mask),'')+' '
	    	END);
	END
    RETURN @out;
END
GO
/****** Object:  UserDefinedFunction [dbo].[fApogeeParamFlag]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fApogeeParamFlag](@name varchar(40))
-------------------------------------------------------------
--/H Returns the ApogeeParamFlag value corresponding to a name
-------------------------------------------------------------
--/T the spectro ApogeeParamFlag flags can be shown with Select * from ApogeeParamFlag 
--/T <br>
--/T Sample call to find APOGEE 
--/T <samp> 
--/T <br> select top 10 * 
--/T <br> from apogeeStar
--/T <br> where ApogeeParamFlag & dbo.fApogeeParamFlag('CRPIX') > 0 
--/T </samp> 
--/T <br> see also fApogeeTarget1
-------------------------------------------------------------
RETURNS bigint
AS BEGIN
RETURN ( SELECT cast(value as bigint)
	FROM ApogeeParamFlag
	WHERE name = UPPER(@name)
	)
END
GO
/****** Object:  UserDefinedFunction [dbo].[fApogeeParamFlagN]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fApogeeParamFlagN](@value int)
---------------------------------------------------
--/H Returns the expanded ApogeeParamFlag corresponding to the flag value as a string
---------------------------------------------------
--/T The spectro apogeeTarget2 flags can be shown with Select * from ApogeeParamFlag 
--/T <br>
--/T Sample call to show the apogee target flags of some spec objects is
--/T <samp> 
--/T <br> select top 10 apstar_id, dbo.fApogeeParamFlagN(apogeeTarget2) as apogeeTarget2
--/T <br> from apogeeStar
--/T </samp> 
--/T <br> see also fApogeeParamFlag, fApogeeTarget1N
-------------------------------------------------------------
RETURNS varchar(1000)
BEGIN
    DECLARE @bit int, @mask bigint, @out varchar(2000);
    SET @bit=32;
    SET @out ='';
    WHILE (@bit>0)
	BEGIN
	    SET @bit = @bit-1;
	    SET @mask = power(cast(2 as bigint),@bit);
	    SET @out = @out + (CASE 
		WHEN (@mask & @value)=0 THEN '' 
		ELSE coalesce((select name from ApogeeParamFlag where value=@mask),'')+' '
	    	END);
	END
    RETURN @out;
END
GO
/****** Object:  UserDefinedFunction [dbo].[fApogeeStarFlag]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fApogeeStarFlag](@name varchar(40))
-------------------------------------------------------------
--/H Returns the ApogeeStarFlag value corresponding to a name
-------------------------------------------------------------
--/T the spectro ApogeeStarFlag flags can be shown with Select * from ApogeeStarFlag 
--/T <br>
--/T Sample call to find APOGEE 
--/T <samp> 
--/T <br> select top 10 * 
--/T <br> from apogeeStar
--/T <br> where ApogeeStarFlag & dbo.fApogeeStarFlag('CRPIX') > 0 
--/T </samp> 
--/T <br> see also fApogeeTarget1
-------------------------------------------------------------
RETURNS bigint
AS BEGIN
RETURN ( SELECT cast(value as bigint)
	FROM ApogeeStarFlag
	WHERE name = UPPER(@name)
	)
END
GO
/****** Object:  UserDefinedFunction [dbo].[fApogeeStarFlagN]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fApogeeStarFlagN](@value bigint)
---------------------------------------------------
--/H Returns the expanded ApogeeStarFlag corresponding to the flag value as a string
---------------------------------------------------
--/T The spectro apogeeTarget2 flags can be shown with Select * from ApogeeStarFlag 
--/T <br>
--/T Sample call to show the apogee target flags of some spec objects is
--/T <samp> 
--/T <br> select top 10 apstar_id, dbo.fApogeeStarFlagN(apogee_starflag) as apogeeStarFlag
--/T <br> from apogeeStar
--/T </samp> 
--/T <br> see also fApogeeStarFlag, fApogeeTarget1N
-------------------------------------------------------------
RETURNS varchar(1000)
BEGIN
    DECLARE @bit int, @mask bigint, @out varchar(2000);
    SET @bit=32;
    SET @out ='';
    WHILE (@bit>0)
	BEGIN
	    SET @bit = @bit-1;
	    SET @mask = power(cast(2 as bigint),@bit);
	    SET @out = @out + (CASE 
		WHEN (@mask & @value)=0 THEN '' 
		ELSE coalesce((select name from ApogeeStarFlag where value=@mask),'')+' '
	    	END);
	END
    RETURN @out;
END
GO
/****** Object:  UserDefinedFunction [dbo].[fApogeeTarget1]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fApogeeTarget1](@name varchar(40))
-------------------------------------------------------------
--/H Returns the ApogeeTarget1 value corresponding to a name
-------------------------------------------------------------
--/T the spectro apogeeTarget1 flags can be shown with Select * from ApogeeTarget1 
--/T <br>
--/T Sample call to find APOGEE extended objects
--/T <samp> 
--/T <br> select top 10 * 
--/T <br> from apogeeStar 
--/T <br> where apogeeTarget1 & dbo.fApogeeTarget1('APOGEE_EXTENDED') > 0 
--/T </samp> 
--/T <br> see also fApogeeTarget2
-------------------------------------------------------------
RETURNS bigint
AS BEGIN
RETURN ( SELECT cast(value as bigint)
	FROM ApogeeTarget1
	WHERE name = UPPER(@name)
	)
END
GO
/****** Object:  UserDefinedFunction [dbo].[fApogeeTarget1N]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fApogeeTarget1N](@value bigint)
---------------------------------------------------
--/H Returns the expanded ApogeeTarget1 corresponding to the flag value as a string
---------------------------------------------------
--/T The spectro apogeeTarget1 flags can be shown with Select * from ApogeeTarget1 
--/T <br>
--/T Sample call to show the apogee target flags of some APOGEE objects is
--/T <samp> 
--/T <br> select top 10 specObjId, dbo.fApogeeTarget1N(apogee_target1) as apogeeTarget1
--/T <br> from apogeeVisit
--/T </samp> 
--/T <br> see also fApogeeTarget1, fApogeeTarget2
-------------------------------------------------------------
RETURNS varchar(1000)
BEGIN
    DECLARE @bit int, @mask bigint, @out varchar(2000);
    SET @bit=32;
    SET @out ='';
    WHILE (@bit>0)
	BEGIN
	    SET @bit = @bit-1;
	    SET @mask = power(cast(2 as bigint),@bit);
	    SET @out = @out + (CASE 
		WHEN (@mask & @value)=0 THEN '' 
		ELSE coalesce((select name from ApogeeTarget1 where value=@mask),'')+' '
	    	END);
	END
    RETURN @out;
END
GO
/****** Object:  UserDefinedFunction [dbo].[fApogeeTarget2]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fApogeeTarget2](@name varchar(40))
-------------------------------------------------------------
--/H Returns the ApogeeTarget2 value corresponding to a name
-------------------------------------------------------------
--/T the spectro ApogeeTarget2 flags can be shown with Select * from ApogeeTarget2 
--/T <br>
--/T Sample call to find radial velocity standard apogee spectra
--/T <samp> 
--/T <br> select top 10 * 
--/T <br> from apogeeStar
--/T <br> where ApogeeTarget2 & dbo.fApogeeTarget2('APOGEE_RV_STANDARD') > 0 
--/T </samp> 
--/T <br> see also fApogeeTarget1
-------------------------------------------------------------
RETURNS bigint
AS BEGIN
RETURN ( SELECT cast(value as bigint)
	FROM ApogeeTarget2
	WHERE name = UPPER(@name)
	)
END
GO
/****** Object:  UserDefinedFunction [dbo].[fApogeeTarget2N]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fApogeeTarget2N](@value bigint)
---------------------------------------------------
--/H Returns the expanded ApogeeTarget2 corresponding to the flag value as a string
---------------------------------------------------
--/T The spectro apogeeTarget2 flags can be shown with Select * from ApogeeTarget2 
--/T <br>
--/T Sample call to show the apogee target flags of some APOGEEobjects is
--/T <samp> 
--/T <br> select top 10 apstar_id, dbo.fApogeeTarget2N(apogee_target2) as apogeeTarget2
--/T <br> from apogeeVisit
--/T </samp> 
--/T <br> see also fApogeeTarget2, fApogeeTarget1N
-------------------------------------------------------------
RETURNS varchar(1000)
BEGIN
    DECLARE @bit int, @mask bigint, @out varchar(2000);
    SET @bit=32;
    SET @out ='';
    WHILE (@bit>0)
	BEGIN
	    SET @bit = @bit-1;
	    SET @mask = power(cast(2 as bigint),@bit);
	    SET @out = @out + (CASE 
		WHEN (@mask & @value)=0 THEN '' 
		ELSE coalesce((select name from ApogeeTarget2 where value=@mask),'')+' '
	    	END);
	END
    RETURN @out;
END
GO
/****** Object:  UserDefinedFunction [dbo].[fAspcapElemErrs]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fAspcapElemErrs] (@aspcap_id VARCHAR(64))
-------------------------------------------------------------
--/H Returns table of APOGEE aspcap element abundance errors.
-------------------------------------------------------------
--/T This function returns the errors associated with APOGEE aspcapStar element abundances for a given aspcap_id.
--/T <p>returned table:
--/T <li> c_fe_err real NOT NULL,       -- external uncertainty for empirically calibrated [C/Fe] from ASPCAP
--/T <li> ci_fe_err real NOT NULL,      -- external uncertainty for empirically calibrated [CI/Fe] from ASPCAP
--/T <li> n_fe_err real NOT NULL,       -- external uncertainty for empirically calibrated [N/Fe] from ASPCAP
--/T <li> o_fe_err real NOT NULL,       -- external uncertainty for empirically calibrated [O/Fe] from ASPCAP
--/T <li> na_fe_err real NOT NULL,      -- external uncertainty for empirically calibrated [Na/Fe] from ASPCAP
--/T <li> mg_fe_err real NOT NULL,      -- external uncertainty for empirically calibrated [Mg/Fe] from ASPCAP
--/T <li> al_fe_err real NOT NULL,      -- external uncertainty for empirically calibrated [Al/Fe] from ASPCAP
--/T <li> si_fe_err real NOT NULL,      -- external uncertainty for empirically calibrated [Si/Fe] from ASPCAP
--/T <li> p_fe_err real NOT NULL,       -- external uncertainty for empirically calibrated [P/Fe] from ASPCAP
--/T <li> s_fe_err real NOT NULL,       -- external uncertainty for empirically calibrated [S/Fe] from ASPCAP
--/T <li> k_fe_err real NOT NULL,       -- external uncertainty for empirically calibrated [K/Fe] from ASPCAP
--/T <li> ca_fe_err real NOT NULL,      -- external uncertainty for empirically calibrated [Ca/Fe] from ASPCAP
--/T <li> ti_fe_err real NOT NULL,      -- external uncertainty for empirically calibrated [Ti/Fe] from ASPCAP
--/T <li> tiii_fe_err real NOT NULL,    -- external uncertainty for empirically calibrated [TiII/Fe] from ASPCAP
--/T <li> v_fe_err real NOT NULL,       -- external uncertainty for empirically calibrated [V/Fe] from ASPCAP
--/T <li> cr_fe_err real NOT NULL,      -- external uncertainty for empirically calibrated [Cr/Fe] from ASPCAP
--/T <li> mn_fe_err real NOT NULL,      -- external uncertainty for empirically calibrated [Mn/Fe] from ASPCAP
--/T <li> fe_h_err real NOT NULL,       -- external uncertainty for empirically calibrated [Fe/H] from ASPCAP
--/T <li> co_fe_err real NOT NULL,      -- external uncertainty for empirically calibrated [Co/Fe] from ASPCAP
--/T <li> ni_fe_err real NOT NULL,      -- external uncertainty for empirically calibrated [Ni/Fe] from ASPCAP
--/T <li> cu_fe_err real NOT NULL,      -- external uncertainty for empirically calibrated [Cu/Fe] from ASPCAP
--/T <li> ge_fe_err real NOT NULL,      -- external uncertainty for empirically calibrated [Ge/Fe] from ASPCAP
--/T <li> rb_fe_err real NOT NULL,      -- external uncertainty for empirically calibrated [Rb/Fe] from ASPCAP
--/T <li> y_fe_err real NOT NULL,       -- external uncertainty for empirically calibrated [Y/Fe] from ASPCAP
--/T <li> nd_fe_err real NOT NULL,      -- external uncertainty for empirically calibrated [Nd/Fe] from ASPCAP
--/T <br> Sample call to get aspcap element abundance errors:
--/T <br><samp>
--/T <br>select TOP 10 a.apstar_id, b.*
--/T <br> from aspcapStar a CROSS APPLY dbo.fAspcapElemErrs( a.aspcap_id ) b
--/T </samp>
--/T <br>see also fAspcapElemsAll, fAspcapElems, fAspcapElemFlags
-------------------------------------------------------------
  RETURNS @etab TABLE (
    c_fe_err real NOT NULL,
    ci_fe_err real NOT NULL,
    n_fe_err real NOT NULL,
    o_fe_err real NOT NULL,
    na_fe_err real NOT NULL,
    mg_fe_err real NOT NULL,
    al_fe_err real NOT NULL,
    si_fe_err real NOT NULL,
    p_fe_err real NOT NULL,
    s_fe_err real NOT NULL,
    k_fe_err real NOT NULL,
    ca_fe_err real NOT NULL,
    ti_fe_err real NOT NULL,
    tiii_fe_err real NOT NULL,
    v_fe_err real NOT NULL,
    cr_fe_err real NOT NULL,
    mn_fe_err real NOT NULL,
    fe_h_err real NOT NULL,
    co_fe_err real NOT NULL,
    ni_fe_err real NOT NULL,
    cu_fe_err real NOT NULL,
    ge_fe_err real NOT NULL,
    rb_fe_err real NOT NULL,
    y_fe_err real NOT NULL,
    nd_fe_err real NOT NULL
  ) AS 
BEGIN
	INSERT @etab
		SELECT 
            c_fe_err,
            ci_fe_err,
            n_fe_err,
            o_fe_err,
            na_fe_err,
            mg_fe_err,
            al_fe_err,
            si_fe_err,
            p_fe_err,
            s_fe_err,
            k_fe_err,
            ca_fe_err,
            ti_fe_err,
            tiii_fe_err,
            v_fe_err,
            cr_fe_err,
            mn_fe_err,
            fe_h_err,
            co_fe_err,
            ni_fe_err,
            cu_fe_err,
            ge_fe_err,
            rb_fe_err,
            y_fe_err,
            nd_fe_err
		FROM aspcapStar WHERE aspcap_id = @aspcap_id
  RETURN
  END
GO
/****** Object:  UserDefinedFunction [dbo].[fAspcapElemFlags]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fAspcapElemFlags] (@aspcap_id VARCHAR(64))
-------------------------------------------------------------
--/H Returns table of APOGEE aspcap element abundance flags.
-------------------------------------------------------------
--/T This function returns the flags associated with APOGEE aspcapStar element abundances for a given aspcap_id.
--/T <p>returned table:
--/T <li> c_fe_flag int NOT NULL,       -- ELEMFLAG for C (see http://www.sdss.org/dr12/algorithms/bitmasks/#APOGEE_ELEMFLAG)
--/T <li> ci_fe_flag int NOT NULL,      -- ELEMFLAG for CI
--/T <li> n_fe_flag int NOT NULL,       -- ELEMFLAG for N
--/T <li> o_fe_flag int NOT NULL,       -- ELEMFLAG for O
--/T <li> na_fe_flag int NOT NULL,      -- ELEMFLAG for Na
--/T <li> mg_fe_flag int NOT NULL,      -- ELEMFLAG for Mg
--/T <li> al_fe_flag int NOT NULL,      -- ELEMFLAG for Al
--/T <li> si_fe_flag int NOT NULL,      -- ELEMFLAG for Si
--/T <li> p_fe_flag int NOT NULL,       -- ELEMFLAG for Si
--/T <li> s_fe_flag int NOT NULL,       -- ELEMFLAG for S
--/T <li> k_fe_flag int NOT NULL,       -- ELEMFLAG for K
--/T <li> ca_fe_flag int NOT NULL,      -- ELEMFLAG for Ca
--/T <li> ti_fe_flag int NOT NULL,      -- ELEMFLAG for Ti
--/T <li> tiii_fe_flag int NOT NULL,    -- ELEMFLAG for TiII
--/T <li> v_fe_flag int NOT NULL,       -- ELEMFLAG for V
--/T <li> cr_fe_flag int NOT NULL,      -- ELEMFLAG for Cr
--/T <li> mn_fe_flag int NOT NULL,      -- ELEMFLAG for Mn
--/T <li> fe_h_flag int NOT NULL,       -- ELEMFLAG for Fe
--/T <li> co_fe_flag int NOT NULL,      -- ELEMFLAG for Co
--/T <li> ni_fe_flag int NOT NULL,      -- ELEMFLAG for Ni
--/T <li> cu_fe_flag int NOT NULL,      -- ELEMFLAG for Cu
--/T <li> ge_fe_flag int NOT NULL,      -- ELEMFLAG for Ge
--/T <li> rb_fe_flag int NOT NULL,      -- ELEMFLAG for Rb
--/T <li> y_fe_flag int NOT NULL,       -- ELEMFLAG for Y
--/T <li> nd_fe_flag int NOT NULL,      -- ELEMFLAG for Nd
--/T <br> Sample call to get aspcap element abundance flags:
--/T <br><samp>
--/T <br>select TOP 10 a.apstar_id, b.*
--/T <br> from aspcapStar a CROSS APPLY dbo.fAspcapElemFlags( a.aspcap_id ) b
--/T </samp>
--/T <br>see also fAspcapElems, fAspcapElemErrs, fAspcapElemsAll
-------------------------------------------------------------
  RETURNS @etab TABLE (
    c_fe_flag int NOT NULL,
    ci_fe_flag int NOT NULL,
    n_fe_flag int NOT NULL,
    o_fe_flag int NOT NULL,
    na_fe_flag int NOT NULL,
    mg_fe_flag int NOT NULL,
    al_fe_flag int NOT NULL,
    si_fe_flag int NOT NULL,
    p_fe_flag int NOT NULL,
    s_fe_flag int NOT NULL,
    k_fe_flag int NOT NULL,
    ca_fe_flag int NOT NULL,
    ti_fe_flag int NOT NULL,
    tiii_fe_flag int NOT NULL,
    v_fe_flag int NOT NULL,
    cr_fe_flag int NOT NULL,
    mn_fe_flag int NOT NULL,
    fe_h_flag int NOT NULL,
    co_fe_flag int NOT NULL,
    ni_fe_flag int NOT NULL,
    cu_fe_flag int NOT NULL,
    ge_fe_flag int NOT NULL,
    rb_fe_flag int NOT NULL,
    y_fe_flag int NOT NULL,
    nd_fe_flag int NOT NULL
  ) AS 
BEGIN
	INSERT @etab
		SELECT 
            c_fe_flag,
            ci_fe_flag,
            n_fe_flag,
            o_fe_flag,
            na_fe_flag,
            mg_fe_flag,
            al_fe_flag,
            si_fe_flag,
            p_fe_flag,
            s_fe_flag,
            k_fe_flag,
            ca_fe_flag,
            ti_fe_flag,
            tiii_fe_flag,
            v_fe_flag,
            cr_fe_flag,
            mn_fe_flag,
            fe_h_flag,
            co_fe_flag,
            ni_fe_flag,
            cu_fe_flag,
            ge_fe_flag,
            rb_fe_flag,
            y_fe_flag,
            nd_fe_flag
		FROM aspcapStar WHERE aspcap_id = @aspcap_id
  RETURN
  END
GO
/****** Object:  UserDefinedFunction [dbo].[fAspcapElems]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fAspcapElems] (@aspcap_id VARCHAR(64))
-------------------------------------------------------------
--/H Returns table of APOGEE aspcap element abundances.
-------------------------------------------------------------
--/T This function returns the APOGEE aspcapStar element abundances for a given aspcap_id.
--/T <p>returned table:
--/T <li> c_fe real NOT NULL,           -- empirically calibrated [C/Fe] from ASPCAP; [C/Fe] is calculated as (ASPCAP [C/M])+param_metals
--/T <li> ci_fe real NOT NULL,          -- empirically calibrated [CI/Fe] from ASPCAP; [C/Fe] is calculated as (ASPCAP [C/M])+param_metals
--/T <li> n_fe real NOT NULL,           -- empirically calibrated [N/Fe] from ASPCAP; [N/Fe] is calculated as (ASPCAP [N/M])+param_metals
--/T <li> o_fe real NOT NULL,           -- empirically calibrated [O/Fe] from ASPCAP; [O/Fe] is calculated as (ASPCAP [O/M])+param_metals
--/T <li> na_fe real NOT NULL,          -- empirically calibrated [Na/Fe] from ASPCAP
--/T <li> mg_fe real NOT NULL,          -- empirically calibrated [Mg/Fe] from ASPCAP; [Mg/Fe] is calculated as (ASPCAP [Mg/M])+param_metals
--/T <li> al_fe real NOT NULL,          -- empirically calibrated [Al/Fe] from ASPCAP
--/T <li> si_fe real NOT NULL,          -- empirically calibrated [Si/Fe] from ASPCAP; [Si/Fe] is calculated as (ASPCAP [Si/M])+param_metals
--/T <li> p_fe real NOT NULL,           -- empirically calibrated [P/Fe] from ASPCAP; [P/Fe] is calculated as (ASPCAP [P/M])+param_metals
--/T <li> s_fe real NOT NULL,           -- empirically calibrated [S/Fe] from ASPCAP; [S/Fe] is calculated as (ASPCAP [S/M])+param_metals
--/T <li> k_fe real NOT NULL,           -- empirically calibrated [K/Fe] from ASPCAP
--/T <li> ca_fe real NOT NULL,          -- empirically calibrated [Ca/Fe] from ASPCAP ; [Ca/Fe] is calculated as (ASPCAP [Ca/M])+param_metals
--/T <li> ti_fe real NOT NULL,          -- empirically calibrated [Ti/Fe] from ASPCAP; [Ti/Fe] is calculated as (ASPCAP [Ti/M])+param_metals
--/T <li> tiii_fe real NOT NULL,        -- empirically calibrated [TiII/Fe] from ASPCAP; [TiII/Fe] is calculated as (ASPCAP [TiII/M])+param_metals
--/T <li> v_fe real NOT NULL,           -- empirically calibrated [V/Fe] from ASPCAP
--/T <li> cr_fe real NOT NULL,          -- empirically calibrated [Cr/Fe] from ASPCAP
--/T <li> mn_fe real NOT NULL,          -- empirically calibrated [Mn/Fe] from ASPCAP
--/T <li> fe_h real NOT NULL,           -- empirically calibrated [Fe/H] from ASPCAP
--/T <li> co_fe real NOT NULL,          -- empirically calibrated [Co/Fe] from ASPCAP
--/T <li> ni_fe real NOT NULL,          -- empirically calibrated [Ni/Fe] from ASPCAP
--/T <li> cu_fe real NOT NULL,          -- empirically calibrated [Cu/Fe] from ASPCAP
--/T <li> ge_fe real NOT NULL,          -- empirically calibrated [Ge/Fe] from ASPCAP
--/T <li> rb_fe real NOT NULL,          -- empirically calibrated [Rb/Fe] from ASPCAP
--/T <li> y_fe real NOT NULL,           -- empirically calibrated [Y/Fe] from ASPCAP
--/T <li> nd_fe real NOT NULL,          -- empirically calibrated [Nd/Fe] from ASPCAP
--/T <br> Sample call to get aspcap element abundances:
--/T <br><samp>
--/T <br>select TOP 10 a.apstar_id, b.*
--/T <br> from aspcapStar a CROSS APPLY dbo.fAspcapElems( a.aspcap_id ) b
--/T </samp>
--/T <br>see also fAspcapElemsAll, fAspcapElemErrs, fAspcapElemFlags
-------------------------------------------------------------
  RETURNS @etab TABLE (
    c_fe real NOT NULL,
    ci_fe real NOT NULL,
    n_fe real NOT NULL,
    o_fe real NOT NULL,
    na_fe real NOT NULL,
    mg_fe real NOT NULL,
    al_fe real NOT NULL,
    si_fe real NOT NULL,
    p_fe real NOT NULL,
    s_fe real NOT NULL,
    k_fe real NOT NULL,
    ca_fe real NOT NULL,
    ti_fe real NOT NULL,
    tiii_fe real NOT NULL,
    v_fe real NOT NULL,
    cr_fe real NOT NULL,
    mn_fe real NOT NULL,
    fe_h real NOT NULL,
    co_fe real NOT NULL,
    ni_fe real NOT NULL,
    cu_fe real NOT NULL,
    ge_fe real NOT NULL,
    rb_fe real NOT NULL,
    y_fe real NOT NULL,
    nd_fe real NOT NULL
  ) AS 
BEGIN
	INSERT @etab
		SELECT 
            c_fe,
            ci_fe,
            n_fe,
            o_fe,
            na_fe,
            mg_fe,
            al_fe,
            si_fe,
            p_fe,
            s_fe,
            k_fe,
            ca_fe,
            ti_fe,
            tiii_fe,
            v_fe,
            cr_fe,
            mn_fe,
            fe_h,
            co_fe,
            ni_fe,
            cu_fe,
            ge_fe,
            rb_fe,
            y_fe,
            nd_fe
		FROM aspcapStar WHERE aspcap_id = @aspcap_id
  RETURN
  END
GO
/****** Object:  UserDefinedFunction [dbo].[fAspcapElemsAll]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fAspcapElemsAll] (@aspcap_id VARCHAR(64))
-------------------------------------------------------------
--/H Returns table of APOGEE aspcap element abundances along with their errors and flags.
-------------------------------------------------------------
--/T This function returns the APOGEE aspcapStar element abundances for a given aspcap_id, along with their associated errors and flags.
--/T <p>returned table:
--/T <li> c_fe real NOT NULL,         -- empirically calibrated [C/Fe] from ASPCAP; [C/Fe] is calculated as (ASPCAP [C/M])+param_metals
--/T <li> c_fe_err real NOT NULL,     -- external uncertainty for empirically calibrated [C/Fe] from ASPCAP
--/T <li> c_fe_flag int NOT NULL,     -- ELEMFLAG for C (see http://www.sdss.org/dr12/algorithms/bitmasks/#APOGEE_ELEMFLAG)
--/T <li> ci_fe real NOT NULL,        -- empirically calibrated [CI/Fe] from ASPCAP; [C/Fe] is calculated as (ASPCAP [C/M])+param_metals
--/T <li> ci_fe_err real NOT NULL,    -- external uncertainty for empirically calibrated [CI/Fe] from ASPCAP
--/T <li> ci_fe_flag int NOT NULL,    -- ELEMFLAG for CI
--/T <li> n_fe real NOT NULL,         -- empirically calibrated [N/Fe] from ASPCAP; [N/Fe] is calculated as (ASPCAP [N/M])+param_metals
--/T <li> n_fe_err real NOT NULL,     -- external uncertainty for empirically calibrated [N/Fe] from ASPCAP
--/T <li> n_fe_flag int NOT NULL,     -- ELEMFLAG for N
--/T <li> o_fe real NOT NULL,         -- empirically calibrated [O/Fe] from ASPCAP; [O/Fe] is calculated as (ASPCAP [O/M])+param_metals
--/T <li> o_fe_err real NOT NULL,     -- external uncertainty for empirically calibrated [O/Fe] from ASPCAP
--/T <li> o_fe_flag int NOT NULL,     -- ELEMFLAG for O
--/T <li> na_fe real NOT NULL,        -- empirically calibrated [Na/Fe] from ASPCAP
--/T <li> na_fe_err real NOT NULL,    -- external uncertainty for empirically calibrated [Na/Fe] from ASPCAP
--/T <li> na_fe_flag int NOT NULL,    -- ELEMFLAG for Na
--/T <li> mg_fe real NOT NULL,        -- empirically calibrated [Mg/Fe] from ASPCAP; [Mg/Fe] is calculated as (ASPCAP [Mg/M])+param_metals
--/T <li> mg_fe_err real NOT NULL,    -- external uncertainty for empirically calibrated [Mg/Fe] from ASPCAP
--/T <li> mg_fe_flag int NOT NULL,    -- ELEMFLAG for Mg
--/T <li> al_fe real NOT NULL,        -- empirically calibrated [Al/Fe] from ASPCAP
--/T <li> al_fe_err real NOT NULL,    -- external uncertainty for empirically calibrated [Al/Fe] from ASPCAP
--/T <li> al_fe_flag int NOT NULL,    -- ELEMFLAG for Al
--/T <li> si_fe real NOT NULL,        -- empirically calibrated [Si/Fe] from ASPCAP; [Si/Fe] is calculated as (ASPCAP [Si/M])+param_metals
--/T <li> si_fe_err real NOT NULL,    -- external uncertainty for empirically calibrated [Si/Fe] from ASPCAP
--/T <li> si_fe_flag int NOT NULL,    -- ELEMFLAG for Si
--/T <li> p_fe real NOT NULL,         -- empirically calibrated [P/Fe] from ASPCAP; [P/Fe] is calculated as (ASPCAP [P/M])+param_metals
--/T <li> p_fe_err real NOT NULL,     -- external uncertainty for empirically calibrated [P/Fe] from ASPCAP
--/T <li> p_fe_flag int NOT NULL,     -- ELEMFLAG for Si
--/T <li> s_fe real NOT NULL,         -- empirically calibrated [S/Fe] from ASPCAP; [S/Fe] is calculated as (ASPCAP [S/M])+param_metals
--/T <li> s_fe_err real NOT NULL,     -- external uncertainty for empirically calibrated [S/Fe] from ASPCAP
--/T <li> s_fe_flag int NOT NULL,     -- ELEMFLAG for S
--/T <li> k_fe real NOT NULL,         -- empirically calibrated [K/Fe] from ASPCAP
--/T <li> k_fe_err real NOT NULL,     -- external uncertainty for empirically calibrated [K/Fe] from ASPCAP
--/T <li> k_fe_flag int NOT NULL,     -- ELEMFLAG for K
--/T <li> ca_fe real NOT NULL,        -- empirically calibrated [Ca/Fe] from ASPCAP ; [Ca/Fe] is calculated as (ASPCAP [Ca/M])+param_metals
--/T <li> ca_fe_err real NOT NULL,    -- external uncertainty for empirically calibrated [Ca/Fe] from ASPCAP
--/T <li> ca_fe_flag int NOT NULL,    -- ELEMFLAG for Ca
--/T <li> ti_fe real NOT NULL,        -- empirically calibrated [Ti/Fe] from ASPCAP; [Ti/Fe] is calculated as (ASPCAP [Ti/M])+param_metals
--/T <li> ti_fe_err real NOT NULL,    -- external uncertainty for empirically calibrated [Ti/Fe] from ASPCAP
--/T <li> ti_fe_flag int NOT NULL,    -- ELEMFLAG for Ti
--/T <li> tiii_fe real NOT NULL,      -- empirically calibrated [TiII/Fe] from ASPCAP; [TiII/Fe] is calculated as (ASPCAP [TiII/M])+param_metals
--/T <li> tiii_fe_err real NOT NULL,  -- external uncertainty for empirically calibrated [TiII/Fe] from ASPCAP
--/T <li> tiii_fe_flag int NOT NULL,  -- ELEMFLAG for TiII
--/T <li> v_fe real NOT NULL,         -- empirically calibrated [V/Fe] from ASPCAP
--/T <li> v_fe_err real NOT NULL,     -- external uncertainty for empirically calibrated [V/Fe] from ASPCAP
--/T <li> v_fe_flag int NOT NULL,     -- ELEMFLAG for V
--/T <li> cr_fe real NOT NULL,        -- empirically calibrated [Cr/Fe] from ASPCAP
--/T <li> cr_fe_err real NOT NULL,    -- external uncertainty for empirically calibrated [Cr/Fe] from ASPCAP
--/T <li> cr_fe_flag int NOT NULL,    -- ELEMFLAG for Cr
--/T <li> mn_fe real NOT NULL,        -- empirically calibrated [Mn/Fe] from ASPCAP
--/T <li> mn_fe_err real NOT NULL,    -- external uncertainty for empirically calibrated [Mn/Fe] from ASPCAP
--/T <li> mn_fe_flag int NOT NULL,    -- ELEMFLAG for Mn
--/T <li> fe_h real NOT NULL,         -- empirically calibrated [Fe/H] from ASPCAP
--/T <li> fe_h_err real NOT NULL,     -- external uncertainty for empirically calibrated [Fe/H] from ASPCAP
--/T <li> fe_h_flag int NOT NULL,     -- ELEMFLAG for Fe
--/T <li> co_fe real NOT NULL,        -- empirically calibrated [Co/Fe] from ASPCAP
--/T <li> co_fe_err real NOT NULL,    -- external uncertainty for empirically calibrated [Co/Fe] from ASPCAP
--/T <li> co_fe_flag int NOT NULL,    -- ELEMFLAG for Co
--/T <li> ni_fe real NOT NULL,        -- empirically calibrated [Ni/Fe] from ASPCAP
--/T <li> ni_fe_err real NOT NULL,    -- external uncertainty for empirically calibrated [Ni/Fe] from ASPCAP
--/T <li> ni_fe_flag int NOT NULL,    -- ELEMFLAG for Ni
--/T <li> cu_fe real NOT NULL,        -- empirically calibrated [Cu/Fe] from ASPCAP
--/T <li> cu_fe_err real NOT NULL,    -- external uncertainty for empirically calibrated [Cu/Fe] from ASPCAP
--/T <li> cu_fe_flag int NOT NULL,    -- ELEMFLAG for Cu
--/T <li> ge_fe real NOT NULL,        -- empirically calibrated [Ge/Fe] from ASPCAP
--/T <li> ge_fe_err real NOT NULL,    -- external uncertainty for empirically calibrated [Ge/Fe] from ASPCAP
--/T <li> ge_fe_flag int NOT NULL,    -- ELEMFLAG for Ge
--/T <li> rb_fe real NOT NULL,        -- empirically calibrated [Rb/Fe] from ASPCAP
--/T <li> rb_fe_err real NOT NULL,    -- external uncertainty for empirically calibrated [Rb/Fe] from ASPCAP
--/T <li> rb_fe_flag int NOT NULL,    -- ELEMFLAG for Rb
--/T <li> y_fe real NOT NULL,         -- empirically calibrated [Y/Fe] from ASPCAP
--/T <li> y_fe_err real NOT NULL,     -- external uncertainty for empirically calibrated [Y/Fe] from ASPCAP
--/T <li> y_fe_flag int NOT NULL,     -- ELEMFLAG for Y
--/T <li> nd_fe real NOT NULL,        -- empirically calibrated [Nd/Fe] from ASPCAP
--/T <li> nd_fe_err real NOT NULL,    -- external uncertainty for empirically calibrated [Nd/Fe] from ASPCAP
--/T <li> nd_fe_flag int NOT NULL,    -- ELEMFLAG for Nd                  --/T <br> Sample call to return aspcap params
--/T <br> Sample call to get aspcap element abundances with errors and flags:
--/T <br><samp>
--/T <br>select TOP 10 a.apstar_id, b.*
--/T <br> from aspcapStar a CROSS APPLY dbo.fAspcapElemsAll( a.aspcap_id ) b
--/T </samp>
--/T <br>see also fAspcapElems, fAspcapElemErrs, fAspcapElemFlags
-------------------------------------------------------------
  RETURNS @etab TABLE (
    c_fe real NOT NULL,
    c_fe_err real NOT NULL,
    c_fe_flag int NOT NULL,
    ci_fe real NOT NULL,
    ci_fe_err real NOT NULL,
    ci_fe_flag int NOT NULL,
    n_fe real NOT NULL,
    n_fe_err real NOT NULL,
    n_fe_flag int NOT NULL,
    o_fe real NOT NULL,
    o_fe_err real NOT NULL,
    o_fe_flag int NOT NULL,
    na_fe real NOT NULL,
    na_fe_err real NOT NULL,
    na_fe_flag int NOT NULL,
    mg_fe real NOT NULL,
    mg_fe_err real NOT NULL,
    mg_fe_flag int NOT NULL,
    al_fe real NOT NULL,
    al_fe_err real NOT NULL,
    al_fe_flag int NOT NULL,
    si_fe real NOT NULL,
    si_fe_err real NOT NULL,
    si_fe_flag int NOT NULL,
    p_fe real NOT NULL,
    p_fe_err real NOT NULL,
    p_fe_flag int NOT NULL,
    s_fe real NOT NULL,
    s_fe_err real NOT NULL,
    s_fe_flag int NOT NULL,
    k_fe real NOT NULL,
    k_fe_err real NOT NULL,
    k_fe_flag int NOT NULL,
    ca_fe real NOT NULL,
    ca_fe_err real NOT NULL,
    ca_fe_flag int NOT NULL,
    ti_fe real NOT NULL,
    ti_fe_err real NOT NULL,
    ti_fe_flag int NOT NULL,
    tiii_fe real NOT NULL,
    tiii_fe_err real NOT NULL,
    tiii_fe_flag int NOT NULL,
    v_fe real NOT NULL,
    v_fe_err real NOT NULL,
    v_fe_flag int NOT NULL,
    cr_fe real NOT NULL,
    cr_fe_err real NOT NULL,
    cr_fe_flag int NOT NULL,
    mn_fe real NOT NULL,
    mn_fe_err real NOT NULL,
    mn_fe_flag int NOT NULL,
    fe_h real NOT NULL,
    fe_h_err real NOT NULL,
    fe_h_flag int NOT NULL,
    co_fe real NOT NULL,
    co_fe_err real NOT NULL,
    co_fe_flag int NOT NULL,
    ni_fe real NOT NULL,
    ni_fe_err real NOT NULL,
    ni_fe_flag int NOT NULL,
    cu_fe real NOT NULL,
    cu_fe_err real NOT NULL,
    cu_fe_flag int NOT NULL,
    ge_fe real NOT NULL,
    ge_fe_err real NOT NULL,
    ge_fe_flag int NOT NULL,
    rb_fe real NOT NULL,
    rb_fe_err real NOT NULL,
    rb_fe_flag int NOT NULL,
    y_fe real NOT NULL,
    y_fe_err real NOT NULL,
    y_fe_flag int NOT NULL,
    nd_fe real NOT NULL,
    nd_fe_err real NOT NULL,
    nd_fe_flag int NOT NULL
  ) AS 
BEGIN
	INSERT @etab
		SELECT 
            c_fe,
            c_fe_err,
            c_fe_flag,
            ci_fe,
            ci_fe_err,
            ci_fe_flag,
            n_fe,
            n_fe_err,
            n_fe_flag,
            o_fe,
            o_fe_err,
            o_fe_flag,
            na_fe,
            na_fe_err,
            na_fe_flag,
            mg_fe,
            mg_fe_err,
            mg_fe_flag,
            al_fe,
            al_fe_err,
            al_fe_flag,
            si_fe,
            si_fe_err,
            si_fe_flag,
            p_fe,
            p_fe_err,
            p_fe_flag,
            s_fe,
            s_fe_err,
            s_fe_flag,
            k_fe,
            k_fe_err,
            k_fe_flag,
            ca_fe,
            ca_fe_err,
            ca_fe_flag,
            ti_fe,
            ti_fe_err,
            ti_fe_flag,
            tiii_fe,
            tiii_fe_err,
            tiii_fe_flag,
            v_fe,
            v_fe_err,
            v_fe_flag,
            cr_fe,
            cr_fe_err,
            cr_fe_flag,
            mn_fe,
            mn_fe_err,
            mn_fe_flag,
            fe_h,
            fe_h_err,
            fe_h_flag,
            co_fe,
            co_fe_err,
            co_fe_flag,
            ni_fe,
            ni_fe_err,
            ni_fe_flag,
            cu_fe,
            cu_fe_err,
            cu_fe_flag,
            ge_fe,
            ge_fe_err,
            ge_fe_flag,
            rb_fe,
            rb_fe_err,
            rb_fe_flag,
            y_fe,
            y_fe_err,
            y_fe_flag,
            nd_fe,
            nd_fe_err,
            nd_fe_flag
		FROM aspcapStar WHERE aspcap_id = @aspcap_id
  RETURN
  END
GO
/****** Object:  UserDefinedFunction [dbo].[fAspcapFelemErrs]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fAspcapFelemErrs] (@aspcap_id VARCHAR(64))
-------------------------------------------------------------
--/H Returns table of errors associated with uncalibrated APOGEE aspcap abundance ratios.
-------------------------------------------------------------
--/T This function returns the errors associated with APOGEE aspcapStar uncalibrated 
--/T abundance ratios as determined by the ASPCAP [FERRE] pipeline (abundance windows 
--/T employed).
--/T <p>returned table:
--/T <li> felem_c_m_err real NOT NULL,          -- original fit uncertainty [C/M]
--/T <li> felem_ci_m_err real NOT NULL,         -- original fit uncertainty [CI/M]
--/T <li> felem_n_m_err real NOT NULL,          -- original fit uncertainty [N/M]
--/T <li> felem_o_m_err real NOT NULL,          -- original fit uncertainty [O/M]
--/T <li> felem_na_h_err real NOT NULL,         -- original fit uncertainty [Na/H]
--/T <li> felem_mg_m_err real NOT NULL,         -- original fit uncertainty [Mg/M]
--/T <li> felem_al_h_err real NOT NULL,         -- original fit uncertainty [Al/H]
--/T <li> felem_si_m_err real NOT NULL,         -- original fit uncertainty [Si/M]
--/T <li> felem_p_m_err real NOT NULL,          -- original fit uncertainty [P/M]
--/T <li> felem_s_m_err real NOT NULL,          -- original fit uncertainty [S/M]
--/T <li> felem_k_h_err real NOT NULL,          -- original fit uncertainty [K/H]
--/T <li> felem_ca_m_err real NOT NULL,         -- original fit uncertainty [Ca/M]
--/T <li> felem_ti_m_err real NOT NULL,         -- original fit uncertainty [Ti/M]
--/T <li> felem_tiii_m_err real NOT NULL,       -- original fit uncertainty [TiII/M]
--/T <li> felem_v_h_err real NOT NULL,          -- original fit uncertainty [V/H]
--/T <li> felem_cr_h_err real NOT NULL,         -- original fit uncertainty [Cr/H]
--/T <li> felem_mn_h_err real NOT NULL,         -- original fit uncertainty [Mn/H]
--/T <li> felem_fe_h_err real NOT NULL,         -- original fit uncertainty [Fe/H]
--/T <li> felem_co_h_err real NOT NULL,         -- original fit uncertainty [Co/H]
--/T <li> felem_ni_h_err real NOT NULL,         -- original fit uncertainty [Ni/H]
--/T <li> felem_cu_h_err real NOT NULL,         -- original fit uncertainty [Cu/H]
--/T <li> felem_ge_h_err real NOT NULL,         -- original fit uncertainty [Ge/H]
--/T <li> felem_rb_h_err real NOT NULL,         -- original fit uncertainty [Rb/H]
--/T <li> felem_y_h_err real NOT NULL,          -- original fit uncertainty [Y/H]
--/T <li> felem_nd_h_err real NOT NULL          -- original fit uncertainty [Nd/H]
--/T <br> Sample call to get aspcap element abundances:
--/T <br><samp>
--/T <br>select TOP 10 a.apstar_id, b.*
--/T <br> from aspcapStar a CROSS APPLY dbo.fAspcapFelemErrs( a.aspcap_id ) b
--/T </samp>
--/T <br>see also fAspcapFelemsAll, fAspcapFelems
-------------------------------------------------------------
  RETURNS @ftab TABLE (
    felem_c_m_err real NOT NULL,
    felem_ci_m_err real NOT NULL,
    felem_n_m_err real NOT NULL,
    felem_o_m_err real NOT NULL,
    felem_na_h_err real NOT NULL,
    felem_mg_m_err real NOT NULL,
    felem_al_h_err real NOT NULL,
    felem_si_m_err real NOT NULL,
    felem_p_m_err real NOT NULL,
    felem_s_m_err real NOT NULL,
    felem_k_h_err real NOT NULL,
    felem_ca_m_err real NOT NULL,
    felem_ti_m_err real NOT NULL,
    felem_tiii_m_err real NOT NULL,
    felem_v_h_err real NOT NULL,
    felem_cr_h_err real NOT NULL,
    felem_mn_h_err real NOT NULL,
    felem_fe_h_err real NOT NULL,
    felem_co_h_err real NOT NULL,
    felem_ni_h_err real NOT NULL,
    felem_cu_h_err real NOT NULL,
    felem_ge_h_err real NOT NULL,
    felem_rb_h_err real NOT NULL,
    felem_y_h_err real NOT NULL,
    felem_nd_h_err real NOT NULL
  ) AS 
BEGIN
	INSERT @ftab
		SELECT 
            felem_c_m_err,
            felem_ci_m_err,
            felem_n_m_err,
            felem_o_m_err,
            felem_na_h_err,
            felem_mg_m_err,
            felem_al_h_err,
            felem_si_m_err,
            felem_p_m_err,
            felem_s_m_err,
            felem_k_h_err,
            felem_ca_m_err,
            felem_ti_m_err,
            felem_tiii_m_err,
            felem_v_h_err,
            felem_cr_h_err,
            felem_mn_h_err,
            felem_fe_h_err,
            felem_co_h_err,
            felem_ni_h_err,
            felem_cu_h_err,
            felem_ge_h_err,
            felem_rb_h_err,
            felem_y_h_err,
            felem_nd_h_err
		FROM aspcapStar WHERE aspcap_id = @aspcap_id
  RETURN
  END
GO
/****** Object:  UserDefinedFunction [dbo].[fAspcapFelems]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fAspcapFelems] (@aspcap_id VARCHAR(64))
-------------------------------------------------------------
--/H Returns table of uncalibrated APOGEE aspcap abundance ratios.
-------------------------------------------------------------
--/T This function returns the APOGEE aspcapStar uncalibrated abundance ratios as determined
--/T by the ASPCAP [FERRE] pipeline (abundance windows employed). 
--/T <p>returned table:
--/T <li> felem_c_m real NOT NULL,      -- original fit [C/M]
--/T <li> felem_ci_m real NOT NULL,     -- original fit [CI/M]
--/T <li> felem_n_m real NOT NULL,      -- original fit [N/M]
--/T <li> felem_o_m real NOT NULL,      -- original fit [O/M]
--/T <li> felem_na_h real NOT NULL,     -- original fit [Na/H]
--/T <li> felem_mg_m real NOT NULL,     -- original fit [Mg/M]
--/T <li> felem_al_h real NOT NULL,     -- original fit [Al/H]
--/T <li> felem_si_m real NOT NULL,     -- original fit [Si/M]
--/T <li> felem_p_m real NOT NULL,      -- original fit [P/M]
--/T <li> felem_s_m real NOT NULL,      -- original fit [S/M]
--/T <li> felem_k_h real NOT NULL,      -- original fit [K/H]
--/T <li> felem_ca_m real NOT NULL,     -- original fit [Ca/M]
--/T <li> felem_ti_m real NOT NULL,     -- original fit [Ti/M]
--/T <li> felem_tiii_m real NOT NULL,   -- original fit [TiII/M]
--/T <li> felem_v_h real NOT NULL,      -- original fit [V/H]
--/T <li> felem_cr_h real NOT NULL,     -- original fit [Cr/H]
--/T <li> felem_mn_h real NOT NULL,     -- original fit [Mn/H]
--/T <li> felem_fe_h real NOT NULL,     -- original fit [Fe/H]
--/T <li> felem_co_h real NOT NULL,     -- original fit [Co/H]
--/T <li> felem_ni_h real NOT NULL,     -- original fit [Ni/H]
--/T <li> felem_cu_h real NOT NULL,     -- original fit [Cu/H]
--/T <li> felem_ge_h real NOT NULL,     -- original fit [Ge/H]
--/T <li> felem_rb_h real NOT NULL,     -- original fit [Rb/H]
--/T <li> felem_y_h real NOT NULL,      -- original fit [Y/H]
--/T <li> felem_nd_h real NOT NULL,     -- original fit [Nd/H]
--/T <br> Sample call to get aspcap element abundances:
--/T <br><samp>
--/T <br>select TOP 10 a.apstar_id, b.*
--/T <br> from aspcapStar a CROSS APPLY dbo.fAspcapFelems( a.aspcap_id ) b
--/T </samp>
--/T <br>see also fAspcapFelemsAll, fAspcapFelemErrs
-------------------------------------------------------------
  RETURNS @ftab TABLE (
    felem_c_m real NOT NULL,
    felem_ci_m real NOT NULL,
    felem_n_m real NOT NULL,
    felem_o_m real NOT NULL,
    felem_na_h real NOT NULL,
    felem_mg_m real NOT NULL,
    felem_al_h real NOT NULL,
    felem_si_m real NOT NULL,
    felem_p_m real NOT NULL,
    felem_s_m real NOT NULL,
    felem_k_h real NOT NULL,
    felem_ca_m real NOT NULL,
    felem_ti_m real NOT NULL,
    felem_tiii_m real NOT NULL,
    felem_v_h real NOT NULL,
    felem_cr_h real NOT NULL,
    felem_mn_h real NOT NULL,
    felem_fe_h real NOT NULL,
    felem_co_h real NOT NULL,
    felem_ni_h real NOT NULL,
    felem_cu_h real NOT NULL,
    felem_ge_h real NOT NULL,
    felem_rb_h real NOT NULL,
    felem_y_h real NOT NULL,
    felem_nd_h real NOT NULL
  ) AS 
BEGIN
	INSERT @ftab
		SELECT 
            felem_c_m,
            felem_ci_m,
            felem_n_m,
            felem_o_m,
            felem_na_h,
            felem_mg_m,
            felem_al_h,
            felem_si_m,
            felem_p_m,
            felem_s_m,
            felem_k_h,
            felem_ca_m,
            felem_ti_m,
            felem_tiii_m,
            felem_v_h,
            felem_cr_h,
            felem_mn_h,
            felem_fe_h,
            felem_co_h,
            felem_ni_h,
            felem_cu_h,
            felem_ge_h,
            felem_rb_h,
            felem_y_h,
            felem_nd_h
		FROM aspcapStar WHERE aspcap_id = @aspcap_id
  RETURN
  END
GO
/****** Object:  UserDefinedFunction [dbo].[fAspcapFelemsAll]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fAspcapFelemsAll] (@aspcap_id VARCHAR(64))
-------------------------------------------------------------
--/H Returns table of uncalibrated APOGEE aspcap abundance ratios along with their errors.
-------------------------------------------------------------
--/T This function returns the APOGEE aspcapStar uncalibrated abundance ratios as determined
--/T by the ASPCAP [FERRE] pipeline (abundance windows employed), along with their errors 
--/T for a given aspcap_id.
--/T <p>returned table:
--/T <li> felem_c_m real NOT NULL,              -- original fit [C/M]
--/T <li> felem_c_m_err real NOT NULL,          -- original fit uncertainty [C/M]
--/T <li> felem_ci_m real NOT NULL,             -- original fit [CI/M]
--/T <li> felem_ci_m_err real NOT NULL,         -- original fit uncertainty [CI/M]
--/T <li> felem_n_m real NOT NULL,              -- original fit [N/M]
--/T <li> felem_n_m_err real NOT NULL,          -- original fit uncertainty [N/M]
--/T <li> felem_o_m real NOT NULL,              -- original fit [O/M]
--/T <li> felem_o_m_err real NOT NULL,          -- original fit uncertainty [O/M]
--/T <li> felem_na_h real NOT NULL,             -- original fit [Na/H]
--/T <li> felem_na_h_err real NOT NULL,         -- original fit uncertainty [Na/H]
--/T <li> felem_mg_m real NOT NULL,             -- original fit [Mg/M]
--/T <li> felem_mg_m_err real NOT NULL,         -- original fit uncertainty [Mg/M]
--/T <li> felem_al_h real NOT NULL,             -- original fit [Al/H]
--/T <li> felem_al_h_err real NOT NULL,         -- original fit uncertainty [Al/H]
--/T <li> felem_si_m real NOT NULL,             -- original fit [Si/M]
--/T <li> felem_si_m_err real NOT NULL,         -- original fit uncertainty [Si/M]
--/T <li> felem_p_m real NOT NULL,              -- original fit [P/M]
--/T <li> felem_p_m_err real NOT NULL,          -- original fit uncertainty [P/M]
--/T <li> felem_s_m real NOT NULL,              -- original fit [S/M]
--/T <li> felem_s_m_err real NOT NULL,          -- original fit uncertainty [S/M]
--/T <li> felem_k_h real NOT NULL,              -- original fit [K/H]
--/T <li> felem_k_h_err real NOT NULL,          -- original fit uncertainty [K/H]
--/T <li> felem_ca_m real NOT NULL,             -- original fit [Ca/M]
--/T <li> felem_ca_m_err real NOT NULL,         -- original fit uncertainty [Ca/M]
--/T <li> felem_ti_m real NOT NULL,             -- original fit [Ti/M]
--/T <li> felem_ti_m_err real NOT NULL,         -- original fit uncertainty [Ti/M]
--/T <li> felem_tiii_m real NOT NULL,           -- original fit [TiII/M]
--/T <li> felem_tiii_m_err real NOT NULL,       -- original fit uncertainty [TiII/M]
--/T <li> felem_v_h real NOT NULL,              -- original fit [V/H]
--/T <li> felem_v_h_err real NOT NULL,          -- original fit uncertainty [V/H]
--/T <li> felem_cr_h real NOT NULL,             -- original fit [Cr/H]
--/T <li> felem_cr_h_err real NOT NULL,         -- original fit uncertainty [Cr/H]
--/T <li> felem_mn_h real NOT NULL,             -- original fit [Mn/H]
--/T <li> felem_mn_h_err real NOT NULL,         -- original fit uncertainty [Mn/H]
--/T <li> felem_fe_h real NOT NULL,             -- original fit [Fe/H]
--/T <li> felem_fe_h_err real NOT NULL,         -- original fit uncertainty [Fe/H]
--/T <li> felem_co_h real NOT NULL,             -- original fit [Co/H]
--/T <li> felem_co_h_err real NOT NULL,         -- original fit uncertainty [Co/H]
--/T <li> felem_ni_h real NOT NULL,             -- original fit [Ni/H]
--/T <li> felem_ni_h_err real NOT NULL,         -- original fit uncertainty [Ni/H]
--/T <li> felem_cu_h real NOT NULL,             -- original fit [Cu/H]
--/T <li> felem_cu_h_err real NOT NULL,         -- original fit uncertainty [Cu/H]
--/T <li> felem_ge_h real NOT NULL,             -- original fit [Ge/H]
--/T <li> felem_ge_h_err real NOT NULL,         -- original fit uncertainty [Ge/H]
--/T <li> felem_rb_h real NOT NULL,             -- original fit [Rb/H]
--/T <li> felem_rb_h_err real NOT NULL,         -- original fit uncertainty [Rb/H]
--/T <li> felem_y_h real NOT NULL,              -- original fit [Y/H]
--/T <li> felem_y_h_err real NOT NULL,          -- original fit uncertainty [Y/H]
--/T <li> felem_nd_h real NOT NULL,             -- original fit [Nd/H]
--/T <li> felem_nd_h_err real NOT NULL          -- original fit uncertainty [Nd/H]
--/T <br> Sample call to get aspcap element abundances:
--/T <br><samp>
--/T <br>select TOP 10 a.apstar_id, b.*
--/T <br> from aspcapStar a CROSS APPLY dbo.fAspcapFelemsAll( a.aspcap_id ) b
--/T </samp>
--/T <br>see also fAspcapFelems, fAspcapFelemErrs
-------------------------------------------------------------
  RETURNS @ftab TABLE (
    felem_c_m real NOT NULL,
    felem_c_m_err real NOT NULL,
    felem_ci_m real NOT NULL,
    felem_ci_m_err real NOT NULL,
    felem_n_m real NOT NULL,
    felem_n_m_err real NOT NULL,
    felem_o_m real NOT NULL,
    felem_o_m_err real NOT NULL,
    felem_na_h real NOT NULL,
    felem_na_h_err real NOT NULL,
    felem_mg_m real NOT NULL,
    felem_mg_m_err real NOT NULL,
    felem_al_h real NOT NULL,
    felem_al_h_err real NOT NULL,
    felem_si_m real NOT NULL,
    felem_si_m_err real NOT NULL,
    felem_p_m real NOT NULL,
    felem_p_m_err real NOT NULL,
    felem_s_m real NOT NULL,
    felem_s_m_err real NOT NULL,
    felem_k_h real NOT NULL,
    felem_k_h_err real NOT NULL,
    felem_ca_m real NOT NULL,
    felem_ca_m_err real NOT NULL,
    felem_ti_m real NOT NULL,
    felem_ti_m_err real NOT NULL,
    felem_tiii_m real NOT NULL,
    felem_tiii_m_err real NOT NULL,
    felem_v_h real NOT NULL,
    felem_v_h_err real NOT NULL,
    felem_cr_h real NOT NULL,
    felem_cr_h_err real NOT NULL,
    felem_mn_h real NOT NULL,
    felem_mn_h_err real NOT NULL,
    felem_fe_h real NOT NULL,
    felem_fe_h_err real NOT NULL,
    felem_co_h real NOT NULL,
    felem_co_h_err real NOT NULL,
    felem_ni_h real NOT NULL,
    felem_ni_h_err real NOT NULL,
    felem_cu_h real NOT NULL,
    felem_cu_h_err real NOT NULL,
    felem_ge_h real NOT NULL,
    felem_ge_h_err real NOT NULL,
    felem_rb_h real NOT NULL,
    felem_rb_h_err real NOT NULL,
    felem_y_h real NOT NULL,
    felem_y_h_err real NOT NULL,
    felem_nd_h real NOT NULL,
    felem_nd_h_err real NOT NULL
  ) AS 
BEGIN
	INSERT @ftab
		SELECT 
            felem_c_m,
            felem_c_m_err,
            felem_ci_m,
            felem_ci_m_err,
            felem_n_m,
            felem_n_m_err,
            felem_o_m,
            felem_o_m_err,
            felem_na_h,
            felem_na_h_err,
            felem_mg_m,
            felem_mg_m_err,
            felem_al_h,
            felem_al_h_err,
            felem_si_m,
            felem_si_m_err,
            felem_p_m,
            felem_p_m_err,
            felem_s_m,
            felem_s_m_err,
            felem_k_h,
            felem_k_h_err,
            felem_ca_m,
            felem_ca_m_err,
            felem_ti_m,
            felem_ti_m_err,
            felem_tiii_m,
            felem_tiii_m_err,
            felem_v_h,
            felem_v_h_err,
            felem_cr_h,
            felem_cr_h_err,
            felem_mn_h,
            felem_mn_h_err,
            felem_fe_h,
            felem_fe_h_err,
            felem_co_h,
            felem_co_h_err,
            felem_ni_h,
            felem_ni_h_err,
            felem_cu_h,
            felem_cu_h_err,
            felem_ge_h,
            felem_ge_h_err,
            felem_rb_h,
            felem_rb_h_err,
            felem_y_h,
            felem_y_h_err,
            felem_nd_h,
            felem_nd_h_err
		FROM aspcapStar WHERE aspcap_id = @aspcap_id
  RETURN
  END
GO
/****** Object:  UserDefinedFunction [dbo].[fAspcapParamErrs]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fAspcapParamErrs] (@aspcap_id VARCHAR(64))
-------------------------------------------------------------
--/H Returns table of APOGEE aspcap parameter errors.
-------------------------------------------------------------
--/T This function returns the errors associated with APOGEE aspcapStar parameters for a given aspcap_id.
--/T <p>returned table:
--/T <li> teff_err real NOT NULL, --/U deg K  --/D external uncertainty estimate for calibrated temperature from ASPCAP
--/T <li> logg_err real NOT NULL, --/U dex --/D external uncertainty estimate for log gravity from ASPCAP
--/T <li> m_h_err real NOT NULL, --/U dex --/D calibrated [M/H] uncertainty
--/T <li> alpha_m_err real NOT NULL --/U dex --/D calibrated [M/H] uncertainty
--/T <br> Sample call to get aspcap param errors:
--/T <br><samp>
--/T <br>select TOP 10 a.apstar_id, b.*
--/T <br> from  aspcapStar a CROSS APPLY dbo.fAspcapParamErrs( a.aspcap_id ) b
--/T </samp>
--/T <br>see also fAspcapParamsAll, fAspcapParams, fAspcapParamFlags
-------------------------------------------------------------
  RETURNS @ptab TABLE (
    teff_err real NOT NULL,
    logg_err real NOT NULL,
    m_h_err real NOT NULL,
    alpha_m_err real NOT NULL
  ) AS 
BEGIN
	INSERT @ptab	SELECT 
	    teff_err,
	    logg_err,
	    m_h_err,
	    alpha_m_err
	FROM aspcapStar WHERE aspcap_id = @aspcap_id
  RETURN
  END
GO
/****** Object:  UserDefinedFunction [dbo].[fAspcapParamFlags]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fAspcapParamFlags] (@aspcap_id VARCHAR(64))
-------------------------------------------------------------
--/H Returns table of APOGEE aspcap parameter flags.
-------------------------------------------------------------
--/T This function returns the flags associated with APOGEE aspcapStar parameters for a given aspcap_id.
--/T <p>returned table:
--/T <li> teff_flag int NOT NULL, --/F paramflag 0 --/D PARAMFLAG for effective temperature (see http://www.sdss.org/dr12/algorithms/bitmasks/#APOGEE_PARAMFLAG)
--/T <li> logg_flag int NOT NULL, --/F paramflag 1 --/D PARAMFLAG for log g
--/T <li> m_h_flag int NOT NULL, --/F paramflag 3 --/D PARAMFLAG for [M/H]
--/T <li> alpha_m_flag int NOT NULL --/F paramflag 6 --/D PARAMFLAG for [alpha/M]
--/T <br> Sample call to get aspcap param flags:
--/T <br><samp>
--/T <br>select TOP 10 a.apstar_id, b.*
--/T <br> from  aspcapStar a CROSS APPLY dbo.fAspcapParamFlags( a.aspcap_id ) b
--/T </samp>
--/T <br>see also fAspcapParamsAll, fAspcapParams, fAspcapParamErrs
-------------------------------------------------------------
  RETURNS @ptab TABLE (
    teff_flag int NOT NULL,
    logg_flag int NOT NULL,
    m_h_flag int NOT NULL,
    alpha_m_flag int NOT NULL
  ) AS 
BEGIN
	INSERT @ptab	SELECT 
	    teff_flag,
	    logg_flag,
	    m_h_flag,
	    alpha_m_flag
	FROM aspcapStar WHERE aspcap_id = @aspcap_id
  RETURN
  END
GO
/****** Object:  UserDefinedFunction [dbo].[fAspcapParams]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fAspcapParams] (@aspcap_id VARCHAR(64))
-------------------------------------------------------------
--/H Returns table of APOGEE aspcap parameters.
-------------------------------------------------------------
--/T This function returns the APOGEE aspcapStar parameters for a given aspcap_id.
--/T <p>returned table:
--/T <li> teff real NOT NULL,		-- Empirically calibrated temperature from ASPCAP 
--/T <li> logg real NOT NULL,		-- empirically calibrated log gravity from ASPCAP
--/T <li> vmicro real NOT NULL,		-- microturbulent velocity (fit for dwarfs, f(log g) for giants)
--/T <li> vmacro real NOT NULL,		-- macroturbulent velocity (f(log Teff,[M/H]) for giants)
--/T <li> vsini real NOT NULL,		-- rotation+macroturbulent velocity (fit for dwarfs)
--/T <li> m_h real NOT NULL,		-- calibrated [M/H]
--/T <li> alpha_m real NOT NULL,	-- calibrated [M/H]
--/T <br> Sample call to get aspcap params:
--/T <br><samp>
--/T <br>select TOP 10 a.apstar_id, b.*
--/T <br> from  aspcapStar a CROSS APPLY dbo.fAspcapParams( a.aspcap_id ) b
--/T </samp>
--/T <br>see also fAspcapParamsAll, fAspcapParamErrs, fAspcapParamFlags
-------------------------------------------------------------
  RETURNS @ptab TABLE (
    teff real NOT NULL,
    logg real NOT NULL,
    vmicro real NOT NULL,
    vmacro real NOT NULL,
    vsini real NOT NULL,
    m_h real NOT NULL,
    alpha_m real NOT NULL
  ) AS 
BEGIN
	INSERT @ptab	SELECT 
	    teff,
	    logg real,
	    vmicro,
	    vmacro,
	    vsini,
	    m_h real,
	    alpha_m
	FROM aspcapStar WHERE aspcap_id = @aspcap_id
  RETURN
  END
GO
/****** Object:  UserDefinedFunction [dbo].[fAspcapParamsAll]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fAspcapParamsAll] (@aspcap_id VARCHAR(64))
-------------------------------------------------------------
--/H Returns table of APOGEE aspcap parameters along with their errors and flags.
-------------------------------------------------------------
--/T This function returns the APOGEE aspcapStar parameters for a given aspcap_id, along with their associated errors and flags.
--/T <p>returned table:
--/T <li> teff real NOT NULL,			-- Empirically calibrated temperature from ASPCAP 
--/T <li> teff_err real NOT NULL,		-- external uncertainty estimate for calibrated temperature from ASPCAP
--/T <li> teff_flag int NOT NULL,		-- PARAMFLAG for effective temperature (see http://www.sdss.org/dr12/algorithms/bitmasks/#APOGEE_PARAMFLAG)
--/T <li> logg real NOT NULL,			-- empirically calibrated log gravity from ASPCAP
--/T <li> logg_err real NOT NULL,		-- external uncertainty estimate for log gravity from ASPCAP
--/T <li> logg_flag int NOT NULL,		-- PARAMFLAG for log g
--/T <li> vmicro real NOT NULL,			-- microturbulent velocity (fit for dwarfs, f(log g) for giants)
--/T <li> vmacro real NOT NULL,			-- macroturbulent velocity (f(log Teff,[M/H]) for giants)
--/T <li> vsini real NOT NULL,			-- rotation+macroturbulent velocity (fit for dwarfs)
--/T <li> m_h real NOT NULL,			-- calibrated [M/H]
--/T <li> m_h_err real NOT NULL,		-- calibrated [M/H] uncertainty
--/T <li> m_h_flag int NOT NULL,		-- PARAMFLAG for [M/H]
--/T <li> alpha_m real NOT NULL,		-- calibrated [M/H]
--/T <li> alpha_m_err real NOT NULL,	-- calibrated [M/H] uncertainty
--/T <li> alpha_m_flag int NOT NULL,	-- PARAMFLAG for [alpha/M]
--/T <br> Sample call to get aspcap param errors:
--/T <br><samp>
--/T <br>select TOP 10 a.apstar_id, b.*
--/T <br> from  aspcapStar a CROSS APPLY dbo.fAspcapParamsAll( a.aspcap_id ) b
--/T </samp>
--/T <br>see also fAspcapParams, fAspcapParamErrs, fAspcapParamFlags
-------------------------------------------------------------
  RETURNS @ptab TABLE (
    teff real NOT NULL,
    teff_err real NOT NULL,
    teff_flag int NOT NULL,
    logg real NOT NULL,
    logg_err real NOT NULL,
    logg_flag int NOT NULL,
    vmicro real NOT NULL,
    vmacro real NOT NULL,
    vsini real NOT NULL,
    m_h real NOT NULL,
    m_h_err real NOT NULL,
    m_h_flag int NOT NULL,
    alpha_m real NOT NULL,
    alpha_m_err real NOT NULL,
    alpha_m_flag int NOT NULL
  ) AS 
BEGIN
	INSERT @ptab	SELECT 
	    teff,
	    teff_err,
	    teff_flag,
	    logg real,
	    logg_err,
	    logg_flag,
	    vmicro,
	    vmacro,
	    vsini,
	    m_h real,
	    m_h_err,
	    m_h_flag,
	    alpha_m,
	    alpha_m_err,
	    alpha_m_flag
	FROM aspcapStar WHERE aspcap_id = @aspcap_id
  RETURN
  END
GO
/****** Object:  UserDefinedFunction [dbo].[fBossTarget1]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fBossTarget1](@name varchar(40))
-------------------------------------------------------------
--/H Returns the BossTarget1 value corresponding to a name
-------------------------------------------------------------
--/T the spectro specialTarget1 flags can be shown with Select * from BossTarget1 
--/T <br>
--/T Sample call to find spec objects that are low-redshift galaxy special primary targets
--/T <samp> 
--/T <br> select top 10 * 
--/T <br> from specObj 
--/T <br> where BossTarget1 & dbo.fBossTarget1('LOWZ_GALAXY') > 0 
--/T </samp> 
--/T <br> see also fSecTarget
-------------------------------------------------------------
RETURNS bigint
AS BEGIN
RETURN ( SELECT cast(value as bigint)
	FROM BossTarget1
	WHERE name = UPPER(@name)
	)
END
GO
/****** Object:  UserDefinedFunction [dbo].[fBossTarget1N]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fBossTarget1N](@value bigint)
---------------------------------------------------
--/H Returns the expanded BossTarget1 corresponding to the flag value as a string
---------------------------------------------------
--/T The spectro BossTarget1 flags can be shown with Select * from BossTarget1 
--/T <br>
--/T Sample call to show the special target flags of some spec objects is
--/T <samp> 
--/T <br> select top 10 specObjId, dbo.fBossTarget1N(specialTarget1) as specialTarget1
--/T <br> from specObj 
--/T </samp> 
--/T <br> see also fBossTarget1, fSecTargetN
-------------------------------------------------------------
RETURNS varchar(1000)
BEGIN
    DECLARE @bit int, @mask bigint, @out varchar(2000);
    SET @bit=63;
    SET @out ='';
    WHILE (@bit>0)
	BEGIN
	    SET @bit = @bit-1;
	    SET @mask = power(cast(2 as bigint),@bit);
	    SET @out = @out + (CASE 
		WHEN (@mask & @value)=0 THEN '' 
		ELSE coalesce((select name from BossTarget1 where value=@mask),'')+' '
	    	END);
	END
    RETURN @out;
END
GO
/****** Object:  UserDefinedFunction [dbo].[fCalibStatus]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fCalibStatus](@name varchar(40))
-------------------------------------------------------------
--/H Returns the CalibStatus flag value corresponding to a name
-------------------------------------------------------------
--/T The CalibStatus values can be shown with Select * from CalibStatus 
--/T <br>
--/T Sample call to find photometric objects is
--/T <samp> 
--/T <br> select top 10 modelMag_r 
--/T <br> from PhotoObj  
--/T <br> where 
--/T <br> <dd><dd>(calibStatus_r & dbo.fCalibStatus('PHOTOMETRIC') > 0) 
--/T </samp> 
--/T <br> see also fCalibStatusN
-------------------------------------------------------------
RETURNS int
AS BEGIN
RETURN ( SELECT cast(value as int)
	FROM CalibStatus
	WHERE name = UPPER(@name)
	)
END
GO
/****** Object:  UserDefinedFunction [dbo].[fCalibStatusN]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fCalibStatusN](@value smallint)
---------------------------------------------------
--/H Returns the string describing to the calibration status flags in words
---------------------------------------------------
--/T The CalibStatus values can be shown with Select * from CalibStatus  
--/T <br>
--/T Sample call to fCalibStatusN: 
--/T <samp> 
--/T <br> select top 10 dbo.fCalibStatusN(calibStatus_r) as calstatus_r
--/T <br> from PhotoObj
--/T </samp> 
--/T <br> see also fCalibStatus
-------------------------------------------------------------
RETURNS varchar(1000)
BEGIN
    DECLARE @bit int, @mask smallint, @out varchar(2000);
    SET @bit=15;
    SET @out ='';
    WHILE (@bit>0)
	BEGIN
	    SET @bit = @bit-1;
	    SET @mask = power(2,@bit);
	    SET @out = @out + (CASE 
		WHEN (@mask & @value)=0 THEN '' 
		ELSE coalesce((select name from CalibStatus where value=@mask),'')+' '
	    	END);
	END
    RETURN @out;
END
GO
/****** Object:  UserDefinedFunction [dbo].[fCamcol]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fCamcol](@ObjID bigint)
-------------------------------------------------------------------------------
--/H Extracts Camcol from an SDSS Photo Object ID
--
--/T The bit-fields and their lengths are: Skyversion[5] Rerun[11] Run[16] Camcol[3] First[1] Field[12] Obj[16]<br>
--/T <samp> select top 10 objId, dbo.fCamcol(objId) as fCamcol from Galaxy</samp>
-------------------------------------------------------------------------------
RETURNS INT
AS BEGIN
    RETURN ( cast( ((@ObjID / power(cast(2 as bigint),29)) & 0x00000007) AS INT));
END

GO
/****** Object:  UserDefinedFunction [dbo].[fCoordsFromEq]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fCoordsFromEq](@ra float,@dec float)
------------------------------------------------------------
--/H Returns table of stripe, lambda, eta, mu, nu derived from ra,dec
--   -------------------------------------------------------
--/D This is the generic service function for SDSS specific
--/D coordinate conversions. It derives all the coordinates
--/D from the ra,dec, based on the definition of the primary
--/D areas of the stripes. For the Southern stripes, it returns
--/D a mu value shifted by 360 degrees, in order to have a
--/D non-negative and monotonic quantity.
------------------------------------------------------------
RETURNS @coords TABLE (
    ra	float,
    [dec] float,
    [stripe] int,
    incl float,
    lambda float,
    eta float,
    mu float,
    nu float
)
AS BEGIN
    DECLARE 
	@cx float, @cy float, @cz float,
	@qx float, @qy float, @qz float,
	@lambda float, @eta float, 
	@stripe int, @incl float,
	@mu float, @nu float,
        @stripeEta float;
    --
    SET @cx = cos(radians(@dec))* cos(radians(@ra-95.0));
    SET @cy = cos(radians(@dec))* sin(radians(@ra-95.0));
    SET @cz = sin(radians(@dec));
    --
    SET @lambda = -degrees(asin(@cx));
    IF (@cy = 0.0 and @cz = 0.0)
        SET @cy = 1e-16;
    SET @eta    =  degrees(atn2(@cz,@cy))-32.5;
    SET @stripeEta = @eta;
    --
    IF @lambda < -180.0 SET @lambda = @lambda+360.0;
    IF @lambda >= 180.0 SET @lambda = @lambda-360.0;
    IF ABS(@lambda) > 90.0
       BEGIN
           SET @lambda = 180.0-@lambda;
           SET @eta = @eta+180.0;
       END
    IF @lambda < -180.0 SET @lambda = @lambda+360.0;
    IF @lambda >= 180.0 SET @lambda = @lambda-360.0;
    IF @eta < 0.0 SET @eta = @eta+360.0;
    IF @eta >= 360.0 SET @eta = @eta-360.0;
    IF ABS(@lambda) = 90.0 SET @eta = 0.0;
    IF @eta < -180.0 SET @eta = @eta+360.0;
    IF @eta >= 180.0 SET @eta = @eta-360.0;
    IF @eta > 90.0-32.5
       BEGIN
           SET @eta = @eta-180.0;
           SET @lambda = 180.0-@lambda;
       END
    IF @lambda < -180.0 SET @lambda = @lambda+360.0;
    IF @lambda >= 180.0 SET @lambda = @lambda-360.0;
    --
    IF  @stripeEta<-180 SET @stripeEta = @stripeEta+360;
    SET @stripe = 23 + floor(@stripeEta/2.5+0.5);
    --
    SET @incl = (@stripe-10)*2.5;
    IF  @stripe>50 SET @incl = (@stripe-82)*2.5;
    --
    SET @qx = @cx;
    SET @qy = @cy*cos(radians(@incl))+@cz*sin(radians(@incl));
    SET @qz =-@cy*sin(radians(@incl))+@cz*cos(radians(@incl));
    --
    SET @mu = degrees(atn2(@qy,@qx))+95.0;
    SET @nu = degrees(asin(@qz));
    IF  @stripe>50 SET @mu = @mu+360;
    --
    INSERT @coords SELECT
	@ra, @dec, @stripe, @incl, @lambda, @eta, @mu, @nu;
    RETURN
END
GO
/****** Object:  UserDefinedFunction [dbo].[fCoordType]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fCoordType](@name varchar(40))
-------------------------------------------------------------------------------
--/H Return the CoordType value, indexed by name
-------------------------------------------------------------------------------
--/T the CoordTypes can be found with 
--/T <br>       Select * from CoordType
--/T <br>
--/T Sample call to fCoordType.
--/T <samp> 
--/T <br> select top 10  *
--/T <br> from TilingBoundary
--/T <br> where coordType = dbo.fCoordType('RA_DEC')
--/T </samp> 
--/T <br> see also fCoordTypeN
-------------------------------------------------------------
RETURNS INTEGER
AS BEGIN
    RETURN ( SELECT value
	FROM CoordType
	WHERE name = UPPER(@name)
	)
END
GO
/****** Object:  UserDefinedFunction [dbo].[fCoordTypeN]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fCoordTypeN](@value int)
-------------------------------------------------------------------------------
--/H Return the CoordType name, indexed by value
-------------------------------------------------------------------------------
--/T the CoordTypes can be found with 
--/T <br>       Select * from CoordType
--/T <br>
--/T Sample call to fCoordTypeN.
--/T <samp> 
--/T <br> select top 10 dbo.fCoordTypeN(coordType) as coordType
--/T <br> from TilingBoundary
--/T </samp> 
--/T <br> see also fCoordType
-------------------------------------------------------------
RETURNS varchar(40)
AS BEGIN
    RETURN ( SELECT name
	FROM CoordType
	WHERE value = @value
	)
END
GO
/****** Object:  UserDefinedFunction [dbo].[fCosmoAbsMag]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[fCosmoAbsMag](@m [float], @z [float], @OmegaM [float] = 0.27891507, @OmegaL [float] = 0.721, @OmegaR [float] = 8.493E-05, @omega0 [float] = -1, @h_0 [float] = 0.701)
RETURNS [float] WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [CosmologyCASJOBS].[SQLCosmology.SQLCosmologyFunctionsFreeParameters].[AbsMag]
GO
/****** Object:  UserDefinedFunction [dbo].[fCosmoAgeOfUniverse]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[fCosmoAgeOfUniverse](@z [float], @OmegaM [float] = 0.27891507, @OmegaL [float] = 0.721, @OmegaR [float] = 8.493E-05, @omega0 [float] = -1, @h_0 [float] = 0.701)
RETURNS [float] WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [CosmologyCASJOBS].[SQLCosmology.SQLCosmologyFunctionsFreeParameters].[AgeOfUniverse]
GO
/****** Object:  UserDefinedFunction [dbo].[fCosmoComovDist2ObjectsRADEC]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[fCosmoComovDist2ObjectsRADEC](@Redshift1 [float], @Ra1 [float], @Dec1 [float], @Redshift2 [float], @Ra2 [float], @Dec2 [float], @OmegaM [float] = 0.27891507, @OmegaL [float] = 0.721, @OmegaR [float] = 8.493E-05, @omega0 [float] = -1, @h_0 [float] = 0.701)
RETURNS [float] WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [CosmologyCASJOBS].[SQLCosmology.SQLCosmologyFunctionsFreeParameters].[ComovDistBetween2objectsRaDec]
GO
/****** Object:  UserDefinedFunction [dbo].[fCosmoComovDist2ObjectsXYZ]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[fCosmoComovDist2ObjectsXYZ](@Redshift1 [float], @x1 [float], @y1 [float], @z1 [float], @Redshift2 [float], @x2 [float], @y2 [float], @z2 [float], @OmegaM [float] = 0.27891507, @OmegaL [float] = 0.721, @OmegaR [float] = 8.493E-05, @omega0 [float] = -1, @h_0 [float] = 0.701)
RETURNS [float] WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [CosmologyCASJOBS].[SQLCosmology.SQLCosmologyFunctionsFreeParameters].[ComovDistBetween2objectsXyz]
GO
/****** Object:  UserDefinedFunction [dbo].[fCosmoComovingVolume]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[fCosmoComovingVolume](@z [float], @OmegaM [float] = 0.27891507, @OmegaL [float] = 0.721, @OmegaR [float] = 8.493E-05, @omega0 [float] = -1, @h_0 [float] = 0.701)
RETURNS [float] WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [CosmologyCASJOBS].[SQLCosmology.SQLCosmologyFunctionsFreeParameters].[ComovVolume]
GO
/****** Object:  UserDefinedFunction [dbo].[fCosmoDa]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[fCosmoDa](@z [float], @OmegaM [float] = 0.27891507, @OmegaL [float] = 0.721, @OmegaR [float] = 8.493E-05, @omega0 [float] = -1, @h_0 [float] = 0.701)
RETURNS [float] WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [CosmologyCASJOBS].[SQLCosmology.SQLCosmologyFunctionsFreeParameters].[AngularDiameterDist]
GO
/****** Object:  UserDefinedFunction [dbo].[fCosmoDc]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[fCosmoDc](@z [float], @OmegaM [float] = 0.27891507, @OmegaL [float] = 0.721, @OmegaR [float] = 8.493E-05, @omega0 [float] = -1, @h_0 [float] = 0.701)
RETURNS [float] WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [CosmologyCASJOBS].[SQLCosmology.SQLCosmologyFunctionsFreeParameters].[ComovDistLineOfSight]
GO
/****** Object:  UserDefinedFunction [dbo].[fCosmoDistanceModulus]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
CREATE FUNCTION [dbo].[fCosmoDistanceModulus]( @z float, @OmegaM float=0.27891507, @OmegaL float=0.721, @OmegaR float=8.493e-5, @omega0 float=-1, @h_0 float=0.701)
----------------------------------------------------------------
--/H Returns the distance modulus at a particular redshift.<br>
--/U -----------------------------------------------------------
--/T Parameters:<br>
--/T <li> @z float: redshift
--/T <li> @OmegaM float: matter density. If set as DEFAULT, then 0.27891507
--/T <li> @OmegaL float: dark energy density. If set as DEFAULT, then 0.721
--/T <li> @OmegaR float: radiation density. If set as DEFAULT, then 8.493e-5
--/T <li> @omega0 float: dark energy state equation. If set as DEFAULT, then -1
--/T <li> @h_0 float: (hubble constant[Km/s/MPc])/(100[Km/s/MPc]). If set as DEFAULT, then 0.701
--/T Reference:
--/T http://lambda.gsfc.nasa.gov/product/map/dr3/pub_papers/fiveyear/cosmology/wmap_5yr_cosmo.pdf <br>
--/T <li> returns DistanceModulus: distance modulus 
--/T <br><samp> select dbo.fCosmoDistanceModulus(0.1,0.27891507,0.721,8.493e-5,-1,0.701);select dbo.fCosmoDistanceModulus(0.1,DEFAULT,DEFAULT,DEFAULT,DEFAULT,DEFAULT) </samp>
--/T <br> return 38.3155123821697 and 38.3155123821697
--/T <br> see also fCosmoAbsMag
RETURNS float
AS 
begin
declare @answer float
set @answer =  5.0*LOG10(dbo.fCosmoDl(@z, @OmegaM, @OmegaL, @OmegaR, @omega0, @h_0) ) + 25.0
return @answer
end
GO
/****** Object:  UserDefinedFunction [dbo].[fCosmoDl]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[fCosmoDl](@z [float], @OmegaM [float] = 0.27891507, @OmegaL [float] = 0.721, @OmegaR [float] = 8.493E-05, @omega0 [float] = -1, @h_0 [float] = 0.701)
RETURNS [float] WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [CosmologyCASJOBS].[SQLCosmology.SQLCosmologyFunctionsFreeParameters].[LuminosityDistance]
GO
/****** Object:  UserDefinedFunction [dbo].[fCosmoDm]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[fCosmoDm](@z [float], @OmegaM [float] = 0.27891507, @OmegaL [float] = 0.721, @OmegaR [float] = 8.493E-05, @omega0 [float] = -1, @h_0 [float] = 0.701)
RETURNS [float] WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [CosmologyCASJOBS].[SQLCosmology.SQLCosmologyFunctionsFreeParameters].[ComovDistTransverse]
GO
/****** Object:  UserDefinedFunction [dbo].[fCosmoHubbleDistance]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[fCosmoHubbleDistance](@h_0 [float] = 0.701)
RETURNS [float] WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [CosmologyCASJOBS].[SQLCosmology.SQLCosmologyFunctionsFreeParameters].[HubbleDistance]
GO
/****** Object:  UserDefinedFunction [dbo].[fCosmoLookBackTime]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[fCosmoLookBackTime](@z [float], @OmegaM [float] = 0.27891507, @OmegaL [float] = 0.721, @OmegaR [float] = 8.493E-05, @omega0 [float] = -1, @h_0 [float] = 0.701)
RETURNS [float] WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [CosmologyCASJOBS].[SQLCosmology.SQLCosmologyFunctionsFreeParameters].[LookBackTime]
GO
/****** Object:  UserDefinedFunction [dbo].[fCosmoQuantities]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[fCosmoQuantities](@zMin [float], @zMax [float], @NumBin [int], @OmegaM [float] = 0.27891507, @OmegaL [float] = 0.721, @OmegaR [float] = 8.493E-05, @omega0 [float] = -1, @h_0 [float] = 0.701)
RETURNS  TABLE (
	[z] [float] NULL,
	[Dc] [float] NULL,
	[Dm] [float] NULL,
	[Da] [float] NULL,
	[Dl] [float] NULL,
	[Dh] [float] NULL,
	[ComVol] [float] NULL,
	[LookBackTime] [float] NULL,
	[AgeOfUniverse] [float] NULL
) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [CosmologyCASJOBS].[SQLCosmology.SQLCosmologyFunctionsFreeParameters].[GridAllCosmoQuantitiesIEnumerable]
GO
/****** Object:  UserDefinedFunction [dbo].[fCosmoTimeInterval]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[fCosmoTimeInterval](@zMin [float], @zMax [float], @OmegaM [float] = 0.27891507, @OmegaL [float] = 0.721, @OmegaR [float] = 8.493E-05, @omega0 [float] = -1, @h_0 [float] = 0.701)
RETURNS [float] WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [CosmologyCASJOBS].[SQLCosmology.SQLCosmologyFunctionsFreeParameters].[TimeInterval]
GO
/****** Object:  UserDefinedFunction [dbo].[fCosmoZfromAgeOfUniverse]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[fCosmoZfromAgeOfUniverse](@AgeOfUniverse [float], @OmegaM [float] = 0.27891507, @OmegaL [float] = 0.721, @OmegaR [float] = 8.493E-05, @omega0 [float] = -1, @h_0 [float] = 0.701)
RETURNS [float] WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [CosmologyCASJOBS].[SQLCosmology.SQLCosmologyFunctionsFreeParameters].[RedshiftAtAgeOfUniverse]
GO
/****** Object:  UserDefinedFunction [dbo].[fCosmoZfromDa]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[fCosmoZfromDa](@AngularDiamDist [float], @OmegaM [float] = 0.27891507, @OmegaL [float] = 0.721, @OmegaR [float] = 8.493E-05, @omega0 [float] = -1, @h_0 [float] = 0.701)
RETURNS  TABLE (
	[z1] [float] NULL,
	[z2] [float] NULL
) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [CosmologyCASJOBS].[SQLCosmology.SQLCosmologyFunctionsFreeParameters].[RedshiftAtAngularDiamDist]
GO
/****** Object:  UserDefinedFunction [dbo].[fCosmoZfromDc]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[fCosmoZfromDc](@ComovDistLineOfSight [float], @OmegaM [float] = 0.27891507, @OmegaL [float] = 0.721, @OmegaR [float] = 8.493E-05, @omega0 [float] = -1, @h_0 [float] = 0.701)
RETURNS [float] WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [CosmologyCASJOBS].[SQLCosmology.SQLCosmologyFunctionsFreeParameters].[RedshiftAtComovDistLineOfSight]
GO
/****** Object:  UserDefinedFunction [dbo].[fCosmoZfromDl]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[fCosmoZfromDl](@LuminosityDistance [float], @OmegaM [float] = 0.27891507, @OmegaL [float] = 0.721, @OmegaR [float] = 8.493E-05, @omega0 [float] = -1, @h_0 [float] = 0.701)
RETURNS [float] WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [CosmologyCASJOBS].[SQLCosmology.SQLCosmologyFunctionsFreeParameters].[RedshiftAtLuminosityDistance]
GO
/****** Object:  UserDefinedFunction [dbo].[fCosmoZfromDm]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[fCosmoZfromDm](@ComovDistTransverse [float], @OmegaM [float] = 0.27891507, @OmegaL [float] = 0.721, @OmegaR [float] = 8.493E-05, @omega0 [float] = -1, @h_0 [float] = 0.701)
RETURNS [float] WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [CosmologyCASJOBS].[SQLCosmology.SQLCosmologyFunctionsFreeParameters].[RedshiftAtComovDistTransverse]
GO
/****** Object:  UserDefinedFunction [dbo].[fCosmoZfromLookBackTime]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[fCosmoZfromLookBackTime](@LookBackTime [float], @OmegaM [float] = 0.27891507, @OmegaL [float] = 0.721, @OmegaR [float] = 8.493E-05, @omega0 [float] = -1, @h_0 [float] = 0.701)
RETURNS [float] WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [CosmologyCASJOBS].[SQLCosmology.SQLCosmologyFunctionsFreeParameters].[RedshiftAtLookBackTime]
GO
/****** Object:  UserDefinedFunction [dbo].[fDatediffSec]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION  [dbo].[fDatediffSec](@start datetime, @now datetime) 
-------------------------------------------------------------
--/H fDatediffSec(start,now) returns the difference in seconds as a float
-----
--/T <p> parameters:  
--/T <li> start datetime,   		-- start time
--/T <li> now datetime,   		-- end time
--/T <li> returns float 	   	-- elapsed time in seconds. 
--/T <br>
--/T sample use: <samp> 
--/T      declare @start datetime 
--/T      set @start  = current_timestamp
--/T      do something 
--/T      print 'elapsed time was ' + str(dbo.fDatediffSec(@start, current_timestamp),10,3) + ' seconds'
--/T </samp> 
-------------------------------------------------------------
RETURNS float
AS
BEGIN
  RETURN(datediff(millisecond, @start, @now)/1000.0)
END   			-- End fDatediffSec()

GO
/****** Object:  UserDefinedFunction [dbo].[fDistanceArcMinEq]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fDistanceArcMinEq](@ra1 float, @dec1 float, 
                                  @ra2 float, @dec2 float)
-------------------------------------------------------------
--/H returns distance (arc minutes) between two points (ra1,dec1) and (ra2,dec2)
-------------------------------------------------------------
--/T <br> ra1, dec1, ra2, dec2 are in degrees
--/T <br>
--/T <samp>select top 10 objid, dbo.fDistanceArcMinEq(185,0,ra,dec) from PhotoObj </samp>
-------------------------------------------------------------
RETURNS float as
  BEGIN
	DECLARE @d2r float,@nx1 float,@ny1 float,@nz1 float, @nx2 float,@ny2 float,@nz2 float
	SET @d2r = PI()/180.0
	SET @nx1  = COS(@dec1*@d2r)*COS(@ra1*@d2r)
	SET @ny1  = COS(@dec1*@d2r)*SIN(@ra1*@d2r)
	SET @nz1  = SIN(@dec1*@d2r)
	SET @nx2  = COS(@dec2*@d2r)*COS(@ra2*@d2r)
	SET @ny2  = COS(@dec2*@d2r)*SIN(@ra2*@d2r)
	SET @nz2  = SIN(@dec2*@d2r)

  RETURN ( 2*DEGREES(ASIN(sqrt(power(@nx1-@nx2,2)+power(@ny1-@ny2,2)+power(@nz1-@nz2,2))/2))*60)
  END
GO
/****** Object:  UserDefinedFunction [dbo].[fDistanceArcMinXYZ]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fDistanceArcMinXYZ](@nx1 float, @ny1 float, @nz1 float, 
					@nx2 float, @ny2 float, @nz2 float)
-------------------------------------------------------------
--/H returns distance (arc minutes) between two points (x1,y1,z1) and (x2,y2,z2)
-------------------------------------------------------------
--/T <br> the two points are on the unit sphere
--/T <br>
--/T <samp>select top 10 objid, dbo.fDistanceArcMinXYZ(1,0,0,cx,cy,cz) from PhotoObj </samp>   
-------------------------------------------------
RETURNS float as
BEGIN
    DECLARE @d2r float 
    RETURN ( 2*DEGREES(ASIN(sqrt(power(@nx1-@nx2,2)+power(@ny1-@ny2,2)+power(@nz1-@nz2,2))/2))*60) 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fDistanceEq]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[fDistanceEq](@ra1 [float], @dec1 [float], @ra2 [float], @dec2 [float])
RETURNS [float] WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SphericalHTM].[Spherical.Htm.Sql].[fDistanceEq]
GO
/****** Object:  UserDefinedFunction [dbo].[fDistanceXyz]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[fDistanceXyz](@x1 [float], @y1 [float], @z1 [float], @x2 [float], @y2 [float], @z2 [float])
RETURNS [float] WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SphericalHTM].[Spherical.Htm.Sql].[fDistanceXyz]
GO
/****** Object:  UserDefinedFunction [dbo].[fDMS]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fDMS](@deg float)
-------------------------------------------------------------------------------
--/H Convert declination in degrees to +dd:mm:ss.ss notation 
-------------------------------------------------------------------------------
--/T <i>NOTE: this function should not be used to generate SDSS IAU names,
--/T use fIAUFromEq instead. </i>
--/T <p><samp> select dbo.fDMS(87.5) </samp>
-------------------------------------------------------------------------------
RETURNS varchar(32)
AS BEGIN
    RETURN dbo.fDMSbase(@deg,default,default);
END

GO
/****** Object:  UserDefinedFunction [dbo].[fDMSbase]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE  FUNCTION [dbo].[fDMSbase](@deg float, @truncate int = 0, @precision int = 2)
-------------------------------------------------------------------------------
--/H Base function to convert declination in degrees to +dd:mm:ss.ss notation.
-------------------------------------------------------------------------------
--/T @truncate is 0 (default) if decimal digits to be rounded, 1 to be truncated.
--/T <br> @precision is the number of decimal digits, default 2.
--/T <p><samp> select dbo.fDMSbase(87.5,1,4) </samp> <br>
--/T <samp> select dbo.fDMSbase(87.5,default,default) </samp>
-------------------------------------------------------------------------------
RETURNS varchar(32)
AS BEGIN
    DECLARE	
	@s char(1), 
	@d float, 
	@nd int, 
	@np int, 
	@q varchar(32),
	@t varchar(32);
	--
	SET @s = '+';
 	IF  @deg<0 SET @s = '-';
	--
	SET @t = '00:00:00.0'
	IF (@precision < 1) SET @precision = 1;
	IF (@precision > 10) SET @precision = 10;
	SET @np = 0
	WHILE (@np < @precision-1) BEGIN
		SET @t = @t+'0'
		SET @np = @np + 1
	END
	SET @d = ABS(@deg);
	-- degrees
	SET @nd = FLOOR(@d);
	SET @q  = LTRIM(CAST(@nd as varchar(2)));
	SET @t  = STUFF(@t,3-LEN(@q),LEN(@q), @q);
	-- minutes
	SET @d  = 60.0 * (@d-@nd);
	SET @nd = FLOOR(@d);
	SET @q  = LTRIM(CAST(@nd as varchar(4)));
	SET @t  = STUFF(@t,6-LEN(@q),LEN(@q), @q);
	-- seconds
	SET @d  = ROUND( 60.0 * (@d-@nd),@precision,@truncate );
--	SET @d  = 60.0 * (@d-@nd);
	SET @q  = LTRIM(STR(@d,6+@precision,@precision));
	SET @t = STUFF(@t,10+@precision-LEN(@q),LEN(@q), @q);
	--
	RETURN(@s+@t);
END

GO
/****** Object:  UserDefinedFunction [dbo].[fDocColumns]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--
CREATE FUNCTION [dbo].[fDocColumns](@tablename varchar(400))
-------------------------------------------------
--/H Return the list of Columns in a given table or view
-------------------------------------------------
--/T Used by the auto-doc interface.  For getting 
--/T the 'rank' column in the DBColumns table, 
--/T see fDocColumnsWithRank.
--/T <samp>
--/T select * from dbo.fDocColumns('Star')
--/T </samp>
-------------------------------------------------
RETURNS @out TABLE (
	[enum]		varchar(64),
	[name]		varchar(64),
	[type] 		varchar(32),
	[length]	int,
	[unit]		varchar(64),
	[ucd]		varchar(64),
	[description]	varchar(2048),
	[columnID]		int primary key
)
AS BEGIN
	---------------------------------
	-- get the objectid of DBObject,
	-- and its system type
	---------------------------------
	DECLARE @oid bigint, @type varchar(3);
	SELECT @oid=object_id, @type=type
	FROM sys.objects
	WHERE name=@tablename
	-------------------
	-- handle views
	-------------------
	IF (@type='V')
	BEGIN
		---------------------------------------------------
		-- extract distinct parent-child relationships
		-- from the sys.sql_dependencies table, ignoring
		-- the column information first
		---------------------------------------------------
		DECLARE @meta TABLE (
			tableName varchar(128),
			name varchar(64),
			unit varchar(64),
			ucd varchar(128),
			enum varchar(64),
			description varchar(2000)
		)
		DECLARE @depends table (
			child varchar(32),
			parent varchar(32),
			type varchar(32)
		)
		--
		INSERT @depends
		SELECT distinct d.VIEW_NAME as child, d.TABLE_NAME as parent, o.TABLE_TYPE as type
		FROM INFORMATION_SCHEMA.VIEW_COLUMN_USAGE d, INFORMATION_SCHEMA.TABLES o
		WHERE d.TABLE_NAME=o.TABLE_NAME;
		-----------------------------------------------
		-- extract the parent objects, by tracking
		-- them on the dependency tree, until we get
		-- to user tables
		-----------------------------------------------
		WITH Next (child, parent, type, level)
		AS
		( select child, parent, type, 0
			from @depends where child=@tablename
		UNION ALL
		  select p.child, p.parent, p.type, level+1
			from @depends p inner join
			Next A ON A.parent = p.child
		)
		----------------------------------------------
		-- get distinct names of columns that we depend on
		----------------------------------------------
		INSERT @meta
		SELECT m.tablename, m.name, m.unit, m.ucd, m.enum, m.description
		FROM Next p, INFORMATION_SCHEMA.VIEW_COLUMN_USAGE d, DBColumns m
		WHERE p.child = d.VIEW_NAME
		  and p.parent= d.TABLE_NAME
		  and p.type  ='BASE TABLE'
		  and d.TABLE_NAME  = m.tableName
		  and d.COLUMN_NAME = m.name
		-------------------------------------
		-- Get list of columns in the view
		-- and all their relevant properties.
		-- Need the sys.columns, since only 
		-- this has only the max_length in bytes
		-------------------------------------
		INSERT @out
		SELECT '', c.name, t.name as type, c.max_length as length,
			'','','',c.column_id
		FROM sys.columns c, sys.types t, sys.objects o
		WHERE c.system_type_id = t.system_type_id
		  and c.object_id = o.object_id
		  and o.name = @tablename
		ORDER BY c.column_id
		---------------------------------------
		-- insert back if there is easy match
		---------------------------------------
		UPDATE o
		SET enum = m.enum,
			unit = m.unit,
			ucd  = m.ucd,
			description = m.description
		FROM @out o, @meta m
		WHERE o.name = m.name
		------------------------------------------------
		-- one could do better by looking for leftovers
		-- but do not want to go there now
		------------------------------------------------
	END
	---------------------------
	-- handle a table
	---------------------------
	IF (@type='U')
	BEGIN
	---------------------------
		INSERT @out
		SELECT m.enum, c.name, t.name as type, c.max_length as length,
			m.unit, m.ucd, m.description, c.column_id
		FROM sys.objects o, sys.columns c, sys.types t, DBColumns m
		WHERE o.object_id=c.object_id
		  and o.type_desc='USER_TABLE'
		  and m.tablename = o.name
		  and c.name = m.name
		  and c.system_type_id = t.system_type_id
		  and o.name=@tablename
		  order by c.column_id
	END
	--------------------------
    RETURN
END


GO
/****** Object:  UserDefinedFunction [dbo].[fDocColumnsWithRank]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fDocColumnsWithRank](@tablename varchar(400))
-------------------------------------------------
--/H Return the list of Columns plus 'rank'
-------------------------------------------------
--/T Used by the auto-doc interface and query builder tools.
--/T Also returns the 'rank' column that is used to order 
--/T the columns in query tools.
--/T <samp>
--/T select * from dbo.fDocColumnsWithRank('PhotoObjAll')
--/T </samp>
-------------------------------------------------
RETURNS @out TABLE (
	[enum]		varchar(64),
	[name]		varchar(64),
	[type] 		varchar(32),
	[length]	int,
	[unit]		varchar(64),
	[ucd]		varchar(128),
	[description]	varchar(2048),
	[rank]		int
)
AS BEGIN
	---------------------------------
	-- get the objectid of DBObject,
	-- and its system type
	---------------------------------
	DECLARE @oid bigint, @type varchar(3);
	SELECT @oid=object_id, @type=type
	FROM sys.objects
	WHERE name=@tablename
	-------------------
	-- handle views
	-------------------
	IF (@type='V')
	BEGIN
		---------------------------------------------------
		-- extract distinct parent-child relationships
		-- from the sys.sql_dependencies table, ignoring
		-- the column information first
		---------------------------------------------------
		DECLARE @meta TABLE (
			tableName varchar(128),
			name varchar(64),
			unit varchar(64),
			ucd varchar(128),
			enum varchar(64),
			description varchar(2000),
			rank int
		)
		DECLARE @depends table (
			child varchar(32),
			parent varchar(32),
			type varchar(32)
		)
		--
		INSERT @depends
		SELECT distinct d.VIEW_NAME as child, 
				d.TABLE_NAME as parent, o.TABLE_TYPE as type
		FROM INFORMATION_SCHEMA.VIEW_COLUMN_USAGE d, 
			INFORMATION_SCHEMA.TABLES o
		WHERE d.TABLE_NAME=o.TABLE_NAME;
		-----------------------------------------------
		-- extract the parent objects, by tracking
		-- them on the dependency tree, until we get
		-- to user tables
		-----------------------------------------------
		WITH Next (child, parent, type, level)
		AS
		( select child, parent, type, 0
			from @depends where child=@tablename
		UNION ALL
		  select p.child, p.parent, p.type, level+1
			from @depends p inner join
			Next A ON A.parent = p.child
		)
		----------------------------------------------
		-- get distinct names of columns that we depend on
		----------------------------------------------
		INSERT @meta
		SELECT m.tablename, m.name, m.unit, m.ucd, 
				m.enum, m.description, m.rank
		FROM Next p, INFORMATION_SCHEMA.VIEW_COLUMN_USAGE d, DBColumns m
		WHERE p.child = d.VIEW_NAME
		  and p.parent= d.TABLE_NAME
		  and p.type  ='BASE TABLE'
		  and d.TABLE_NAME  = m.tableName
		  and d.COLUMN_NAME = m.name
		-------------------------------------
		-- Get list of columns in the view
		-- and all their relevant properties.
		-- Need the sys.columns, since only 
		-- this has only the max_length in bytes
		-------------------------------------
		INSERT @out
		SELECT '', c.name, t.name as type, c.max_length as length,
			'','','',0
		FROM sys.columns c, sys.types t, sys.objects o
		WHERE c.system_type_id = t.system_type_id
		  and c.object_id = o.object_id
		  and o.name = @tablename
		ORDER BY c.column_id
		---------------------------------------
		-- insert back if there is easy match
		---------------------------------------
		UPDATE o
		SET enum = m.enum,
			unit = m.unit,
			ucd  = m.ucd,
			description = m.description,
			rank = m.rank
		FROM @out o, @meta m
		WHERE o.name = m.name
		------------------------------------------------
		-- one could do better by looking for leftovers
		-- but do not want to go there now
		------------------------------------------------
	END
	---------------------------
	-- handle a table
	---------------------------
	IF (@type='U')
	BEGIN
	---------------------------
		INSERT @out
		SELECT m.enum, c.name, t.name as type, c.max_length as length,
			m.unit, m.ucd, m.description, m.rank
		FROM sys.objects o, sys.columns c, sys.types t, DBColumns m
		WHERE o.object_id=c.object_id
		  and o.type_desc='USER_TABLE'
		  and m.tablename = o.name
		  and c.name = m.name
		  and c.system_type_id = t.system_type_id
		  and o.name=@tablename
		  order by c.column_id
	END
	--------------------------
    RETURN
END

GO
/****** Object:  UserDefinedFunction [dbo].[fDocFunctionParams]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fDocFunctionParams](@functionname varchar(400))
-------------------------------------------------
--/H Return the parameters of a function
-------------------------------------------------
--/T Used by the auto-doc interface.
--/T<br>
--/T<samp>
--/T select * from dbo.fDocFunctionParams('fGetNearbyObjEq')
--/T</samp>
-------------------------------------------------
RETURNS @params TABLE (
	[name]		varchar(64),
	[type] 		varchar(32),
	[length]	int,
	[inout]		varchar(8),
	pnum		int
)
AS BEGIN
	---------------------------------
	-- get the objectid of DBObject,
	-- and its system type
	---------------------------------
	DECLARE @oid bigint, @type varchar(3);
	SELECT @oid=object_id, @type=type
	FROM sys.objects
	WHERE name=@functionname

	----------------------------
	-- get the input parameters
	----------------------------
	INSERT @params
	SELECT p.name, t.name as type, p.max_length as length,	
		'input', parameter_id as pnum
	FROM sys.objects o
	   JOIN sys.parameters p ON o.object_id = p.object_id
           JOIN sys.types t ON p.system_type_id = t.system_type_id
	WHERE 
	  o.object_id=@oid
	  and p.is_output != 'True'
	ORDER BY pnum
	  
	----------------------------
	-- get the output params
	----------------------------
	INSERT @params
	SELECT p.name, t.name as type, p.max_length as length, 
		'output', p.parameter_id as pnum
	FROM sys.objects o
	   JOIN sys.parameters p ON o.object_id = p.object_id
	   JOIN sys.types t ON p.system_type_id = t.system_type_id
	WHERE 
	  o.object_id=@oid
	  and p.is_output = 'True'

	----------------------------
	-- get the output columns
	----------------------------
	INSERT @params
	SELECT c.name, t.name as type, c.max_length as length, 
		'output', c.column_id as pnum
	FROM sys.objects o
	   JOIN sys.columns c ON o.object_id = c.object_id
	   JOIN sys.types t ON c.system_type_id = t.system_type_id
	WHERE 
	  o.object_id=@oid
	ORDER BY pnum
    RETURN
END

GO
/****** Object:  UserDefinedFunction [dbo].[fEbossTarget0]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fEbossTarget0](@name varchar(40))
-------------------------------------------------------------
--/H Returns the EbossTarget0 value corresponding to a name
-------------------------------------------------------------
--/T the spectro EbossTarget0 flags can be shown with Select * from EbossTarget0 
--/T <br>
--/T Sample call to find spec objects that are known QSOs from previous surveys is
--/T <samp> 
--/T <br> select top 10 * 
--/T <br> from specObj 
--/T <br> where eboss_target0 & dbo.fEbossTarget0('QSO_KNOWN') > 0 
--/T </samp> 
-------------------------------------------------------------
RETURNS bigint
AS BEGIN
RETURN ( SELECT cast(value as bigint)
	FROM EbossTarget0
	WHERE name = UPPER(@name)
	)
END
GO
/****** Object:  UserDefinedFunction [dbo].[fEbossTarget0N]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fEbossTarget0N](@value bigint)
---------------------------------------------------
--/H Returns the expanded EbossTarget0 corresponding to the flag value as a string
---------------------------------------------------
--/T The spectro EbossTarget0 flags can be shown with Select * from EbossTarget0 
--/T <br>
--/T Sample call to show the EBOSS target0 flags of some spec objects is
--/T <samp> 
--/T <br> select top 10 specObjId, dbo.fEbossTarget0N(eboss_target0) as EbossTarget0
--/T <br> from specObj 
--/T </samp> 
--/T <br> see also fEbossTarget0
-------------------------------------------------------------
RETURNS varchar(1000)
BEGIN
    DECLARE @bit int, @mask bigint, @out varchar(2000);
    SET @bit=63;
    SET @out ='';
    WHILE (@bit>0)
	BEGIN
	    SET @bit = @bit-1;
	    SET @mask = power(cast(2 as bigint),@bit);
	    SET @out = @out + (CASE 
		WHEN (@mask & @value)=0 THEN '' 
		ELSE coalesce((select name from EbossTarget0 where value=@mask),'')+' '
	    	END);
	END
    RETURN @out;
END
GO
/****** Object:  UserDefinedFunction [dbo].[fEnum]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fEnum](
	@value binary(8), 
	@type varchar(32), 
	@length int)
----------------------------------------------------
--/H Converts @value in an enum table to a string
--/U
--/T Takes a binary(8) value, and converts it first
--/T to a type of given length, then to a string.
--/T It is used by the spDocEnum procedure.
----------------------------------------------------
RETURNS varchar(64)
AS BEGIN
    DECLARE @vstr varchar(64),
			@vbin4 binary(4),
			@vint int;
    SET @vint  = CAST(@value as int);
    --	
    IF (@type<>'binary')
		SET @vstr = CAST(@vint as varchar(64));
    ELSE 
    BEGIN
	IF (@length = 8) SELECT @vstr = master.dbo.fn_varbintohexstr(@value);
        ELSE 
            BEGIN
		SET @vbin4   = CAST(@value as binary(4));
		SELECT @vstr = master.dbo.fn_varbintohexstr(@vbin4);
		----------------------------------------------
		-- also handle the tinyint and smallint cases
		----------------------------------------------
            	IF (@length = 2) SET @vstr = CAST(@vstr as varchar(6));
		IF (@length = 1) SET @vstr = CAST(@vstr as varchar(4));
	    END
    END
    RETURN @vstr;
END

GO
/****** Object:  UserDefinedFunction [dbo].[fEqFromMuNu]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fEqFromMuNu](
	@mu float,
	@nu float,
	@node float,
	@incl float
)
RETURNS @coord TABLE (ra float, dec float, cx float, cy float, cz float)
----------------------------------------------------
--/H Compute Equatorial coordinates from @mu and @nu
-- 
--/T Compute both ra,dec anmd cx,cy,cz, given @mu,@nu, @node,@incl
--/T all in degrees
----------------------------------------------------
AS BEGIN
    DECLARE
	@rmu float, @rnu float, @rin float,
	@ra float, @dec float, 
	@cx float, @cy float, @cz float,
	@gx float, @gy float, @gz float;
	--
    -- convert to radians
    SET @rmu = RADIANS(@mu-@node);
    SET @rnu = RADIANS(@nu);
    SET @rin = RADIANS(@incl);
    --
    SET @gx = cos(@rmu)*cos(@rnu);
    SET @gy = sin(@rmu)*cos(@rnu);
    SET @gz = sin(@rnu);
    --
    SET @cx = @gx;
    SET @cy = @gy*cos(@rin)-@gz*sin(@rin);
    SET @cz = @gy*sin(@rin)+@gz*cos(@rin);
    --
    SET @dec = DEGREES(asin(@cz));
    SET @ra  = DEGREES(atn2(@cy,@cx)) + @node;
    IF  @ra<0 SET @ra = @ra+360 ;
    --
    SET @cx = cos(RADIANS(@ra))*cos(RADIANS(@dec));
    SET @cy = sin(RADIANS(@ra))*cos(RADIANS(@dec));
    --
    INSERT @coord VALUES(@ra, @dec, @cx, @cy, @cz);
    RETURN
END
GO
/****** Object:  UserDefinedFunction [dbo].[fEtaFromEq]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fEtaFromEq](@ra float,@dec float)
------------------------------------------------------------
--/H Returns eta from ra,dec
------------------------------------------------------------
--/D This is the generic service function for SDSS specific
--/D coordinate conversions. It derives all the coordinates
--/D from the ra,dec, based on the definition of the primary
--/D areas of the stripes. For the Southern stripes, it returns
--/D a mu value shifted by 360 degrees, in order to have a
--/D non-negative and monotonic quantity.
------------------------------------------------------------
RETURNS float
AS BEGIN
    DECLARE 
	@cx float, @cy float, @cz float,
	@lambda float, @eta float, 
        @stripeEta float;
    --
    SET @cx = cos(radians(@dec))* cos(radians(@ra-95.0));
    SET @cy = cos(radians(@dec))* sin(radians(@ra-95.0));
    SET @cz = sin(radians(@dec));
    --
    SET @lambda = -degrees(asin(@cx));
    IF (@cy = 0.0 and @cz = 0.0)
        SET @cy = 1e-16;
    SET @eta    =  degrees(atn2(@cz,@cy))-32.5;
    SET @stripeEta = @eta;
    --
    IF @lambda < -180.0 SET @lambda = @lambda+360.0;
    IF @lambda >= 180.0 SET @lambda = @lambda-360.0;
    IF ABS(@lambda) > 90.0
       BEGIN
           SET @lambda = 180.0-@lambda;
           SET @eta = @eta+180.0;
       END
    IF @lambda < -180.0 SET @lambda = @lambda+360.0;
    IF @lambda >= 180.0 SET @lambda = @lambda-360.0;
    IF @eta < 0.0 SET @eta = @eta+360.0;
    IF @eta >= 360.0 SET @eta = @eta-360.0;
    IF ABS(@lambda) = 90.0 SET @eta = 0.0;
    IF @eta < -180.0 SET @eta = @eta+360.0;
    IF @eta >= 180.0 SET @eta = @eta-360.0;
    IF @eta > 57.5	-- 90.0-32.5
       BEGIN
           SET @eta = @eta-180.0;
       END
    --
    RETURN @eta
END
GO
/****** Object:  UserDefinedFunction [dbo].[fEtaToNormal]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fEtaToNormal](@eta float)
-------------------------------------------------------
--/H Compute the normal vector from an eta value
--  --------------------------------------------------
--/T 
--/T 
-------------------------------------------------------
RETURNS @v3 TABLE (x float, y float, z float)
AS BEGIN
    --
    DECLARE @x float, @y float, @z float;
    SET @x = SIN(RADIANS(@eta));
    SET @y = COS(RADIANS(@eta));
    SET @z = 0.0;
    --
    INSERT @v3 SELECT x, y, z 
	FROM dbo.fRotateV3('S2J',@x, @y, @z)
    RETURN
END
GO
/****** Object:  UserDefinedFunction [dbo].[fFiber]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fFiber](@SpecID bigint)
-----------------------------------------------------------------
--/H Extracts Fiber from an SDSS Spec ID
--
--/T The bit-fields (starting from bit# 63) and their lengths are: <br>
--/T     plate[14] - bits 50-63 for the plate number, <br>
--/T     fiber[12]  - bits 38-49 for (MJD - 50000), <br>
--/T     mjd[14] - bits 24-37 for the fiberid, <br>
--/T     run2d[14] - bits 10-23 for the spec2d rerun, and <br>
--/T     0         - bits 0-9 unused in SpecObj, used for line/redshift/index
--/T                 in other tables. <br>
--/T <samp> select top 10 dbo.fFiber(specObjID) as fiber from SpecObj </samp>
-----------------------------------------------------------------
RETURNS INT
AS BEGIN
	DECLARE @two BIGINT
	SET @two = 2;
	RETURN ( cast(((@SpecID & 0x0003FFFFFFFFFFFF) / power(@two,38)) AS INT));
END  

GO
/****** Object:  UserDefinedFunction [dbo].[fField]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION  [dbo].[fField](@ObjID bigint)
-------------------------------------------------------------------------------
--/H Extracts Field from an SDSS Photo Object ID.
--
--/T The bit-fields and their lengths are: Skyversion[5] Rerun[11] Run[16] Camcol[3] First[1] Field[12] Obj[16]<br>
--/T <samp> select top 10 objId, dbo.fField(objId) as fField from Galaxy</samp>
-------------------------------------------------------------------------------
RETURNS INT
AS BEGIN
    RETURN ( cast( ((@ObjID / power(cast(2 as bigint),16)) & 0x00000FFF) AS INT));
END

GO
/****** Object:  UserDefinedFunction [dbo].[fFieldMask]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fFieldMask](@name varchar(40))
-------------------------------------------------------------
--/H Returns mask value for a given name (e.g. "seeing")
-------------------------------------------------------------
--/T the FieldMask values can be found with Select * from FieldMask. 
--/T <br>
--/T Sample call to find fields with good seeing.
--/T <samp> 
--/T <br> select top 10 * 
--/T <br> from field 
--/T <br> where goodMask & dbo.fFieldMask('Seeing') > 0 
--/T </samp> 
--/T <br> see also fFieldMaskN
-------------------------------------------------------------
RETURNS int
AS BEGIN
RETURN ( SELECT cast(value as int)
	FROM FieldMask
	WHERE name = UPPER(@name)
	)
END
GO
/****** Object:  UserDefinedFunction [dbo].[fFieldMaskN]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fFieldMaskN](@value int)
-------------------------------------------------------------
--/H Returns description of mask value (e.g. "SEEING PSF")
-------------------------------------------------------------
--/T the FieldMask values can be found with Select * from FieldMask. 
--/T <br>
--/T Sample call to field masks.
--/T <samp> 
--/T <br> select top 10 
--/T <br> 	dbo.fFieldMaskN(goodMask) as good,
--/T <br> 	dbo.fFieldMaskN(acceptableMask) as acceptable, 
--/T <br> 	dbo.fFieldMaskN(badMask) as bad  
--/T <br> from field
--/T </samp> 
--/T <br> see also fFieldMask
-------------------------------------------------------------
RETURNS varchar(1000)
BEGIN
    DECLARE @bit int, @mask bigint, @out varchar(2000);
    SET @bit=32;
    SET @out ='';
    WHILE (@bit>0)
	BEGIN
	    SET @bit = @bit-1;
	    SET @mask = power(cast(2 as bigint),@bit);
	    SET @out = @out + (CASE 
		WHEN (@mask & @value)=0 THEN '' 
		ELSE coalesce((select name from FieldMask where value=@mask),'')+' '
	    	END);
	END
    RETURN @out;
END
GO
/****** Object:  UserDefinedFunction [dbo].[fFieldQuality]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fFieldQuality](@name varchar(40))
-------------------------------------------------------------
--/H Returns bitmask of named field quality (e.g. ACCEPTABLE, BAD, GOOD, HOLE, MISSING)
-------------------------------------------------------------
--/T the fFieldQuality names can be found with 
--/T <br>       Select * from FieldQuality 
--/T <br>
--/T Sample call to fFieldQuality.
--/T <samp> 
--/T <br> select top 10 *  
--/T <br> from field
--/T <br> where quality =  dbo.fFieldQuality('ACCEPTABLE')
--/T </samp> 
--/T <br> see also fFieldQualityN
-------------------------------------------------------------
RETURNS INTEGER
AS BEGIN
RETURN ( SELECT value
	FROM FieldQuality
	WHERE name = UPPER(@name)
	)
END
GO
/****** Object:  UserDefinedFunction [dbo].[fFieldQualityN]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fFieldQualityN](@value int)
-------------------------------------------------------------
--/H Returns description of quality value (e.g. ACCEPTABLE, BAD, GOOD, HOLE, MISSING)
-------------------------------------------------------------
--/T the fFieldQuality values can be found with 
--/T <br>       Select * from FieldQuality
--/T <br>
--/T Sample call to fFieldQualityN.
--/T <samp> 
--/T <br> select top 10 dbo.fFieldQualityN(quality) as quality
--/T <br> from field
--/T </samp> 
--/T <br> see also fFieldQuality
-------------------------------------------------------------
RETURNS varchar(40)
AS BEGIN
RETURN ( SELECT name
	FROM FieldQuality
	WHERE value = @value
	)
END
GO
/****** Object:  UserDefinedFunction [dbo].[fFirstFieldBit]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fFirstFieldBit]()
-------------------------------------------------------------------------------
--/H Returns the bit that indicates whether an objID is in the first field of a run
--
--/T This bit can be added to an objID created with fObjidFromSDSS
--/T to create the correct objID for the case where a PhotoObj
--/T is in the first field of a run.<br>
--/T <samp> select dbo.fObjidFromSDSS(0,752,8,6,100,300) + dbo.fFirstFieldBit() </samp>
-------------------------------------------------------------------------------
RETURNS BIGINT
AS BEGIN
    RETURN cast(0x0000000010000000 as bigint);
END  

GO
/****** Object:  UserDefinedFunction [dbo].[fFramesStatus]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fFramesStatus](@name varchar(40))
-------------------------------------------------------------------------------
--/H Returns the FramesStatus value, indexed by name
-------------------------------------------------------------------------------
--/T the  FramesStatus values can be found with 
--/T <br>       Select * from FramesStatus  
--/T <br>
--/T Sample call to fFramesStatus.
--/T <samp> 
--/T <br> select top 10 *
--/T <br> from field
--/T <br> where status_r = dbo.fFramesStatus('OK')
--/T </samp> 
--/T <br> see also fFramesStatusN
-------------------------------------------------------------
RETURNS INTEGER
AS BEGIN
RETURN ( SELECT value
	FROM FramesStatus
	WHERE name = UPPER(@name)
	)
END
GO
/****** Object:  UserDefinedFunction [dbo].[fFramesStatusN]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fFramesStatusN](@value int)
-------------------------------------------------------------------------------
--/H Returns the FramesStatus name, indexed by value
-------------------------------------------------------------------------------
--/T the  FramesStatus values can be found with 
--/T <br>       Select * from FramesStatus 
--/T <br>
--/T Sample call to fFramesStatusN.
--/T <samp> 
--/T <br> select top 10 dbo.fFramesStatusN(framesstatus) as framesstatus
--/T <br> from field
--/T </samp> 
--/T <br> see also FramesStatus
-------------------------------------------------------------
RETURNS varchar(40)
AS BEGIN
RETURN ( SELECT name
	FROM FramesStatus
	WHERE value = @value
	)
END
GO
/****** Object:  UserDefinedFunction [dbo].[fGetAlpha]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[fGetAlpha](@theta float, @dec float)
----------------------------------------------------------
--/H Compute alpha "expansion" of theta for a given declination
--  ------------------------------------------------------
--/T Declination and theta are in degrees. 
----------------------------------------------------------
RETURNS float
AS BEGIN 
	IF abs(@dec)+ @theta > 89.9 RETURN 180 -- it is a bit generous but this avoids
										   -- adding 1e-9 in the sqrt 
										   -- and in any case doesn't not affect SLOAN						
	RETURN(degrees(atan(abs(
			sin(radians(@theta)) / 
			sqrt(cos(radians(@dec - @theta)) * cos(radians(@dec + @theta))
		)))))
END
GO
/****** Object:  UserDefinedFunction [dbo].[fGetBlob]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[fGetBlob](@str [nvarchar](4000))
RETURNS [varbinary](max) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [GetBlob].[UserDefinedFunctions].[getBlob]
GO
/****** Object:  UserDefinedFunction [dbo].[fGetDiagChecksum]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fGetDiagChecksum]()
--------------------------------------------
--/H Computes the checksum from the Diagnostics table
--/A
--/T The checksum should be equal to the checksum value in the
--/T SiteConstants table.
--/T <PRE> SELECT dbo.fGetDiagChecksum() </PRE> 
--------------------------------------------
RETURNS BIGINT
AS BEGIN
	RETURN (select sum(count)+count_big(*) from Diagnostics);
END
GO
/****** Object:  UserDefinedFunction [dbo].[fGetJpegObjects]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE  FUNCTION [dbo].[fGetJpegObjects](@flag int, @ra float, 
				       @dec float, @r float, @zoom float)
-------------------------------------------------------------
--/H A helper function for SDSS cutout that returns all objects
--/H within a certain radius of an (ra,dec)
-------------------------------------------------------------
--/T Photo objects are filtered to have magnitude greater than
--/T     24-1.5*zoom so that the image is not too cluttered
--/T     (and the anwswer set is not too large).<br>
--/T (@flag&1)>0 display specObj ...<br>
--/T (@flag&2)>0 display photoPrimary...<br>
--/T (@flag&4)>0 display Target <br>
--/T (@flag&8)>0 display Mask<br>
--/T (@flag&16)>0 display Plate<br>
--/T thus: @flag=7 will display all three of specObj, PhotoObj and Target
--/T the returned objects have 
--/T          flag = (specobj:1, photoobj:2, target:4, mask:8, plate:16)
-------------------------------------------------
--/A legacy: use fGetObjectsEq)
RETURNS @obj TABLE (ra float, [dec] float, flag int, objid bigint)
AS 
BEGIN
  INSERT @obj SELECT * from fGetObjectsEq(@flag, @ra, @dec, @r, @zoom)
  RETURN
END
GO
/****** Object:  UserDefinedFunction [dbo].[fGetLat]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fGetLat](@mode varchar(8),@cx float,@cy float,@cz float)
-------------------------------------------------------
--/H Converts a 3-vector to latitude (Galactic or Survey)
--  --------------------------------------------------
--/T @mode can be one of the following:
--/T <li> J2S for Survey coordinates,
--/T <li> J2G for Galactic coordinates, e.g.,
--/T <dd> select top 10 dbo.fGetLat('J2G',cx,cy,cz) from PhotoTag
--/T <br>Use fGetLon to get longitude.
-------------------------------------------------------
RETURNS float
AS BEGIN
    DECLARE @lat float;
    SELECT @lat=DEGREES(ASIN(z)) FROM dbo.fRotateV3(@mode,@cx,@cy,@cz)
    RETURN @lat
END
GO
/****** Object:  UserDefinedFunction [dbo].[fGetLon]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fGetLon](@mode varchar(8),@cx float,@cy float,@cz float)
-------------------------------------------------------
--/H Converts a 3-vector to longitude (Galactic or Survey)
--  --------------------------------------------------
--/T @mode can be one of the following:
--/T <li> J2S for Survey coordinates,
--/T <li> J2G for Galactic coordinates, e.g.,
--/T <dd> select top 10 dbo.fGetLon('J2S',cx,cy,cz) from PhotoTag
--/T <br> Use fGetLat to get latitude.
-------------------------------------------------------
RETURNS float
AS BEGIN
    DECLARE @lon float;
    SELECT @lon=DEGREES(ATN2(y,x)) FROM dbo.fRotateV3(@mode,@cx,@cy,@cz)
    IF @lon<0 SET @lon=@lon+360;
    RETURN @lon
END
GO
/****** Object:  UserDefinedFunction [dbo].[fGetLonLat]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fGetLonLat](@mode varchar(8),@cx float,@cy float,@cz float)
-------------------------------------------------------
--/H Converts a 3-vector to longitude-latitude (Galactic or Survey)
--  --------------------------------------------------
--/T @mode can be one of the following:
--/T <li> J2S for Survey coordinates
--/T <li> J2G for Galactic coordinates
--/T <br> This is an internal table-valued function that requires a cursor
--/T or variables to specify the coordinates.  Use the scalar functions
--/T fGetLon and fGetLat instead in queries. 
-------------------------------------------------------
RETURNS @coord TABLE (lon float, lat float)
AS BEGIN
    --
    DECLARE @lon float, @lat float;
    --
    SELECT @lon=DEGREES(ATN2(y,x)),@lat=DEGREES(ASIN(z))
	FROM dbo.fRotateV3(@mode,@cx,@cy,@cz)
    --
    IF @lon<0 SET @lon=@lon+360;
    INSERT @coord SELECT @lon as lon, @lat as lat
    RETURN
END
GO
/****** Object:  UserDefinedFunction [dbo].[fGetNearbyApogeeStarEq]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fGetNearbyApogeeStarEq] (@ra float, @dec float, @r float)
-------------------------------------------------------------
--/H Returns table of APOGEE spectrum objects within @r arcmins of an equatorial point (@ra,@dec).
-------------------------------------------------------------
--/T There is no limit on the number of objects returned, but there are about 40 per sq arcmin.
--/T <p>returned table:  
--/T <li> apstar_id varchar(50) NOT NULL,      -- Combined star spectrum unique ID
--/T <li> star varchar(32) NOT NULL,           -- 2MASS-style star id
--/T <li> ra float NOT NULL,            -- Right Ascension
--/T <li> dec float NOT NULL,		-- declination
--/T <li> glon float NOT NULL,          -- Galactic longitude 
--/T <li> glat float NOT NULL,		-- Galactic latitude 
--/T <li> vhelio_avg real NOT NULL	-- S/N-weighted average of heliocentric radial velocity
--/T <li> vscatter real NOT NULL	-- stdev of scatter of visit RVs around average
--/T <li> htmID bigint NOT NULL		-- Hierarchical Trangular Mesh id of this star
--/T <br> Sample call to find APOGEE star within 5 arcminutes of xyz -.0996,-.1,0
--/T <br><samp>
--/T <br>select *
--/T <br> from  dbo.fGetNearbyApogeeStarEq(180.0,-0.1,0,5)  
--/T </samp>  
--/T <br>see also fGetNearestApogeeStarEq
-------------------------------------------------------------
  RETURNS @proxtab TABLE (
    apstar_id varchar(50) NOT NULL,
    apogee_id varchar(32) NOT NULL,
    ra float NOT NULL,
    dec float NOT NULL,
    glon float NOT NULL,
    glat float NOT NULL,
    vhelio_avg real NOT NULL,
    vscatter real NOT NULL,
    htmID bigint NOT NULL
  ) AS 
BEGIN
	DECLARE @htmTemp TABLE (
		HtmIdStart bigint,
		HtmIdEnd bigint
	);
	INSERT @htmTemp SELECT * FROM dbo.fHtmCoverCircleEq(@ra,@dec,@r)
	DECLARE @lim float;
	INSERT @proxtab	SELECT 
	    apstar_id, 
	    apogee_id,
	    ra,
	    dec,
	    glon,
	    glat,
	    vhelio_avg,
	    vscatter,
	    htmID
	    FROM @htmTemp H join ApogeeStar A
	             ON  (A.htmID BETWEEN H.HtmIDstart AND H.HtmIDend )
	    AND dbo.fDistanceArcMinEq(@ra,@dec,ra,dec) < @r
  RETURN
  END
GO
/****** Object:  UserDefinedFunction [dbo].[fGetNearbyFrameEq]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fGetNearbyFrameEq] (@ra float, @dec float, 
					@radius float, @zoom int)
-------------------------------------------------
--/H Returns table with a record describing the frames neareby (@ra,@dec) at a given @zoom level.
--/T <br> ra, dec are in degrees. Zoom is a value in Frame.Zoom (0, 10, 15, 20, 30).
--/T <br> this rountine is used by the SkyServer Web Server.
-------------------------------------------------------------
--/T <p> returned table is sorted nearest first:  
--/T <li> fieldID bigint,                 -- field identifier
--/T <li> a              float NOT NULL , -- abcdef,node, incl astrom transform parameters
--/T <li> b              float NOT NULL ,
--/T <li> c              float NOT NULL ,
--/T <li> d              float NOT NULL ,
--/T <li> e              float NOT NULL ,
--/T <li> f              float NOT NULL ,
--/T <li> node           float NOT NULL ,
--/T <li> incl           float NOT NULL ,
--/T <li> distance	 float NOT NULL   distance in arc minutes to this object from the ra,dec.
--/T <br>
--/T Sample call to find frame nearest to 185,0 and within one arcminute of it.
--/T <br><samp>
--/T <br>select *
--/T <br>from  dbo.fGetNearbyFrameEq(185,0,1)  
--/T  </samp>  
--/T  <br>see also fGetNearestFrameEq
-------------------------------------------------
  RETURNS @proxtab TABLE (
	fieldID 	bigint NOT NULL,
	a 		    float NOT NULL ,
	b 		    float NOT NULL ,
	c 		    float NOT NULL ,
	d 		    float NOT NULL ,
	e 		    float NOT NULL ,
	f 		    float NOT NULL ,
	node 		float NOT NULL ,
	incl 		float NOT NULL ,
    distance    float NOT NULL		-- distance in arc minutes 
  ) 
AS BEGIN
	--
	DECLARE @nx float,@ny float,@nz float 
	SET @nx  = COS(RADIANS(@dec))*COS(RADIANS(@ra))
	SET @ny  = COS(RADIANS(@dec))*SIN(RADIANS(@ra))
	SET @nz  = SIN(RADIANS(@dec))
	-------------------
	-- get htm ranges
	-------------------
	DECLARE @cover TABLE (
		htmidStart bigint, htmidEnd bigint
	)
	INSERT @cover
	SELECT htmidStart, htmidEnd
	FROM dbo.fHtmCoverCircleXyz(@nx,@ny,@nz,@radius);
	--
	
	DECLARE @lim float;
	SET @lim = POWER(2*SIN(RADIANS(@radius/120)),2);
	
	--
	INSERT @proxtab	
	SELECT  fieldID,a,b,c,d,e,f,node,incl, 
	(2*DEGREES(ASIN(sqrt(power(@nx-cx,2)+power(@ny-cy,2)+power(@nz-cz,2))/2))*60)
	FROM @cover H  join Frame F
	ON  (F.HtmID BETWEEN H.htmidStart AND H.htmidEnd )
	WHERE zoom = @zoom
	AND power(@nx-cx,2)+power(@ny-cy,2)+power(@nz-cz,2) < @lim
	ORDER BY power(@nx-cx,2)+power(@ny-cy,2)+power(@nz-cz,2)  ASC
  RETURN
  END
GO
/****** Object:  UserDefinedFunction [dbo].[fGetNearbyMangaObjEq]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fGetNearbyMangaObjEq] (@ra float, @dec float, @r float)
-------------------------------------------------------------
--/H Returns table of MaNGA objects within @r arcmins of an equatorial point (@ra,@dec).
-------------------------------------------------------------
--/T There is no limit on the number of objects returned, but there are about 40 per sq arcmin.
--/T <p>returned table:  
--/T <li> plateIFU varchar(20) NOT NULL,   -- MaNGA unique ID
--/T <li> mangaid varchar(20) NOT NULL,    -- MaNGA target id
--/T <li> objra float NOT NULL,            -- Right Ascension
--/T <li> objdec float NOT NULL,	   -- declination
--/T <li> ifura float NOT NULL,            -- Right Ascension
--/T <li> ifudec float NOT NULL,	   -- declination
--/T <li> drp3qual bigint NOT NULL,	   -- Quality bitmask
--/T <li> bluesn2 real NOT NULL, 	   -- Total blue SN2 across all nexp exposures
--/T <li> redsn2 real NOT NULL,	   -- Total red SN2 across all nexp exposures
--/T <li> mjdmax int NOT NULL,	   	   --/D Maximum MJD across all exposures
--/T <li> mngtarg1 bigint NOT NULL,	   --/D Manga-target1 maskbit for galaxy target catalog
--/T <li> mngtarg2 bigint NOT NULL,	   --/D Manga-target2 maskbit for galaxy target catalog
--/T <li> mngtarg3 bigint NOT NULL,	   --/D Manga-target3 maskbit for galaxy target catalog
--/T <li> htmID bigint NOT NULL		   -- Hierarchical Trangular Mesh id of this objetc
--/T <br> Sample call to find MaNGA object within 5 arcminutes of xyz -.0996,-.1,0
--/T <br><samp>
--/T <br>select *
--/T <br> from  dbo.fGetNearbyMangaObjEq(180.0,-0.1,0,5)  
--/T </samp>  
--/T <br>see also fGetNearestMangaObjEq
-------------------------------------------------------------
  RETURNS @proxtab TABLE (
    plateIFU varchar(20) NOT NULL,
    mangaid varchar(20) NOT NULL,
    objra float NOT NULL,
    objdec float NOT NULL,
    ifura float NOT NULL,
    ifudec float NOT NULL,
    drp3qual bigint NOT NULL,
    bluesn2 real NOT NULL,
    redsn2 real NOT NULL,
    mjdmax int NOT NULL,
    mngtarg1 bigint NOT NULL,
    mngtarg2 bigint NOT NULL,
    mngtarg3 bigint NOT NULL,
    htmID bigint NOT NULL
  ) AS 
BEGIN
	DECLARE @htmTemp TABLE (
		HtmIdStart bigint,
		HtmIdEnd bigint
	);
	INSERT @htmTemp SELECT * FROM dbo.fHtmCoverCircleEq(@ra,@dec,@r)
	DECLARE @lim float;
	INSERT @proxtab	SELECT 
	    plateIFU, 
	    mangaid,
	    objra,
	    objdec,
	    ifura,
	    ifudec,
	    drp3qual,
	    bluesn2,
	    redsn2,
	    mjdmax,
	    mngtarg1,
	    mngtarg2,
	    mngtarg3,
	    htmID
	    FROM @htmTemp H join mangaDrpAll M
	             ON  (M.htmID BETWEEN H.HtmIDstart AND H.HtmIDend )
	    AND dbo.fDistanceArcMinEq(@ra,@dec,ifura,ifudec) < @r
  RETURN
  END
GO
/****** Object:  UserDefinedFunction [dbo].[fGetNearbyObjAllEq]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fGetNearbyObjAllEq] (@ra float, @dec float, @r float)
-------------------------------------------------------------
--/H Given an equatorial point (@ra,@dec), this function returns a table of all 
--/H objects within @r arcmins of the point.  There is no limit on @r.
-------------------------------------------------------------
--/T <br> ra, dec are in degrees, r is in arc minutes.
--/T <br>There is no limit on the number of objects returned, but there are about 40 per sq arcmin.  
--/T <p> returned table:  
--/T <li> objID bigint NOT NULL,      -- Photo object identifier
--/T <li> run int NOT NULL,           -- run that observed this object   
--/T <li> camcol int NOT NULL,        -- camera column that observed the object
--/T <li> field int NOT NULL,         -- field that had the object
--/T <li> rerun int NOT NULL,         -- computer processing run that discovered the object
--/T <li> type int NOT NULL,          -- type of the object (3=Galaxy, 6= star, see PhotoType in DBconstants)
--/T <li> cx float NOT NULL,          -- x,y,z of unit vector to this object
--/T <li> cy float NOT NULL,
--/T <li> cz float NOT NULL,
--/T <li> htmID bigint,               -- Hierarchical Trangular Mesh id of this object
--/T <li> distance float              -- distance in arc minutes to this object from the ra,dec.
--/T <br>
--/T Sample call to find all the Galaxies within 3 arcminutes of ra,dec 185,0<br>
--/T <samp> 
--/T <br> select * 
--/T <br> from Galaxy                       as G, 
--/T <br>      dbo.fGetNearbyObjEq(185,0,3) as N
--/T <br> where G.objID = N.objID
--/T </samp> 
--/T <br> see also fGetNearestObjEq, fGetNearbyObjAllXYZ, fGetNearestObjXYZ
-------------------------------------------------------------
  RETURNS @proxtab TABLE (
    objID bigint NOT NULL,
    run int NOT NULL,
    camcol int NOT NULL,
    field int NOT NULL,
    rerun int NOT NULL,
    type int NOT NULL,
    mode tinyint NOT NULL,
    cx float NOT NULL,
    cy float NOT NULL,
    cz float NOT NULL,
    htmID bigint,
    distance float		-- distance in arc minutes
  ) 
  AS BEGIN
	DECLARE @d2r float, @nx float,@ny float,@nz float 
	set @d2r = PI()/180.0
	if (@r<0) RETURN
	set @nx  = COS(@dec*@d2r)*COS(@ra*@d2r)
	set @ny  = COS(@dec*@d2r)*SIN(@ra*@d2r)
	set @nz  = SIN(@dec*@d2r)
	INSERT @proxtab	
	SELECT * FROM dbo.fGetNearbyObjAllXYZ(@nx,@ny,@nz,@r) 
  RETURN
  END
GO
/****** Object:  UserDefinedFunction [dbo].[fGetNearbyObjAllXYZ]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fGetNearbyObjAllXYZ] (@nx float, @ny float, @nz float, @r float)
-------------------------------------------------------------
--/H Returns table of photo objects within @r arcmins of an xyz point (@nx,@ny, @nz).
-------------------------------------------------------------
--/T There is no limit on the number of objects returned, but there are about 40 per sq arcmin.
--/T <p>returned table:  
--/T <li> objID bigint,               -- Photo primary object identifier
--/T <li> run int NOT NULL,           -- run that observed this object   
--/T <li> camcol int NOT NULL,        -- camera column that observed the object
--/T <li> field int NOT NULL,         -- field that had the object
--/T <li> rerun int NOT NULL,         -- computer processing run that discovered the object
--/T <li> type int NOT NULL,          -- type of the object (3=Galaxy, 6= star, see PhotoType in DBconstants)
--/T <li> mode tinyint NOT NULL,      -- mode of photoObj
--/T <li> cx float NOT NULL,          -- x,y,z of unit vector to this object
--/T <li> cy float NOT NULL,
--/T <li> cz float NOT NULL,
--/T <li> htmID bigint,               -- Hierarchical Trangular Mesh id of this object
--/T <li> distance float              -- distance in arc minutes to this object from the ra,dec.
--/T <br> Sample call to find PhotoObjects within 5 arcminutes of xyz -.0996,-.1,0
--/T <br><samp>
--/T <br>select *
--/T <br> from  dbo.fGetNearbyObjXYZ(-.996,-.1,0,5)  
--/T </samp>  
--/T <br>see also fGetNearbyObjEq, fGetNearestObjXYZ, fGetNearestObjXYZ
-------------------------------------------------------------
  RETURNS @proxtab TABLE (
    objID bigint,
    run int NOT NULL,
    camcol int NOT NULL,
    field int NOT NULL,
    rerun int NOT NULL,
    type int NOT NULL,
    mode int NOT NULL,
    cx float NOT NULL,
    cy float NOT NULL,
    cz float NOT NULL,
    htmID bigint,
    distance float		-- distance in arc minutes
  ) AS 
BEGIN
	DECLARE @htmTemp TABLE (
		HtmIdStart bigint,
		HtmIdEnd bigint
	);

	INSERT @htmTemp SELECT * FROM dbo.fHtmCoverCircleXyz(@nx,@ny,@nz,@r)
	DECLARE @lim float;
	SET @lim = POWER(2*SIN(RADIANS(@r/120)),2);
	INSERT @proxtab	SELECT 
	    objID, 
	    run,
	    camcol,
	    field,
	    rerun,
	    type,
	    mode,
	    cx,
	    cy,
	    cz,
	    htmID,
 	    2*DEGREES(ASIN(sqrt(power(@nx-cx,2)+power(@ny-cy,2)+power(@nz-cz,2))/2))*60 
	    --sqrt(power(@nx-cx,2)+power(@ny-cy,2)+power(@nz-cz,2))/@d2r*60 
	    FROM @htmTemp H inner loop join PhotoObjAll P
	             ON  (P.HtmID BETWEEN H.HtmIDstart AND H.HtmIDend )
	    AND power(@nx-cx,2)+power(@ny-cy,2)+power(@nz-cz,2)< @lim
	    ORDER BY power(@nx-cx,2)+power(@ny-cy,2)+power(@nz-cz,2) ASC
  RETURN
  END
GO
/****** Object:  UserDefinedFunction [dbo].[fGetNearbyObjEq]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fGetNearbyObjEq] (@ra float, @dec float, @r float)
-------------------------------------------------------------
--/H Given an equatorial point (@ra,@dec), returns table of primary objects
--/H within @r arcmins of the point.  There is no limit on @r. 
-------------------------------------------------------------
--/T <br> ra, dec are in degrees, r is in arc minutes.
--/T <br>There is no limit on the number of objects returned, but there are about 40 per sq arcmin.  
--/T <p> returned table:  
--/T <li> objID bigint NOT NULL       -- Photo primary object identifier
--/T <li> run int NOT NULL,           -- run that observed this object   
--/T <li> camcol int NOT NULL,        -- camera column that observed the object
--/T <li> field int NOT NULL,         -- field that had the object
--/T <li> rerun int NOT NULL,         -- computer processing run that discovered the object
--/T <li> type int NOT NULL,          -- type of the object (3=Galaxy, 6= star, see PhotoType in DBconstants)
--/T <li> cx float NOT NULL,          -- x,y,z of unit vector to this object
--/T <li> cy float NOT NULL,
--/T <li> cz float NOT NULL,
--/T <li> htmID bigint,               -- Hierarchical Trangular Mesh id of this object
--/T <li> distance float              -- distance in arc minutes to this object from the ra,dec.
--/T <br>
--/T Sample call to find all the Galaxies within 3 arcminutes of ra,dec 185,0<br>
--/T <samp> 
--/T <br> select * 
--/T <br> from Galaxy                       as G, 
--/T <br>      dbo.fGetNearbyObjEq(185,0,3) as N
--/T <br> where G.objID = N.objID
--/T </samp> 
--/T <br> see also fGetNearestObjEq, fGetNearbyObjXYZ, fGetNearestObjXYZ
-------------------------------------------------------------
  RETURNS @proxtab TABLE (
    objID bigint NOT NULL,
    run int NOT NULL,
    camcol int NOT NULL,
    field int NOT NULL,
    rerun int NOT NULL,
    type int NOT NULL,
    cx float NOT NULL,
    cy float NOT NULL,
    cz float NOT NULL,
    htmID bigint,
    distance float		-- distance in arc minutes
  ) 
  AS BEGIN
	DECLARE @d2r float, @nx float,@ny float,@nz float 
	set @d2r = PI()/180.0
	if (@r<0) RETURN
	set @nx  = COS(@dec*@d2r)*COS(@ra*@d2r)
	set @ny  = COS(@dec*@d2r)*SIN(@ra*@d2r)
	set @nz  = SIN(@dec*@d2r)
	INSERT @proxtab	
	SELECT * FROM dbo.fGetNearbyObjXYZ(@nx,@ny,@nz,@r) 
  RETURN
  END
GO
/****** Object:  UserDefinedFunction [dbo].[fGetNearbyObjXYZ]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fGetNearbyObjXYZ](@nx float, @ny float, @nz float, @r float)
-------------------------------------------------------------
--/H Returns table of primary objects within @r arcmins of an xyz point (@nx,@ny, @nz).
-------------------------------------------------------------
--/T There is no limit on the number of objects returned, but there are about 40 per sq arcmin.
--/T <p>returned table:  
--/T <li> objID bigint,               -- Photo primary object identifier
--/T <li> run int NOT NULL,           -- run that observed this object   
--/T <li> camcol int NOT NULL,        -- camera column that observed the object
--/T <li> field int NOT NULL,         -- field that had the object
--/T <li> rerun int NOT NULL,         -- computer processing run that discovered the object
--/T <li> type int NOT NULL,          -- type of the object (3=Galaxy, 6= star, see PhotoType in DBconstants)
--/T <li> cx float NOT NULL,          -- x,y,z of unit vector to this object
--/T <li> cy float NOT NULL,
--/T <li> cz float NOT NULL,
--/T <li> htmID bigint,               -- Hierarchical Trangular Mesh id of this object
--/T <li> distance float              -- distance in arc minutes to this object from the ra,dec.
--/T <br> Sample call to find PhotoObjects within 5 arcminutes of xyz -.0996,-.1,0
--/T <br><samp>
--/T <br>select *
--/T <br> from  dbo.fGetNearbyObjXYZ(-.996,-.1,0,5)  
--/T </samp>  
--/T <br>see also fGetNearbyObjEq, fGetNearestObjXYZ, fGetNearestObjXYZ
-------------------------------------------------------------
  RETURNS @proxtab TABLE (
    objID bigint,
    run int NOT NULL,
    camcol int NOT NULL,
    field int NOT NULL,
    rerun int NOT NULL,
    type int NOT NULL,
    cx float NOT NULL,
    cy float NOT NULL,
    cz float NOT NULL,
    htmID bigint,
    distance float		-- distance in arc minutes
  ) AS 
BEGIN
	DECLARE @htmTemp TABLE (
		HtmIdStart bigint,
		HtmIdEnd bigint
	);

	INSERT @htmTemp SELECT * FROM dbo.fHtmCoverCircleXyz(@nx,@ny,@nz,@r)
	DECLARE @lim float;
	SET @lim = POWER(2*SIN(RADIANS(@r/120)),2);
	
	IF (@r<0) RETURN
	INSERT @proxtab	SELECT 
	    objID, 
	    run,
	    camcol,
	    field,
	    rerun,
	    type,
	    cx,
	    cy,
	    cz,
	    htmID,
 	    2*DEGREES(ASIN(sqrt(power(@nx-cx,2)+power(@ny-cy,2)+power(@nz-cz,2))/2))*60 
	    
	    FROM @htmTemp H  inner loop join PhotoPrimary P
	             ON  (P.HtmID BETWEEN H.HtmIDstart AND H.HtmIDend )
	   AND power(@nx-cx,2)+power(@ny-cy,2)+power(@nz-cz,2) < @lim
	ORDER BY power(@nx-cx,2)+power(@ny-cy,2)+power(@nz-cz,2)  ASC
	
  RETURN
  END
GO
/****** Object:  UserDefinedFunction [dbo].[fGetNearbySpecObjAllEq]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fGetNearbySpecObjAllEq] (@ra float, @dec float, @r float)
-------------------------------------------------------------
--/H Returns table of spectrum objects within @r arcmins of an equatorial point (@ra, @dec).
-------------------------------------------------------------
--/T There is no limit on the number of objects returned.
--/T <p>returned table:  
--/T <li>  specObjID numeric(20),		-- unique spectrum ID
--/T <li>  plate int NOT NULL,		-- spectroscopic plate number
--/T <li>  mjd int NOT NULL,		-- MJD of observation
--/T <li>  fiberID int NOT NULL,	-- fiber number on plate
--/T <li>  z real NOT NULL,		-- final spectroscopic redshift
--/T <li>  zErr real NOT NULL,		-- redshift error
--/T <li>  zWarning int NOT NULL,	-- warning flags
--/T <li>  sciencePrimary int NOT NULL,	-- deemed to be science-worthy or not
--/T <li>  cx float NOT NULL,		-- x of normal unit vector in J2000
--/T <li>  cy float NOT NULL,		-- y of normal unit vector in J2000
--/T <li>  cz float NOT NULL,		-- z of normal unit vector in J2000
--/T <li>  htmID bigint,		-- 20-deep HTM ID
--/T <li>  distance float		-- distance in arc minutes
--/T <br> Sample call to find SpecObj within 0.5 arcminutes of ra,dec 180.0, -0.5
--/T <br><samp>
--/T <br>select *
--/T <br> from  dbo.fGetNearbySpecObjEq(180.0, -0.5, 0,5)  
--/T </samp>  
--/T <br>see also fGetNearbySpecObjEq, fGetNearestSpecObjXYZ, fGetNearestSpecObjXYZ
-------------------------------------------------------------
  RETURNS @proxtab TABLE (
    specObjID numeric(20),
    plate int NOT NULL,
    mjd int NOT NULL,
    fiberID int NOT NULL,
    z real NOT NULL,
    zErr real NOT NULL,
    zWarning int NOT NULL,
    sciencePrimary int NOT NULL,
    cx float NOT NULL,
    cy float NOT NULL,
    cz float NOT NULL,
    htmID bigint,
    distance float		-- distance in arc minutes
  ) AS BEGIN
	DECLARE @d2r float, @nx float,@ny float,@nz float 
	set @d2r = PI()/180.0
	if (@r<0) RETURN
	set @nx  = COS(@dec*@d2r)*COS(@ra*@d2r)
	set @ny  = COS(@dec*@d2r)*SIN(@ra*@d2r)
	set @nz  = SIN(@dec*@d2r)
	INSERT @proxtab	
	SELECT * FROM dbo.fGetNearbySpecObjAllXYZ(@nx,@ny,@nz,@r) 
  RETURN
  END
GO
/****** Object:  UserDefinedFunction [dbo].[fGetNearbySpecObjAllXYZ]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fGetNearbySpecObjAllXYZ] (@nx float, @ny float, @nz float, @r float)
-------------------------------------------------------------
--/H Returns table of all spectrum objects within @r arcmins of an xyz point (@nx,@ny, @nz).
-------------------------------------------------------------
--/T There is no limit on the number of objects returned.
--/T <p>returned table:  
--/T <li> objID bigint,               -- Photo primary object identifier
--/T <li> run int NOT NULL,           -- run that observed this object   
--/T <li> camcol int NOT NULL,        -- camera column that observed the object
--/T <li> field int NOT NULL,         -- field that had the object
--/T <li> rerun int NOT NULL,         -- computer processing run that discovered the object
--/T <li> type int NOT NULL,          -- type of the object (3=Galaxy, 6= star, see PhotoType in DBconstants)
--/T <li> mode tinyint NOT NULL,      -- mode of photoObj
--/T <li> cx float NOT NULL,          -- x,y,z of unit vector to this object
--/T <li> cy float NOT NULL,
--/T <li> cz float NOT NULL,
--/T <li> htmID bigint,               -- Hierarchical Trangular Mesh id of this object
--/T <li> distance float              -- distance in arc minutes to this object from the ra,dec.
--/T <br> Sample call to find SpecObj within 0.5 arcminutes of xyz -.0996,-.1,0
--/T <br><samp>
--/T <br>select *
--/T <br> from  dbo.fGetNearbySpecObjAllXYZ(-.996,-.1,0,0.5)  
--/T </samp>  
--/T <br>see also fGetNearbySpecObjEq, fGetNearestSpecObjXYZ, fGetNearestSpecObjXYZ
-------------------------------------------------------------
  RETURNS @proxtab TABLE (
    specObjID numeric(20),
    plate int NOT NULL,
    mjd int NOT NULL,
    fiberID int NOT NULL,
    z real NOT NULL,
    zErr real NOT NULL,
    zWarning int NOT NULL,
    sciencePrimary int NOT NULL,
    cx float NOT NULL,
    cy float NOT NULL,
    cz float NOT NULL,
    htmID bigint,
    distance float		-- distance in arc minutes
  ) AS 
BEGIN
	DECLARE @htmTemp TABLE (
		HtmIdStart bigint,
		HtmIdEnd bigint
	);

	INSERT @htmTemp SELECT * FROM dbo.fHtmCoverCircleXyz(@nx,@ny,@nz,@r)
	DECLARE @lim float;
	SET @lim = POWER(2*SIN(RADIANS(@r/120)),2);
	INSERT @proxtab	SELECT 
	    specObjID, 
	    plate,
	    mjd,
	    fiberID,
	    z,
	    zErr,
	    zWarning,
	    sciencePrimary,
	    cx,
	    cy,
	    cz,
	    htmID,
 	    2*DEGREES(ASIN(sqrt(power(@nx-cx,2)+power(@ny-cy,2)+power(@nz-cz,2))/2))*60 
	    --sqrt(power(@nx-cx,2)+power(@ny-cy,2)+power(@nz-cz,2))/@d2r*60 
	    FROM @htmTemp H  join SpecObjAll S
	             ON  (S.HtmID BETWEEN H.HtmIDstart AND H.HtmIDend )
	    AND power(@nx-cx,2)+power(@ny-cy,2)+power(@nz-cz,2)< @lim
	ORDER BY power(@nx-cx,2)+power(@ny-cy,2)+power(@nz-cz,2) ASC
  RETURN
  END
GO
/****** Object:  UserDefinedFunction [dbo].[fGetNearbySpecObjEq]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fGetNearbySpecObjEq] (@ra float, @dec float, @r float)
-------------------------------------------------------------
--/H Returns table of spectrum objects within @r arcmins of an equatorial point (@ra, @dec).
-------------------------------------------------------------
--/T There is no limit on the number of objects returned.
--/T <p>returned table:  
--/T <li>  specObjID numeric(20),		-- unique spectrum ID
--/T <li>  plate int NOT NULL,		-- spectroscopic plate number
--/T <li>  mjd int NOT NULL,		-- MJD of observation
--/T <li>  fiberID int NOT NULL,	-- fiber number on plate
--/T <li>  z real NOT NULL,		-- final spectroscopic redshift
--/T <li>  zErr real NOT NULL,		-- redshift error
--/T <li>  zWarning int NOT NULL,	-- warning flags
--/T <li>  cx float NOT NULL,		-- x of normal unit vector in J2000
--/T <li>  cy float NOT NULL,		-- y of normal unit vector in J2000
--/T <li>  cz float NOT NULL,		-- z of normal unit vector in J2000
--/T <li>  htmID bigint,		-- 20-deep HTM ID
--/T <li>  distance float		-- distance in arc minutes
--/T <br> Sample call to find SpecObj within 0.5 arcminutes of ra,dec 180.0, -0.5
--/T <br><samp>
--/T <br>select *
--/T <br> from  dbo.fGetNearbySpecObjXYZ(180.0, -0.5, 0,5)  
--/T </samp>  
--/T <br>see also fGetNearbySpecObjEq, fGetNearestSpecObjXYZ, fGetNearestSpecObjXYZ
-------------------------------------------------------------
  RETURNS @proxtab TABLE (
    specObjID numeric(20),
    plate int NOT NULL,
    mjd int NOT NULL,
    fiberID int NOT NULL,
    z real NOT NULL,
    zErr real NOT NULL,
    zWarning int NOT NULL,
    cx float NOT NULL,
    cy float NOT NULL,
    cz float NOT NULL,
    htmID bigint,
    distance float		-- distance in arc minutes
  ) AS BEGIN
	DECLARE @d2r float, @nx float,@ny float,@nz float 
	set @d2r = PI()/180.0
	if (@r<0) RETURN
	set @nx  = COS(@dec*@d2r)*COS(@ra*@d2r)
	set @ny  = COS(@dec*@d2r)*SIN(@ra*@d2r)
	set @nz  = SIN(@dec*@d2r)
	INSERT @proxtab	
	SELECT * FROM dbo.fGetNearbySpecObjXYZ(@nx,@ny,@nz,@r) 
  RETURN
  END
GO
/****** Object:  UserDefinedFunction [dbo].[fGetNearbySpecObjXYZ]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fGetNearbySpecObjXYZ] (@nx float, @ny float, @nz float, @r float)
-------------------------------------------------------------
--/H Returns table of scienceprimary spectrum objects within @r arcmins of an xyz point (@nx,@ny, @nz).
-------------------------------------------------------------
--/T There is no limit on the number of objects returned, but there are about 40 per sq arcmin.
--/T <p>returned table:  
--/T <li> specObjID numeric(20),               -- Photo primary object identifier
--/T <li> run int NOT NULL,           -- run that observed this object   
--/T <li> camcol int NOT NULL,        -- camera column that observed the object
--/T <li> field int NOT NULL,         -- field that had the object
--/T <li> rerun int NOT NULL,         -- computer processing run that discovered the object
--/T <li> type int NOT NULL,          -- type of the object (3=Galaxy, 6= star, see PhotoType in DBconstants)
--/T <li> mode tinyint NOT NULL,      -- mode of photoObj
--/T <li> cx float NOT NULL,          -- x,y,z of unit vector to this object
--/T <li> cy float NOT NULL,
--/T <li> cz float NOT NULL,
--/T <li> htmID bigint,               -- Hierarchical Trangular Mesh id of this object
--/T <li> distance float              -- distance in arc minutes to this object from the ra,dec.
--/T <br> Sample call to find SpecObj within 5 arcminutes of xyz -.0996,-.1,0
--/T <br><samp>
--/T <br>select *
--/T <br> from  dbo.fGetNearbySpecObjXYZ(-.996,-.1,0,5)  
--/T </samp>  
--/T <br>see also fGetNearbySpecObjEq, fGetNearestSpecObjXYZ, fGetNearbySpecObjAllXYZ
-------------------------------------------------------------
  RETURNS @proxtab TABLE (
    specObjID numeric(20),
    plate int NOT NULL,
    mjd int NOT NULL,
    fiberID int NOT NULL,
    z real NOT NULL,
    zErr real NOT NULL,
    zWarning int NOT NULL,
    cx float NOT NULL,
    cy float NOT NULL,
    cz float NOT NULL,
    htmID bigint,
    distance float		-- distance in arc minutes
  ) AS 
BEGIN
	DECLARE @htmTemp TABLE (
		HtmIdStart bigint,
		HtmIdEnd bigint
	);
	INSERT @htmTemp SELECT * FROM dbo.fHtmCoverCircleXyz(@nx,@ny,@nz,@r)
	DECLARE @lim float;
	SET @lim = POWER(2*SIN(RADIANS(@r/120)),2);
	INSERT @proxtab	SELECT 
	    specObjID, 
	    plate,
	    mjd,
	    fiberID,
	    z,
	    zErr,
	    zWarning,
	    cx,
	    cy,
	    cz,
	    htmID,
 	    2*DEGREES(ASIN(sqrt(power(@nx-cx,2)+power(@ny-cy,2)+power(@nz-cz,2))/2))*60 
	    --sqrt(power(@nx-cx,2)+power(@ny-cy,2)+power(@nz-cz,2))/@d2r*60 
	    FROM @htmTemp H join SpecObj S
	             ON  (S.HtmID BETWEEN H.HtmIDstart AND H.HtmIDend )
	    AND power(@nx-cx,2)+power(@ny-cy,2)+power(@nz-cz,2)< @lim
	    ORDER BY power(@nx-cx,2)+power(@ny-cy,2)+power(@nz-cz,2) ASC
  RETURN
  END
GO
/****** Object:  UserDefinedFunction [dbo].[fGetNearbyTiledTargetsEq]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE  FUNCTION [dbo].[fGetNearbyTiledTargetsEq](@ra float, @dec float, @r float)
-------------------------------------------------------------
--/H Returns table of tiled targets within @r arcmins of an Equatorial point (@ra,@dec)
--/A -----------------------------------------------------------
--/T <br> ra, dec are in degrees, r is in arc minutes. 
--/T <p> returned table:  
--/T <li> tile smallint,               -- tile number
--/T <li> targetid bigint,             -- id of target
--/T <li> ra float,                    -- ra (degrees)
--/T <li> dec float,                   -- dec (degrees)
--/T <li> sourceType int               -- type of object fiber
--/T <br>
-------------------------------------------------
RETURNS @obj table (tile smallint, targetID bigint, ra float, [dec] float, sourceType int)
AS BEGIN
          DECLARE @nx float,
                @ny float,
                @nz float,
                @cmd varchar(1000),
                @level int,
                @rad float,
                @shift bigint

        if (@r > 250) set @r = 250      -- limit to 4.15 degrees == 250 arcminute radius
        set @nx  = COS(RADIANS(@dec))*COS(RADIANS(@ra));
        set @ny  = COS(RADIANS(@dec))*SIN(RADIANS(@ra));
        set @nz  = SIN(RADIANS(@dec));
        set @level = CONVERT(int,(13- FLOOR(LOG(@r)/LOG(2.0))));
        if (@level<5)  set @level=5;
        if (@level>13) set @level=13;
        set @shift = CONVERT(int,POWER(4.,20-@level)); -- 4 = 2^2 and 2 bits per htm level
        set @cmd = 'CIRCLE CARTESIAN '+str(@level)+' '+str(@ra,22,15)+' '+str(@dec,22,15)+' '+str(@r,10,3);
        
        DECLARE @lim float;
		SET @lim = POWER(2*SIN(RADIANS(@r/120)),2);

        INSERT @obj
        SELECT tile, targetID, ra, [dec], sourceType
        	FROM dbo.fHTMCoverRegion(@cmd) , TiledTarget WITH (nolock)
	        WHERE (HTMID BETWEEN  HTMIDstart*@shift AND HTMIDend*@shift)
        	AND power(@nx-cx,2)+power(@ny-cy,2)+power(@nz-cz,2) < @lim
        --
        RETURN
END
GO
/****** Object:  UserDefinedFunction [dbo].[fGetNearestApogeeStarEq]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fGetNearestApogeeStarEq] (@ra float, @dec float, @r float)
-------------------------------------------------------------
--/H Returns nearest APOGEE star spectrum within @r arcmins of an equatorial point (@ra,@dec).
-------------------------------------------------------------
--/T There is no limit on the number of objects returned, but there are about 40 per sq arcmin.
--/T <p>returned table:  
--/T <li> apstar_id varchar(50) NOT NULL,      -- Combined star spectrum unique ID
--/T <li> star varchar(32) NOT NULL,           -- 2MASS-style star id
--/T <li> ra float NOT NULL,            -- Right Ascension
--/T <li> dec float NOT NULL,		-- declination
--/T <li> glon float NOT NULL,          -- Galactic longitude 
--/T <li> glat float NOT NULL,		-- Galactic latitude 
--/T <li> vhelio_avg real NOT NULL	-- S/N-weighted average of heliocentric radial velocity
--/T <li> vscatter real NOT NULL	-- stdev of scatter of visit RVs around average
--/T <li> htmID bigint NOT NULL		-- Hierarchical Trangular Mesh id of this star
--/T <br> Sample call to find APOGEE star within 5 arcminutes of xyz -.0996,-.1,0
--/T <br><samp>
--/T <br>select *
--/T <br> from  dbo.fGetNearestApogeeStarEq(180.0,-0.1,0,5)  
--/T </samp>  
--/T <br>see also fGetNearbyApogeeStarEq
-------------------------------------------------------------
  RETURNS @proxtab TABLE (
    apstar_id varchar(50) NOT NULL,
    apogee_id varchar(32) NOT NULL,
    ra float NOT NULL,
    dec float NOT NULL,
    glon float NOT NULL,
    glat float NOT NULL,
    vhelio_avg real NOT NULL,
    vscatter real NOT NULL,
    htmID bigint NOT NULL
  ) AS 
BEGIN
	INSERT @proxtab	
	    SELECT TOP 1 *
	    FROM dbo.fGetNearbyApogeeStarEq(@ra, @dec, @r)
	    ORDER BY dbo.fDistanceArcMinEq(@ra,@dec,ra,dec) ASC
  RETURN
  END
GO
/****** Object:  UserDefinedFunction [dbo].[fGetNearestFrameEq]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fGetNearestFrameEq] (@ra float, @dec float, @zoom int)
-------------------------------------------------
--/H Returns table with a record describing the nearest frame to (@ra,@dec) at a given @zoom level.
--/T <br> ra, dec are in degrees. Zoom is a value in Frame.Zoom (0, 10, 15, 20, 30).
--/T <br> this rountine is used by the SkyServer Web Server.
-------------------------------------------------------------
--/T <p> returned table:  
--/T <li> fieldID bigint,                 -- field identifier
--/T <li> a              float NOT NULL , -- abcdef,node, incl astrom transform parameters
--/T <li> b              float NOT NULL ,
--/T <li> c              float NOT NULL ,
--/T <li> d              float NOT NULL ,
--/T <li> e              float NOT NULL ,
--/T <li> f              float NOT NULL ,
--/T <li> node           float NOT NULL ,
--/T <li> incl           float NOT NULL ,
--/T <li> distance	 float NOT NULL   distance in arc minutes to this object from the ra,dec.
--/T <br>
--/T Sample call to find frame nearest to 185,0 and within one arcminute of it.
--/T <br><samp>
--/T <br>select *
--/T <br>from  dbo.fGetNearestFrameEq(185,0,10)  
--/T  </samp>  
-------------------------------------------------
  RETURNS @proxtab TABLE (
	fieldID 	bigint NOT NULL,
	a 		float NOT NULL ,
	b 		float NOT NULL ,
	c 		float NOT NULL ,
	d 		float NOT NULL ,
	e 		float NOT NULL ,
	f 		float NOT NULL ,
	node 		float NOT NULL ,
	incl 		float NOT NULL ,
        distance        float NOT NULL		-- distance in arc minutes 
  ) AS BEGIN
	INSERT @proxtab	
	    SELECT TOP 1 fieldID, a, b, c, d, e, f, node, incl, distance  -- look up to 81
	    FROM fGetNearbyFrameEq (@ra , @dec, 81, @zoom )	-- arcmin away from center.
            ORDER BY distance ASC   
  RETURN
  END
GO
/****** Object:  UserDefinedFunction [dbo].[fGetNearestFrameidEq]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fGetNearestFrameidEq] (@ra float, @dec float, @zoom int)
-------------------------------------------------
--/H Returns teh fieldid of the nearest frame to (@ra,@dec) at a given @zoom level.
--/T <br> ra, dec are in degrees. Zoom is a value in Frame.Zoom (0, 05, 10, 15, 20, 25, 30).
-------------------------------------------------------------
--/T <p> returns the fieldid of the nearest frame
--/T <br>
--/T Sample call to find frameid nearest to 185,0 and within one arcminute of it.
--/T <br><samp>
--/T <br>select *
--/T <br>from  dbo.fGetNearestFrameidEq(185,0,10)  
--/T  </samp>  
-------------------------------------------------
RETURNS bigint
AS BEGIN
  RETURN (select fieldID from dbo.fGetNearestFrameEq(@ra, @dec, @zoom) );
END
GO
/****** Object:  UserDefinedFunction [dbo].[fGetNearestMangaObjEq]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fGetNearestMangaObjEq] (@ra float, @dec float, @r float)
-------------------------------------------------------------
--/H Returns nearest MaNGA object within @r arcmins of an equatorial point (@ra,@dec).
-------------------------------------------------------------
--/T There is no limit on the number of objects returned, but there are about 40 per sq arcmin.
--/T <p>returned table:  
--/T <li> plateIFU varchar(20) NOT NULL,      -- MaNGA unique ID
--/T <li> mangaid varchar(20) NOT NULL,       -- MaNGA target id
--/T <li> objra float NOT NULL,     -- Right Ascension
--/T <li> objdec float NOT NULL,    -- declination
--/T <li> ifura float NOT NULL,     -- Right Ascension
--/T <li> ifudec float NOT NULL,    -- declination
--/T <li> drp3qual bigint NOT NULL, -- Quality bitmask
--/T <li> bluesn2 real NOT NULL,   -- Total blue SN2 across all nexp exposures
--/T <li> redsn2 real NOT NULL,    -- Total red SN2 across all nexp exposures
--/T <li> mjdmax int NOT NULL,   --/D Maximum MJD across all exposures
--/T <li> mngtarg1 bigint NOT NULL, --/D Manga-target1 maskbit for galaxy target catalog
--/T <li> mngtarg2 bigint NOT NULL, --/D Manga-target2 maskbit for galaxy target catalog
--/T <li> mngtarg3 bigint NOT NULL, --/D Manga-target3 maskbit for galaxy target catalog
--/T <li> htmID bigint NOT NULL	    -- Hierarchical Trangular Mesh id of this object
--/T <br> Sample call to find MaNGA object within 5 arcminutes of xyz -.0996,-.1,0
--/T <br><samp>
--/T <br>select *
--/T <br> from  dbo.fGetNearestMangaObjEq(180.0,-0.1,0,5)  
--/T </samp>  
--/T <br>see also fGetNearbyMangaObjEq
-------------------------------------------------------------
  RETURNS @proxtab TABLE (
    plateIFU varchar(20) NOT NULL,
    mangaid varchar(20) NOT NULL,
    objra float NOT NULL,
    objdec float NOT NULL,
    ifura float NOT NULL,
    ifudec float NOT NULL,
    drp3qual bigint NOT NULL,
    bluesn2 real NOT NULL,
    redsn2 real NOT NULL,
    mjdmax int NOT NULL,
    mngtarg1 bigint NOT NULL,
    mngtarg2 bigint NOT NULL,
    mngtarg3 bigint NOT NULL,
    htmID bigint NOT NULL
  ) AS 
BEGIN
	INSERT @proxtab	
	    SELECT TOP 1 *
	    FROM dbo.fGetNearbyMangaObjEq(@ra, @dec, @r) n
	    ORDER BY dbo.fDistanceArcMinEq(@ra, @dec, ifura, ifudec) ASC, n.bluesn2 DESC
  RETURN
  END
GO
/****** Object:  UserDefinedFunction [dbo].[fGetNearestObjAllEq]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fGetNearestObjAllEq] (@ra float, @dec float, @r float)
-------------------------------------------------------------
--/H Returns table holding a record describing the closest object within @r arcminutes of (@ra,@dec).
--/T <br> ra, dec are in degrees, r is in arc minutes.
-------------------------------------------------------------
--/T <p> returned table: 
--/T <li> objID bigint,               -- Photo primary object identifier
--/T <li> run int NOT NULL,           -- run that observed this object   
--/T <li> camcol int NOT NULL,        -- camera column that observed the object
--/T <li> field int NOT NULL,         -- field that had the object
--/T <li> rerun int NOT NULL,         -- computer processing run that discovered the object
--/T <li> type int NOT NULL,          -- type of the object (3=Galaxy, 6= star, see PhotoType in DBconstants)
--/T <li> cx float NOT NULL,          -- x,y,z of unit vector to this object
--/T <li> cy float NOT NULL,
--/T <li> cz float NOT NULL,
--/T <li> htmID bigint,               -- Hierarchical Trangular Mesh id of this object
--/T <li> distance float              -- distance in arc minutes to this object from the ra,dec.
--/T <br
--/T Sample call to find the PhotoObject within 1 arcminutes of ra,dec 185,0
--/T <br><samp>
--/T <br> select * 
--/T <br> from   dbo.fGetNearestObjAllEq(185,0,1)   
--/T </samp>  
--/T <br> see also fGetNearbyObjAllEq, fGetNearbyObjAllXYZ
-------------------------------------------------------------
  RETURNS @proxtab TABLE (
    objID bigint,
    run int NOT NULL,
    camcol int NOT NULL,
    field int NOT NULL,
    rerun int NOT NULL,
    type int NOT NULL,
    mode int NOT NULL,
    cx float NOT NULL,
    cy float NOT NULL,
    cz float NOT NULL,
    htmID bigint,
    distance float		-- distance in arc minutes
  ) AS BEGIN
	DECLARE @d2r float,@nx float,@ny float,@nz float 
	set @d2r = PI()/180.0
	set @nx  = COS(@dec*@d2r)*COS(@ra*@d2r)
	set @ny  = COS(@dec*@d2r)*SIN(@ra*@d2r)
	set @nz  = SIN(@dec*@d2r)
	INSERT @proxtab	
	SELECT top 1 * 
	FROM dbo.fGetNearbyObjAllXYZ(@nx,@ny,@nz,@r)
	ORDER BY distance ASC   -- order by needed to get the closest one.
  RETURN
END
GO
/****** Object:  UserDefinedFunction [dbo].[fGetNearestObjEq]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fGetNearestObjEq] (@ra float, @dec float, @r float)
-------------------------------------------------------------
--/H Returns table holding a record describing the closest primary object within @r arcminutes of (@ra,@dec).
--/T <br> ra, dec are in degrees, r is in arc minutes.
-------------------------------------------------------------
--/T <p> returned table: 
--/T <li> objID bigint,               -- Photo primary object identifier
--/T <li> run int NOT NULL,           -- run that observed this object   
--/T <li> camcol int NOT NULL,        -- camera column that observed the object
--/T <li> field int NOT NULL,         -- field that had the object
--/T <li> rerun int NOT NULL,         -- computer processing run that discovered the object
--/T <li> type int NOT NULL,          -- type of the object (3=Galaxy, 6= star, see PhotoType in DBconstants)
--/T <li> cx float NOT NULL,          -- x,y,z of unit vector to this object
--/T <li> cy float NOT NULL,
--/T <li> cz float NOT NULL,
--/T <li> htmID bigint,               -- Hierarchical Trangular Mesh id of this object
--/T <li> distance float              -- distance in arc minutes to this object from the ra,dec.
--/T <br
--/T Sample call to find the PhotoObject within 1 arcminutes of ra,dec 185,0
--/T <br><samp>
--/T <br> select * 
--/T <br> from   dbo.fGetNearestObjEq(185,0,1)   
--/T </samp>  
--/T <br> see also fGetNearbyObjEq, fGetNearbyObjXYZ, fGetNearestObjXYZ
-------------------------------------------------------------
  RETURNS @proxtab TABLE (
    objID bigint,
    run int NOT NULL,
    camcol int NOT NULL,
    field int NOT NULL,
    rerun int NOT NULL,
    type int NOT NULL,
    cx float NOT NULL,
    cy float NOT NULL,
    cz float NOT NULL,
    htmID bigint,
    distance float		-- distance in arc minutes
  ) AS BEGIN
	DECLARE @d2r float,@nx float,@ny float,@nz float 
	set @d2r = PI()/180.0
	set @nx  = COS(@dec*@d2r)*COS(@ra*@d2r)
	set @ny  = COS(@dec*@d2r)*SIN(@ra*@d2r)
	set @nz  = SIN(@dec*@d2r)
	INSERT @proxtab	
	SELECT top 1 * 
	FROM dbo.fGetNearbyObjXYZ(@nx,@ny,@nz,@r)
	ORDER BY distance ASC   -- order by needed to get the closest one.
  RETURN
  END
GO
/****** Object:  UserDefinedFunction [dbo].[fGetNearestObjIdAllEq]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fGetNearestObjIdAllEq](@ra float, @dec float, @r float)
-------------------------------------------------
--/H Returns the objId of nearest photo object within @r arcmins of ra, dec
--/T <br> ra, dec are in degrees, r is in arc minutes.
-------------------------------------------------
--/T <br>This scalar function is used for matchups of external catalogs.
--/T <br>It calls  <samp>fGetNearestObjAllEq(@ra,@dec,@r)</samp>, and selects 
--/T the objId (a bigint). 
--/T <br>This can be called by a single SELECT from an uploaded (ra,dec) table.
--/T <br>An example: 
--/T <br><samp>
--/T <br>  SELECT id, ra,dec, dbo.fGetNearestObjIdAllEq(ra,dec,3.0) as objId
--/T <br>      FROM #upload
--/T <br>      WHERE dbo.fGetNearestObjIdAllEq(ra,dec,3.0) IS NOT NULL
--/T</samp><p>
-------------------------------------------------
RETURNS bigint
AS BEGIN
    RETURN (select objID from dbo.fGetNearestObjAllEq(@ra,@dec,@r)) 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fGetNearestObjIdEq]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fGetNearestObjIdEq](@ra float, @dec float, @r float)
-------------------------------------------------
--/H Returns the objId of nearest photoPrimary within @r arcmins of ra, dec
--/T <br> ra, dec are in degrees, r is in arc minutes.
-------------------------------------------------
--/T <br>This scalar function is used for matchups of external catalogs.
--/T <br>It calls  <samp>fGetNearestObjEq(@ra,@dec,@r)</samp>, and selects 
--/T the objId (a bigint). 
--/T <br>This can be called by a single SELECT from an uploaded (ra,dec) table.
--/T <br>An example: 
--/T <br><samp>
--/T <br>  SELECT id, ra,dec, dbo.fGetNearestObjIdEq(ra,dec,3.0) as objId
--/T <br>      FROM #upload
--/T <br>      WHERE dbo.fGetNearestObjIdEq(ra,dec,3.0) IS NOT NULL
--/T</samp><p>
-------------------------------------------------
RETURNS bigint
AS BEGIN
    RETURN (select objID from dbo.fGetNearestObjEq(@ra,@dec,@r)) 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fGetNearestObjIdEqMode]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fGetNearestObjIdEqMode](@ra float, @dec float, 
					@r float, @mode int)
-------------------------------------------------
--/H Returns the objId of nearest @mode PhotoObjAll within @r arcmins of ra, dec
--/T <br> ra, dec are in degrees, r is in arc minutes.
-------------------------------------------------
--/T <br>This scalar function is used for matchups of external catalogs.
--/T <br>It calls  <samp>fGetNearestObjEq(@ra,@dec,@r)</samp>, and selects 
--/T the objId (a bigint). 
--/T <br>This can be called by a single SELECT from an uploaded (ra,dec) table.
--/T <br>An example: 
--/T <br><samp>
--/T <br>  SELECT id, ra,dec, dbo.fGetNearestObjIdEq(ra,dec,3.0) as objId
--/T <br>      FROM #upload
--/T <br>      WHERE dbo.fGetNearestObjIdEq(ra,dec,3.0) IS NOT NULL
--/T</samp><p>
-------------------------------------------------
RETURNS bigint
AS BEGIN
    DECLARE @nx float, @ny float, @nz float;
    SET @nx = cos(radians(@dec))*cos(radians(@ra));
    SET @ny = cos(radians(@dec))*sin(radians(@ra));
    SET @nz = sin(radians(@dec));
    RETURN (
	select top 1 objID 
	from dbo.fGetNearbyObjAllXYZ(@nx,@ny,@nz,@r)
	where mode = @mode
	order by distance asc) 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fGetNearestObjIdEqType]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fGetNearestObjIdEqType] (@ra float, @dec float, @r float, @t int)
-------------------------------------------------------------
--/H Returns the objID of the nearest photPrimary of type @t within @r arcmin
--/T <br> ra, dec are in degrees, r is in arc minutes.
--/T <br> t is an integer drawn from the PhotoType table. 
--/T <br> popular types are 3: GALAXY, 6: STAR
--/T <br> others: 0: UNKNOWN, 1:COSMIC_RAY  2: DEFECT, 4: GHOST, 5: KNOWNOBJ, 7:TRAIL, 8: SKY 
-------------------------------------------------------------
--/T This scalar function is used for matchups of external catalogs.
--/T It calls the <samp>fGetNearbyObjEq(@ra,@dec,@r)</samp>, and selects
--/T the objId (a bigint). This can be called by a single SELECT from an uploaded
--/T (ra,dec) table.
--/T <br>An example: 
--/T <br><samp>
--/T <br>  SELECT id, ra,dec, dbo.fGetNearestObjIdEqType(ra,dec,3.0,6) as objId
--/T <br>      FROM #upload
--/T <br>      WHERE dbo.fGetNearestObjIdEqType(ra,dec,3.0,6) IS NOT NULL
--/T</samp><p>
-------------------------------------------------------------
RETURNS bigint
AS BEGIN
    RETURN (	select top 1 objID 
		from dbo.fGetNearbyObjEq(@ra,@dec,@r)
		where type=@t 
		order by distance asc ) 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fGetNearestObjXYZ]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fGetNearestObjXYZ] (@nx float, @ny float, @nz float, @r float)
-------------------------------------------------------------
--/H Returns nearest primary object within @r arcminutes of an xyz point (@nx,@ny, @nz).
-------------------------------------------------------------
--/T <p> returned table:  
--/T <li> objID bigint,               -- Photo primary object identifier
--/T <li> run int NOT NULL,           -- run that observed this object   
--/T <li> camcol int NOT NULL,        -- camera column that observed the object
--/T <li> field int NOT NULL,         -- field that had the object
--/T <li> rerun int NOT NULL,         -- computer processing run that discovered the object
--/T <li> type int NOT NULL,          -- type of the object (3=Galaxy, 6= star, see PhotoType in DBconstants)
--/T <li> cx float NOT NULL,          -- x,y,z of unit vector to this object
--/T <li> cy float NOT NULL,
--/T <li> cz float NOT NULL,
--/T <li> htmID bigint,               -- Hierarchical Trangular Mesh id of this object
--/T <li> distance float              -- distance in arc minutes to this object from the ra,dec.
--/T <br>
--/T Sample call to find the nearest PhotoObject within 1/2 arcminute  of xyz -.0996,-.1,0 
--/T <br><samp>
--/T  <br> select *
--/T  <br> from  dbo.fGetNearestObjXYZ(-.996,-.1,0,0.5)  
--/T  </samp>  
--/T  <br>see also fGetNearbyObjEq, fGetNearestObjEq, fGetNearbyObjXYZ, 
-------------------------------------------------------------
  RETURNS @proxtab TABLE (
    objID bigint,
    run int NOT NULL,
    camcol int NOT NULL,
    field int NOT NULL,
    rerun int NOT NULL,
    type int NOT NULL,
    cx float NOT NULL,
    cy float NOT NULL,
    cz float NOT NULL,
    htmID bigint,
    distance float		-- distance in arc minutes
  ) AS BEGIN
	INSERT @proxtab	
	SELECT top 1 * 
	FROM dbo.fGetNearbyObjXYZ(@nx,@ny,@nz,@r)
	ORDER BY distance ASC
  RETURN
  END
GO
/****** Object:  UserDefinedFunction [dbo].[fGetNearestSpecObjAllEq]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fGetNearestSpecObjAllEq] (@ra float, @dec float, @r float)
-------------------------------------------------------------
--/H Returns nearest specobj within @r arcminutes of an equatorial point (@ra, @dec).
-------------------------------------------------------------
--/T <p> returned table:  
--/T <li>  specObjID numeric(20),		-- unique spectrum ID
--/T <li>  plate int NOT NULL,		-- spectroscopic plate number
--/T <li>  mjd int NOT NULL,		-- MJD of observation
--/T <li>  fiberID int NOT NULL,	-- fiber number on plate
--/T <li>  z real NOT NULL,		-- final spectroscopic redshift
--/T <li>  zErr real NOT NULL,		-- redshift error
--/T <li>  zWarning int NOT NULL,	-- warning flags
--/T <li>  sciencePrimary int NOT NULL,	-- deemed to be science-worthy or not
--/T <li>  cx float NOT NULL,		-- x of normal unit vector in J2000
--/T <li>  cy float NOT NULL,		-- y of normal unit vector in J2000
--/T <li>  cz float NOT NULL,		-- z of normal unit vector in J2000
--/T <li>  htmID bigint,		-- 20-deep HTM ID
--/T <li>  distance float		-- distance in arc minutes
--/T <br>
--/T Sample call to find the nearest SpecObj within 1/2 arcminute of ra,dec 180.0, -0.5
--/T <br><samp>
--/T  <br> select *
--/T  <br> from  dbo.fGetNearestSpecObjAllEq(180.0,-0.5,0.5)  
--/T  </samp>  
--/T  <br>see also fGetNearbySpecObjAllEq, fGetNearestSpecObjEq, fGetNearbySpecObjAllXYZ, 
-------------------------------------------------------------
  RETURNS @proxtab TABLE (
    specObjID numeric(20),
    plate int NOT NULL,
    mjd int NOT NULL,
    fiberID int NOT NULL,
    z real NOT NULL,
    zErr real NOT NULL,
    zWarning int NOT NULL,
    sciencePrimary int NOT NULL,
    cx float NOT NULL,
    cy float NOT NULL,
    cz float NOT NULL,
    htmID bigint,
    distance float		-- distance in arc minutes
  ) AS BEGIN
	DECLARE @d2r float, @nx float,@ny float,@nz float 
	set @d2r = PI()/180.0
	if (@r<0) RETURN
	set @nx  = COS(@dec*@d2r)*COS(@ra*@d2r)
	set @ny  = COS(@dec*@d2r)*SIN(@ra*@d2r)
	set @nz  = SIN(@dec*@d2r)
	INSERT @proxtab	
	    SELECT top 1 * 
	    FROM dbo.fGetNearbySpecObjAllXYZ(@nx,@ny,@nz,@r) 
	    ORDER BY distance ASC
  RETURN
  END
GO
/****** Object:  UserDefinedFunction [dbo].[fGetNearestSpecObjAllXYZ]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fGetNearestSpecObjAllXYZ] (@nx float, @ny float, @nz float, @r float)
-------------------------------------------------------------
--/H Returns nearest specobj within @r arcminutes of an xyz point (@nx,@ny, @nz).
-------------------------------------------------------------
--/T <p> returned table:  
--/T <li>  specObjID numeric(20),		-- unique spectrum ID
--/T <li>  plate int NOT NULL,		-- spectroscopic plate number
--/T <li>  mjd int NOT NULL,		-- MJD of observation
--/T <li>  fiberID int NOT NULL,	-- fiber number on plate
--/T <li>  z real NOT NULL,		-- final spectroscopic redshift
--/T <li>  zErr real NOT NULL,		-- redshift error
--/T <li>  zWarning int NOT NULL,	-- warning flags
--/T <li>  sciencePrimary int NOT NULL,	-- deemed to be science-worthy or not
--/T <li>  cx float NOT NULL,		-- x of normal unit vector in J2000
--/T <li>  cy float NOT NULL,		-- y of normal unit vector in J2000
--/T <li>  cz float NOT NULL,		-- z of normal unit vector in J2000
--/T <li>  htmID bigint,		-- 20-deep HTM ID
--/T <li>  distance float		-- distance in arc minutes
--/T <br>
--/T Sample call to find the nearest SpecObj within 1/2 arcminute  of xyz -.0996,-.1,0 
--/T <br><samp>
--/T  <br> select *
--/T  <br> from  dbo.fGetNearestSpecObjAllXYZ(-.996,-.1,0,0.5)  
--/T  </samp>  
--/T  <br>see also fGetNearbySpecObjAllEq, fGetNearestSpecObjAllEq, fGetNearbySpecObjAllXYZ, 
-------------------------------------------------------------
  RETURNS @proxtab TABLE (
    specObjID numeric(20),
    plate int NOT NULL,
    mjd int NOT NULL,
    fiberID int NOT NULL,
    z real NOT NULL,
    zErr real NOT NULL,
    zWarning int NOT NULL,
    sciencePrimary int NOT NULL,
    cx float NOT NULL,
    cy float NOT NULL,
    cz float NOT NULL,
    htmID bigint,
    distance float		-- distance in arc minutes
  ) AS BEGIN
	INSERT @proxtab	
	SELECT top 1 * 
	FROM dbo.fGetNearbySpecObjAllXYZ(@nx,@ny,@nz,@r)
	ORDER BY distance ASC
  RETURN
  END
GO
/****** Object:  UserDefinedFunction [dbo].[fGetNearestSpecObjEq]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fGetNearestSpecObjEq] (@ra float, @dec float, @r float)
-------------------------------------------------------------
--/H Returns nearest scienceprimary specobj within @r arcminutes of an equatorial point (@ra,@dec).
-------------------------------------------------------------
--/T <p> returned table:  
--/T <li>  specObjID numeric(20),		-- unique spectrum ID
--/T <li>  plate int NOT NULL,		-- spectroscopic plate number
--/T <li>  mjd int NOT NULL,		-- MJD of observation
--/T <li>  fiberID int NOT NULL,	-- fiber number on plate
--/T <li>  z real NOT NULL,		-- final spectroscopic redshift
--/T <li>  zErr real NOT NULL,		-- redshift error
--/T <li>  zWarning int NOT NULL,	-- warning flags
--/T <li>  cx float NOT NULL,		-- x of normal unit vector in J2000
--/T <li>  cy float NOT NULL,		-- y of normal unit vector in J2000
--/T <li>  cz float NOT NULL,		-- z of normal unit vector in J2000
--/T <li>  htmID bigint,		-- 20-deep HTM ID
--/T <li>  distance float		-- distance in arc minutes
--/T <br>
--/T Sample call to find the nearest SpecObj within 1/2 arcminute  of ra,dec 180.0, -0.5, 0.5 
--/T <br><samp>
--/T  <br> select *
--/T  <br> from  dbo.fGetNearestSpecObjEq(180.0,-0.5,0.5)  
--/T  </samp>  
--/T  <br>see also fGetNearbySpecObjEq, fGetNearestSpecObjAllEq, fGetNearbySpecObjXYZ, 
-------------------------------------------------------------
  RETURNS @proxtab TABLE (
    specObjID numeric(20),
    plate int NOT NULL,
    mjd int NOT NULL,
    fiberID int NOT NULL,
    z real NOT NULL,
    zErr real NOT NULL,
    zWarning int NOT NULL,
    cx float NOT NULL,
    cy float NOT NULL,
    cz float NOT NULL,
    htmID bigint,
    distance float		-- distance in arc minutes
  ) AS BEGIN
	DECLARE @d2r float, @nx float,@ny float,@nz float 
	set @d2r = PI()/180.0
	if (@r<0) RETURN
	set @nx  = COS(@dec*@d2r)*COS(@ra*@d2r)
	set @ny  = COS(@dec*@d2r)*SIN(@ra*@d2r)
	set @nz  = SIN(@dec*@d2r)
	INSERT @proxtab	
	    SELECT top 1 * 
	    FROM dbo.fGetNearbySpecObjXYZ(@nx,@ny,@nz,@r) 
	    ORDER BY distance ASC
  RETURN
  END
GO
/****** Object:  UserDefinedFunction [dbo].[fGetNearestSpecObjIdAllEq]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fGetNearestSpecObjIdAllEq](@ra float, @dec float, @r float)
-------------------------------------------------
--/H Returns the specObjID of nearest photo object within @r arcmins of ra, dec
--/T <br> ra, dec are in degrees, r is in arc minutes.
-------------------------------------------------
--/T <br>This scalar function is used for matchups of external catalogs.
--/T <br>It calls  <samp>fGetNearestSpecObjAllEq(@ra,@dec,@r)</samp>, and selects 
--/T the specObjID (a bigint). 
--/T <br>This can be called by a single SELECT from an uploaded (ra,dec) table.
--/T <br>An example: 
--/T <br><samp>
--/T <br>  SELECT id, ra,dec, dbo.fGetNearestSpecObjIdAllEq(ra,dec,3.0) as specObjID
--/T <br>      FROM #upload
--/T <br>      WHERE dbo.fGetNearestSpecObjIdAllEq(ra,dec,3.0) IS NOT NULL
--/T</samp><p>
-------------------------------------------------
RETURNS numeric(20)
AS BEGIN
    RETURN (select specObjID from dbo.fGetNearestSpecObjAllEq(@ra,@dec,@r)) 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fGetNearestSpecObjIdEq]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fGetNearestSpecObjIdEq](@ra float, @dec float, @r float)
-------------------------------------------------
--/H Returns the specObjId of nearest sciencePrimary spectrum within @r arcmins of ra, dec
--/T <br> ra, dec are in degrees, r is in arc minutes.
-------------------------------------------------
--/T <br>This scalar function is used for matchups of external catalogs.
--/T <br>It calls  <samp>fGetNearestSpecObjEq(@ra,@dec,@r)</samp>, and selects 
--/T the specObjId (a bigint). 
--/T <br>This can be called by a single SELECT from an uploaded (ra,dec) table.
--/T <br>An example: 
--/T <br><samp>
--/T <br>  SELECT id, ra,dec, dbo.fGetNearestSpecObjIdEq(ra,dec,3.0) as specObjId
--/T <br>      FROM #upload
--/T <br>      WHERE dbo.fGetNearestSpecObjIdEq(ra,dec,3.0) IS NOT NULL
--/T</samp><p>
-------------------------------------------------
RETURNS numeric(20)
AS BEGIN
    RETURN (select specObjID from dbo.fGetNearestSpecObjEq(@ra,@dec,@r)) 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fGetNearestSpecObjXYZ]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fGetNearestSpecObjXYZ] (@nx float, @ny float, @nz float, @r float)
-------------------------------------------------------------
--/H Returns nearest scienceprimary specobj within @r arcminutes of an xyz point (@nx,@ny, @nz).
-------------------------------------------------------------
--/T <p> returned table:  
--/T <li>  specObjID numeric(20),		-- unique spectrum ID
--/T <li>  plate int NOT NULL,		-- spectroscopic plate number
--/T <li>  mjd int NOT NULL,		-- MJD of observation
--/T <li>  fiberID int NOT NULL,	-- fiber number on plate
--/T <li>  z real NOT NULL,		-- final spectroscopic redshift
--/T <li>  zErr real NOT NULL,		-- redshift error
--/T <li>  zWarning int NOT NULL,	-- warning flags
--/T <li>  cx float NOT NULL,		-- x of normal unit vector in J2000
--/T <li>  cy float NOT NULL,		-- y of normal unit vector in J2000
--/T <li>  cz float NOT NULL,		-- z of normal unit vector in J2000
--/T <li>  htmID bigint,		-- 20-deep HTM ID
--/T <li>  distance float		-- distance in arc minutes
--/T <br>
--/T Sample call to find the nearest SpecObj within 1/2 arcminute  of xyz -.0996,-.1,0 
--/T <br><samp>
--/T  <br> select *
--/T  <br> from  dbo.fGetNearestSpecObjXYZ(-.996,-.1,0,0.5)  
--/T  </samp>  
--/T  <br>see also fGetNearbySpecObjEq, fGetNearestSpecObjEq, fGetNearbySpecObjXYZ, 
-------------------------------------------------------------
  RETURNS @proxtab TABLE (
    specObjID numeric(20),
    plate int NOT NULL,
    mjd int NOT NULL,
    fiberID int NOT NULL,
    z real NOT NULL,
    zErr real NOT NULL,
    zWarning int NOT NULL,
    cx float NOT NULL,
    cy float NOT NULL,
    cz float NOT NULL,
    htmID bigint,
    distance float		-- distance in arc minutes
  ) AS BEGIN
	INSERT @proxtab	
	SELECT top 1 * 
	FROM dbo.fGetNearbySpecObjXYZ(@nx,@ny,@nz,@r)
	ORDER BY distance ASC
  RETURN
  END
GO
/****** Object:  UserDefinedFunction [dbo].[fGetObjectsEq]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE  FUNCTION [dbo].[fGetObjectsEq](@flag int, @ra float, 
				@dec float, @r float, @zoom float)
-------------------------------------------------------------
--/H A helper function for SDSS cutout that returns all objects
--/H within a certain radius of an (ra,dec)
-------------------------------------------------------------
--/T Photo objects are filtered to have magnitude greater than
--/T     24-1.5*zoom so that the image is not too cluttered
--/T     (and the anwswer set is not too large).<br>
--/T (@flag&1)>0 display specObj ...<br>
--/T (@flag&2)>0 display photoPrimary bright enough for zoom<br>
--/T (@flag&4)>0 display Target <br>
--/T (@flag&8)>0 display Mask<br>
--/T (@flag&16)>0 display Plate<br>
--/T (@flag&32)>0 display PhotoObjAll<br>
--/T thus: @flag=7 will display all three of specObj, PhotoObj and Target
--/T the returned objects have 
--/T          flag = (specobj:1, photoobj:2, target:4, mask:8, plate:16)
-------------------------------------------------
RETURNS @obj table (ra float, [dec] float, flag int, objid bigint)
AS BEGIN
        DECLARE		@nx float,
                @ny float,
                @nz float,
                @rad float,
                @mag float
                
	set @rad = @r;
        if (@rad > 250) set @rad = 250      -- limit to 4.15 degrees == 250 arcminute radius
        set @nx  = COS(RADIANS(@dec))*COS(RADIANS(@ra));
        set @ny  = COS(RADIANS(@dec))*SIN(RADIANS(@ra));
        set @nz  = SIN(RADIANS(@dec));
        set @mag =  25 - 1.5* @zoom;  -- magnitude reduction.
        
	declare @htmTemp table (
		HtmIdStart bigint,
		HtmIdEnd bigint
	);

	insert @htmTemp select * from dbo.fHtmCoverCircleXyz(@nx,@ny,@nz,@rad)
	DECLARE @lim float;
	SET @lim = POWER(2*SIN(RADIANS(@rad/120)),2);
	
	if ( (@flag & 1) > 0 )  -- specObj
            begin
                INSERT @obj
--                SELECT ra, dec,  @flag as flag, specobjid as objid
                SELECT ra, dec,  1 as flag, specobjid as objid
                FROM @htmTemp H join SpecObj WITH (nolock)
				-- FROM dbo.fHtmCoverCircleXyz(@nx,@ny,@nz,@rad) H inner loop join SpecObj WITH (nolock)
	            ON  ( HtmID BETWEEN H.HtmIDstart AND H.HtmIDend )
                WHERE power(@nx-cx,2)+power(@ny-cy,2)+power(@nz-cz,2) < @lim
				ORDER BY power(@nx-cx,2)+power(@ny-cy,2)+power(@nz-cz,2) ASC
            end
            
            

        if ( (@flag & 2) > 0 )  -- photoObj
            begin
                INSERT @obj
                SELECT ra, dec, 2 as flag, objid
                FROM @htmTemp H join PhotoPrimary WITH (nolock)
				--FROM dbo.fHtmCoverCircleXyz(@nx,@ny,@nz,@rad) H inner loop join PhotoPrimary WITH (nolock)
	            ON  ( HtmID BETWEEN H.HtmIDstart AND H.HtmIDend )
                WHERE power(@nx-cx,2)+power(@ny-cy,2)+power(@nz-cz,2) < @lim
                AND (r <= @mag )
				ORDER BY power(@nx-cx,2)+power(@ny-cy,2)+power(@nz-cz,2) ASC
            end

        if ( (@flag & 4) > 0 )  -- target
            begin
                INSERT @obj
                SELECT ra, dec, 4 as flag, targetid as objid
                FROM @htmTemp H join Target WITH (nolock)
				--FROM dbo.fHtmCoverCircleXyz(@nx,@ny,@nz,@rad) H inner loop join Target WITH (nolock)
	             ON  ( HtmID BETWEEN H.HtmIDstart AND H.HtmIDend )
                WHERE power(@nx-cx,2)+power(@ny-cy,2)+power(@nz-cz,2) < @lim
				ORDER BY power(@nx-cx,2)+power(@ny-cy,2)+power(@nz-cz,2) ASC
            end

        if ( (@flag & 8) > 0 )  -- mask
            begin
                INSERT @obj
                SELECT ra, dec, 8 as flag, maskid as objid
                FROM @htmTemp H join Mask WITH (nolock)
				--FROM dbo.fHtmCoverCircleXyz(@nx,@ny,@nz,@rad) H inner loop join Mask WITH (nolock)
	             ON  ( HtmID BETWEEN H.HtmIDstart AND H.HtmIDend )
                WHERE power(@nx-cx,2)+power(@ny-cy,2)+power(@nz-cz,2) < @lim
				ORDER BY power(@nx-cx,2)+power(@ny-cy,2)+power(@nz-cz,2) ASC
            end

        if ( (@flag & 16) > 0 ) -- plate
            begin
                SET @rad = @r + 89.4;   -- add the tile radius
                INSERT @obj
                SELECT ra, dec, 16 as flag, plateid as objid
                FROM @htmTemp H join PlateX WITH (nolock)
                --FROM dbo.fHtmCoverCircleXyz(@nx,@ny,@nz,@rad) H inner loop join PlateX WITH (nolock)
	             ON  ( HtmID BETWEEN H.HtmIDstart AND H.HtmIDend )
                WHERE power(@nx-cx,2)+power(@ny-cy,2)+power(@nz-cz,2) < @lim
				ORDER BY power(@nx-cx,2)+power(@ny-cy,2)+power(@nz-cz,2) ASC
            end

        if ( (@flag & 32) > 0 )  -- photoPrimary and secondary
            begin
                INSERT @obj
                SELECT ra, dec, 2 as flag, objid
                FROM @htmTemp H join PhotoObjAll WITH (nolock)
				--FROM dbo.fHtmCoverCircleXyz(@nx,@ny,@nz,@rad) H inner loop join PhotoObjAll WITH (nolock)
	             ON  ( HtmID BETWEEN H.HtmIDstart AND H.HtmIDend )
                WHERE power(@nx-cx,2)+power(@ny-cy,2)+power(@nz-cz,2) < @lim
		        AND mode in (1,2)
				ORDER BY power(@nx-cx,2)+power(@ny-cy,2)+power(@nz-cz,2) ASC
            end
        --
        RETURN
END
GO
/****** Object:  UserDefinedFunction [dbo].[fGetObjectsMaskEq]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE   FUNCTION [dbo].[fGetObjectsMaskEq](@flag int, @ra float, @dec float, @r float, @zoom float)
-------------------------------------------------------------
--/H A helper function for SDSS cutout that returns all objects
--/H within a certain radius of an (ra,dec)
-------------------------------------------------------------
--/T Photo objects are filtered to have magnitude greater than
--/T     24-1.5*zoom so that the image is not too cluttered
--/T     (and the anwswer set is not too large).<br>
--/T (@flag&1)>0 display specObj ...<br>
--/T (@flag&2)>0 display photoPrimary...<br>
--/T (@flag&4)>0 display Target <br>
--/T (@flag&8)>0 display Mask<br>
--/T (@flag&16)>0 display Plate<br>
--/T thus: @flag=7 will display all three of specObj, PhotoObj and Target
--/T the returned objects have 
--/T          flag = (specobj:1, photoobj:2, target:4, mask:8, plate:16)
-------------------------------------------------
RETURNS @obj table (ra float, [dec] float, flag int, objid bigint)
AS BEGIN
         DECLARE @nx float,
                @ny float,
                @nz float,
                @rad float,
                @mag float
	set @rad = @r;
        if (@rad > 250) set @rad = 250      -- limit to 4.15 degrees == 250 arcminute radius
        set @nx  = COS(RADIANS(@dec))*COS(RADIANS(@ra));
        set @ny  = COS(RADIANS(@dec))*SIN(RADIANS(@ra));
        set @nz  = SIN(RADIANS(@dec));
        set @mag =  25 - 1.5* @zoom;  -- magnitude reduction.
        
   --
	declare @htmTemp table (
	HtmIdStart bigint,
	HtmIdEnd bigint
	);

	insert @htmTemp select * from dbo.fHtmCoverCircleXyz(@nx,@ny,@nz,@r)
   --
	DECLARE @lim float;	
	SET @lim = POWER(2*SIN(RADIANS(@rad/120)),2);
	
   --

        if ( (@flag & 1) > 0 )  -- specObj
            begin
                INSERT @obj
                SELECT ra, dec,  1 as flag, specobjid as objid
				FROM @htmTemp H  join SpecObj WITH (nolock)
	             ON  ( HtmID BETWEEN H.HtmIDstart AND H.HtmIDend )
                WHERE power(@nx-cx,2)+power(@ny-cy,2)+power(@nz-cz,2)< @lim
            end

        if ( (@flag & 2) > 0 )  -- photoObj
            begin
                INSERT @obj
                SELECT ra, dec, 2 as flag, objid
				FROM @htmTemp H  join PhotoPrimary WITH (nolock)
	             ON  ( HtmID BETWEEN H.HtmIDstart AND H.HtmIDend )
                WHERE power(@nx-cx,2)+power(@ny-cy,2)+power(@nz-cz,2)< @lim
                and (r <= @mag )
            end

        if ( (@flag & 4) > 0 )  -- target
            begin
                INSERT @obj
                SELECT ra, dec, 4 as flag, targetid as objid
				FROM @htmTemp H  join Target WITH (nolock)
	             ON  ( HtmID BETWEEN H.HtmIDstart AND H.HtmIDend )
                WHERE power(@nx-cx,2)+power(@ny-cy,2)+power(@nz-cz,2)< @lim
            end

        if ( (@flag & 8) > 0 )  -- mask
            begin
                INSERT @obj
                SELECT ra, dec, 8 as flag, maskid as objid
				FROM @htmTemp H  join Mask WITH (nolock)
	            ON  ( HtmID BETWEEN H.HtmIDstart AND H.HtmIDend )
                WHERE ((2*DEGREES(ASIN(sqrt(power(@nx-cx,2)+power(@ny-cy,2)+power(@nz-cz,2))/2))*60)< (@rad+radius))
            end

        if ( (@flag & 16) > 0 ) -- plate
            begin
                SET @rad = @r + 89.4;   -- add the tile radius
                INSERT @obj
                SELECT ra, dec, 16 as flag, plateid as objid
                FROM @htmTemp H  join PlateX WITH (nolock)
	            ON  ( HtmID BETWEEN H.HtmIDstart AND H.HtmIDend )
                WHERE power(@nx-cx,2)+power(@ny-cy,2)+power(@nz-cz,2)< @lim
            end
        --
        RETURN
END
GO
/****** Object:  UserDefinedFunction [dbo].[fGetObjFromRect]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fGetObjFromRect] (@ra1 float, @ra2 float, 
				 @dec1 float, @dec2 float)
---------------------------------------------------------------------------
--/H Returns table of objects inside a rectangle defined by two ra,dec pairs.
--/H <br>Note the order of the parameters: @ra1, @ra2, @dec1, @dec2
--
--/T <br>Assumes dec1<dec2. There is no limit on the number of objects.
--/T <br>Uses level 20 HTM.
--/T <br> returned fields: 
--/T  <li> objID bigint,             -- id of the object
--/T  <li> run int NOT NULL,         -- run that observed the object
--/T  <li> camcol int NOT NULL,      -- camera column in run
--/T  <li> field int NOT NULL,       -- field in run
--/T  <li> rerun int NOT NULL,       -- software rerun that saw the object
--/T  <li> type int NOT NULL,        -- type of object (see DataConstants PhotoType)
--/T  <li> cx float NOT NULL,        -- xyz of object
--/T  <li> cy float NOT NULL,
--/T  <li> cz float NOT NULL,
--/T  <li> htmID bigint              -- hierarchical triangular mesh ID of object
--/T <br>sample call<br>
--/T <samp> select * from dbo.fGetObjFromRect(185,185.1,0,.1) </samp>
---------------------------------------------------------------------------
RETURNS @proxtab TABLE (
    objID bigint,
    run int NOT NULL,
    camcol int NOT NULL,
    field int NOT NULL,
    rerun int NOT NULL,
    type int NOT NULL,
    cx float NOT NULL,
    cy float NOT NULL,
    cz float NOT NULL,
    htmID bigint
)
AS BEGIN
	declare @d2r float, @cmd varchar(1000), @radius float, 
	    @dot float, @d1 float, @d2 float,
	    @level int, @shift bigint, @ra float, @dec float,
	    @nx1 float, @ny1 float, @nz1 float,
	    @nx2 float, @ny2 float, @nz2 float,
	    @nx float, @ny float, @nz float
	-- calculate approximate center
	set @ra  = (@ra1+@ra2)/2;
	set @dec = (@dec1+@dec2)/2;
	--
	set @d2r  = PI()/180.0;
	-- n1 is the normal vector to the plane of great circle 1
	set @nx1  = SIN(@ra1*@d2r) * COS(@dec1*@d2r);
	set @ny1  = COS(@ra1*@d2r) * COS(@dec1*@d2r);
	set @nz1  = SIN(@dec1*@d2r);
	--
	set @nx2  = SIN(@ra2*@d2r) * COS(@dec2*@d2r);
	set @ny2  = COS(@ra2*@d2r) * COS(@dec2*@d2r);
	set @nz2  = SIN(@dec2*@d2r);
	--
	set @nx  = SIN(@ra*@d2r) * COS(@dec*@d2r);
	set @ny  = COS(@ra*@d2r) * COS(@dec*@d2r);
	set @nz  = SIN(@dec*@d2r);
	--
	set @d1 = @nx1*@nx+@ny1*@ny+@nz1*@nz;
	set @d2 = @nx2*@nx+@ny2*@ny+@nz2*@nz;
	if @d1<@d2 SET @dot=@d1 ELSE SET @dot=@d2
	set @radius = ACOS(@dot)/@d2r*60.0;
	INSERT @proxtab SELECT
	    objID, run, camcol, field, rerun, type,
	    cx, cy, cz, htmID
	from fGetNearbyObjEq(@ra,@dec,@radius)
	    WHERE (cz>@nz1) AND (cz<@nz2) 
		AND (-cx*@nx1+cy*@ny1>0)
		AND (cx*@nx2-cy*@ny2)>0 
  RETURN
  END 
GO
/****** Object:  UserDefinedFunction [dbo].[fGetObjFromRectEq]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fGetObjFromRectEq] (@ra1 float, @dec1 float, 
				   @ra2 float, @dec2 float)
---------------------------------------------------------------------------
--/H Returns table of objects inside a rectangle defined by two ra,dec pairs.
--/H <br>Note the order of the parameters: @ra1, @dec1, @ra2, @dec2
--
--/T This is a variant of fGetObjFromRect (actually calls it) that takes
--/T the input parameters in a more intuitive order rather than (ra1,ra2,dec1,dec2).
--/T <br>Assumes dec1<dec2. There is no limit on the number of objects.
--/T <br>Uses level 20 HTM.
--/T <br> returned fields: 
--/T  <li> objID bigint,             -- id of the object
--/T  <li> run int NOT NULL,         -- run that observed the object
--/T  <li> camcol int NOT NULL,      -- camera column in run
--/T  <li> field int NOT NULL,       -- field in run
--/T  <li> rerun int NOT NULL,       -- software rerun that saw the object
--/T  <li> type int NOT NULL,        -- type of object (see DataConstants PhotoType)
--/T  <li> cx float NOT NULL,        -- xyz of object
--/T  <li> cy float NOT NULL,
--/T  <li> cz float NOT NULL,
--/T  <li> htmID bigint              -- hierarchical triangular mesh ID of object
--/T <br>sample call<br>
--/T <samp> select * from dbo.fGetObjFromRectEq(185,0,185.1,0.1) </samp>
---------------------------------------------------------------------------
RETURNS @proxtab TABLE (
    objID bigint,
    run int NOT NULL,
    camcol int NOT NULL,
    field int NOT NULL,
    rerun int NOT NULL,
    type int NOT NULL,
    cx float NOT NULL,
    cy float NOT NULL,
    cz float NOT NULL,
    htmID bigint
)
AS BEGIN
  -- call original function with params in different order
  INSERT @proxtab SELECT * FROM fGetObjFromRect(@ra1, @ra2, @dec1, @dec2)
  RETURN
  END 
GO
/****** Object:  UserDefinedFunction [dbo].[fGetUrlExpEq]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 
CREATE FUNCTION [dbo].[fGetUrlExpEq](@ra float, @dec float)
------------------------------------------------------------------------
--/H  Returns the URL for an ra,dec, measured in degrees.
--/T  <br> returns http://localhost/en/tools/explore/obj.asp?ra=185.000000&dec=0.00000000
--/T  <br> where localhost is filled in from SiteConstants.WebServerURL.
--/T  <br> sample:<br> <samp>select dbo.fGetUrlExpEq(185,0) </samp>
--/T  <br> see also fGetUrlNavEq, fGetUrlNavId, fGetUrlExpId
------------------------------------------------------------------------
returns varchar(256)
	begin
	declare @WebServerURL varchar(500);
	set @WebServerURL = 'http://localhost/';
	select @WebServerURL = cast(value as varchar(500))
		from SiteConstants
		where name ='WebServerURL';
	return @WebServerURL + 'tools/explore/obj.asp?ra=' 
		+ ltrim(str(@ra,10,6)) + '&dec=' + ltrim(str(@dec,10,6))
	end

GO
/****** Object:  UserDefinedFunction [dbo].[fGetUrlExpId]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 
CREATE FUNCTION [dbo].[fGetUrlExpId](@objId bigint)
--------------------------------------------
--/H Returns the URL for an Photo objID.
---------------------------------------------
--/T  <br> returns http://localhost/en/tools/explore/obj.asp?id=2255029915222048
--/T  <br> where localhost is filled in from SiteConstants.WebServerURL.
--/T  <br> sample:<br><samp> select dbo.fGetUrlExpId(2255029915222048) </samp>
--/T  <br> see also fGetUrlNavEq, fGetUrlNavId, fGetUrlExpEq
--------------------------------------------
returns varchar(256)
	begin
	declare @WebServerURL varchar(500);
	declare @ra float;
	declare @dec float;
	set @ra = 0
	set @dec = 0;
	set @WebServerURL = 'http://localhost/';
	select @WebServerURL = cast(value as varchar(500))
		from SiteConstants where name ='WebServerURL'; 
	select @ra = ra, @dec = dec
	from PhotoObjAll
	where objID = @objId;
	return @WebServerURL +'tools/explore/obj.asp?id=' 
		+ cast(@objId as varchar(32))
	end

GO
/****** Object:  UserDefinedFunction [dbo].[fGetUrlFitsAtlas]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fGetUrlFitsAtlas](@fieldId bigint)
-------------------------------------------------
--/H Get the URL to the FITS file of all atlas images in a field
-------------------------------------------------
--/T Combines the value of the DataServer URL from the
--/T SiteConstants table and builds up the whole URL
--/T from the fieldId  
--/T <br><samp> select dbo.fGetUrlFitsAtlas(568688299343872)</samp>
-------------------------------------------------
RETURNS varchar(256)
BEGIN
	DECLARE @link varchar(256), @run varchar(8), @rerun varchar(8),
		@camcol varchar(8), @field varchar(8), @run6 varchar(10),
		@dbType varchar(32), @release varchar(8);
	SET @link = (select value from SiteConstants where name='DataServerURL');
	SET @release = (select value from SiteConstants where name='Release');
	SET @dbType = (select value from SiteConstants where name='DB Type');
	--SET @link = @link + 'imaging/';
	SET @link = @link + 'sas/dr' + @release + '/eboss/photo/redux/';
	SELECT  @run = cast(run as varchar(8)), @rerun=cast(rerun as varchar(8)), 
		@camcol=cast(camcol as varchar(8)), @field=cast(field as varchar(8))
	    FROM Field
	    WHERE fieldId=@fieldId;
	IF (@dbType LIKE 'Stripe 82%') AND @run IN ('106','206')
	    BEGIN
	    	-- kludge for coadd runs, which were changed for CAS since the
	    	-- run numbers did not fit in 16 bits (smallint)
	    	SET @run6 = substring(@run,1,1) + '000' + substring(@run,2,2);
		SET @run = @run6;
	    END
	ELSE
	    SET @run6   = substring('000000',1,6-len(@run)) + @run;
	SET @field = substring('0000',1,4-len(@field)) + @field;
	--RETURN 	 @link + @run + '/' + @rerun + '/objcs/'+@camcol+'/fpAtlas-'+@run6+'-'+@camcol+'-'+@field+'.fit';
	RETURN 	 @link + @rerun + '/' + @run + '/objcs/'+@camcol+'/fpAtlas-'+@run6+'-'+@camcol+'-'+@field+'.fit';
END

GO
/****** Object:  UserDefinedFunction [dbo].[fGetUrlFitsBin]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fGetUrlFitsBin](@fieldId bigint, @filter varchar(4))
-------------------------------------------------
--/H Get the URL to the FITS file of a binned frame given FieldID and band.
-------------------------------------------------
--/T Combines the value of the DataServer URL from the
--/T SiteConstants table and builds up the whole URL
--/T from the fieldId (and a u, g, r, i or z filter)
--/T <br><samp> select dbo.fGetUrlFitsBin(568688299343872,'r')</samp>
-------------------------------------------------
RETURNS varchar(256)
BEGIN
	DECLARE @link varchar(256), @run varchar(8), @rerun varchar(8),
		@camcol varchar(8), @field varchar(8), @run6 varchar(10),
		@dbType varchar(32), @release varchar(8);

	SET @link = (select value from SiteConstants where name='DataServerURL');
	SET @release = (select value from SiteConstants where name='Release');
	SET @dbType = (select value from SiteConstants where name='DB Type');
	--SET @link = @link + 'imaging/';
	SET @link = @link + 'sas/dr' + @release + '/eboss/photo/redux/';
	SELECT  @run = cast(run as varchar(8)), @rerun=cast(rerun as varchar(8)), 
		@camcol=cast(camcol as varchar(8)), @field=cast(field as varchar(8))
	    FROM Field
	    WHERE fieldId=@fieldId;
	IF (@dbType LIKE 'Stripe 82%') AND @run IN ('106','206')
	    BEGIN
	    	-- kludge for coadd runs, which were changed for CAS since the
	    	-- run numbers did not fit in 16 bits (smallint)
	    	SET @run6 = substring(@run,1,1) + '000' + substring(@run,2,2);
		SET @run = @run6;
	    END
	ELSE
	    SET @run6   = substring('000000',1,6-len(@run)) + @run;
	SET @field = substring('0000',1,4-len(@field)) + @field;
	--RETURN 	 @link + @run + '/' + @rerun + '/objcs/'+@camcol+'/fpBIN-'+@run6+'-'+@filter+@camcol+'-'+@field+'.fit';
	RETURN 	 @link + @rerun + '/' + @run + '/objcs/'+@camcol+'/fpBIN-'+@run6+'-'+@filter+@camcol+'-'+@field+'.fit.gz';
END

GO
/****** Object:  UserDefinedFunction [dbo].[fGetUrlFitsCFrame]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fGetUrlFitsCFrame](@fieldId bigint, @filter varchar(4))
-------------------------------------------------
--/H Get the URL to the FITS file of a corrected frame given the fieldID and band
-------------------------------------------------
--/T Combines the value of the DataServer URL from the
--/T SiteConstants table and builds up the whole URL
--/T from the fieldId (and a u, g, r, i or z filter)
--/T <br><samp> select dbo.fGetUrlFitsCFrame(568688299343872,'r')</samp>
-------------------------------------------------
RETURNS varchar(256)
BEGIN
	DECLARE @link varchar(256), @run varchar(8), @rerun varchar(8),
		@camcol varchar(8), @field varchar(8), @run6 varchar(10),
		@dbType varchar(32), @release varchar(8);
	SET @link = (select value from SiteConstants where name='DataServerURL');
	SET @release = (select value from SiteConstants where name='Release');
	SET @dbType = (select value from SiteConstants where name='DB Type');
	--SET @link = @link + 'imaging/';
	SET @link = @link + 'sas/dr' + @release + '/eboss/photoObj/frames/';
	SELECT  @run = cast(run as varchar(8)), @rerun=cast(rerun as varchar(8)), 
		@camcol=cast(camcol as varchar(8)), @field=cast(field as varchar(8))
	    FROM Field
	    WHERE fieldId=@fieldId;
	IF (@dbType LIKE 'Stripe 82%') AND @run IN ('106','206')
	    BEGIN
	    	-- kludge for coadd runs, which were changed for CAS since the
	    	-- run numbers did not fit in 16 bits (smallint)
	    	SET @run6 = substring(@run,1,1) + '000' + substring(@run,2,2);
		SET @run = @run6;
	    END
	ELSE
	    SET @run6   = substring('000000',1,6-len(@run)) + @run;
	SET @field = substring('0000',1,4-len(@field)) + @field;
	--RETURN 	 @link + @run + '/' + @rerun + '/corr/'+@camcol+'/fpC-'+@run6+'-'+@filter+@camcol+'-'+@field+'.fit.gz';
	RETURN 	 @link + @rerun + '/' + @run + '/' +@camcol+'/frame-'+@filter+'-'+@run6+'-'+@camcol+'-'+@field+'.fits.bz2';
END

GO
/****** Object:  UserDefinedFunction [dbo].[fGetUrlFitsField]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fGetUrlFitsField](@fieldId bigint)
-------------------------------------------------
--/H Given a FieldID returns the URL to the FITS file of that field 
-------------------------------------------------
--/T Combines the value of the DataServer URL from the
--/T SiteConstants table and builds up the whole URL 
--/T <br><samp> select dbo.fGetUrlFitsField(568688299343872)</samp>
-------------------------------------------------
RETURNS varchar(256)
BEGIN
	DECLARE @link varchar(256), @run varchar(8), @rerun varchar(8),
		@run6 varchar(10), @stripe varchar(8), @camcol varchar(8), 
		@field varchar(8), @skyVersion varchar(8),
		@dbType varchar(32), @release varchar(8);

	SET @link = (select value from SiteConstants where name='DataServerURL');
	SET @release = (select value from SiteConstants where name='Release');
	SET @dbType = (select value from SiteConstants where name='DB Type');
	--SET @link = @link + 'imaging/';
	SET @link = @link + 'sas/dr' + @release + '/eboss/photoObj/';
	SELECT @skyVersion=cast(dbo.fSkyVersion(@fieldid) as varchar(8));
	SELECT  @run = cast(f.run as varchar(8)), 
		@rerun=cast(f.rerun as varchar(8)), 
		@stripe=cast(s.[stripe] as varchar(8)),
		@camcol=cast(f.camcol as varchar(8)), 
		@field=cast(f.field as varchar(8))
	    FROM Field f, Run s
	    WHERE f.fieldId=@fieldId and s.run = f.run; 
	IF (@dbType LIKE 'Stripe 82%') AND @run IN ('106','206')
	    BEGIN
	    	-- kludge for coadd runs, which were changed for CAS since the
	    	-- run numbers did not fit in 16 bits (smallint)
	    	SET @run6 = substring(@run,1,1) + '000' + substring(@run,2,2);
		SET @run = @run6;
	    END
	ELSE
	    SET @run6   = substring('000000',1,6-len(@run)) + @run;
	SET @link = @link + @rerun + '/';
	IF (@skyVersion = '0')
	    SET @link = @link + 'inchunk_target/';
	ELSE IF (@skyVersion = '1')
	    SET @link = @link + 'inchunk_best/';
	ELSE
	    SET @link = @link + @run + '/' + @camcol + '/';
	SET @field = substring('0000',1,4-len(@field)) + @field;
	IF (@skyVersion = '15')
	    SET @link = @link + @rerun + '/calibChunks/';
	RETURN @link+'photoObj-'+@run6+'-'+@camcol+'-'+@field+'.fits';
END

GO
/****** Object:  UserDefinedFunction [dbo].[fGetUrlFitsMask]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fGetUrlFitsMask](@fieldId bigint, @filter varchar(4))
-------------------------------------------------
--/H Get the URL to the FITS file of a frame mask given the fieldID and band
-------------------------------------------------
--/T Combines the value of the DataServer URL from the
--/T SiteConstants table and builds up the whole URL
--/T from the fieldId (and a u, g, r, i or z filter)
--/T <br><samp> select dbo.fGetUrlFitsMask(568688299343872,'r')</samp>
-------------------------------------------------
RETURNS varchar(256)
BEGIN
	DECLARE @link varchar(256), @run varchar(8), @rerun varchar(8),
		@camcol varchar(8), @field varchar(8), @run6 varchar(10),
		@dbType varchar(32), @release varchar(8);

	SET @link = (select value from SiteConstants where name='DataServerURL');
	SET @release = (select value from SiteConstants where name='Release');
	SET @dbType = (select value from SiteConstants where name='DB Type');
	--SET @link = @link + 'imaging/';
	SET @link = @link + 'sas/dr' + @release + '/eboss/photo/redux/';
	SELECT  @run = cast(run as varchar(8)), @rerun=cast(rerun as varchar(8)), 
		@camcol=cast(camcol as varchar(8)), @field=cast(field as varchar(8))
	    FROM Field
	    WHERE fieldId=@fieldId;
	IF (@dbType LIKE 'Stripe 82%') AND @run IN ('106','206')
	    BEGIN
	    	-- kludge for coadd runs, which were changed for CAS since the
	    	-- run numbers did not fit in 16 bits (smallint)
	    	SET @run6 = substring(@run,1,1) + '000' + substring(@run,2,2);
		SET @run = @run6;
	    END
	ELSE
	    SET @run6   = substring('000000',1,6-len(@run)) + @run;
	SET @field = substring('0000',1,4-len(@field)) + @field;
	--RETURN 	 @link + @run + '/' + @rerun + '/objcs/'+@camcol+'/fpM-'+@run6+'-'+@filter+@camcol+'-'+@field+'.fit';
	RETURN 	 @link + @rerun + '/' + @run + '/objcs/'+@camcol+'/fpM-'+@run6+'-'+@filter+@camcol+'-'+@field+'.fit.gz';
END

GO
/****** Object:  UserDefinedFunction [dbo].[fGetUrlFitsPlate]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fGetUrlFitsPlate](@specObjID numeric(20,0))
-------------------------------------------------
--/H Get the URL to the spPlate FITS file containing the spectrum given the SpecObjID
-------------------------------------------------
--/T Combines the value of the DataServer URL from the
--/T SiteConstants table and builds up the whole URL
--/T from the specObjId.
--/T <br><samp> select dbo.fGetUrlFitsPlate(75094092974915584)</samp>
-------------------------------------------------
RETURNS varchar(128)
BEGIN
	DECLARE @link varchar(128), @plate varchar(4), @oplate varchar(4), 
	    @mjd varchar(5), @rerun varchar(16), @release varchar(8), @survey varchar(16);
	SET @link = (SELECT value FROM SiteConstants WHERE name='DataServerURL');
	SET @release = (select value from SiteConstants where name='Release');
	SELECT @rerun = isnull(p.run2d, p.run1d), @survey = p.survey,
	    @mjd = cast(p.mjd as varchar(5)), @plate=cast(p.plate as varchar(4)) 
	    FROM PlateX p JOIN specObjAll s ON p.plateId=s.plateId 
	    WHERE s.specObjID=@specObjId;
    IF @survey != 'boss'
        SET @survey = 'sdss'
    ELSE 
        SET @survey = 'eboss'
    SET @link = @link + 'sas/dr' + @release + '/' + @survey + '/spectro/redux/' +
		@rerun + '/';
    SET @oplate = substring('0000',1,4-len(@plate)) + @plate;
    SET @link = @link + @oplate + '/';
    SET @link = @link + 'spPlate-' + @oplate + '-' + @mjd + '.fits';
    RETURN @link;
END

GO
/****** Object:  UserDefinedFunction [dbo].[fGetUrlFitsSpectrum]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fGetUrlFitsSpectrum](@specObjID numeric(20,0))
-------------------------------------------------
--/H Get the URL to the FITS file of the spectrum given the SpecObjID
-------------------------------------------------
--/T Combines the value of the DataServer URL from the
--/T SiteConstants table and builds up the whole URL
--/T from the specObjId.
--/T <br><samp> select dbo.fGetUrlFitsSpectrum(75094092974915584)</samp>
-------------------------------------------------
RETURNS varchar(128)
BEGIN
	DECLARE @link varchar(128), @plate varchar(8), @mjd varchar(8), 
	    @fiber varchar(8), @rerun varchar(16), @release varchar(8), 
	    @survey varchar(16), @oplate varchar(8), @ofiber varchar(8);
	SET @link = (SELECT value FROM SiteConstants WHERE name='DataServerURL');
	SET @release = (select value from SiteConstants where name='Release');
	SELECT @rerun = isnull(p.run2d, p.run1d), @survey = p.survey,
	    @mjd = cast(p.mjd as varchar(8)), @plate=cast(p.plate as varchar(8)), 
	    @fiber=cast(s.fiberID as varchar(8)) 
	    FROM PlateX p JOIN specObjAll s ON p.plateId=s.plateId 
	    WHERE s.specObjID=@specObjId;
	IF @survey != 'boss'
            SET @survey = 'sdss'
	ELSE
	    SET @survey = 'eboss'
	SET @oplate = substring('0000',1,4-len(@plate)) + @plate;
	SET @ofiber = substring( '0000',1,4-len(@fiber)) + @fiber;
	SET @link = @link + 'sas/dr' + @release + '/' + @survey + '/spectro/redux/' +
		@rerun + '/spectra/' + @oplate + '/spec-' + @oplate + '-' + 
		@mjd + '-' + @ofiber + '.fits';
	RETURN @link;
END

GO
/****** Object:  UserDefinedFunction [dbo].[fGetUrlFrameImg]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 
CREATE FUNCTION [dbo].[fGetUrlFrameImg](@frameId bigint, @zoom int)
------------------------------------------------------------------------
--/H  Returns the URL for a JPG image of the frame
--/T  <br> returns http://localhost/en/get/frameById.asp?id=568688299147264
--/T  <br> where localhost is filled in from SiteConstants.WebServerURL.
--/T  <br> @zoom is an integer from (0,10,15,20,30) corresponding to a
--/T  rescaling of 2^(0.1*@zoom)
--/T  <br> sample:<br> <samp>select dbo.fGetUrlSpecImg(568688299147264,10) </samp>
--/T  <br> see also fGetUrlFrame
------------------------------------------------------------------------
returns varchar(256)
	begin
	declare @WebServerURL varchar(500);
	set @WebServerURL = 'http://localhost/';
	select @WebServerURL = cast(value as varchar(500))
		from SiteConstants
		where name ='WebServerURL';
	return @WebServerURL + 'get/frameById.asp?id=' 
		+ cast(@frameId as varchar(32))
		+ '&zoom=' + cast(@zoom as varchar(6))
	end

GO
/****** Object:  UserDefinedFunction [dbo].[fGetUrlMangaCube]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fGetUrlMangaCube](@plateIFU VARCHAR(20), @type VARCHAR(3))
-------------------------------------------------
--/H Get the URL of the MaNGA data cube of the specified type (LIN/LOG)
-------------------------------------------------
--/T Combines the value of the DataServer URL from the SiteConstants
--/T table and builds up the whole URL from the plateIFU and data cube
--/T type ('LIN' or 'LOG'), along with the version string (versdp3 from
--/T the mangaDrpAll entry.
--/T <br><samp> select TOP 10 dbo.fGetUrlMangaCube(plateIFU,'LIN') 
--/T            FROM mangaDrpAll </samp>
-------------------------------------------------
RETURNS varchar(128)
BEGIN
	DECLARE @link varchar(128), @vers VARCHAR(20), 
	    @release varchar(8), @plate INT;
	SET @link = (SELECT value FROM SiteConstants WHERE name='DataServerURL');
	SET @release = (select value from SiteConstants where name='Release');
	SELECT @plate=plate, @vers = versdrp3
	    FROM mangaDrpAll
	    WHERE plateIFU=@plateIFU;
	SET @link = @link + 'sas/dr' + @release + '/manga/spectro/redux/' +
		@vers + '/' + CAST(@plate as VARCHAR) + '/stack/manga-' + 
		@plateIFU + '-' + UPPER(@type) + 'CUBE.fits.gz';
	RETURN @link;
END

GO
/****** Object:  UserDefinedFunction [dbo].[fGetUrlNavEq]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fGetUrlNavEq](@ra float, @dec float)
------------------------------------------------------------------------
--/H  Returns the URL for an ra,dec, measured in degrees.
--/T  <br> gets the URL of the navigator frame containing the given ra,dec (in degrees)
--/T  <br> returns http://localhost/en/tools/navi/getFrame.asp?zoom=1&ra=185.000000&dec=0.00000000
--/T  <br> where localhost is filled in from SiteConstants.WebServerURL.
--/T  <br> sample:<br> <samp>select dbo.fGetUrlNavEq(185,0) </samp>
--/T  <br> see also fGetUrlNavId, fGetUrlExpEq, fGetUrlExpId
------------------------------------------------------------------------
returns varchar(256)
	begin
	declare @WebServerURL varchar(500);
	set @WebServerURL = 'http://localhost/';
	select @WebServerURL = cast(value as varchar(500))
		from SiteConstants
		where name ='WebServerURL';
	return @WebServerURL + 'tools/chart/navi.asp?zoom=1&ra=' 
		+ ltrim(str(@ra,10,6)) + '&dec=' + ltrim(str(@dec,10,6))
	end


GO
/****** Object:  UserDefinedFunction [dbo].[fGetUrlNavId]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fGetUrlNavId](@objId bigint)
--------------------------------------------
--/H Returns the Navigator URL for an Photo objID.
---------------------------------------------
--/T  <br> returns http://localhost/en/tools/navi/getFrame.asp?zoom=1&ra=184.028935&dec=-1.1259095
--/T  <br> where localhost is filled in from SiteConstants.WebServerURL.
--/T  <br> sample:<br><samp> select dbo.fGetUrlId(2255029915222048) </samp>
--/T  <br> see also fGetUrlNavEq, fGetUrlExpEq, fGetUrlExpId
--------------------------------------------
returns varchar(256)
	begin
	declare @WebServerURL varchar(500);
	declare @ra float;
	declare @dec float;
	set @ra = 0
	set @dec = 0;
	set @WebServerURL = 'http://localhost/';
	select @WebServerURL = cast(value as varchar(500))
		from SiteConstants where name ='WebServerURL'; 
	select @ra = ra, @dec = dec
	from PhotoObjAll
	where objID = @objId;
	return @WebServerURL +'tools/chart/navi.asp?zoom=1&ra=' 
		+ ltrim(str(@ra,10,10)) + '&dec=' + ltrim(str(@dec,10,10))
	end


GO
/****** Object:  UserDefinedFunction [dbo].[fGetUrlSpecImg]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fGetUrlSpecImg](@specObjID numeric(20,0))
------------------------------------------------------------------------
--/H  Returns the URL for a GIF image of the spectrum given the SpecObjID
--/T  <br> returns http://localhost/en/get/specById.asp?id=0x011fcb379dc00000
--/T  <br> where localhost is filled in from SiteConstants.WebServerURL.
--/T  <br> sample:<br> <samp>select dbo.fGetUrlSpecImg(0x011fcb379dc00000) </samp>
--/T  <br> see also fGetUrlFrame
------------------------------------------------------------------------
returns varchar(256)
	begin
	declare @WebServerURL varchar(500);
	set @WebServerURL = 'http://localhost/';
	select @WebServerURL = cast(value as varchar(500))
		from SiteConstants
		where name ='WebServerURL';
	return @WebServerURL + 'get/specById.ashx?id=' 
		+ cast(coalesce(@specObjId,0) as varchar(32))
	end

GO
/****** Object:  UserDefinedFunction [dbo].[fGetWCS]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[fGetWCS](@fieldid bigint)
-------------------------------------------------------------------------------
--/H Builds the relevant part of the FITS header with the WCS info
-------------------------------------------------------------------------------
--/A 
--/T Input parameter is the fieldid
--/T print dbo.fGetWCS(1237671956445462528)
-------------------------------------------------------------------------------
RETURNS varchar(2000)
AS BEGIN
	DECLARE @out varchar(2000)
	SELECT @out  = '	NAXIS   =                    2
	NAXIS1  =                 2048
	NAXIS2  =                 1489
	ORIGIN  = ''SDSS    ''
	TELESCOP= ''2.5m    ''
	OBSERVER= ''observer''           / Observer
	EQUINOX =              2000.00 /	
	CTYPE1  = ''RA---TAN''           /Coordinate type
	CTYPE2  = ''DEC--TAN''           /Coordinate type
	CRPIX1  =        1025.00000000 /X of reference pixel
	CRPIX2  =        745.000000000 /Y of reference pixel';
	------------------------------------------
	-- append the ra and dec of the center
	------------------------------------------
	SELECT @out =  @out
			+CHAR(10)
			+'    CRVAL1  ='+STR(b.ra,22,10)
			+' /RA of reference pixel (deg)'
			+CHAR(10)
			+'    CRVAL2  ='+STR(b.dec,22,10)
			+' /Dec of reference pixel (deg)'
			+CHAR(10)
	FROM (
		SELECT	
			a_r+b_r*744.5+c_r*1024.5 mu,
			d_r+e_r*744.5+f_r*1024.5 nu,
			r.node, r.incl
		FROM Field f
		    JOIN Run r ON f.run=r.run
		WHERE 
		    f.fieldID=@fieldid
	) a CROSS APPLY dbo.fEqFromMuNu(mu,nu,node,incl) b
	--
	RETURN @out;
END
GO
/****** Object:  UserDefinedFunction [dbo].[fHMS]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fHMS](@deg float)
-------------------------------------------------------------------------------
--/H Convert right ascension in degrees to +hh:mm:ss.ss notation <br>
-------------------------------------------------------------------------------
--/T <i>NOTE: this function should not be used to generate SDSS IAU names,
--/T use fIAUFromEq instead. </i>
--/T <p><samp> select dbo.fHMS(187.5) </samp>
-------------------------------------------------------------------------------
RETURNS varchar(32)
AS BEGIN
    RETURN dbo.fHMSbase(@deg,default,default);
END

GO
/****** Object:  UserDefinedFunction [dbo].[fHMSbase]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE  FUNCTION [dbo].[fHMSbase](@deg float, @truncate int = 0, @precision int = 2)
-------------------------------------------------------------------------------
--/H Base function to convert right ascension in degrees to +hh:mm:ss.ss notation.
-------------------------------------------------------------------------------
--/T @truncate is 0 (default) if decimal digits to be rounded, 1 to be truncated.
--/T <br> @precision is the number of decimal digits, default 2.
--/T <p><samp> select dbo.fHMSBase(187.5,1,3) </samp> <br>
--/T <samp> select dbo.fHMSBase(187.5,default,default) </samp>
-------------------------------------------------------------------------------
RETURNS varchar(32)
AS BEGIN
    DECLARE
	@d float,
	@nd int, 
	@np int, 
	@q varchar(10),
	@t varchar(16);
	--
	SET @t = '00:00:00.0'
	IF (@precision < 1) SET @precision = 1;
	IF (@precision > 10) SET @precision = 10;
	SET @np = 0
	WHILE (@np < @precision-1) BEGIN
		SET @t = @t+'0'
		SET @np = @np + 1
	END
	SET @d = ABS(@deg/15.0);
	-- degrees
	SET @nd = FLOOR(@d);
	SET @q  = LTRIM(CAST(@nd as varchar(2)));
	SET @t  = STUFF(@t,3-LEN(@q),LEN(@q), @q);
	-- minutes
	SET @d  = 60.0 * (@d-@nd);
	SET @nd = FLOOR(@d);
	SET @q  = LTRIM(CAST(@nd as varchar(4)));
	SET @t  = STUFF(@t,6-LEN(@q),LEN(@q), @q);
	-- seconds
	SET @d  = ROUND( 60.0 * (@d-@nd),@precision,@truncate );
	SET @q  = LTRIM(STR(@d,6+@precision,@precision));
	SET @t = STUFF(@t,10+@precision-LEN(@q),LEN(@q), @q);
--	SET @d  = 60.0 * (@d-@nd);
--	SET @q = LTRIM(STR(@d,9,3));
--	SET @t = STUFF(@t,13-LEN(@q),LEN(@q), @q);
	--
	RETURN(@t);
END

GO
/****** Object:  UserDefinedFunction [dbo].[fHoleType]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fHoleType](@name varchar(40))
-------------------------------------------------------------------------------
--/H Return the HoleType value, indexed by name
-------------------------------------------------------------------------------
--/T the HoleTypes can be found with 
--/T <br>       Select * from HoleType
--/T <br>
--/T Sample call to fHoleType.
--/T <samp> 
--/T <br> select top 10  *
--/T <br> from HoleObj
--/T <br> where holeType = dbo.fHoleType('OBJECT')
--/T </samp> 
--/T <br> see also fHoleTypeN
-------------------------------------------------------------
RETURNS INTEGER
AS BEGIN
    RETURN ( SELECT value
	FROM HoleType
	WHERE name = UPPER(@name)
	)
END
GO
/****** Object:  UserDefinedFunction [dbo].[fHoleTypeN]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fHoleTypeN](@value int)
-------------------------------------------------------------------------------
--/H Return the HoleType name, indexed by value
-------------------------------------------------------------------------------
--/T the HoleTypes can be found with 
--/T <br>       Select * from HoleType
--/T <br>
--/T Sample call to fHoleTypeN.
--/T <samp> 
--/T <br> select top 10 dbo.fHoleTypeN(holeType) as holeType
--/T <br> from HoleObj
--/T </samp> 
--/T <br> see also fHoleType
-------------------------------------------------------------
RETURNS varchar(40)
AS BEGIN
    RETURN ( SELECT name
	FROM HoleType
	WHERE value = @value
	)
END
GO
/****** Object:  UserDefinedFunction [dbo].[fHtmCoverBinaryAdvanced]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[fHtmCoverBinaryAdvanced](@bin [varbinary](max))
RETURNS  TABLE (
	[htmidStart] [bigint] NULL,
	[htmidEnd] [bigint] NULL,
	[innerFlag] [bit] NULL
) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SphericalHTM].[Spherical.Htm.Sql].[fHtmCoverBinaryAdvanced]
GO
/****** Object:  UserDefinedFunction [dbo].[fHtmCoverCircleEq]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[fHtmCoverCircleEq](@ra [float], @dec [float], @radius [float])
RETURNS  TABLE (
	[HtmIDStart] [bigint] NULL,
	[HtmIDEnd] [bigint] NULL
) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SphericalHTM].[Spherical.Htm.Sql].[fHtmCoverCircleEq]
GO
/****** Object:  UserDefinedFunction [dbo].[fHtmCoverCircleXyz]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[fHtmCoverCircleXyz](@x [float], @y [float], @z [float], @radius [float])
RETURNS  TABLE (
	[HtmIDStart] [bigint] NULL,
	[HtmIDEnd] [bigint] NULL
) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SphericalHTM].[Spherical.Htm.Sql].[fHtmCoverCircleXyz]
GO
/****** Object:  UserDefinedFunction [dbo].[fHtmCoverRegion]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[fHtmCoverRegion](@region [nvarchar](max))
RETURNS  TABLE (
	[HtmIDStart] [bigint] NULL,
	[HtmIDEnd] [bigint] NULL
) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SphericalHTM].[Spherical.Htm.Sql].[fHtmCoverRegion]
GO
/****** Object:  UserDefinedFunction [dbo].[fHtmCoverRegionAdvanced]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[fHtmCoverRegionAdvanced](@region [nvarchar](max))
RETURNS  TABLE (
	[htmidStart] [bigint] NULL,
	[htmidEnd] [bigint] NULL,
	[innerFlag] [bit] NULL
) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SphericalHTM].[Spherical.Htm.Sql].[fHtmCoverRegionAdvanced]
GO
/****** Object:  UserDefinedFunction [dbo].[fHtmCoverRegionError]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[fHtmCoverRegionError](@region [nvarchar](max))
RETURNS [nvarchar](max) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SphericalHTM].[Spherical.Htm.Sql].[fHtmCoverRegionError]
GO
/****** Object:  UserDefinedFunction [dbo].[fHtmEq]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[fHtmEq](@ra [float], @dec [float])
RETURNS [bigint] WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SphericalHTM].[Spherical.Htm.Sql].[fHtmEq]
GO
/****** Object:  UserDefinedFunction [dbo].[fHtmEqToXyz]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[fHtmEqToXyz](@ra [float], @dec [float])
RETURNS  TABLE (
	[x] [float] NULL,
	[y] [float] NULL,
	[z] [float] NULL
) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SphericalHTM].[Spherical.Htm.Sql].[fHtmEqToXyz]
GO
/****** Object:  UserDefinedFunction [dbo].[fHtmGetCenterPoint]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[fHtmGetCenterPoint](@htmid [bigint])
RETURNS  TABLE (
	[x] [float] NULL,
	[y] [float] NULL,
	[z] [float] NULL
) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SphericalHTM].[Spherical.Htm.Sql].[fHtmGetCenterPoint]
GO
/****** Object:  UserDefinedFunction [dbo].[fHtmGetCornerPoints]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[fHtmGetCornerPoints](@htmid [bigint])
RETURNS  TABLE (
	[x] [float] NULL,
	[y] [float] NULL,
	[z] [float] NULL
) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SphericalHTM].[Spherical.Htm.Sql].[fHtmGetCornerPoints]
GO
/****** Object:  UserDefinedFunction [dbo].[fHtmGetString]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[fHtmGetString](@htmid [bigint])
RETURNS [nvarchar](max) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SphericalHTM].[Spherical.Htm.Sql].[fHtmGetString]
GO
/****** Object:  UserDefinedFunction [dbo].[fHtmVersion]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[fHtmVersion]()
RETURNS [nvarchar](max) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SphericalHTM].[Spherical.Htm.Sql].[fHtmVersion]
GO
/****** Object:  UserDefinedFunction [dbo].[fHtmXyz]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[fHtmXyz](@x [float], @y [float], @z [float])
RETURNS [bigint] WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SphericalHTM].[Spherical.Htm.Sql].[fHtmXyz]
GO
/****** Object:  UserDefinedFunction [dbo].[fHtmXyzToEq]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[fHtmXyzToEq](@x [float], @y [float], @z [float])
RETURNS  TABLE (
	[ra] [float] NULL,
	[dec] [float] NULL
) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SphericalHTM].[Spherical.Htm.Sql].[fHtmXyzToEq]
GO
/****** Object:  UserDefinedFunction [dbo].[fIAUFromEq]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fIAUFromEq](@ra float, @dec float)
-------------------------------------------------------------------------------
--/H Convert ra, dec in degrees to extended IAU name
-------------------------------------------------------------------------------
--/T Will create a 25 char IAU name as SDSS Jhhmmss.ss+ddmmss.s
--/T <p><samp> select dbo.fIAUFromEq(182.25, -12.5) </samp>
-------------------------------------------------------------------------------
RETURNS varchar(64)
AS BEGIN
	RETURN('SDSS J'+REPLACE(dbo.fHMSbase(@ra,1,2)+dbo.fDMSbase(@dec,1,1),':',''));
END

GO
/****** Object:  UserDefinedFunction [dbo].[fImageStatus]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fImageStatus](@name varchar(40))
-------------------------------------------------------------------------------
--/H Return the ImageStatus flag value, indexed by name
-------------------------------------------------------------------------------
--/T the ImageStatus values can be shown with Select * from ImageStatus 
--/T <br>
--/T Sample call to fImageStatus
--/T <samp> 
--/T <br> select top 10 ???
--/T <br> from   ????? 
--/T <br> where  ??? = dbo.fImageStatus('SUBTRACTED')  
--/T </samp> 
--/T <br> see also fImageStatusN
-------------------------------------------------------------
RETURNS int
AS BEGIN
    RETURN ( SELECT cast(value as int)
	FROM ImageStatus
	WHERE name = UPPER(@name)
	)
END
GO
/****** Object:  UserDefinedFunction [dbo].[fImageStatusN]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fImageStatusN](@value int)
-------------------------------------------------------------------------------
--/H Return the expanded ImageStatus corresponding to the flag value as a string
-------------------------------------------------------------------------------
--/T the ImageStatus values can be shown with Select * from ImageStatus 
--/T <br>
--/T Sample call to fImageStatusN
--/T <samp> 
--/T <br> select top 10 objID, dbo.fImageStatus(mask) as mask
--/T <br> from   ????? 
--/T </samp> 
--/T <br> see also fImageStatus 
-------------------------------------------------------------
RETURNS varchar(1000)
BEGIN
    DECLARE @bit int, @mask bigint, @out varchar(2000);
    SET @bit=32;
    SET @out ='';
    WHILE (@bit>0)
	BEGIN
	    SET @bit = @bit-1;
	    SET @mask = power(cast(2 as bigint),@bit);
	    SET @out = @out + (CASE 
		WHEN (@mask & @value)=0 THEN '' 
		ELSE coalesce((select name from ImageStatus where value=@mask),'')+' '
	    	END);
	END
    RETURN @out;
END
GO
/****** Object:  UserDefinedFunction [dbo].[fIndexName]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fIndexName](
	@code char(1),
	@tablename varchar(100),
	@fieldList varchar(1000),
	@foreignKey varchar(1000)
)
------------------------------------------------
--/H Builds the name of the index from its components
--/A
--/T Used by the index build and check procedures.
--/T <li>If 'K' then pk_Tablename_fieldList
--/T <li>If 'F' then fk_TableName_fieldList_Key
--/T <li>If 'I' then i_TableName_fieldlist,
--/T <br> truncated to 32 characters.
------------------------------------------------
RETURNS varchar(32)
AS BEGIN
	DECLARE @constraint varchar(2000), 
		@head varchar(8),
		@fk varchar(1000);
	--
	SET @head = CASE @code 
		WHEN 'K' THEN 'pk_'
		WHEN 'F' THEN 'fk_'
		WHEN 'I' THEN 'i_'
		END
	--
	SET @fk = replace(replace(replace(@foreignKey,',','_'),')',''),'(','_');
	SET @constraint = @head + @tableName + '_'
		+ replace(replace(@fieldList,' ',''),',','_');
	IF @foreignkey != '' SET @constraint = @constraint + '_' + @fk;
	--
	SET @constraint = substring(@constraint,1,32);
	SET @constraint = replace(replace(@constraint,'[',''),']','')
	RETURN @constraint;
END

GO
/****** Object:  UserDefinedFunction [dbo].[fInFootprintEq]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fInFootprintEq] (@ra float, @dec float, @rad float)
-----------------------------------------------------------------
--/H Indicates whether the given point is in the SDSS footprint or not.
--/T
--/T Returns 'true' or 'false' depending on whether the given circle
--/T (ra,dec,radius) is in the SDSS footprint or not.  The radius is in
--/T arcmin.
--/T
--/T <samp>
--/T     SELECT dbo.fInFootprintEq( 143.15, -0.7, 2.0 )
--/T </samp>
--/T <br> See also fFootprintEq.
-----------------------------------------------------------------
RETURNS bit
AS BEGIN
	declare @num int, @ret bit;
    
	SELECT @num = COUNT(*) 
	FROM dbo.fFootprintEq(@ra, @dec, @rad)
    
	IF (@num > 0) 
		SET @ret = 1 
	ELSE 
		SET @ret = 0
	RETURN @ret
END
GO
/****** Object:  UserDefinedFunction [dbo].[fInsideMask]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fInsideMask](@name varchar(40))
-------------------------------------------------------------
--/H Returns the InsideMask value corresponding to a name
-------------------------------------------------------------
--/T The InsideMask values can be shown with Select * from InsideMask 
--/T <br>
--/T Sample call to find photo objects which are masked
--/T <samp> 
--/T <br> select top 10 objID, insideMask 
--/T <br> from PhotoObj 
--/T <br> where (dbo.fInsideMask('INMASK_BLEEDING') & insideMask) > 0 
--/T </samp> 
--/T <br> see also fInsideMaskN
-------------------------------------------------------------
RETURNS tinyint
AS BEGIN
RETURN ( SELECT cast(value as tinyInt)
	FROM InsideMask
	WHERE name = UPPER(@name)
	)
END
GO
/****** Object:  UserDefinedFunction [dbo].[fInsideMaskN]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fInsideMaskN](@value tinyint)
---------------------------------------------------
--/H Returns the expanded InsideMask corresponding to the bits, as a string
---------------------------------------------------
--/T the InsideMask can be shown with Select * from InsideMask
--/T <br>
--/T Sample call to display the insideMask setting of some photoObjs
--/T <samp> 
--/T <br> select top 10 objID, dbo.fInsideMaskN(insideMask) as mask
--/T <br> from PhotoObj 
--/T </samp> 
--/T <br> see also fInsideMask
-------------------------------------------------------------
RETURNS varchar(1000)
BEGIN
    DECLARE @bit tinyint, @mask tinyint, @out varchar(2000);
    SET @bit=7;
    SET @out ='';
    WHILE (@bit>0)
	BEGIN
	    SET @bit = @bit-1;
	    SET @mask = power(2,@bit);
	    SET @out = @out + (CASE 
		WHEN (@mask & @value)=0 THEN '' 
		ELSE coalesce((select name from InsideMask where value=@mask),'')+' '
	    	END);
	END
    RETURN @out;
END
GO
/****** Object:  UserDefinedFunction [dbo].[fIsNumbers]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 
CREATE FUNCTION [dbo].[fIsNumbers] (@string varchar(8000), @start int, @stop int)
-----------------------------------------------------------------
--/H Check that the substring is a valid number.
--
--/T <br>fIsNumbers(string, start, stop) Returns 
--/T <LI>  -1: REAL (contains decimal point) ([+|-]digits.digits)
--/T <LI>   0: not a number
--/T <LI>   1: BIGINT    ([+|-] 19 digits)
--/T <br>
--/T <samp>  select dbo.fIsNumbers('123;',1,3); 
--/T <br>  select dbo.fIsNumbers('10.11;'1,5);</samp>
-----------------------------------------------------------------
RETURNS INT
AS BEGIN 
	DECLARE @offset int,		-- current offfset in string
		@char	char,		-- current char in string
		@dot	int,		-- flag says we saw a dot.
		@num	int;		-- flag says we saw a digit
	SET @dot = 0;			--
	SET @num = 0;			--
	SET @offset = @start;		-- 
	IF (@stop > len(@string)) RETURN 0;  -- stop if past end
	SET @char = substring(@string,@offset,1); -- handle sign
	IF(@char ='+' or @char='-') SET @offset = @offset + 1;
	------------------
	-- process number
	------------------
	WHILE (@offset <= @stop)			-- loop over digits
	BEGIN								-- get next char
		SET @char = substring(@string,@offset,1);
		IF (@char = '.') 				-- if a decimal point
		BEGIN 							-- reject duplicate
			IF (@dot = 1) RETURN 0;
			SET @dot = 1;	-- set flag
			SET @offset = @offset + 1;  -- advance
		END 		-- end dot case
	 	ELSE IF (@char<'0' or '9' <@char)  -- if not digit
			RETURN 0;					-- reject
		ELSE 							-- it's a digit
		BEGIN							-- advance
		   	SET @offset = @offset + 1;
			SET @num= 1;				-- set digit flag
		END 							-- end digit case
	END 								-- end loop
	----------------------------
	-- test for bigint overflow	
	----------------------------
	IF (@stop-@start > 19) RETURN 0;	-- reject giant numbers
	IF  (@dot = 0 and  @stop-@start >= 19 )
	BEGIN								-- if its a bigint
		IF ( ((@stop-@start)>19) or		-- reject if too big
			('9223372036854775807' > substring(@string,@start,@stop)))
		   RETURN 0;					--
	END 								-- end bigint overflow test
	IF (@num = 0) RETURN 0;				-- complain if no digits
	IF (@dot = 0) RETURN 1; 			-- number ok, is it an int 
	RETURN -1 ;							-- or a float?
END
GO
/****** Object:  UserDefinedFunction [dbo].[fLambdaFromEq]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fLambdaFromEq](@ra float,@dec float)
------------------------------------------------------------
--/H Returns lambda from ra,dec
------------------------------------------------------------
--/D This is the generic service function for SDSS specific
--/D coordinate conversions. It derives all the coordinates
--/D from the ra,dec, based on the definition of the primary
--/D areas of the stripes. For the Southern stripes, it returns
--/D a mu value shifted by 360 degrees, in order to have a
--/D non-negative and monotonic quantity.
------------------------------------------------------------
RETURNS float
AS BEGIN
    DECLARE 
	@cx float, @cy float, @cz float,
	@lambda float, @eta float, 
        @stripeEta float;
    --
    SET @cx = cos(radians(@dec))* cos(radians(@ra-95.0));
    SET @cy = cos(radians(@dec))* sin(radians(@ra-95.0));
    SET @cz = sin(radians(@dec));
    --
    SET @lambda = -degrees(asin(@cx));
    IF (@cy = 0.0 and @cz = 0.0)
        SET @cy = 1e-16;
    SET @eta    =  degrees(atn2(@cz,@cy))-32.5;
    SET @stripeEta = @eta;
    --
    IF @lambda < -180.0 SET @lambda = @lambda+360.0;
    IF @lambda >= 180.0 SET @lambda = @lambda-360.0;
    IF ABS(@lambda) > 90.0
       BEGIN
           SET @lambda = 180.0-@lambda;
           SET @eta = @eta+180.0;
       END
    IF @lambda < -180.0 SET @lambda = @lambda+360.0;
    IF @lambda >= 180.0 SET @lambda = @lambda-360.0;
    IF @eta < 0.0 SET @eta = @eta+360.0;
    IF @eta >= 360.0 SET @eta = @eta-360.0;
    IF ABS(@lambda) = 90.0 SET @eta = 0.0;
    IF @eta < -180.0 SET @eta = @eta+360.0;
    IF @eta >= 180.0 SET @eta = @eta-360.0;
    IF @eta > 90.0-32.5
       BEGIN
           SET @eta = @eta-180.0;
           SET @lambda = 180.0-@lambda;
       END
    IF @lambda < -180.0 SET @lambda = @lambda+360.0;
    IF @lambda >= 180.0 SET @lambda = @lambda-360.0;
    --
    RETURN @lambda
END
GO
/****** Object:  UserDefinedFunction [dbo].[fMagToFlux]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fMagToFlux](@mag real, @band int)
-------------------------------------------------------------------------------
--/H Convert Luptitudes to AB flux in nJy
-------------------------------------------------------------------------------
--/T  Computes the AB flux for a magnitude given in the
--/T  sinh system. The flux is expressed in nanoJy.
--/T  Needs the @mag value for the specific band. 
--/T  @band is 0..4 for u'..z''.
--/T  <br><samp>dbo.fMagToFlux(21.576975,2)</samp>
--/T <br> see also fMagToFluxErr
-------------------------------------------------------------------------------
RETURNS real
AS
BEGIN
    DECLARE @counts1 float, @counts2 float, @bparm float;
    SET @bparm = (CASE @band
	WHEN 0 THEN 1.4E-10
	WHEN 1 THEN 0.9E-10
	WHEN 2 THEN 1.2E-10
	WHEN 3 THEN 1.8E-10
	WHEN 4 THEN 7.4E-10
	END);
    IF (@mag < -99.0 ) 
	SET @mag = 1.0;
    SET @counts1 = (@mag/ -1.0857362048) - LOG(@bparm);
    SET @counts2 = @bparm * 3630.78 * (EXP(@counts1) - EXP(-@counts1));  -- implement SINH()
    RETURN 1.0E9* @counts2;
END

GO
/****** Object:  UserDefinedFunction [dbo].[fMagToFluxErr]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fMagToFluxErr](@mag real, @err real, @band int)
-------------------------------------------------------------------------------
--/H Convert the error in luptitudes to AB flux in nJy
-------------------------------------------------------------------------------
--/T  Computes the flux error for a magnitude and its error
--/T  expressed in the sinh system. Returns the error in nJy units.
--/T  Needs the @mag value as well as the error for the
--/T  specific band. @band is 0..4 for u'..z''.
--/T  <br><samp>dbo.fMagToFluxErr(21.576975,0.17968324,2)
--/T  </samp>
--/T <br> see also fMagToFlux
-------------------------------------------------------------------------------
RETURNS real
AS
BEGIN
    DECLARE @flux real, @bparm float;
    SET @bparm = (CASE @band
	WHEN 0 THEN 1.4E-10
	WHEN 1 THEN 0.9E-10
	WHEN 2 THEN 1.2E-10
	WHEN 3 THEN 1.8E-10
	WHEN 4 THEN 7.4E-10
	END);
    IF (@mag < -99.0 )
	SET @err = 1.0;
    SET @flux = (SELECT dbo.fMagToFlux(@mag,@band));
    RETURN @err*SQRT(power(@flux,2)+ 4.0E18*power(3630.78*@bparm,2))/1.0857362048;
END

GO
/****** Object:  UserDefinedFunction [dbo].[fMaskType]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fMaskType](@name varchar(40))
-------------------------------------------------------------------------------
--/H Returns the MaskType value, indexed by name 
-------------------------------------------------------------------------------
--/T the MaskType names can be found with 
--/T <br>       Select * from MaskType 
--/T <br>
--/T Sample call to fMaskType.
--/T <samp> 
--/T <br> select top 10 *  
--/T <br> from Mask
--/T <br> where type =  dbo.fMaskType('Star')
--/T </samp> 
--/T <br> see also fMaskTypeN
-------------------------------------------------------------
RETURNS INTEGER
AS BEGIN
RETURN ( SELECT value
	FROM MaskType
	WHERE name = UPPER(@name)
	)
END
GO
/****** Object:  UserDefinedFunction [dbo].[fMaskTypeN]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fMaskTypeN](@value int)
-------------------------------------------------------------------------------
--/H Returns the MaskType name, indexed by value (0=Bleeding Mask, 1=Bright Star Mask, etc.)
-------------------------------------------------------------------------------
--/T the MaskType values can be found with 
--/T <br>       Select * from MaskType 
--/T <br>
--/T Sample call to fMaskTypeN.
--/T <samp> 
--/T <br> select top 10 m.maskID, o.objID, dbo.fMaskTypeN(m.type) as type 
--/T <br> from Mask m JOIN MaskedObject o ON m.maskID=o.maskID
--/T </samp> 
--/T <br> see also fMaskType
-------------------------------------------------------------
RETURNS varchar(40)
AS BEGIN
RETURN ( SELECT name
	FROM MaskType
	WHERE value = @value
	)
END
GO
/****** Object:  UserDefinedFunction [dbo].[fMathGetBin]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[fMathGetBin](@x [float], @x1 [float], @x2 [float], @NumBin [int], @HasOpenUpperBound [bit])
RETURNS [float] WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [CosmologyCASJOBS].[SQLMathCLR.SQLMathFunctions].[GetBin]
GO
/****** Object:  UserDefinedFunction [dbo].[fMJD]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fMJD](@SpecID bigint)
-----------------------------------------------------------------
--/H Extracts MJD from an SDSS Spec ID
--
--/T The bit-fields (starting from bit# 63) and their lengths are: <br>
--/T     plate[14] - bits 50-63 for the plate number, <br>
--/T     fiber[12]  - bits 38-49 for (MJD - 50000), <br>
--/T     mjd[14] - bits 24-37 for the fiberid, <br>
--/T     run2d[14] - bits 10-23 for the spec2d rerun, and <br>
--/T     0         - bits 0-9 unused in SpecObj, used for line/redshift/index
--/T                 in other tables. <br>
--/T <samp> select top 10 dbo.fMJD(plateID) as plate from PlateX </samp>
-----------------------------------------------------------------
RETURNS INT
AS BEGIN
	DECLARE @two BIGINT
	SET @two = 2;
	RETURN ( cast(((@SpecID & 0x0000003FFFFFFFFF) / power(@two,24)) AS INT) + 50000 );
END  

GO
/****** Object:  UserDefinedFunction [dbo].[fMJDToGMT]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fMJDToGMT](@mjd float)
-------------------------------------------------------------- 
--/H Computes the String of a Modified Julian Date. 
-------------------------------------------------------------------------------
--/T From http://serendipity.magnet.ch/hermetic/cal_stud/jdn.htm 
--/T String has the format yyyy-mm-dd:hh:mm:ss.sssss 
--/T <PRE>select dbo.fMjdToGMT(49987.0)</PRE>
-- 
-- test cases
-- select dbo.fMjdToGMT(0)     		-- 1858-11-17:0:0:0
-- select dbo.fMjdToGMT(0.5)   		-- 1858-11-17:12:0:0
-- select dbo.fMjdToGMT(15020)   	-- 1900-1-1:0:0:0
-- select dbo.fMjdToGMT(51543)   	-- 1999-12-31:0:0:0
-- select dbo.fMjdToGMT(51544)   	-- 2000-1-1:0:0:0
-- select dbo.fMjdToGMT(99999) 		-- 2132-8-31:0:0:0
-- select dbo.fMjdToGMT(99999.5) 	-- 2132-8-31:12:0:0
-- select dbo.fMjdToGMT(100000)		-- 2132-9-1:0:0:0
-- change history: fixed "off by 12 hours" bug  2002-8-9
----------------------------------------------------------------
RETURNS varchar(32)
AS BEGIN 
    DECLARE @jd int, @l int, @n int,@i int, @j int,
	    @rem real, @days bigint, @d int ,@m int,
	    @y int, @hr int, @min int, @sec float; 
    SET @jd = @mjd + 2400000.5 + .5   -- convert from MDJ to JD  (the .5 fudge makes it work).
    SET @l = @jd + 68569; 
    SET @n = ( 4 * @l ) / 146097;
    SET @l = @l - ( 146097 * @n + 3 ) / 4;
    SET @i = ( 4000 * ( @l + 1 ) ) / 1461001 ;
    SET @l = @l - ( 1461 * @i ) / 4 + 31 ;
    SET @j = ( 80 * @l ) / 2447;
    SET @d = (@l - ( 2447 * @j ) / 80);  
    SET @l = @j / 11;
    SET @m = @j + 2 - ( 12 * @l );
    SET @y = 100 * ( @n - 49 ) + @i + @l;
    SET @rem =  @mjd - floor(@mjd) -- extract hh:mm:ss.sssssss  
    SET @hr = 24*@rem 
    SET @min = 60*(24*@rem -@hr) 
    SET @sec = 60*(60*(24*@rem -@hr)-@min) 
    RETURN (cast(@y as varchar(4)) + '-' + 
                right('00'+cast(@m as varchar(2)),2) + '-' + 
                right('00'+cast(@d as varchar(2)),2) + ' ' + 
                right('00'+cast(@hr as varchar(2)),2) + ':' + 
                right('00'+cast(@min as varchar(2)),2) + ':' + 
                right('000000'+ltrim(cast(str(@sec,5,3) as varchar(6))),6)); 
END 

GO
/****** Object:  UserDefinedFunction [dbo].[fMuFromEq]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fMuFromEq](@ra float,@dec float)
------------------------------------------------------------
--/H Returns mu from ra,dec
------------------------------------------------------------
--/D This is the generic service function for SDSS specific
--/D coordinate conversions. It derives all the coordinates
--/D from the ra,dec, based on the definition of the primary
--/D areas of the stripes. For the Southern stripes, it returns
--/D a mu value shifted by 360 degrees, in order to have a
--/D non-negative and monotonic quantity.
------------------------------------------------------------
RETURNS float
AS BEGIN
    DECLARE 
	@cx float, @cy float, @cz float,
	@qx float, @qy float, @qz float,
	@eta float, 
	@stripe int, @incl float,
	@mu float;
    --
    SET @cx = cos(radians(@dec))* cos(radians(@ra-95.0));
    SET @cy = cos(radians(@dec))* sin(radians(@ra-95.0));
    SET @cz = sin(radians(@dec));
    --
    SET @eta    =  degrees(atn2(@cz,@cy))
    SET @eta	= @eta -32.5;
    IF  @eta<-180 SET @eta = @eta+360;
    SET @stripe = 23 + floor(@eta/2.5+0.5);
    -- 
    SET @incl = (@stripe-10)*2.5;
    IF  @stripe>50 SET @incl = (@stripe-82)*2.5;
    --
    SET @qx = @cx;
    SET @qy = @cy*cos(radians(@incl))+@cz*sin(radians(@incl));
    SET @qz =-@cy*sin(radians(@incl))+@cz*cos(radians(@incl));
    --
    SET @mu = degrees(atn2(@qy,@qx))+95.0;
    IF  @stripe>50 SET @mu = @mu+360;
    --
    RETURN @mu
END
GO
/****** Object:  UserDefinedFunction [dbo].[fMuNuFromEq]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fMuNuFromEq](
	@ra float,
	@dec float,
	@stripe int,
	@node float,
	@incl float
)
RETURNS @coord TABLE (mu float, nu float)
----------------------------------------------------
--/H Compute stripe coordinates from Equatorial
-- 
--/T Compute mu, nu from @ra,@dec, @node,@incl
----------------------------------------------------
AS BEGIN
    DECLARE
	@rra float, @rdec float, @rin float,
	@mu float, @nu float,
	@qx float, @qy float, @qz float,
	@gx float, @gy float, @gz float;

    -- convert to radians
    SET @rin  = RADIANS(@incl);
    SET @rra  = RADIANS(@ra-@node);
    SET @rdec = RADIANS(@dec);
    --
    SET @qx   = cos(@rra)*cos(@rdec);
    SET @qy   = sin(@rra)*cos(@rdec);
    SET @qz   = sin(@rdec);
    --
    SET @gx =  @qx;
    SET @gy =  @qy*cos(@rin)+@qz*sin(@rin);
    SET @gz = -@qy*sin(@rin)+@qz*cos(@rin);
    --
    SET @nu = DEGREES(ASIN(@gz));
    SET @mu = DEGREES(ATN2(@gy,@gx)) + @node;
    IF  @mu<0 SET @mu = @mu+360 ;
    IF  @stripe>50 AND @mu<180 SET @mu = @mu+360 ;
    --
    INSERT @coord VALUES(@mu, @nu);
    RETURN
END
GO
/****** Object:  UserDefinedFunction [dbo].[fNormalizeString]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fNormalizeString](@s VARCHAR(8000)) 
RETURNS VARCHAR(8000)
-------------------------------------------------------------
--/H Returns string upshifted, squeezed blanks, trailing zeros 
--/H removed, and blank added on end
-------------------------------------------------------------
--/T <br>select dbo.fNormalizeString('Region Convex   3.0000   5  7') 
--/T <br> returns                    'REGION CONVEX 3.0 5 7 '
--/T </samp>  
-------------------------------------------------------------
AS	
BEGIN
	DECLARE @i int;
	-----------------------------------------------------
	-- discard leading and trailing blanks, and upshift
	-----------------------------------------------------
	SET @s = ltrim(rtrim(upper(@s))) + ' '
	---------------------------
	-- eliminate trailing zeros
	---------------------------
	SET @i = patindex('%00 %', @s)
	----------------------
	-- trim trailing zeros
	----------------------
	WHILE(@i >0)			
 	BEGIN
 		SET @s = replace(@s, '0 ', ' ') 
 		SET @i = patindex('%00 %', @s)
 	END
	----------------------------
	-- eliminate multiple blanks
	----------------------------
	SET @i = patindex('%  %', @s)
	---------------------
	-- trim double blanks
	---------------------
	WHILE(@i >0)			
 	BEGIN
 		SET @s = replace(@s, '  ', ' ')
 		SET @i = patindex('%  %', @s)
 	END
	------------------
	-- drop minus zero
	------------------
 	SET @s = replace(@s, '-0.0 ', '0.0 ') 
	RETURN @s 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fNuFromEq]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fNuFromEq](@ra float,@dec float)
------------------------------------------------------------
--/H Returns nu from ra,dec
------------------------------------------------------------
--/D This is the generic service function for SDSS specific
--/D coordinate conversions. It derives all the coordinates
--/D from the ra,dec, based on the definition of the primary
--/D areas of the stripes. For the Southern stripes, it returns
--/D a mu value shifted by 360 degrees, in order to have a
--/D non-negative and monotonic quantity.
------------------------------------------------------------
RETURNS float
AS BEGIN
    DECLARE 
	@cy float, @cz float,
	@qz float,
	@eta float, 
	@stripe int, @incl float,
	@nu float;
    --
    SET @cy = cos(radians(@dec))* sin(radians(@ra-95.0));
    SET @cz = sin(radians(@dec));
    --
    SET @eta    =  degrees(atn2(@cz,@cy))
    SET @eta	= @eta -32.5;
    IF  @eta<-180 SET @eta = @eta+360;
    --
    SET @stripe = 23 + floor(@eta/2.5+0.5);
    -- 
    SET @incl = (@stripe-10)*2.5;
    IF  @stripe>50 SET @incl = (@stripe-82)*2.5;
    --
    SET @qz =-@cy*sin(radians(@incl))+@cz*cos(radians(@incl));
    --
    SET @nu = degrees(asin(@qz));
    --
    RETURN @nu
END
GO
/****** Object:  UserDefinedFunction [dbo].[fObj]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fObj](@ObjID bigint)
-------------------------------------------------------------------------------
--/H Extracts Obj from an SDSS Photo Object ID.
--
--/T The bit-fields and their lengths are: Skyversion[5] Rerun[11] Run[16] Camcol[3] First[1] Field[12] Obj[16]<br>
--/T <samp> select top 10 objId, dbo.fObj(objId) as fObj from Galaxy</samp>
-------------------------------------------------------------------------------
RETURNS INT
AS BEGIN
    RETURN ( cast( ((@ObjID / power(cast(2 as bigint),0)) & 0x0000FFFF) AS INT));
END

GO
/****** Object:  UserDefinedFunction [dbo].[fObjID]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fObjID](@objID bigint)
-------------------------------------------------------------------------------
--/H Match an objID to a PhotoObj and set/unset the first field bit.
--
--/T Given an objID this function determines whether there is a
--/T PhotoObj with a matching (skyversion, run, rerun, camcol, field, 
--/T obj) and returns the objID with the first field bit set properly
--/T to correspond to that PhotoObj.  It returns 0 if there is
--/T no corresponding PhotoObj.  It does not matter whether the
--/T first field bit is set or unset in the input objID.
-------------------------------------------------------------------------------
RETURNS BIGINT
AS BEGIN
    DECLARE @firstfieldbit bigint;
    SET @firstfieldbit = 0x0000000010000000;
    SET @objID = @objID & ~@firstfieldbit;
    IF (select count_big(*) from PhotoTag WITH (nolock) where objID = @objID) > 0
        RETURN @objID
    ELSE
    BEGIN
        SET @objID = @objID + @firstfieldbit;
        IF (select count_big(*) from PhotoTag WITH (nolock) where objID = @objID) > 0
            RETURN @objID
    END
    RETURN cast(0 as bigint)
END

GO
/****** Object:  UserDefinedFunction [dbo].[fObjidFromSDSS]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fObjidFromSDSS](@skyversion int, @run int, @rerun int, @camcol int, @field int, @obj int)
-------------------------------------------------------------------------------
--/H Computes the long objID from the 5-part SDSS numbers.
--
--/T The bit-fields and their lengths are skyversion[5] + rerun[11] + run[16] + Camcol[3] + firstfield[1] + field[12] + obj[16]<br>
--/T The firstfield is assumed to be 0, see also fObjidFromSDSSWithFF.<br>
--/T <samp> SELECT dbo.fObjidFromSDSS(2,94,301,1,11,9) AS fObjid</samp>
-------------------------------------------------------------------------------
RETURNS BIGINT
AS BEGIN
    DECLARE @two bigint, @sky int;
    SET @two = 2;
    SET @sky = @skyversion;
    IF @skyversion=-1 SET @sky=15;
    RETURN ( cast(@sky*power(@two,59) + @rerun*power(@two,48) + 
	@run*power(@two,32) + @camcol*power(@two,29) + 
	@field*power(@two,16)+@obj as bigint));
END

GO
/****** Object:  UserDefinedFunction [dbo].[fObjidFromSDSSWithFF]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fObjidFromSDSSWithFF](@skyversion int, @run int, @rerun int, 
				     @camcol int, @field int, @obj int, 
				     @firstfield int = 0)
-------------------------------------------------------------------------------
--/H Computes the long objID from the 5-part SDSS numbers plus the firstfield flag.
--
--/T The bit-fields and their lengths are skyversion[5] + rerun[11] + run[16] + Camcol[3] + firstfield[1]+ field[12] + obj[16]<br>
--/T See also fObjidFromSDSS for version that assumes firstfield = 0.<br>
--/T <samp> SELECT dbo.fObjidFromSDSSWithFF(2,94,301,1,11,9,0) AS fObjid</samp>
-------------------------------------------------------------------------------
RETURNS BIGINT
AS BEGIN
    DECLARE @two bigint, @sky int;
    SET @two = 2;
    SET @sky = @skyversion;
    IF @skyversion=-1 SET @sky=15;
    RETURN ( cast(@sky*power(@two,59) + @rerun*power(@two,48) + 
	@run*power(@two,32) + @camcol*power(@two,29) + 
	@field*power(@two,16)+@firstfield*power(@two,28)+@obj as bigint));
END

GO
/****** Object:  UserDefinedFunction [dbo].[fPhotoDescription]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fPhotoDescription](@ObjectID bigint)
-------------------------------------------------------------------------------
--/H Returns a string indicating Object type and object flags
-------------------------------------------------------------------------------
--/T <PRE> select top 10 dbo.fPhotoDescription(objID) from PhotoObj </PRE>
-------------------------------------------------------------------------------
RETURNS varchar(1000)
BEGIN
	DECLARE @itStatus bigint;
	DECLARE @itFlags bigint ;
	--
	SET @itStatus = (SELECT resolveStatus FROM PhotoObjAll WHERE [objID] = @ObjectID);
	SET @itFlags  = (SELECT  flags FROM PhotoObjAll WHERE [objID] = @ObjectID); 
	RETURN 	(select dbo.fPhotoStatusN(@itSTatus)) +'| '
		+(select dbo.fPhotoFlagsN(@itFlags))+'|';
	END
GO
/****** Object:  UserDefinedFunction [dbo].[fPhotoFlags]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fPhotoFlags](@name varchar(40))
-------------------------------------------------------------
--/H Returns the PhotoFlags value corresponding to a name
-------------------------------------------------------------
--/T the photoFlags can be shown with Select * from PhotoFlags 
--/T <br>
--/T Sample call to find photo objects with saturated pixels is
--/T <samp> 
--/T <br> select top 10 * 
--/T <br> from photoObj 
--/T <br> where flags & dbo.fPhotoFlags('SATURATED') > 0 
--/T </samp> 
--/T <br> see also fPhotoDescription
-------------------------------------------------------------
RETURNS bigint
AS BEGIN
RETURN ( SELECT cast(value as bigint)
	FROM PhotoFlags
	WHERE name = UPPER(@name)
	)
END
GO
/****** Object:  UserDefinedFunction [dbo].[fPhotoFlagsN]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fPhotoFlagsN](@value bigint)
---------------------------------------------------
--/H Returns the expanded PhotoFlags corresponding to the status value as a string
---------------------------------------------------
--/T the photoFlags can be shown with Select * from PhotoFlags 
--/T <br>
--/T Sample call to display the flags of some photoObjs
--/T <samp> 
--/T <br> select top 10 objID, dbo.fPhotoFlagsN(flags) as flags
--/T <br> from photoObj 
--/T </samp> 
--/T <br> see also fPhotoFlags
-------------------------------------------------------------
RETURNS varchar(1000)
BEGIN
    DECLARE @bit int, @mask bigint, @out varchar(2000);
    SET @bit=63;
    SET @out ='';
    WHILE (@bit>0)
	BEGIN
	    SET @bit = @bit-1;
	    SET @mask = power(cast(2 as bigint),@bit);
	    SET @out = @out + (CASE 
		WHEN (@mask & @value)=0 THEN '' 
		ELSE coalesce((select name from PhotoFlags where value=@mask),'')+' '
	    	END);
	END
    RETURN @out;
END
GO
/****** Object:  UserDefinedFunction [dbo].[fPhotoMode]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fPhotoMode](@name varchar(40))
-------------------------------------------------------------------------------
--/H Returns the Mode value, indexed by name (Primary, Secondary, Family, Outside)
-------------------------------------------------------------------------------
--/T the Mode names can be found with 
--/T <br>       Select * from PhotoMode 
--/T <br>
--/T Sample call to fPhotoMode
--/T <samp> 
--/T <br> select top 10 *  
--/T <br> from photoObj
--/T <br> where mode =  dbo.fPhotoMode('PRIMARY')
--/T </samp> 
--/T <br> see also fPhotoModeN
-------------------------------------------------------------
RETURNS INTEGER
AS BEGIN
RETURN ( SELECT value
	FROM PhotoMode
	WHERE name = UPPER(@name)
	)
END
GO
/****** Object:  UserDefinedFunction [dbo].[fPhotoModeN]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fPhotoModeN](@value int)
-------------------------------------------------------------------------------
--/H Returns the Mode name, indexed by value ()
-------------------------------------------------------------------------------
--/T the Mode names can be found with 
--/T <br>       Select * from PhotoMode 
--/T <br>
--/T Sample call to fPhotoModeN
--/T <samp> 
--/T <br> select top 10 *  
--/T <br> from photoObj
--/T <br> where mode =  dbo.fPhotoMode('PRIMARY')
--/T </samp> 
--/T <br> see also fPhotoModeN
-------------------------------------------------------------
RETURNS varchar(40)
AS BEGIN
RETURN ( SELECT name
	FROM PhotoMode
	WHERE value = @value
	)
END
GO
/****** Object:  UserDefinedFunction [dbo].[fPhotoStatus]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fPhotoStatus](@name varchar(40))
-------------------------------------------------------------
--/H Returns the PhotoStatus flag value corresponding to a name
-------------------------------------------------------------
--/T the photoStatus values can be shown with Select * from PhotoStatus 
--/T <br>
--/T Sample call to find "good" photo objects is
--/T <samp> 
--/T <br> select top 10 * 
--/T <br> from photoObj 
--/T <br> where status & dbo.fPhotoStatus('GOOD') > 0 
--/T </samp> 
--/T <br> see also fPhotoStatusN
-------------------------------------------------------------
RETURNS int
AS BEGIN
RETURN ( SELECT cast(value as int)
	FROM PhotoStatus
	WHERE name = UPPER(@name)
	)
END
GO
/****** Object:  UserDefinedFunction [dbo].[fPhotoStatusN]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fPhotoStatusN](@value int)
---------------------------------------------------
--/H Returns the string describing to the status flags in words
---------------------------------------------------
--/T the photoStatus values can be shown with Select * from PhotoStatus  
--/T <br>
--/T Sample call to fPhotoStatusN: 
--/T <samp> 
--/T <br> select top 10 dbo.fPhotoStatusN(status) as status
--/T <br> from photoObj
--/T </samp> 
--/T <br> see also fPhotoStatus
-------------------------------------------------------------
RETURNS varchar(1000)
BEGIN
    DECLARE @bit int, @mask bigint, @out varchar(2000);
    SET @bit=32;
    SET @out ='';
    WHILE (@bit>0)
	BEGIN
	    SET @bit = @bit-1;
	    SET @mask = power(cast(2 as bigint),@bit);
	    SET @out = @out + (CASE 
		WHEN (@mask & @value)=0 THEN '' 
		ELSE coalesce((select name from PhotoStatus where value=@mask),'')+' '
	    	END);
	END
    RETURN @out;
END
GO
/****** Object:  UserDefinedFunction [dbo].[fPhotoType]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fPhotoType](@name varchar(40))
-------------------------------------------------------------------------------
--/H Returns the PhotoType value, indexed by name (Galaxy, Star,...)
-------------------------------------------------------------------------------
--/T the PhotoType names can be found with 
--/T <br>       Select * from PhotoType 
--/T <br>
--/T Sample call to fPhotoType.
--/T <samp> 
--/T <br> select top 10 *  
--/T <br> from photoObj
--/T <br> where type =  dbo.fPhotoType('Star')
--/T </samp> 
--/T <br> see also fPhotoTypeN
-------------------------------------------------------------
RETURNS INTEGER
AS BEGIN
RETURN ( SELECT value
	FROM PhotoType
	WHERE name = UPPER(@name)
	)
END
GO
/****** Object:  UserDefinedFunction [dbo].[fPhotoTypeN]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fPhotoTypeN](@value int)
-------------------------------------------------------------------------------
--/H Returns the PhotoType name, indexed by value (3-> Galaxy, 6-> Star,...)
-------------------------------------------------------------------------------
--/T the PhotoType values can be found with 
--/T <br>       Select * from PhotoType 
--/T <br>
--/T Sample call to fPhotoTypeN.
--/T <samp> 
--/T <br> select top 10 objID, dbo.fPhotoTypeN(type) as type 
--/T <br> from photoObj
--/T </samp> 
--/T <br> see also fPhotoType
-------------------------------------------------------------
RETURNS varchar(40)
AS BEGIN
RETURN ( SELECT name
	FROM PhotoType
	WHERE value = @value
	)
END
GO
/****** Object:  UserDefinedFunction [dbo].[fPlate]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fPlate](@SpecID bigint)
-----------------------------------------------------------------
--/H Extracts plate from an SDSS Spec ID
--
--/T The bit-fields (starting from bit# 63) and their lengths are: <br>
--/T     plate[14] - bits 50-63 for the plate number, <br>
--/T     fiber[12]  - bits 38-49 for (MJD - 50000), <br>
--/T     mjd[14] - bits 24-37 for the fiberid, <br>
--/T     run2d[14] - bits 10-23 for the spec2d rerun, and <br>
--/T     0         - bits 0-9 unused in SpecObj, used for line/redshift/index
--/T                 in other tables. <br>
--/T <samp> select top 10 dbo.fPlate(plateID) as plate from PlateX </samp>
-----------------------------------------------------------------
RETURNS INT
AS BEGIN
	DECLARE @two BIGINT
	SET @two = 2;
	RETURN ( cast( (@SpecID / power(@two,50)) AS INT));
END  

GO
/****** Object:  UserDefinedFunction [dbo].[fPolygonsContainingPointXYZ]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fPolygonsContainingPointXYZ](@x float, @y float, @z float, @buffer_arcmin float)
--------------------------------------------------------
--/H Returns regions containing a given point 
--/U ---------------------------------------------------
--/T The parameters
--/T <li>@x, @y, @z are unit vector of the point on the J2000 celestial sphere. </li>
--/T <li>@buffer_arcmin </li>
--/T <br>Returns empty table if input params are bad.
--/T <br>Returns a table with the columns
--/T <br>RegionID BIGINT NOT NULL PRIMARY KEY
--/T <samp>
--/T SELECT * from fPolygonsContainingPointXYZ(1,0,0)
--/T </samp>
--------------------------------------------------------
RETURNS @region TABLE(RegionID bigint PRIMARY KEY)
AS BEGIN
	DECLARE @arcmin float=7.85 + @buffer_arcmin; -- max radius of polygons
	DECLARE @degree float=@arcmin/60;
	--
	DECLARE @htmTemp TABLE (
		HtmIdStart bigint,
		HtmIdEnd bigint
	);

	INSERT @htmTemp SELECT * FROM dbo.fHtmCoverCircleXyz(@x,@y,@z,@arcmin)
	DECLARE @found table (regionid bigint not null, 
		x float not null, y float not null, z float not null, 
		c float not null, dec float not null);
	--
	INSERT @found 
	SELECT regionid, x, y, z, c, dec 
	FROM @htmTemp c 
	INNER JOIN RegionPatch p ON p.HtmID BETWEEN c.HtmIDStart and c.HtmIDEnd;
	--
	DELETE @found WHERE x*@x + y*@y + z*@z < c;
	--
	INSERT @region SELECT p.regionid
	FROM @found p inner join Region r on r.regionid=p.regionid
	WHERE sph.fRegionContainsXYZ(sph.fGrow(r.regionBinary,@degree),@x,@y,@z)=1;
	
	RETURN
END
GO
/****** Object:  UserDefinedFunction [dbo].[fPrimaryObjID]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fPrimaryObjID](@objID bigint)
-------------------------------------------------------------------------------
--/H Match an objID to a PhotoPrimary and set/unset the first field bit.
--
--/T Given an objID this function determines whether there is a
--/T PhotoPrimary with a matching
--/T (skyversion, run, rerun, camcol, field, obj)
--/T and returns the objID with the first field bit set properly
--/T to correspond to that PhotoPrimary.  It returns 0 if there is
--/T no corresponding PhotoPrimary.  It does not matter whether the
--/T first field bit is set or unset in the input objID.
-------------------------------------------------------------------------------
RETURNS BIGINT
AS BEGIN
    DECLARE @firstfieldbit bigint;
    SET @firstfieldbit = 0x0000000010000000;
    SET @objID = @objID & ~@firstfieldbit;
    IF (select count_big(*) from PhotoPrimary WITH (nolock) where objID = @objID) > 0
        RETURN @objID
    ELSE
    BEGIN
        SET @objID = @objID + @firstfieldbit;
        IF (select count_big(*) from PhotoPrimary WITH (nolock) where objID = @objID) > 0
            RETURN @objID
    END
    RETURN cast(0 as bigint)
END

GO
/****** Object:  UserDefinedFunction [dbo].[fPrimTarget]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fPrimTarget](@name varchar(40))
-------------------------------------------------------------
--/H Returns the PrimTarget value corresponding to a name
-------------------------------------------------------------
--/T the photo and spectro primTarget flags can be shown with Select * from PrimTarget 
--/T <br>
--/T Sample call to find photo objects that are Galaxy primary targets
--/T <samp> 
--/T <br> select top 10 * 
--/T <br> from photoObj 
--/T <br> where primTarget & dbo.fPrimTarget('TARGET_GALAXY') > 0 
--/T </samp> 
--/T <br> see also fSecTarget
-------------------------------------------------------------
RETURNS bigint
AS BEGIN
RETURN ( SELECT cast(value as bigint)
	FROM PrimTarget
	WHERE name = UPPER(@name)
	)
END
GO
/****** Object:  UserDefinedFunction [dbo].[fPrimTargetN]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fPrimTargetN](@value bigint)
---------------------------------------------------
--/H Returns the expanded PrimTarget corresponding to the flag value as a string
---------------------------------------------------
--/T the photo and spectro primTarget flags can be shown with Select * from PrimTarget 
--/T <br>
--/T Sample call to show the target flags of some photoObjects is
--/T <samp> 
--/T <br> select top 10 objId, dbo.fPriTargetN(secTarget) as priTarget
--/T <br> from photoObj 
--/T </samp> 
--/T <br> see also fPrimTarget, fSecTargetN
-------------------------------------------------------------
RETURNS varchar(1000)
BEGIN
    DECLARE @bit int, @mask bigint, @out varchar(2000);
    SET @bit=32;
    SET @out ='';
    WHILE (@bit>0)
	BEGIN
	    SET @bit = @bit-1;
	    SET @mask = power(cast(2 as bigint),@bit);
	    SET @out = @out + (CASE 
		WHEN (@mask & @value)=0 THEN '' 
		ELSE coalesce((select name from PrimTarget where value=@mask),'')+' '
	    	END);
	END
    RETURN @out;
END
GO
/****** Object:  UserDefinedFunction [dbo].[fProgramType]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fProgramType](@name varchar(40))
-------------------------------------------------------------------------------
--/H Return the ProgramType value, indexed by name
-------------------------------------------------------------------------------
--/T the ProgramTypes can be found with 
--/T <br>       Select * from ProgramType
--/T <br>
--/T Sample call to fProgramType.
--/T <samp> 
--/T <br> select top 10  *
--/T <br> from Tile
--/T <br> where programType = dbo.fProgramType('MAIN')
--/T </samp> 
--/T <br> see also fProgramTypeN
-------------------------------------------------------------
RETURNS INTEGER
AS BEGIN
    RETURN ( SELECT value
	FROM ProgramType
	WHERE name = UPPER(@name)
	)
END
GO
/****** Object:  UserDefinedFunction [dbo].[fProgramTypeN]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fProgramTypeN](@value int)
-------------------------------------------------------------------------------
--/H Return the ProgramType name, indexed by value
-------------------------------------------------------------------------------
--/T the ProgramTypes can be found with 
--/T <br>       Select * from ProgramType
--/T <br>
--/T Sample call to fProgramTypeN.
--/T <samp> 
--/T <br> select top 10 dbo.fProgramTypeN(programType) as programType
--/T <br> from Tile
--/T </samp> 
--/T <br> see also fProgramType
-------------------------------------------------------------
RETURNS varchar(40)
AS BEGIN
    RETURN ( SELECT name
	FROM ProgramType
	WHERE value = @value
	)
END
GO
/****** Object:  UserDefinedFunction [dbo].[fPspStatus]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fPspStatus](@name varchar(40))
-------------------------------------------------------------------------------
--/H Returns the PspStatus value, indexed by name
-------------------------------------------------------------------------------
--/T the  PspStatus values can be found with 
--/T <br>       Select * from PspStatus  
--/T <br>
--/T Sample call to fPspStatus.
--/T <samp> 
--/T <br> select top 10 *
--/T <br> from field
--/T <br> where status_r = dbo.fPspStatus('PSF_OK')
--/T </samp> 
--/T <br> see also fPspStatusN
-------------------------------------------------------------
RETURNS INTEGER
AS BEGIN
RETURN ( SELECT value
	FROM PspStatus
	WHERE name = UPPER(@name)
	)
END
GO
/****** Object:  UserDefinedFunction [dbo].[fPspStatusN]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fPspStatusN](@value int)
-------------------------------------------------------------------------------
--/H Returns the PspStatus name, indexed by value
-------------------------------------------------------------------------------
--/T the  PspStatus values can be found with 
--/T <br>       Select * from PspStatus 
--/T <br>
--/T Sample call to fPspStatusN.
--/T <samp> 
--/T <br> select top 10 dbo.fPspStatusN(status_r) as status_r
--/T <br> from field
--/T </samp> 
--/T <br> see also PspStatus
-------------------------------------------------------------
RETURNS varchar(40)
AS BEGIN
RETURN ( SELECT name
	FROM PspStatus
	WHERE value = @value
	)
END
GO
/****** Object:  UserDefinedFunction [dbo].[fRegionContainsPointEq]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fRegionContainsPointEq](@regionID  bigint, @ra float,@dec float)
-------------------------------------------------------------
--/H Returns 1 if specified region contains specified ra,dec 
--/H point, else returns zero.
-- ----------------------------------------------------------
--/T There is no limit on the number of objects returned, 
--/T but there are about 40 per sq arcmin.  
--/T <p>  parameters 
--/T <li> regionid bigint 	 -- Region object identifier
--/T <li> ra float NOT NULL,     -- Right ascension, --/U degrees
--/T <li> dec float NOT NULL,     -- Declination,     --/U degrees
--/T <br>
--/T Sample call to find if regionID 345 contains the North Pole<br>
--/T <samp> 
--/T <br> select dbo.fRegionContainsPointEq(7,0,90)  
--/T </samp> 
--/T <br> see also fRegionContainsPointXYZ
------------------------------------------------------------- 
RETURNS bit 
AS  
BEGIN
	DECLARE @cx float,@cy float,@cz float;
	SET @cx  = COS(RADIANS(@dec))*COS(RADIANS(@ra))
	SET @cy  = COS(RADIANS(@dec))*SIN(RADIANS(@ra))
	SET @cz  = SIN(RADIANS(@dec))	
	IF EXISTS (
		select convexid from Halfspace
		where regionid=@regionid
		  and convexid not in (
			select convexid from HalfSpace h
			where regionid=@regionid
			and @cx*h.x+@cy*h.y+@cz*h.z<h.c 
			)
	) RETURN 1
	--
	RETURN 0
END
GO
/****** Object:  UserDefinedFunction [dbo].[fRegionContainsPointXYZ]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fRegionContainsPointXYZ](@regionID bigint,@cx float,@cy float,@cz float)
-------------------------------------------------------------
--/H Returns 1 if specified region contains specifed x,y,z 
--/H point, else returns zero.
-- -----------------------------------------------------------
--/T There is no limit on the number of objects returned, but 
--/T there are about 40 per sq arcmin.  
--/T <p> parameters 
--/T <li> regionid bigint,     -- Region object identifier
--/T <li> cx float NOT NULL,   -- x,y,z of unit vector to this object
--/T <li> cy float NOT NULL,
--/T <li> cz float NOT NULL,
--/T <br>
--/T Sample call to find if regionID 345 contains the North Pole<br>
--/T <samp> 
--/T <br> select dbo.fRegionContainsPointXYZ(7,0,0,1)  
--/T </samp> 
--/T <br> see also fRegionContainsPointEq  
-------------------------------------------------------------
RETURNS bit 
AS  
BEGIN	
	IF EXISTS (
		select convexid from Halfspace
		where regionid=@regionid
		  and convexid not in (
			select convexid from HalfSpace h
			where regionid=@regionid
			and @cx*h.x+@cy*h.y+@cz*h.z<h.c 
			)
	) RETURN 1
	--
	RETURN 0
END
GO
/****** Object:  UserDefinedFunction [dbo].[fRegionFuzz]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fRegionFuzz](@d float, @buffer float) 
RETURNS float
-------------------------------------------------------------
--/H Returns a displacement that expands a circle by the "buffer"
-------------------------------------------------------------
--/T Buffer is the expansion in arc minutes
--/T Result is range limited to [-1 .. 1]
--/T <br>  The following exampe adds 1 minute fuzz to the hemisphere.
--/T <samp>select dbo.fRegionFuzz(0,1)       
--/T </samp>  
-------------------------------------------------------------
AS  BEGIN 
	DECLARE @fuzzR float;
	SET @fuzzR = RADIANS(@buffer/60.00000000);
	-----------------------------------------
	-- convert it to a normal form (blank separated trailing blank, upper case)
	-----------------------------------------
	IF @d >  1 SET @d = 1
	IF @d < -1 SET @d = -1
	SET @d = CASE 	WHEN ACOS(@d) + @fuzzR <PI() 
		  	THEN COS(ACOS(@d)+@fuzzR) 
		  	ELSE -1 
		 END 
	RETURN @d
END
GO
/****** Object:  UserDefinedFunction [dbo].[fRegionGetObjectsFromRegionId]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fRegionGetObjectsFromRegionId]( @regionID  bigint, @flag int)
-------------------------------------------------------------
--/H Returns various objects within a region given by a regionid
--/U ---------------------------------------------------
--/T <p> returns a table of two columns
--/T <br> objID bigint          -- Object ID from PhotoObjALl,  
--/T <br> flag int		-- the flag of the object type<br>
--/T (@flag&1)>0 display specObj<br>
--/T (@flag&2)>0 display photoPrimary<br>
--/T (@flag&4)>0 display Target <br>
--/T (@flag&8)>0 display Mask<br>
--/T (@flag&32)>0 display photoPrimary and secondary<br>
--/T thus: @flag=7 will display all three of specObj, PhotoObj and Target
--/T the returned objects have 
--/T          flag = (specobj:1, photoobj:2, target:4, mask:8)
--/T <br>Sample call to find all objects in region 75<br>
--/T <samp> 
--/T select * from dbo.fRegionGetObjectsFromRegionID(75,15)  
--/T </samp> 
--------------------------------------------------------
RETURNS  @objects table (id bigint NOT NULL, flag int NOT NULL, PRIMARY KEY(flag,id) )
AS  
BEGIN	
		DECLARE @area varchar(8000);
		------------------------------------
		-- fetch the regionString
		------------------------------------
		SELECT @area = regionString FROM Region with (nolock)
		WHERE regionid = @regionid;
		------------------------------------
		-- extract HTMrange for Cover
		------------------------------------
		DECLARE @htmrange TABLE (
			htmidstart bigint,
			htmidend bigint
		)
		INSERT @htmrange
		  SELECT * 
		  FROM dbo.fHtmCoverRegion(@area)
		------------------------------------
		-- extract Halfspace of region
		------------------------------------
		DECLARE @halfspace TABLE (
			convexid int,
			x float,
			y float,
			z float,
			c float 
		)
		--
		INSERT @halfspace	
		SELECT convexid, x,y,z,c 
		FROM Halfspace
		WHERE regionid=@regionid
		-----------------------------
		-- the objects from cover
		-----------------------------
		DECLARE @prefetch TABLE (
			id bigint,
			cx float,
			cy float,
			cz float,
			flag tinyint
		)
		------------------------------------
		-- ready to execute the query
		------------------------------------
		IF ( (@flag & 1)>0 )  -- specObj
		BEGIN
			INSERT @prefetch
			SELECT q.specobjid as id, q.cx, q.cy, q.cz,1
			FROM @htmrange c, SpecObj q with (nolock)
			WHERE q.htmID between c.HtmIdStart and c.HtmIdEnd
		END
		-----------------------------------------
		IF ( (@flag & 2) > 0 )  -- photoObj
		BEGIN
			INSERT @prefetch
			SELECT q.objid as id, q.cx, q.cy, q.cz, 2
  			FROM @htmrange c, PhotoPrimary q 
			WHERE q.htmID between c.HtmIdStart and c.HtmIdEnd
		END
		-----------------------------------------
		IF ( (@flag & 4) > 0 )  -- target
		BEGIN
			INSERT @prefetch
			SELECT q.targetid as id, q.cx, q.cy, q.cz, 4
  			FROM @htmrange c, Target q 
			WHERE q.htmID between c.HtmIdStart and c.HtmIdEnd
		END
		-----------------------------------------
		IF ( (@flag & 8) > 0 )  -- mask
		BEGIN
			INSERT @prefetch
			SELECT q.maskid as id, q.cx, q.cy, q.cz, 8
  			FROM @htmrange c, Mask q
			WHERE q.htmID between c.HtmIdStart and c.HtmIdEnd
		END
		-----------------------------------------
		IF ( (@flag & 32) > 0 )  -- photoPrimary and Secondary
		BEGIN
			INSERT @prefetch
			SELECT q.objid as id, q.cx, q.cy, q.cz, 32
  			FROM @htmrange c, PhotoObjAll q
			WHERE q.htmID between c.HtmIdStart and c.HtmIdEnd
			  and q.mode in (1,2)
		END
		----------------------------------------------
		-- now filter objects on the correct boundary
		----------------------------------------------
		INSERT @Objects
		SELECT	o.id, o.flag
		    FROM @prefetch o
		    WHERE exists (
				select convexid from @halfspace
				where convexid not in (
					select convexid from @halfspace h
					where o.cx*h.x+o.cy*h.y+o.cz*h.z<h.c 
					)
			)
		---------------------------------------------
		RETURN  
END
GO
/****** Object:  UserDefinedFunction [dbo].[fRegionGetObjectsFromString]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fRegionGetObjectsFromString](
	@poly varchar(max), @flag int, @buffer float
)
--------------------------------------------------------
--/H Returns various objects within a region given by a string
--/U ---------------------------------------------------
--/T The parameter @buffer, given in arcmins, corresponds
--/T to an expansion the search region beyond of each 
--/T boundary by that amount.
--/T (@flag&1)>0 display specObj ...<br>
--/T (@flag&2)>0 display photoPrimary...<br>
--/T (@flag&4)>0 display Target <br>
--/T (@flag&8)>0 display Mask<br>
--/T (@flag&32)>0 display photoPrimary and secondary<br>
--/T thus: @flag=7 will display all three of specObj, PhotoObj and Target
--/T the returned objects have 
--/T          flag = (specobj:1, photoobj:2, target:4, mask:8)
--------------------------------------------------------
RETURNS  @objects table(id bigint NOT NULL,flag int NOT NULL,PRIMARY KEY(flag,id))
AS BEGIN
		DECLARE @bin varbinary(max);
		------------------------
		-- get the regionBinary
		------------------------
		SELECT @bin=sph.fGrow(
			sph.fSimplifyString(@poly),@buffer/60)
		------------------------------------
		-- extract Halfspace of region
		------------------------------------
		DECLARE @halfspace TABLE (
			convexid int,
			x float,
			y float,
			z float,
			c float 
		)
		INSERT @halfspace
		  SELECT convexid,x,y,z,c 
		  FROM sph.fGetHalfspaces(@bin)
		------------------------------------
		-- extract HTMrange for Cover
		------------------------------------
		DECLARE @htmrange TABLE (
			htmidstart bigint,
			htmidend bigint
		)
		INSERT @htmrange
		  SELECT * 
		  FROM dbo.fHtmCoverRegion(sph.fGetRegionString(@bin))
		-----------------------------
		-- the objects from cover
		-----------------------------
		DECLARE @prefetch TABLE (
			id bigint,
			cx float,
			cy float,
			cz float,
			flag tinyint
		)
		------------------------------------
		-- ready to execute the query
		------------------------------------
		IF ( (@flag & 1)>0 )  -- specObj
		BEGIN
			INSERT @prefetch
			SELECT q.specobjid as id, q.cx, q.cy, q.cz,1
			FROM @htmrange c, SpecObj q with (nolock)
			WHERE q.htmID between c.HtmIdStart and c.HtmIdEnd
		END
		-----------------------------------------
		IF ( (@flag & 2) > 0 )  -- photoObj
		BEGIN
			INSERT @prefetch
			SELECT q.objid as id, q.cx, q.cy, q.cz, 2
  			FROM @htmrange c, PhotoPrimary q 
			WHERE q.htmID between c.HtmIdStart and c.HtmIdEnd
		END
		-----------------------------------------
		IF ( (@flag & 4) > 0 )  -- target
		BEGIN
			INSERT @prefetch
			SELECT q.targetid as id, q.cx, q.cy, q.cz, 4
  			FROM @htmrange c, Target q 
			WHERE q.htmID between c.HtmIdStart and c.HtmIdEnd
		END
		-----------------------------------------
		IF ( (@flag & 8) > 0 )  -- mask
		BEGIN
			INSERT @prefetch
			SELECT q.maskid as id, q.cx, q.cy, q.cz, 8
  			FROM @htmrange c, Mask q
			WHERE q.htmID between c.HtmIdStart and c.HtmIdEnd
		END
		-----------------------------------------
		IF ( (@flag & 32) > 0 )  -- photoPrimary and Secondary
		BEGIN
			INSERT @prefetch
			SELECT q.objid as id, q.cx, q.cy, q.cz, 32
  			FROM @htmrange c, PhotoObjAll q
			WHERE q.htmID between c.HtmIdStart and c.HtmIdEnd
			  and q.mode in (1,2)
		END
		----------------------------------------------
		-- now filter objects on the correct boundary
		----------------------------------------------
		INSERT @Objects
		SELECT	o.id, o.flag
		    FROM @prefetch o
		    WHERE exists (
				select convexid from @halfspace
				where convexid not in (
					select convexid from @halfspace h
					where o.cx*h.x+o.cy*h.y+o.cz*h.z<h.c 
					)
			)
		---------------------------------------------
		RETURN  
END
GO
/****** Object:  UserDefinedFunction [dbo].[fRegionOverlapId]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fRegionOverlapId](@regionid bigint,
	@otherid bigint, @buffer float)
--------------------------------------------------------
--/H Returns the overlap of a given region overlapping another one
--/U ---------------------------------------------------
--/T The parameters
--/T <li>@regionid is the region we want to intersect with
--/T <li>@otherid is the region of interest 
--/T <li>@buffer is the amount the regionString is grown in arcmins.</li>
--/T <br>Returns a blob with the overlap region,
--/T <br>NULL if there are no intersections,
--/T <br>NULL if input params are bad.
--/T <samp>
--/T SELECT * from fRegionOverlapId(1049,6078,0.0)
--/T </samp>
--------------------------------------------------------
RETURNS varbinary(max) 
AS BEGIN
	----------------------------------------------------
	-- representation of the input region after the fuzz
	----------------------------------------------------
	RETURN (
		SELECT  sph.fIntersect(a.regionBinary,
			sph.fGrow(b.regionBinary,@buffer/60.0)) bin
		FROM Region a, Region b
		WHERE a.regionid=@regionid
			and b.regionid=@otherid
	)
END
GO
/****** Object:  UserDefinedFunction [dbo].[fRegionsContainingPointEq]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fRegionsContainingPointEq](
	@ra float, @dec float, 
	@types varchar(1000), @buffer float)
--------------------------------------------------------
--/H Returns regions containing a given point 
--/U ---------------------------------------------------
--/T The parameters
--/T <li>@ra, @dec the equatorial coordinats on the J2000 celestial sphere. </li>
--/T <li>@types is a varchar(1000) space-separated string of the desired region types.
--/T <br> Possible types are: SEGMENT STRIPE TIGEOM PLATE CAMCOL RUN STAVE CHUNK TILE TILEBOX SECTOR SECTORLET SKYBOX WEDGE.</li>
--/T <li>@buffer is the "fuzz" in arcmins around that poiont.</li>
--/T <br>Returns a table with the columns
--/T <br>Returns empty table if input params are bad.
--/T <br>regionid bigint NOT NULL PRIMARY KEY
--/T <br>type     varchar(16) NOT NULL
--/T <samp>
--/T SELECT * from dbo.fGetRegionsContainingPointEq(195,2.5,'STAVE',0)
--/T </samp>
--------------------------------------------------------
RETURNS @Objects TABLE(	regionid bigint PRIMARY KEY, 
			type 	 varchar(16) NOT NULL)
AS BEGIN
	--------------------------------
	-- transform to xyz coordinates
	--------------------------------
	DECLARE @x float, @y float, @z float;
	SET @x  = COS(RADIANS(@dec))*COS(RADIANS(@ra))
	SET @y  = COS(RADIANS(@dec))*SIN(RADIANS(@ra))
	SET @z  = SIN(RADIANS(@dec))
	-- call the xyz function
	INSERT @Objects
	    SELECT * FROM dbo.fRegionsContainingPointXYZ(@x,@y,@z,@types,@buffer)
	RETURN
END
GO
/****** Object:  UserDefinedFunction [dbo].[fRegionsContainingPointXYZ]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fRegionsContainingPointXYZ](
	@x float, @y float, @z float, 
	@types VARCHAR(1000), @buffer float
)
--------------------------------------------------------
--/H Returns regions containing a given point 
--/U ---------------------------------------------------
--/T The parameters
--/T <li>@x, @y, @z are unit vector of the point on the J2000 celestial sphere. </li>
--/T <li>@types is a varchar(1000) space-separated string of the desired region types.
--/T <br> Possible types are: SEGMENT STRIPE TIGEOM PLATE CAMCOL RUN STAVE CHUNK TILE TILEBOX SECTOR SECTORLET SKYBOX WEDGE.</li>
--/T <li>@buffer is the "fuzz" in arcmins around that poiont.</li>
--/T <br>Returns a table with the coulums
--/T <br>Returns empty table if input params are bad.
--/T <br>RegionID BIGINT NOT NULL PRIMARY KEY
--/T <br>Type     VARCHAR(16) NOT NULL
--/T <samp>
--/T SELECT * from fGetRegionsContainingPointXYZ(0,0,0,'STAVE',0)
--/T </samp>
--------------------------------------------------------
RETURNS @Objects TABLE(	
		regionid 	bigint PRIMARY KEY, 
		type 		varchar(16) NOT NULL
	)
AS BEGIN
	----------------------------------------------------
	DECLARE @typesTable TABLE (
		type varchar(16) 
		COLLATE SQL_Latin1_General_CP1_CI_AS 
		NOT NULL  PRIMARY KEY
	);
	----------------------------------------------------
	SET @types = REPLACE(@types,',',' ');
	INSERT @typesTable (type)
	    SELECT * FROM dbo.fTokenStringToTable(@types) 
	IF (@@rowcount = 0) RETURN
	----------------------------------------
	-- this contains the prefetched convexes
	-- matching the type constraint
	----------------------------------------
	DECLARE @region TABLE (
		regionid bigint PRIMARY KEY,
		type varchar(16)
	)
	----------------------------
	-- bounding circle test
	----------------------------
	INSERT @region
	SELECT regionid, min(type)
	FROM (
	    select regionid, convexId, patch, type 
	    from RegionConvex with (nolock)
	    where type in (select type from @typesTable)
 	      and 2*DEGREES(ASIN(sqrt(
			power(@x-x,2)+power(@y-y,2)+power(@z-z,2)
			)/2)) <(radius+@buffer)/60
	    ) o
	GROUP BY regionid
	----------------------------
	-- do the proper test
	----------------------------
	INSERT @objects
	SELECT a.regionid,a.type
	FROM Region r, @region a
	WHERE r.regionid=a.regionid
	  and sph.fRegionContainsXYZ(
		sph.fGrow(r.regionBinary,@buffer/60), @x,@y,@z)=1
	------------------------------------------
	RETURN
END
GO
/****** Object:  UserDefinedFunction [dbo].[fRegionsIntersectingBinary]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fRegionsIntersectingBinary](@types varchar(1000), @rBinary varbinary(max))
-------------------------------------------------------------
--/H Search for regions intersecting a given region,
--/H specified by a regionBinary.
-------------------------------------------------------------
--/T Regions are found within the RegionPatch table using the HTM 
--/T index. If @rBinary is present, @rString is ignored.
--/T Returns the regionid and the type.
--/T <samp>
--/T select * from dbo.fRegionsIntersectingBinary('STRIPE, STAVE, TILE', @bin)
--/T </samp>
-------------------------------------------------
RETURNS @out TABLE (
	regionid bigint NOT NULL, 
	isMask tinyint NOT NULL,
	type varchar(16) NOT NULL,
	comment varchar(1024) NOT NULL
	)
AS BEGIN
	--
	DECLARE @bin varbinary(max), @a float, @radius float;
	------------------------------
	-- check if region valid
	------------------------------
	IF (@rBinary is not null)
	BEGIN
		IF (coalesce(sph.fGetArea(@rBinary),0) = 0) RETURN;
	END
	---------------------------
	-- parse the types
	---------------------------
	DECLARE @typesTable TABLE (
		type varchar(16) 
		COLLATE SQL_Latin1_General_CP1_CI_AS 
		NOT NULL  PRIMARY KEY,
		radius float NOT NULL
	);
	----------------------------------------------------
	SET @types = REPLACE(@types,',',' ');
	INSERT @typesTable (type, radius)
	    SELECT *, 0 FROM dbo.fTokenStringToTable(@types) 
	IF (@@rowcount = 0) RETURN
	--
	UPDATE @typesTable
		SET radius = q.radius
	FROM @typesTable t, RegionTypes q
	WHERE t.type=q.type
	--
	DECLARE @htm TABLE (
		HtmIdStart bigint not null,
		HtmIdEnd bigint not null
	);

	DECLARE @region TABLE (
		regionid bigint NOT NULL
		);

	----------------------------------------
	-- fetch the POLYGONs through HTM
	----------------------------------------
	IF EXISTS (select * from @typesTable where type='POLYGON')
	BEGIN
		SELECT @radius = radius/60 
		FROM RegionTypes
		WHERE type='POLYGON'
		--
		SELECT @bin = sph.fGrow(@rBinary,@radius);
		--
		DELETE @htm;
		--
		INSERT @htm 
		SELECT htmIdStart, htmIdEnd 
		FROM dbo.fHtmCoverBinaryAdvanced(@rBinary)
		--
		INSERT @region
		SELECT distinct r.regionid
		FROM @htm h, RegionPatch r WITH (nolock)
		WHERE htmid BETWEEN h.htmIdStart AND h.htmIdEnd
		  and r.type='POLYGON'
		--
		DELETE @typesTable where type='POLYGON';
		--
	END
	----------------------------------------
	-- fetch the TILE etc through HTM
	----------------------------------------
	IF EXISTS (select * from @typesTable where type in ('PLATE', 'PLATEALL', 'TILE', 'TILEALL'))
	BEGIN
		--
		SELECT @radius = radius/60 
		FROM RegionTypes
		WHERE type='TILE'
		--
		SELECT @bin = sph.fGrow(@rBinary,@radius);
		--
		DELETE @htm;
		--
		INSERT @htm 
		SELECT htmIdStart, htmIdEnd 
		FROM dbo.fHtmCoverBinaryAdvanced(@rBinary)
		--
		INSERT @region
		SELECT distinct r.regionid
		FROM @htm h, RegionPatch r WITH (nolock)
		WHERE htmid BETWEEN h.htmIdStart AND h.htmIdEnd
		  and r.type in ('PLATE', 'PLATEALL', 'TILE', 'TILEALL')
		  and r.type in (select type from @typesTable)
		--
		DELETE @typesTable where type in ('PLATE', 'PLATEALL', 'TILE', 'TILEALL');
	END
	--------------------------------------------------
	-- Insert the remaining region types to be tested
	-- Use RegionPatch because of the type index.
	--------------------------------------------------
	INSERT @region
	SELECT distinct r.regionid
	FROM RegionPatch r, @typesTable t
	WHERE r.type=t.type
	-------------------------------
	-- add the remaining types
	-- to be searched
	-------------------------------
	INSERT @out
	SELECT r.regionid, r.isMask, r.type, r.comment
	FROM @region h, Region r
	WHERE r.regionid=h.regionid
		  and sph.fIntersect(r.regionBinary,@rBinary) is not null
	
	RETURN
END
GO
/****** Object:  UserDefinedFunction [dbo].[fRegionsIntersectingString]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fRegionsIntersectingString](@types varchar(1000), @rString varchar(max))
-------------------------------------------------------------
--/H Search for regions intersecting a given region,
--/H specified by a regionString.
-------------------------------------------------------------
--/T Regions are found within the RegionPatch table using the HTM 
--/T index. If @rBinary is present, @rString is ignored.
--/T Returns the regionid and the type.
--/T <samp>
--/T select * from dbo.fRegionsIntersectingString('STRIPE, STAVE, TILE', @str)
--/T </samp>
-------------------------------------------------
RETURNS @out TABLE (
	regionid bigint PRIMARY KEY, 
	isMask tinyint,
	type varchar(16),
	comment varchar(1024)
	)
AS BEGIN
	--
	DECLARE @rBinary varbinary(max), @a float;
	------------------------------
	-- check if region valid
	------------------------------
	IF (@rString = '') RETURN;
	--
	SELECT @rBinary = sph.fSimplifyString(@rString);
	IF (@rBinary is not null)
	BEGIN
		SELECT @a = sph.fGetArea(@rBinary);
		IF (@a is null or @a=0) RETURN;
	END
	-----------------------------------------------------
	-- call the function with the regionBinary argument
	-----------------------------------------------------
	INSERT @out
	SELECT * FROM dbo.fRegionsIntersectingBinary(@types, @rBinary);
	--
	RETURN
END
GO
/****** Object:  UserDefinedFunction [dbo].[fReplace]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

--
CREATE FUNCTION [dbo].[fReplace](@oldstr VARCHAR(8000), @pattern VARCHAR(1000), @replacement VARCHAR(1000))
------------------------------------------------
--/H Case-insensitve string replacement
------------------------------------------------
--/T Used by the SQL parser stored procedures.
------------------------------------------------
RETURNS varchar(8000) 
AS
BEGIN 
	-------------------------------------
	DECLARE @newstr varchar(8000);
	SET @newstr = '';
	IF (LTRIM(@pattern) = '') GOTO done;
	-----------------------------------
	DECLARE @offset int,
			@patlen int,
			@lowold varchar(8000),
			@lowpat varchar(8000);
	SET @lowold = LOWER(@oldstr);
	SET @lowpat = LOWER(@pattern);
	SET @patlen = LEN(@pattern);
	SET @offset = 0
	--
	WHILE (CHARINDEX(@lowpat,@lowold, 1) != 0 )
	BEGIN
		SET @offset	= CHARINDEX(@lowpat, @lowold, 1);
		SET @newstr	= @newstr + SUBSTRING(@oldstr,1,@offset-1) + @replacement;
		SET @oldstr	= SUBSTRING(@oldstr, @offset+@patlen, LEN(@oldstr)-@offset+@patlen);
		SET @lowold	= SUBSTRING(@lowold, @offset+@patlen, LEN(@lowold)-@offset+@patlen);
	END
	-----------------------------------------
done:	RETURN( @newstr + @oldstr);
END

GO
/****** Object:  UserDefinedFunction [dbo].[fReplaceMax]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE FUNCTION [dbo].[fReplaceMax](@oldstr VARCHAR(max), @pattern VARCHAR(1000), @replacement VARCHAR(1000))
------------------------------------------------
--/H Case-insensitve string replacement for varchar(max)
------------------------------------------------
--/T Used by the SQL parser stored procedures.
------------------------------------------------
RETURNS varchar(max) 
AS
BEGIN 
	-------------------------------------
	DECLARE @newstr varchar(max);
	SET @newstr = '';
	IF (LTRIM(@pattern) = '') GOTO done;
	-----------------------------------
	DECLARE @offset int,
			@patlen int,
			@lowold varchar(max),
			@lowpat varchar(max);
	SET @lowold = LOWER(@oldstr);
	SET @lowpat = LOWER(@pattern);
	SET @patlen = LEN(@pattern);
	SET @offset = 0
	--
	WHILE (CHARINDEX(@lowpat,@lowold, 1) != 0 )
	BEGIN
		SET @offset	= CHARINDEX(@lowpat, @lowold, 1);
		SET @newstr	= @newstr + SUBSTRING(@oldstr,1,@offset-1) + @replacement;
		SET @oldstr	= SUBSTRING(@oldstr, @offset+@patlen, LEN(@oldstr)-@offset+@patlen);
		SET @lowold	= SUBSTRING(@lowold, @offset+@patlen, LEN(@lowold)-@offset+@patlen);
	END
	-----------------------------------------
done:	RETURN( @newstr + @oldstr);
END
GO
/****** Object:  UserDefinedFunction [dbo].[fRerun]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fRerun](@ObjID bigint)
-------------------------------------------------------------------------------
--/H Extracts Rerun from an SDSS Photo Object ID
--
--/T The bit-fields and their lengths are: Skyversion[5] Rerun[11] Run[16] Camcol[3] First[1] Field[12] Obj[16]<br>
--/T <samp> select top 10 objId, dbo.fRerun(objId) as fRerun from Galaxy</samp>
-------------------------------------------------------------------------------
RETURNS INT
AS BEGIN
    RETURN ( cast( ((@ObjID / power(cast(2 as bigint),48)) & 0x000007FF) AS INT));
END

GO
/****** Object:  UserDefinedFunction [dbo].[fResolveStatus]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fResolveStatus](@name varchar(40))
-------------------------------------------------------------------------------
--/H Return the ResolveStatus flag value, indexed by name
-------------------------------------------------------------------------------
--/T the ResolveStatus values can be shown with Select * from ResolveStatus 
--/T <br>
--/T Sample call to fResolveStatus
--/T <samp> 
--/T <br> select top 10 objID, dbo.fResolveStatusN(resolveStatus)
--/T <br> from   PhotoObj
--/T <br> where  resolveStatus & dbo.fResolveStatus('RUN_EDGE') > 0  
--/T </samp> 
--/T <br> see also fResolveStatusN
-------------------------------------------------------------
RETURNS int
AS BEGIN
    RETURN ( SELECT cast(value as int)
	FROM ResolveStatus
	WHERE name = UPPER(@name)
	)
END
GO
/****** Object:  UserDefinedFunction [dbo].[fResolveStatusN]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fResolveStatusN](@value int)
-------------------------------------------------------------------------------
--/H Return the expanded ResolveStatus corresponding to the flag value as a string
-------------------------------------------------------------------------------
--/T the ResolveStatus values can be shown with Select * from ResolveStatus 
--/T <br>
--/T Sample call to fResolveStatusN
--/T <samp> 
--/T <br> select top 10 objID, dbo.fResolveStatus(mask) as rstatus
--/T <br> from  PhotoObj
--/T </samp> 
--/T <br> see also fResolveStatus 
-------------------------------------------------------------
RETURNS varchar(1000)
BEGIN
    DECLARE @bit int, @mask bigint, @out varchar(2000);
    SET @bit=32;
    SET @out ='';
    WHILE (@bit>0)
	BEGIN
	    SET @bit = @bit-1;
	    SET @mask = power(cast(2 as bigint),@bit);
	    SET @out = @out + (CASE 
		WHEN (@mask & @value)=0 THEN '' 
		ELSE coalesce((select name from ResolveStatus where value=@mask),'')+' '
	    	END);
	END
    RETURN @out;
END
GO
/****** Object:  UserDefinedFunction [dbo].[fRotateV3]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fRotateV3](@mode varchar(16),@cx float,@cy float,@cz float)
-------------------------------------------------------
--/H Rotates a 3-vector by a given rotation matrix
--  --------------------------------------------------
--/T 
--/T 
-------------------------------------------------------
RETURNS @v3 TABLE (
	x float NOT NULL, 
	y float NOT NULL, 
	z float NOT NULL
)
AS BEGIN
    -- 
    DECLARE @x float, @y float, @z float;
    --
    SELECT @x=x*@cx+y*@cy+z*@cz FROM Rmatrix WHERE mode=@mode and row=1;
    SELECT @y=x*@cx+y*@cy+z*@cz FROM Rmatrix WHERE mode=@mode and row=2;
    SELECT @z=x*@cx+y*@cy+z*@cz FROM Rmatrix WHERE mode=@mode and row=3;
    --
    INSERT @v3 SELECT @x as x, @y as y, @z as z
    RETURN
END
GO
/****** Object:  UserDefinedFunction [dbo].[fRun]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fRun](@ObjID bigint)
-------------------------------------------------------------------------------
--/H Extracts Run from an SDSS Photo Object ID
--
--/T The bit-fields and their lengths are: Skyversion[5] Rerun[11] Run[16] Camcol[3] First[1] Field[12] Obj[16]<br>
--/T <samp> select top 10 objId, dbo.fRun(objId) as fRun from Galaxy</samp>
-------------------------------------------------------------------------------
RETURNS INT
AS BEGIN
    RETURN ( cast( ((@ObjID / power(cast(2 as bigint),32)) & 0x0000FFFF) AS INT));
END  

GO
/****** Object:  UserDefinedFunction [dbo].[fSDSS]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fSDSS](@objid bigint)
-------------------------------------------------------------------------------
--/H Computes the 6-part SDSS numbers from the long objID
--
--/T The bit-fields and their lengths are skyversion[5] + rerun[11] + run[16] + camcol[3] + first[1] + field[12] + obj[16]<br>
--/T <samp> select top 5 dbo.fSDSS(objid) as SDSS from PhotoObj</samp>
-------------------------------------------------------------------------------
RETURNS varchar(64)
AS BEGIN
    RETURN (
	cast(dbo.fSkyVersion(@objid) as varchar(6))+'-'+
	cast(dbo.fRun(@objid) as varchar(6))+'-'+
	cast(dbo.fRerun(@objid) as varchar(6))+'-'+
	cast(dbo.fCamcol(@objid) as varchar(6))+'-'+
	cast(dbo.fField(@objid) as varchar(6))+'-'+
	cast(dbo.fObj(@objid) as varchar(6))
	);
END

GO
/****** Object:  UserDefinedFunction [dbo].[fSDSSfromObjID]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fSDSSfromObjID](@objid bigint)
-------------------------------------------------------------------------------
--/H Returns a table pf the 6-part SDSS numbers from the long objID.
--
--/T The returned columns in the output table are: 
--/T	skyversion, rerun, run, camcol, firstField, field, obj<br>
--/T <samp> select * from dbo.fSDSSfromObjID(objid)</samp>
-------------------------------------------------------------------------------
RETURNS @sdssObjID TABLE (
	skyVersion TINYINT,
	run INT,
	rerun INT,
	camcol TINYINT,
	firstField TINYINT,
	field INT,
	obj INT
)
AS BEGIN
    DECLARE @ffMask BIGINT, @ffBit TINYINT
    SET @ffMask = 0x0000000010000000;
    IF (@objID & @ffMask) > 0
	SET @ffBit = 1
    ELSE
	SET @ffBit = 0;
    INSERT @sdssObjID 
	SELECT
	    cast( ((@ObjID / power(cast(2 as bigint),59)) & 0x0000000F) AS INT) AS skyVersion,
	    cast( ((@ObjID / power(cast(2 as bigint),32)) & 0x0000FFFF) AS INT) AS run,
	    cast( ((@ObjID / power(cast(2 as bigint),48)) & 0x000007FF) AS INT) AS rerun,
	    cast( ((@ObjID / power(cast(2 as bigint),29)) & 0x00000007) AS INT) AS camcol,
	    @ffBit AS firstField,
	    cast( ((@ObjID / power(cast(2 as bigint),16)) & 0x00000FFF) AS INT) AS field,
	    cast( ((@ObjID / power(cast(2 as bigint),0)) & 0x0000FFFF) AS INT) AS obj
    RETURN
END

GO
/****** Object:  UserDefinedFunction [dbo].[fSDSSfromSpecID]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fSDSSfromSpecID](@specID bigint)
-------------------------------------------------------------------------------
--/H Returns a table pf the 3-part SDSS numbers from the long specObjID.
--
--/T The returned columns in the output table are: 
--/T	plate, mjd, fiber<br>
--/T <samp> select * from dbo.fSDSSfromSpecID(865922932356966400)</samp>
-------------------------------------------------------------------------------
RETURNS @sdssSpecID TABLE (
	plate INT,
	mjd INT,
	fiber INT
)
AS BEGIN
    INSERT @sdssSpecID 
	SELECT
	    cast( (@specID / power(cast(2 as bigint),50)) AS INT ) AS plate,
	    cast( (((@specID & 0x0000003FFFFFFFFF)/ power(cast(2 as bigint),24)) + 50000) AS INT ) AS mjd,
	    cast( (((@specID & 0x0003FFFFFFFFFFFF) / power(cast(2 as bigint),38))) AS INT) AS fiber
    RETURN
END

GO
/****** Object:  UserDefinedFunction [dbo].[fSecTarget]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fSecTarget](@name varchar(40))
-------------------------------------------------------------
--/H Returns the SecTarget value corresponding to a name
-------------------------------------------------------------
--/T the photo and spectro secTarget flags can be shown with Select * from SecTarget 
--/T <br>
--/T Sample call to find photo objects that are Galaxy primary targets
--/T <samp> 
--/T <br> select top 10 * 
--/T <br> from photoObj 
--/T <br> where secTarget & dbo.fsecTarget('TARGET_SPECTROPHOTO_STD') > 0 
--/T </samp> 
--/T <br> see also fPrimTarget, fSecTargetN
-------------------------------------------------------------
RETURNS bigint
AS BEGIN
RETURN ( SELECT cast(value as bigint)
	FROM SecTarget
	WHERE name = UPPER(@name)
	)
END
GO
/****** Object:  UserDefinedFunction [dbo].[fSecTargetN]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fSecTargetN](@value bigint)
---------------------------------------------------
--/H Returns the expanded SecTarget corresponding to the flag value as a string
---------------------------------------------------
--/T the photo and spectro secTarget flags can be shown with Select * from SecTarget 
--/T <br>
--/T Sample call to find photo objects that are Galaxy primary targets
--/T <samp> 
--/T <br> select top 10 objId, dbo.fSecTargetN(secTarget) as secTarget
--/T <br> from photoObj 
--/T </samp> 
--/T <br> see also fSecTarget, fPrimTarget
-------------------------------------------------------------
RETURNS varchar(1000)
BEGIN
    DECLARE @bit int, @mask bigint, @out varchar(2000);
    SET @bit=32;
    SET @out ='';
    WHILE (@bit>0)
	BEGIN
	    SET @bit = @bit-1;
	    SET @mask = power(cast(2 as bigint),@bit);
	    SET @out = @out + (CASE 
		WHEN (@mask & @value)=0 THEN '' 
		ELSE coalesce((select name from SecTarget where value=@mask),'')+' '
	    	END);
	END
    RETURN @out;
END
GO
/****** Object:  UserDefinedFunction [dbo].[fSegue1Target1]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fSegue1Target1](@name varchar(40))
-------------------------------------------------------------
--/H Returns the Segue1Target1 value corresponding to a name
-------------------------------------------------------------
--/T the spectro Segue1Target1 flags can be shown with Select * from Segue1Target1 
--/T <br>
--/T Sample call to find spec objects that are cool white dwarf Segue1 primary targets
--/T <samp> 
--/T <br> select top 10 * 
--/T <br> from specObj 
--/T <br> where Segue1Target1 & dbo.fSegue1Target1('SEGUE1_CWD') > 0 
--/T </samp> 
--/T <br> see also fSecTarget
-------------------------------------------------------------
RETURNS bigint
AS BEGIN
RETURN ( SELECT cast(value as bigint)
	FROM Segue1Target1
	WHERE name = UPPER(@name)
	)
END
GO
/****** Object:  UserDefinedFunction [dbo].[fSegue1Target1N]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fSegue1Target1N](@value bigint)
---------------------------------------------------
--/H Returns the expanded Segue1Target1 corresponding to the flag value as a string
---------------------------------------------------
--/T The spectro Segue1Target1 flags can be shown with Select * from Segue1Target1 
--/T <br>
--/T Sample call to show the Segue1 target flags of some spec objects is
--/T <samp> 
--/T <br> select top 10 specObjId, dbo.fSegue1Target1N(Segue1Target1) as Segue1Target1
--/T <br> from specObj 
--/T </samp> 
--/T <br> see also fSegue1Target1, fSecTargetN
-------------------------------------------------------------
RETURNS varchar(1000)
BEGIN
    DECLARE @bit int, @mask bigint, @out varchar(2000);
    SET @bit=32;
    SET @out ='';
    WHILE (@bit>0)
	BEGIN
	    SET @bit = @bit-1;
	    SET @mask = power(cast(2 as bigint),@bit);
	    SET @out = @out + (CASE 
		WHEN (@mask & @value)=0 THEN '' 
		ELSE coalesce((select name from Segue1Target1 where value=@mask),'')+' '
	    	END);
	END
    RETURN @out;
END
GO
/****** Object:  UserDefinedFunction [dbo].[fSegue1Target2]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fSegue1Target2](@name varchar(40))
-------------------------------------------------------------
--/H Returns the Segue1Target2 value corresponding to a name
-------------------------------------------------------------
--/T the spectro Segue1Target2 flags can be shown with Select * from Segue1Target2 
--/T <br>
--/T Sample call to find spec objects that are cool white dwarf Segue1 primary targets
--/T <samp> 
--/T <br> select top 10 * 
--/T <br> from specObj 
--/T <br> where Segue1Target2 & dbo.fSegue1Target2('SEGUE1_REDDENING') > 0 
--/T </samp> 
--/T <br> see also fSecTarget
-------------------------------------------------------------
RETURNS bigint
AS BEGIN
RETURN ( SELECT cast(value as bigint)
	FROM Segue1Target2
	WHERE name = UPPER(@name)
	)
END
GO
/****** Object:  UserDefinedFunction [dbo].[fSegue1Target2N]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fSegue1Target2N](@value bigint)
---------------------------------------------------
--/H Returns the expanded Segue1Target2 corresponding to the flag value as a string
---------------------------------------------------
--/T The spectro Segue1Target2 flags can be shown with Select * from Segue1Target2 
--/T <br>
--/T Sample call to show the Segue1 target flags of some spec objects is
--/T <samp> 
--/T <br> select top 10 specObjId, dbo.fSegue1Target2N(Segue1Target2) as Segue1Target2
--/T <br> from specObj 
--/T </samp> 
--/T <br> see also fSegue1Target2, fSecTargetN
-------------------------------------------------------------
RETURNS varchar(1000)
BEGIN
    DECLARE @bit int, @mask bigint, @out varchar(2000);
    SET @bit=32;
    SET @out ='';
    WHILE (@bit>0)
	BEGIN
	    SET @bit = @bit-1;
	    SET @mask = power(cast(2 as bigint),@bit);
	    SET @out = @out + (CASE 
		WHEN (@mask & @value)=0 THEN '' 
		ELSE coalesce((select name from Segue1Target2 where value=@mask),'')+' '
	    	END);
	END
    RETURN @out;
END
GO
/****** Object:  UserDefinedFunction [dbo].[fSegue2Target1]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fSegue2Target1](@name varchar(40))
-------------------------------------------------------------
--/H Returns the Segue2Target1 value corresponding to a name
-------------------------------------------------------------
--/T the spectro Segue2Target1 flags can be shown with Select * from Segue2Target1 
--/T <br>
--/T Sample call to find spec objects that are red K-giant star SEGUE-2 primary targets
--/T <samp> 
--/T <br> select top 10 * 
--/T <br> from specObj 
--/T <br> where Segue2Target1 & dbo.fSegue2Target1('SEGUE2_REDKG') > 0 
--/T </samp> 
--/T <br> see also fSecTarget
-------------------------------------------------------------
RETURNS bigint
AS BEGIN
RETURN ( SELECT cast(value as bigint)
	FROM Segue2Target1
	WHERE name = UPPER(@name)
	)
END
GO
/****** Object:  UserDefinedFunction [dbo].[fSegue2Target1N]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fSegue2Target1N](@value bigint)
---------------------------------------------------
--/H Returns the expanded Segue2Target1 corresponding to the flag value as a string
---------------------------------------------------
--/T The spectro Segue2Target1 flags can be shown with Select * from Segue2Target1 
--/T <br>
--/T Sample call to show the SEGUE-2 target flags of some spec objects is
--/T <samp> 
--/T <br> select top 10 specObjId, dbo.fSegue2Target1N(Segue2Target1) as segue2Target1
--/T <br> from specObj 
--/T </samp> 
--/T <br> see also fSegue2Target1, fSecTargetN
-------------------------------------------------------------
RETURNS varchar(1000)
BEGIN
    DECLARE @bit int, @mask bigint, @out varchar(2000);
    SET @bit=32;
    SET @out ='';
    WHILE (@bit>0)
	BEGIN
	    SET @bit = @bit-1;
	    SET @mask = power(cast(2 as bigint),@bit);
	    SET @out = @out + (CASE 
		WHEN (@mask & @value)=0 THEN '' 
		ELSE coalesce((select name from Segue2Target1 where value=@mask),'')+' '
	    	END);
	END
    RETURN @out;
END
GO
/****** Object:  UserDefinedFunction [dbo].[fSegue2Target2]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fSegue2Target2](@name varchar(40))
-------------------------------------------------------------
--/H Returns the Segue2Target2 value corresponding to a name
-------------------------------------------------------------
--/T the spectro Segue2Target2 flags can be shown with Select * from Segue2Target2 
--/T <br>
--/T Sample call to find spec objects that are red K-giant star SEGUE-2 primary targets
--/T <samp> 
--/T <br> select top 10 * 
--/T <br> from specObj 
--/T <br> where Segue2Target2 & dbo.fSegue2Target2('SEGUE2_REDDENING') > 0 
--/T </samp> 
--/T <br> see also fSecTarget
-------------------------------------------------------------
RETURNS bigint
AS BEGIN
RETURN ( SELECT cast(value as bigint)
	FROM Segue2Target2
	WHERE name = UPPER(@name)
	)
END
GO
/****** Object:  UserDefinedFunction [dbo].[fSegue2Target2N]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fSegue2Target2N](@value bigint)
---------------------------------------------------
--/H Returns the expanded Segue2Target2 corresponding to the flag value as a string
---------------------------------------------------
--/T The spectro Segue2Target2 flags can be shown with Select * from Segue2Target2 
--/T <br>
--/T Sample call to show the SEGUE-2 target flags of some spec objects is
--/T <samp> 
--/T <br> select top 10 specObjId, dbo.fSegue2Target2N(Segue2Target2) as segue2Target2
--/T <br> from specObj 
--/T </samp> 
--/T <br> see also fSegue2Target2, fSecTargetN
-------------------------------------------------------------
RETURNS varchar(1000)
BEGIN
    DECLARE @bit int, @mask bigint, @out varchar(2000);
    SET @bit=32;
    SET @out ='';
    WHILE (@bit>0)
	BEGIN
	    SET @bit = @bit-1;
	    SET @mask = power(cast(2 as bigint),@bit);
	    SET @out = @out + (CASE 
		WHEN (@mask & @value)=0 THEN '' 
		ELSE coalesce((select name from Segue2Target2 where value=@mask),'')+' '
	    	END);
	END
    RETURN @out;
END
GO
/****** Object:  UserDefinedFunction [dbo].[fSkyVersion]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fSkyVersion](@ObjID bigint)
-------------------------------------------------------------------------------
--/H Extracts SkyVersion from an SDSS Photo Object ID
--
--/T The bit-fields and their lengths are: Skyversion[5] Rerun[11] Run[16] Camcol[3] First[1] Field[12] Obj[16]<br>
--/T <samp> select top 10 objId, dbo.fSkyVersion(objId) as fSkyVersion from Galaxy</samp>
-------------------------------------------------------------------------------
RETURNS INT
AS BEGIN
    RETURN ( cast( ((@ObjID / power(cast(2 as bigint),59)) & 0x0000000F) AS INT));
END

GO
/****** Object:  UserDefinedFunction [dbo].[fSourceType]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fSourceType](@name varchar(40))
-------------------------------------------------------------------------------
--/H Return the SourceType value, indexed by name
-------------------------------------------------------------------------------
--/T the SourceTypes can be found with 
--/T <br>       Select * from SourceType
--/T <br>
--/T Sample call to fSourceType.
--/T <samp> 
--/T <br> select top 10  *
--/T <br> from TiledTarget
--/T <br> where sourceType = dbo.fSourceType('GALAXY')
--/T </samp> 
--/T <br> see also fSourceTypeN
-------------------------------------------------------------
RETURNS INTEGER
AS BEGIN
    RETURN ( SELECT value
	FROM SourceType
	WHERE name = UPPER(@name)
	)
END
GO
/****** Object:  UserDefinedFunction [dbo].[fSourceTypeN]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fSourceTypeN](@value int)
-------------------------------------------------------------------------------
--/H Return the SourceType name, indexed by value
-------------------------------------------------------------------------------
--/T the SourceTypes can be found with 
--/T <br>       Select * from SourceType
--/T <br>
--/T Sample call to fSourceTypeN.
--/T <samp> 
--/T <br> select top 10 dbo.fSourceTypeN(sourceType) as sourceType
--/T <br> from TiledTarget
--/T </samp> 
--/T <br> see also fSourceType
-------------------------------------------------------------
RETURNS varchar(40)
AS BEGIN
    RETURN ( SELECT name
	FROM SourceType
	WHERE value = @value
	)
END
GO
/****** Object:  UserDefinedFunction [dbo].[fSpecDescription]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fSpecDescription](@specObjID bigint)
-------------------------------------------------------------------------------
--/H Returns a string indicating class, status and zWarning for a specObj
-------------------------------------------------------------------------------
--/T <PRE> select top 10 dbo.fSpecDescription(specObjID) from SpecObjAll </PRE>
-------------------------------------------------------------------------------
--- fix by Jim: convert to fSpecZWarningN, fSpecPixMaskN so get strings out.
RETURNS varchar(1000)
BEGIN
	DECLARE @itClass varchar(32), @itZWarning int, @itAnyAndMask int, @itAnyOrMask int;
	--
	SET @itClass  = (SELECT class  FROM SpecObjAll WHERE specObjId=@specObjId);
	SET @itZWarning  = (SELECT zWarning  FROM SpecObjAll WHERE specObjId=@specObjId);
	SET @itAnyAndMask = (SELECT anyAndMask  FROM SpecObjAll WHERE specObjId=@specObjId);
	SET @itAnyOrMask = (SELECT anyOrMask  FROM SpecObjAll WHERE specObjId=@specObjId);
	RETURN 	(select @itClass) +'| '
		+(select dbo.fSpecZWarningN(@itZWarning))+'|'
		+(select dbo.fSpecPixMaskN(@itAnyAndMask))+'|'
		+(select dbo.fSpecPixMaskN(@itAnyOrMask))+'|';
	END
GO
/****** Object:  UserDefinedFunction [dbo].[fSpecialTarget1]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fSpecialTarget1](@name varchar(40))
-------------------------------------------------------------
--/H Returns the SpecialTarget1 value corresponding to a name
-------------------------------------------------------------
--/T the spectro specialTarget1 flags can be shown with Select * from SpecialTarget1 
--/T <br>
--/T Sample call to find spec objects that are low-redshift galaxy special primary targets
--/T <samp> 
--/T <br> select top 10 * 
--/T <br> from specObj 
--/T <br> where specialTarget1 & dbo.fSpecialTarget1('LOWZ_GALAXY') > 0 
--/T </samp> 
--/T <br> see also fSecTarget
-------------------------------------------------------------
RETURNS bigint
AS BEGIN
RETURN ( SELECT cast(value as bigint)
	FROM SpecialTarget1
	WHERE name = UPPER(@name)
	)
END
GO
/****** Object:  UserDefinedFunction [dbo].[fSpecialTarget1N]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fSpecialTarget1N](@value bigint)
---------------------------------------------------
--/H Returns the expanded SpecialTarget1 corresponding to the flag value as a string
---------------------------------------------------
--/T The spectro specialTarget1 flags can be shown with Select * from SpecialTarget1 
--/T <br>
--/T Sample call to show the special target flags of some spec objects is
--/T <samp> 
--/T <br> select top 10 specObjId, dbo.fSpecialTarget1N(specialTarget1) as specialTarget1
--/T <br> from specObj 
--/T </samp> 
--/T <br> see also fSpecialTarget1, fSecTargetN
-------------------------------------------------------------
RETURNS varchar(1000)
BEGIN
    DECLARE @bit int, @mask bigint, @out varchar(2000);
    SET @bit=32;
    SET @out ='';
    WHILE (@bit>0)
	BEGIN
	    SET @bit = @bit-1;
	    SET @mask = power(cast(2 as bigint),@bit);
	    SET @out = @out + (CASE 
		WHEN (@mask & @value)=0 THEN '' 
		ELSE coalesce((select name from SpecialTarget1 where value=@mask),'')+' '
	    	END);
	END
    RETURN @out;
END
GO
/****** Object:  UserDefinedFunction [dbo].[fSpecialTarget2]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fSpecialTarget2](@name varchar(40))
-------------------------------------------------------------
--/H Returns the SpecialTarget2 value corresponding to a name
-------------------------------------------------------------
--/T the spectro specialTarget2 flags can be shown with Select * from SpecialTarget2 
--/T <br>
--/T Sample call to find spec objects that are low-redshift galaxy special primary targets
--/T <samp> 
--/T <br> select top 10 * 
--/T <br> from specObj 
--/T <br> where specialTarget2 & dbo.fSpecialTarget2('GUIDE_STAR') > 0 
--/T </samp> 
--/T <br> see also fSecTarget
-------------------------------------------------------------
RETURNS bigint
AS BEGIN
RETURN ( SELECT cast(value as bigint)
	FROM SpecialTarget2
	WHERE name = UPPER(@name)
	)
END
GO
/****** Object:  UserDefinedFunction [dbo].[fSpecialTarget2N]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fSpecialTarget2N](@value bigint)
---------------------------------------------------
--/H Returns the expanded SpecialTarget2 corresponding to the flag value as a string
---------------------------------------------------
--/T The spectro specialTarget2 flags can be shown with Select * from SpecialTarget2 
--/T <br>
--/T Sample call to show the special target flags of some spec objects is
--/T <samp> 
--/T <br> select top 10 specObjId, dbo.fSpecialTarget2N(specialTarget2) as specialTarget2
--/T <br> from specObj 
--/T </samp> 
--/T <br> see also fSpecialTarget2, fSecTargetN
-------------------------------------------------------------
RETURNS varchar(1000)
BEGIN
    DECLARE @bit int, @mask bigint, @out varchar(2000);
    SET @bit=32;
    SET @out ='';
    WHILE (@bit>0)
	BEGIN
	    SET @bit = @bit-1;
	    SET @mask = power(cast(2 as bigint),@bit);
	    SET @out = @out + (CASE 
		WHEN (@mask & @value)=0 THEN '' 
		ELSE coalesce((select name from SpecialTarget2 where value=@mask),'')+' '
	    	END);
	END
    RETURN @out;
END
GO
/****** Object:  UserDefinedFunction [dbo].[fSpecidFromSDSS]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fSpecidFromSDSS](@plate int, @mjd int, @fiber int, @run2d varchar(32))
-----------------------------------------------------------------
--/H Computes the long Spec IDs from its individual components.
--
--/T The bit-fields (starting from bit# 63) and their lengths are: <br>
--/T     plate[14] - bits 50-63 for the plate number, <br>
--/T     fiber[12]  - bits 38-49 for (MJD - 50000), <br>
--/T     mjd[14] - bits 24-37 for the fiberid, <br>
--/T     run2d[14] - bits 10-23 for the spec2d rerun, and <br>
--/T     0         - bits 0-9 unused in SpecObj, used for line/redshift/index
--/T                 in other tables. <br>
--/T <samp> select dbo.fSpecidFromSDSS(266,51630,145) as specObjID </samp>
-----------------------------------------------------------------
RETURNS BIGINT
AS BEGIN
	declare @rerun int, @n int, @m int, @p int, @index1 int, @index2 int, @two bigint;
	SET @two = 2;
	IF @run2d like 'v%'
		BEGIN
			SET @index1 = CHARINDEX( '_', @run2d, 1 );
			SET @index2 = CHARINDEX( '_', @run2d, @index1+1 );
			SET @n = CAST( SUBSTRING(@run2d, 2, @index1-2) AS INT);
			SET @m = CAST( SUBSTRING(@run2d, @index1+1, @index2-(@index1+1)) AS INT);
			SET @p = CAST( SUBSTRING(@run2d, @index2+1, LEN(@run2d)-@index2) AS INT);
			SET @rerun = ((@n - 5)*10000) + (@m*100) + @p;
		END
	ELSE
		SET @rerun = @run2d;
    RETURN ( cast(
				(@plate*power(@two,50) + @fiber*power(@two,38) + (@mjd - 50000)*power(@two,24)
				+ @rerun*power(@two,10))
			 as bigint) );
END

GO
/****** Object:  UserDefinedFunction [dbo].[fSpecPixMask]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fSpecPixMask](@name varchar(40))
-------------------------------------------------------------------------------
--/H Return the SpecPixMask value, indexed by name
-------------------------------------------------------------------------------
--/T the specPixMask values can be shown with Select * from SpecPixMask 
--/T <br>
--/T Sample call to find spec objects that do not have any pixel with a bit set in its ANDMASK.
--/T <samp> 
--/T <br> select top 10 * 
--/T <br> from   specObj 
--/T <br> where  anyAndMask = dbo.fSpecPixMask('OK')  
--/T </samp> 
--/T <br> see also fSpecPixMaskN
-------------------------------------------------------------
RETURNS INT AS BEGIN
    RETURN ( SELECT cast(value as int)
	FROM SpecPixMask
	WHERE name = UPPER(@name)
	)
END
GO
/****** Object:  UserDefinedFunction [dbo].[fSpecPixMaskN]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fSpecPixMaskN](@value int)
-------------------------------------------------------------------------------
--/H Return the expanded SpecPixMask corresponding to the flag value as a string
-------------------------------------------------------------------------------
--/T the specPixMask values can be shown with Select * from SpecPixMask 
--/T <br>
--/T Sample call to find which pixels have bits set in the ORMASK of some Spec objects   
--/T <samp> 
--/T <br> select top 10 objID,  dbo.fSpecPixMaskN(anyOrMask) as warning
--/T <br> from specObj 
--/T </samp> 
--/T <br> see also fSpecPixMask
-------------------------------------------------------------
RETURNS varchar(1000)
BEGIN
    DECLARE @bit int, @mask bigint, @out varchar(2000);
    SET @bit=32;
    SET @out ='';
    IF @value IS NULL
	RETURN 'NULL';
    IF @value = 0
	RETURN 'OK';
    WHILE (@bit>0)
	BEGIN
	    SET @bit = @bit-1;
	    SET @mask = power(cast(2 as bigint),@bit);
	    SET @out = @out + (CASE 
		WHEN (@mask & @value)=0 THEN '' 
		ELSE coalesce((select name from SpecPixMask where value=@mask),'')+' '
	    	END);
	END
    RETURN @out;
END
GO
/****** Object:  UserDefinedFunction [dbo].[fSpecZWarning]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fSpecZWarning](@name varchar(40))
-------------------------------------------------------------------------------
--/H Return the SpecZWarning value, indexed by name
-------------------------------------------------------------------------------
--/T the specZWarning values can be shown with Select * from SpecZWarning 
--/T <br>
--/T Sample call to find spec objects that do not have warnings
--/T <samp> 
--/T <br> select top 10 * 
--/T <br> from   specObj 
--/T <br> where  zWarning = dbo.fSpecZWarning('OK')  
--/T </samp> 
--/T <br> see also fSpecZWarningN
-------------------------------------------------------------
RETURNS INT AS BEGIN
    RETURN ( SELECT cast(value as int)
	FROM SpecZWarning
	WHERE name = UPPER(@name)
	)
END
GO
/****** Object:  UserDefinedFunction [dbo].[fSpecZWarningN]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fSpecZWarningN](@value int)
-------------------------------------------------------------------------------
--/H Return the expanded SpecZWarning corresponding to the flag value as a string
-------------------------------------------------------------------------------
--/T the specZWarning values can be shown with Select * from SpecZWarning 
--/T <br>
--/T Sample call to find the warnings of some Spec objects   
--/T <samp> 
--/T <br> select top 10 objID,  dbo.fSpecZWarningN(zWarning) as warning
--/T <br> from specObj 
--/T </samp> 
--/T <br> see also fSpecZWarning
-------------------------------------------------------------
RETURNS varchar(1000)
BEGIN
    DECLARE @bit int, @mask bigint, @out varchar(2000);
    SET @bit=32;
    SET @out ='';
    IF @value IS NULL
	RETURN 'NULL';
    IF @value = 0
	RETURN 'OK';
    WHILE (@bit>0)
	BEGIN
	    SET @bit = @bit-1;
	    SET @mask = power(cast(2 as bigint),@bit);
	    SET @out = @out + (CASE 
		WHEN (@mask & @value)=0 THEN '' 
		ELSE coalesce((select name from SpecZWarning where value=@mask),'')+' '
	    	END);
	END
    RETURN @out;
END
GO
/****** Object:  UserDefinedFunction [dbo].[fStripeOfRun]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fStripeOfRun](@run int)
-------------------------------------------------------------
--/H returns Stripe containing a particular run 
-------------------------------------------------------------
--/T <br> run is the run number
--/T <br>
--/T <samp>select top 10 objid, dbo.fStripeOfRun(run) from PhotoObj </samp>
-------------------------------------------------------------
RETURNS int as
  BEGIN
  RETURN (SELECT TOP 1 [stripe] from Run where run = @run)
  END

GO
/****** Object:  UserDefinedFunction [dbo].[fStripeToNormal]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fStripeToNormal](@stripe int)
-------------------------------------------------------
--/H Compute the normal vector from an eta value
--  --------------------------------------------------
--/T 
--/T 
-------------------------------------------------------
RETURNS @v3 TABLE (x float, y float, z float)
AS BEGIN
    --
    DECLARE @x float, @y float, @z float, @eta float;
    --
    IF (@stripe < 0 or @stripe>86) return;
    IF @stripe is null SET @stripe = 10;	-- default is the equator
    --
    SET @eta = CASE 
	WHEN @stripe<50 THEN (@stripe-10)*2.5 -32.5
	ELSE (@stripe-82)*2.5 -32.5
	END;
    --
    SET @x = SIN(RADIANS(@eta));
    SET @y = COS(RADIANS(@eta));
    SET @z = 0.0;
    --
    INSERT @v3 SELECT x, y, z 
	FROM dbo.fRotateV3('S2J',@x, @y, @z)
    RETURN
END
GO
/****** Object:  UserDefinedFunction [dbo].[fStripOfRun]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fStripOfRun](@run int)
-------------------------------------------------------------
--/H returns Strip containing a particular run 
-------------------------------------------------------------
--/T <br> run is the run number
--/T <br>
--/T <samp>select top 10 objid, dbo.fStripOfRun(run) from PhotoObj </samp>
-------------------------------------------------------------
RETURNS int as
  BEGIN
  RETURN (SELECT TOP 1 [strip] from Run where run = @run)
  END

GO
/****** Object:  UserDefinedFunction [dbo].[fTileFileName]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fTileFileName] (@zoom int, 
	@run int, @rerun int,@camcol int, @field int,@imagedir varchar(max))  
-------------------------------------------------------------------------------
--/H Builds the filename for Frame, used in spMakeFrame.
--/A 
--/T Another one of the service functions, used only when loading the database.
-------------------------------------------------------------------------------
RETURNS nvarchar(1000)
AS BEGIN
    DECLARE @TheName nVARCHAR(1000), @field4 char(4), 
	@run6 char(6), @c1 char(1), @z2 char(2),@img varbinary(max),@sql varchar(max);
	-----------------------------------------
	SET @field4 = cast( @field as varchar(4));
	SET @field4 = substring('0000',1,4-len(@field4)) + @field4;
	SET @run6 = cast( @run as varchar(6));
	SET @run6 = substring('000000',1,6-len(@run6)) + @run6;
	SET @z2 = cast( @zoom as varchar(2));
	SET @z2 = substring('00',1,2-len(@z2)) + @z2;
	SET @c1   = cast(@camcol as char(1));
	--
	SET @TheName = @imagedir + @c1 + '\' + 'frame-' + @run6 +'-'
			+ @c1+'-'+cast(@rerun as varchar(4))+'-'
			+ @field4 +'-z'+@z2+ '.jp2';
			

   
	RETURN @TheName;
END
GO
/****** Object:  UserDefinedFunction [dbo].[fTiMask]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fTiMask](@name varchar(40))
-------------------------------------------------------------
--/H Returns the TiMask value corresponding to a name
-------------------------------------------------------------
--/T the TiMask values can be found with 
--/T <br>       Select * from TiMask
--/T <br>
--/T Sample call to fTiMask.
--/T <samp> 
--/T <br> select top 10  *
--/T <br> from TilingInfo
--/T <br> where tiMask = dbo.fTiMask('AR_TMASK_TILED')
--/T </samp> 
--/T <br> see also fTiMaskN
-------------------------------------------------------------
RETURNS int
AS BEGIN
RETURN ( SELECT cast(value as int)
	FROM TiMask
	WHERE name = UPPER(@name)
	)
END
GO
/****** Object:  UserDefinedFunction [dbo].[fTiMaskN]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fTiMaskN](@value int)
---------------------------------------------------
--/H Returns the expanded TiMask corresponding to the flag value as a string
---------------------------------------------------
--/T the TiMask values can be found with 
--/T <br>       Select * from TiMask
--/T <br>
--/T Sample call to fTiMaskN.
--/T <samp> 
--/T <br> select top 10 dbo.fTiMaskN(tiMask) as tiMask
--/T <br> from TilingInfo
--/T </samp> 
--/T <br> see also fTiMask
-------------------------------------------------------------
RETURNS varchar(1000)
BEGIN
    DECLARE @bit int, @mask bigint, @out varchar(2000);
    SET @bit=32;
    SET @out ='';
    WHILE (@bit>0)
	BEGIN
	    SET @bit = @bit-1;
	    SET @mask = power(cast(2 as bigint),@bit);
	    SET @out = @out + (CASE 
		WHEN (@mask & @value)=0 THEN '' 
		ELSE coalesce((select name from TiMask where value=@mask),'')+' '
	    	END);
	END
    RETURN @out;
END
GO
/****** Object:  UserDefinedFunction [dbo].[fTokenAdvance]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fTokenAdvance](@s VARCHAR(8000), @i int) 
RETURNS INT
-------------------------------------------------------------
--/H Get offset of next token after offset @i in string @s
-------------------------------------------------------------
--/T Return 0 if none found.
--/T <br><samp>
--/T <br>select dbo.fTokenNext('REGION CONVEX 3 5 7 ',15 ) 
--/T <br> returns                    '3'
--/T </samp>
--/T <br> see also fTokenNext()  
-------------------------------------------------------------
AS
BEGIN
	DECLARE @j int;
	-----------------------------
	-- eliminate multiple blanks
	-----------------------------
	SET @j = charindex(' ',@s,@i)
	IF (@j >0) RETURN @j+1
	RETURN 0
END
GO
/****** Object:  UserDefinedFunction [dbo].[fTokenNext]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fTokenNext](@s VARCHAR(8000), @i int) 
RETURNS VARCHAR(8000)
-------------------------------------------------------------
--/H Get token starting at offset @i in string @s
-------------------------------------------------------------
--/T Return empty string '' if none found
--/T <br><samp>
--/T <br>select dbo.fTokenNext('REGION CONVEX 3 5 7 ',15 ) 
--/T <br> returns                    '3'
--/T </samp>
--/T <br> see also fTokenAdvance()  
-------------------------------------------------------------
AS
BEGIN
	DECLARE @j INT
	-----------------------------
	-- eliminate multiple blanks
	-----------------------------
	SET @j = charindex(' ',@s,@i)
	IF (@j >0) RETURN ltrim(rtrim(substring(@s,@i,@j-@i)))
	RETURN ''
	END

GO
/****** Object:  UserDefinedFunction [dbo].[fTokenStringToTable]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fTokenStringToTable](@types VARCHAR(8000)) 
RETURNS @tokens TABLE (token VARCHAR(16) NOT NULL)
-------------------------------------------------------------
--/H Returns a table containing the tokens in the input string
-------------------------------------------------------------
--/T Tokens are blank separated.
--/T <samp>select * from dbo.fTokenStringToTable('A B C D E F G H J') 
--/T <br> returns                    a table containing those tokens
--/T </samp>  
-------------------------------------------------------------
AS
BEGIN  
	DECLARE @tokenStart int;
	SET @tokenStart = 1
	SET @types = dbo.fNormalizeString(@types)  
	WHILE (ltrim(dbo.fTokenNext(@types,@tokenStart)) != '')
	BEGIN
		INSERT @tokens VALUES(dbo.fTokenNext(@types,@tokenStart)) 
    	SET    @tokenStart = dbo.fTokenAdvance(@types,@tokenStart)
	END
	RETURN
END
GO
/****** Object:  UserDefinedFunction [dbo].[fVarBinToHex]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fVarBinToHex] (@varBinary varbinary(4000)) 
--------------------------------------------------- 
--/H Returns hexadecimal string of varbinary input
--------------------------------------------------- 
--/T The input is scanned converting nibbles to hex characters
--/T <br> 
--/T <sample> 
--/T          select dbo.fVarBinToHex(0x4532ae1245) 
--/T</sample> 
--------------------------------------------------- 
RETURNS varchar(8000)
AS
BEGIN
	-----------------------------------------------------------------------
    DECLARE	@i      int,              -- index on the @varBinary string 
			@length int,              -- length of input string (bytes) 
			@val    int,              -- next byte from input string 
			@char   char(1),          -- next hex char from input string 
			@ans    varchar(8000)     -- output hex string. 
    ----------------------------------------------------------------------- 
    -- initialize the working variables
	-------------------------------------
    SET @ans = ''                        -- null answer string 
    SET @length = len(@varBinary)        -- byte length of input 
    SET @i = 1                           -- cursor on input string. 
    --------------------------------------------------- 
    -- translate each byte to a pair of hex characters
	---------------------------------------------------
	WHILE (@i <= @length) 
	BEGIN							-- high order nibble 
		SET @val = cast(substring(@varbinary, @i, 1) as int) / 16 
		IF @val < 10 SET @char = cast(@val as char(1)) 
				ELSE SET @char = char (0x41+ @val - 10) 
		--
		SET @ans = @ans + @char		-- low order nibble 
		SET @val = cast(substring(@varbinary, @i, 1) as int) & 0xF 
		IF @val < 10 SET @char = cast(@val as char(1)) 
				ELSE SET @char = char (0x41+ @val - 10) 
		SET @ans = @ans + @char 
		SET @i = @i + 1;			-- go to next byte. 
	END								-- end of byte loop 
	RETURN @ans
END

GO
/****** Object:  UserDefinedFunction [dbo].[fWedgeV3]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE FUNCTION [dbo].[fWedgeV3](@x1 float,@y1 float, @z1 float, @x2 float, @y2 float, @z2 float)
-------------------------------------------------------
--/H Compute the wedge product of two vectors
--  --------------------------------------------------
--/T 
--/T 
-------------------------------------------------------
RETURNS @v3 TABLE (x float, y float, z float)
AS BEGIN
    --
    INSERT @v3 
	SELECT 
	(@y1*@z2 - @y2*@z1) as x,
    	(@x2*@z1 - @x1*@z2) as y,
	(@x1*@y2 - @x2*@y1) as z;
    --
    RETURN
END
GO
/****** Object:  UserDefinedFunction [sph].[fConvexAddHalfspace]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [sph].[fConvexAddHalfspace](@bin [varbinary](max), @cidx [int], @x [float], @y [float], @z [float], @c [float])
RETURNS [varbinary](max) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SphericalSql].[Spherical.Sql.UserDefinedFunctions].[ConvexAddHalfspace]
GO
/****** Object:  UserDefinedFunction [sph].[fDiff]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [sph].[fDiff](@bin [varbinary](max), @bin2 [varbinary](max))
RETURNS [varbinary](max) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SphericalSql].[Spherical.Sql.UserDefinedFunctions].[Difference]
GO
/****** Object:  UserDefinedFunction [sph].[fDiffAdvanced]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [sph].[fDiffAdvanced](@bin [varbinary](max), @bin2 [varbinary](max), @simple_simplify [bit], @convex_eliminate [bit], @convex_disjoint [bit], @convex_unify [bit])
RETURNS [varbinary](max) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SphericalSql].[Spherical.Sql.UserDefinedFunctions].[DifferenceAdvanced]
GO
/****** Object:  UserDefinedFunction [sph].[fGetArcs]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [sph].[fGetArcs](@bin [varbinary](max))
RETURNS  TABLE (
	[ConvexID] [int] NULL,
	[PatchID] [int] NULL,
	[ArcID] [int] NULL,
	[X] [float] NULL,
	[Y] [float] NULL,
	[Z] [float] NULL,
	[C] [float] NULL,
	[X1] [float] NULL,
	[Y1] [float] NULL,
	[Z1] [float] NULL,
	[RA1] [float] NULL,
	[Dec1] [float] NULL,
	[X2] [float] NULL,
	[Y2] [float] NULL,
	[Z2] [float] NULL,
	[RA2] [float] NULL,
	[Dec2] [float] NULL,
	[Draw] [bit] NULL,
	[Length] [float] NULL
) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SphericalSql].[Spherical.Sql.UserDefinedFunctions].[GetArcs]
GO
/****** Object:  UserDefinedFunction [sph].[fGetArea]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [sph].[fGetArea](@bin [varbinary](max))
RETURNS [float] WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SphericalSql].[Spherical.Sql.UserDefinedFunctions].[GetArea]
GO
/****** Object:  UserDefinedFunction [sph].[fGetConvexes]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [sph].[fGetConvexes](@bin [varbinary](max))
RETURNS  TABLE (
	[ConvexID] [int] NULL,
	[RegionBinary] [varbinary](max) NULL
) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SphericalSql].[Spherical.Sql.UserDefinedFunctions].[GetConvexes]
GO
/****** Object:  UserDefinedFunction [sph].[fGetHalfspaces]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [sph].[fGetHalfspaces](@bin [varbinary](max))
RETURNS  TABLE (
	[ConvexID] [int] NULL,
	[HalfspaceID] [int] NULL,
	[X] [float] NULL,
	[Y] [float] NULL,
	[Z] [float] NULL,
	[C] [float] NULL
) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SphericalSql].[Spherical.Sql.UserDefinedFunctions].[GetHalfspaces]
GO
/****** Object:  UserDefinedFunction [sph].[fGetHtmRanges]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [sph].[fGetHtmRanges](@bin [varbinary](max))
RETURNS  TABLE (
	[FullOnly] [bit] NULL,
	[HtmIdStart] [bigint] NULL,
	[HtmIdEnd] [bigint] NULL
) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SphericalSql].[Spherical.Sql.UserDefinedFunctions].[GetHtmRanges]
GO
/****** Object:  UserDefinedFunction [sph].[fGetHtmRangesAdvanced]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [sph].[fGetHtmRangesAdvanced](@bin [varbinary](max), @frac [float], @seconds [float])
RETURNS  TABLE (
	[FullOnly] [bit] NULL,
	[HtmIdStart] [bigint] NULL,
	[HtmIdEnd] [bigint] NULL
) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SphericalSql].[Spherical.Sql.UserDefinedFunctions].[GetHtmRangesAdvanced]
GO
/****** Object:  UserDefinedFunction [sph].[fGetOutlineArcs]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [sph].[fGetOutlineArcs](@bin [varbinary](max))
RETURNS  TABLE (
	[ConvexID] [int] NULL,
	[PatchID] [int] NULL,
	[ArcID] [int] NULL,
	[X] [float] NULL,
	[Y] [float] NULL,
	[Z] [float] NULL,
	[C] [float] NULL,
	[X1] [float] NULL,
	[Y1] [float] NULL,
	[Z1] [float] NULL,
	[RA1] [float] NULL,
	[Dec1] [float] NULL,
	[X2] [float] NULL,
	[Y2] [float] NULL,
	[Z2] [float] NULL,
	[RA2] [float] NULL,
	[Dec2] [float] NULL,
	[Draw] [bit] NULL,
	[Length] [float] NULL
) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SphericalSql].[Spherical.Sql.UserDefinedFunctions].[GetOutlineArcs]
GO
/****** Object:  UserDefinedFunction [sph].[fGetPatches]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [sph].[fGetPatches](@bin [varbinary](max))
RETURNS  TABLE (
	[ConvexID] [int] NULL,
	[PatchID] [int] NULL,
	[RA] [float] NULL,
	[Dec] [float] NULL,
	[Radius] [float] NULL,
	[X] [float] NULL,
	[Y] [float] NULL,
	[Z] [float] NULL,
	[C] [float] NULL,
	[HtmID] [bigint] NULL,
	[Area] [float] NULL,
	[ConvexString] [varbinary](max) NULL
) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SphericalSql].[Spherical.Sql.UserDefinedFunctions].[GetPatches]
GO
/****** Object:  UserDefinedFunction [sph].[fGetRegionString]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [sph].[fGetRegionString](@bin varbinary(max))
-------------------------------------------------------
--/H Returns the regionstring of the specified region.
--/A --------------------------------------------------
--/T Parameter(s):
--/T <li> @bin varbinary(max): region blob
-------------------------------------------------------
RETURNS varchar(max)
AS 
BEGIN 
	RETURN CONVERT(varchar(max),sph.fGetRegionStringBin(@bin))
END

GO
/****** Object:  UserDefinedFunction [sph].[fGetRegionStringBin]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [sph].[fGetRegionStringBin](@bin [varbinary](max))
RETURNS [varbinary](max) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SphericalSql].[Spherical.Sql.UserDefinedFunctions].[GetString]
GO
/****** Object:  UserDefinedFunction [sph].[fGetVersion]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [sph].[fGetVersion]()
RETURNS [nvarchar](4000) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SphericalSql].[Spherical.Sql.UserDefinedFunctions].[GetVersion]
GO
/****** Object:  UserDefinedFunction [sph].[fGetVersions]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [sph].[fGetVersions]()
RETURNS  TABLE (
	[AssemblyName] [nvarchar](128) NULL,
	[Version] [nvarchar](64) NULL,
	[Debuggable] [bit] NULL,
	[JitOptimized] [bit] NULL
) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SphericalSql].[Spherical.Sql.UserDefinedFunctions].[GetVersions]
GO
/****** Object:  UserDefinedFunction [sph].[fGrow]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [sph].[fGrow](@bin [varbinary](max), @degree [float])
RETURNS [varbinary](max) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SphericalSql].[Spherical.Sql.UserDefinedFunctions].[Grow]
GO
/****** Object:  UserDefinedFunction [sph].[fGrowAdvanced]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [sph].[fGrowAdvanced](@bin [varbinary](max), @degree [float], @simple_simplify [bit], @convex_eliminate [bit], @convex_disjoint [bit], @convex_unify [bit])
RETURNS [varbinary](max) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SphericalSql].[Spherical.Sql.UserDefinedFunctions].[GrowAdvanced]
GO
/****** Object:  UserDefinedFunction [sph].[fGrowArc]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [sph].[fGrowArc](@degree [float], @sx [float], @sy [float], @sz [float], @sNorm [bit], @mx [float], @my [float], @mz [float], @mNorm [bit], @ex [float], @ey [float], @ez [float], @eNorm [bit])
RETURNS [varbinary](max) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SphericalSql].[Spherical.Sql.UserDefinedFunctions].[GrowArc]
GO
/****** Object:  UserDefinedFunction [sph].[fIntersect]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [sph].[fIntersect](@bin [varbinary](max), @bin2 [varbinary](max))
RETURNS [varbinary](max) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SphericalSql].[Spherical.Sql.UserDefinedFunctions].[Intersection]
GO
/****** Object:  UserDefinedFunction [sph].[fIntersectAdvanced]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [sph].[fIntersectAdvanced](@bin [varbinary](max), @bin2 [varbinary](max), @convex_unify [bit])
RETURNS [varbinary](max) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SphericalSql].[Spherical.Sql.UserDefinedFunctions].[IntersectionAdvanced]
GO
/****** Object:  UserDefinedFunction [sph].[fIntersectQuery]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [sph].[fIntersectQuery](@cmd [nvarchar](max), @convex_unify [bit])
RETURNS [varbinary](max) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SphericalSql].[Spherical.Sql.UserDefinedFunctions].[IntersectionQuery]
GO
/****** Object:  UserDefinedFunction [sph].[fRegionContainsXYZ]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [sph].[fRegionContainsXYZ](@bin [varbinary](max), @x [float], @y [float], @z [float])
RETURNS [bit] WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SphericalSql].[Spherical.Sql.UserDefinedFunctions].[ContainsXYZ]
GO
/****** Object:  UserDefinedFunction [sph].[fSimplify]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [sph].[fSimplify](@id bigint)
------------------------------------------------------
--/H Simplifies the region defined by the specified ID.
--/A --------------------------------------------------
--/T Parameter(s):
--/T <li> @id bigint: region id
-------------------------------------------------------
RETURNS varbinary(max)
AS 
BEGIN
	RETURN sph.fSimplifyAdvanced(@id, 1, 1, 1, 0);
END

GO
/****** Object:  UserDefinedFunction [sph].[fSimplifyAdvanced]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [sph].[fSimplifyAdvanced](@id bigint, 
	@simple_simplify bit, @convex_eliminate bit, 
	@convex_disjoint bit, @convex_unify bit)
------------------------------------------------------
--/H Simplifies the region defined by the specified ID.
--/A --------------------------------------------------
--/T Parameter(s):
--/T <li> @id bigint: region id
--/T <li> @simple_simplify bit: determines whether to run trivial convex simplification
--/T <li> @convex_eliminate bit: determines whether to attempt eliminating convexes
--/T <li> @convex_disjoint bit: determines whether to make convexes disjoint
--/T <li> @convex_unify bit: determines whether to attempt stiching convexes
-------------------------------------------------------
RETURNS varbinary(max)
AS 
BEGIN
	DECLARE @cmd nvarchar(1024);
	SET @cmd = 'SELECT convert(int,ConvexID), X, Y, Z, C 
                FROM Halfspace 
                WHERE RegionID=' + convert(varchar(128),@id) + ' 
                ORDER BY ConvexID';
	RETURN sph.fSimplifyQueryAdvanced(@cmd, @simple_simplify, 
			@convex_eliminate, @convex_disjoint, @convex_unify);
END

GO
/****** Object:  UserDefinedFunction [sph].[fSimplifyBinary]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [sph].[fSimplifyBinary](@bin [varbinary](max))
RETURNS [varbinary](max) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SphericalSql].[Spherical.Sql.UserDefinedFunctions].[RegionSimplifyBinary]
GO
/****** Object:  UserDefinedFunction [sph].[fSimplifyBinaryAdvanced]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [sph].[fSimplifyBinaryAdvanced](@bin [varbinary](max), @simple_simplify [bit], @convex_eliminate [bit], @convex_disjoint [bit], @convex_unify [bit])
RETURNS [varbinary](max) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SphericalSql].[Spherical.Sql.UserDefinedFunctions].[RegionSimplifyBinaryAdvanced]
GO
/****** Object:  UserDefinedFunction [sph].[fSimplifyQuery]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [sph].[fSimplifyQuery](@cmd [nvarchar](max))
RETURNS [varbinary](max) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SphericalSql].[Spherical.Sql.UserDefinedFunctions].[RegionSimplifyQuery]
GO
/****** Object:  UserDefinedFunction [sph].[fSimplifyQueryAdvanced]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [sph].[fSimplifyQueryAdvanced](@cmd [nvarchar](max), @simple_simplify [bit], @convex_eliminate [bit], @convex_disjoint [bit], @convex_unify [bit])
RETURNS [varbinary](max) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SphericalSql].[Spherical.Sql.UserDefinedFunctions].[RegionSimplifyQueryAdvanced]
GO
/****** Object:  UserDefinedFunction [sph].[fSimplifyString]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [sph].[fSimplifyString](@str [nvarchar](max))
RETURNS [varbinary](max) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SphericalSql].[Spherical.Sql.UserDefinedFunctions].[RegionSimplifyString]
GO
/****** Object:  UserDefinedFunction [sph].[fSimplifyStringAdvanced]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [sph].[fSimplifyStringAdvanced](@str [nvarchar](max), @simple_simplify [bit], @convex_eliminate [bit], @convex_disjoint [bit], @convex_unify [bit])
RETURNS [varbinary](max) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SphericalSql].[Spherical.Sql.UserDefinedFunctions].[RegionSimplifyStringAdvanced]
GO
/****** Object:  UserDefinedFunction [sph].[fUnion]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [sph].[fUnion](@bin [varbinary](max), @bin2 [varbinary](max))
RETURNS [varbinary](max) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SphericalSql].[Spherical.Sql.UserDefinedFunctions].[Union]
GO
/****** Object:  UserDefinedFunction [sph].[fUnionAdvanced]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [sph].[fUnionAdvanced](@bin [varbinary](max), @bin2 [varbinary](max), @convex_unify [bit])
RETURNS [varbinary](max) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SphericalSql].[Spherical.Sql.UserDefinedFunctions].[UnionAdvanced]
GO
/****** Object:  UserDefinedFunction [sph].[fUnionQuery]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [sph].[fUnionQuery](@cmd [nvarchar](max), @convex_unify [bit])
RETURNS [varbinary](max) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SphericalSql].[Spherical.Sql.UserDefinedFunctions].[UnionQuery]
GO
/****** Object:  UserDefinedFunction [dbo].[fPolygonsContainingPointEq]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fPolygonsContainingPointEq](@ra float, @dec float, @buffer_arcmin float)
--------------------------------------------------------
--/H Returns regions containing a given point 
--/U ---------------------------------------------------
--/T The parameters
--/T <li>@ra, @dec are the J2000 coordinates of the point. </li>
--/T <br>Returns empty table if input params are bad.
--/T <br>Returns a table with the columns
--/T <br>RegionID BIGINT NOT NULL PRIMARY KEY
--/T <samp>
--/T SELECT * from fPolygonsContainingPointEq(180,-2,0)
--/T </samp>
--------------------------------------------------------
RETURNS table AS 
RETURN (
	SELECT regionid 
	FROM dbo.fPolygonsContainingPointXYZ
				(cos(radians(@dec))*cos(radians(@ra)),
				 cos(radians(@dec))*sin(radians(@ra)),
				 sin(radians(@dec)), @buffer_arcmin )
)
GO
/****** Object:  UserDefinedFunction [dbo].[fFootprintEq]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE FUNCTION [dbo].[fFootprintEq](@ra float, @dec float, @radius_arcmin float)
-----------------------------------------------------------------
--/H Determines whether a point is inside the survey footprint
--
--/T Returns regiontype POLYGON if inside (to be backward compatible with earlier releases)
--/T that contain the given point. Empty indicates that the point
--/T is entirely outside the survey footprint.
-----------------------------------------------------------------
RETURNS table AS RETURN 
(
	SELECT DISTINCT 'POLYGON' as [Type] 
	FROM dbo.fPolygonsContainingPointEq(@ra,@dec,@radius_arcmin) p
	    JOIN Region r ON r.regionid=p.regionid
	    JOIN sdssPolygons s ON r.id=s.sdssPolygonID
	WHERE 
		primaryfieldid in (select fieldid from Field)
)
GO
/****** Object:  StoredProcedure [dbo].[spBackupStep]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spBackupStep] (@taskid int, @stepID int output) 
----------------------------------------------------------------------
--/H Backup step, shrinks, backs-up, and then detaches the database
--/A 
--/T <li> taskid int,   		-- Task identifier
--/T <li> stepid int,   		-- Step identifier
--/T The data is in the local DB.
--/T Most of the step parameters are extracted from the task table (see code)
--/T It is a task.type dataload (type in (target|best|runs|plates|tiling))
--/T The backup step writes  messages in the Phase table.
--/T It returns stepid and either:
--/T  	0 on success (no serious problems found)
--/T    1 on failure (serious problems found).
----------------------------------------------------------------------
AS
BEGIN
	---------------------------------------------------------------------------------------------
 	-- parameters from task table
	DECLARE 
		@type varchar(16),	-- (target|best|runs|plates|tiling)  
		@id varchar(16), 	-- ID of the CSV data export task from the Linux side
		@BackupFileName varchar(256) --  File to hold back of this database
	-- Get the task parameters.  
	SELECT  
		@type=type, 
		@id=[id], 
		@BackupFileName = backupfilename
		FROM loadsupport.dbo.Task WITH (nolock)
		WHERE taskid = @taskID

	IF @BackupFileName IS NULL
		RETURN(0);
	---------------------------------------------------------------------------------------------
	-- local variables
	DECLARE @stepName varchar(16),
		@DBname varchar (100),
		@msg varchar(2048),
		@status varchar(32),
		@cmd varchar(2000),
		@err int,		 -- return from the helper procs (0 is good, 1 is fatal)
		@ret int

	SET @err = 0;

	-- register the step.
	SET @stepName = 'BACKUP'  
	SET @msg = 'Backing up ' + @type + ' database ' + @id + ' to ' + @BackupFileName
	EXEC spStartStep @taskID, @stepID OUTPUT, @stepName, 'WORKING', @msg, @msg;

	-- if step create fails, complain and return.
	IF @stepid IS NULL
	    BEGIN
		SET @msg = 'Could not create backup step for task '  
			+ str(@taskID) + ' database ' + @id
	 	EXEC spNewPhase 0, 0, 'Framework Error', 'ERROR', @msg;
		RETURN(1);
	    END
 
	------------------------------------------------------
	-- Checkpoint will shrink the log.
	CHECKPOINT
	EXEC spNewPhase @taskid, @stepid, 'Checkpoint', 'OK', 'Checkpoint done';
	------------------------------------------------------
	-- shrink will reclaim any space (and truncate the log)
	--- REALLY OUGHT TO DO A SHRINKFILE... but I am too lazy.
	set @DBname = db_name()
	DBCC SHRINKDATABASE (@DBname )
	EXEC spNewPhase @taskid, @stepid, 'ShrinkDB', 'OK', 'Shrink DB done';
	------------------------------------------------------
	-- second checkpoint just for good measure.
	CHECKPOINT
	EXEC spNewPhase @taskid, @stepid, 'Checkpoint', 'OK', 'Checkpoint done';
	------------------------------------------------------
	-- Backup Database
	BACKUP DATABASE @DBname to DISK = @BackupFileName WITH INIT
	IF @@error>0 SET @err = 1;

	-- verify that file exists
	SET @cmd = 'DIR '+@BackupFileName;
	EXEC @ret = master.dbo.xp_cmdshell @cmd, no_output;
	SET @err = @err + @ret;

	IF @err>0
	    BEGIN
		SET @msg = 'Backup of ' + @DBname 
			+ ' to file ' + @BackupFileName+ ' failed'
		EXEC spNewPhase @taskid, @stepid, 'Create backup', 'WARNING', @msg;

		-- set Task backupfilename to empty string
		UPDATE loadsupport.dbo.Task
		     SET backupfilename=''
		WHERE taskid=@taskid
	    END
	ELSE
	    BEGIN
		SET @msg = 'Backed up Database ' + @DBname 
			+ ' done' + ' to file ' + @BackupFileName;
		EXEC spNewPhase @taskid, @stepid, 'Backup', 'OK', @msg;
	    END
	------------------------------------------------------
	-- create final logs (writes to phase table, and step table)
	IF @err = 0
	    BEGIN
	    	EXEC spEndStep @taskID, @stepID, 'DONE', @msg, @msg;
	    END
    	ELSE
	    BEGIN
    		EXEC spEndStep @taskID, @stepID, 'ABORTING', @msg, @msg;
	    END
    RETURN @err
END

--===========================================================

GO
/****** Object:  StoredProcedure [dbo].[spBuildRmatrix]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE PROCEDURE [dbo].[spBuildRmatrix]
-------------------------------------------------------
--/H Builds the rotation matrices necessary to operate
--/A --------------------------------------------------
--/T 
--/T 
-------------------------------------------------------
AS
BEGIN
    -- 
    DECLARE @ra float, @dec float;
    ---------------------------
    -- Survey coordinates
    --------------------------
    -- x axis
    SET @ra  = RADIANS(185.0);
    SET @dec = RADIANS( 32.5);
    INSERT INTO Rmatrix VALUES('J2S',1,
	cos(@dec)*cos(@ra),cos(@dec)*sin(@ra),sin(@dec))
    --
    -- y axis
    SET @ra  = RADIANS(185.0);
    SET @dec = RADIANS(-57.5);
    INSERT INTO Rmatrix VALUES('J2S',2,
	cos(@dec)*cos(@ra),cos(@dec)*sin(@ra),sin(@dec))
    --
    -- z axis
    SET @ra  = RADIANS(95.0);
    SET @dec = RADIANS( 0.0);
    INSERT INTO Rmatrix VALUES('J2S',3,
	cos(@dec)*cos(@ra),cos(@dec)*sin(@ra),sin(@dec))
    --
    EXEC spTransposeRmatrix 'J2S', 'S2J'
    --
    --------------------------
    -- Galactic coordinates
    --------------------------
    -- x axis
    SET @ra  = RADIANS(266.405);
    SET @dec = RADIANS(-28.9362);
    INSERT INTO Rmatrix VALUES('J2G',1,
	cos(@dec)*cos(@ra),cos(@dec)*sin(@ra),sin(@dec))
    --
    -- y axis
    SET @ra  = RADIANS(318.00437);
    SET @dec = RADIANS(48.329626);
    INSERT INTO Rmatrix VALUES('J2G',2,
	cos(@dec)*cos(@ra),cos(@dec)*sin(@ra),sin(@dec))
    --
    -- z axis
    SET @ra  = RADIANS(192.8594);
    SET @dec = RADIANS( 27.1283);
    INSERT INTO Rmatrix VALUES('J2G',3,
	cos(@dec)*cos(@ra),cos(@dec)*sin(@ra),sin(@dec))
    --
    EXEC spTransposeRmatrix 'J2G', 'G2J'
    --

END
GO
/****** Object:  StoredProcedure [dbo].[spBuildSpecPhotoAll]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE PROCEDURE [dbo].[spBuildSpecPhotoAll] (
	@taskid int, 
	@stepid int 
)
-------------------------------------------------------------------------------
--/H Collect the combined spectro and photo parameters of an object in SpecObjAll
--/A --------------------------------------------------------------------------
--/T This is a precomputed join between the PhotoObjAll and SpecObjAll tables.
--/T The photo attibutes included cover about the same as PhotoTag.
--/T The table also includes certain attributes from Tiles.
-------------------------------------------------------------------------------
AS BEGIN
	SET NOCOUNT ON;
	------------------------------------------------------
	-- Put out step greeting.
	EXEC spNewPhase @taskid, @stepid, 'SpecPhotoAll', 'OK', 'spBuildSpecPhotoAll called';
	------------------------------------------------------
	--
	DECLARE @rows bigint,
		@msg varchar(1000)
--	EXEC spIndexDropSelection @taskid, @stepid, 'F', 'SpecPhotoAll'
--	EXEC spIndexDropSelection @taskid, @stepid, 'I', 'SpecPhotoAll'
	BEGIN TRANSACTION
	    TRUNCATE TABLE SpecPhotoAll
	    --
		DBCC TRACEON(610)
	    INSERT SpecPhotoAll WITH (TABLOCK)
 	    SELECT
	 	s.specObjID,     
		s.mjd,
		s.plate,
		s.tile,
		s.fiberID,
		s.z,
		s.zErr,
		s.class,
		s.subclass,
		s.zWarning,
		s.ra,
		s.[dec],
		s.cx,
		s.cy,
		s.cz,
		s.htmid,
		s.sciencePrimary,
		s.legacyPrimary,
		s.seguePrimary,
		s.segue1Primary,
		s.segue2Primary,
		s.bossPrimary,
		s.sdssPrimary,
		s.survey,
		s.programName,
		s.legacy_target1,
		s.legacy_target2,
		s.special_target1,
		s.special_target2,
		s.segue1_target1,
		s.segue1_target2,
		s.segue2_target1,
		s.segue2_target2,
		s.boss_target1,
		s.ancillary_target1,
		s.ancillary_target2,
		s.plateID,
		s.sourceType,
		s.targetObjID,
		p.objID,
		p.skyVersion,
		p.run,
		p.rerun,
		p.camcol,
		p.field,
		p.obj,
		p.mode,
		p.nChild,
		p.type,
		p.flags,
		p.psfMag_u,
		p.psfMag_g,
		p.psfMag_r,
		p.psfMag_i,
		p.psfMag_z,
		p.psfMagErr_u,
		p.psfMagErr_g,
		p.psfMagErr_r,
		p.psfMagErr_i,
		p.psfMagErr_z,
		p.fiberMag_u,
		p.fiberMag_g,
		p.fiberMag_r,
		p.fiberMag_i,
		p.fiberMag_z,
		p.fiberMagErr_u,
		p.fiberMagErr_g,
		p.fiberMagErr_r,
		p.fiberMagErr_i,
		p.fiberMagErr_z,
		p.petroMag_u,
		p.petroMag_g,
		p.petroMag_r,
		p.petroMag_i,
		p.petroMag_z,
		p.petroMagErr_u,
		p.petroMagErr_g,
		p.petroMagErr_r,
		p.petroMagErr_i,
		p.petroMagErr_z,
		p.modelMag_u,
		p.modelMag_g,
		p.modelMag_r,
		p.modelMag_i,
		p.modelMag_z,
		p.modelMagErr_u,
		p.modelMagErr_g,
		p.modelMagErr_r,
		p.modelMagErr_i,
		p.modelMagErr_z,
		p.cModelMag_u,
		p.cModelMag_g,
		p.cModelMag_r,
		p.cModelMag_i,
		p.cModelMag_z,
		p.cModelMagErr_u,
		p.cModelMagErr_g,
		p.cModelMagErr_r,
		p.cModelMagErr_i,
		p.cModelMagErr_z,
		p.mRrCc_r,
		p.mRrCcErr_r,
		p.score,
		p.resolvestatus,
		p.calibstatus_u,
		p.calibstatus_g,
		p.calibstatus_r,
		p.calibstatus_i,
		p.calibstatus_z,
		p.ra as photoRa,
		p.[dec] as photoDec,
		p.extinction_u,
		p.extinction_g,
		p.extinction_r,
		p.extinction_i,
		p.extinction_z,
		p.fieldID,
		p.dered_u,
		p.dered_g,
		p.dered_r,
		p.dered_i,
		p.dered_z
	    FROM SpecObjAll s WITH (NOLOCK)
	    LEFT OUTER JOIN PhotoObjAll p WITH (nolock) ON s.bestObjid=p.objid 
	    ORDER BY s.specobjid
	    SET  @rows = ROWCOUNT_BIG();
		DBCC TRACEOFF(610)
	COMMIT TRANSACTION
	-- generate completion message.
--	EXEC spIndexBuildSelection @taskid, @stepid, 'I', 'SpecPhotoAll'
--	EXEC spIndexBuildSelection @taskid, @stepid, 'F', 'SpecPhotoAll'
	SET @msg = 'spBuildSpecPhotoAll done, '  
	    + cast(@rows as varchar(10))
	    + ' rows inserted into SpecPhotoAll';

	EXEC spNewPhase @taskid, @stepid, 'SpecPhotoAll', 'OK', @msg;
	------------------------------------------------------
	RETURN(0);
END
GO
/****** Object:  StoredProcedure [dbo].[spCheckDBColumns]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spCheckDBColumns]
---------------------------------------
--/H Check for a mismatch between the db columns and documentation
--/A
--/T Comapres the columns of tables in syscolumns to
--/T the list stored in DBColumns. Returns the number
--/T of mismatches. It has no parameters.
--/T <samp>  exec spCheckDBColumns</samp>
---------------------------------------
AS BEGIN
	SET NOCOUNT ON;
	--
	CREATE TABLE #indbcolumns (
		tablename varchar(64),
		name	  varchar(64),
		found	varchar(64)
	)
	--
	INSERT #indbcolumns
	SELECT	o.name as tablename, c.name, 'in DB' as found
	    FROM sysobjects o, syscolumns c WITH (nolock)
	    WHERE o.xtype='U' 
		AND o.name not like 'dt%'
		AND c.id = o.id
	--
	CREATE TABLE #diff (
		tablename varchar(64),
		name	  varchar(64),
		found	varchar(64)
	)
	--
	INSERT #diff
	SELECT d.tablename as obj, d.name, 'in schema' as found
	    FROM DBColumns d WITH (nolock)
    	    WHERE  d.name not in (
		SELECT name FROM #indbcolumns
		WHERE tablename = d.tablename 
	    )
	------
	INSERT #diff
	SELECT o.tablename as obj, o.name, o.found FROM #indbcolumns o
	    WHERE o.name NOT IN (
		SELECT name FROM DBColumns WITH (nolock)
		WHERE  tableName=o.tablename
	    )

	DECLARE @count int;
	SELECT @count=count(*) FROM #diff
	SELECT * FROM #diff
	RETURN @count;
END
GO
/****** Object:  StoredProcedure [dbo].[spCheckDBIndexes]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spCheckDBIndexes]
--------------------------------------------------------
--/H Checks all the mismatches ion indexes between the schema and the DB
--/A
--/T
--------------------------------------------------------
AS BEGIN
	SET NOCOUNT ON;
	--
	CREATE TABLE #isys (
		tablename varchar(128),
		name varchar(128),
		code char(1),
		found varchar(32)
	)
	--
	INSERT #isys
	SELECT o.name as tablename,  i.name, 'I' as code, 'in DB' as found
		FROM sysindexes i, sysobjects o WITH (nolock)
		WHERE i.id=o.id 
		and i.indid!=0			-- not a table
		and o.name not like 'dt%'
		and i.name like 'i[_]%' 

	INSERT #isys
	SELECT o.name as tablename,  i.name, 'K' as code, 'in DB' as found
		FROM sysindexes i, sysobjects o WITH (nolock)
		WHERE i.id=o.id 
			and i.indid!=0			-- not a table
			and (o.name not like 'dt%' and o.name not like 'pk[_][_]%')
			and (i.name like 'pk[_]%' and i.name not like 'pk[_][_]%')
	--
	INSERT #isys
	SELECT u.name as tableName, c.name, 'F' as code, 'in DB' as found
		FROM sysobjects u, sysobjects c WITH (nolock)
		WHERE u.xtype='U' and c.type='F'
			and c.parent_obj= u.id
			and u.name != 'dtproperties'
	--
	CREATE TABLE #imap (
		tablename varchar(128),
		name varchar(128),
		code char(1),
		found varchar(32)
	)
	INSERT #imap
	SELECT tableName, dbo.fIndexName(code,tableName,fieldlist,foreignkey),
		code, 'in schema' as found
		FROM IndexMap WITH (nolock)
	--
	CREATE TABLE #diff (
		name varchar(64),
		tableName varchar(64),
		code  varchar(64),
		found	varchar(64)
	)
	--
	INSERT #diff
	SELECT name, tableName, code, found 
		FROM #isys
		WHERE name not in (
			select name from #imap
		)
	--
	INSERT #diff
	SELECT name, tableName, code, found 
		FROM #imap
		WHERE name not in (
			select name from #isys
		)
	--
	SELECT * FROM #diff WITH (nolock)
	ORDER BY found, name
	--
	DROP TABLE #isys
	DROP TABLE #imap
	--
	DECLARE @count int;
	SELECT @count=count(*) FROM #diff
	DROP TABLE #diff
	--
	RETURN @count;
END
GO
/****** Object:  StoredProcedure [dbo].[spCheckDBObjects]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spCheckDBObjects]
---------------------------------------
--/H Check for a mismatch between the db objects and documentation
--/A
--/T Comapres the all the objects in sysobjects to
--/T the list stored in DBObjects. Returns the number
--/T of mismatches. It has no parameters.
--/T <samp>  exec spCheckDBObjects</samp>
---------------------------------------
AS BEGIN
	SET NOCOUNT ON;
	--
	CREATE TABLE #indbobjects (
		[name] varchar(64),
		type varchar(64),
		found varchar(16)
	)
	--
	CREATE TABLE #diff (
		[name] varchar(64),
		type varchar(64),
		found varchar(16)
	)
	--
	INSERT #indbobjects
	    SELECT name, xtype as type, 'in DB' as found
		FROM sysobjects WITH (nolock)
		WHERE xtype='U'   
		    and name not like 'dt%'
	--
	INSERT #indbobjects
	    SELECT name, xtype as type, 'in DB' as found 
		FROM sysobjects WITH (nolock)
		WHERE xtype='V' 
		    and name not like 'sys%'
	--
	INSERT #indbobjects
	    SELECT name, xtype as type, 'in DB' as found 
		FROM sysobjects WITH (nolock)
		WHERE xtype='P' 
		    and name not like 'dt_%'
	--
	INSERT #indbobjects
	    SELECT name, 'F' as type, 'in DB' as found 
		FROM sysobjects WITH (nolock)
		WHERE xtype in ('FN' ,'TF', 'FS', 'FT', 'IF')
	--
	INSERT #diff
	SELECT i.name, i.type, found
	    FROM #indbobjects i
	    WHERE i.name not in (
		select name from DBobjects WITH (nolock)
		where type=i.type
		)
	--
	INSERT #diff
	SELECT o.name, o.type, 'in schema' as found
	    FROM DBObjects o WITH (nolock)
	    WHERE o.name not in (
		select name from #indbobjects
		where type=o.type
		)
	--
	SELECT * FROM #diff
	    ORDER BY found, type, name
	--
	DECLARE @count int;
	SELECT @count=count(*) FROM #diff
	--
	RETURN @count;
END
GO
/****** Object:  StoredProcedure [dbo].[spCleanupStep]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[spCleanupStep] (@taskid int, @stepID int OUTPUT) 
----------------------------------------------------------------------
--/H Cleanup step, deletes the database
--/A 
--/T <li> taskid int,   		-- Task identifier
--/T <li> stepid int,   		-- Step identifier
--/T The data is in the local DB.
--/T Most of the step parameters are extracted from the task table (see code)
--/T It is a task.type dataload (type in (target|best|runs|plates|tiling))
--/T The backup step writes  messages in the Phase table.
--/T It returns stepid and either:
--/T  	0 on success (no serious problems found)
--/T    1 on failure (serious problems found).
----------------------------------------------------------------------
AS
BEGIN
    ---------------------------------------------------------------------------------------------
    DECLARE @dbname varchar(64)
    --
    SELECT @dbname=dbname 
	FROM loadsupport.dbo.Task WITH (nolock)
	WHERE taskid = @taskID
    ---------------------------------------------------------------------------------------------
    -- local variables
    DECLARE
	@cmd varchar(1024),
	@ret	int	
    ------------------------------------------------------
    SET  @cmd = 'DROP DATABASE '+@dbname;
    EXEC @ret = sp_executesql @cmd;
    --
    RETURN(@ret);
END
--===========================================================

GO
/****** Object:  StoredProcedure [dbo].[spCompareChecksum]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spCompareChecksum]
----------------------------------------------------------------
--/H Compares the checksum in Diagnostics to the one in SiteDiagnostics
--/A
--/T Run this procedure to verify that no changes occured in the
--/T database since the last regular update.
--/T <PRE> spCompareChecksum</PRE>
----------------------------------------------------------------
AS
BEGIN
    DECLARE @SiteChecksum bigint, @Diagchecksum bigint;
    SET @Sitechecksum = (SELECT dbo.fGetDiagChecksum());
    SET @Diagchecksum = (
	SELECT cast(value as bigint) from SiteConstants
	WHERE name='Checksum');
    IF (@Sitechecksum = @Diagchecksum) PRINT 'Checksum OK'
    ELSE PRINT 'Checksum does not match. '+
	' Site: '+CAST(@Sitechecksum as varchar(12))+','+
	' Diag: '+CAST(@Diagchecksum as varchar(12))
END
GO
/****** Object:  StoredProcedure [dbo].[spComputeFrameHTM]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE PROCEDURE [dbo].[spComputeFrameHTM]
-------------------------------------------------------------------------------
--/H Compute the HTM and the other params for a Frame.
--/A
--/T Needs to be run as the last step of the Frame loading.
--/T It should be executed automatically by a DTS script.
-------------------------------------------------------------------------------
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE
	@a FLOAT, @b FLOAT, @c FLOAT, 
	@d FLOAT, @e FLOAT, @f FLOAT, 
	@node FLOAT, @incl FLOAT,
	@stripe INT,
	-- new computed quantities 
	@ra FLOAT, @dec FLOAT, 
	@mu FLOAT, @nu FLOAT,
	@cx FLOAT, @cy FLOAT, @cz FLOAT,
	@ra1 FLOAT, @dec1 FLOAT, 
	@node1 FLOAT, @incl1 FLOAT
    ------------------------------------
    -- frames_cursor scans Frame table
    DECLARE frames_cursor CURSOR
	FOR SELECT a, b, c, d, e, f, node, incl, [stripe]
       	    FROM dbo.Frame
	    FOR UPDATE OF ra, [dec], cx, cy, cz, mu, nu, htmID  
    OPEN frames_cursor;
    -------------------------------------------------------------
    -- Now for each record, do the computation and update the record.
    WHILE (1 = 1) 		-- do till end of  table.
   	BEGIN
	FETCH NEXT FROM frames_cursor
		INTO  	@a, @b, @c, @d, @e, @f, 
			@node, @incl, @stripe
  	IF (@@FETCH_STATUS != 0) BREAK;
	--
	-- compute the quantities for the frame center
	--
	SET @mu = @a + @b*744.5 + @c*1024;
	SET @nu = @d + @e*744.5 + @f*1024;
	SELECT @ra=ra, @dec=[dec], @cx=cx, @cy=cy, @cz=cz
	    FROM dbo.fEqFromMuNu(@mu,@nu,@node,@incl);
	--
	-- do the ra,dec of the upper left hand corner
	--
	SET @mu = @a;
	SET @nu = @d;
	SELECT @ra1=ra, @dec1=[dec]
	    FROM dbo.fEqFromMuNu(@a,@d,@node,@incl);
	--
	-- the idealized stripe has node1=95.0 and incl1 tied to the stripe
	--
	SET @node1 = 95.0;
	SET @incl1 = 2.5*(@stripe-10);
	IF @incl1>150 SET @incl1 = @incl1 - 180.0;
	--
	SELECT @mu=mu, @nu=nu 
	    FROM dbo.fMuNuFromEq(@ra1,@dec1,@stripe,@node1,@incl1);
	-------------------------------------------
	UPDATE Frame 
	    SET [ra]  = @ra, 
		[dec] = @dec, 
		cx    = @cx, 
		cy    = @cy, 
		cz    = @cz,
		mu    = @mu,
		nu    = @nu,
		htmID = 0
	WHERE CURRENT OF frames_cursor;
 	END
    --================================================================
    -- cleanup, close and deallocate the cursor.   
    CLOSE frames_cursor;
    DEALLOCATE frames_cursor;
    --
    UPDATE Frame
	SET htmid = dbo.fHtmXyz(cx,cy,cz);
    --
END
GO
/****** Object:  StoredProcedure [dbo].[spComputePhotoParentID]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spComputePhotoParentID] (@taskid int, @stepid int)
-------------------------------------------------------------
--/H Computes photoObjAll.ParentID based on nChild
--/A 
--/T Scans photoObjAll table.
--/T    if nChild >0 then the next "nChild" nodes are children of this node.
--/T       unless one of them has nChild>0 in which case we recurse
--/T <p> parameters:   
--/T <li> taskid int,   		-- Task identifier
--/T <li> stepid int,   		-- Step identifier
--/T <li> returns  0 if OK, non zero if something wrong  
--/T <br>
--/T Sample call   <br>
--/T <samp> 
--/T <br> exec  spComputePhotoParentID @taskid, @stepid 
--/T </samp> 
--/T <br> see also spTestPhotoParentID  
------------------------------------------------------------- 
AS BEGIN
	SET NOCOUNT ON;
	declare @errorMsg varchar(1000)
	declare @error int
	set @error = 0
	--===========================================================================
	DECLARE	photoCursor CURSOR 
	FOR SELECT nChild, ObjID 
            FROM photoObjAll 
            FOR UPDATE OF parentID
              
	DECLARE @nChild INT;
	DECLARE @nChild1 INT;
	DECLARE @ParentID  BIGINT;
	DECLARE @ChildID   BIGINT;
	DECLARE @stack     varchar(100);
	SET @stack = '';

	OPEN photoCursor
		FETCH NEXT FROM photoCursor INTO  @nChild, @ParentID  
	--print 'Fetched AT 1 nChild:' + STR(@nChild) + ' ParentID:'+str(@ParentID);
	WHILE (@@fetch_status = 0 )
	  BEGIN
	    WHILE (@nChild > 0)
	      BEGIN
		FETCH NEXT FROM photoCursor INTO  @nChild1, @ChildID 
		--print 'Fetched AT 2 nChild:' + STR(@nChild1) + ' ChildID:'+str(@childID);
		IF ((@@fetch_status <> 0))
		  BEGIN
		    PRINT 'fetch failed, nChild Count is wrong';
		    EXEC spNewPhase @taskid, @stepid, 'Compute Photo Parent', 'ERROR',
			'Compute Photo Parent fetch failed, nChild Count is wrong'   
		    SET @error = @error + 1
		    BREAK;
		  END
		    --INSERT INTO photoObjAllExtension VALUES (@ChildID, @ParentID,null)
		    --print 'parent: '+str(@parentID,3)+' kid: '+str(@ChildID,3)+'child count: '+str(@nChild,3)
		UPDATE photoObjAll
			SET parentID = @ParentID
			WHERE CURRENT OF photoCursor;
		SET @nChild = @nChild-1;
		IF (@nChild1 > 0)
		    BEGIN
		  	SET @stack = str(@ParentID,20,0) + str(@nChild,20,0) + @stack;
			SET @ParentID = @ChildID;
			SET @nChild = @nChild1;
		    END
		ELSE WHILE ((@nChild = 0) AND (@stack != ''))
		    BEGIN
			SET @ParentID = cast(substring(@stack,1,20) as bigint);
			SET @nChild = cast(substring(@stack,21,20) as int);
			SET @stack = substring(@stack,41,Datalength(@stack)-40);
			--print ':' +@stack + ':'
		    END
		END
		FETCH NEXT FROM photoCursor INTO  @nChild, @ParentID 
 		--print 'Fetched AT 3 nChild:' + STR(@nChild) + ' ChildID:'+str(@ParentID);  
	END
	CLOSE photoCursor

	DECLARE @count bigint;
	SELECT @count = count_big(*) from photoObjAll where parentID != 0

	DEALLOCATE photoCursor
	IF @error = 0 
	    BEGIN
		SET @errorMsg = 'Compute Photo Parent: ' + cast(@count as varchar(20)) + ' child-parent relationships.'
		EXEC spNewPhase @taskid, @stepid, 'Compute Photo Parent', 'OK', @errorMsg  
	    END
	RETURN @error
END			-- End spComputePhotoParentID()

GO
/****** Object:  StoredProcedure [dbo].[spCopyATable]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spCopyATable](
	@taskid int, 
	@stepID int, 
	@fromDB varchar(100), 
	@toDB varchar(100), 
	@table varchar(100), 
	@firstTime int)
--------------------------------------------------------------
--/H Copies a table from one db to another 
--/A
--/T <p> parameters:   
--/T <li> taskid int,   		-- Task identifier
--/T <li> stepid int,   		-- Step identifier
--/T <li> fromDB varchar(100),   	-- source DB (e.g. verify.photo)
--/T <li> toDB varchar(100),   		-- destination DB (e.g. dr1.best)
--/T <li> firstTime int 		-- if 1, creates target table.
--/T <li> returns  0 if OK, non zero if something wrong  
--/T <br><samp> exec spCopyATable 1,1,'SkyServerV4', 'tempDB', 1 </samp>
--------------------------------------------------------------
AS BEGIN
    --
    SET NOCOUNT ON
    --
    DECLARE @statement varchar(1000),
	@rows bigint,
	@message varchar(1000)

	IF (@firstTime = 1) 
	    begin 
		set @statement = 'select * into ' + @toDB   + '.dbo.' + @table 
                                      + ' from ' + @fromDB + '.dbo.' + @table 
	    end 
	ELSE 
	    begin 
		set @statement =  'insert into     ' + @toDB   + '.dbo.' + @table 
                                + ' with (tablock) select * from ' + @fromDB + '.dbo.' + @table 
	    end 

	--print @statement
	BEGIN TRANSACTION
	    --
	    EXEC (@statement) 
	    SET @rows = rowcount_big();
	    --
	    INSERT PubHistory
		VALUES(@table,@rows,current_timestamp,@taskid)
	    --
	COMMIT TRANSACTION
	SET @message = ' published ' + cast(@rows as varchar) 
		+ ' rows of table ' + @fromDB + '.dbo.' + @table 
		+ ' to table ' + @toDB   + '.dbo.' + @table 
	EXEC spNewPhase @taskID, @stepID, 'TableCopy', 'OK', @message;
        RETURN(0);
END 

GO
/****** Object:  StoredProcedure [dbo].[spCopyDbSimpleTable]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-------------------------------------------------------
--/H Helper routine for spCopyDbSimple -- copies a table
--/A --------------------------------------------------
--/T @TaskID ID of task used for load support logging
--/T @StepID ID of step used for load support logging
--/T @SourceDbName is the name of the "from" database
--/T @NewDbName is the name of the "to" database.
--/T @tableName is the name of the table to copy
--/T @whereClause is the restriction on the copy or '' if there is none.
--/T @incrementalKey is the optional key (prefix) to control incremental copies.
--/T     if specified,  @batchSize  rows at a time will be copied using that 
--/T     key as the partitioning criterion. 
--/T @batchSize is the optional (default is 5M) number of rows per incremental batch. 
--/T The routine also traces the command and its timestamp and rowcount to the phase table. 
--/T <samp>
--/T exec spCopyDbSimpleTable 'BestDr5', 'MyBestDr5', 'Chunk', ''
--/T exec spCopyDbSimpleTable 'BestDr5', 'MyBestDr5', 'PhotoObjAll', '', 'objID'
--/T </samp>
--/T See also spCopyDbSubset
-------------------------------
create procedure [dbo].[spCopyDbSimpleTable]( 	@taskID		int,
					@stepID		int,
					@SourceDbName	 varchar(100),
					@NewDbName	 varchar(100), 
					@tableName	 varchar(100),  
					@whereClause	 varchar(8000),
					@incrementalKey  varchar(100) = '',
					@batchSize       bigint = 5000000  ) 
	as begin
	declare @cmd nvarchar(4000),
		@rows int
	if (@incrementalKey = '')
		begin
		-------------------------------------------------------------------
		-- copy whole table in one transaction. 
		set @cmd = ' insert  '       + @NewDbName    + '.dbo.' + @tableName
			 + ' select * from ' + @SourceDbName + '.dbo.' + @tableName
		if (@whereClause != '')
			set @cmd = @cmd + ' where ' + @whereClause
		execute (@cmd)
		set @rows = @@rowcount
		set @cmd = --'at ' + convert(varchar(30),current_timestamp, 8) + -- hh:mm:ss
		 	  ' inserted ' + cast(@rows as varchar(30)) + ' rows from: ' + @cmd
		exec loadsupport.dbo.spNewPhase @taskID, @stepID, 'TABCOPY', 'OK', @cmd
		end
	else
		-------------------------------------------------------------
		-- incremental copy (5M rows per transaction.
		begin
		declare @maxKey bigint, @baseKey bigint;
		set @rows = @batchSize
		begin transaction
		set @cmd = 'select @baseKey = coalesce(max('+@incrementalKey+'),-1) from '+ @NewDbName + '.dbo.' + @tableName
		execute sp_executesql  @cmd, N'@baseKey bigint output', @baseKey output 
		commit transaction 
		set @maxKey = @baseKey
		-------------------------------------------------------------
		-- copy the table @batchsize rows at a time. 
		-- we can stop when the batchsize is bigger than the number of rows we copied last time.
		while (@rows >= @batchSize)
			begin
			begin transaction
			-------------------------------------
			-- copy the next range
			set @baseKey = @maxKey + 1
			-------------------------------------
			--compute max key for next batch.
			set @cmd = 'select @maxKey = coalesce(max('+@incrementalKey+'),0)  ' 
				 + 'from ( select top ' + cast(@batchSize as varchar(30)) + ' * '
				     + '   from ' + @SourceDbName + '.dbo.' + @tableName
				     + '   where '+@incrementalKey +' >= ' + cast(@baseKey as varchar(30))
			if (@whereClause != '')
			       set @cmd = @cmd + ' and ' + @whereClause
			set @cmd = @cmd + ' order by ' +  @incrementalKey + ' asc) T '
			execute sp_executesql  @cmd, N'@maxKey bigint output', @maxKey output  
			 
			-------------------------------------
			-- set up the incremental copy statement (notice we recopy maxKey)	
			set @cmd = 'insert ' + @NewDbName + '.dbo.' + @tableName
				   + ' select * '
				   + ' from ' + @SourceDbName + '.dbo.' + @tableName
				   + ' where '+@incrementalKey + ' between ' 
				        + cast(@baseKey as varchar(30)) + ' and ' + cast(@maxKey as varchar(30))
			if (@whereClause != '')
			       set @cmd = @cmd + ' and ' + @whereClause
			set @cmd = @cmd + ' order by ' +  @incrementalKey + ' asc '
			--------------------------------------
			-- excecute the batch copy 
			execute (@cmd)
			set @rows = @@rowcount
			commit transaction
			 
 			set @cmd =  --print 'at ' + convert(varchar(30),current_timestamp, 8) +-- hh:mm:ss
		 	   		  ' inserted ' + cast(@rows as varchar(30)) + ' rows from: ' 
			 		+ @SourceDbName + '.dbo.' + @tableName + ' to ' + @NewDbName + '.dbo.' + @tableName
			  		+ ' cmd is: ' + @cmd
			exec loadsupport.dbo.spNewPhase @taskID, @stepID, 'TABCOPY', 'OK', @cmd
			end
		end
	end
GO
/****** Object:  StoredProcedure [dbo].[spCopyDbSubset]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-------------------------------------------------------
--/H creat a (area restrictd subset) copy of the SDSS database  
--/A --------------------------------------------------
--/T @SourceDbName is the name of the "from" database
--/T @NewDbName is the name of the "new" database.
--/T @NewDbDirectory is the (list of) path names to the new database on disk, directory must exist.
--/T @NewLogDirectory is the (list of) path names to the new database's logs on disk, directory must exist
--/T @AreaRestriction is the restriction on the copy or '' if there is none.
--/T @MultiFile is a flag: if non-zero it requests multiple file groups be configured.  
--/T The routine also prints out the command and its timestamp and rowcount. 
--/T <samp>
--/T 	set @NewDbName = 'MyBestDr5'
--/T 	set @AreaRestriction = 'ra between 193.75 and 196.25 and dec between 1.25 and 3.75'
--/T 	set @SourceDbName = 'BestDr5'
--/T 	set @NewDbDirectory =   'F:\sql_db\'	
--/T 	set @NewLogDirectory =  'F:\sql_db\'	
--/T 	exec spCopyDbSubset 'BESTDR5', 'BEST', @sourceDbName, @NewDbName, 
--/T 	                    @NewDbDirectory, @NewLogDirectory, 
--/T 	                    @AreaRestriction, 0
--/T </samp>
--/T See also spCopyDbSimpleTable
-------------------------------
create procedure [dbo].[spCopyDbSubset]( 	@SourceDataSet	 	varchar(100),  -- "BESTDR5" or...
					@SourceDataSetType	 varchar(100), -- "BEST" or "TARGET" or...
					@SourceDbName	 varchar(100),
					@NewDbName	 varchar(100), 
					@NewDbDirectory	 varchar(100), 
					@NewLogDirectory varchar(100), 
					@AreaRestriction varchar(1000),
					@MultiFile       int)
	as begin
	set nocount on;
	set transaction isolation level read uncommitted
	declare @DbDescription  varchar(256),
		@cmd  nvarchar(4000),
		@test varchar(4000),
		@err int,		-- return from command execution
   		@taskid int,
		@stepid int,
		@status varchar(64),
		@stepmsg varchar(2000),
		@phasemsg varchar(2000) 
 
    	--------------------------------------------------------------------------
	-- create the database
	set @test = ''
	set @DbDescription = @NewDbName + ' is a copy of Skyserver DB: ' +@SourceDbName + ' in region ' + @AreaRestriction  
	set @stepmsg = 'spCopyDbSubset: ' + ' ' + @DbDescription
    	exec loadSupport.dbo.spNewTask @NewDbName, @SourceDataSet , @SourceDataSetType, @NewDbDirectory, '', @stepmsg, @taskID output;
    	exec loadSupport.dbo.spNewStep @taskID, 'CopyCreate','OK',  @stepmsg, @stepID output;
    	exec loadSupport.dbo.spNewPhase @taskID, @stepID, 'CopyCreate','OK',  @stepmsg 
    	exec loadSupport.dbo.spNewPhase @taskID, @stepID, 'CopyDelete','OK',  'First deleting old database'
	if (exists (select [name] from master.dbo.sysdatabases where upper(name) = upper(@NewDbName)))
		begin
    		exec loadSupport.dbo.spNewPhase @taskID, @stepID, 'CopyDelete','OK',  'First deleting old database'
		set @cmd = ' drop database ' +@NewDbName
		exec(@cmd)
		end
    	exec loadSupport.dbo.spNewPhase @taskID, @stepID, 'CopyCreate','OK',  'Now Creating new database'
	declare @MillionObjects bigint, @ParmDefinition nvarchar(500)
	set @ParmDefinition = N'@MillionObjects bigint OUTPUT'
	if @areaRestriction != ''
		set @cmd  = 'select @MillionObjects=count_big(*) from ' +@SourceDbName + '.dbo.PhotoObjAll  where ' + @areaRestriction	
	else
		set @cmd  = 'select @MillionObjects=count_big(*) from ' +@SourceDbName + '.dbo.PhotoObjAll ' 	
	
	execute sp_executesql @cmd, @ParmDefinition, @MillionObjects = @MillionObjects OUTPUT  
	set @MillionObjects = 1 +  @MillionObjects /1e6
	set @cmd = 'loadSupport.dbo.spCreatePartDB2 ''' +  @NewDbName 
                        + ''', ''' + @SourceDataSet + ''', ''' + @SourceDataSetType +''', ''' 
			+  @NewDbDirectory + ''' , ''' + @NewLogDirectory + ''' ,  ' 
		 	+ cast(@MillionObjects  as varchar(30)) 
			+ ' , ' + cast (@MultiFile as varchar(5))
		 	+ ' , ''''' -- null list of key types
		   	+ ' , ' +  cast(@taskID as varchar(30))
	exec (@cmd )
	---------------------------------------------------------------------------
	-- inherit taskid from the create step
	--select @taskID = max(taskID) from LoadSupport.dbo.Task	 
    	set @stepmsg = 'spCopyDbSubset created DB, now starting database copy'
    	exec loadSupport.dbo.spNewStep  @taskID, 'COPY','WORKING', @stepmsg, @stepID output;
    	exec loadSupport.dbo.spNewPhase @taskID, @stepID, 'Copy','OK', @stepmsg

	-------======================================================================
	-- declare primary keys so that target DB is loaded in organized way. 
	-- exec spIndexBuildSelection @taskID,@stepID,'K', 'ALL'
	set @cmd =  @NewDbName + '.dbo.spIndexBuildSelection ' 
		  + cast( @taskID as varchar(30)) + ' , ' + cast(@stepID as varchar(30)) + ', ''K'', ''ALL'''
	exec loadSupport.dbo.spNewPhase @taskid, @stepid, 'BUILDK', 'OK', @cmd
	execute( @cmd )
  
	--****************************************************************
	-- truncate table History
	--*****************************************************************
	--
	-- DataConstants already done
	-- DBobjects already done -- 277 rows
	-- DBcolumns already done -- 1652 rows
	-- DBObjDescription  -- 0 ****************
	-- DBViewCols -- 96 rows
	-- insert Algorithm   select * from BestDrN..Algorithm  		--  23 rows  
	-- execute spCopyDbSimpleTable  @taskid, @stepid, @SourceDbName, @NewDbName, 'Algorithm', '' 
	-- insert Diagnostics select * from BestDrN..Diagnostics  		-- 483 rows 
	-- execute spCopyDbSimpleTable  @taskid, @stepid, @SourceDbName, @NewDbName, 'Diagnostics', '' 
	-- insert FileGroupMap
	--	select tableName, 'PRIMARY', 'PRIMARY', comment 
	--	from BestDrN..FileGroupMap   				-- 46 rows supressed
	-- insert Glossary select * from BestDrN..Glossary  		-- 165 rows  
	-- execute spCopyDbSimpleTable  @taskid, @stepid, @SourceDbName, @NewDbName, 'Glossary', '' 
	-- execute spCopyDbSimpleTable  @taskid, @stepid, @SourceDbName, @NewDbName, 'TableDesc', '' 
	-- insert History     select * from BestDrN..History  		--  1 rows
	-- insert IndexMap
	--	select code, type, tableName, fieldList, foreignKey, indexGroup 
	--	from BestDrN..IndexMap   				--  161 rows
	-- insert LoadHistory select * from BestDrN..LoadHistory  		--  130 rows 
	execute spCopyDbSimpleTable  @taskid, @stepid, @SourceDbName, @NewDbName, 'LoadHistory', '' 
	-- insert PubHistory  select * from BestDrN..PubHistory  		-- 1496 rows  
	execute spCopyDbSimpleTable  @taskid, @stepid, @SourceDbName, @NewDbName, 'PubHistory', '' 
	--insert PartitionMap select * from BestDrN..PartitionMap  	--   11 rows set by build
	--insert ProfileDefs select * from BestDrN..ProfileDefs  	--   15 rows set by build 
	--insert RunShift	   select * from BestDrN..RunShift	--    9 rows set by build
	------ SdssConstants						--   42 rows set by build
	--  update siteConstants set value ='Personal Subset DrN' where name = 'DB Type'
	set @cmd = ' update ' + @NewDbName + '.dbo.siteConstants '
		 + '  set value   = ''' + @SourceDbName  + ''''
  		 + ',     comment = ''' + @DbDescription + ''''  
		 + ' where name = ''DB Type'''
	exec loadsupport.dbo.spNewPhase @taskID, @stepID, 'COPY', 'OK', @cmd
	execute( @cmd )
	-- insert SiteDiagnostics select * from BestDrN..SiteDiagnostics  	--  483 rows  
	execute spCopyDbSimpleTable  @taskid, @stepid, @SourceDbName, @NewDbName, 'SiteDiagnostics', '' 
	--insert TableDesc select * from BestDrN..TableDesc  		--  87 rows  
	------ DB documenttion and layout
	------
	--insert QueryResults select * from BestDrN..QueryResults  	-- 111 rows
	----
	-- SPECTRA
	if (1 = (select count(*) from tempdb.dbo.sysobjects where name = N'#Objects')) 
		drop table #objects
	create table #Objects(ObjID bigint not null primary key)
	declare @specTest nvarchar(1000)
	set @specTest = ''
	if (@AreaRestriction != '')
		begin
		set @cmd = ' insert #Objects select specObjID ' 
			+  ' from '  + @SourceDbName + '.dbo.SpecObjAll '
			+  ' where ' + @AreaRestriction
		execute (@cmd)
		set @specTest = 'specObjId in (select ObjId from #Objects)'
		end 	
        
	-- insert specObjAll  select * from BestDrN..specObjAll  	-- 806 rows 
	--	where ra between 193.75 and 196.25
	--	and  dec between   1.25 and   3.75
	execute spCopyDbSimpleTable  @taskid, @stepid, @SourceDbName, @NewDbName, 'specObjAll', @specTest 
	-- insert specLineAll  select * from BestDrN..specLineAll		-- 38,312 rows
	--	where specObjID in (select specObjID from SpecObjAll) 
	execute spCopyDbSimpleTable  @taskid, @stepid, @SourceDbName, @NewDbName, 'specLineAll', @specTest 
	-- insert SpecLineIndex  select * from BestDrN..SpecLineIndex	-- 27,648 rows
	--	where specObjID in (select specObjID from SpecObjAll) 
	execute spCopyDbSimpleTable  @taskid, @stepid, @SourceDbName, @NewDbName, 'SpecLineIndex', @specTest 
	-- 	where specObjID in (select specObjID from SpecObjAll) 
	execute spCopyDbSimpleTable  @taskid, @stepid, @SourceDbName, @NewDbName, 'ElRedshift', @specTest 
	-- insert XCredshift  select * from BestDrN..XCredshift		--40,704 rows
	--	where specObjID in (select specObjID from SpecObjAll) 
	execute spCopyDbSimpleTable  @taskid, @stepid, @SourceDbName, @NewDbName, 'XCredshift', @specTest 
	-- insert SpecPhotoAll select * from BestDrN..SpecPhotoAll	-- 806 rows   
	execute spCopyDbSimpleTable  @taskid, @stepid, @SourceDbName, @NewDbName, 'SpecPhotoAll', @specTest 
	-- insert PlateX  select * from BestDrN..PlateX			-- 5 rows
	--	where plateID in (select plateID from SpecObjAll)
	if (@AreaRestriction != '')
		set @specTest = ' plateID in (select plateID from ' + @NewDbName + '.dbo.SpecObjAll) '
	execute spCopyDbSimpleTable  @taskid, @stepid, @SourceDbName, @NewDbName, 'PlateX',  @test 
	-- Done with spectra
	-- hope this reclaims some log space
	exec loadsupport.dbo.spNewPhase @taskID, @stepID, 'CHECKPT', 'OK', 'checkpoint'
	set @cmd = 'use  ' + @NewDbName + '; checkpoint '
	execute( @cmd )
	-- hope this reclaims some log space
	truncate table #Objects
	-- insert HoleObj     select * from BestDrN..HoleObj		-- 26 rows
	-- 	where ra between 193.75 and 196.25
	-- 	and  dec between   1.25 and   3.75
	execute spCopyDbSimpleTable  @taskid, @stepid, @SourceDbName, @NewDbName, 'HoleObj', @AreaRestriction 
	-- insert Target select * from BestDrN..Target			-- 2,418  rows  
	-- 	where ra between 193.75 and 196.25
	-- 	and  dec between   1.25 and   3.75
	execute spCopyDbSimpleTable  @taskid, @stepid, @SourceDbName, @NewDbName, 'Target', @AreaRestriction 
	-- insert TargetParam select * from BestDrN..TargetParam	-- 0 rows 
	execute spCopyDbSimpleTable  @taskid, @stepid, @SourceDbName, @NewDbName, 'TargetParam', '' 
	-- insert TargetInfo select * from BestDrN..TargetInfo		-- 2,418 rows 
	-- 	where TargetObjID in (select TargetID from target )
	if (@AreaRestriction != '')
		set @test = ' TargetObjID in (select TargetID from ' + @NewDbName + '.dbo.target)'
	execute spCopyDbSimpleTable  @taskid, @stepid, @SourceDbName, @NewDbName, 'TargetInfo',@test  
	-- insert TileAll  select * from BestDrN..TileALL			-- 962 rows 
	execute spCopyDbSimpleTable  @taskid, @stepid, @SourceDbName, @NewDbName, 'TileAll', '' 
	--	where tile in (select tile from PlateX)
	-- insert TiledTargetAll  select * from BestDrN..TiledTargetAll	-- 607,360 rows
	-- 	where tile in (select tile from Tile)
	if (@AreaRestriction != '')
		set @test = ' tile in (select tile from ' + @NewDbName + '.dbo.Tile) '
	execute spCopyDbSimpleTable  @taskid, @stepid, @SourceDbName, @NewDbName, 'TiledTargetAll', @test, 'targetID',     5e6  
	-- insert TilingRun  select * from BestDrN..TilingRun		-- 53 rows
	--	where tileRun in (select tileRun from TileAll)
	execute spCopyDbSimpleTable  @taskid, @stepid, @SourceDbName, @NewDbName, 'TilingRun', '' 
	-- insert TilingNote  select * from BestDrN..TilingNote		-- 0 rows
	--	where tileRun in (select tileRun from tilingRun)
	execute spCopyDbSimpleTable  @taskid, @stepid, @SourceDbName, @NewDbName, 'TilingNote', '' 
	-- insert TilingInfo  select * from BestDrN..TilingInfo		-- 557,647 rows
	--	where tileRun in (select tileRun from tilingRun) 
	if (@AreaRestriction != '')
		set @test =  ' tileRun in (select tileRun from ' + @NewDbName + '.dbo.tilingRun)'
	execute spCopyDbSimpleTable  @taskid, @stepid, @SourceDbName, @NewDbName, 'TilingInfo', @test 
	-- insert TilingGeometry  select * from BestDrN..TilingGeometry	-- 165 rows  
	--	where tileRun in (select tileRun from tilingRun)
	execute spCopyDbSimpleTable  @taskid, @stepid, @SourceDbName, @NewDbName, 'TilingGeometry', ''  
	--- shorten the log.
	exec loadsupport.dbo.spNewPhase @taskID, @stepID, 'CHECKPT', 'OK', 'checkpoint'
	set @cmd = 'use  ' + @NewDbName + '; checkpoint '
	execute( @cmd )
	------ Photo files (incremental copy of PhotoObjAll, PhotoTag, PhotoProfile
	--insert ProfileDefs  select * from BestDrN..ProfileDefs  	-- 15 rows  
	--insert Rmatrix      select * from BestDrN..Rmatrix  		--   6 rows  
	
	-- insert photoObjAll     select * from BestDrN..photoObjAll   	-- 200,276 rows  
	-- 	where ra between 193.75 and 196.25			 
	-- 	and  dec between   1.25 and   3.75	
	execute spCopyDbSimpleTable  @taskid, @stepid, @SourceDbName, @NewDbName, 
						'photoObjAll', @AreaRestriction , 'objID', 1e6
	-- insert photoTag  select * from BestDrN..photoTag  		-- 200,276 rows   
	-- 	where ra between 193.75 and 196.25			   
	-- 	and  dec between   1.25 and   3.75	
	--- shorten the log.
	exec loadsupport.dbo.spNewPhase @taskID, @stepID, 'CHECKPT', 'OK', 'checkpoint'
	set @cmd = 'use  ' + @NewDbName + '; checkpoint '
	execute( @cmd )
	execute spCopyDbSimpleTable  @taskid, @stepid, @SourceDbName, @NewDbName, 
						'photoTag',    @AreaRestriction , 'objID',  5e6
	--- shorten the log.
	exec loadsupport.dbo.spNewPhase @taskID, @stepID, 'CHECKPT', 'OK', 'checkpoint'
	set @cmd = 'use  ' + @NewDbName + '; checkpoint '
	execute( @cmd )
	if (@AreaRestriction != '')
		begin
		truncate table #Objects
		set @cmd = ' insert #Objects select ObjID ' 
			+  ' from '  + @NewDbName + '.dbo.PhotoTag ' 
		execute (@cmd)
		set @test = ' objID in (select  objID from  #Objects)'
		end
        execute spCopyDbSimpleTable  @taskid, @stepid, @SourceDbName, @NewDbName,
						'PhotoAuxAll', @test, 'objID', 25e6 
	-- insert MaskedObject  select * from BestDrN..MaskedObject	-- 2,100  rows 
	-- 	where objID in (select  objID from PhotoTag)
	execute spCopyDbSimpleTable  @taskid, @stepid, @SourceDbName, @NewDbName, 
						'MaskedObject', @test , 'objID', 20e6  
	-- insert AtlasOutline  select * from BestDrN..AtlasOutline			-- 193,996 rows
	-- 	where objID in (select  objID from PhotoTag)
	execute spCopyDbSimpleTable  @taskid, @stepid, @SourceDbName, @NewDbName, 
						'AtlasOutline',      @test , 'objID', 20e6 
	--insert PhotoProfile  select * from BestDrN..PhotoProfile	-- 6,981,758 rows 
	--	where objID in (select  objID from PhotoTag)
	execute spCopyDbSimpleTable  @taskid, @stepid, @SourceDbName, @NewDbName, 
						'PhotoProfile', @test , 'objID', 25e6 
	-- insert PhotoZ  select * from BestDrN..PhotoZ			-- 0 rows 
	-- 	where objID in (select  objID from PhotoTag)
	--- shorten the log.
	exec loadsupport.dbo.spNewPhase @taskID, @stepID, 'CHECKPT', 'OK', 'checkpoint'
	set @cmd = 'use  ' + @NewDbName + '; checkpoint '
	execute( @cmd )
	execute spCopyDbSimpleTable  @taskid, @stepid, @SourceDbName, @NewDbName, 
						'PhotoZ',        @test , 'objID', 10e6
	execute spCopyDbSimpleTable  @taskid, @stepid, @SourceDbName, @NewDbName, 
						'PhotoZ2',       @test , 'objID', 10e7
	-- insert First  select * from BestDrN..First			-- 163 rows
	-- 	where objID in (select  objID from PhotoTag)
	execute spCopyDbSimpleTable  @taskid, @stepid, @SourceDbName, @NewDbName, 'First', @test 
	-- insert USNO  select * from BestDrN..USNO			-- 21,422 
	-- 	where objID in (select  objID from PhotoTag)
	execute spCopyDbSimpleTable  @taskid, @stepid, @SourceDbName, @NewDbName, 'USNO',  @test 
	execute spCopyDbSimpleTable  @taskid, @stepid, @SourceDbName, @NewDbName, 'ProperMotions', @test, 'objID', 1e7 
	-- insert Rosat  select * from BestDrN..Rosat			-- 323 rows
	-- 	where objID in (select  objID from PhotoTag)
	execute spCopyDbSimpleTable  @taskid, @stepid, @SourceDbName, @NewDbName, 'Rosat', @test
	-- copy all of RC3 and Stetson 
	execute spCopyDbSimpleTable  @taskid, @stepid, @SourceDbName, @NewDbName, 'RC3',   '' 
	execute spCopyDbSimpleTable  @taskid, @stepid, @SourceDbName, @NewDbName, 'Stetson','' 
	--- shorten the log.
	exec loadsupport.dbo.spNewPhase @taskID, @stepID, 'CHECKPT', 'OK', 'checkpoint'
	set @cmd = 'use  ' + @NewDbName + '; checkpoint '
	execute( @cmd )
	-- insert zone  select * from BestDrN..zone			-- 162,657 rows
	-- 	where objID in (select  objID from PhotoTag)
	execute spCopyDbSimpleTable  @taskid, @stepid, @SourceDbName, @NewDbName, 
					'Zone', @test, 'zoneID' ,25e6
	-- insert Neighbors  select * from BestDrN..Neighbors		-- 1,057,304 rows
	--	where objID in (select objID from PhotoTag)
	--	and neighborObjID in (select  objID from PhotoTag)
	if (@AreaRestriction != '')
		set @test =  '             objID in (select objID from #Objects) '
		 	   + ' and neighborObjID in (select objID from #Objects) '
	execute spCopyDbSimpleTable  @taskid, @stepid, @SourceDbName, @NewDbName, 
					'Neighbors', @test, 'objID', 25e6 
	--- shorten the log.
	exec loadsupport.dbo.spNewPhase @taskID, @stepID, 'CHECKPT', 'OK', 'checkpoint'
	set @cmd = 'use  ' + @NewDbName + '; checkpoint '
	execute( @cmd )
	-- insert Match  select * from BestDrN..Match			-- 22,276 rows 
	-- 	where objID1 in (select  objID from PhotoTag)
	-- 	  and objID2 in (select  objID from PhotoTag)
	if (@AreaRestriction != '')
		set @test = '     objID1 in (select objID from #Objects) '
		 	  + ' and objID2 in (select objID from #Objects) '
	execute spCopyDbSimpleTable  @taskid, @stepid, @SourceDbName, @NewDbName, 'Match', @test 
	-- insert MatchHead select * from BestDrN..MatchHead  		-- 11,126rows 
	-- 	where objID in (select  matchHead from Match)
	if (@AreaRestriction != '')
		set @test = ' objID in (select matchHead from ' + @NewDbName + '.dbo.Match) '
	execute spCopyDbSimpleTable  @taskid, @stepid, @SourceDbName, @NewDbName, 'MatchHead', @test 
	-- insert Field  select * from BestDrN..Field			-- 251 rows 
	-- 	where fieldid in (select fieldid from PhotoTag)
	if (@AreaRestriction != '')
		set @test = ' fieldid in (select fieldid from ' + @NewDbName + '.dbo.PhotoTag) '
	execute spCopyDbSimpleTable  @taskid, @stepid, @SourceDbName, @NewDbName, 'Field', @test 
	-- insert RunQA select * from BestDrN..RunQA			-- 251 rows 
	-- 	where fieldID in (select fieldID from Field)
	execute spCopyDbSimpleTable  @taskid, @stepid, @SourceDbName, @NewDbName, 'RunQA',     @test 
	execute spCopyDbSimpleTable  @taskid, @stepid, @SourceDbName, @NewDbName, 'TargRunQA', @test 
	-- insert FieldProfile  select * from BestDrN..FieldProfile	-- 12,408 rows 
	-- 	where fieldID in (select fieldID from Field)'
	execute spCopyDbSimpleTable  @taskid, @stepid, @SourceDbName, @NewDbName, 'FieldProfile', @test 
	-- insert Frame  select * from BestDrN..Frame			-- 1,004 rows 
	-- 	where fieldID in (select fieldID from Field)
	-- 	and zoom in (0,10,20,30)
	if (@AreaRestriction != '')
		set @test = @test + ' and zoom in (0,10,20,30)'
	execute spCopyDbSimpleTable  @taskid, @stepid, @SourceDbName, @NewDbName, 'Frame', @test, 'fieldID' 
	--- shorten the log.
	exec loadsupport.dbo.spNewPhase @taskID, @stepID, 'CHECKPT', 'OK', 'checkpoint'
	set @cmd = 'use  ' + @NewDbName + '; checkpoint '
	execute( @cmd )
	-- insert Mask	   select distinct m.* 				-- 18,965  rows  
	-- 		   from field f join BestDrN..Mask m 
	-- 		         on f.run    = m.run
	--        		and f.rerun  = m.rerun
	-- 			and f.camcol = m.camcol
	-- 			and f.field  = m.field
	if (@AreaRestriction != '') 
		set @cmd = ' insert ' + @NewDbName + '.dbo.Mask '
			 + ' select distinct m.* '
			 + ' from ' + @NewDbName + '.dbo.Field f join ' + @SourceDbName + '.dbo.Mask m '
			 + '             on f.run    = m.run '
			 + '            and f.rerun  = m.rerun '
			 + '            and f.camcol = m.camcol '
			 + '            and f.field  = m.field '
	else 
		set @cmd = ' insert ' + @NewDbName + '.dbo.Mask '
			 + ' select distinct m.* '
			 + ' from ' + @SourceDbName + '.dbo.Mask m '		
	exec loadsupport.dbo.spNewPhase @taskID, @stepID, 'TABCOPY', 'OK', @cmd
	execute( @cmd )
	-- insert Segment  select * from BestDrN..Segment		-- 1248 rows 
	--	where segmentID in (select segmentID from Field)
	execute spCopyDbSimpleTable  @taskid, @stepid, @SourceDbName, @NewDbName, 'Segment', '' 
	-- insert Chunk  select * from BestDrN..Chunk			-- 71 rows 
	-- 	where chunkID in (select chunkID from segment) 
	execute spCopyDbSimpleTable  @taskid, @stepid, @SourceDbName, @NewDbName, 'Chunk', '' 
	--insert StripeDefs  select * from BestDrN..StripeDefs		-- 3 rows set by spCreateNullDB
	--	where [stripe] in (select [stripe] from chunk) 
	------------Target stuff
	if (@AreaRestriction != '')
		set @test = ' objID in (select objID from #Objects)'
	-- insert BestTarget2Sector  select * from BestDrN..BestTarget2Sector -- 9,256 rows  
	-- 	where objID in (select  objID from PhotoTag)
	execute spCopyDbSimpleTable  @taskid, @stepid, @SourceDbName, @NewDbName, 'BestTarget2Sector', @test 
	-- insert Sector select * from BestDrN..Sector			-- 16,890 rows 
	execute spCopyDbSimpleTable  @taskid, @stepid, @SourceDbName, @NewDbName, 'Sector', ''
	-- insert Region2Box select * from BestDrN..Region2Box		-- 362 rows
	execute spCopyDbSimpleTable  @taskid, @stepid, @SourceDbName, @NewDbName, 'Region2Box', ''

	if (@AreaRestriction != '') drop table #Objects

	--==================================================================
	-- set identity_insert region on					-- 22,101 rows 
	--   insert region (regionID, [id],  type, comment, ismask, area, regionString, sql, xml)
	--     	select regionID, [id],  type, comment, ismask, area, regionString, sql, xml 
	-- 	from  BestDrN..region
	-- 	where regionID in (select regionID from Sector) 
	--  set identity_insert region off	                          
	set @cmd = ' set identity_insert  ' + @NewDbName + '.dbo.region on ; '
	set @cmd = @cmd  
		 + ' insert ' + @NewDbName + '.dbo.region (regionID, [id],  type, comment, ismask, area, regionString, sql, xml)'
		 + ' select regionID, [id],  type, comment, ismask, area, regionString, sql, xml  '
		 + ' from ' + @SourceDbName + '.dbo.region ;'  
	set @cmd = @cmd  
		 + ' set identity_insert  ' + @NewDbName + '.dbo.region off '
	exec loadsupport.dbo.spNewPhase @taskID, @stepID, 'TABCOPY', 'OK', @cmd
	execute(@cmd)                              
	
	-- insert RegionConvex ( regionID, convexID, type, radius, ra, dec, x,y,z,c, htmID, convexString ) -- 16,571 rows 
	-- 	select regionID, convexID, type, radius, ra, dec, x,y,z,c, htmID, convexString 
	-- 	from BestDrN..RegionConvex					 
	-- 	where regionID in (select regionID from region)
	execute spCopyDbSimpleTable  @taskid, @stepid, @SourceDbName, @NewDbName, 'RegionConvex', ''
	-- set identity_insert RegionArcs on				-- 105,179 rows  
	-- insert RegionArcs ( regionID, convexID, constraintID, patch, state, draw, ra1, dec1, ra2, dec2, x,y,z,c, length, arcid )
	-- 	select regionID, convexID, constraintID, patch, state, draw, ra1, dec1, ra2, dec2, x,y,z,c, length, arcid
	-- 	from BestDrN..RegionArcs					 
	--	where regionID in (select regionID from region)
	-- set identity_insert RegionArcs off
	set @cmd = ' set identity_insert  ' + @NewDbName + '.dbo.RegionArcs on ; '
	set @cmd = @cmd  
		 + ' insert ' + @NewDbName + '.dbo.RegionArcs  ( regionID, convexID, constraintID, patch, state, draw, ra1, dec1, ra2, dec2, x,y,z,c, length, arcid )'
		 + ' select regionID, convexID, constraintID, patch, state, draw, ra1, dec1, ra2, dec2, x,y,z,c, length, arcid '
		 + ' from ' + @SourceDbName + '.dbo.RegionArcs ;'  
	set @cmd = @cmd  
		 + ' set identity_insert  ' + @NewDbName + '.dbo.RegionArcs off '
	exec loadsupport.dbo.spNewPhase @taskID, @stepID, 'TABCOPY', 'OK', @cmd
	execute(@cmd) 
	-- set identity_insert HalfSpace on				-- 101,327 rows  
	-- insert HalfSpace ( constraintID, regionID, convexID, x,y,z,c )
	--	select constraintID, regionID, convexID, x,y,z,c 
	--	from BestDrN..HalfSpace					 
	--	where regionID in (select regionID from region)
	--set identity_insert HalfSpace off
	--
	set @cmd = 'set identity_insert  ' + @NewDbName + '.dbo.HalfSpace on ; '
	set @cmd = @cmd  
		 + ' insert ' + @NewDbName + '.dbo.HalfSpace ( constraintID, regionID, convexID, x,y,z,c ) '
		 + ' select constraintID, regionID, convexID, x,y,z,c '
		 + ' from ' + @SourceDbName + '.dbo.HalfSpace ; ' 
	set @cmd = @cmd  
		 + 'set identity_insert  ' + @NewDbName + '.dbo.HalfSpace off '
	exec loadsupport.dbo.spNewPhase @taskID, @stepID, 'TABCOPY', 'OK', @cmd
	execute(@cmd) 
	
	-- insert Sector2Tile select * from BestDrN..Sector2Tile  		-- 65,936 rows   
	-- 	where tile in (select tile from TileAll) 
	if (@AreaRestriction != '')
		set @test = ' tile in (select tile from ' + @NewDbName + '.dbo.TileAll) '
	execute spCopyDbSimpleTable  @taskid, @stepid, @SourceDbName, @NewDbName, 'Sector2Tile', @test

	------------------------------------------------------------------------------
	---  copy QSO catalogs.			 
	--   insert QsoCatalogAll select * from BestDrN..QsoBunch	 
	-- 	where ra between 193.75 and 196.25			 
	-- 	and  dec between   1.25 and   3.75	
        if @AreaRestriction != '' set @test = ' HeadObjID = 0 or ' + @AreaRestriction
 	execute spCopyDbSimpleTable  @taskid, @stepid, @SourceDbName, @NewDbName, 'QsoBunch', @test
	-- insert QsoConcordance select * from BestDrN..QsoConcordance	 
	-- 	where ra between 193.75 and 196.25			 
	-- 	and  dec between   1.25 and   3.75
	if @AreaRestriction != '' set @test = 'HeadObjID = 0 or '
			                    + 'HeadObjID in (select HeadObjID from  ' + @NewDbName + '.dbo.QsoBunch)' 
			     else set @test = ' 1 = 1 ' -- null test
	set @cmd= ' insert ' + @NewDbName + '.dbo.QsoConcordanceAll '
		+ ' select '
		+ '[HeadObjID], [QsoPrimary], [TargetObjID], [SpecObjID], [BestObjID],'
		+ '[TargetQsoTargeted], [SpecQsoConfirmed], [SpecQsoUnknown], [SpecQsoLargeZ], '
		+ '[SpecQsoTargeted], [BestQsoTargeted], [dist_Target_Best], [dist_Target_Spec], '
		+ '[dist_Best_Spec], [psfmag_i_diff], [psfmag_g_i_diff], [SpecRa], [SpecDec], [SpecCx], '
		+ '[SpecCy], [SpecCz], [SpecZ], [SpecZerr], [SpecZConf], [SpecZStatus], [SpecZWarning], '
		+ '[SpecClass], [SpecPlate], [SpecFiberID], [SpecMjd], [SpecSciencePrimary], [SpecPrimTarget], '
		+ '[SpecTargetID], [SpecTargetObjID], [SpecBestObjID], [SpecLineID], [SpecMaxVelocity], [SpecPlateSn1_i], '
		+ '[SpecPlateSn2_i], [targetRa], [targetDec], [targetCx], [targetCy], [targetCz], [targetPsfMag_u], '
		+ '[targetPsfMag_g], [targetPsfMag_r], [targetPsfMag_i], [targetPsfMag_z], [targetPsfMagErr_u], '
		+ '[targetPsfMagErr_g], [targetPsfMagErr_r], [targetPsfMagErr_i], [targetPsfMagErr_z], [targetExtinction_u], '
		+ '[targetExtinction_g], [targetExtinction_r], [targetExtinction_i], [targetExtinction_z], [targetType], '
		+ '[targetMode], [targetStatus], [targetFlags], [targetFlags_u], [targetFlags_g], [targetFlags_r], '
		+ '[targetFlags_i], [targetFlags_z], [targetRowC_i], [targetColC_i], [targetInsideMask], [targetPrimTarget], '
		+ '[targetPriTargHiZ], [targetPriTargLowZ], [targetPriTargFirst], [targetFieldID], [targetFieldMjd], '
		+ '[targetFieldQuality], [targetFieldCulled], [targetSectorID], [targetFirstID], [targetFirstPeak], '
		+ '[targetRosatID], [targetRosatCps], [targetMi], [targetUniform], [bestRa], [bestDec], [bestCx], [bestCy], '
		+ '[bestCz], [bestPsfMag_u], [bestPsfMag_g], [bestPsfMag_r], [bestPsfMag_i], [bestPsfMag_z], [bestPsfMagErr_u],' 
		+ '[bestPsfMagErr_g], [bestPsfMagErr_r], [bestPsfMagErr_i], [bestPsfMagErr_z], [bestExtinction_u], '
		+ '[bestExtinction_g], [bestExtinction_r], [bestExtinction_i], [bestExtinction_z], [bestType], [bestMode], '
		+ '[bestFlags], [bestFlags_u], [bestFlags_g], [bestFlags_r], [bestFlags_i], [bestFlags_z], [bestRowC_i], '
		+ '[bestColC_i], [bestInsideMask], [bestPrimTarget], [bestPriTargHiZ], [bestPriTargLowZ], [bestPriTargFirst], '
		+ '[bestFieldID], [bestFieldMjd], [bestFieldQuality], [bestFieldCulled], [bestFirstID], [bestFirstPeak], '
		+ '[bestRosatID], [bestRosatCps], [bestMi] '
		+ ' from ' + @SourceDbName + '.dbo.QsoConcordanceAll ' 
		+ ' where ' + @test + ' ;'
	execute (@cmd)
	--execute spCopyDbSimpleTable  @taskid, @stepid, @SourceDbName, @NewDbName, 'QsoConcordanceAll', @test 
	if @AreaRestriction != '' set @test = ' HeadObjID in (select HeadObjID from  ' + @NewDbName + '.dbo.QsoBunch)' 
 	set @cmd = ' insert ' + @NewDbName + '.dbo.QsoCatalogAll '
		 + ' select '
		 + ' [HeadObjID],  [QsoPrimary], [HeadObjType], [TargetObjID], [SpecObjID], [BestObjID], [TargetQsoTargeted], '
		 + ' [SpecQsoConfirmed], [SpecQsoUnknown], [SpecQsoLargeZ], [SpecQsoTargeted], [BestQsoTargeted], [dist_Target_Best], '
		 + ' [dist_Target_Spec], [dist_Best_Spec], [psfmag_i_diff], [psfmag_g_i_diff] '
		 + ' from ' + @SourceDbName + '.dbo.QsoCatalogAll ' 
		 + ' where ' + @test + ' ;'
	execute (@cmd)
--	execute spCopyDbSimpleTable  @taskid, @stepid, @SourceDbName, @NewDbName, 'QsoCatalogAll',     @test  
	if @AreaRestriction != '' set @test = 'BestObjID = 0 or '
			                    + 'HeadObjID in (select HeadObjID from  ' + @NewDbName + '.dbo.QsoBunch)' 	
	execute spCopyDbSimpleTable  @taskid, @stepid, @SourceDbName, @NewDbName, 'QsoBest',           @test  
	if @AreaRestriction != '' set @test = 'TargetObjID = 0 or '
			                    + 'HeadObjID in (select HeadObjID from  ' + @NewDbName + '.dbo.QsoBunch)' 	
	execute spCopyDbSimpleTable  @taskid, @stepid, @SourceDbName, @NewDbName, 'QsoTarget',         @test  
	if @AreaRestriction != '' set @test = 'SpecObjID = 0 or '
			                    + 'HeadObjID in (select HeadObjID from  ' + @NewDbName + '.dbo.QsoBunch)' 	
	execute spCopyDbSimpleTable  @taskid, @stepid, @SourceDbName, @NewDbName, 'QsoSpec',           @test  
	--- shorten the log.
	exec loadSupport.dbo.spNewPhase @taskid, @stepid, 'CHECKPT', 'OK', 'checkpoint'
	set @cmd = 'use  ' + @NewDbName + '; checkpoint '
	execute( @cmd )

	-------======================================================================
	-- done, build indices 
	-- exec spIndexBuildSelection @taskID,@stepID,'I,F', 'ALL'
	set @cmd =  @NewDbName + '.dbo.spIndexBuildSelection ' 
		  + cast( @taskID as varchar(30)) + ' , ' + cast(@stepID as varchar(30)) + ', ''I'', ''ALL'''
	exec loadSupport.dbo.spNewPhase @taskid, @stepid, 'BUILDI', 'OK', @cmd
	execute( @cmd )
	set @cmd =  @NewDbName + '.dbo.spIndexBuildSelection ' 
		  + cast( @taskID as varchar(30)) + ' , ' + cast(@stepID as varchar(30)) + ', ''F'', ''ALL'''
	exec loadSupport.dbo.spNewPhase @taskid, @stepid, 'BUILDFK', 'OK', @cmd
	execute( @cmd )

	--- shorten the log.
	exec loadSupport.dbo.spNewPhase @taskid, @stepid, 'CHECKPT', 'OK', 'checkpoint'
	set @cmd = 'use  ' + @NewDbName + '; checkpoint '
	execute( @cmd )

	-------======================================================================
	-- reorg anything that is fragmented. (assume things are organized for now)
	--set @cmd =  @NewDbName +'.dbo.spReorg'
	--exec dbo.spNewPhase @taskid, @stepid, 'REORG', 'OK', @cmd
	--execute( @cmd )

	-------======================================================================
	--  Shrink DB (truncating space at the end) -- don't do any disorganization. 
	exec loadSupport.dbo.spNewPhase @taskid, @stepid, 'SHRINK', 'OK', @cmd
	SET @cmd = 'DBCC SHRINKDATABASE  ( N''' + @NewDbName + ''', 1, TRUNCATEONLY )  WITH  NO_INFOMSGS '
	execute( @cmd )

	-- say goodbye
   	EXEC loadsupport.dbo.spEndStep @taskID, @stepID, OK, 'spCopyDbSubset complete.', 'spCopyDbSubset complete.';
   	EXEC loadsupport.dbo.spDone @taskID ;
 
	end
GO
/****** Object:  StoredProcedure [dbo].[spCreateWeblogDB]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE PROCEDURE [dbo].[spCreateWeblogDB] (@taskID INT, @stepID INT)
----------------------------------------------------------------
--/H Run any patches that may have accumulated during the loading
--/H process.
--/A -----------------------------------------------------------
--/T Run the patches recorded in the nextReleasePatches.sql file
--/T in the patches directory.
----------------------------------------------------------------
AS
BEGIN
    DECLARE @ret int, @sqldir varchar(128), @status varchar(32),
	    @msg varchar(2048), @weblogFileName varchar(256),
	    @cmd nvarchar(2048);
    IF EXISTS (SELECT [name] FROM master.dbo.sysdatabases
		WHERE [name] = N'weblog' )
	BEGIN
	    SET @status = 'OK';
	    SET @msg = 'Weblog DB already exists.';
	END
    ELSE
        BEGIN
	    SELECT @sqldir=value 
		FROM loadsupport..Constants WITH (nolock)
		WHERE name='sqldir';
	    SET @weblogFileName = '..\log\webLogDBCreate.sql';
	    SET @cmd = 'DIR '+@sqldir+@weblogFileName;
	    EXEC @ret = master.dbo.xp_cmdshell @cmd, no_output;
	    IF @ret = 0
		BEGIN
		    EXEC @ret=dbo.spRunSQLScript @taskid, @stepid,
			'Create Weblog DB', @sqldir, @weblogFileName,
			'master', 'C:\temp\weblogDBCreateLog.txt'
	    	    IF @ret = 0
			BEGIN
			    SET @status = 'OK';
			    SET @msg = 'Weblog DB created successfully.';
			END
		    ELSE
			BEGIN
			    SET @status = 'WARNING';
			    SET @msg = 'Problem with creating Weblog DB - script '
					+ @sqldir + @weblogFileName + ' failed.';
			END
		END
	    ELSE
		BEGIN
		    SET @status = 'WARNING';
		    SET @msg = 'Problem with creating Weblog DB - file '+@sqldir+@weblogFileName+' not found.';
		END
	END
 
    -- give phase message telling of success.
    EXEC spNewPhase @taskID, @stepID, 'spCreateWeblogDB', @status, @msg;
    -----------------------------------------------------
    RETURN (@ret);
END
GO
/****** Object:  StoredProcedure [dbo].[spDocEnum]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spDocEnum](@fieldname varchar(64))
------------------------------------------------------
--/H Display the properly rendered values from DataConstants 
--
--/T The parameter is the name of the enumerated field in DataConstants.
--/T The type and length is taken from the View of corresponding name.
--/T <br><samp>
--/T exec spDocEnum 'PhotoType'
--/T</samp>
------------------------------------------------------
AS BEGIN
	SET NOCOUNT ON;
	DECLARE @type varchar(32),
		@length int;
	DECLARE @cmd NVARCHAR(256)
	
	IF EXISTS (SELECT name FROM   sysobjects 
	   WHERE  name = @fieldname AND xtype = 'V')
	   BEGIN 
	      SET @cmd = 'SELECT * FROM ' + @fieldname + ' ORDER BY value';
	      EXEC (@cmd)
	   END
	ELSE   
	   BEGIN
	      SELECT	@type=t.name,
		   @length=c.length
	      FROM syscolumns c WITH (nolock), 
	 	   sysobjects o WITH (nolock),
		   systypes t WITH (nolock)
	      WHERE c.[id] = o.[id]
	        and o.xtype  = 'V'
	        and t.xtype  = c.xtype
	        and c.[name] = 'value'
	       and o.[name] = @fieldname;
	       --
	       SELECT	name, 
	 	   dbo.fEnum(value,@type, @length) as value,
		   description
	       FROM DataConstants WITH (nolock)
	      WHERE field=@fieldname
                AND name != ''
	      ORDER BY value
           END 
END

GO
/****** Object:  StoredProcedure [dbo].[spDocKeySearch]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spDocKeySearch] (@key varchar(32), @option int)
-------------------------------------------------------
--/H Search Columns table for @key
-- ----------------------------------------------------
--/T @option sets the scope of the search:  
--/T <li>1 is Columns, 
--/T <li>2 is Constants,
--/T <li>4 is SDSSConstants, 
--/T <li>8 is DBObjects
--/T <br> 
--/T Returns those rows, which had a hit. They will 
--/T have a weblink to the parent table.
--/T <br>
--/T <samp>
--/T exec spDocKeySearch 'lupt', 1
--/T </samp>
-------------------------------------------------------
AS BEGIN
    --
    DECLARE @skey varchar(40);
    SET @skey = '%'+UPPER(@key)+'%';
    --
    IF (@option & 1)<>0
    BEGIN
		SELECT 	'<a href="description.asp?n='+c.tablename+'&t=U">'
				+c.tablename+'</a>' as tablename,
				c.name, c.unit, c.description
		FROM DBColumns c, DBObjects o
		WHERE c.tablename = o.name
		  and o.access='U' 
		  and (UPPER(c.name) LIKE @skey
			OR UPPER(c.description) LIKE @skey
			OR UPPER(c.unit) LIKE @skey
			)
    END
    --
    IF (@option & 2)<>0
    BEGIN
		SELECT '<a href="enum.asp?n='+field+'">'+field+'</a>' as field,
			name, value, description
		FROM DataConstants
		WHERE UPPER(name) LIKE @skey
	       OR UPPER(description) LIKE @skey

    END
    --
    IF (@option & 4) <> 0
    BEGIN
		SELECT name, value, unit, description
		FROM SDSSConstants
		WHERE (    UPPER(name) LIKE @skey
			    OR UPPER(description) LIKE @skey
			    OR UPPER(unit) LIKE @skey
			)
    END
    --
    IF (@option & 8)<>0
    BEGIN
		SELECT '<a href="description.asp?n='+name+'&t='+type+'">'
			+name+'</a>' as name, type, description
		FROM DBObjects
		WHERE access='U'
		  and (  UPPER(name) LIKE @skey
			  OR UPPER(description) LIKE @skey
			)
    END
    --
END

GO
/****** Object:  StoredProcedure [dbo].[spDropIndexAll]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spDropIndexAll]
-------------------------------------------------------------
--/H Drops all indices on user tables
--/A
--/T <br><samp>
--/T <br> exec  dbo.spDropIndexAll
--/T </samp>  
-------------------------------------------------------------
AS BEGIN
	SET NOCOUNT ON;
	--
	-- drop foreign keys
	EXEC spIndexDrop 'F'
	-- drop primary keys
	EXEC spIndexDrop 'K'
	-- drop indices
	EXEC spIndexDrop 'I'
	--
	PRINT 'Dropped all indices on user tables'
END

GO
/****** Object:  StoredProcedure [dbo].[spEndStep]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spEndStep] (@taskid int, @stepid int, 
	@status varchar(16), @stepmsg varchar(2048), @phasemsg varchar(2048)
)
-----------------------------------------------------------------
--/H Wraps the loadsupport spEndStep procedure for local use
--/A
--/T If @taskid=0, only prints the message
-----------------------------------------------------------------
AS
BEGIN
	-------------------------------------------------
	SET NOCOUNT ON;
	--
	IF @taskid>0
	    EXEC loadsupport.dbo.spEndStep @taskid, @stepid, 
		@status, @stepmsg, @phasemsg;
	ELSE
	    EXEC spNewPhase @taskID, @stepID, 'FINISHING', @status, @phasemsg
	-------------------------------------------------
END

GO
/****** Object:  StoredProcedure [dbo].[spExecuteSQL]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE PROCEDURE [dbo].[spExecuteSQL] (@cmd VARCHAR(MAX), @limit INT = 1000, 
    @webserver      VARCHAR(64) = '',   -- the url
	@winname	VARCHAR(64) = '',   -- the windows name of the server
    @clientIP   VARCHAR(50)  = 0,   -- client IP address 
	@access		VARCHAR(64) = '',    -- subsite of site,  if 'collab' statement 'hidden'
	@system		TINYINT = 0,         -- 1 if this is a system query from a skyserver page 
	@maxQueries	SMALLINT = 60,		-- maximum number of queries per minute
	@log		BIT		 = 1,		-- 1 to log queries in Weblog DB, 0 to omit logging
	@filter		BIT		 = 1,		-- 1 to filter for potentially harmful SQL, 0 to omit filtering
	@throttle	BIT		 = 0		-- 1 to restrict users to @maxQueries per minute, 0 to omit throttling
) 
------------------------------------------------------------------------------- 
--/H Procedure to safely execute an SQL select statement 
------------------------------------------------------------------------------- 
--/T The procedure casts the string to lowercase (this could affect some search statements) 
--/T It rejects strings continuing semicolons; 
--/T It then discards duplicate blanks, xp_, sp_, fn_, and ms_ substrings. 
--/T we are guarding aginst things like "select dbo.xp_cmdshell('format c');" 
--/T Then, if the "limit" parameter is > 0 (true), we insist that the 
--/T   statement have a top x in it for x < 1000, or we add a TOP 1000 clause. 
--/T Once the SELECT statement is transformed, it is executed 
--/T and returns the answer set or an error message.   <br> 
--/T All the SQL statements are journaled into WebLog.dbo.SQLlog. 
--/T <samp>EXEC dbo.spExecuteSQL('Select count(*) from PhotoObj')</samp> 
------------------------------------------------------------------------------- 
AS 
 
        BEGIN 
        SET NOCOUNT ON 
        DECLARE @inputCmd varchar(7800)                 -- safe copy of command for log 
													    -- also, truncated to varchar(7800) for weblog db (why 7800??)
        SET 	@inputCmd = @cmd                            
        --      SET @cmd = LOWER(@cmd)+ ' ';            -- makes parsing easier 
        SET 	@cmd = @cmd + ' '; 
        DECLARE @oldCmd     VARCHAR (MAX);             -- temporary copy of command 
	DECLARE @error      INT;			-- error number
        DECLARE @errorMsg VARCHAR(100), @ipAddr VARCHAR(100);		-- error msg 
	DECLARE @serverName varchar(32);		-- name of this databaes server
	DECLARE @dbName     VARCHAR(32);		-- name of this database
	SET 	@serverName = @@servername;
	SELECT @dbname = [name] FROM master.dbo.sysdatabases WHERE dbid = db_id() 
        DECLARE @i          INT;                        -- token scan offset 
	DECLARE @isVisible  INT;			-- flag says sql is visible to internet queries
	SET @isVisible = 1;
	IF (UPPER(@access) LIKE '%COLLAB%') SET @isVisible = 0;  -- collab is invisible


	--==================================================================================
	-- throttle 
	--==================================================================================
	IF (@throttle = 1)
	BEGIN		
		-- Restrict users to a certain number of queries per minute to
		-- prevent crawlers from hogging the system.
	
		IF (@system = 0)	-- if not a system (internal) query from skyserver
			BEGIN

			DECLARE @ret INT, @nQueries INT
			SET @maxQueries = 60	-- max queries per minute limit.

		
		
			--check to see if RecentQueries exists (compatibility with older DR's)
			if (exists (
				select * from information_schema.tables 
				where table_name = 'RecentQueries' ))
			begin
			-- first delete elements that are older than the window sampled.
			-- RecentRequests will typically have 4 * @maxQueries at peak
			-- times (at a peak rate of 4 queries/second).
			DELETE RecentQueries
				WHERE lastQueryTime < DATEADD(ss,-60,CURRENT_TIMESTAMP)

			-- now check how many queries this IP submitted within the last minute.
			-- if more than @maxQueries, reject the query with an error message
			-- if not, insert IP into recent requests log and run query
				SELECT @nQueries=count(*) FROM RecentQueries WHERE ipAddr=@clientIP
					IF (@nQueries > @maxQueries)
					BEGIN
						SET @errorMsg = 'ERROR: Maximum ' + cast(@maxQueries as varchar(3))
					+ ' queries allowed per minute. Rejected query: '; 
						GOTO bottom; 
					END 
				ELSE
					INSERT RecentQueries VALUES (@clientIP, CURRENT_TIMESTAMP)
				end  -- if RecentQueries exists
			end -- IF (@system = 0)    -- not a system query
		
		END -- if (@throttle = 1) 
		--============================================================================
		--  end throttle 
		--============================================================================ 
		

		--============================================================================
		-- filter
		--============================================================================
		if (@filter = 1)
		BEGIN
			-- parse command to remove dangerous SQL, semi-colons, multiple statements, etc
			DECLARE @top varchar(20); 
			SET @top = ' top '+cast(@limit as varchar(20))+' ';                          
			-------------------------------------------------------------------------- 
			-- Remove potentially dangerous expressions from the string. 
			UNTIL:  BEGIN 
					SET @oldCmd = @cmd; 
					SET @cmd = dbo.fReplaceMax(@cmd, '.xp_',   '#'); -- discard extended SPs               
					SET @cmd = dbo.fReplaceMax(@cmd, '.sp_',   '#'); -- discard stored procedures 
					SET @cmd = dbo.fReplaceMax(@cmd, '.fn_',   '#'); -- discard functions 
					SET @cmd = dbo.fReplaceMax(@cmd, '.ms_',   '#'); -- discard microsoft extensions 
					SET @cmd = dbo.fReplaceMax(@cmd, '.dt_',   '#'); -- discard microsoft extensions 
					SET @cmd = dbo.fReplaceMax(@cmd, ' xp_',   '#'); -- discard extended SPs               
					SET @cmd = dbo.fReplaceMax(@cmd, ' sp_',   '#'); -- discard stored procedures 
					SET @cmd = dbo.fReplaceMax(@cmd, ' fn_',   '#'); -- discard functions 
					SET @cmd = dbo.fReplaceMax(@cmd, ' ms_',   '#'); -- discard microsoft extensions 
					SET @cmd = dbo.fReplaceMax(@cmd, ' dt_',   '#'); -- discard microsoft extensions 
					SET @cmd =      replace(@cmd, '  ' ,   ' '); -- discard duplicate spaces 
					SET @cmd =      replace(@cmd, '  ' ,   ' '); -- discard duplicate spaces 
					set @cmd = dbo.fReplaceMax(@cmd, CHAR(13),  ' '); --discard carraige return
					set @cmd = dbo.fReplaceMax(@cmd, CHAR(10),  ' '); --discard line feed
					SET @cmd=       replace(@cmd,0x0D0A,   0x200A);     -- replace cr/lf with space/lf 
					SET @cmd=       replace(@cmd,  0x09,   ' ');     -- discard tabs				
					SET @cmd =      replace(@cmd,   ' ; ',    '#'); -- discard semicolon
					SET @cmd =      replace(@cmd,   ';',    '#'); -- discard semicolon 
					END 
			IF (@cmd != @oldCmd) GOTO UNTIL;
			
			 declare @l int
			 set @l = len(@cmd)
			--------------------------------------------------------------------------      
				-- Insist that command is a SELECT statement or a syntax check
 			IF (CHARINDEX('set parseonly',LOWER(@cmd),1) = 1)
	 			BEGIN
					-- run the syntax check command and return
					EXEC (@cmd)
					IF (@errorMsg is null)
						SELECT 'Syntax is OK'
					RETURN
				END

			   IF (CHARINDEX('select ',LTRIM(LOWER(@cmd)),1) != 1) 
						BEGIN 
                			SET @errorMsg = 'error: must be a select statement: '; 
                			GOTO bottom; 
						END; 
				SET @i = CHARINDEX('select ',LOWER(@cmd),1) + 7; -- point just past it 
				--------------------------------------------------------------------------      
				-- limit the output to at most 1,000 rows. 
				IF (CHARINDEX('all ',LTRIM(LOWER(substring(@cmd,@i,100)))) = 1)      
						SET @i = CHARINDEX('all ',LOWER(@cmd),1) + 4; -- point just past it 
				IF (CHARINDEX('distinct ',LTRIM(LOWER(substring(@cmd,@i,100)))) = 1) 
						SET @i = CHARINDEX('distinct ',LOWER(@cmd),1) + 9; -- point just past it 
				IF (@limit > 0) 
				   BEGIN 
					 IF (CHARINDEX('top ',LTRIM(LOWER(substring(@cmd,@i,100)))) != 1)   -- if no limit specified  
						BEGIN 
						SET @cmd = STUFF(@cmd,@i,0, @top)  -- add one 
						END 
					 ELSE                                    -- a limit was included 
						BEGIN                           -- assure that it is less than 1000. 
						SET @i = CHARINDEX('top ',LOWER(@cmd),1) + 4 
						DECLARE @count int; 
						DECLARE @len int; 
						SET @i = @i + (LEN(substring(@cmd,@i,1000)) - LEN(LTRIM(substring(@cmd,@i,1000)))); 
						SET @len = CHARINDEX(' ',@cmd + ' ',@i) - @i; 
						IF (dbo.fIsNumbers(@cmd, @i, @i+@len-1) = 1 ) 
								SET @count = CAST(SUBSTRING(@cmd,@i,@len) as int); 
						IF ((@count is null) or (@count < 1 ) or (@count > @limit)) 
								SET @errorMsg = 'error: limit is '+ @top; 
						END     
				   END 
				---------------------------------------------------------------------------
				--------------------------------------------------------------------------- 
				
			-- preventing the execution of more than one select statement (with the exception of select statements that are inside nested queries)
			declare @j int
			SET @j = CHARINDEX('select ',LOWER(@cmd),7) -- point just past the first select
			if( @j > 0)
			begin
				UNTIL2:  
				BEGIN 
					if (SUBSTRING(@cmd,@j-2,2) = '( ' or SUBSTRING(@cmd,@j-1,1) = '(' )
						begin
							SET @j = CHARINDEX('select ',LOWER(@cmd),@j+7)
						end
					else
						begin
							set @cmd = stuff(@cmd,@j-1,1,'#')
							SET @j = CHARINDEX('select ',LOWER(@cmd),@j+7)
						end
							IF (@j > 0) GOTO UNTIL2; 
				END
			end
		end --if (@filter = 1)
		--==============================================================================
		-- end filter
		--==============================================================================
       
-- execute the command, returning the rows. 
bottom: 
	--==============================================================================
	-- execute and log
	--==============================================================================
	if (@log = 1) 
	begin	
							-- Insist that command is a SELECT statement or a syntax check
 			IF (CHARINDEX('set parseonly',LOWER(@cmd),1) = 1)
	 			BEGIN
					-- run the syntax check command and return
					--exec sp_executesql @cmd
					exec (@cmd)
					IF (@errorMsg is null)
						SELECT 'Syntax is OK'
					RETURN
				END
			
			IF (@errorMsg is null) -- if good 
			begin
 
			--- log the command if there is a weblog DB 
			-- variables to track and log SQL performance. 
				declare @startTime datetime, @endTime datetime  
				declare @busyTime bigint, @rows bigint, @IOs bigint 
				if (0 != (select count(*) from master.dbo.sysdatabases where name = 'weblog')) 
					begin 
						set @startTime = getUtcDate();
						set @busyTime = @@CPU_BUSY+@@IO_BUSY 
						set @IOs = cast(@@TOTAL_READ as bigint)+cast(@@TOTAL_WRITE as bigint)
						execute as login = 'logger'
						insert WebLog.dbo.SqlStatementLogUTC 
			values(@startTime,@webserver,@winName, @clientIP, 
					@serverName, @dbName, @access, @inputCmd, @isVisible) 
						revert;
					end --if weblog DB exists 
		


			--======================================================== 
			-- EXECUTE THE COMMAND 
			--EXEC sp_executesql @cmd                             -- return the data 
			exec (@cmd)
			select @rows = @@rowCount, @error = @@error
			------------------------------------------------------ 
			-- record the performance when (if) the command completes. 
			if (@startTime is not null) 
					begin 
					set @endTime = getUtcDate();
					EXECUTE AS login = 'logger'
					insert WebLog.dbo.SqlPerformanceLogUTC 
			values (@startTime,@webserver,@winName, @clientIP,
							datediff(ms, @startTime, @endTime)/1000.0,      -- elapsed time 
							((@@CPU_BUSY+@@IO_BUSY)-@busyTime)/1000.0,      -- busy time 
							@rows, @@procid, 0,'')                                          -- rows returned                
					revert;
			end 
                   
			end             -- end of good command case 
	-------------------------------------------------------------------------
	-- bad input command case
		ELSE                    -- if error 
		BEGIN
				IF (0 != (select count(*) from master.dbo.sysdatabases where name = 'weblog')) 
						begin 
						set @startTime = getUtcDate(); 
			EXECUTE AS login = 'logger'
			insert WebLog.dbo.SqlStatementLogUTC 
				values(@startTime,@webserver,@winName, @clientIP,  
			       		@serverName, @dbName, @access, @inputCmd, @isVisible) 
						insert WebLog.dbo.SqlPerformanceLogUTC   
				values(@startTime,@webserver,@winName, @clientIP,  
				0,0,0,@@procid, -1, @errorMsg)  
						end 
					SELECT @errorMsg + @cmd as error_message; -- return the error message 
			revert;
		END --error case
    
	end --if (@log = 1)
	else --if (@log = 0)
	begin
		--execute statement, do not log
		if (@errorMsg is null) -- good command case
		begin
			--======================================================== 
			-- EXECUTE THE COMMAND 
			-- EXEC sp_executesql @cmd
			exec(@cmd)                             -- return the data 
			select @rows = @@rowCount, @error = @@error
			------------------------------------------------------ 
		end --good command case
		
		else --bad command case
			SELECT @errorMsg + @cmd as error_message; -- return the error message 

	end --if (@log = 0)


END  --end spExecuteSQL
-------------------------------------------------------------------------------------- 

-------------------------------------------------------------------------------------- 

GO
/****** Object:  StoredProcedure [dbo].[spExecuteSQL2]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE PROCEDURE [dbo].[spExecuteSQL2](
	@cmd varchar(8000),
	@webserver varchar(64) = '',   -- the url
	@winname varchar(64)   = '',   -- the windows name of the server
	@clientIP varchar(16)  = '0',   -- client IP address
	@access varchar(64)    = ''    -- subsite of site,  if 'collab' statement 'hidden'
)
-------------------------------------------------------------------------------
--/H Procedure to safely execute an SQL select statement
-------------------------------------------------------------------------------
--/T The procedure runs and logs a query, but does not parse
--/T it. <br>
--/T See also spExecuteSQL
-------------------------------------------------------------------------------
AS
BEGIN
	SET NOCOUNT ON
	--
	DECLARE @error int,		 -- error number
		@errorMsg varchar(100),	 -- error msg
		@serverName varchar(32), -- name of this databaes server
		@dbName varchar(32),	 -- name of this database
		@isVisible int,		 -- flag says sql is visible to internet queries
		@startTime datetime,
		@endTime datetime,
		@busyTime bigint,
		@rows bigint,
		@IOs bigint
	--
	SET @isVisible = 1;
	SET @serverName = @@servername;
	SELECT @dbname = [name] FROM master.dbo.sysdatabases WHERE dbid = db_id();
	------------------------------------------------------------	
	IF (@errorMsg is null)		-- if good,
            BEGIN
		---------------------------------------------
            	--- log the command if there is a weblog DB
		-- variables to track and log SQL performance.
		----------------------------------------------
		if (0 != (select count(*) from master.dbo.sysdatabases where name = 'weblog'))
                  begin
			set @startTime = getUtcDate();
			set @busyTime = @@CPU_BUSY+@@IO_BUSY
                        set @IOs = cast(@@TOTAL_READ as bigint)+cast(@@TOTAL_WRITE as bigint)
			EXECUTE AS login = 'logger'
			insert WebLog.dbo.SqlStatementLogUTC 
				Values(@startTime,@webserver,@winName, @clientIP,
				@serverName, @dbName, @access, @cmd, @isVisible)
			revert;
		  end
		------------------------
		-- execute the command
		------------------------
		exec (@cmd)
		set @rows = @@rowCount
		-----------------------------------------------------------
		-- record the performance when (if) the command completes.
		-----------------------------------------------------------
		if (@startTime is not null)
                    begin
			set @endTime = getUtcDate();
			EXECUTE AS login = 'logger'
			insert WebLog.dbo.SqlPerformanceLogUTC
				values (@startTime,@webserver,@winName, @clientIP,
				datediff(ms, @startTime, @endTime)/1000.0,      -- elapsed time
				((@@CPU_BUSY+@@IO_BUSY)-@busyTime)/1000.0,      -- busy time
				@rows, @@procid, 0,'')				-- rows returned
		    revert;
			end
	    END            -- end of good command case
	-------------------------------------------------------------------------
	-- bad input command case
	ELSE                    -- if error
	    BEGIN
		IF (0 != (select count(*) from master.dbo.sysdatabases where name = 'weblog'))
		    begin
			set @startTime = getUtcDate();
			EXECUTE AS login = 'logger'
			insert WebLog.dbo.SqlStatementLogUTC
				values(@startTime,@webserver,@winName, @clientIP,
				@serverName, @dbName, @access, @cmd, @isVisible)
			insert WebLog.dbo.SqlPerformanceLogUTC
				values(@startTime,@webserver,@winName, @clientIP,
				0,0,0,@@procid, -1, @errorMsg)
		    end
               SELECT @errorMsg + @cmd as error_message; -- return the error message
				revert;
		END
	-------------------------------------------------------------------
END

GO
/****** Object:  StoredProcedure [dbo].[spFillMaskedObject]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spFillMaskedObject](@taskid int, @stepid int)
------------------------------------------------
--/H Fills the MaskedObject table 
--/A -------------------------------------------
--/T Will loop through the Mask table, and
--/T for each mask with type<4 or seeing>1.7
--/T in the r filter will find all objects in
--/T PhotoObjAll that are inside a mask. These
--/T are inserted into the MaskedObject table.
------------------------------------------------
AS BEGIN
    SET NOCOUNT ON;
    DECLARE
	@maskid bigint,
	@count bigint, 
	@type int,
	@htmIndex int,
	@pattern bigint,
	@msg varchar(8000), 
	@area varchar(8000);
    --
    EXEC spIndexDropSelection @taskid, @stepid, 'F', 'MaskedObject';
    SELECT @htmIndex = indexmapid
	FROM IndexMap
	WHERE tablename='PhotoObjAll' AND fieldlist like 'htmID,cx%'
    EXEC spIndexCreate @taskid, @stepid, @htmIndex;
    --
    TRUNCATE TABLE MaskedObject
    --
    SET @count = 0;
    SET @pattern = ~cast(0x000000001000FFFF as bigint) 
    --
    --------------------------------
    -- get objects from PhotoPrimary and secondary,
    -- but only from those fields which contain the mask
    --------------------------------
    SET @count=@count+1;
    -- 
    INSERT MaskedObject
	SELECT p.id as objid, m.maskID, m.type as maskType
	FROM Mask m CROSS APPLY dbo.fRegionGetObjectsFromString(area,32,0.0) p
	WHERE (m.type in (0,1,2,3) or (m.type=4 and m.filter=2 and m.seeing>1.7))
		AND (m.maskid&@pattern) = (p.id&@pattern) 
    SET @count = @@ROWCOUNT

    ----------------------------------
    -- add diagnostic message
    ----------------------------------
    IF @@error<>0
    BEGIN
	SET @msg = 'Error in spFillMaskedObject'
	EXEC spEndStep @taskID, @stepID, 'ABORTING', @msg, @msg;
	RETURN(1);
    END
    --------------------
    -- write phase log
    --------------------
    SET @msg = CAST(@count as varchar(10)) + ' masks loaded into MaskedObject'
    EXEC spNewPhase @taskid, @stepid, 'Set values', 'OK', @msg;
    --
    RETURN(0);
END

GO
/****** Object:  StoredProcedure [dbo].[spFinishDropIndices]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE PROCEDURE [dbo].[spFinishDropIndices] (@taskID INT, @stepID INT, 
				      @destinationDBname VARCHAR(32), 
				      @incremental tinyint = 1,
				      @msg VARCHAR(2048) OUTPUT)
----------------------------------------------------------------
--/H Drops the F and I indices in the Finish step, and also the
--/H K indices if the FINISH task comment field contains the 
--/H string "DROP_PK_INDICES".
--/A -----------------------------------------------------------
--/T A wrapper with logging to be called by spFinishStep
----------------------------------------------------------------
AS
BEGIN
	DECLARE @ret INT,
		@comment VARCHAR(256)

	SET @ret = 0;
	EXEC loadsupport.dbo.spSetFinishPhase 'dropIndices'
	IF (@incremental = 0)
	    BEGIN
		-- we should drop all the indices to begin with
		EXEC spNewPhase @taskID, @stepID, 'Drop indices', 'OK','Starting to drop all indices';
		--
		EXEC @ret = dbo.spIndexDropSelection @taskid, @stepid, 'F,I,K', 'ALL'
		IF @ret = 0
		    EXEC spNewPhase @taskID, @stepID, 'Drop indices', 'OK', 'Dropped all indices';
	    END
	ELSE
	    BEGIN
		-- we should drop only the F  indices, not K and I
		EXEC spNewPhase @taskID, @stepID, 'Drop FK indices', 'OK','Starting to drop all F indices';
		--
		EXEC @ret = dbo.spIndexDropSelection @taskid, @stepid, 'F', 'ALL'
		IF @ret = 0
		    EXEC spNewPhase @taskID, @stepID, 'Drop FK indices', 'OK', 'Dropped all F indices';
	    END

	IF @ret != 0
	    SET @msg = 'Cannot drop indices in ' + @destinationDBname;
	RETURN @ret;
END
GO
/****** Object:  StoredProcedure [dbo].[spFinishStep]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE PROCEDURE [dbo].[spFinishStep] (@taskid int, @stepID int output,
			       @phaseName varchar(64) = 'ALL', 
			       @execMode varchar(32) = 'resume')
----------------------------------------------------------------------
--/H Finish step, polishes published Photo or Spectro  
--/A 
--/T <li> taskid int,   		-- Task identifier
--/T <li> stepid int,   		-- Step identifier
--/T The data has been placed in the destination DB.
--/T Neighbors are computed for the photo data
--/T Best PhotoObjects are computed for sciencPrimary Spectro objects
--/T  	0 on success (no serious problems found)
--/T    1 on failure (serious problems found).
----------------------------------------------------------------------
AS
BEGIN
	SET NOCOUNT ON;
	-------------------
	-- local variables
	-------------------
	DECLARE @msg varchar(2048),
		@status varchar(16), @finishStatus varchar(32),
		@ret	int,
		@fgroups int,
		@err	int,
		@destinationDBname varchar(32), -- name of the destination database.
		@type varchar(16),	-- (target|best|runs|plates|tiles)  
		@comment VARCHAR(256),
		@incremental TINYINT,
		@id varchar(16) 	-- ID of the CSV data export task from the Linux side
	SET  @err = 0;

	-------------------------------------------------
	-- get the necessary parameters from task table
	-------------------------------------------------
	SELECT 	@comment=comment 
		FROM loadsupport.dbo.Task WITH (nolock)
		WHERE taskid = (
		  select max(taskid) from loadsupport.dbo.Task WITH (nolock)
		  where type='FINISH' AND taskstatus='WORKING')
	
	
	IF (@comment = '%CAMPAIGN LOAD%')
	    BEGIN
		IF (@phaseName != N'ALL')
		    BEGIN
			SET  @msg  = 'Step ' + @phaseName + ' invalid, must be ALL for campaign load'
			SET @ret = 1
			GOTO commonExit
		    END
	        SET @incremental = 0
	    END
	ELSE
	    BEGIN
	    	SET @incremental = 1
		-- 
		SELECT @phaseName = name
			FROM loadsupport.dbo.FinishPhase
	    END 
	--
	SELECT  @destinationDBname=dbname,
		@type=type, 
		@id=[id]
		FROM loadsupport.dbo.Task WITH (nolock)
		WHERE taskid = @taskID
	----------------------
	-- register the step.
	----------------------
	IF ( @phaseName = 'ALL' )
	    SET  @msg  = 'Starting FINISH step on ' + UPPER(@type) + ' database ' + @id
	ELSE 
	    BEGIN
		IF (@execMode = 'resume')
	    	    SET  @msg  = 'Resuming FINISH step at phase ' + @phaseName + ' on ' + UPPER(@type) + ' database ' + @id
		ELSE
		    SET  @msg  = 'Executing FINISH step phase ' + @phaseName + ' on ' + UPPER(@type) + ' database ' + @id
	    END
	EXEC spStartStep @taskID, @stepID OUTPUT, 'FINISH', 'WORKING', @msg, @msg;
	----------------------------------------------
	-- if step create fails, complain and return.
	----------------------------------------------
	IF @stepid IS NULL
	    BEGIN
		SET @msg = 'Could not create finish step for task '  
			+ str(@taskID) + ' database ' + @id
	 	EXEC spNewPhase 0, 0, 'Framework Error', 'ERROR', @msg;
		RETURN(1);
	    END
	--------------------------------------------------------
	-- Read in names of any phases to be skipped into temp table
	CREATE TABLE #skipPhases (
	    phase VARCHAR(32) NOT NULL
	)
	IF EXISTS (SELECT [name] FROM sysobjects 
	   WHERE  [name] = N'SkipFinishPhases' and xtype='U')
	    BEGIN
	        INSERT #skipPhases SELECT phase FROM SkipFinishPhases
		SET @msg = 'Skipping phases '
		SELECT @msg = @msg + phase + ' ' FROM #skipPhases
		SET @msg = @msg + 'from FINISH processing.'
	 	EXEC spNewPhase @taskid, @stepid, 'Start FINISH', 'OK', @msg;
	    END
	--------------------------------------------------------------
	-- if a particular step is to be executed, go to it directly
	--------------------------------------------------------------
	IF (@phaseName='ALL')                  GOTO allSteps
	IF (@phaseName='dropIndices')          GOTO dropIndices
	IF (@phaseName='syncSchema')           GOTO syncSchema
	IF (@phaseName='loadPhotoTag')         GOTO loadPhotoTag
	IF (@phaseName='buildPrimaryKeys')     GOTO buildPrimaryKeys
	IF (@phaseName='buildIndices')         GOTO buildIndices
	IF (@phaseName='buildForeignKeys')     GOTO buildForeignKeys
	IF (@phaseName='computeNeighbors')     GOTO computeNeighbors
	IF (@phaseName='regions')              GOTO regions
	IF (@phaseName='syncSpectro')          GOTO syncSpectro
	IF (@phaseName='fixDetectionIndex')     GOTO fixDetectionIndex
	IF (@phaseName='buildFinishIndices')   GOTO buildFinishIndices
	IF (@phaseName='setInsideMask')        GOTO setInsideMask
	IF (@phaseName='loadPatches')          GOTO loadPatches
	IF (@phaseName='createWeblogDB')       GOTO createWeblogDB
	IF (@phaseName='commonExit')           GOTO commonExit
	-- if the phase name doesnt match any of the above, exit with error
	SET @err = 1;
	SET @ret = 1;
	SET @msg = 'Invalid step name specified: ' + @phaseName;
	GOTO commonExit	
	--------------------------------------------------------
	-- do the stuff that needs to be done for start of a full
	-- (all steps) finish run
	allSteps:
	EXEC loadsupport.dbo.spSetFinishPhase 'ALL'
	--------------------------------------------------------
	-- we should drop all the indices to begin with
	dropIndices:
	IF ('dropIndices' NOT IN (SELECT phase FROM #skipPhases))
	    BEGIN
		EXEC @ret = dbo.spFinishDropIndices @taskid, @stepid, @destinationDBname, @incremental, @msg OUTPUT
	    END
	IF (@ret != 0) OR (@execMode != 'resume') GOTO commonExit
	--------------------------------------------------------
	-- if there are schema changes to be sync-ed with, do it now
	syncSchema:
	IF ('syncSchema' NOT IN (SELECT phase FROM #skipPhases))
	    BEGIN
	    	EXEC @ret = dbo.spSyncSchema @taskid, @stepid, @destinationDBname
	    END
	IF (@ret != 0) OR (@execMode != 'resume') GOTO commonExit
	--------------------------------------------------------
	-- Apply patches accumulated during the loading
	loadPatches:
	EXEC @ret = dbo.spLoadPatches @taskID, @stepID 
	IF (@ret != 0) OR (@execMode != 'resume') GOTO commonExit
	------------------------------------------------------
	-- if there are no filegroups except PRIMARY in sysfilegroups,
	-- ensure that FileGroupMap table is empty after schema sync
	SELECT @fgroups=COUNT(*) FROM sysfilegroups
	IF (@fgroups = 1) 
	    EXEC spTruncateFileGroupMap
	--------------------------------------------------------
	-- Create the PhotoTag index in PhotoObjAll
	loadPhotoTag:
	IF ('loadPhotoTag' NOT IN (SELECT phase FROM #skipPhases))
	    BEGIN
	    	EXEC @ret = dbo.spLoadPhotoTag @taskID, @stepID
	    END
	IF (@ret != 0) OR (@execMode != 'resume') GOTO commonExit
	--------------------------------------------------------
	-- Build the indices on the database
	buildPrimaryKeys:
	SET @msg = 'Starting to build primary keys.'
 	EXEC spNewPhase @taskid, @stepid, 'buildPrimaryKeys', 'OK', @msg;
	EXEC loadsupport.dbo.spSetFinishPhase 'buildPrimaryKeys'
	EXEC @ret = dbo.spIndexBuildSelection @taskID, @stepID, 'K', 'ALL';
	IF (@ret != 0) OR (@execMode != 'resume') GOTO commonExit
	--------------------------------------------------------
	buildIndices:
	SET @msg = 'Starting to build indices.'
 	EXEC spNewPhase @taskid, @stepid, 'buildIndices', 'OK', @msg;
	EXEC loadsupport.dbo.spSetFinishPhase 'buildIndices'
	EXEC @ret = dbo.spIndexBuildSelection @taskID, @stepID, 'I', 'ALL'
	IF (@ret != 0) OR (@execMode != 'resume') GOTO commonExit
	--------------------------------------------------------
	buildForeignKeys:
	SET @msg = 'Starting to build foreign keys.'
 	EXEC spNewPhase @taskid, @stepid, 'buildForeignKeys', 'OK', @msg;
	EXEC loadsupport.dbo.spSetFinishPhase 'buildForeignKeys'
	EXEC @ret = dbo.spIndexBuildSelection @taskID, @stepID, 'F', 'ALL'
	IF (@ret != 0) OR (@execMode != 'resume') GOTO commonExit
	--------------------------------------------------------
	-- Build the neighbors
	computeNeighbors:
	IF ('computeNeighbors' NOT IN (SELECT phase FROM #skipPhases))
	    BEGIN
	     	SET @msg = 'Starting to compute neighbors.'
		EXEC spNewPhase @taskid, @stepid, 'computeNeighbors', 'OK', @msg;
	   	EXEC loadsupport.dbo.spSetFinishPhase 'computeNeighbors'
		EXEC @ret = dbo.spNeighbors @taskID, @stepID, @type, @destinationDBname, 30.0, 1
	    END
	IF (@ret != 0) OR (@execMode != 'resume') GOTO commonExit
	---------------------------------------------------------
	-- Do the Regions 
	regions:
	IF ('regions' NOT IN (SELECT phase FROM #skipPhases))
	    BEGIN
	     	SET @msg = 'Starting to compute regions.'
		EXEC spNewPhase @taskid, @stepid, 'regions', 'OK', @msg;
	    	EXEC loadsupport.dbo.spSetFinishPhase 'regions'
	    	EXEC @ret = dbo.spSdssPolygonRegions @taskID, @stepID
	    END
	IF (@ret != 0) OR (@execMode != 'resume') GOTO commonExit
	---------------------------------------------------------
	-- Handle the spectro part, only if BEST-PUB
	syncSpectro:
	IF ('syncSpectro' NOT IN (SELECT phase FROM #skipPhases))
	    BEGIN
	     	SET @msg = 'Starting to synchronize spectro and photo.'
		EXEC spNewPhase @taskid, @stepid, 'syncSpectro', 'OK', @msg;
		EXEC @ret = dbo.spSynchronize @taskID, @stepID
	    END
	IF (@ret != 0) OR (@execMode != 'resume') GOTO commonExit
	---------------------------------------------------------
	-- Fix detectioIndex table, only if BEST-PUB
	fixDetectionIndex:
	IF ('fixDetectionIndex' NOT IN (SELECT phase FROM #skipPhases))
	    BEGIN
	     	SET @msg = 'Starting to fix detectionIndex.'
		EXEC spNewPhase @taskid, @stepid, 'detectionIndex', 'OK', @msg;
		EXEC @ret = dbo.spFixDetectionIndex @taskID, @stepID, 'detectionIndex'
	    END
	IF (@ret != 0) OR (@execMode != 'resume') GOTO commonExit
	------------------------------------------------------
	-- Build the FINISH group indices in each category
	buildFinishIndices:
	SET @msg = 'Starting to build FINISH indices.'
 	EXEC spNewPhase @taskid, @stepid, 'buildFinishIndices', 'OK', @msg;
	EXEC loadsupport.dbo.spSetFinishPhase 'buildFinishIndices'
	EXEC @ret = dbo.spIndexBuildSelection @taskID, @stepID, 'K,I,F', 'FINISH' 
	IF (@ret != 0) OR (@execMode != 'resume') GOTO commonExit
	------------------------------------------------------
	-- Fill the MaskedObject table and set PhotoObj.insideMask
	setInsideMask:
	IF ('setInsideMask' NOT IN (SELECT phase FROM #skipPhases))
	    BEGIN
	    	SET @msg = 'Starting to set InsideMask.'
 		EXEC spNewPhase @taskid, @stepid, 'setInsideMask', 'OK', @msg;
	    	EXEC loadsupport.dbo.spSetFinishPhase 'setInsideMask'
	  	EXEC @ret = dbo.spFillMaskedObject @taskID, @stepID
		IF (@ret = 0)
		    EXEC @ret = dbo.spSetInsideMask @taskID, @stepID, 1 
	    END
	IF (@ret != 0) OR (@execMode != 'resume') GOTO commonExit
	------------------------------------------------------
	-- Create Weblog DB if necessary.
	createWeblogDB:
	IF ('createWeblogDB' NOT IN (SELECT phase FROM #skipPhases))
	    BEGIN
	    	EXEC loadsupport.dbo.spSetFinishPhase 'createWeblogDB'
		EXEC @ret = dbo.spCreateWeblogDB @taskID, @stepID 
	    END
	IF (@ret != 0) OR (@execMode != 'resume') GOTO commonExit
	------------------------------------------------------
	commonExit:
	----------------------------------------------------
	-- create final logs 
	EXEC loadsupport.dbo.spSetFinishPhase 'commonExit'
	IF  @execMode = 'resume'
	    BEGIN
		IF @err = 0
	    	    BEGIN

			-- Update the statistics on all the tables
			EXEC dbo.spUpdateStatistics
			EXEC spNewPhase @taskID, @stepID, 
				'Statistics', 
				'WARNING', 
				'Updated the statistics on all tables' 
			----------------------------------------------------

			SET @status = 'DONE'
			EXEC loadsupport.dbo.spSetFinishPhase 'ALL'
			SET @msg =  'Completed finish of ' + @id;
		    END
		ELSE
		    BEGIN
	    	    	SET @status = 'ABORTING'
		    END
		EXEC spEndStep @taskID, @stepID, @status, @msg, @msg;
		EXEC loadsupport.dbo.spDone @taskid;
	    END
	---------------------------------------------------
	RETURN @ret;
END
GO
/****** Object:  StoredProcedure [dbo].[spFixDetectionIndex]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE PROCEDURE [dbo].[spFixDetectionIndex](@taskid int, @stepid int, @phase varchar(64))
---------------------------------------------------
--/H Adds isPrimary column to detectionIndex table and sets its value.
--/A -------------------------------------------------
--/T Adds the new TINYINT column isPrimary to the detectionIndex table 
--/T and sets its value depending on whether the detection is the primary
--/T detection of the object or not.
---------------------------------------------------
AS
BEGIN
	--
	SET NOCOUNT ON;
	--
	DECLARE @msg varchar(8000), 
		@cmd nvarchar(2048), 
		@status varchar(16), 
		@ret int;
	--
	EXEC loadsupport.dbo.spSetFinishPhase 'detectionIndex'
	SET @msg = 'Adding isPrimary to detectionIndex ';

	IF EXISTS (SELECT name FROM DBColumns WHERE tablename = 'detectionIndex' AND name = 'isPrimary')
	   SET @ret = 0
	ELSE
		BEGIN
	   		ALTER TABLE detectionIndex ADD isPrimary TINYINT NOT NULL DEFAULT 0

	        SET @cmd = 'UPDATE d SET d.isPrimary = 1 FROM detectionIndex d LEFT OUTER JOIN thingIndex t ON d.thingid=t.thingid AND d.objid=t.objid WHERE t.objid is not null'  
			EXEC @ret=sp_executesql @cmd;
			IF @ret = 0 AND (@@ROWCOUNT = 0)
			   SET @ret = 1
		END

	IF (@ret = 0) 
		BEGIN
			SET @status = 'OK'
			SET @msg = @msg + ' completed successfully '
		END
	ELSE
		BEGIN
			SET @status ='WARNING'
			SET @msg = @msg + ' set isPrimary for 0 rows '
		END

	INSERT DBColumns VALUES('detectionIndex','isPrimary','','','','1 if object is primary, 0 if not',0)

	-------------------------------
	-- write log message
	-------------------------------
	SET @msg = LEFT(@msg,2048);
	EXEC spNewPhase @taskid,@stepid,@phase,@status,@msg;
	--
	--
	RETURN(@ret);
END
GO
/****** Object:  StoredProcedure [dbo].[spFixTargetVersion]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE PROCEDURE [dbo].[spFixTargetVersion] ( @taskid int, @stepid int )
-------------------------------------------------------------
--/H Fixes targetVersion in TilingGeometry before running sectors.
--/A --------------------------------------------------------
--/T <li> returns  0 if OK, non zero if something wrong  
--/T <br>
--/T Sample call   <br>
--/T <br> <samp> 
--/T exec spFixTargetVersion @taskid , @stepid  
--/T </samp> 
--/T <br>  
------------------------------------------------------------- 
AS BEGIN
    SET NOCOUNT ON
    DECLARE @msg varchar(1024)
    -------------------------------------------------
    -- execute TargetVersion patch on TilingGeometry
    -------------------------------------------------
    UPDATE TilingGeometry
	SET targetVersion=REPLACE(targetVersion,'ts_','')
	WHERE targetVersion LIKE 'ts_%'

    UPDATE TilingGeometry
	SET targetversion =
	    SUBSTRING(targetVersion,1,PATINDEX('%[a-uw-z]%',targetVersion)-1)
	WHERE PATINDEX('%[a-uw-z]%',targetVersion)>0
	    AND targetVersion LIKE 'v%'

    -- generate completion message.
    SET @msg = 'Fixed targetVersion in TilingGeometry';

    EXEC spNewPhase @taskid, @stepid, 'FixTargetVersion', 'OK', @msg;
	------------------------------------------------------
    RETURN(0);
END
GO
/****** Object:  StoredProcedure [dbo].[spGenericTest]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spGenericTest]( 
	@taskid int,
	@stepid int,
	@command varchar(8000), 
	@testType varchar(100),		
	@ErrorMsg varchar(2048), 
	@error bigint OUTPUT
)
-------------------------------------------------------------
--/H Tests a generic SQL Statement, gives error if test produces any records
--/A 
--/T      tests to see that no values violate the test 
--/T 	the test must have the syntax:
--/T 		select <your key> as badKey
--/T		into test
--/T        	from <your tests>
--/T     	if the <test> table is not empty, we print out the error message.
--/T  
--/T      Returns @error = 0 if all keys unique  
--/T 		@error >0  if duplicate keys (in which case it is the count of duplicate keys).
--/T
--/T      In the failure case it inserts messages in the load measage log 
--/T      describing the first failing key. 
--/T <p> parameters:  
--/T <li> taskid int,   		-- task identifier
--/T <li> stepid int,   		-- step identifier
--/T <li> command varchar() NOT NULL,   -- sql command select... into test where.... 
--/T <li> testType varchar() NOT NULL,  -- what are we testing 
--/T <li> errorMsg varchar() NOT NULL,  -- error message if test is not empty
--/T <li> error int NOT NULL,         	-- output: 0 if OK (test is empty), non zero if output is not empty
--/T <br>
--/T Sample call to test that r is not too small <br>
--/T <samp> 
--/T <br> exec spGenericTest @taskid, @stepid, 'select objID into test from objID where r < -99999', 'testing r'
--/T <br> 			'r is too small', @error output
--/T </samp> 
--/T <br> see also spTestUniqueKey, spTestForeignKey, 
-------------------------------------------------------------
AS BEGIN 
	SET NOCOUNT ON;
	-- The test table holds the failing objects, drop it if it is left around.
	IF EXISTS (SELECT [name] FROM   sysobjects 
		WHERE  [name]= N'test' )
		DROP TABLE test; 
	--
	-- execute the generic test that populates the test table
	-- 
	EXEC (@command)
	--
	-- if table is not empty, we have a problem.
	--
	SELECT @error = count_big(*) FROM test;
	IF (@error > 0) 
	    BEGIN
   		SET @errorMsg = @errorMsg + ' for task '  + str(@taskID) 
			+ ' step ' + str(@stepid) +' for test:' + @testType
			+ ' failed ' + cast(@error as varchar (10)) + ' times. '   
		EXEC spNewPhase @taskid, @stepid, @testType, 'ERROR', @errorMsg 
	    END
	ELSE	-- if table is empty, the test passed.
   	    BEGIN
		SET @errorMsg = 'Passed ' + @testType + ' test '  
	    	EXEC spNewPhase @taskid, @stepid, @testType, 'OK', @errorMsg    
	    END

	-- drop test table on exit
	DROP TABLE test

	RETURN @error
END			-- End spGenericTest()

GO
/****** Object:  StoredProcedure [dbo].[spGetFiberList]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 
CREATE PROCEDURE [dbo].[spGetFiberList] (@plateid numeric(20,0))
-------------------------------------------------
--/H Return a list of fibers on a given plate.
-------------------------------------------------
AS 
	select cast(s.specObjID as varchar(20)), s.fiberId, s.class, str(s.z,5,3), s.bestobjid 
	from SpecObjAll s
	where
		plateID=@plateid
		order by s.fiberID;

GO
/****** Object:  StoredProcedure [dbo].[spGetMatch]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE  PROCEDURE [dbo].[spGetMatch](@r float, @w float, @eps float) 
------------------------------------------------------------------- 
--/H Get the neighbors to a list of @ra,@dec pairs in #upload in photoPrimary 
--/H within @r arcsec . @w is the weight per object.
--/U 
--/T The procedure is used in conjunction with a list upload 
--/T service, where the (ra,dec) coordinates of an object list 
--/T are put into a temporary table #upload by the web interface. 
--/T This table name is hardcoded in the procedure. It then returns 
--/T a matchup table, containing the up_id and the SDSS objId. 
--/T The result of this is then joined with the photoPrimary table, 
--/T to return the attributes of the photometric objects. 
--/T @r is measured in arcsec
--/T @w is the weight, it is 1/@sigma^2, where @sigma is in radians
--/T @eps is the chisq threshold
--/T <samp> 
--/T <br> create table #x (pk int,id bigint,a float, ax float, ay float, az float) 
--/T <br> insert into #x EXEC spGetMatch  2.5, 0.0000001, ...
--/T </samp> 
------------------------------------------------------------------- 
AS 
BEGIN 
        SET NOCOUNT ON; 
        SET IMPLICIT_TRANSACTIONS ON; 
        DECLARE @pk int, @a float, @ax FLOAT, @ay FLOAT, @az FLOAT, 
		@qx float, @qy float, @qz float, @b FLOAT, @rr float, 
		@FETCH_STATUS INT; 
        DECLARE ObjCursor CURSOR 
           FOR SELECT  pk, xmatch_a, xmatch_ax, xmatch_ay, xmatch_az  
		FROM #upload; 
        SET @FETCH_STATUS = 0; 
        CREATE TABLE #x ( 
                pk  int, 
                id bigint,
		chisq float, 
		a float,
		ax float, 
		ay float, 
		az float
                ); 
        OPEN ObjCursor; 
        WHILE (@FETCH_STATUS = 0) 
          BEGIN 
            WHILE(@FETCH_STATUS = 0) 
              BEGIN 
                FETCH NEXT FROM Objcursor INTO @pk, @a, @ax, @ay, @az; 
		SET @b  = @a*SQRT((@ax*@ax + @ay*@ay + @az*@az)/(@a*@a)+0.00000001);
		SET @qx = @ax/@b;
		SET @qy = @ay/@b;
		SET @qz = @az/@b;
		SET @rr = @r /60;
                SET @FETCH_STATUS = @@FETCH_STATUS; 
                IF (@FETCH_STATUS != 0) BREAK; 
                INSERT INTO #x 
                SELECT @pk as pk, 
		    objID as id,
		    @a+@w-sqrt(power(@ax+@w*cx,2)+power(@ay+@w*cy,2)+power(@az+@w*cz,2)) as chisq,
		    @a  + @w as a,
		    @ax + @w*cx as ax,
		    @ay + @w*cy as ay,
		    @az + @w*cz as az
                    FROM dbo.fGetNearbyObjXYZ(@qx,@qy,@qz,@rr) 
		    WHERE
			 @a+@w-sqrt(power(@ax+@w*cx,2)+power(@ay+@w*cy,2)+power(@az+@w*cz,2)) < @eps
              END; 
          END; 
        CLOSE ObjCursor; 
        DEALLOCATE ObjCursor; 
        SELECT * FROM #x 
--	SET IMPLICIT_TRANSACTIONS OFF
END 
GO
/****** Object:  StoredProcedure [dbo].[spGetNeighbors]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spGetNeighbors](@r float)
-------------------------------------------------------------------
--/H Get the neighbors to a list of @ra,@dec pairs in #upload
-------------------------------------------------------------------
--/T The procedure is used in conjunction with a list upload
--/T service, where the (ra,dec) coordinates of an object list 
--/T are put into a temporary table #upload by the web interface.
--/T This table name is hardcoded in the procedure. It then returns
--/T a matchup table, containing the up_id and the SDSS objId.
--/T The result of this is then joined with the PhotoTag table, 
--/T to return the attributes of the photometric objects.
--/T <samp>
--/T <br> create table #x (id int,objID bigint)
--/T <br> insert into #x EXEC spGetNeighbors 2.5
--/T </samp>
-------------------------------------------------------------------
AS
BEGIN
	SET NOCOUNT ON;
	select up_ID, objID
	from #upload cross apply dbo.fGetNearbyObjAllEq(up_ra,up_dec,@r)
END
GO
/****** Object:  StoredProcedure [dbo].[spGetNeighborsAll]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spGetNeighborsAll](@r float)
-------------------------------------------------------------------
--/H Get the neighbors to a list of @ra,@dec pairs in #upload
-------------------------------------------------------------------
--/T The procedure is used in conjunction with a list upload
--/T service, where the (ra,dec) coordinates of an object list 
--/T are put into a temporary table #upload by the web interface.
--/T This table name is hardcoded in the procedure. It then returns
--/T a matchup table, containing the up_id and the SDSS objId.
--/T The result of this is then joined with the PhotoTag table, 
--/T to return the attributes of the photometric objects.
--/T <samp>
--/T <br> create table #x (id int,objID bigint)
--/T <br> insert into #x EXEC spGetNeighborsAll 2.5
--/T </samp>
-------------------------------------------------------------------
AS
BEGIN
	SET NOCOUNT ON;
	SELECT up_ID, objID
	FROM  #upload cross apply dbo.fGetNearbyObjAllEq(up_ra,up_dec,@r)
END
GO
/****** Object:  StoredProcedure [dbo].[spGetNeighborsPrim]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spGetNeighborsPrim](@r float)
-------------------------------------------------------------------
--/H Get the primary neighbors to a list of @ra,@dec pairs in #upload
-------------------------------------------------------------------
--/T The procedure is used in conjunction with a list upload
--/T service, where the (ra,dec) coordinates of an object list 
--/T are put into a temporary table #upload by the web interface.
--/T This table name is hardcoded in the procedure. It then returns
--/T a matchup table, containing the up_id and the SDSS objId.
--/T The result of this is then joined with the PhotoPrimary table, 
--/T to return the attributes of the photometric objects.
--/T <samp>
--/T <br> create table #x (id int,objID bigint)
--/T <br> insert into #x EXEC spGetNeighborsPrim 2.5
--/T </samp>
-------------------------------------------------------------------
AS
BEGIN
	SET NOCOUNT ON;
	SELECT up_ID, objID
	FROM  #upload cross apply dbo.fGetNearbyObjEq(up_ra,up_dec,@r)
END
GO
/****** Object:  StoredProcedure [dbo].[spGetNeighborsRadius]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--

CREATE  PROCEDURE [dbo].[spGetNeighborsRadius]
-------------------------------------------------------------------
--/H Get the neighbors to a list of @ra,@dec,@r triplets in #upload in photoPrimary
-------------------------------------------------------------------
--/T The procedure is used in conjunction with a list upload
--/T service, where the (ra,dec) coordinates and the search radius
--/T of an object list are put into a temporary table #upload by 
--/T the web interface.  This table name is hardcoded in the procedure. 
--/T It then returns a matchup table, containing the up_id and the SDSS 
--/T objId. The result of this is then joined with the photoPrimary 
--/T table, to return the attributes of the photometric objects.
--/T <samp>
--/T <br> create table #x (id int,objID bigint)
--/T <br> insert into #x EXEC spGetNeighbours 
--/T </samp>
-------------------------------------------------------------------
AS
BEGIN
	SET NOCOUNT ON;
	SELECT up_ID, objID
	FROM  #upload cross apply dbo.fGetNearbyObjAllEq(up_ra,up_dec,up_rad)
END
GO
/****** Object:  StoredProcedure [dbo].[spGetSpecNeighborsAll]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spGetSpecNeighborsAll](@r float)
-------------------------------------------------------------------
--/H Get the spectro neighbors to a list of @ra,@dec pairs in #upload
-------------------------------------------------------------------
--/T The procedure is used in conjunction with a list upload
--/T service, where the (ra,dec) coordinates of an object list 
--/T are put into a temporary table #upload by the web interface.
--/T This table name is hardcoded in the procedure. It then returns
--/T a matchup table, containing the up_id and the SDSS specObjId.
--/T The result of this is then joined with the SpecObjAll table, 
--/T to return the attributes of the photometric objects.
--/T <samp>
--/T <br> create table #x (id int,specObjID numeric(20))
--/T <br> insert into #x EXEC spGetSpecNeighborsAll 2.5
--/T </samp>
-------------------------------------------------------------------
AS
BEGIN
	SET NOCOUNT ON;
	SELECT up_ID, specObjID
	FROM  #upload cross apply dbo.fGetNearbySpecObjAllEq(up_ra,up_dec,@r)
END
GO
/****** Object:  StoredProcedure [dbo].[spGetSpecNeighborsPrim]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spGetSpecNeighborsPrim](@r float)
-------------------------------------------------------------------
--/H Get the scienceprimary spectro neighbors to a list of @ra,@dec pairs in #upload
-------------------------------------------------------------------
--/T The procedure is used in conjunction with a list upload
--/T service, where the (ra,dec) coordinates of an object list 
--/T are put into a temporary table #upload by the web interface.
--/T This table name is hardcoded in the procedure. It then returns
--/T a matchup table, containing the up_id and the SDSS specOobjId.
--/T The result of this is then joined with the SpecObj table, 
--/T to return the attributes of the photometric objects.
--/T <samp>
--/T <br> create table #x (id int,specObjID numeric(20))
--/T <br> insert into #x EXEC spGetSpecNeighborsPrim 2.5
--/T </samp>
-------------------------------------------------------------------
AS
BEGIN
	SET NOCOUNT ON;
	SELECT up_ID, specObjID
	FROM  #upload cross apply dbo.fGetNearbySpecObjEq(up_ra,up_dec,@r)
END
GO
/****** Object:  StoredProcedure [dbo].[spGetSpecNeighborsRadius]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--

CREATE  PROCEDURE [dbo].[spGetSpecNeighborsRadius]
-------------------------------------------------------------------
--/H Get the spectro scienceprimary neighbors to a list of @ra,@dec,@r triplets in #upload in SpecObj
-------------------------------------------------------------------
--/T The procedure is used in conjunction with a list upload
--/T service, where the (ra,dec) coordinates and the search radius
--/T of an object list are put into a temporary table #upload by 
--/T the web interface.  This table name is hardcoded in the procedure. 
--/T It then returns a matchup table, containing the up_id and the SDSS 
--/T specObjId. The result of this is then joined with the SpecObj 
--/T table, to return the attributes of the photometric objects.
--/T <samp>
--/T <br> create table #x (id int,specObjID numeric(20))
--/T <br> insert into #x EXEC spGetNeighbours 
--/T </samp>
-------------------------------------------------------------------
AS
BEGIN
	SET NOCOUNT ON;
	SELECT up_ID, specObjID
	FROM  #upload cross apply dbo.fGetNearbySpecObjAllEq(up_ra,up_dec,up_rad)
END
GO
/****** Object:  StoredProcedure [dbo].[spGrantAccess]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--

CREATE PROCEDURE [dbo].[spGrantAccess] (@access varchar(20), @user varchar(256))
-------------------------------------------------------------
--/H  spGrantAccess grants access to DB objects
--/A 
--/T Grants select/execute authority to all user db objects
--/T and to the HTM routines in master
--/T If "Admin" is specified, grants the user access to ALL objects. 
--/T <p> parameters:   
--/T <li> access char(1),   		-- U: grant access to dbObjects.access = 'U' objects <br>
--/T					-- A: grant access to all dbObjects
--/T <li> user 	varchar(256),   	-- UserID to grant
--/T <br>
--/T Sample call:<br>
--/T <samp> 
--/T <br> exec  spGrantAccess 'U', 'Test'  
--/T </samp> 
--/T <br>  
------------------------------------------------------------- 
AS
BEGIN
	IF (@access not in ('A', 'U'))
		BEGIN
		PRINT 'Error: spGrantAccess @access parameter must be A or U, it is ' + @access
		RETURN
		END

	DECLARE userObject CURSOR
	READ_ONLY
	FOR 	select s.name, s.type
		from sysobjects s , dbObjects o
		where s.type in ('P ', 'FN', 'FS', 'FT', 'TF', 'TR', 'U ', 'V ', 'X ') 
	  	  and s.name = o.name		-- exclude system stuff
		  and o.access in ('U', @access)
		 
	
	DECLARE @name varchar(256)
	DECLARE @type char(2)
	DECLARE @verb varchar(32)
	DECLARE @command nvarchar(1000)
	OPEN userObject
	--
	FETCH NEXT FROM userObject INTO @name, @type  
	WHILE (@@fetch_status <> -1)
	BEGIN
	 	IF	(@type in ('U ', 'V ', 'TF', 'FT'))  SET @verb = 'SELECT' 
		ELSE IF	(@type in ('P ', 'TR', 'FN', 'X ', 'FS'))  SET @verb = 'EXECUTE'
		SET @command = N'GRANT ' + @verb + ' ON ' + @name + ' TO [' + @user +']'
		EXEC (@command)	
		--print @command + ' Type is: ' + @type
		FETCH NEXT FROM userObject INTO @name, @type
		IF (@@fetch_status != 0) BREAK
	END
	--
	CLOSE userObject
	DEALLOCATE userObject
	-- grant access to view function/procedure defs and to see IndexMap
	SET @command = 'GRANT VIEW DEFINITION TO ['+@user+']';
	EXEC (@command)
	SET @command = 'GRANT SELECT ON IndexMap TO ['+@user+']';
	EXEC (@command)
PRINT 'Access granted all "' + @access + '" objects'
END
GO
/****** Object:  StoredProcedure [dbo].[spIndexBuildList]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spIndexBuildList](@taskid int, @stepid int)
-------------------------------------------------------------
--/H Builds the indices from a selection, based upon the #indexmap table
--/A --------------------------------------------------------
--/T It also assumes that we created before an #indexmap temporary table
--/T that has three attributes: id int, indexmapid int, status int.
--/T status values are 0:READY, 1:STARTED, 2:DONE.
-------------------------------------------------------------
AS BEGIN
	SET NOCOUNT ON;
	--
	DECLARE @nextindex int,
		@ret int,
		@type varchar(100),
		@code char(1),
		@tableName varchar(100),
		@fieldList varchar(1000),
		@foreignKey varchar(1000),
		@fileGroup varchar(100),
		@group varchar(100);
	--
	WHILE (1=1)
	BEGIN
		----------------------------------
		-- get the next index to create
		----------------------------------
		SET @nextindex=NULL;
		SELECT @nextindex=indexmapid
		    FROM #indexmap
		    WHERE id in (
			select min(id) from #indexmap WHERE status=0
			);
		----------------------------------
		-- exit if error
		----------------------------------
		IF @@error>0 RETURN(1);
		IF @nextindex IS NULL  RETURN(2);

		----------------------------------
		-- set status to STARTED(1)
		----------------------------------
		UPDATE #indexmap
		    SET status=1
		    WHERE indexmapid=@nextindex;

		--------------------------------------------------
		-- call spIndexCreate
		--------------------------------------------------
		EXEC @ret = spIndexCreate @taskid,@stepid,@nextindex;

		--------------------------------------
		-- if all OK, update status to DONE(2)
		--------------------------------------
		IF @ret=0 
		    UPDATE #indexmap
			SET status=2
			WHERE indexmapid=@nextindex;
		-------------------------------------------------
	END
	RETURN(0);
END

GO
/****** Object:  StoredProcedure [dbo].[spIndexBuildSelection]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spIndexBuildSelection](@taskid int, @stepid int, @type varchar(128), @group varchar(1024)='')
-------------------------------------------------------------
--/H Builds a set of indexes from a selection given by @type and @group
--/A --------------------------------------------------------
--/T The parameters are the body of a group clause, to be used with IN (...),
--/T separated by comma, like @type = 'F,K,I', @group='PHOTO,TAG,META';
--/T <BR>
--/T <li> @type   varchar(256)  -- a subset of F,K,I 
--/T <br> Here 'F': (foreign key), 'K' (primary key), 'I' index
--/T <li> @group  varchar(256) -- a subset of PHOTO,TAG,SPECTRO,QSO,TILES,META,FINISH,NEIGHBORS,ZONE,MATCH
--/T It will also accept 'ALL' as an alternate argument, it means build all indices. Or one can specify
--/T a comma separated list of tables.
--/T <br> The sp assumes that the parameters are syntactically correct.
--/T Returns 0, if all is well, 1 if an error has occurred, 
--/T and 2, if no more indexes are to be built.
--/T <br><samp>
--/T    exec spIndexBuildSelection 1,1, 'K,I,F', 'PHOTO'
--/T </samp>  
-------------------------------------------------------------
AS BEGIN
	SET NOCOUNT ON;
	--
	DECLARE @ltype varchar(256), 
		@lgroup varchar(4000),
		@ret int,
		@cmd nvarchar(2000);
	--
	SET @ltype  = ''''+REPLACE(@type, ',',''',''')+'''';
	SET @lgroup = ''''+REPLACE(@group,',',''' COLLATE SQL_Latin1_General_CP1_CS_AS,''')
		+''' COLLATE SQL_Latin1_General_CP1_CS_AS';
	--
	IF @type ='' OR @group='' RETURN(1);
	--------------------------------------------------------
	-- insert the list to be built into the table #indexmap,
	--------------------------------------------------------
	CREATE TABLE #indexmap (id int identity(1,1), indexmapid int, status int);

	SET @cmd = N'INSERT #indexmap(indexmapid,status) SELECT indexmapid, 0 status '
		+ 'FROM IndexMap WITH (nolock) '
		+ 'WHERE code IN ('+@ltype+')';
	------------------------------------------------
	-- look for the ALL clause for group selection
	------------------------------------------------
	IF @group NOT LIKE 'ALL%' 
	    BEGIN
		IF (@group NOT IN (SELECT DISTINCT indexgroup FROM IndexMap)) AND
		   (@type = 'F') -- foreign keys for specific table(s) indicated
		    SET @cmd = @cmd + ' and tableName IN ('+@lgroup+')'; 
		ELSE
		    SET @cmd = @cmd + ' and (indexgroup IN ('+@lgroup+')'
			+ ' or tableName IN ('+@lgroup+'))';
	    END
	ELSE
	    -- 'ALL' does not include the special group 'SCHEMA'
            SET @cmd = @cmd + ' and (indexgroup NOT LIKE ''%SCHEMA%'') ';
	------------------------------------------------
	-- order it by code in reverse order, so pk are built first
	------------------------------------------------
	SET @cmd = @cmd + ' ORDER BY code DESC';
	--
	EXEC @ret= sp_executesql @cmd
	IF @ret>0 RETURN(1);

	--------------------------------------------
	-- build the index for the whole list
	--------------------------------------------
	SET @ret = 0;
	EXEC @ret=spIndexBuildList @taskid, @stepid
	--
	RETURN(0);
END

GO
/****** Object:  StoredProcedure [dbo].[spIndexCreate]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spIndexCreate](
	@taskID	int,
	@stepID int,
	@indexmapid int			-- link to IndexMap table
)
-------------------------------------------------------------
--/H Creates primary keys, foreign keys, and indices
--/A  -------------------------------------------------------
--/T Works for all user tables, views, procedures and functions 
--/T The default user is test, default access is U
--/T <BR>
--/T <li> taskID  int   	-- number of task causing this 
--/T <li> stepID  int   	-- number of step causing this 
--/T <li> tableName  varchar(1000)    -- name of table to get index or foreign key
--/T <li> fieldList  varchar(1000)    -- comma separated list of fields in key (no blanks)
--/T <li> foreignkey varchar(1000)    -- foreign key (f(a,b,c))
--/T <br> return value: 0: OK , > 0 : count of errors.
--/T <br> Example<br> 
--/T <samp>
--/T exec spCreateIndex @taskID, @stepID, 32 
--/T </samp>
-------------------------------------------------------------
AS BEGIN
	SET NOCOUNT ON;
	--
	DECLARE @indexName varchar(1000),
		@cmd nvarchar(2000),
		@msg varchar(2000),
		@status varchar(16),
		@fgroup varchar(100),
		@ret int,
		@error int,
		@type varchar(100), 		-- primary key, unique, index, foreign key 
		@code char(1),			-- the character code, 'K','I','F'
		@tableName varchar(100), 	-- table name 'photoObj'
		@fieldList varchar(1000),	-- fields 'u,g,r,i,z'
		@foreignKey varchar(1000);  	-- if foreign key 'SpecObj(SpecObjID)'
	--
	SET @status = 'OK'

	--------------------------------------------------
	-- fetch the parameters needed for spIndexCreate
	--------------------------------------------------
	SELECT @type=type, @code=code, @tablename=tableName, 
		@fieldlist=fieldList, @foreignkey=foreignKey
	    FROM IndexMap WITH (nolock)
	    WHERE indexmapid=@indexmapid;

	------------------------------------------------
	-- get the name of the filegroup for the index
	------------------------------------------------
	set @fgroup = null;
	select @fgroup = coalesce(indexFileGroup,'PRIMARY')
		from FileGroupMap with (nolock)
		where tableName=@tableName;
	--
	IF  @fgroup is null SET @fgroup='PRIMARY';
	SET @fgroup = '['+@fgroup+']';
	--
	set @indexName = dbo.fIndexName(@code,@tablename,@fieldList,@foreignKey)
	set @fieldList  = REPLACE(@fieldList,' ','');
	--
/*
	------------------------------------------------
	-- check the existence of the table first, and 
	-- issue warning and exit if it doesnt exist
	------------------------------------------------
	IF NOT EXISTS (SELECT name FROM sysobjects
        	WHERE xtype='U' AND name = @tableName)
	    BEGIN
		SET @msg = 'Could not create index ' + @indexName + ': table ' 
			+ @tablename + ' does not exist!'
		SET @status = 'WARNING'
		EXEC spNewPhase @taskid, @stepid, 'IndexCreate', @status, @msg 
		-----------------------------------------------------
		RETURN 1	
	    END
*/
	---------------
	-- Primary key
	---------------
	IF (lower(@type) = N'primary key')
	    BEGIN
		set @cmd = N'SET ANSI_NULLS ON; SET ANSI_PADDING ON; SET ANSI_WARNINGS ON; SET ARITHABORT OFF; SET CONCAT_NULL_YIELDS_NULL ON;  SET NUMERIC_ROUNDABORT OFF; SET QUOTED_IDENTIFIER ON; ALTER TABLE '+@tablename+' ADD CONSTRAINT '
			+@indexName+' PRIMARY KEY CLUSTERED '
			+'('+@fieldList+') '
		--
		set @msg = 'primary key constraint '+@tableName+'('+@fieldList+')'
	    END
	------------------
	-- [unique] index
	------------------
	IF ((lower(@type) = 'index') or (lower(@type) = 'unique index'))
	    BEGIN
		set @cmd = N'SET ANSI_NULLS ON; SET ANSI_PADDING ON; SET ANSI_WARNINGS ON; SET ARITHABORT OFF; SET CONCAT_NULL_YIELDS_NULL ON;  SET NUMERIC_ROUNDABORT OFF; SET QUOTED_IDENTIFIER ON; CREATE '+upper(@type)+' '+@indexName+' ON '    
			+@tableName+'('+@fieldList+') WITH SORT_IN_TEMPDB';
		--
		if @fgroup is not null set @cmd = @cmd +' ON '+@fgroup;
		--
		set @msg = @type+' '+@tableName+'('+@fieldList+')'
	    END
	---------------
	-- foreign key
	---------------
	IF (lower(@type) = 'foreign key')
	    BEGIN
			set @cmd = N'ALTER TABLE '+@tableName+' WITH NOCHECK ADD CONSTRAINT '+@indexName   
				+' FOREIGN KEY ('+@fieldList+') REFERENCES '+@foreignKey;
			--
			set @msg = 'foreign key constraint '+@tableName 
				+'('+@fieldList+') references '+@foreignKey
	    END
	------------------------
	-- Perform the command
	------------------------
        IF EXISTS (
			SELECT [name] FROM dbo.sysobjects
			WHERE [name] = @tableName
		) 
			BEGIN
				IF NOT EXISTS (	select id from dbo.sysobjects
	    							where [name] = @indexname
	  							union
	    						select id from dbo.sysindexes
	    							where [name] = @indexname 
							  )
	    			BEGIN
						SET @ret = 1;		-- set it to an error value
						BEGIN TRANSACTION
							EXEC @ret=sp_executeSql @cmd 
							SET @error = @@error;
						COMMIT TRANSACTION
    				END
				ELSE 
				    BEGIN	-- index already there
						SET @status = 'OK'
						SET @msg = @msg  + ' already exists.'
						SET @ret = -1		-- signifies special case
					END
			END
		ELSE
			BEGIN
				SET @status = 'ERROR'
				SET @msg = 'Error in '+ @msg + ': Table ' + @tableName + ' does not exist!' 
				SET @ret = 1
			END
	--
	IF (@ret =  0)
	    BEGIN
			SET @status = 'OK'
			SET @msg = 'Created '  + @msg  
	    END

	IF (@ret > 0)
	    BEGIN
			IF (@error is not null)
				BEGIN
					SET @status = 'ERROR'
					DECLARE @sysmsg varchar(1000)
					SELECT @sysmsg = description FROM master.dbo.sysmessages WHERE error = @error
					IF (@sysmsg is null) SET @sysmsg = 'no sysmsg'
					SET @msg = 'Error in '+ @msg + ', ' + cast(@error as varchar(10)) + ': '  + @sysmsg 
				END
			ELSE
				BEGIN
					IF (@status != 'ERROR')
						BEGIN		-- not already marked as error
							SET @status = 'WARNING'
							SET @msg = 'Error in '+ @msg + '.' 
						END
				END
	    END
	-----------------------
	-- Generate log record
	-----------------------
	EXEC spNewPhase @taskid, @stepid, 'IndexCreate', @status, @msg 
	-----------------------------------------------------
	RETURN (case when (@ret < 0) then 0 else @ret end) 
END

GO
/****** Object:  StoredProcedure [dbo].[spIndexCreatePhotoTag]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spIndexCreatePhotoTag](@taskid int, @stepid int)
-------------------------------------------------------------
--/H Create the fat PhotoTag index on PhotoObjAll.
--/A
--/T <br><samp>
--/T <br> exec  dbo.spIndexCreatePhotoTag 0, 0
--/T </samp>  
-------------------------------------------------------------
AS BEGIN
	IF NOT EXISTS (	select id from dbo.sysobjects
	    where [name] = 'i_PhotoObjAll_phototag'
	  	union
		select id from dbo.sysindexes
	    where [name] = 'i_PhotoObjAll_phototag' 
	)
	CREATE NONCLUSTERED INDEX [i_PhotoObjAll_PhotoTag] ON [dbo].[PhotoObjAll] 
	(
		[objID] ASC,
		[htmID] ASC,
		[fieldID] ASC,
		[specObjID] ASC,
		[run] ASC,
		[camcol] ASC,
		[ra] ASC,
		[dec] ASC,
		[cx] ASC,
		[cy] ASC,
		[cz] ASC,
		[flags] ASC,
		[mode] ASC,
		[type] ASC,
		[clean] ASC
	)
	INCLUDE ( [field],
		[obj],
		[resolveStatus],
		[nChild],
		[probPSF],
		[flags_u],
		[flags_g],
		[flags_r],
		[flags_i],
		[flags_z],
		[psfMag_u],
		[psfMag_g],
		[psfMag_r],
		[psfMag_i],
		[psfMag_z],
		[psfMagErr_u],
		[psfMagErr_g],
		[psfMagErr_r],
		[psfMagErr_i],
		[psfMagErr_z],
		[petroMag_u],
		[petroMag_g],
		[petroMag_r],
		[petroMag_i],
		[petroMag_z],
		[petroMagErr_u],
		[petroMagErr_g],
		[petroMagErr_r],
		[petroMagErr_i],
		[petroMagErr_z],
		[petroR50_r],
		[petroR90_r],
		[modelMag_u],
		[modelMag_g],
		[modelMag_r],
		[modelMag_i],
		[modelMag_z],
		[modelMagErr_u],
		[modelMagErr_g],
		[modelMagErr_r],
		[modelMagErr_i],
		[modelMagErr_z],
		[cModelMag_u],
		[cModelMag_g],
		[cModelMag_r],
		[cModelMag_i],
		[cModelMag_z],
		[cModelMagErr_u],
		[cModelMagErr_g],
		[cModelMagErr_r],
		[cModelMagErr_i],
		[cModelMagErr_z],
		[mRrCc_r],
		[mRrCcErr_r],
		[mRrCcPSF_r],
		[fracDeV_u],
		[fracDeV_g],
		[fracDeV_r],
		[fracDeV_i],
		[fracDeV_z],
		[psffwhm_u],
		[psffwhm_g],
		[psffwhm_r],
		[psffwhm_i],
		[psffwhm_z],
		[thingId],
		[balkanId],
		[nObserve],
		[nDetect],
		[calibStatus_u],
		[calibStatus_g],
		[calibStatus_r],
		[calibStatus_i],
		[calibStatus_z],
		[extinction_u],
		[extinction_g],
		[extinction_r],
		[extinction_i],
		[extinction_z]
	)
END

GO
/****** Object:  StoredProcedure [dbo].[spIndexDrop]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spIndexDrop](@type varchar(10)) 
-------------------------------------------------------------
--/H Drops all indices of a given type 'F' (foreign key), 'K' (primary key), or 'I' index
--/A --------------------------------------------------------
--/T Uses the information in the sysobjects and sysindexes table to delete the indexes.
--/T These should be called in the sequence 'F', 'K', 'I'
--/T <BR>
--/T <li> type  varchar(16)   -- 'F' (foreign key), 'K' (primary key), or 'I' index
--/T <br><samp>
--/T <br> exec  dbo.spIndexDrop 'F'
--/T </samp>  
-------------------------------------------------------------
AS BEGIN
	SET NOCOUNT ON;
	--
	DECLARE @prevName VARCHAR(256)	-- if drop fails, keep going, do not get hung up
	SET @prevName = ''		-- always go on to next index.
	------------------------------------------
	-- loop through the sysobjects
	-- and eliminate keys of type ('K', 'F') 
	------------------------------------------
	-- never heard of this kind of index
	IF (@type not in ('F', 'K', 'I'))
	BEGIN	
	    PRINT 'Illegal parameter'
	    RETURN 
	END
	------------------------------------
	-- command holds the drop statement
	------------------------------------
	DECLARE @cmd varchar(1000)
	----------------------------------------------------------------
	-- loop over all indices of the given type, dropping each one
	-- (1) begin a transaction, 
	-- (2) fetch next "drop index" or "alter table" command
	-- (3) drop the index.
	-- (4) commit
	-----------------------------------------------------------------
	WHILE (1=1)
	BEGIN
		BEGIN TRANSACTION
		set @cmd = ''
		IF (@type in ('K', 'F')) 
	    		BEGIN
			select 	@cmd = 'ALTER TABLE '+u.name+' DROP CONSTRAINT '+ c.name,
				@prevName = rtrim(c.name) + '.' + rtrim(u.name)
      			from sysobjects u, sysobjects c
      			where u.xtype='U' and (c.type=@type)
				and c.parent_obj= u.id
				and u.name != 'dtproperties'
				and rtrim(c.name) + '.' + rtrim(u.name) > rtrim(@prevName)
				order by rtrim(c.name) + '.' + rtrim(u.name)  desc
	   		 END
		-- This handles "ordinary" 'I' indices
 		IF (@type = 'I')
	   		BEGIN
   			SELECT  @cmd = 'DROP INDEX  '+t.name+'.'+ i.name, 
				@prevName = rtrim(t.name) + '.' + rtrim(i.name)
			FROM sysindexes i, sysobjects t 
  			WHERE 	i.id = t.id 
    				and i.keys is not null
    				and i.name not like '%sys%'
				and rtrim(t.name) + '.' + rtrim(i.name) > @prevName
    				and i.name not in (
  	  				select name from sysobjects
   					where xtype IN ('PK', 'F')
  					   or upper(name) like 'PK_%' 
					   or upper(name) like 'FL_%'
					)
				order by rtrim(t.name) + '.' + rtrim(i.name) desc
	    		END
		IF (@cmd IS NULL) or (@cmd = '') -- we did not find an index
			BEGIN
			COMMIT TRANSACTION
			BREAK			-- and exit
			END
		--PRINT @cmd  
		EXEC (@cmd)			-- execute the drop
		COMMIT TRANSACTION		-- commit the work
	END				-- loop on to next index

	--=========================================================
	-- end of loop,   return.
	RETURN
END

GO
/****** Object:  StoredProcedure [dbo].[spIndexDropList]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spIndexDropList](@taskid int, @stepid int)
-------------------------------------------------------------
--/H Drops the indices from a selection, based upon the #indexmap table
--/A --------------------------------------------------------
--/T It also assumes that we created before an #indexmap temporary table
--/T that has three attributes, id int, indexmapid int, status int.
--/T status values are 0:READY, 1:STARTED, 2:DONE
-------------------------------------------------------------
AS BEGIN
	SET NOCOUNT ON;
	--
	DECLARE @nextindex int,
		@ret int,
		@code char(1),
		@cmd nvarchar(4000),
		@msg varchar(4000),
		@status varchar(16),
		@error int,
		@indexName varchar(128),
		@tableName varchar(100);
	--
	SET @status='OK';
	--
	WHILE (1=1)
	BEGIN
		----------------------------------
		-- get the next index to drop
		----------------------------------
		SET @nextindex=NULL;
		SELECT @nextindex=indexmapid
		    FROM #indexmap WITH (nolock)
		    WHERE id in (
			select min(id) from #indexmap WHERE status=0
			);
		----------------------------------
		-- exit if error
		----------------------------------
		IF @@error>0 RETURN(1);
		IF @nextindex IS NULL  RETURN(2);

		----------------------------------
		-- set status to STARTED(1)
		----------------------------------
		UPDATE #indexmap
		    SET status=1
		    WHERE indexmapid=@nextindex;

		--------------------------------------------------
		-- fetch the parameters needed for fIndexName
		--------------------------------------------------
		SELECT  @code=code, @tablename=tableName, 
			@indexName = dbo.fIndexName(code,tablename,fieldList,foreignKey)
		    FROM IndexMap WITH (nolock)
		    WHERE indexmapid=@nextindex;
		-------------------------------------------------
		    SET @cmd = N''
		    SET @msg = 'dropped ';
		    IF (@code = 'K')
			BEGIN
			    -- if indexname is in sysobjects, it is a constraint
			    -- rather than an index (it isnt in sysindexes)
			    IF EXISTS (
				SELECT id FROM dbo.sysobjects 
				WHERE [name] = @indexname
				)
				SELECT 	@msg = @msg + 'primary key constraint ',
					@cmd = N'ALTER TABLE '+@tableName+' DROP CONSTRAINT '+ @indexName
			    ELSE
	   			SELECT  @msg = @msg + 'primary key index ',
					@cmd = N'DROP INDEX  '+@tableName+'.'+@indexName
			END
		    IF (@code = 'F')
			SELECT 	@msg = @msg + 'foreign key constraint ',
				@cmd = N'ALTER TABLE '+@tableName+' DROP CONSTRAINT '+ @indexName
		    IF (@code = 'I')
   			SELECT  @msg = @msg + 'index ',
				@cmd = N'DROP INDEX  '+@tableName+'.'+@indexName
		    --
		    SET @msg = @msg + @tableName+'.'+@indexName;
		    --
		    IF (@cmd='') BREAK;
		    ------------------------------------
		    -- only drop index if it exists
		    ------------------------------------
		    IF EXISTS (	
			select id from dbo.sysobjects
			    where [name] = @indexname
			union
			select id from dbo.sysindexes
			    where [name] = @indexname
			)
		    BEGIN
			BEGIN TRANSACTION
			    SET @ret = 0
		    	    EXEC @ret=sp_executesql @cmd
			    --------------------------------------
			    -- if all OK, update status to DONE(2)
			    --------------------------------------
			    IF (@ret > 0)
			    BEGIN
				SET @error  = @@error;
				SET @status = 'ERROR'
				DECLARE @sysmsg varchar(1000)
				select @sysmsg = description from master.dbo.sysmessages where error = @error
				IF (@sysmsg is null) set @sysmsg = 'no sysmsg'
				SET @msg = 'Error in '+ @msg + '. ' + cast(@error as varchar(10)) + ': '  + @sysmsg 
			    END
			    --
			    IF @ret=0 
			    BEGIN
				UPDATE #indexmap
				    SET status=2
				    WHERE indexmapid=@nextindex;
				--
				EXEC spNewPhase @taskid, @stepid,  
					'IndexDrop','OK',@msg 
				--
			    END
			COMMIT TRANSACTION		
		    END
		-----------------------------------------------------------------
	END
	RETURN(0);
END

GO
/****** Object:  StoredProcedure [dbo].[spIndexDropSelection]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spIndexDropSelection](@taskid int, @stepid int, @type varchar(128), @group varchar(1024)='')
-------------------------------------------------------------
--/H Drops a set of indexes from a selection given by @type and @group
--/A --------------------------------------------------------
--/T The procedure uses the IndexMap table to drop the selected indices.
--/T The parameters are the body of a group clause, to be used with IN (...),
--/T separated by comma, like @type = 'F,K,I', @group='PHOTO,TAG,META';
--/T <BR>
--/T <li> @type   varchar(256)  -- a subset of F,K,I 
--/T <br> Here 'F': (foreign key), 'K' (primary key), 'I' index
--/T <li> @group  varchar(256) -- a subset of PHOTO,TAG,SPECTRO,QSO,TILES,META,FINISH,NEIGHBORS,ZONE,MATCH
--/T It will also accept 'ALL' as an alternate argument, it means build all indices. Or one can specify
--/T a comma separated list of tables.
--/T <br> The sp assumes that the parameters are syntactically correct.
--/T Returns 0, if all is well, 1 if an error has occurred, 
--/T and 2, if no more indexes are to be built.
--/T <br><samp>
--/T    exec spIndexDropSelection 1,1, 'K,I,F', 'PHOTO'
--/T </samp>  
-------------------------------------------------------------
AS BEGIN
	SET NOCOUNT ON;
	--
	DECLARE @ltype varchar(256), 
		@lgroup varchar(4000),
		@ret int,
		@cmd nvarchar(2000);
	--
	SET @ltype  = ''''+REPLACE(@type, ',',''',''')+'''';
	SET @lgroup = ''''+REPLACE(@group,',',''' COLLATE SQL_Latin1_General_CP1_CS_AS,''')
		+''' COLLATE SQL_Latin1_General_CP1_CS_AS';
	--
	IF @type ='' OR @group='' RETURN(1);
	--------------------------------------------------------
	-- insert the list to be built into the table #indexmap,
	-- order it by code in reverse order, so pk are built first
	--------------------------------------------------------
	CREATE TABLE #indexmap (id int identity(1,1), indexmapid int, status int);
	SET @cmd = N'INSERT INTO #indexmap(indexmapid, status) SELECT indexmapid, 0 as status '
		+ 'FROM IndexMap WITH (nolock) '
		+ 'WHERE code IN ('+@ltype+') ';
	------------------------------------------------
	-- look for the ALL clause for group selection
	------------------------------------------------
	IF @group NOT LIKE 'ALL%' 
	    BEGIN
		IF (@group NOT IN (SELECT DISTINCT indexgroup FROM IndexMap)) AND
		   (@type = 'F') -- foreign keys for specific table(s) indicated
--		    SET @cmd = @cmd + ' and foreignKey LIKE ''' + @group + '(%''';
		    SET @cmd = @cmd + ' and tableName LIKE ''' + @group + '%''';
		ELSE
		    SET @cmd = @cmd + ' and (indexgroup IN ('+@lgroup+')'
		  	+ ' or tableName IN ('+@lgroup+'))';
	    END
	------------------------------------------------
	-- order it by code in reverse order, so pk are dropped last
	------------------------------------------------
	SET @cmd = @cmd + ' ORDER BY code ASC';
	--
	EXEC @ret= sp_executesql @cmd
	IF @ret>0 RETURN(1);
	--------------------------------------------
	-- loop through the indexes and build them
	--------------------------------------------
	SET @ret = 0;
	EXEC @ret=spIndexDropList @taskid, @stepid
	--
	RETURN(0);
END

GO
/****** Object:  StoredProcedure [dbo].[spLoadMetaData]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE PROCEDURE [dbo].[spLoadMetaData](@taskid int, @stepid int,
	@metadir varchar(128), @dropIndices int = 0)
---------------------------------------------------
--/H Loads the Metadata about the schema
--/A -------------------------------------------------
--/T Insert metadata into the database, where it is
--/T located in the UNC path @metadir. Only log if
--/T @taskid>0. Returns >0, if errors occurred.
--/T It will drop and rebuild the indices on the 
--/T META index group.
--/T <samp>exec spLoadMetaData 0,0, '\\SDSSDB\c$\sqlLoader\schema\csv\' </samp>
---------------------------------------------------
AS
BEGIN
	--
	SET NOCOUNT ON;
	--
    	DECLARE @ret int,
		@err int,
		@dbname varchar(64),
		@msg varchar(1024),
		@cmd nvarchar(1024),
		@fname varchar(128);

	--------------------------------------
	-- write log message
	--------------------------------------
	SET @msg =  'Starting to load metadata';
	IF @taskID > 0
		EXEC spNewPhase @taskID, @stepID,
			'Metadata','OK',@msg;
	ELSE
		PRINT @msg;
	--
	SET @ret=0;
	SET @err=0;

	--------------------------------------------------
	-- verify that directory exists and it has files
	--------------------------------------------------
	CREATE TABLE #msg (id int identity(1,1), s varchar(2048));
	SET @cmd = N'dir '+@metadir+ '*.sql /B';
	INSERT INTO #msg EXEC @ret=master.dbo.xp_cmdshell @cmd;
	SELECT @ret = count(*) FROM #msg
	    WHERE  s like '%cannot find%' 
		or s like '%Not Found%' 
		or s like '%incorrect%'
		and s is not NULL
	--
	IF @ret>0 
	BEGIN
		SET @msg =  'The directory '+ @metadir +' not found';
		IF @taskid > 0
		    EXEC spNewPhase @taskID, @stepID, 'Metadata','ABORTING',@msg;
		ELSE
		    PRINT @msg;
		RETURN @ret
	END

	-------------------------------------------------
	-- first drop all the primary/foreign keys and indices
	-------------------------------------------------
	IF (@dropIndices != 0)
	    BEGIN
		EXEC spIndexDropSelection @taskid, @stepid, 'F','META'
		EXEC spIndexDropSelection @taskid, @stepid, 'I','META'
		EXEC spIndexDropSelection @taskid, @stepid, 'K','META'
	    END

    	--
	EXEC @ret=dbo.spRunSQLScript @taskid, @stepid,
		'Metadata', @metadir, 'loaddbobjects.sql' 
	SET @err = @err+@ret;
	--
	EXEC @ret=dbo.spRunSQLScript @taskid, @stepid,
		'Metadata', @metadir, 'loaddbviewcols.sql' 
	SET @err = @err+@ret;
	--
	EXEC @ret=dbo.spRunSQLScript @taskid, @stepid,
		'Metadata', @metadir, 'loaddbcolumns.sql' 
	SET @err = @err+@ret;
	--
	EXEC @ret=dbo.spRunSQLScript @taskid, @stepid,
		'Metadata', @metadir, 'loadinventory.sql' 
	SET @err = @err+@ret;
	--
	EXEC @ret=dbo.spRunSQLScript @taskid, @stepid,
		'Metadata', @metadir, 'loaddependency.sql' 
	SET @err = @err+@ret;
	--
	EXEC @ret=dbo.spRunSQLScript @taskid, @stepid,
		'Metadata', @metadir, 'loadhistory.sql' 
	SET @err = @err+@ret;
	--
	
	-----------------------------------------
	-- rebuild the indices on the META group if necessary
	-----------------------------------------
	IF (@dropIndices != 0)
	    BEGIN
		EXEC spIndexBuildSelection @taskid, @stepid, 'K','META'
		EXEC spIndexBuildSelection @taskid, @stepid, 'I','META'
		EXEC spIndexBuildSelection @taskid, @stepid, 'F','META'
	    END	
	--
	RETURN @err;
END
GO
/****** Object:  StoredProcedure [dbo].[spLoadPatches]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE PROCEDURE [dbo].[spLoadPatches] (@taskID INT, @stepID INT)
----------------------------------------------------------------
--/H Run any patches that may have accumulated during the loading
--/H process.
--/A -----------------------------------------------------------
--/T Run the patches recorded in the nextReleasePatches.sql file
--/T in the patches directory.
----------------------------------------------------------------
AS
BEGIN
    DECLARE @ret int, @sqldir varchar(128), @status varchar(32),
	    @msg varchar(2048), @patchFileName varchar(256),
	    @cmd nvarchar(2048);
    EXEC loadsupport.dbo.spSetFinishPhase 'loadPatches'
    SELECT @sqldir=value 
	FROM loadsupport..Constants WITH (nolock)
	WHERE name='sqldir';
    SET @patchFileName = '..\patches\nextReleasePatches.sql';
    SET @cmd = 'DIR '+@sqldir+@patchFileName;
    EXEC @ret = master.dbo.xp_cmdshell @cmd, no_output;
    IF @ret = 0
	BEGIN
	    EXEC @ret=dbo.spRunSQLScript @taskid, @stepid,
		'Patches', @sqldir, @patchFileName
    	    IF @ret = 0
		BEGIN
		    SET @status = 'OK';
		    SET @msg = 'Loaded patches since last release';
		END
	    ELSE
		BEGIN
		    SET @status = 'WARNING';
		    SET @msg = 'Problem with loading patches - script '+@sqldir+@patchFileName+' failed.';
		END
	END
    ELSE
	BEGIN
	    SET @status = 'WARNING';
	    SET @msg = 'Problem with loading patches - file '+@sqldir+@patchFileName+' not found.';
	END
 
    -- give phase message telling of success.
    EXEC spNewPhase @taskID, @stepID, 'spLoadPatches', @status, @msg;
    -----------------------------------------------------
    RETURN (@ret);
END
GO
/****** Object:  StoredProcedure [dbo].[spLoadPhotoTag]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE PROCEDURE [dbo].[spLoadPhotoTag] (@taskID INT, @stepID INT, 
				 @incremental tinyint = 1)
-------------------------------------------------------------------------------
--/H Create the PhotoTag index in PhotoObjAll
--/A --------------------------------------------------------------------------
--/T This index contains the popular fields from the PhotoObjAll table.
-------------------------------------------------------------------------------
AS BEGIN
	SET NOCOUNT ON;
	DECLARE @msg VARCHAR(256), @ret int
	SET @ret = 0
	EXEC loadsupport.dbo.spSetFinishPhase 'loadPhotoTag'
	--
	EXEC @ret = dbo.spIndexCreatePhotoTag @taskID, @stepID
/*
	IF (@incremental = 0)
	    BEGIN
		-- if campaign load, delete existing contents of table
		TRUNCATE TABLE PhotoTag
		-- insert the contents ordered on objid for efficient scans
		INSERT PhotoTag
		SELECT 	objID,
			skyVersion,
			run,
			rerun,
			camcol,
			field,
			obj,
			mode,
			nChild,
			type,
			probPSF,
			insideMask,
			flags,
			psfMag_u,psfMag_g,psfMag_r,psfMag_i,psfMag_z,
			psfMagErr_u,psfMagErr_g,psfMagErr_r,psfMagErr_i,psfMagErr_z,
			petroMag_u,petroMag_g,petroMag_r,petroMag_i,petroMag_z,
			petroMagErr_u,petroMagErr_g,petroMagErr_r,petroMagErr_i,petroMagErr_z,
			petroR50_r,
			petroR90_r,
			modelMag_u,modelMag_g,modelMag_r,modelMag_i,modelMag_z,
			modelMagErr_u,modelMagErr_g,modelMagErr_r,modelMagErr_i,modelMagErr_z,
			mRrCc_r,
			mRrCcErr_r,
			lnLStar_r,
			lnLExp_r,
			lnLDeV_r,
			ra,[dec],
			cx,cy,cz,
			extinction_u,extinction_g,extinction_r,extinction_i,extinction_z,
			htmID,
			fieldID,
			SpecObjID,
			( case when mRrCc_r > 0 then SQRT(mRrCc_r/2.0)else 0 end) as size
		FROM PhotoObjAll
		ORDER BY objID
		OPTION (MAXDOP 1)
		EXEC spNewPhase @taskID, @stepID, 'Load PhotoTag', 'OK', 'Loaded PhotoTag table';
	    END
	ELSE
	    BEGIN
		-- for incremental loading, only insert objects not already
		-- in the table, and dont bother to order on objid
		INSERT PhotoTag
		SELECT 	objID,
			skyVersion,
			run,
			rerun,
			camcol,
			field,
			obj,
			mode,
			nChild,
			type,
			probPSF,
			insideMask,
			flags,
			psfMag_u,psfMag_g,psfMag_r,psfMag_i,psfMag_z,
			psfMagErr_u,psfMagErr_g,psfMagErr_r,psfMagErr_i,psfMagErr_z,
			petroMag_u,petroMag_g,petroMag_r,petroMag_i,petroMag_z,
			petroMagErr_u,petroMagErr_g,petroMagErr_r,petroMagErr_i,petroMagErr_z,
			petroR50_r,
			petroR90_r,
			modelMag_u,modelMag_g,modelMag_r,modelMag_i,modelMag_z,
			modelMagErr_u,modelMagErr_g,modelMagErr_r,modelMagErr_i,modelMagErr_z,
			mRrCc_r,
			mRrCcErr_r,
			lnLStar_r,
			lnLExp_r,
			lnLDeV_r,
			ra,[dec],
			cx,cy,cz,
			extinction_u,extinction_g,extinction_r,extinction_i,extinction_z,
			htmID,
			fieldID,
			SpecObjID,
			( case when mRrCc_r > 0 then SQRT(mRrCc_r/2.0)else 0 end) as size
		FROM PhotoObjAll
		WHERE objid NOT IN (SELECT objid FROM PhotoTag)
		OPTION (MAXDOP 1)
		SET @msg = 'Loaded '+cast(@@rowcount as varchar(10))+' rows into the PhotoTag table';
		EXEC spNewPhase @taskID, @stepID, 'Load PhotoTag', 'OK', @msg
	    END
*/
    SET @msg = 'Created PhotoTag index in PhotoObjAll';
    EXEC spNewPhase @taskID, @stepID, 'Load PhotoTag', 'OK', @msg
    RETURN(@ret)
END
GO
/****** Object:  StoredProcedure [dbo].[spLoadScienceTables]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE PROCEDURE [dbo].[spLoadScienceTables](@taskid int, @stepid int)
---------------------------------------------------
--/H Loads the data needed for science with the SDSS.
--/A -------------------------------------------------
--/T Insert data into RC3, Stetson, QSOCatalog
--/T and other science data tables.
---------------------------------------------------
AS
BEGIN
	--
	SET NOCOUNT ON;
	--
	DECLARE @msg varchar(8000), 
		@cmd nvarchar(2048), 
		@status varchar(16), 
		@ret int;
	--
	SET @ret = 0;
	DECLARE @metadir varchar(128);
	TRUNCATE TABLE RC3
	TRUNCATE TABLE Stetson
	SELECT @metadir=value 
		FROM loadsupport..Constants WITH (nolock)
	WHERE name='metadir';
	SET @cmd = N'BULK INSERT RC3 FROM '''+@metadir+'\\rc3.csv'' WITH ('
		+ ' DATAFILETYPE = ''char'','
		+ ' FIELDTERMINATOR = '','','
		+ ' ROWTERMINATOR = ''\n'','
		+ ' BATCHSIZE =10000,'
		+ ' CODEPAGE = ''RAW'','
		+ ' TABLOCK)';
	--
	EXEC @ret=sp_executesql @cmd;
	IF @ret != 0
		RETURN(@ret);
	--
	SET @cmd = N'BULK INSERT Stetson FROM '''+@metadir+'\\stetson.csv'' WITH ('
		+ ' DATAFILETYPE = ''char'','
		+ ' FIELDTERMINATOR = '','','
		+ ' FIRSTROW = 2,'
		+ ' ROWTERMINATOR = ''\n'','
		+ ' BATCHSIZE =10000,'
		+ ' CODEPAGE = ''RAW'','
		+ ' TABLOCK)';
	--
	EXEC @ret=sp_executesql @cmd;
	--
	IF @ret = 0
	    BEGIN
		UPDATE Stetson
		   SET objid = dbo.fGetNearestObjIdEq(ra, dec, 0.1)
	    END
	--
	RETURN(@ret);
END
GO
/****** Object:  StoredProcedure [dbo].[spLogSqlPerformance]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spLogSqlPerformance] (
        @webserver      VARCHAR(64) = '',   -- the url
	@winname	VARCHAR(64) = '',   -- the windows name of the server
        @clientIP       VARCHAR(16)  = 0,   -- client IP address 
	@access		VARCHAR(64) = '',   -- subsite of site,  if 'collab' statement 'hidden' 
	@startTime	datetime,           -- time the query was started
	@busyTime	bigint      = 0,    -- time the CPU was busy during query execution
	@endTime	datetime    = 0,    -- time the query finished
	@rows           bigint      = 0,    -- number of rows returned by the query
	@errorMsg	VARCHAR(1024) = ''  -- error message if applicable
) 
------------------------------------------------------------------------------- 
--/H Procedure to log success (or failure) of a SQL query to the performance log.
------------------------------------------------------------------------------- 
--/T The caller needs to specify the time the query was started, the number of <br>
--/T seconds (bigint) that the CPU was busy during the query execution, the    <br>
--/T time the query ended, the number of rows the query returned, and an error <br>
--/T message if applicable.  The time fields can be 0 if there is an error.
--/T <samp>EXEC dbo.spLogSQLPerformance('skyserver.sdss.org','',,'',getutcdate())</samp> 
--/T See also spLogSqlStatement.
------------------------------------------------------------------------------- 
AS 
BEGIN 
        SET NOCOUNT ON 
        ------------------------------------------------------ 
        -- record the performance when (if) the command completes. 
        IF ( (@startTime IS NOT NULL) AND (@startTime != 0) AND 
             (@busyTime != 0) AND (@endTime != 0) AND (LEN(@errorMsg) = 0) ) 
            BEGIN 
                INSERT WebLog.dbo.SqlPerformanceLogUTC 
	        VALUES (@startTime,@webserver,@winName, @clientIP,
                        DATEDIFF(ms, @startTime, @endTime)/1000.0,      -- elapsed time 
                        ((@@CPU_BUSY+@@IO_BUSY)-@busyTime)/1000.0,      -- busy time 
                        @rows, @@PROCID, 0,'')                                          -- rows returned                
            END
	ELSE
            BEGIN 
                IF ( (@startTime IS NULL) OR (@startTime = 0) )
                    SET @startTime = GETUTCDATE();
                INSERT WebLog.dbo.SqlPerformanceLogUTC 
	        VALUES (@startTime,@webserver,@winName, @clientIP,
			0,0,0, @@PROCID, -1, @errorMsg)  
            END
END
GO
/****** Object:  StoredProcedure [dbo].[spLogSqlStatement]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spLogSqlStatement] (
	@cmd VARCHAR(8000) OUTPUT, 
    @webserver      VARCHAR(64) = '',   -- the url
	@winname	VARCHAR(64) = '',   -- the windows name of the server
    @clientIP       VARCHAR(16)  = 0,   -- client IP address 
	@access		VARCHAR(64) = '',   -- subsite of site,  if 'collab' statement 'hidden' 
	@startTime	datetime            -- time the query was started
) 
------------------------------------------------------------------------------- 
--/H Procedure to log a SQL query to the statement log. 
------------------------------------------------------------------------------- 
--/T Log the given query and its start time to the SQL statement log.  Note
--/T that we are logging only the start of the query yet, not a completed query.
--/T All the SQL statements are journaled into WebLog.dbo.SQLStatementlog. 
--/T <samp>EXEC dbo.spLogSqlStatement('Select count(*) from PhotoObj',getutcdate())</samp> 
--/T See also spLogSqlPerformance.
------------------------------------------------------------------------------- 
AS 
BEGIN 
	SET NOCOUNT ON 
	DECLARE @error      INT;			-- error number
	DECLARE @serverName varchar(32);		-- name of this databaes server
	DECLARE @dbName     VARCHAR(32);		-- name of this database
	SET 	@serverName = @@servername;
	SELECT @dbname = [name] FROM master.dbo.sysdatabases WHERE dbid = db_id() 
	DECLARE @isVisible  INT;			-- flag says sql is visible to internet queries
	SET @isVisible = 1;
	IF (UPPER(@access) LIKE '%COLLAB%') SET @isVisible = 0;  -- collab is invisible
        -------------------------------------------------------------------------- 
        --- log the command if there is a weblog DB 
        if (0 != (select count(*) from master.dbo.sysdatabases where name = 'weblog')) 
            begin 
                insert WebLog.dbo.SqlStatementLogUTC 
                values(@startTime,@webserver,@winName, @clientIP, 
		       @serverName, @dbName, @access, @cmd, @isVisible) 
            end 
END
GO
/****** Object:  StoredProcedure [dbo].[spMakeDiagnostics]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spMakeDiagnostics]
-----------------------------------------------------------
--/H Creates a full diagnostic view of the database
--/A
--/T The stored procedure checks in all tables, views, functions
--/T and stored procedures into the Diagnostics table,
--/T and counts the number of rows in each table and view.
--/T <PRE> EXEC spMakeDiagnostics </PRE>
-----------------------------------------------------------
AS
BEGIN
    --
    -- clear out the table first
    --
    TRUNCATE TABLE Diagnostics;
    --
    --scan through all the user tables and views, leave out the dynamic stuff, and itself
    --
    INSERT INTO Diagnostics
    SELECT name, type, 0
	FROM sysobjects  
    	WHERE type IN ('U','V')
	    -- Object type of User-table and View
	    AND permissions (id)&4096 <> 0
	    AND name NOT IN ('QueryResults','RecentQueries','Diagnostics','SiteDiagnostics','test')
	    AND substring(name,1,3) NOT IN ('sys','dtp')
	ORDER BY type, name
    --
    -- insert all the functions and stored procedures
    --
    INSERT INTO Diagnostics
    SELECT name, type, 0
	FROM sysobjects  
    	WHERE type IN ('P', 'IF', 'FN', 'TF', 'X')	
	-- Object type of Procedure, scalar UDF, table UDF
	  and permissions (id)&32 <> 0
	  and substring(name,1,3) NOT IN
		('sp_' , 'dt_', 'xp_', 'fn_', 'MS_')
    --
    -- get the foreign keys
    --
    INSERT INTO Diagnostics
    SELECT name, type, 0 FROM sysobjects
	WHERE xtype IN ('F')
    --
    -- get the indices, which are not primary or foreign keys
    --
    INSERT INTO Diagnostics
    SELECT name, 'I' as type, 0	FROM sysindexes
	WHERE  keys is not null
	    and name NOT LIKE '%sys%'
	    and name NOT LIKE ('Statistic_%')
	    and name NOT IN (
	  	  select name from sysobjects
		  where xtype IN ('PK', 'F')
		  )

	CREATE TABLE #trows (
		table_name sysname ,
		row_count varchar(64),
		reserved_size VARCHAR(50),
		data_size VARCHAR(50),
		index_size VARCHAR(50),
		unused_size VARCHAR(50))

	SET NOCOUNT ON
	INSERT #trows 
		EXEC sp_msforeachtable 'sp_spaceused ''?'''
		
	UPDATE d
		SET d.count=CONVERT(bigint,r.row_count)
	FROM Diagnostics d JOIN #trows r on r.table_name=d.name
	WHERE d.type='U'    
	--
    -- load all the row counts for the tables
    --
    DECLARE mycursor CURSOR
	FOR
	    select 'UPDATE Diagnostics SET [count] = '+
		' (select count_big(*) from '+name+')'+
		' WHERE name = ''' + name + ''''
	    from Diagnostics 
	    where type = 'V'
    OPEN mycursor
    DECLARE @cmd sysname
    FETCH NEXT FROM mycursor INTO @cmd
    WHILE (@@FETCH_STATUS <> -1)
    BEGIN
	EXEC (@cmd)
	FETCH NEXT FROM mycursor INTO @cmd
    END
    DEALLOCATE mycursor
END
GO
/****** Object:  StoredProcedure [dbo].[spMakeFrame]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE PROCEDURE [dbo].[spMakeFrame](  @dbname varchar(256)
, @Dir Varchar(256)
, @run int
)
-------------------------------------------------------------------------------
--/H Build the the Frame from the Field table for a given run
--/A 
--/T A support procedure, only used by spLoadZoom.
-------------------------------------------------------------------------------
AS
BEGIN
SET NOCOUNT ON;

Declare 
  @sql nvarchar(max)
, @TableName varchar(20)
, @FilePath varchar(1000)
, @rowcount int
, @i int
, @j int
, @fieldid BIGint
, @ImgZoom int;

Set @rowcount =0;
Set @i = 1;
Set @j = 1;
--Set @run = 4623;
--Set @dir = '\\sdss3a\data\staging\4623\137\Zoom\';
Set @TableName = @dbname+'.'+'dbo.Frame';


Declare @TempFrame TABLE(
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
	[img] [varbinary](max) NULL,
	[FileName][varchar](1000) not null,
	[FilePath][varchar](1000) null
)


--Inserting the Frames data from Field and Run Tables for different Zoom Levels into the Temp Frame Table

INSERT INTO @TempFrame
           ([fieldID] ,[zoom] ,[run]  ,[rerun]  ,[camcol] ,[field]  ,[stripe] ,[strip] ,[a]  ,[b] ,[c] ,[d] ,[e],[f]  ,[node]  ,[incl] ,[raMin] ,[raMax]  ,[decMin]  ,[decMax]  ,[FileName])

SELECT 		fieldID ,0 as zoom ,f.run ,f.rerun ,f.camcol  ,f.field  ,r.stripe ,r.strip ,f.a_r ,f.b_r ,f.c_r ,f.d_r ,f.e_r ,f.f_r ,r.node ,r.incl ,f.raMin ,f.raMax ,f.decMin ,f.decMax ,dbo.fTileFileName(0, r.run, r.rerun, f.camcol, f.field, @dir) as FileName
 FROM Field f , Run r    WHERE    f.run=r.run and r.run = @run

UNION ALL

SELECT 		fieldID ,12 as zoom ,f.run ,f.rerun ,f.camcol  ,f.field  ,r.stripe ,r.strip ,f.a_r ,f.b_r ,f.c_r ,f.d_r ,f.e_r ,f.f_r ,r.node ,r.incl ,f.raMin ,f.raMax ,f.decMin ,f.decMax ,dbo.fTileFileName(12, r.run, r.rerun, f.camcol, f.field, @dir) as FileName
 FROM Field f , Run r    WHERE    f.run=r.run and r.run = @run
 
UNION ALL

SELECT 		fieldID ,25 as zoom ,f.run ,f.rerun ,f.camcol  ,f.field  ,r.stripe ,r.strip ,f.a_r ,f.b_r ,f.c_r ,f.d_r ,f.e_r ,f.f_r ,r.node ,r.incl ,f.raMin ,f.raMax ,f.decMin ,f.decMax ,dbo.fTileFileName(25, r.run, r.rerun, f.camcol, f.field, @dir) as FileName
 FROM Field f , Run r    WHERE    f.run=r.run and r.run = @run

UNION ALL

SELECT 		fieldID ,50 as zoom ,f.run ,f.rerun ,f.camcol  ,f.field  ,r.stripe ,r.strip ,f.a_r ,f.b_r ,f.c_r ,f.d_r ,f.e_r ,f.f_r ,r.node ,r.incl ,f.raMin ,f.raMax ,f.decMin ,f.decMax ,dbo.fTileFileName(50, r.run, r.rerun, f.camcol, f.field, @dir) as FileName
 FROM Field f , Run r    WHERE    f.run=r.run and r.run = @run

 
 -- Inserting data from the @TempFrame data into Frame Table

INSERT INTO Frame
           ([fieldID] ,[zoom] ,[run]  ,[rerun]  ,[camcol] ,[field]  ,[stripe] ,[strip] ,[a]  ,[b] ,[c] ,[d] ,[e],[f]  ,[node]  ,[incl] ,[raMin] ,[raMax]  ,[decMin]  ,[decMax] )
     
Select [fieldID]    ,[zoom]   ,[run]   ,[rerun] ,[camcol] ,[field]  ,[stripe] ,[strip] ,[a]  ,[b] ,[c] ,[d] ,[e],[f]  ,[node]  ,[incl] ,[raMin] ,[raMax]  ,[decMin]  ,[decMax]
     from @TempFrame 
 

--Updating the @TempFrame table for the FileName Sql Statement

Update @TempFrame 
Set FilePath = '(SELECT * FROM OPENROWSET(BULK N'''+FileName+''', SINGLE_BLOB) AS Document)' 

-- Reading the Frame data into a temp table for the Update Img Path

Select rowid = identity(int,1,1),fieldid,zoom, 'UPDATE '+@TableName+' Set img = '+''+FilePath+''  as SqlStatement
into #FieldImg
from @TempFrame

Select @rowcount = @@ROWCOUNT

-- Uploading the images from the FileSystem by the row-row updation.

While(@i<=@rowcount)
Begin

Select 
@fieldid = CAST(fieldid AS BIGINT)
,@ImgZoom = CAST(zoom AS INT)
,@sql = SqlStatement + ' WHERE FIELDID = '+''''+ CAST (FIELDID AS VARCHAR)+ '''' +' AND ZOOM = '+ CAST (ZOOM AS VARCHAR)
from 
#FieldImg
Where rowid = @i

EXEC (@sql)

Set @i = @i + 1
End

-- Droping the Temp Table.
Drop Table #FieldImg
END
GO
/****** Object:  StoredProcedure [dbo].[spMakeSpecObjAll]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spMakeSpecObjAll]
(  
  @DBName varchar(256)
, @CsvPath Varchar(256)
, @ImagePath Varchar(256)
)
AS
BEGIN
SET NOCOUNT ON;

Declare 
  @sql nvarchar(max)
, @TableName varchar(20)
, @TempTableName varchar(20)
, @rowcount int
, @i int
, @imgext varchar(5)
, @cmd nvarchar(max)

Set @i=0
Set @imgext = '.png'
Set @TableName = 'SpecObjAll'



IF OBJECT_ID('tempdb..#SpecObjAllCsv') IS NOT NULL 
    Drop table #SpecObjAllCsv
Select 
TOP 0 * 
into #SpecObjAllcsv
from SpecObjAll;

ALTER TABLE #SpecObjAllcsv
DROP COLUMN img;


Set @TempTableName = '#SpecObjAllcsv'
Set @cmd = N'BULK INSERT '+@TempTableName
  + ' FROM  '+ ''''+@CsvPath+ ''''+
  + ' WITH ( FIRSTROW = 2 '
  +	' ,FIELDTERMINATOR = '','''
  +	' ,ROWTERMINATOR = ''\n'')';
  
-- select @cmd
EXEC sp_executesql @cmd;

IF @@error<>0
	BEGIN
	Print 'ERROR while loading Spectrum CSV''s in spMakeSpecObjAll'
	Return
	END

-- Alter Table #SpecObjAllcsv
-- Add Img varbinary(max) null

-- Alter Table SpecObjAll
-- Alter Column Img varbinary(max) null

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[SpecObjAll]') AND name = N'pk_SpecObjAll_specObjID')
Alter Table SpecObjAll
Add Constraint pk_SpecObjAll_SpecObjID PRIMARY KEY CLUSTERED (SpecObjID)

-- Reading the Frame data into a temp table for the Update Img Path
INSERT INTO [dbo].[SpecObjAll]
Select 
*,
COALESCE(dbo.fGetBlob(''+@ImagePath+CAST(run2d as varchar)+'\'+right(('0000'+CAST(plate as varchar)),4)+'-'+CAST(mjd as varchar)+'\'+'spec-image-'+right(('0000'+CAST(plate as varchar)),4)+'-'+CAST(mjd as varchar)+'-'+right(('0000'+CAST(fiberID as varchar)),4)+@imgext+''),0x1111) as img
from #SpecObjAllCsv


/*
IF OBJECT_ID('tempdb..#SpecObjImg') IS NOT NULL 
    Drop table #SpecObjImg
Select 
	rowid = identity(int,1,1)
	,specObjID
	,plate
	,mjd
	,fiberID
	,run2d
	,'UPDATE '+@TableName+' Set img = '+ '(SELECT * FROM OPENROWSET(BULK N'''+@ImagePath+CAST(run2d as varchar)+'\'+right(('0000'+CAST(plate as varchar)),4)+'-'+CAST(mjd as varchar)+'\'+'spec-image-'+right(('0000'+CAST(plate as varchar)),4)+'-'+CAST(mjd as varchar)+'-'+right(('0000'+CAST(fiberID as varchar)),4)+@imgext+''', SINGLE_BLOB) AS Document)'  as SqlStatement
into 
#SpecObjImg
from #SpecObjAllCsv


Select @rowcount = @@ROWCOUNT

-- Uploading the images from the FileSystem by the row-row updation.
While(@i<=@rowcount)
Begin
Select 
	@sql = SqlStatement + ' WHERE specObjID = '+''+ CAST (specObjID AS VARCHAR) from #SpecObjImg
	Where rowid = @i

--Select @sql
EXEC (@sql)

IF @@error<>0
	BEGIN
	Print 'ERROR while loading Spectrum Images in spMakeSpecObjAll'
	Return
	END

Set @i = @i + 1
End

IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[SpecObjAll]') AND name = N'pk_SpecObjAll_specObjID')
ALTER TABLE [dbo].[SpecObjAll] DROP CONSTRAINT [pk_SpecObjAll_specObjID]

Alter Table SpecObjAll
Alter Column Img varbinary(max) NOT NULL

Drop table #SpecObjImg
*/
Drop table #SpecObjAllCsv
END


GO
/****** Object:  StoredProcedure [dbo].[spNearestObjEq]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spNearestObjEq]
	@ra  float, 
	@dec float, 
	@r   float
------------------------------------------------------------------
--/H Returns table containing the nearest primary object within @r arcmins of an Equatorial point (@ra,@dec)
--/T <br>For the Navigator. Returns the nearest primary object to a given point
--/T <br> ra, dec are in degrees.
-------------------------------------------------------------
--/T <p> returned table:  
--/T <li> run int,           		-- run that observed this primary object   
--/T <li> objID bigint,   		-- Photo object identifier
--/T <li> ra varchar(10),   		-- ra rounded to 5 decimal places.
--/T <li> dec varchar(8),   		-- dec rounded to 5 decimal places.
--/T <li> type varchar(8),        	-- type: galaxy, star, sky... 
--/T <li> U, G, R, I, Z,  varchar(6), 	-- magnitude/luptitude rounded to 2 digits.
--/T <li> distance varchar(6)        	-- distance in arc minutes to this object from the ra,dec.
--/T <br>
--/T Sample call to find all the Galaxies within 2 arcminutes of ra,dec 185,-0.5  <br>
--/T <samp> 
--/T <br> EXEC spNearestObjEq 185.0 -0.5 2
--/T </samp> 
--/T <br> see also fGetNearbyObjEq, fGetNearestObjEq, fGetNearbyObjXYZ, fGetNearestObjXYZ
------------------------------------------------------------------
AS
    SELECT TOP 1
	P.run,
	P.[objID] AS 'id',
	LTRIM(STR(P.ra,10,5))as ra,
	LTRIM(STR(P.dec,8,5)) as dec,
	dbo.fPhotoTypeN(P.type) as 'type',
	LTRIM(STR(P.u,6,2)) AS 'u', 
	LTRIM(STR(P.g,6,2)) AS 'g', 
 	LTRIM(STR(P.r,6,2)) AS 'r', 
	LTRIM(STR(P.i,6,2)) AS 'i',
	LTRIM(STR(P.z,6,2)) AS 'z',
 	LTRIM(STR(distance*60,7,3)) AS 'dist'
    FROM fGetNearbyObjEq (@ra, @dec, @r) as H, PhotoPrimary as P
    WHERE H.objID = P.objID
	AND P.i>0
	ORDER BY H.distance ASC 
GO
/****** Object:  StoredProcedure [dbo].[spNeighbors]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE PROCEDURE [dbo].[spNeighbors] (
	@taskid int, 
	@stepid int,
	@destinationType varchar(16),
	@destinationDB varchar(32),
	@radius float = 30.0,
	@matchMode tinyint = 1
) 
-------------------------------------------------------------
--/H Computes PhotoObj Neighbors based on nChild
--/A -----------------------------------------------------------
--/T Populate table of nearest neighbor object IDs for quicker 
--/T spatial joins. The table holds ALL star/galaxy objects within 
--/T 1/2 arcmin of each object. Typically each object has 7 such 
--/T neighbors in the SDSS data. If the destinationType is RUNS, 
--/T TARGET, or TILES, then the radius is 3 arcseconds. This is 
--/T the zoned algorithm. When complete, the neighbors and the 
--/T 'native' zone members can be copied to the destination DB.
--/T <p> Parameters:   
--/T <li> taskid int,   		-- Task identifier
--/T <li> stepid int,   		-- Step identifier
--/T <li> destinationType int,   	-- 'best', 'runs','target', 'tiles'
--/T <li> destinationDB int,   		-- destination database name
--/T <li> radius float,			-- search radius in arcsec
--/T <li> matchMode tinyint		-- if true, include multiple
--/T                                    -- observations of same object
--/T                                    -- in its neighbors, so the
--/T                                    -- Match tables can be built 
--/T <li> returns  0 if OK, non zero if something wrong  
--/T <br>
--/T Sample call for a 1/2 arcminute radius <br>
--/T <samp> 
--/T <br> exec  spNeighbors @taskid , @stepid, 'best', 'targetDB'  
--/T </samp> 
--/T <br>  
------------------------------------------------------------- 
AS BEGIN  
	SET NOCOUNT ON;
	-----------------------------------------------------
	-- Build the neighbors table using a zone-algorithms.
	--  (1) build a zone table
	--  (2) add in the margin
	--  (3) Build 1/2 the neighbors table nested-loops-join of the zones
	--  (4) add in other 1/2
	--  (5) build the index
	-- Prints out times 
	-- This can all be done in parallel.
	--===================================================
	DECLARE @start datetime,
		@begin datetime,
		@ret int,
		@err int,
		@msg varchar(1000);
	--
	SET @start = CURRENT_TIMESTAMP
	SET @begin = @start
	SET @err   = 0;
	---------------------------------------------------
	SET @destinationType = lower(substring(@destinationType,1,4))
	-- compute radius depending on Destination DB type.
	DECLARE @theta float; -- neighborhood radius in degrees
	SET @theta = @radius / 3600.0;
	---------------------------------------------------
	-- if @theta not set then give error and exit
	IF @theta IS NULL
	    BEGIN
		SET @msg = 'spNeighbors parameter: "' + @destinationType 
			+ '" is not in {best, runs, target, tiles, plates}'
		EXEC spNewPhase @taskid, @stepid, 'Neighbors', 'ERROR',@msg;
		RETURN (1);
	    END 
	SET @msg = 'Starting neighbors computation with a radius of ' 
			+ str(round(@radius,0 )) + ' arcSeconds '
	EXEC spNewPhase @taskid, @stepid, 'Neighbors', 'OK', @msg;
	---------------------------------------------------
	-- Declaration and Initialization of global variables 
	DECLARE @notZero float		-- used to prevent division by zero
	SET	@notZero = 1e-9		--
	--
	DECLARE @zoneHeight float  	-- zone height in degrees (==@theta)
	SET @zoneHeight = CASE 
	    WHEN @destinationType = 'best' THEN 30.0 -- 30 arcseconds 
	    WHEN @destinationType in ('runs','targ') THEN  15.0 -- 15" 
										-- That the best performance is achieved 
										-- when @zoneHeight = @theta is a myth. 
										-- If zoneHeight small then the 
										-- performance is not so good.
	END

	--
	DECLARE @count bigint		-- count of records in Neighbors table
	SET 	@count = 0 		--
	--
	DECLARE @began datetime 
	SET 	@began  = @start
	--

	-------------------------
	-- build the Zone table
	-------------------------
	EXEC spZoneCreate @taskid, @stepid, @radius, @zoneHeight;

	SET @zoneHeight = @zoneHeight/3600.0 -- From here we need @zoneHeight in degrees
 	---------------------------------------------------
	--EXEC spNewPhase @taskid, @stepid, 'Neighbors', 'WARNING', 'todo: populate foreigners table using the destination DB and Area';
	---------------------------------------------------
	-- Populate the neighbors table.
	-- Nested loop join zone table with itself -1, 0, +1 (zone).
	-- for the subtable, restrict RA +/- abs(atan(thta/sqrt(cos(dec-theta)cos(dec+theta))))
	--             also resrict outer object to not be marginal.
	--             also restrict dec
	-- 	       also restrict objID1 < objID2 so that we save 1/2 the work.
	-- 	       then do the distance calculation to get the arc distance
	---------------------------------------------------
	SET @start = CURRENT_TIMESTAMP

	BEGIN TRANSACTION
    --------------------------------------------------------------------
	IF  EXISTS (SELECT TABLE_NAME 
				FROM INFORMATION_SCHEMA.TABLES 
				WHERE TABLE_NAME = 'Neighbors')
	BEGIN
		EXEC spIndexDropSelection @taskid, @stepid, 'K,F', 'Neighbors';
		DROP TABLE Neighbors
	END
	COMMIT TRANSACTION
	
	--------------------------------------------------
	-- Builds the #zonesDef Table
	--------------------------------------------------
	CREATE TABLE #ZonesDef(
				zoneID		int NOT NULL,	
				decMin 		float  NOT NULL,	
				decMax 		float  NOT NULL		
	)
	DECLARE @maxZone int, @minZone int, @zoneDec float;
	
	SET @minZone = 0;
	SET @maxZone =  floor(180.0/@zoneHeight);

	SET @zoneDec = @minZone * @zoneHeight -90;
	   
	WHILE @minZone < = @maxZone
	BEGIN   
		INSERT #ZonesDef VALUES (
				@minZone, @zoneDec, @zoneDec + @zoneHeight
			)
		SET @minZone = @minZone + 1
		SET @zoneDec = @zoneDec + @zoneHeight
	END

	--------------------------------------------------
	-- Builds the #zoneZone table to map each zone to zones 
	-- which may have a cross match. 
	--------------------------------------------------
	CREATE TABLE #zoneZone (
		zoneID1	int,
		zoneID2	int,
		alphaMax	float,
		PRIMARY KEY(zoneID1,zoneID2)
	)

	DECLARE @zones int	
	SET @zones = ceiling(@theta/@zoneHeight)

	INSERT INTO #zoneZone 
		SELECT Z1.zoneID, Z2.zoneID,
		  CASE WHEN Z1.decMin < 0 AND (ABS(Z1.decMin) > ABS(Z1.decMin + @zoneHeight))
			    THEN dbo.fGetAlpha(@theta, Z1.decMin) 
				ELSE dbo.fGetAlpha(@theta, Z1.decMax) 
		  END 
		FROM #zonesDef Z1 JOIN #zonesDef Z2  
		  ON Z2.zoneID between Z1.zoneID - @zones AND Z1.zoneID + @zones

	----------------------------------------------------------------------------------
	-- the code is designed to allow zone sizes different from @theta
	-- zone = @r is optimal, but smaller/larger also works (smaller needs more zones)
	--  ^^ this is not always true, if the zoneheight is very small (few arcsec) 
	--     then the performance is very bad. 
	------------------------------------------------------------------------------------
	-- Loop over the zones, computing the neighbors for each one.
	--
	--                   ------
	--                  /  +n   \
	--                 ================ zone
	--                /           \
	--               |      0      |
	--                \           /
	--                ==================zone
	--                  \  -n    /
	--                   -------
	--
	-------------------------------------------------------------
	set @start  = current_timestamp			-- time each zone's construction
	IF @matchMode = 0
	    BEGIN
		-- we don't need matches of objects to itself in the neighbors
		SELECT 
		    o1.objID as objID, 			-- outer object
		    o2.objID as NeighborObjID,   	-- inner object
			2*DEGREES(ASIN(sqrt(			-- distance in arcMinutes
			    power(o1.cx-o2.cx,2)+
			    power(o1.cy-o2.cy,2)+
			    power(o1.cz-o2.cz,2)  )/2))*60 as distance,
				o1.type, o2.type neighborType,			-- type
				o1.mode, o2.mode neighborMode			-- mode
		INTO neighbors
		FROM #zoneZone zz inner loop join zone o1 on zz.zoneID1 = o1.zoneID
				 inner loop join zone o2 	-- force a nested loops join
	  	    ON zz.zoneID2 = o2.zoneID and 
				o2.ra between o1.ra - zz.alphaMax and o1.ra + zz.alphaMax
	  	WHERE o1.objID < o2.objID	    -- do 1/2 the work now
		    -- don't need self-matches, so exclude neighbors from 
		    -- different runs unless they are more than 1" apart. 
		    -- this is important for RUNSDB, Stripe82DB etc.[ART]
		    and ( (((o1.objID / power(cast(2 as bigint),32)) & 0x0000FFFF) = 
		           ((o2.objID / power(cast(2 as bigint),32)) & 0x0000FFFF))
		        or
		          ((2*DEGREES(ASIN(sqrt(power(o1.cx-o2.cx,2)+
			    	power(o1.cy-o2.cy,2)+
			    	power(o1.cz-o2.cz,2))/2))*3600) > 1.0)
		        ) 
		    and (o1.native + o2.native) > 0		-- objects not both in margin 
		    and o2.dec between o1.dec - @theta and o1.dec + @theta	-- quick filter on dec
		    and 4.0*power(sin(radians(@theta/2.0)),2) >	-- careful distance filter 
			    power(o1.cx-o2.cx,2)+power(o1.cy-o2.cy,2)+power(o1.cz- o2.cz,2)
	    END
	ELSE		-- not RUNS DB
	    BEGIN
		SELECT 
		    o1.objID as objID, 			-- outer object
		    o2.objID as NeighborObjID,   	-- inner object
			2*DEGREES(ASIN(sqrt(			-- distance in arcMinutes
			    power(o1.cx-o2.cx,2)+
			    power(o1.cy-o2.cy,2)+
			    power(o1.cz-o2.cz,2)  )/2))*60 as distance,
				o1.type, o2.type neighborType,			-- type
				o1.mode, o2.mode neighborMode			-- mode
		INTO neighbors
		FROM #zoneZone zz inner loop join zone o1 on zz.zoneID1 = o1.zoneID
				 inner loop join zone o2 	-- force a nested loops join
	  	    ON zz.zoneID2 = o2.zoneID and 
				o2.ra between o1.ra - zz.alphaMax and o1.ra + zz.alphaMax
	  	WHERE o1.objID < o2.objID			    -- do 1/2 the work now
		    and (o1.native + o2.native) > 0		-- objects not both in margin 
		    and o2.dec between o1.dec - @theta and o1.dec + @theta	-- quick filter on dec
		    and 4.0*power(sin(radians(@theta/2.0)),2) >	-- careful distance filter 
			    power(o1.cx-o2.cx,2)+power(o1.cy-o2.cy,2)+power(o1.cz- o2.cz,2)
	    END
	set @msg = 'Compute neighbors: elapsed time for 1/2 the work (o1.objID < o2.objID) is ' 
		+ cast(dbo.fDatediffSec(@start, current_timestamp) as varchar(30))  
		+ ' sec, generated ' + cast(rowcount_big() as varchar(30)) + ' rows'
	--
	exec spNewPhase @taskid, @stepid, 'Neighbors', 'OK', @msg ;
	--------------------------------------
	
	--
	BEGIN TRANSACTION
	SET @start = CURRENT_TIMESTAMP		-- time mirroring the neighbors table
	------------------------------------------------
	-- The prior statment just does objID < neighborObjID, 
	-- so now fill in the other half.
	------------------------------------------------
	INSERT Neighbors
	    SELECT NeighborObjID, objID, distance, 
		neighborType,[Type],
		neighborMode, Mode
		FROM  Neighbors 
	------------------------------------------------
	SET @count = 2 * rowcount_big();
	--
	SET @msg = 'elpased time for mirror neighbors is:  '  
		+ cast(dbo.fDatediffSec(@start, current_timestamp) as varchar(30))  
		+ ' seconds. Total rows '+ cast(@count as varchar(30)) 
	--
	EXEC spNewPhase @taskid, @stepid, 'Neighbors', 'OK', @msg ;
 	COMMIT TRANSACTION
	--
    BEGIN TRANSACTION
	----------------------------
	-- rebuild indices and foreign keys
	----------------------------
	SET @start = CURRENT_TIMESTAMP
	exec spIndexBuildSelection @taskid, @stepid, 'K,F', 'Neighbors'
	---------------------
	-- print log message
	---------------------
	SET @msg = 'elpased time for index and foreign key on Neighbors table is  ' 
		+ cast(dbo.fDatediffSec(@start, current_timestamp) as varchar(30))  
		+ ' seconds. Total rows '+ cast(@count as varchar(30)) 
	EXEC spNewPhase @taskid, @stepid, 'Neighbors', 'OK', @msg ;
	COMMIT TRANSACTION

	-----------------------------------------
	-- Record total time..
	SET @msg = 'Computed ' + cast(@count as varchar(20)) + ' neighbors in a total of ' 
			+ cast(dbo.fDatediffSec(@began, current_timestamp) as varchar(30))  
			+ ' seconds'  
	EXEC spNewPhase @taskid, @stepid, 'Neighbors', 'OK', @msg ;
	------------------------------------------------
	RETURN(0);
END	-- End spNeighbors()
GO
/****** Object:  StoredProcedure [dbo].[spNewPhase]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spNewPhase] (
	@taskid int,
	@stepid int,
	@phasename varchar(16), 
	@status varchar(16), 
	@phasemsg varchar(2048)
)
-----------------------------------------------------------------
--/H Wraps the loadsupport spNewPhase procedure for local use
--/A
--/T If @taskid=0, only prints the message
-----------------------------------------------------------------
AS 
BEGIN
	-------------------------------------------------
	SET NOCOUNT ON;
	--
	IF @taskid>0
	    EXEC loadsupport.dbo.spNewPhase @taskid, @stepid,  
		@phasename, @status, @phasemsg 
	ELSE
	    PRINT 'At '+ convert(varchar(30),Current_timestamp,14 )+' ' + @phasemsg;
	-------------------------------------------------
END

GO
/****** Object:  StoredProcedure [dbo].[spPublishApogee]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spPublishApogee](
	@taskID int, 
	@stepID int,
	@fromDB varchar(100), 
	@toDB varchar(100), 
	@firstTime int) 
---------------------------------------------------------------
--/H Publishes the APOGEE tables of one DB to another 
--/A
--/T <p> parameters:   
--/T <li> taskid int,   		-- Task identifier
--/T <li> stepid int,   		-- Step identifier
--/T <li> fromDB varchar(100),   	-- source DB (e.g. verify.photo)
--/T <li> toDB varchar(100),   		-- destination DB (e.g. dr1.best)
--/T <li> firstTime int 		-- if 1, creates target table.
--/T <li> returns  0 if OK, non zero if something wrong  
--/T <samp> spPublishApogee 1,1,'BestDR7','tempDB', 1 </samp>
---------------------------------------------------------------
AS BEGIN
	set nocount on
	declare @err int, @summary int 
	declare @message varchar(1000) 
	declare @status  varchar(16) 
	set @summary = 0 

	set @message = 'Publishing APOGEE database started for database ' + @fromDB

	exec spNewPhase @taskID, @stepID, 'spPublishApogee', 'STARTING', @message 

	exec @err = spCopyATable @taskid, @stepID, @fromDB, @toDB, 'apogeeVisit', @firstTime 
	set @summary = @summary + @err 

	exec @err = spCopyATable @taskid, @stepID, @fromDB, @toDB, 'apogeeStar', @firstTime 
	set @summary = @summary + @err

	exec @err = spCopyATable @taskid, @stepID, @fromDB, @toDB, 'aspcapStar', @firstTime 
	set @summary = @summary + @err

	exec @err = spCopyATable @taskid, @stepID, @fromDB, @toDB, 'apogeePlate', @firstTime 
	set @summary = @summary + @err 

	exec @err = spCopyATable @taskid, @stepID, @fromDB, @toDB, 'aspcapStarCovar', @firstTime 
	set @summary = @summary + @err

	exec @err = spCopyATable @taskid, @stepID, @fromDB, @toDB, 'apogeeDesign', @firstTime 
	set @summary = @summary + @err 

	exec @err = spCopyATable @taskid, @stepID, @fromDB, @toDB, 'apogeeField', @firstTime 
	set @summary = @summary + @err 

	exec @err = spCopyATable @taskid, @stepID, @fromDB, @toDB, 'apogeeObject', @firstTime 
	set @summary = @summary + @err 

	exec @err = spCopyATable @taskid, @stepID, @fromDB, @toDB, 'apogeeStarVisit', @firstTime 
	set @summary = @summary + @err 

	exec @err = spCopyATable @taskid, @stepID, @fromDB, @toDB, 'apogeeStarAllVisit', @firstTime 
	set @summary = @summary + @err 

	exec @err = spCopyATable @taskid, @stepID, @fromDB, @toDB, 'cannonStar', @firstTime 
	set @summary = @summary + @err 

	---------------------------------------------------------
	set @message = 'Publish of APOGEE database ' + @fromDB + ' to database ' + @toDB + ' found ' + str(@summary) + ' errors.' 
	if @summary = 0 set @status = 'OK' else set @status = 'FAILED' 
	--
	exec spNewPhase @taskID, @stepID, 'spPublishApogee', @status, 'Published APOGEE Tables' 
	--
	return @summary
END

GO
/****** Object:  StoredProcedure [dbo].[spPublishGalProd]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spPublishGalProd](
	@taskID int,
	@stepID int, 
	@fromDB varchar(100), 
	@toDB varchar(100), 
	@firstTime int) 
---------------------------------------------------------------
--/H Publishes the GalProd tables of one DB to another 
--/A
--/T <p> parameters:   
--/T <li> taskid int,   		-- Task identifier
--/T <li> stepid int,   		-- Step identifier
--/T <li> fromDB varchar(100),   	-- source DB (e.g. verify.plates)
--/T <li> toDB varchar(100),   		-- destination DB (e.g. dr1.best)
--/T <li> firstTime int 		-- if 1, creates target table.
--/T <li> returns  0 if OK, non zero if something wrong  
--/T <br><samp> spPublishGalProd 1,1,'SkyServerV4','tempDB', 1 </samp>
---------------------------------------------------------------
AS BEGIN 
	set nocount on
	declare @err int, @summary int 
	declare @message varchar(1000) 
	declare @status  varchar(16) 

	set @summary = 0 
	SET @message = 'publishing plates started for ' + @fromDB 
	exec spNewPhase @taskID, @stepID, 'spPublishGalProd', 'STARTING', @message;


	exec @err = spCopyATable @taskid, @stepID, @fromDB, @toDB, 'emissionLinesPort', @firstTime 
	set @summary = @summary + @err 

	exec @err = spCopyATable @taskid, @stepID, @fromDB, @toDB, 'stellarMassFSPSGranEarlyDust', @firstTime 
	set @summary = @summary + @err 

	exec @err = spCopyATable @taskid, @stepID, @fromDB, @toDB, 'stellarMassFSPSGranEarlyNoDust', @firstTime 
	set @summary = @summary + @err 

	exec @err = spCopyATable @taskid, @stepID, @fromDB, @toDB, 'stellarMassFSPSGranWideDust', @firstTime 
	set @summary = @summary + @err 

	exec @err = spCopyATable @taskid, @stepID, @fromDB, @toDB, 'stellarMassFSPSGranWideNoDust', @firstTime 
	set @summary = @summary + @err 

	exec @err = spCopyATable @taskid, @stepID, @fromDB, @toDB, 'stellarMassPCAWiscBC03', @firstTime 
	set @summary = @summary + @err 

	exec @err = spCopyATable @taskid, @stepID, @fromDB, @toDB, 'stellarMassPCAWiscM11', @firstTime 
	set @summary = @summary + @err 

	exec @err = spCopyATable @taskid, @stepID, @fromDB, @toDB, 'stellarMassStarformingPort', @firstTime 
	set @summary = @summary + @err 

	exec @err = spCopyATable @taskid, @stepID, @fromDB, @toDB, 'stellarMassPassivePort', @firstTime 
	set @summary = @summary + @err 

	--------------------------------------------------------------
	set @message = 'Publish of database ' + @fromDB + ' to database ' + @toDB + ' found ' + str(@summary) + ' errors.' 
	if @summary = 0 set @status = 'OK' else set @status = 'ABORTING' 
	--
	exec spNewPhase @taskID, @stepID, 'spPublishGalProd', @status, 'Published Spectro Tables' 
	--
	return @summary
END

GO
/****** Object:  StoredProcedure [dbo].[spPublishGalSpec]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spPublishGalSpec](
	@taskID int, 
	@stepID int,
	@fromDB varchar(100), 
	@toDB varchar(100), 
	@firstTime int) 
---------------------------------------------------------------
--/H Publishes the galspec tables of one DB to another 
--/A
--/T <p> parameters:   
--/T <li> taskid int,   		-- Task identifier
--/T <li> stepid int,   		-- Step identifier
--/T <li> fromDB varchar(100),   	-- source DB (e.g. verify.photo)
--/T <li> toDB varchar(100),   		-- destination DB (e.g. dr1.best)
--/T <li> firstTime int 		-- if 1, creates target table.
--/T <li> returns  0 if OK, non zero if something wrong  
--/T <samp> spPublishGalSpec 1,1,'BestDR7','tempDB', 1 </samp>
---------------------------------------------------------------
AS BEGIN
	set nocount on
	declare @err int, @summary int 
	declare @message varchar(1000) 
	declare @status  varchar(16) 
	set @summary = 0 

	set @message = 'Publishing GalSpec database started for database ' + @fromDB

	exec spNewPhase @taskID, @stepID, 'spPublishGalSpec', 'STARTING', @message 

	exec @err = spCopyATable @taskid, @stepID, @fromDB, @toDB, 'galSpecExtra', @firstTime 
	set @summary = @summary + @err 

	exec @err = spCopyATable @taskid, @stepID, @fromDB, @toDB, 'galSpecIndx', @firstTime 
	set @summary = @summary + @err 

	exec @err = spCopyATable @taskid, @stepID, @fromDB, @toDB, 'galSpecInfo', @firstTime 
	set @summary = @summary + @err

	exec @err = spCopyATable @taskid, @stepID, @fromDB, @toDB, 'galSpecLine', @firstTime 
	set @summary = @summary + @err

	---------------------------------------------------------
	set @message = 'Publish of GalSpec database ' + @fromDB + ' to database ' + @toDB + ' found ' + str(@summary) + ' errors.' 
	if @summary = 0 set @status = 'OK' else set @status = 'FAILED' 
	--
	exec spNewPhase @taskID, @stepID, 'spPublishGalSpec', @status, 'Published GalSpec Tables' 
	--
	return @summary
END

GO
/****** Object:  StoredProcedure [dbo].[spPublishManga]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spPublishManga](
	@taskID int, 
	@stepID int,
	@fromDB varchar(100), 
	@toDB varchar(100), 
	@firstTime int) 
---------------------------------------------------------------
--/H Publishes the MaNGA tables of one DB to another 
--/A
--/T <p> parameters:   
--/T <li> taskid int,   		-- Task identifier
--/T <li> stepid int,   		-- Step identifier
--/T <li> fromDB varchar(100),   	-- source DB (e.g. verify.photo)
--/T <li> toDB varchar(100),   		-- destination DB (e.g. dr1.best)
--/T <li> firstTime int 		-- if 1, creates target table.
--/T <li> returns  0 if OK, non zero if something wrong  
--/T <samp> spPublishManga 1,1,'SkyServerV4','tempDB', 1 </samp>
---------------------------------------------------------------
AS BEGIN
	set nocount on
	declare @err int, @summary int 
	declare @message varchar(1000) 
	declare @status  varchar(16) 
	set @summary = 0 

	set @message = 'Starting spPublishManga';
	exec spNewPhase @taskID, @stepID, 'spPublishManga', 'OK', @message;

	exec @err = spCopyATable @taskid, @stepID, @fromDB, @toDB, 'mangaDrpAll', @firstTime 
	set @summary = @summary + @err 

	exec @err = spCopyATable @taskid, @stepID, @fromDB, @toDB, 'mangaTarget', @firstTime 
	set @summary = @summary + @err 

	--------------------------------------------------
	set @message = 'Publish of database ' + @fromDB + ' to database ' + @toDB + ' found ' + str(@summary) + ' errors.' 
	if  @summary = 0 set @status = 'OK' else set @status = 'ABORTING' 
	--
	exec spNewPhase @taskID, @stepID, 'spPublishManga', @status, 'Published MaNGA Tables';
	--
	return @summary
END   -- END spPublishManga

GO
/****** Object:  StoredProcedure [dbo].[spPublishMask]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spPublishMask](
	@taskID int, 
	@stepID int,
	@fromDB varchar(100), 
	@toDB varchar(100), 
	@firstTime int) 
---------------------------------------------------------------
--/H Publishes the Mask tables of one DB to another 
--/A
--/T <p> parameters:   
--/T <li> taskid int,   		-- Task identifier
--/T <li> stepid int,   		-- Step identifier
--/T <li> fromDB varchar(100),   	-- source DB (e.g. verify.photo)
--/T <li> toDB varchar(100),   		-- destination DB (e.g. dr1.best)
--/T <li> firstTime int 		-- if 1, creates target table.
--/T <li> returns  0 if OK, non zero if something wrong  
--/T <samp> spPublishMask 1,1,'SkyServerV4','tempDB', 1 </samp>
---------------------------------------------------------------
AS BEGIN
	set nocount on
	declare @err int, @summary int 
	declare @message varchar(1000) 
	declare @status  varchar(16) 
	set @summary = 0 

	set @message = 'Starting spPublishMask';
	exec spNewPhase @taskID, @stepID, 'spPublishMask', 'OK', @message;

	exec @err = spCopyATable @taskid, @stepID, @fromDB, @toDB, 'Mask', @firstTime 
	set @summary = @summary + @err 

	--------------------------------------------------
	set @message = 'Publish of database ' + @fromDB + ' to database ' + @toDB + ' found ' + str(@summary) + ' errors.' 
	if  @summary = 0 set @status = 'OK' else set @status = 'ABORTING' 
	--
	exec spNewPhase @taskID, @stepID, 'spPublishMask', @status, 'Published Mask Tables';
	--
	return @summary
END   -- END spPublishMask

GO
/****** Object:  StoredProcedure [dbo].[spPublishNSA]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spPublishNSA](
	@taskID int, 
	@stepID int,
	@fromDB varchar(100), 
	@toDB varchar(100), 
	@firstTime int) 
---------------------------------------------------------------
--/H Publishes the nsatlas (NASA-Sloan Atlas) table of one DB to another 
--/A
--/T <p> parameters:   
--/T <li> taskid int,   		-- Task identifier
--/T <li> stepid int,   		-- Step identifier
--/T <li> fromDB varchar(100),   	-- source DB (e.g. verify.photo)
--/T <li> toDB varchar(100),   		-- destination DB (e.g. dr1.best)
--/T <li> firstTime int 		-- if 1, creates target table.
--/T <li> returns  0 if OK, non zero if something wrong  
--/T <samp> spPublishNSA 1,1,'SkyServerV4','tempDB', 1 </samp>
---------------------------------------------------------------
AS BEGIN
	set nocount on
	declare @err int, @summary int 
	declare @message varchar(1000) 
	declare @status  varchar(16) 
	set @summary = 0 

	set @message = 'Starting spPublishNSA';
	exec spNewPhase @taskID, @stepID, 'spPublishNSA', 'OK', @message;

	exec @err = spCopyATable @taskid, @stepID, @fromDB, @toDB, 'nsatlas', @firstTime 
	set @summary = @summary + @err 

	--------------------------------------------------
	set @message = 'Publish of database ' + @fromDB + ' to database ' + @toDB + ' found ' + str(@summary) + ' errors.' 
	if  @summary = 0 set @status = 'OK' else set @status = 'ABORTING' 
	--
	exec spNewPhase @taskID, @stepID, 'spPublishNSA', @status, 'Published NSA Tables';
	--
	return @summary
END   -- END spPublishNSA

GO
/****** Object:  StoredProcedure [dbo].[spPublishPhoto]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spPublishPhoto](
	@taskID int, 
	@stepID int,
	@fromDB varchar(100), 
	@toDB varchar(100), 
	@firstTime int) 
---------------------------------------------------------------
--/H Publishes the Photo tables of one DB to another 
--/A
--/T <p> parameters:   
--/T <li> taskid int,   		-- Task identifier
--/T <li> stepid int,   		-- Step identifier
--/T <li> fromDB varchar(100),   	-- source DB (e.g. verify.photo)
--/T <li> toDB varchar(100),   		-- destination DB (e.g. dr1.best)
--/T <li> firstTime int 		-- if 1, creates target table.
--/T <li> returns  0 if OK, non zero if something wrong  
--/T <samp> spPublishPhoto 1,1,'SkyServerV4','tempDB', 1 </samp>
---------------------------------------------------------------
AS BEGIN
	set nocount on
	declare @err int, @summary int 
	declare @message varchar(1000) 
	declare @status  varchar(16) 
	set @summary = 0 

	set @message = 'Starting spPublishPhoto';
	exec spNewPhase @taskID, @stepID, 'spPublishPhoto', 'OK', @message;

	exec @err = spCopyATable @taskid, @stepID, @fromDB, @toDB, 'Run', @firstTime 
	set @summary = @summary + @err 

--	exec @err = spCopyATable @taskid, @stepID, @fromDB, @toDB, 'Segment', @firstTime 
--	set @summary = @summary + @err 

	exec @err = spCopyATable @taskid, @stepID, @fromDB, @toDB, 'Field', @firstTime 
	set @summary = @summary + @err 

	exec @err = spCopyATable @taskid, @stepID, @fromDB, @toDB, 'Frame', @firstTime 
	set @summary = @summary + @err 

	exec @err = spCopyATable @taskid, @stepID, @fromDB, @toDB, 'FieldProfile', @firstTime 
	set @summary = @summary + @err 

	exec @err = spCopyATable @taskid, @stepID, @fromDB, @toDB, 'PhotoObjAll', @firstTime 
	set @summary = @summary + @err 

--	exec @err = spCopyATable @taskid, @stepID, @fromDB, @toDB, 'PsObjAll', @firstTime 
--	set @summary = @summary + @err 

	exec @err = spCopyATable @taskid, @stepID, @fromDB, @toDB, 'PhotoProfile', @firstTime 
	set @summary = @summary + @err 

	exec @err = spCopyATable @taskid, @stepID, @fromDB, @toDB, 'Neighbors', @firstTime 
	set @summary = @summary + @err 

	exec @err = spCopyATable @taskid, @stepID, @fromDB, @toDB, 'PhotoZ', @firstTime 
	set @summary = @summary + @err 

	exec @err = spCopyATable @taskid, @stepID, @fromDB, @toDB, 'FIRST', @firstTime 
	set @summary = @summary + @err 

	exec @err = spCopyATable @taskid, @stepID, @fromDB, @toDB, 'ROSAT', @firstTime 
	set @summary = @summary + @err 

	exec @err = spCopyATable @taskid, @stepID, @fromDB, @toDB, 'USNO', @firstTime 
	set @summary = @summary + @err 
	
	exec @err = spCopyATable @taskid, @stepID, @fromDB, @toDB, 'TwoMASS', @firstTime 
	set @summary = @summary + @err 
	
	exec @err = spCopyATable @taskid, @stepID, @fromDB, @toDB, 'TwoMASSXSC', @firstTime 
	set @summary = @summary + @err 
	
	exec @err = spCopyATable @taskid, @stepID, @fromDB, @toDB, 'RC3', @firstTime 
	set @summary = @summary + @err 

	exec @err = spCopyATable @taskid, @stepID, @fromDB, @toDB, 'Mask', @firstTime 
	set @summary = @summary + @err 

	exec @err = spCopyATable @taskid, @stepID, @fromDB, @toDB, 'AtlasOutline', @firstTime 
	set @summary = @summary + @err 

	exec @err = spCopyATable @taskid, @stepID, @fromDB, @toDB, 'Target', @firstTime 
	set @summary = @summary + @err 

	exec @err = spCopyATable @taskid, @stepID, @fromDB, @toDB, 'TargetInfo', @firstTime 
	set @summary = @summary + @err 

	exec @err = spCopyATable @taskid, @stepID, @fromDB, @toDB, 'TargetParam', @firstTime 
	set @summary = @summary + @err 

	--------------------------------------------------
	set @message = 'Publish of database ' + @fromDB + ' to database ' + @toDB + ' found ' + str(@summary) + ' errors.' 
	if  @summary = 0 set @status = 'OK' else set @status = 'ABORTING' 
	--
	exec spNewPhase @taskID, @stepID, 'spPublishPhoto', @status, 'Published Photo Tables';
	--
	return @summary
END

GO
/****** Object:  StoredProcedure [dbo].[spPublishPlates]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spPublishPlates](
	@taskID int,
	@stepID int, 
	@fromDB varchar(100), 
	@toDB varchar(100), 
	@firstTime int) 
---------------------------------------------------------------
--/H Publishes the Plates tables of one DB to another 
--/A
--/T <p> parameters:   
--/T <li> taskid int,   		-- Task identifier
--/T <li> stepid int,   		-- Step identifier
--/T <li> fromDB varchar(100),   	-- source DB (e.g. verify.plates)
--/T <li> toDB varchar(100),   		-- destination DB (e.g. dr1.best)
--/T <li> firstTime int 		-- if 1, creates target table.
--/T <li> returns  0 if OK, non zero if something wrong  
--/T <br><samp> spPublishPlates 1,1,'SkyServerV4','tempDB', 1 </samp>
---------------------------------------------------------------
AS BEGIN 
	set nocount on
	declare @err int, @summary int 
	declare @message varchar(1000) 
	declare @status  varchar(16) 

	set @summary = 0 
	SET @message = 'publishing plates started for ' + @fromDB 
	exec spNewPhase @taskID, @stepID, 'spPublishPlates', 'STARTING', @message;

	exec @err = spCopyATable @taskid, @stepID, @fromDB, @toDB, 'plateX', @firstTime 
	set @summary = @summary + @err 

	exec @err = spCopyATable @taskid, @stepID, @fromDB, @toDB, 'specObjAll', @firstTime 
	set @summary = @summary + @err 

	--------------------------------------------------------------
	set @message = 'Publish of database ' + @fromDB + ' to database ' + @toDB + ' found ' + str(@summary) + ' errors.' 
	if @summary = 0 set @status = 'OK' else set @status = 'ABORTING' 
	--
	exec spNewPhase @taskID, @stepID, 'spPublishPlates', @status, 'Published Spectro Tables' 
	--
	return @summary
END

GO
/****** Object:  StoredProcedure [dbo].[spPublishPm]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spPublishPm](
	@taskID int, 
	@stepID int,
	@fromDB varchar(100), 
	@toDB varchar(100), 
	@firstTime int) 
---------------------------------------------------------------
--/H Publishes the proper motion tables of one DB to another 
--/A
--/T <p> parameters:   
--/T <li> taskid int,   		-- Task identifier
--/T <li> stepid int,   		-- Step identifier
--/T <li> fromDB varchar(100),   	-- source DB (e.g. verify.photo)
--/T <li> toDB varchar(100),   		-- destination DB (e.g. dr1.best)
--/T <li> firstTime int 		-- if 1, creates target table.
--/T <li> returns  0 if OK, non zero if something wrong  
--/T <samp> spPublishPm 1,1,'BestDR7','tempDB', 1 </samp>
---------------------------------------------------------------
AS BEGIN
	set nocount on
	declare @err int, @summary int 
	declare @message varchar(1000) 
	declare @status  varchar(16) 
	set @summary = 0 

	set @message = 'Publishing pm database started for database ' + @fromDB

	exec spNewPhase @taskID, @stepID, 'spPublishPm', 'STARTING', @message 

	exec @err = spCopyATable @taskid, @stepID, @fromDB, @toDB, 'properMotions', @firstTime 
	set @summary = @summary + @err

	---------------------------------------------------------
	set @message = 'Publish of pm database ' + @fromDB + ' to database ' + @toDB + ' found ' + str(@summary) + ' errors.' 
	if @summary = 0 set @status = 'OK' else set @status = 'FAILED' 
	--
	exec spNewPhase @taskID, @stepID, 'spPublishPm', @status, 'Published pm Tables' 
	--
	return @summary
END

GO
/****** Object:  StoredProcedure [dbo].[spPublishResolve]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spPublishResolve](
	@taskID int, 
	@stepID int,
	@fromDB varchar(100), 
	@toDB varchar(100), 
	@firstTime int) 
---------------------------------------------------------------
--/H Publishes the resolve tables of one DB to another 
--/A
--/T <p> parameters:   
--/T <li> taskid int,   		-- Task identifier
--/T <li> stepid int,   		-- Step identifier
--/T <li> fromDB varchar(100),   	-- source DB (e.g. verify.photo)
--/T <li> toDB varchar(100),   		-- destination DB (e.g. dr1.best)
--/T <li> firstTime int 		-- if 1, creates target table.
--/T <li> returns  0 if OK, non zero if something wrong  
--/T <samp> spPublishResolve 1,1,'BestDR7','tempDB', 1 </samp>
---------------------------------------------------------------
AS BEGIN
	set nocount on
	declare @err int, @summary int 
	declare @message varchar(1000) 
	declare @status  varchar(16) 
	set @summary = 0 

	set @message = 'Publishing resolve database started for database ' + @fromDB

	exec spNewPhase @taskID, @stepID, 'spPublishResolve', 'STARTING', @message 

	exec @err = spCopyATable @taskid, @stepID, @fromDB, @toDB, 'thingIndex', @firstTime 
	set @summary = @summary + @err 

	exec @err = spCopyATable @taskid, @stepID, @fromDB, @toDB, 'detectionIndex', @firstTime 
	set @summary = @summary + @err

	---------------------------------------------------------
	set @message = 'Publish of resolve database ' + @fromDB + ' to database ' + @toDB + ' found ' + str(@summary) + ' errors.' 
	if @summary = 0 set @status = 'OK' else set @status = 'FAILED' 
	--
	exec spNewPhase @taskID, @stepID, 'spPublishResolve', @status, 'Published resolve Tables' 
	--
	return @summary
END

GO
/****** Object:  StoredProcedure [dbo].[spPublishSspp]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spPublishSspp](
	@taskID int, 
	@stepID int,
	@fromDB varchar(100), 
	@toDB varchar(100), 
	@firstTime int) 
---------------------------------------------------------------
--/H Publishes the sspp Function tables of one DB to another 
--/A
--/T <p> parameters:   
--/T <li> taskid int,   		-- Task identifier
--/T <li> stepid int,   		-- Step identifier
--/T <li> fromDB varchar(100),   	-- source DB (e.g. verify.photo)
--/T <li> toDB varchar(100),   		-- destination DB (e.g. dr1.best)
--/T <li> firstTime int 		-- if 1, creates target table.
--/T <li> returns  0 if OK, non zero if something wrong  
--/T <samp> spPublishSspp 1,1,'BestDR7','tempDB', 1 </samp>
---------------------------------------------------------------
AS BEGIN
	set nocount on
	declare @err int, @summary int 
	declare @message varchar(1000) 
	declare @status  varchar(16) 
	set @summary = 0 

	set @message = 'Publishing sspp database started for database ' + @fromDB

	exec spNewPhase @taskID, @stepID, 'spPublishSspp', 'STARTING', @message 

	exec @err = spCopyATable @taskid, @stepID, @fromDB, @toDB, 'Plate2Target', @firstTime 
	set @summary = @summary + @err 

	exec @err = spCopyATable @taskid, @stepID, @fromDB, @toDB, 'sppLines', @firstTime 
	set @summary = @summary + @err 

	exec @err = spCopyATable @taskid, @stepID, @fromDB, @toDB, 'sppParams', @firstTime 
	set @summary = @summary + @err 

	exec @err = spCopyATable @taskid, @stepID, @fromDB, @toDB, 'sppTargets', @firstTime 
	set @summary = @summary + @err

	exec @err = spCopyATable @taskid, @stepID, @fromDB, @toDB, 'segueTargetAll', @firstTime 
	set @summary = @summary + @err

	---------------------------------------------------------
	set @message = 'Publish of sspp database ' + @fromDB + ' to database ' + @toDB + ' found ' + str(@summary) + ' errors.' 
	if @summary = 0 set @status = 'OK' else set @status = 'FAILED' 
	--
	exec spNewPhase @taskID, @stepID, 'spPublishSspp', @status, 'Published sspp Tables' 
	--
	return @summary
END

GO
/****** Object:  StoredProcedure [dbo].[spPublishStep]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spPublishStep] (@taskid int) 
---------------------------------------------------------------------- 
--/H Publish step, publishes validated Photo or Spectro data  
--/A
--/T <li> taskid int,                   -- Task identifier 
--/T The data has been imported to a DB, verified and backed up  
--/T This task attaches the database, and then pulls its data into the local database.
--/T Most of the step parameters are extracted from the task table (see code) 
--/T Data is copied to the "local" database tables 
--/T It is a task.type dataload (type in (target|best|runs|plates|tiling)) 
--/T The publish step writes many messages in the Phase table. 
--/T It returns either: 
--/T    0 on success (no serious problems found) 
--/T    1 on failure (serious problems found). 
--/T <br><samp> spPublish @taskId </samp>
---------------------------------------------------------------------- 
AS 
BEGIN
    SET NOCOUNT ON;
    --
    DECLARE 
        @hostname varchar(32),  -- name of this node 
        @DBname varchar(32),    -- name of the validation database.
	@publishtaskID int,
        @publishHost varchar(100), 
        @publishDB varchar(100),
	@datafilename varchar(128),
	@logfilename varchar(128),
	@id varchar(64),
        @type varchar(16)      -- (target|best|runs|plates|tiling)  
    --------------------------------------------------------------------------------------------- 
    -- Get the task parameters.  
    SELECT  
	@hostname=hostname,
	@DBname=dbname,
	@publishtaskID=publishtaskid, 
	@publishHost = rtrim(publishHost), 
	@publishDB = rtrim(publishDB),
	@datafilename = rtrim(datafilename),
	@logfilename = rtrim(logfilename),
	@id = [id],
        @type=type
        FROM loadsupport.dbo.Task WITH (NOLOCK) 
        WHERE taskid = @taskID
    ---------------------------------------------------------
    -- local variables 
    DECLARE 
	@stepid int,		-- 
	@publishstepID int, 
        @stepMsg varchar(2048), -- holds messages to Step table 
        @phaseMsg varchar(2048), -- holds messages to Phase table 
	@fromDB varchar(100),
	@toDB varchar(100),
	@firstTime int,			-- flag says this is the first time so create tables.
	@publishStart datetime,
        @err int                -- return from the helper procs (0 is good, 1 is fatal) 

    SET @firstTime = 0 			-- assume this is not the first time.
    SET @fromDB = @hostname+'.'+ @DBname;
    SET @toDB =   @publishHost  + '.' +  @publishDB 

    --------------------------------------------------------------------------------------------- 
    -- register the step. 
    SET @stepMsg = 'Publishing '+@type+' '+@fromDB+' to '+@toDB
    EXEC spStartStep @taskID, @stepID OUTPUT, 'PUBLISH','WORKING', @stepMsg, @stepMsg;

    -- if step create fails, complain and return. 
    IF @stepid IS NULL 
        BEGIN 
            SET @phaseMsg = 'Could not create publish step for task '  
		+ str(@taskID) + ' database ' + @fromDB 
            EXEC spNewPhase 0, 0, 'Framework Error', 'ERROR', @phaseMsg;
            RETURN(1); 
        END

    -- register the step also on the publisher Task
    EXEC spStartStep @publishtaskID, @publishstepID OUTPUT, 'PUBLISH','WORKING', @stepMsg, @stepMsg;

    -- if step create fails, complain and return. 
    IF @publishstepid IS NULL 
        BEGIN 
            SET @phaseMsg = 'Could not create publish step for task '  
		+ str(@taskID) + ' database ' + @toDB 
            EXEC spNewPhase 0, 0, 'Framework Error', 'ERROR', @phaseMsg;
            RETURN(1); 
        END

    --------------------------------------------------------------------------------------------- 
    -- first figure out whether it is a network attach

    -- rebuild the filename
   -- SET @datafilename = '\\'+@hostname+'\'+REPLACE(@datafilename,':','$');
   -- SET @logfilename = '\\'+@hostname+'\'+REPLACE(@logfilename,':','$');

    -- set the trace flag for attaching networked volumes

    DBCC TRACEON(1807);


    -- Attach the source data base
    EXEC @err = sp_attach_db @DBname, @filename1=@datafilename, @filename2=@logfilename;
    IF @err = 1
   	BEGIN
	    SET @stepMsg =  'Failed to attach DB' + @fromDB 
            SET @phaseMsg = 'Failed to attach DB ' + @fromDB 
	    EXEC spNewPhase @taskID, @stepID, 'Attach', 'ABORTING', @phaseMsg;
	    EXEC spNewPhase @publishtaskID, @publishstepID, 'Attach', 'ABORTING', @phaseMsg;
            GOTO commonExit 
        END
    SET @phaseMsg = 'Successfully attached ' + @fromDB  + ' in file: ' + @datafilename
    EXEC spNewPhase @taskID, @stepID, 'Attach', 'OK', @phaseMsg;
    EXEC spNewPhase @publishtaskID, @publishstepID, 'Attach', 'OK', @phaseMsg;

    --------------------------------------------------------------------------------------------
    --
    SET @publishStart = CURRENT_TIMESTAMP

    --------------------------------------------------------------------------------------------- 
    -- Handle spectro databases 
    IF @type = 'plates' 
        begin 
        exec @err = spPublishPlates @taskID, @stepID, @DBname, @publishDB, @firstTime 
        if @err = 0 
                begin 
                set @stepMsg  = 'Published plate ' + @fromDB 
                set @phaseMsg = 'Published plate ' + @fromDB 
                end 
        else 
                begin 
                set @stepMsg  = 'Failed to publish plate ' + @fromDB 
                set @phaseMsg = 'Failed to publish plate ' + @fromDB 
                end 
        goto commonExit 
        end 
    --------------------------------------------------------------------------------------------- 
    -- Handle galspec databases 
    IF @type = 'galspec' 
        begin 
        exec @err = spPublishGalSpec @taskID, @stepID, @DBname, @publishDB, @firstTime 
        if @err = 0 
                begin 
                set @stepMsg  = 'Published galspec ' + @fromDB 
                set @phaseMsg = 'Published galspec ' + @fromDB 
                end 
        else 
                begin 
                set @stepMsg  = 'Failed to publish galspec ' + @fromDB 
                set @phaseMsg = 'Failed to publish galspec ' + @fromDB 
                end 
        goto commonExit 
        end 
    --------------------------------------------------------------------------------------------- 
    -- Handle galprod databases 
    IF @type = 'galprod' 
        begin 
        exec @err = spPublishGalProd @taskID, @stepID, @DBname, @publishDB, @firstTime 
        if @err = 0 
                begin 
                set @stepMsg  = 'Published galprod ' + @fromDB 
                set @phaseMsg = 'Published galprod ' + @fromDB 
                end 
        else 
                begin 
                set @stepMsg  = 'Failed to publish galprod ' + @fromDB 
                set @phaseMsg = 'Failed to publish galprod ' + @fromDB 
                end 
        goto commonExit 
        end 
    --------------------------------------------------------------------------------------------- 
    -- Handle photo databases 
    IF @type in ( 'best', 'target', 'runs') 
        begin 
        exec @err = spPublishPhoto @taskID, @stepID, @DBname, @publishDB, @firstTime 
        if @err = 0 
                begin 
                set @stepMsg  = 'Published Photo ' + @type + ' from: ' + @fromDB + ' to: ' + @toDB 
                set @phaseMsg = 'Published Photo ' + @type + ' from: ' + @fromDB + ' to: ' + @toDB 
                end 
        else 
                begin 
                set @stepMsg  = 'Failed to publish photo ' + @type + ' from: ' + @fromDB + ' to: ' + @toDB 
                set @phaseMsg = 'Failed to publish photo ' + @type + ' from: ' + @fromDB + ' to: ' + @toDB 
                end 
        goto commonExit 
        end 

    --------------------------------------------------------------------------------------------- 
    -- Handle tiling databases 
    IF @type in ('tiles') 
        begin 
        exec @err = spPublishTiling @taskID, @stepID, @DBname, @publishDB, @firstTime 
        if @err = 0 
                begin 
                set @stepMsg =  'Published tiles ' + @type + ' from: ' + @fromDB + ' to: ' + @toDB 
                set @phaseMsg = 'Published tiles ' + @type + ' from: ' + @fromDB + ' to: ' + @toDB 
                end 
        else 
                begin 
                set @stepMsg =  'Failed to publish tiles ' + @type + ' from: ' + @fromDB + ' to: ' + @toDB 
                set @phaseMsg = 'Failed to publish tiles ' + @type + ' from: ' + @fromDB + ' to: ' + @toDB 
                end 
        goto commonExit 
        end 

    --------------------------------------------------------------------------------------------- 
    -- Handle window databases 
    IF @type in ('window') 
        begin 
        exec @err = spPublishWindow @taskID, @stepID, @DBname, @publishDB, @firstTime 
        if @err = 0 
                begin 
                set @stepMsg =  'Published window ' + @type + ' from: ' + @fromDB + ' to: ' + @toDB 
                set @phaseMsg = 'Published window ' + @type + ' from: ' + @fromDB + ' to: ' + @toDB 
                end 
        else 
                begin 
                set @stepMsg =  'Failed to publish window ' + @type + ' from: ' + @fromDB + ' to: ' + @toDB 
                set @phaseMsg = 'Failed to publish window ' + @type + ' from: ' + @fromDB + ' to: ' + @toDB 
                end 
        goto commonExit 
        end 

    --------------------------------------------------------------------------------------------- 
    -- Handle sspp databases 
    IF @type in ('sspp') 
        begin 
        exec @err = spPublishSspp @taskID, @stepID, @DBname, @publishDB, @firstTime 
        if @err = 0 
                begin 
                set @stepMsg =  'Published sspp ' + @type + ' from: ' + @fromDB + ' to: ' + @toDB 
                set @phaseMsg = 'Published sspp ' + @type + ' from: ' + @fromDB + ' to: ' + @toDB 
                end 
        else 
                begin 
                set @stepMsg =  'Failed to publish sspp ' + @type + ' from: ' + @fromDB + ' to: ' + @toDB 
                set @phaseMsg = 'Failed to publish sspp ' + @type + ' from: ' + @fromDB + ' to: ' + @toDB 
                end 
        goto commonExit 
        end 


    --------------------------------------------------------------------------------------------- 
    -- Handle properMotions databases 
    IF @type in ('pm') 
        begin 
        exec @err = spPublishPm @taskID, @stepID, @DBname, @publishDB, @firstTime 
        if @err = 0 
                begin 
                set @stepMsg =  'Published pm ' + @type + ' from: ' + @fromDB + ' to: ' + @toDB 
                set @phaseMsg = 'Published pm ' + @type + ' from: ' + @fromDB + ' to: ' + @toDB 
                end 
        else 
                begin 
                set @stepMsg =  'Failed to publish pm ' + @type + ' from: ' + @fromDB + ' to: ' + @toDB 
                set @phaseMsg = 'Failed to publish pm ' + @type + ' from: ' + @fromDB + ' to: ' + @toDB 
                end 
        goto commonExit 
        end 


    --------------------------------------------------------------------------------------------- 
    -- Handle mask databases 
    IF @type in ('mask') 
        begin 
        exec @err = spPublishMask @taskID, @stepID, @DBname, @publishDB, @firstTime 
        if @err = 0 
                begin 
                set @stepMsg =  'Published mask ' + @type + ' from: ' + @fromDB + ' to: ' + @toDB 
                set @phaseMsg = 'Published mask ' + @type + ' from: ' + @fromDB + ' to: ' + @toDB 
                end 
        else 
                begin 
                set @stepMsg =  'Failed to publish mask ' + @type + ' from: ' + @fromDB + ' to: ' + @toDB 
                set @phaseMsg = 'Failed to publish mask ' + @type + ' from: ' + @fromDB + ' to: ' + @toDB 
                end 
        goto commonExit 
        end 


    --------------------------------------------------------------------------------------------- 
    -- Handle mask databases 
    IF @type in ('manga') 
        begin 
        exec @err = spPublishManga @taskID, @stepID, @DBname, @publishDB, @firstTime 
        if @err = 0 
                begin 
                set @stepMsg =  'Published MaNGA ' + @type + ' from: ' + @fromDB + ' to: ' + @toDB 
                set @phaseMsg = 'Published MaNGA ' + @type + ' from: ' + @fromDB + ' to: ' + @toDB 
                end 
        else 
                begin 
                set @stepMsg =  'Failed to publish MaNGA ' + @type + ' from: ' + @fromDB + ' to: ' + @toDB 
                set @phaseMsg = 'Failed to publish MaNGA ' + @type + ' from: ' + @fromDB + ' to: ' + @toDB 
                end 
        goto commonExit 
        end 


    --------------------------------------------------------------------------------------------- 
    -- Handle mask databases 
    IF @type in ('nsa') 
        begin 
        exec @err = spPublishNSA @taskID, @stepID, @DBname, @publishDB, @firstTime 
        if @err = 0 
                begin 
                set @stepMsg =  'Published NSA ' + @type + ' from: ' + @fromDB + ' to: ' + @toDB 
                set @phaseMsg = 'Published NSA ' + @type + ' from: ' + @fromDB + ' to: ' + @toDB 
                end 
        else 
                begin 
                set @stepMsg =  'Failed to publish NSA ' + @type + ' from: ' + @fromDB + ' to: ' + @toDB 
                set @phaseMsg = 'Failed to publish NSA ' + @type + ' from: ' + @fromDB + ' to: ' + @toDB 
                end 
        goto commonExit 
        end 


    --------------------------------------------------------------------------------------------- 
    -- Handle resolve databases 
    IF @type in ('resolve') 
        begin 
        exec @err = spPublishResolve @taskID, @stepID, @DBname, @publishDB, @firstTime 
        if @err = 0 
                begin 
                set @stepMsg =  'Published resolve ' + @type + ' from: ' + @fromDB + ' to: ' + @toDB 
                set @phaseMsg = 'Published resolve ' + @type + ' from: ' + @fromDB + ' to: ' + @toDB 
                end 
        else 
                begin 
                set @stepMsg =  'Failed to publish resolve ' + @type + ' from: ' + @fromDB + ' to: ' + @toDB 
                set @phaseMsg = 'Failed to publish resolve ' + @type + ' from: ' + @fromDB + ' to: ' + @toDB 
                end 
        goto commonExit 
        end 


    --------------------------------------------------------------------------------------------- 
    -- Handle APOGEE databases 
    IF @type in ('apogee') 
        begin 
        exec @err = spPublishApogee @taskID, @stepID, @DBname, @publishDB, @firstTime 
        if @err = 0 
                begin 
                set @stepMsg =  'Published APOGEE ' + @type + ' from: ' + @fromDB + ' to: ' + @toDB 
                set @phaseMsg = 'Published APOGEE ' + @type + ' from: ' + @fromDB + ' to: ' + @toDB 
                end 
        else 
                begin 
                set @stepMsg =  'Failed to publish APOGEE ' + @type + ' from: ' + @fromDB + ' to: ' + @toDB 
                set @phaseMsg = 'Failed to publish APOGEE ' + @type + ' from: ' + @fromDB + ' to: ' + @toDB 
                end 
        goto commonExit 
        end 


    --------------------------------------------------------------------------------------------- 
    -- Handle WISE databases 
    IF @type in ('wise','forced') 
        begin 
        exec @err = spPublishWise @taskID, @stepID, @DBname, @publishDB, @firstTime 
        if @err = 0 
                begin 
                set @stepMsg =  'Published WISE ' + @type + ' from: ' + @fromDB + ' to: ' + @toDB 
                set @phaseMsg = 'Published WISE ' + @type + ' from: ' + @fromDB + ' to: ' + @toDB 
                end 
        else 
                begin 
                set @stepMsg =  'Failed to publish WISE ' + @type + ' from: ' + @fromDB + ' to: ' + @toDB 
                set @phaseMsg = 'Failed to publish WISE ' + @type + ' from: ' + @fromDB + ' to: ' + @toDB 
                end 
        goto commonExit 
        end 


    --------------------------------------------------------------------------------------------- 
    -- if got here then we do not recognize the type (not plates, best, runs, target, tiling 
    -- give error message 
    SET @err = 1 
    SET @stepMsg =  'Failed to publish ' + @type + ' db id: ' + @id + ' name: ' + @fromDB + ' because type: ' + @type + ' is unknown' 
    SET @phaseMsg = 'Failed to publish ' + @type + ' db id: ' + @id + ' name: ' + @fromDB + ' because type: ' + @type + ' is unknown' 

    -- detach the database, we are done with it.
    --     EXEC  sp_detach_db @DBname    
    --------------------------------------------------------------------------------------------- 
    -- Common exit to end the step (based on err setting)
    commonExit: 
    -- create final logs (writes to phase table, and step table) 
    IF @err = 0 
        BEGIN 
	    -- record load in load history
	    INSERT loadHistory (loadVersion, tstart, tend, dbname) 
		VALUES(@taskID, @publishStart, CURRENT_TIMESTAMP, @dbName)
	    --
            EXEC spEndStep @taskID, @stepID, 'DONE', @stepMsg, @phaseMsg;
            EXEC spEndStep @publishtaskID, @publishstepID, 'DONE', @stepMsg, @phaseMsg;
        END 
    ELSE 
        BEGIN 
	    EXEC spEndStep @taskID, @stepID, 'ABORTING', @stepMsg, @phaseMsg;
	    EXEC spEndStep @publishtaskID, @publishstepID, 'ABORTING', @stepMsg, @phaseMsg;

        END 

    RETURN @err 
END 

GO
/****** Object:  StoredProcedure [dbo].[spPublishTiling]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spPublishTiling](
	@taskID int, 
	@stepID int,
	@fromDB varchar(100), 
	@toDB varchar(100), 
	@firstTime int) 
---------------------------------------------------------------
--/H Publishes the Tiling tables of one DB to another 
--/A
--/T <p> parameters:   
--/T <li> taskid int,   		-- Task identifier
--/T <li> stepid int,   		-- Step identifier
--/T <li> fromDB varchar(100),   	-- source DB (e.g. verify.photo)
--/T <li> toDB varchar(100),   		-- destination DB (e.g. dr1.best)
--/T <li> firstTime int 		-- if 1, creates target table.
--/T <li> returns  0 if OK, non zero if something wrong  
--/T <samp> spPublishTiling 1,1,'SkyServerV4','tempDB', 1 </samp>
---------------------------------------------------------------
AS BEGIN
	set nocount on
	declare @err int, @summary int 
	declare @message varchar(1000) 
	declare @status  varchar(16) 
	set @summary = 0 

	set @message = 'Publishing Tiling Database started for database ' + @fromDB

	exec spNewPhase @taskID, @stepID, 'spPublishTiling', 'STARTING', @message 

-- NOTE: TilingRun has to be published first because of foreign key constraint.
	exec @err = spCopyATable @taskid, @stepID, @fromDB, @toDB, 'sdssTilingRun', @firstTime 
	set @summary = @summary + @err 

	exec @err = spCopyATable @taskid, @stepID, @fromDB, @toDB, 'sdssTileAll', @firstTime 
	set @summary = @summary + @err 

	exec @err = spCopyATable @taskid, @stepID, @fromDB, @toDB, 'sdssTilingGeometry', @firstTime 
	set @summary = @summary + @err

	exec @err = spCopyATable @taskid, @stepID, @fromDB, @toDB, 'sdssTiledTargetAll', @firstTime 
	set @summary = @summary + @err  

	exec @err = spCopyATable @taskid, @stepID, @fromDB, @toDB, 'sdssTilingInfo', @firstTime 
	set @summary = @summary + @err 

	exec @err = spCopyATable @taskid, @stepID, @fromDB, @toDB, 'sdssTargetParam', @firstTime 
	set @summary = @summary + @err 

	---------------------------------------------------------
	set @message = 'Publish of tile database ' + @fromDB + ' to database ' + @toDB + ' found ' + str(@summary) + ' errors.' 
	if @summary = 0 set @status = 'OK' else set @status = 'FAILED' 
	--
	exec spNewPhase @taskID, @stepID, 'spPublishTiling', @status, 'Published Tile Tables' 
	--
	return @summary
END

GO
/****** Object:  StoredProcedure [dbo].[spPublishWindow]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spPublishWindow](
	@taskID int, 
	@stepID int,
	@fromDB varchar(100), 
	@toDB varchar(100), 
	@firstTime int) 
---------------------------------------------------------------
--/H Publishes the Window Function tables of one DB to another 
--/A
--/T <p> parameters:   
--/T <li> taskid int,   		-- Task identifier
--/T <li> stepid int,   		-- Step identifier
--/T <li> fromDB varchar(100),   	-- source DB (e.g. verify.photo)
--/T <li> toDB varchar(100),   		-- destination DB (e.g. dr1.best)
--/T <li> firstTime int 		-- if 1, creates target table.
--/T <li> returns  0 if OK, non zero if something wrong  
--/T <samp> spPublishWindow 1,1,'BestDR7','tempDB', 1 </samp>
---------------------------------------------------------------
AS BEGIN
	set nocount on
	declare @err int, @summary int 
	declare @message varchar(1000) 
	declare @status  varchar(16) 
	set @summary = 0 

	set @message = 'Publishing Window Function Database started for database ' + @fromDB

	exec spNewPhase @taskID, @stepID, 'spPublishWindow', 'STARTING', @message 

	exec @err = spCopyATable @taskid, @stepID, @fromDB, @toDB, 'sdssImagingHalfSpaces', @firstTime 
	set @summary = @summary + @err 

	exec @err = spCopyATable @taskid, @stepID, @fromDB, @toDB, 'sdssPolygons', @firstTime 
	set @summary = @summary + @err 

	exec @err = spCopyATable @taskid, @stepID, @fromDB, @toDB, 'sdssPolygon2Field', @firstTime 
	set @summary = @summary + @err

	---------------------------------------------------------
	set @message = 'Publish of Window Function database ' + @fromDB + ' to database ' + @toDB + ' found ' + str(@summary) + ' errors.' 
	if @summary = 0 set @status = 'OK' else set @status = 'FAILED' 
	--
	exec spNewPhase @taskID, @stepID, 'spPublishWindow', @status, 'Published Window Function Tables' 
	--
	return @summary
END

GO
/****** Object:  StoredProcedure [dbo].[spPublishWise]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spPublishWise](
	@taskID int, 
	@stepID int,
	@fromDB varchar(100), 
	@toDB varchar(100), 
	@firstTime int) 
---------------------------------------------------------------
--/H Publishes the WISE tables of one DB to another 
--/A
--/T <p> parameters:   
--/T <li> taskid int,   		-- Task identifier
--/T <li> stepid int,   		-- Step identifier
--/T <li> fromDB varchar(100),   	-- source DB (e.g. verify.photo)
--/T <li> toDB varchar(100),   		-- destination DB (e.g. dr1.best)
--/T <li> firstTime int 		-- if 1, creates target table.
--/T <li> returns  0 if OK, non zero if something wrong  
--/T <samp> spPublishWise 1,1,'BestDR8','tempDB', 1 </samp>
---------------------------------------------------------------
AS BEGIN
	set nocount on
	declare @err int, @summary int 
	declare @message varchar(1000) 
	declare @status  varchar(16) 
	set @summary = 0 

	set @message = 'Publishing WISE database started for database ' + @fromDB

	exec spNewPhase @taskID, @stepID, 'spPublishWise', 'STARTING', @message 

	exec @err = spCopyATable @taskid, @stepID, @fromDB, @toDB, 'WISE_xmatch', @firstTime 
	set @summary = @summary + @err 

	exec @err = spCopyATable @taskid, @stepID, @fromDB, @toDB, 'WISE_allsky', @firstTime 
	set @summary = @summary + @err

	exec @err = spCopyATable @taskid, @stepID, @fromDB, @toDB, 'wiseForced', @firstTime 
	set @summary = @summary + @err

	---------------------------------------------------------
	set @message = 'Publish of WISE database ' + @fromDB + ' to database ' + @toDB + ' found ' + str(@summary) + ' errors.' 
	if @summary = 0 set @status = 'OK' else set @status = 'FAILED' 
	--
	exec spNewPhase @taskID, @stepID, 'spPublishWise', @status, 'Published APOGEE Tables' 
	--
	return @summary
END

GO
/****** Object:  StoredProcedure [dbo].[spRegionAnd]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE PROCEDURE [dbo].[spRegionAnd] (@id bigint,@d1 bigint, @d2 bigint, 
		@type varchar(16), @comment varchar(8000) )
-------------------------------------------------------------
--/H Create a new region containing intersection (AND) of regions d1 and d2.
-------------------------------------------------------------
--/T The new region will contain copies of the intersections of each pair of 
--/T convexes in the two original regions.
--/T <br>Parameters:
--/T <li> id bigint        key of object in its source table (e.g. TileID)
--/T <li> d1 bigint        ID of the first region.
--/T <li> d2 bigint        ID of the second region.
--/T <li> type varchar(16)     	short description of the region (e.g. stripe)
--/T <li> comment varchar(8000) longer description of the region  
--/T <br> returns regionID int  the unique ID of the new region.
--/T <br>Sample call get intersection of two  regions 
--/T <br><samp>
--/T  <br> exec @regionID = spRegionAnd @d1, @d2, 'stripe', 'run 1 2 3' 
--/T  </samp>
--/T <br> see also spRegionNew, spRegionOr, spRegionNot, spRegionDelete,...  
------------------------------------------------------------- 
AS BEGIN
	SET NOCOUNT ON;
	DECLARE @regionid bigint;
	-----------------------------------
	INSERT Region(id,type,comment,isMask,area,regionString,regionBinary)
	SELECT @id, @type, @comment, 0,
		sph.fGetArea(bin),
		sph.fGetRegionString(bin), bin
	FROM (
		select sph.fIntersectAdvanced(
			r1.regionBinary,r2.regionBinary,0) bin
		from Region r1, Region r2
		where r1.regionid=@d1
		  and r2.regionid=@d2
		) q
	WHERE bin is not null;
	SET @regionid=@@identity;
	-------------------------------
	IF (@regionid is null) RETURN 0;
	--------------------------------
	RETURN @regionid;
END
GO
/****** Object:  StoredProcedure [dbo].[spRegionCopy]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE PROCEDURE [dbo].[spRegionCopy] (
				@id bigint,
				@regionID  bigint, 
				@type varchar(16), 
				@comment varchar(8000)
)
-------------------------------------------------------------
--/H Create a new region containing the convexes of region  @regionID   
--/A --------------------------------------------------------
--/T The new region contains a copy of the convexes of the original regions 
--/T <br>Parameters:
--/T <li> id  bigint        	key of object in its source table (e.g. TileID)
--/T <li> regionID bigint     	regionID of the  region.
--/T <li> type varchar(16)      short description of the region (e.g. stripe)
--/T <li> comment varchar(8000) longer description of the region  
--/T <br> returns regionID int  the unique ID of the new region.
--/T <br>Sample copy of a region regions 
--/T <br><samp>
--/T  <br> exec @newregionID = spRegionCopy @newID, @oldregionID,  'stripe', 'run 1 2 3'  
--/T  </samp>
--/T <br> see also spRegionNew, spRegionAnd, spRegionNot, spRegionDelete,...  
------------------------------------------------------------- 
AS 
BEGIN 
	SET NOCOUNT ON;
	DECLARE @newid bigint;
	--
	INSERT Region
	SELECT @id, @type, @comment, isMask, area, regionString, regionBinary
	FROM Region
	WHERE regionid = @regionid;
	SET @newid=@@identity;
	-------------------------------
	IF (@newid is null) RETURN 0;
	---------------------
	RETURN  @newid;
END
GO
/****** Object:  StoredProcedure [dbo].[spRegionDelete]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE PROCEDURE [dbo].[spRegionDelete]( @regionID bigint)
-------------------------------------------------------------
--/H Delete a region and all its convexes and constraints
--/A --------------------------------------------------------
--/T Parameters:
--/T <li> regionID bigint     	ID of the region to be deleted
--/T <br>Sample call to delete a region 
--/T <br><samp>
--/T  <br> exec spRegionDelete @regionID 
--/T  </samp>
--/T <br> see also spRegionNew, spRegionDelete,...  
------------------------------------------------------------- 
AS 
BEGIN
	SET NOCOUNT ON;
	--
	DELETE RegionPatch WHERE regionID = @regionID
	DELETE Sector2Tile WHERE regionid=@regionID
	DELETE Region2Box WHERE boxid=@regionID
	DELETE Region WHERE regionID = @regionID
	RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[spRegionIntersect]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE PROCEDURE [dbo].[spRegionIntersect](@baseID bigint,@interID bigint)
-------------------------------------------------------------
--/H Intersect a base region with a second region  
--/A -----------------------------------------------------------
--/T The surviving region contains the intersections of each pair of 
--/T convexes in the two regions. The base region is overwritten.
--/T <br>Parameters
--/T <li> @baseID bigint:   regionID of the region to be masked
--/T <li> @interID bigint:  regionID of the masking region.
--/T <br> returns count of convexes in the resulting @baseID
--/T <br>Sample call get intersection of two  regions 
--/T <br><samp>
--/T  <br> exec @convexes = spRegionIntersect @Tile, @Mask 
--/T  </samp>
--/T <br> see also spRegionNew, spRegionOr, spRegionNot, spRegionDelete,...  
------------------------------------------------------------- 
AS BEGIN
	SET NOCOUNT ON;
	-----------------------------------
	UPDATE Region
		SET area = sph.fGetArea(q.bin),
			regionString=sph.fGetRegionString(q.bin),
			regionBinary=bin
	FROM Region r, (
			select a.regionid, 
				sph.fIntersect(a.regionBinary,i.regionBinary) bin
			from Region a, Region i
			where a.regionid=@baseid
			  and i.regionid=@interID
		) q
	WHERE r.regionid=@baseID
	  and q.regionid=@baseid
	  and q.bin is not null;
	-------------------------------
	-- test, if empty
	-------------------------------
	IF (@@rowcount=0)
	BEGIN
		EXEC spRegionDelete @baseID;
		RETURN 0;
	END
	-------------------------------------
	-- synchronize
	-------------------------------------
	DECLARE @count int;
	SELECT	@count=count(distinct p.convexid)
	  FROM Region r CROSS APPLY sph.fGetPatches(regionBinary) p
	  WHERE r.regionid=@baseID;
END
GO
/****** Object:  StoredProcedure [dbo].[spRegionNew]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE PROCEDURE [dbo].[spRegionNew] (@id bigint, @type varchar(16),
		@comment varchar(8000),@isMask	int)
-------------------------------------------------------------
--/H Create a new region, return value is regionID 
--/A --------------------------------------------------------
--/T <br>Parameters:
--/T <li> id      bigint        key of object in its source table (e.g. TileID)
--/T <li> type    varchar(16)   short description of the region (e.g. stripe)
--/T <li> comment varchar(8000) longer description of the region 
--/T <li> isMask  int           flag says region is negative (a mask)
--/T <br> returns regionID int  the unique ID of the region.
--/T <br>Sample call get a new region 
--/T <br><samp>
--/T  <br> exec @regionID = spRegionNew 12345, 'STRIPE', 'Stripe 12345', 0 
--/T  </samp>
--/T <br> see also fRegionPredicate, spRegionDelete,...  
------------------------------------------------------------- 
AS
BEGIN
	SET NOCOUNT ON;
	--
	INSERT Region VALUES(@id, @type, @comment, @isMask, 0, '', NULL)
	RETURN @@identity
END
GO
/****** Object:  StoredProcedure [dbo].[spRegionSubtract]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE PROCEDURE [dbo].[spRegionSubtract](@baseID  bigint,@subID bigint)
-------------------------------------------------------------
--/H  Subtract the areas of one region from a second region, and update first
--/A --------------------------------------------------------
--/T <p> parameters:   
--/T <li> @baseID bigint: region to subtract from 
--/T <li> @subID bigint:  region to remove from base
--/T <li> returns number of convexes in region. 
--/T <br>
--/T Sample call:<br>
--/T <samp> 
--/T <br> exec @convexes = spRegionSubtract @RegionID, @maskID
--/T </samp> 
--/T <br>  
------------------------------------------------------------- 
AS
BEGIN
	SET NOCOUNT ON;
	-----------------------
	-- update the Region
	-----------------------
	UPDATE r
		SET area = coalesce(sph.fGetArea(bin),-1),
		regionString =sph.fGetRegionString(bin), 
		regionBinary = bin
	FROM Region r, (
		select sph.fDiff(r1.regionBinary,r2.regionBinary) bin
		from Region r1, Region r2
		where r1.regionid=@baseID
		  and r2.regionid=@subID
		) q
	WHERE r.regionid = @baseID
	  and q.bin is not null;
	-------------------------------
	-- test, if empty
	-------------------------------
	IF (@@rowcount=0)
	BEGIN
		EXEC spRegionDelete @baseID;
		RETURN 0;
	END
	-----------------------------
	-- get count of convexes
	-----------------------------
	DECLARE @count int;
	SELECT	@count=count(distinct p.convexid)
	FROM Region r CROSS APPLY sph.fGetPatches(regionBinary) p
	WHERE r.regionid=@baseID;
	RETURN  @count;
END
GO
/****** Object:  StoredProcedure [dbo].[spRegionSync]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE PROCEDURE [dbo].[spRegionSync](@type varchar(12))
--------------------------------------------------------------------------
--/H Will synchronize RegionPatch with the Regions of a certain type
--/A ---------------------------------------------------------------------
--/T Inserts the patches from the regionBinary
------------------------------------------------------
AS
BEGIN
	--------------------------------------------
	-- delete the old RegionPatch entries
	--------------------------------------------
	DELETE RegionPatch WHERE type=@type;
	-------------------------------------------------
	-- get the regionBinary, and insert the convexes
	-------------------------------------------------
	INSERT RegionPatch
	SELECT	r.regionid, p.convexid, p.patchid, r.type, 
			p.radius, p.ra, p.dec,
			p.x, p.y, p.z, p.c, p.htmid,p.area,
			cast(p.convexString as varchar(max)) convexString
	FROM Region r CROSS APPLY sph.fGetPatches(regionBinary) p
	WHERE r.type=@type;
	--------------------------------
	RETURN @@rowcount;
END
GO
/****** Object:  StoredProcedure [dbo].[spRemovePlate]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE PROCEDURE [dbo].[spRemovePlate] (@plate int, @mjd int,
			        @countsOnly int=1)
------------------------------------------------------
--/H Remove spectro objects corresponding to a given plate or plates.
--/A
--/T This script only works on a database without the FINISH step.
--/T Parameters:
--/T <li> @plate: the plate number of the plate to be deleted
--/T             if 0, then multiple plates are to be deleted
--/T             and the plate list is assumed to be in PlateIds
--/T             table, and specobj list in SpecObjIds table.
--/T <li> @mjd: MJD of plate to be removed
--/T <li> @countsOnly: 1 if we only want counts of objects that will
--/T   be deleted without actually deleting them; 0 if objects are
--/T   to be deleted.  Default is 1 (only return counts for checking).
------------------------------------------------------
AS
BEGIN
	DECLARE @objCount INT, @msg VARCHAR(4000);
	DECLARE @created tinyint, @nPlates INT;
	SET @created = 0;

	IF NOT EXISTS (SELECT name FROM sysobjects
        	 	WHERE xtype='U' AND name = 'PlateIds')
	    BEGIN
		CREATE TABLE SpecObjIds (
			specObjID bigint NOT NULL PRIMARY KEY
		)
		CREATE TABLE PlateIds (
			plateID bigint NOT NULL PRIMARY KEY
		)
		SET @created = 1;
	    END

	IF (@plate != 0) AND (@mjd != 0)
	    BEGIN
		--------------------------------------
		-- single plate to be deleted create 
 		-- list of plateIDs and specobjIDs.
		--------------------------------------
		INSERT PlateIds 
			SELECT plateID FROM PlateX 
			WHERE plate=@plate AND mjd=@mjd
		INSERT SpecObjIds
			SELECT specObjID FROM SpecObjAll s, PlateIds p
			WHERE s.plateID = p.plateID 
	    END

	SELECT @nPlates=count(*) FROM PlateIds
	IF @nPlates = 0
	    BEGIN
		SET @msg = 'No matching plates found to delete.'
		PRINT @msg
		RETURN 1
	    END
	
	IF @countsOnly = 0 
	    BEGIN	
		--------------------------------------
		-- first drop the FK indices
		--------------------------------------
		EXEC spIndexDropSelection 0, 0, 'F','SPECTRO'

		--------------------------------------
		-- delete records from all spec tables 
		-- corresponding to given plate(s)
		--------------------------------------
		DELETE p
		FROM SpecPhotoAll p, SpecObjIds o
		WHERE p.specObjID = o.specObjID
		OPTION (MAXDOP 1)
		SET @msg = CAST(@@rowCount AS VARCHAR(10)) 
				+ ' rows deleted from SpecPhotoAll.'
		PRINT @msg

		DELETE l
		FROM SpecLineAll l, SpecObjIds o
		WHERE l.specObjID = o.specObjID
		OPTION (MAXDOP 1)
		SET @msg = CAST(@@rowCount AS VARCHAR(10)) 
				+ ' rows deleted from SpecLineAll.'
		PRINT @msg

		DELETE l
		FROM SpecLineIndex l, SpecObjIds o
		WHERE l.specObjID = o.specObjID
		OPTION (MAXDOP 1)
		SET @msg = CAST(@@rowCount AS VARCHAR(10)) 
				+ ' rows deleted from SpecLineIndex.'
		PRINT @msg

		DELETE r
		FROM ELRedshift r, SpecObjIds o
		WHERE r.specObjID = o.specObjID
		OPTION (MAXDOP 1)
		SET @msg = CAST(@@rowCount AS VARCHAR(10)) 
				+ ' rows deleted from ELRedshift.'
		PRINT @msg

		DELETE r
		FROM XCRedshift r, SpecObjIds o
		WHERE r.specObjID = o.specObjID
		OPTION (MAXDOP 1)
		SET @msg = CAST(@@rowCount AS VARCHAR(10)) 
				+ ' rows deleted from XCRedshift.'
		PRINT @msg

		DELETE h
		FROM HoleObj h, PlateIds p
		WHERE h.plateID = p.plateID
		OPTION (MAXDOP 1)
		SET @msg = CAST(@@rowCount AS VARCHAR(10)) 
				+ ' rows deleted from HoleObj.'
		PRINT @msg

		--------------------------------------
		-- delete records from PhotoObjAll 
		-- corresponding to given plate(s)
		--------------------------------------
		UPDATE PhotoObjAll
		SET specObjID = 0
		WHERE specObjID IN (SELECT specObjID FROM SpecObjIds)
		OPTION (MAXDOP 1)
		SET @msg = CAST(@@rowCount AS VARCHAR(10)) 
				+ ' rows updated in PhotoObjAll.'
		PRINT @msg

/*
		UPDATE PhotoTag
		SET specObjID = 0
		WHERE specObjID IN (SELECT specObjID FROM SpecObjIds)
		OPTION (MAXDOP 1)
		SET @msg = CAST(@@rowCount AS VARCHAR(10)) 
				+ ' rows updated in PhotoTag.'
		PRINT @msg
*/

		UPDATE Target
		SET specObjID = 0
		WHERE specObjID IN (SELECT specObjID FROM SpecObjIds)
		OPTION (MAXDOP 1)
		SET @msg = CAST(@@rowCount AS VARCHAR(10)) 
				+ ' rows updated in Target.'
		PRINT @msg

		--------------------------------------
		-- finally delete specobjall and plates
		--------------------------------------
		DELETE p
		FROM SpecObjAll p, SpecObjIds o
		WHERE p.specObjID = o.specObjID
		OPTION (MAXDOP 1)
		SET @msg = CAST(@@rowCount AS VARCHAR(10)) 
				+ ' rows deleted from SpecObjAll.'
		PRINT @msg

		DELETE p1
		FROM PlateX p1, PlateIds p2
		WHERE p1.plateID = p2.plateID
		OPTION (MAXDOP 1)
		SET @msg = CAST(@@rowCount AS VARCHAR(10)) 
				+ ' rows deleted from PlateX.'
		PRINT @msg

		--------------------------------------
		-- rebuild the FK indices
		--------------------------------------	
		EXEC spIndexBuildSelection 0, 0, 'F','SPECTRO'
	    END
	ELSE
	    BEGIN
		--------------------------------------
		-- return counts from the tables with loadversion
		--------------------------------------
		SELECT @objCount=COUNT(*)
		FROM SpecPhotoAll p, SpecObjIds o
		WHERE p.specObjID = o.specObjID
		SET @msg = CAST(@objCount AS varchar(10)) 
				+' rows to be deleted from SpecPhotoAll';
		PRINT @msg;

		SELECT @objCount=COUNT(*)
		FROM SpecLineAll l, SpecObjIds o
		WHERE l.specObjID = o.specObjID
		SET @msg = CAST(@objCount AS varchar(10)) 
				+' rows to be deleted from SpecLineAll';
		PRINT @msg;

		SELECT @objCount=COUNT(*)
		FROM SpecLineIndex l, SpecObjIds o
		WHERE l.specObjID = o.specObjID
		SET @msg = CAST(@objCount AS varchar(10)) 
				+' rows to be deleted from SpecLineIndex';
		PRINT @msg;

		SELECT @objCount=COUNT(*)
		FROM ELRedshift r, SpecObjIds o
		WHERE r.specObjID = o.specObjID
		SET @msg = CAST(@objCount AS varchar(10)) 
				+' rows to be deleted from ELRedshift';
		PRINT @msg;

		SELECT @objCount=COUNT(*)
		FROM XCRedshift r, SpecObjIds o
		WHERE r.specObjID = o.specObjID
		SET @msg = CAST(@objCount AS varchar(10)) 
				+' rows to be deleted from XCRedshift';
		PRINT @msg;

		SELECT @objCount=COUNT(*)
		FROM HoleObj h, PlateIds p
		WHERE h.plateID = p.plateID
		SET @msg = CAST(@objCount AS varchar(10)) 
				+' rows to be deleted from HoleObj';
		PRINT @msg;

		SELECT @objCount=COUNT(*)
		FROM SpecObjAll p, SpecObjIds o
		WHERE p.specObjID = o.specObjID
		SET @msg = CAST(@objCount AS varchar(10)) 
				+' rows to be deleted from SpecObjAll';
		PRINT @msg;

		SELECT @objCount=COUNT(*)
		FROM PlateX p1, PlateIds p2
		WHERE p1.plateID = p2.plateID
		SET @msg = CAST(@objCount AS varchar(10)) 
				+' rows to be deleted from PlateX';
		PRINT @msg;

	    END
	--
	IF @created = 1  
	    BEGIN
		-- we created these tables, so delete them
		DROP TABLE PlateIds
		DROP TABLE SpecObjIds
	    END
	RETURN 0;
END
GO
/****** Object:  StoredProcedure [dbo].[spRemovePlateList]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE PROCEDURE [dbo].[spRemovePlateList] (@fileName VARCHAR(128), 
			            @countsOnly int=1)
------------------------------------------------------
--/H Remove spectro objects related to the plate list in the given file.
--/A
--/T This script only works on a database without the FINISH step.
--/T Parameters:
--/T <li> @fileName: name of file on disk containing list of plate#s 
--/T   and MJDs
--/T <li> @countsOnly: 1 if we only want counts of objects that will
--/T   be deleted without actually deleting them; 0 if objects are
--/T   to be deleted.  Default is 1 (only return counts for checking).
------------------------------------------------------
AS
BEGIN
	SET NOCOUNT ON;
	--
	DECLARE @objCount INT, @msg VARCHAR(4000);
	DECLARE @ret INT, @cmd nvarchar(2048);
	--
	SET @cmd = 'DIR '+@fileName;
	EXEC @ret = master.dbo.xp_cmdshell @cmd, no_output;
	IF @ret != 0
	    BEGIN
		SET @msg = 'Problem with loading plate list - file '+@fileName+' not found.';
		PRINT @msg;
		RETURN @ret;
	    END

	CREATE TABLE PlateList (
		plate INT NOT NULL,
		mjd INT NOT NULL
	)

	-- read in the plate numbers and MJDs from the file
	SET @cmd = N'BULK INSERT PlateList FROM ['+@fileName+'] WITH ('
		+ ' DATAFILETYPE = ''char'','
		+ ' FIELDTERMINATOR = '','','
		+ ' ROWTERMINATOR = ''\n'','
		+ ' BATCHSIZE =10000,'
		+ ' CODEPAGE = ''RAW'','
		+ ' TABLOCK)';
	--
	EXEC @ret=sp_executesql @cmd;
	IF @ret != 0
	    BEGIN
		DROP TABLE PlateList
		SET @msg = 'Problem with inserting file: '+@fileName+' into table.';
		PRINT @msg;
		RETURN @ret;
	    END

	------------------------------------------------
	-- create tables to hold plateids and specobjids
	------------------------------------------------
	CREATE TABLE PlateIds (
		plateID bigint NOT NULL PRIMARY KEY
	)
	CREATE TABLE SpecObjIds (
		specObjID bigint NOT NULL PRIMARY KEY
	)

	INSERT PlateIds
	    SELECT p.plateID
	    FROM PlateX p, PlateList l
	    WHERE p.plate = l.plate and p.mjd = l.mjd
	IF @countsOnly = 1
	    BEGIN
		SELECT @objCount=COUNT(*) FROM PlateIds
		SET @msg = CAST(@objCount AS VARCHAR(10))
		    + ' plates will be deleted.';
		PRINT @msg;
	    END
	--
	INSERT SpecObjIds 
	    SELECT specObjID FROM SpecObjAll s, PlateIds p
	    WHERE s.plateID = p.plateID
	--
	EXEC spRemovePlate 0, 0, @countsOnly
	--
	DROP TABLE PlateIds
	DROP TABLE SpecObjIds
	DROP TABLE PlateList
	RETURN 0;
END
GO
/****** Object:  StoredProcedure [dbo].[spRemoveTaskFromTable]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE PROCEDURE [dbo].[spRemoveTaskFromTable](
	@tablename varchar(64),
	@pk varchar(64),
	@reinsert int = 0,
	@countsOnly int = 1
)
-------------------------------------------------------
--/H Removes rows from table linked to PhotoObj corresponding to a given 
--/H task (as specified by a value of the loadversion).
--/A
--/T Assumes that there is a table called ObjIds, which 
--/T contains the bigint PKs of all objects to be removed.
--/T Parameters:
--/T <li> @tableName: the name of the table to be cleaned
--/T <li> @pk: the name of the primary key link
--/T <li> @reinsert: 1 if objects need to be reinserted,
--/T   0 if just to be removed.  Default is 0
--/T <li> @countsOnly: 1 if only counts, no actual deletion desired;
--/T   0 if deletion to go ahead.  Default is 1 (non-destructive).
--/T <samp>
--/T 	exec spRemoveTaskFromTable 'Rosat', 'objID'
--/T </samp>
-------------------------------------------------------
AS
BEGIN
	SET NOCOUNT ON;
	--
	DECLARE @cmd nvarchar(4000),
		@msg varchar(4000),
		@total bigint,
		@this bigint,
		@objCount int,
		@ret int;
	--
	SET @ret = 0;

--	CREATE TABLE ObjCount (	nrows INT NOT NULL );

	---------------------
	-- count duplicates
	---------------------
	SELECT @total = count_big(*) FROM ObjIds;

	--------------------
	-- save corresponding objects
	--------------------
--	SET @cmd = N'INSERT ObjCount SELECT COUNT(*) FROM '+ @tableName +
--		+  ' WHERE '+ @pk + ' in (select ID from ObjIds)';
	SET @cmd = N'SELECT * INTO MyObjs FROM '+ @tableName +
		+  ' WHERE '+ @pk + ' in (select ID from ObjIds)';
	--
	EXEC @ret=sp_executesql @cmd;	

--	SELECT @objCount=nrows FROM ObjCount
	SELECT @objCount=COUNT(*) FROM MyObjs
	SET @msg = CAST(@objCount AS VARCHAR(10))
		+ ' rows will be deleted from table ' + @tableName + '.';
	PRINT @msg;
--	DROP TABLE ObjCount
	--------------------------------
	-- check if only counts desired
	--------------------------------
	IF @countsOnly = 1
 	    BEGIN
	    	GOTO finalexit
	    END

	---------------------------------------
	-- do the rest only if countsOnly is 0
	---------------------------------------
	IF (@reinsert=1)
	   BEGIN
--		SET @cmd = N'SELECT * INTO MyObjs FROM '+ @tableName +
--			+  ' WHERE '+ @pk + ' in (select ID from ObjIds)';
		--
--		EXEC @ret=sp_executesql @cmd;	
		----------------------------------------
		-- are duplicate rows really identical?
		----------------------------------------
		SET @cmd = N'SELECT '+@pk+' INTO #x FROM ' + @tableName + ' GROUP BY '+@pk
			+  ' HAVING';
		SELECT @cmd = @cmd + ' min('+name+')-max('+name+') !=0 or'
	 	   FROM DBColumns
	  	  WHERE tableName = @tableName;
		SET @cmd = @cmd + ' (1=0)';

		EXEC @ret=sp_executesql @cmd;
		SELECT @objCount=COUNT(*) FROM #x
		DROP TABLE #x 
		IF (@objCount != 0) 
		   BEGIN 
			SET @msg = 'Error: ' + @tableName +'does not have exact duplicates.'
			SET @ret = 1;
	    		GOTO finalexit
		   END
	   END
	--
	-------------------------------
	-- delete the extra objects
	-------------------------------

	SET @cmd = N'DELETE ' + @tableName + ' WHERE '+@pk+' IN (select ID from ObjIds)';
	EXEC @ret=sp_executesql @cmd;

	-------------------------------------------------------------------
	-- if this is a case of identical duplicate rows, then reinsert one
	-- instance of each duplicate row.
	-------------------------------------------------------------------
	IF (@reinsert=1)
	BEGIN
		---------------------------------------------
		-- re-insert one representative of each pair
		---------------------------------------------
		SET @cmd = N'INSERT '+@tableName 
			+  ' SELECT ';
		SELECT @cmd = @cmd + ' min('+name+') '+name+','
		    FROM DBColumns
		    WHERE tableName = @tableName;
		---------------------
		-- remove last comma
		---------------------
		SET @cmd = SUBSTRING(@cmd,1, LEN(@cmd)-1);
		SET @cmd = @cmd + ' FROM MyObjs GROUP BY '+ @pk;
		EXEC @ret=sp_executesql @cmd;
		--
	END
	--

	SET @msg  = 'Objects were successfully deleted from '+ @tableName;
	finalexit: 
	------------------------------
	-- clean up by dropping MyObjs
	------------------------------
--	IF (@reinsert=1)
	IF EXISTS (select * from dbo.sysobjects 
		where id = object_id(N'[MyObjs]')
		and OBJECTPROPERTY(id, N'IsUserTable') = 1)
		DROP TABLE MyObjs

	----------------------------------------------------------
	-- proper error handler with spNewPhase should come here
	----------------------------------------------------------
	-- PRINT @msg;
	--
	RETURN @ret;
END
GO
/****** Object:  StoredProcedure [dbo].[spRemoveTaskPhoto]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE PROCEDURE [dbo].[spRemoveTaskPhoto] (@loadversion int, 
				    @reinsert int=0,
				    @countsOnly int=1)
------------------------------------------------------
--/H Remove objects related to a given @loadversion (i.e. taskID).
--/A
--/T This script only works on a database without the FINISH step.
--/T Parameters:
--/T <li> @loadversion: the loadversion of the Task to be removed
--/T <li> @reinsert: 1 if objects need to be reinserted,
--/T   0 if just to be removed. Default is 0.
--/T <li> @countsOnly: 1 if we only want counts of objects that will
--/T   be deleted without actually deleting them; 0 if objects are
--/T   to be deleted.  Default is 1 (only return counts for checking).
------------------------------------------------------
AS
BEGIN
	SET NOCOUNT ON;
	--
	DECLARE @objCount INT, @msg VARCHAR(4000);
	--
	CREATE TABLE ObjIds (
		ID bigint NOT NULL PRIMARY KEY
	)
	CREATE TABLE FieldIds (
		ID bigint NOT NULL PRIMARY KEY
	)

	--------------------------------------
	-- linked to Field
	--------------------------------------
	INSERT FieldIds
	    SELECT fieldID as ID
	    FROM Field
	    WHERE loadversion = @loadversion
	IF @countsOnly = 1
	    BEGIN
		SELECT @objCount=COUNT(*) FROM FieldIds
		SET @msg = CAST(@objCount AS VARCHAR(10))
		    + ' fieldIDs matched loadversion ' + CAST(@loadversion AS VARCHAR(10));
		PRINT @msg;
	    END
	--
	INSERT ObjIds 
	SELECT * FROM FieldIds
 	exec spRemoveTaskFromTable 'Frame', 'fieldID', @reinsert, @countsOnly
 	exec spRemoveTaskFromTable 'FieldProfile', 'fieldID', @reinsert, @countsOnly

	--------------------------------------
	-- linked to PhotoObjAll
	--------------------------------------
	TRUNCATE TABLE ObjIds
	INSERT ObjIds
	    SELECT objID as ID
	    FROM PhotoObjAll 
	    WHERE loadversion = @loadversion
	IF @countsOnly = 1
	    BEGIN
		SELECT @objCount=COUNT(*) FROM ObjIds
		SET @msg = CAST(@objCount AS VARCHAR(10))
			+ ' objIDs matched loadversion ' + CAST(@loadversion AS VARCHAR(10));
		PRINT @msg;
	    END
	--
 	exec spRemoveTaskFromTable 'PhotoProfile', 'objID', @reinsert, @countsOnly
 	exec spRemoveTaskFromTable 'AtlasOutline', 'objID', @reinsert, @countsOnly
 	exec spRemoveTaskFromTable 'USNO', 'objID', @reinsert, @countsOnly
 	exec spRemoveTaskFromTable 'First', 'objID', @reinsert, @countsOnly
 	exec spRemoveTaskFromTable 'Rosat', 'objID', @reinsert, @countsOnly
-- 	exec spRemoveTaskFromTable 'PhotoTag', 'objID', @reinsert, @countsOnly
 	exec spRemoveTaskFromTable 'Neighbors', 'objID', @reinsert, @countsOnly
 	exec spRemoveTaskFromTable 'Zone', 'objID', @reinsert, @countsOnly

	---------------------------
	-- special case for Mask
	---------------------------
	SELECT DISTINCT maskid as ID
	INTO #x2
		FROM Mask
		WHERE (maskid & 0xFFFFFFFFFFF0000) IN (SELECT id FROM FieldIds)

	TRUNCATE TABLE ObjIds
	--
	INSERT ObjIds
	SELECT * FROM #x2

 	exec spRemoveTaskFromTable 'Mask', 'maskID', @reinsert, @countsOnly
	
	IF @countsOnly = 0 
	    BEGIN	
		--------------------------------------
		-- handle the tables with loadversion
		--------------------------------------
		DELETE Field WHERE loadversion=@loadversion;
		DELETE Chunk WHERE loadversion=@loadversion;
		DELETE Segment WHERE loadversion=@loadversion;
		DELETE Target WHERE loadversion=@loadversion;
		DELETE TargetInfo WHERE loadversion=@loadversion;
		DELETE PhotoObjAll WHERE loadversion=@loadversion;
	    END
	ELSE
	    BEGIN
		--------------------------------------
		-- return counts from the tables with loadversion
		--------------------------------------
		SELECT @objCount=COUNT(*) FROM Field WHERE loadversion=@loadversion;
		SET @msg = CAST(@objCount AS varchar(10)) +' rows to be deleted from Field';
		PRINT @msg;
		SELECT @objCount=COUNT(*) FROM Chunk WHERE loadversion=@loadversion;
		SET @msg = CAST(@objCount AS varchar(10)) +' rows to be deleted from Chunk';
		PRINT @msg;
		SELECT @objCount=COUNT(*) FROM Segment WHERE loadversion=@loadversion;
		SET @msg = CAST(@objCount AS varchar(10)) +' rows to be deleted from Segment';
		PRINT @msg;
		SELECT @objCount=COUNT(*) FROM Target WHERE loadversion=@loadversion;
		SET @msg = CAST(@objCount AS varchar(10)) +' rows to be deleted from Target';
		PRINT @msg;
		SELECT @objCount=COUNT(*) FROM TargetInfo WHERE loadversion=@loadversion;
		SET @msg = CAST(@objCount AS varchar(10)) +' rows to be deleted from TargetInfo';
		PRINT @msg;
		SELECT @objCount=COUNT(*) FROM PhotoObjAll WHERE loadversion=@loadversion;
		SET @msg = CAST(@objCount AS varchar(10)) +' rows to be deleted from PhotoObjAll';
		PRINT @msg;
	    END
	--
	DROP TABLE FieldIds
	DROP TABLE ObjIds
	RETURN 0;
END
GO
/****** Object:  StoredProcedure [dbo].[spRemoveTaskSpectro]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE PROCEDURE [dbo].[spRemoveTaskSpectro] (@loadversion int, 
				      @countsOnly int=1)
------------------------------------------------------
--/H Remove spectro objects related to a given @loadversion (i.e. taskID).
--/A
--/T This script only works on a database without the FINISH step.
--/T Parameters:
--/T <li> @loadversion: the loadversion of the Task to be removed
--/T <li> @countsOnly: 1 if we only want counts of objects that will
--/T   be deleted without actually deleting them; 0 if objects are
--/T   to be deleted.  Default is 1 (only return counts for checking).
------------------------------------------------------
AS
BEGIN
	SET NOCOUNT ON;
	--
	DECLARE @objCount INT, @msg VARCHAR(4000);
	--
	CREATE TABLE SpecObjIds (
		specObjID bigint NOT NULL PRIMARY KEY
	)
	CREATE TABLE PlateIds (
		plateID bigint NOT NULL PRIMARY KEY
	)

	--------------------------------------
	-- linked to Field
	--------------------------------------
	INSERT PlateIds
	    SELECT plateID
	    FROM PlateX
	    WHERE loadversion = @loadversion
	IF @countsOnly = 1
	    BEGIN
		SELECT @objCount=COUNT(*) FROM PlateIds
		SET @msg = CAST(@objCount AS VARCHAR(10))
		    + ' Plates matched loadversion ' + CAST(@loadversion AS VARCHAR(10));
		PRINT @msg;
	    END
	--
	INSERT SpecObjIds 
	SELECT specObjID FROM SpecObjAll s, PlateIds p
	WHERE s.plateID = p.plateID
	--
	EXEC spRemovePlate 0, 0, @countsOnly
	--
	DROP TABLE PlateIds
	DROP TABLE SpecObjIds
	RETURN 0;
END
GO
/****** Object:  StoredProcedure [dbo].[spReorg]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spReorg]
----------------------------------------------------
--/H Reorganize and defragment database tables
--/A
--/T  Jim Gray, Nov 2002
--/T Largely copied from the DBCC books online
--/T Reorganize a database, reclustering tables and indices.
--/T Fist collect a list of statistics about each table and index
--/T then reindex anything with more than 30% extent fragmentation
--/T Largely copied from the DBCC books online
--------------------------------------------------------------------------
AS BEGIN 
	-- Declare variables
	SET NOCOUNT ON
	DECLARE @tablename VARCHAR (128)
	DECLARE @indexname VARCHAR (128)
	DECLARE @objectid  BIGINT		-- Object Identifier from catalog
	DECLARE @execstr   VARCHAR(256)		-- DBCC execution string
	DECLARE @indexId   BIGINT		-- index ID
	DECLARE @maxFrag   INT			-- max fragmentation to allow
	DECLARE @minDensity INT
	DECLARE @frag      INT			-- actual fragmentation of an object
	DECLARE @density   INT			-- Scan density (extents vs switches)

	-- Decide on the maximum fragmentation to allow
	SET @maxfrag 	= 20 		-- 20%	-- out of order pages
	SET @minDensity = 90		-- 90%	-- in order extents
 
	-- Declare cursor fir all our base tables (user tables only)
	DECLARE tables CURSOR FOR
	   SELECT TABLE_NAME
	   FROM INFORMATION_SCHEMA.TABLES
	   WHERE TABLE_TYPE = 'BASE TABLE'

	-- Create the table
	CREATE TABLE #fraglist (
	   ObjectName CHAR (255),
	   ObjectId INT,
	   IndexName CHAR (255),
	   IndexId INT,
	   Lvl 	INT,
	   CountPages INT,	-- often null
	   CountRows INT,	-- often null
	   MinRecSize INT,	-- often null
	   MaxRecSize INT,	-- often null
	   AvgRecSize INT,	-- often null
	   ForRecCount INT,	-- often null
	   Extents INT,		-- often 0  
	   ExtentSwitches INT,	-- sometimes zero, sometimes big
	   AvgFreeBytes INT,	-- often null
	   AvgPageDensity INT,	-- often null
	   ScanDensity DECIMAL, -- we want this to be 100%
			-- this is the ratio of extent switches to extents
	   BestCount INT,	-- often null
	   ActualCount INT,	-- not sure what this is
	   LogicalFrag DECIMAL,	-- we want this to be zero
	   ExtentFrag DECIMAL)	-- often null

/*
Statistic Description  from books online
Pages Scanned 		Number of pages in the table or index. 
Extents Scanned 	Number of extents in the table or index. 
Extent Switches 	Number of times the DBCC statement moved from 
			one extent to another while it traversed the pages 
			of the table or index. 
Avg. Pages per Extent 	Number of pages per extent in the page chain. 
Scan Density 		[Best Count: Actual Count] 
			Best count is the ideal number of extent changes 
			if everything is contiguously linked. 
			Actual count is the actual number of extent changes. 
			The number in scan density is 100 if everything is contiguous; 
			if it is less than 100, some fragmentation exists. 
			Scan density is a percentage. 
Logical Scan Fragmentation Percentage of out-of-order pages returned from scanning 
			the leaf pages of an index. This number is not relevant to 
			heaps and text indexes. An out of order page is one for which the
			next page indicated in an IAM is a different page than the page 
			pointed to by the next page pointer in the leaf page. 
Extent Scan Fragmentation Percentage of out-of-order extents in scanning the leaf pages 
			of an index. This number is not relevant to heaps. An out-of-order 
			extent is one for which the extent containing the current page 
			for an index is not physically the next extent after the extent 
			containing the previous page for an index. 
Avg. Bytes free per page Average number of free bytes on the pages scanned. The higher the number, 
			the less full the pages are. Lower numbers are better. This number is 
			also affected by row size; a large row size can result in a higher number. 
Avg. Page density (full) Average page density (as a percentage). This value takes into account row size, 
			so it is a more accurate indication of how full your pages are. The higher 
			the percentage, the better. 
*/

	-- Open the cursor
	OPEN tables

	-- For each user table in the database
	FETCH NEXT
	   FROM tables
	   INTO @tablename

	WHILE @@FETCH_STATUS = 0
	BEGIN
	   -- Do the showcontig of all indexes of the table, this populates the #fraglist table
	   INSERT INTO #fraglist 
	   EXEC ('DBCC SHOWCONTIG (''' + @tablename + ''') 
	      WITH FAST, TABLERESULTS, ALL_INDEXES, NO_INFOMSGS')
	   FETCH NEXT
	      FROM tables
 	     INTO @tablename
	END

	-- Close and deallocate the cursor
	CLOSE tables
	DEALLOCATE tables
 
	--=========================================================
	-- use the #fraglist table to drive reorg.
	--

	-- Declare cursor for list of indexes to be defragged
	DECLARE indexes CURSOR FOR
	   SELECT rtrim(ObjectName), rtrim(IndexName), ObjectId, IndexId, LogicalFrag, ScanDensity
	   FROM #fraglist
	   WHERE (LogicalFrag >=  @maxfrag  or scandensity < @minDensity) 
	     AND INDEXPROPERTY (ObjectId, IndexName, 'IndexDepth') > 0
	     AND countPages > 1
  
	-- Open the cursor
	OPEN indexes
 
	-- For each index that needs to be defragged.
 
	--- The LOOP (breaks when fetch fails)
	WHILE (1 = 1)
	BEGIN
	   FETCH NEXT
	   	FROM indexes
	   	INTO @tablename, @IndexName, @objectid, @indexid, @frag, @density
	   IF (@@FETCH_STATUS != 0) BREAK
	   PRINT 'Executing DBCC INDEXDEFRAG (0, ' + RTRIM(@tablename) + ','
	  	+ RTRIM(@indexid) + ') - (== ' + @tablename + '.' +  @indexname 
		+ ' ) fragmentation was ' + RTRIM(@frag) + '%'
		+ ' density was ' + RTRIM(@density) + '%'
	   SELECT @execstr = 'DBCC INDEXDEFRAG (0, ' + RTRIM(@objectid) + ','
	         + RTRIM(@indexid) + ') WITH NO_INFOMSGS '
	   -- DO IT!
	   EXEC (@execstr)
	END

	-- Close and deallocate the cursor
	CLOSE indexes
	DEALLOCATE indexes

	-- Delete the temporary table
	DROP TABLE #fraglist
END

GO
/****** Object:  StoredProcedure [dbo].[spRunPatch]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE PROCEDURE [dbo].[spRunPatch]( @patchName VARCHAR(32), 
			     @patchFileName VARCHAR(64),
			     @versionUpdate VARCHAR(8) = 'minor',
			     @patchFileDir VARCHAR(128) = '',
			     @patchDesc VARCHAR(2000) = '',
			     @patchAuth VARCHAR(256) = ''
)
-------------------------------------------------------------
--/H Run the patch contained in the given patch file.
--/A -----------------------------------------------------------
--/T Execute the patch from the given file and update the DB
--/T diagnostics and version information accordingly.  The
--/T @versionUpdate parameter allows selection of 'major' or
--/T 'minor' (default) update type so that the version number
--/T is incremented accordingly.  Hence a major update will 
--/T increase version 3.1 to 3.2, whereas minor update will 
--/T increase version 3.1 to 3.1.1.
------------------------------------------------------------- 
AS BEGIN
   DECLARE @patchFilePath VARCHAR(256), @checkSum VARCHAR(64),
	   @patchDate VARCHAR(256), @nextVersion VARCHAR(32),
	   @prevVersion VARCHAR(32), @cmd VARCHAR(256)
   DECLARE @pos1 SMALLINT, @pos2 SMALLINT, @majorVersion INT, 
           @minorVersion INT, @ret INT, @test TINYINT

   SET NOCOUNT ON
   SET @test = 0	-- set to non-zero for debugging purposes

   -- Construct path for path file, default is C:\sqlLoader\...
   IF @patchFileDir = '' 
      SET @patchFileDir = 'C:\sqlLoader\schema\patches\'
   SET @patchFilePath = @patchFileDir + @patchFileName
   SET @ret = 0

   SET @cmd = 'DIR '+@patchFilePath;
   EXEC @ret = master.dbo.xp_cmdshell @cmd, no_output;
   IF @ret != 0
      BEGIN
         PRINT 'Problem with loading patches - file '+@patchFilePath+' not found.'
         RETURN 1;
      END

   -- Run the patch from the given patch file.
   IF @test = 0
      EXEC @ret = spRunSqlScript 0, 0, 'RunPatch', @patchFileDir, @patchFileName

   -- If patch ran fine, update the DB diagnostics and version info.
   IF @ret = 0
      BEGIN
	 -- Bump up the version number.  The version number needs to be of
         -- the form 2.1 or 2.1.1.
	 SELECT @prevVersion=max(version) FROM Versions
		WHERE ISNUMERIC(version)=1
   			OR ISNUMERIC( SUBSTRING(version,CHARINDEX('.',version,1)+1,
			LEN(version)-CHARINDEX('.',version,1)) )=1
	 SET @pos1 = CHARINDEX('.', @prevVersion, 1)
         IF @pos1 = 0
            BEGIN
		PRINT 'Problem with running patch - previous version number is not valid: '+@prevVersion
		RETURN 1;
            END
	 SET @pos2 = CHARINDEX('.', @prevVersion, @pos1+1 )
	 IF @pos2=0
            BEGIN
               IF @versionUpdate = 'minor'
                  SET @nextVersion = @prevVersion + '.1'
	       ELSE
                  SET @nextVersion=CAST( (CAST(@prevVersion AS REAL) + 0.1) AS VARCHAR(10) )
            END
	 ELSE
	    BEGIN
	       SET @majorVersion=CAST( SUBSTRING(@prevVersion,@pos1+1,@pos2-@pos1-1) AS INT )
	       IF @versionUpdate = 'minor'
                  SET @minorVersion=CAST( SUBSTRING(@prevVersion,@pos2+1,LEN(@prevVersion)-@pos2) AS INT ) + 1
	       ELSE
		  BEGIN
		     SET @majorVersion = @majorVersion + 1
		     SET @minorVersion = 0
		  END
	       SET @nextVersion = SUBSTRING(@prevVersion,1,@pos1-1)+ '.' + 
		   CAST(@majorVersion AS VARCHAR(2)) + '.' +
		   CAST(@minorVersion AS VARCHAR(2));
	    END

	 -- Compute the checksum and save it in SiteConstants.
         IF @test = 0
            BEGIN
		-- Update statistics for all tables
		EXEC spUpdateStatistics

		-- generate diagnostics and checksum
		EXEC spMakeDiagnostics
		EXEC spUpdateSkyServerCrossCheck
		EXEC spCompareChecksum
	    END
	 SELECT @checkSum=value FROM SiteConstants WHERE name='Checksum'
	 SELECT @patchDate=value FROM SiteConstants 
		WHERE name='DB Version Date'

	 -- Add the latest version info to the Versions table.
         IF @test = 0
            INSERT INTO Versions Values (
		'Applied patch '+@patchName,@prevVersion,@checkSum,@nextVersion,
		'Patch loaded from file '+@patchFilePath,
		@patchDesc, @patchAuth, @patchDate 
		)
         ELSE
            SELECT
		'Applied patch '+@patchName,@prevVersion,@checkSum,@nextVersion,
		'Patch loaded from file '+@patchFilePath,
		@patchDesc, @patchAuth, @patchDate 
      END
   ELSE
      PRINT 'Problem with patch file ... patch did not run successfully.'

   RETURN @ret
END
GO
/****** Object:  StoredProcedure [dbo].[spRunSQLScript]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE PROCEDURE [dbo].[spRunSQLScript](@taskid int, @stepid int, @phase varchar(64),
	@path varchar(128), @script varchar(256),
	@dbname varchar(64) = ' ', @logname varchar(128) = ' ')
---------------------------------------------------
--/H Executes an SQL script and logs the output string
--/A -------------------------------------------------
--/T Returns the status of the error, and inserts 
--/T error message into the Phase table
---------------------------------------------------
AS
BEGIN
	--
	SET NOCOUNT ON;
	--
	DECLARE @msg varchar(8000), 
		@cmd nvarchar(2048), 
		@status varchar(16), 
		@ret int;
	--
	IF (@dbname = ' ') SELECT @dbname = DB_NAME();
	--
	CREATE TABLE #scriptMsg (msg varchar(2048));
	--
	SET @cmd = N'osql -S '+@@servername+' -d'+@dbname+' -E -n -i'+@path+'\'+@script;
	IF (@logname != ' ') 
	    SET @cmd = @cmd + ' >> ' + @logname;
	SET @msg = 'Ran SQL script ' + @cmd;
	INSERT INTO #scriptMsg EXEC @ret=master.dbo.xp_cmdshell @cmd;
	--
	SELECT @msg = @msg+' '+msg FROM #scriptMsg WHERE msg is not null;
	SET @status = CASE WHEN @ret=0 THEN 'OK' ELSE 'ERROR' END;
	--
	-------------------------------
	-- write log message
	-------------------------------
	SET @msg = LEFT(@msg,2048);
	EXEC spNewPhase @taskid,@stepid,@phase,@status,@msg;
	--
	DROP TABLE #scriptMsg
	--
	RETURN(@ret);
END
GO
/****** Object:  StoredProcedure [dbo].[spSdssPolygonRegions]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE PROCEDURE [dbo].[spSdssPolygonRegions](	
	@taskid int, 
	@stepid int 
)
--------------------------------------------------------------------------
--/H Create regions of a type 'POLYGON' during FINISH stage
--/A ---------------------------------------------------------------------
--/T Create the polygon regions for main survey and set the areas
--/T using regionBinary.
------------------------------------------------------
AS
BEGIN
	DECLARE @msg varchar(1000)
	-----------------------------------------------------
	-- give phase start message 
	SET @msg =  'Starting creation of SDSS polygon regions '
	EXEC spNewPhase @taskID, @stepID, 'spSdssPolygonRegions', 'OK', @msg;
	-----------------------------------------------------
	EXEC dbo.spIndexDropSelection @taskID, @stepID, 'F', 'REGION'
	EXEC dbo.spIndexDropSelection @taskID, @stepID, 'F', 'SECTOR'
	TRUNCATE TABLE Region
	INSERT Region WITH (tablockx)
	    SELECT sdsspolygonid AS id, 'POLYGON' AS TYPE, '' AS comment,
		   0 AS ismask, -1 AS area, NULL AS regionstring,
		   dbo.fSphSimplifyQueryAdvanced('SELECT 0, X,Y,Z, C FROM SdssImagingHalfspaces WHERE SdssPolygonID=' + convert(varchar(128),SdssPolygonID), 0,0,0,0) AS regionBinary
-- 			dbo.fSphSimplifyAdvanced(sdsspolygonid, 0,0,0,0) AS regionbinary
		FROM sdssPolygons WITH (NOLOCK)
	UPDATE Region SET area = COALESCE(dbo.fSphGetArea(regionbinary), -1)
--	UPDATE Region SET area = dbo.fSphGetArea(regionbinary)
	EXEC dbo.spIndexBuildSelection @taskID, @stepID, 'F', 'SECTOR'
	EXEC dbo.spIndexBuildSelection @taskID, @stepID, 'F', 'REGION'
	------------------------------------------------------
    -- generate completion message.
	SET @msg = 'Created SDSS Polygon regions';
    EXEC spNewPhase @taskid, @stepid, 'spSdssPolygonRegions', 'OK', @msg;
	------------------------------------------------------
    RETURN(0);
END
GO
/****** Object:  StoredProcedure [dbo].[spSegue2SpectroPhotoMatch]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE PROCEDURE [dbo].[spSegue2SpectroPhotoMatch] (
	@taskid int, 
	@stepid int 
)
-------------------------------------------------------------
--/H Computes PhotoObj corresponding to new SEGUE2 spectra
--/A --------------------------------------------------------
--/T Connect SEGUE2 spectra to photo objects in Best 
--/T Designed to run in the Best database.
--/T <p> parameters:   
--/T <li> taskid int,   		-- Task identifier
--/T <li> stepid int,   		-- Step identifier
--/T <li> returns  0 if OK, non zero if something wrong  
--/T <br>
--/T Sample call   <br>
--/T <br> <samp> 
--/T exec spSegue2SpectroPhotoMatch @taskid , @stepid  
--/T </samp> 
--/T <br>  
------------------------------------------------------------- 
AS BEGIN
	SET NOCOUNT ON
	-----------------------------------------------------
	-- local table variable to hold the specobjects
	CREATE TABLE #PhotoSpec (
		PhotoObjID 		bigint,
	 	mode			tinyint,
		SpecObjID		bigint PRIMARY KEY,
		sciencePrimary	tinyint,
		ra				float,
		[dec]			float,
		cX				float,
		cY				float,
		cZ				float,
		Distance		float
	) 
	--
	DECLARE @rows bigint,
		@msg varchar(1000)
	-----------------------------------------------------
	-- give phase start message 
	SET @msg =  'Starting heuristic match of SEGUE2 '
	    + 'Spectro & Photo objects on BEST-PUB'
	EXEC spNewPhase @taskID, @stepID, 'SEGUE2 PhotoSpec match', 'OK', @msg;
	-----------------------------------------------------
	-- fill in spectro info for objects with positions
	INSERT 	#PhotoSpec
	SELECT 	NULL, 0,
		SpecObjID, sciencePrimary, ra, [dec],
		cx, cy, cz, -1
	FROM BESTSEGUE2.dbo.SpecObjAll WITH(nolock)
	WHERE BestObjID = 0
	AND ra between 0 and 360
	AND [dec] between -90 and 90
	-----------------------------------------------------
	-- give phase start message 
	SET @msg =  'Starting SEGUE2 spatial matchup'
	EXEC spNewPhase @taskID, @stepID, 'SEGUE2 PhotoSpec match', 'OK', @msg;
	-- find lowest mode, nearest objid within 1.0"
	DECLARE @mode tinyint;
	SET @mode = 1;
	WHILE (@mode <= 4)
	BEGIN
		UPDATE	#PhotoSpec
		SET 	PhotoObjID = dbo.fGetNearestObjIdEqMode(ra,[dec],1.0/60.0,@mode),
			mode = @mode
		WHERE	PhotoObjID IS NULL
		OPTION (MAXDOP 1)
		SET @mode = @mode + 1;
	END
	-----------------------------------------------------
	-- delete orphans (no match)
	DELETE #PhotoSpec
	    WHERE PhotoObjID IS NULL
	-----------------------------------------------------
	SET @msg =  'Starting SEGUE2 SpecObjAll update'
	EXEC spNewPhase @taskID, @stepID, 'SEGUE2 PhotoSpec match', 'OK', @msg;
	-- Set SpecObj.ObjID from PhotoSpectro
	BEGIN TRANSACTION
	    UPDATE BESTSEGUE2.dbo.SpecobjAll
		SET    BestObjId = PS.PhotoObjID
		FROM   SpecObjAll S, #PhotoSpec PS
		WHERE  S.SpecObjID = PS.SpecObjID
		OPTION (MAXDOP 1)
	COMMIT TRANSACTION
	-----------------------------------------------------
	-- Set PhotoObjAll.SpecObjID from PhotoSpectro
	SET @msg =  'Starting PhotoObjAll update for SEGUE2'
	EXEC spNewPhase @taskID, @stepID, 'SEGUE2 PhotoSpec match', 'OK', @msg;
	--
	BEGIN TRANSACTION
	    UPDATE PhotoObjAll
		SET    	specObjID = PS.specObjID
		FROM   	photoObjAll P, #PhotoSpec PS
		WHERE  	P.objID = PS.PhotoObjID
		AND 	PS.sciencePrimary = 1
		OPTION (MAXDOP 1)
	COMMIT TRANSACTION

/*
	-----------------------------------------------------
	-- Set PhotoTag.SpecObjID from PhotoSpectro
	SET @msg =  'Starting PhotoTag update for SEGUE2'
	EXEC spNewPhase @taskID, @stepID, 'SEGUE2 PhotoSpec match', 'OK', @msg;
	--
	BEGIN TRANSACTION
	    UPDATE PhotoTag
		SET    	specObjID = PS.specObjID
		FROM   	photoTag P WITH(NOLOCK), #PhotoSpec PS
		WHERE  	P.objID = PS.PhotoObjID
		AND 	PS.sciencePrimary = 1
		OPTION (MAXDOP 1)
	COMMIT TRANSACTION
*/
	-----------------------------------------------------
	-- Set sppParams.bestObjID from SpecObjAll
	SET @msg =  'Starting sppParams bestObjID update for SEGUE2'
	EXEC spNewPhase @taskID, @stepID, 'SEGUE2 PhotoSpec match', 'OK', @msg;
	--
	BEGIN TRANSACTION
	    UPDATE P
		SET    	P.BESTOBJID = S.bestObjID
		FROM   	sppParams P WITH(NOLOCK) 
			JOIN SpecObjAll S ON P.specObjID=S.specObjID
		OPTION (MAXDOP 1)
	COMMIT TRANSACTION
	-----------------------------------------------------
	SELECT @rows = count_big(*) from #PhotoSpec
	SET @msg = 'spSegue2SpectroPhotoMatch found ' 
	    + cast(@rows as varchar(20)) + ' matches'
	-----------------------------------------------------
	-- give phase message telling of success.
	EXEC spNewPhase @taskID, @stepID, 'SEGUE2 PhotoSpec match', 'OK', @msg;
	-----------------------------------------------------
	DROP TABLE #PhotoSpec
	RETURN(0);
END	-- end spSegue2SpectroPhotoMatch
GO
/****** Object:  StoredProcedure [dbo].[spSetDefaultFileGroup]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE PROCEDURE [dbo].[spSetDefaultFileGroup](@tableName nvarchar(100), @mode char(1)='T')
-----------------------------------------------------------
--/H Set default file group for table taken from the FileGroupMap table
--/A
--/T The stored procedure looks up the tableName in the FileGroupMap table.
--/T If it finds a match it sets the default file group as specified 
--/T for that table or index. If no mapping is found, the procedure 
--/T sets PRIMARY as the default.<br>
--/T If the @mode parameter is 'I', then it sets the DEFAULT to the
--/T indexFileGroup value for the table, otherwise to the filegroup 
--/T of the table itself.<br>
--/T <PRE> EXEC spSetDefaultFileGroup 'photoObjAll' </PRE>
-----------------------------------------------------------
AS BEGIN
	DECLARE	@cmd nvarchar(300),
		@fgroup varchar(300),
		@default varchar(300);
	--
	-- get the name of the current default filegroup
	--
	SELECT @default=UPPER(groupname)
	    FROM sysfilegroups
	    WHERE (status & 0x10)>0
	--
	-- get the name that we would like to set to,
	-- depending on the value of @mode
	--
	IF (@mode='T')
	    SELECT @fgroup = UPPER(tableFileGroup)
		FROM FileGroupMap WITH (nolock)
		WHERE tableName = @tableName
	ELSE
	    SELECT @fgroup = UPPER(indexFileGroup)
		FROM FileGroupMap WITH (nolock)
		WHERE tableName = @tableName
	--
	-- if none found, set it to PRIMARY
	--
	IF (@fgroup is null) SET @fgroup = 'PRIMARY';
	--
	-- build the command
	--
	SET @cmd = 'alter database '+  db_Name()
		+ ' modify filegroup ['+ @fgroup + '] default'
	--
	-- only execute if different from current default
	--
	IF (@default != @fgroup)  EXEC sp_executesql @cmd
	--
	RETURN
END
GO
/****** Object:  StoredProcedure [dbo].[spSetInsideMask]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spSetInsideMask] (@taskid int, @stepid int, @mode int)
------------------------------------------------
--/H Update the insideMask value in Photo tables
--/A -------------------------------------------
--/T @mode=0  -- run on the TaskDB
--/T @mode>0  -- run it on the whole PubDB, also update PhotoTag
------------------------------------------------
AS BEGIN
   SET NOCOUNT ON;
    DECLARE 
	@maxid  bigint,
	@count bigint, 
	@total bigint,
	@msg varchar(8000);

    -------------------------------------------------------
    -- Set the htmID column in Mask table first.
    -------------------------------------------------------
    IF @mode>0
	BEGIN
	    EXEC spIndexDropSelection @taskid, @stepid, 'I', 'Mask'
	    BEGIN TRANSACTION
		UPDATE Mask
		  SET htmID = dbo.fHtmXyz( cx, cy, cz )	    
	    COMMIT TRANSACTION
	    EXEC spIndexBuildSelection @taskid, @stepid, 'I', 'Mask'
	END
    SET @msg = 'Mask.htmID updated'
    EXEC spNewPhase @taskid, @stepid, 'Set values', 'OK', @msg;

    -------------------------------------------------------
    -- build a distinct list of objid's into a temp table
    -------------------------------------------------------
    SELECT distinct objid, cast(0 as int) insideMask
	INTO #maskedObj
	FROM MaskedObject
    ----------------------------------------------
    -- then build the logical or of the maskTypes
    ----------------------------------------------
    -- update mask type 0...3 (Everything but seeing)
    UPDATE #maskedObj
	SET insideMask = insideMask | power(2,0) 
        FROM #maskedObj t JOIN MaskedObject m ON t.objid=m.objid
	WHERE m.maskType=0

    UPDATE #maskedObj
	SET insideMask = insideMask | power(2,1) 
        FROM #maskedObj t JOIN MaskedObject m ON t.objid=m.objid
	WHERE m.maskType=1

    UPDATE #maskedObj
	SET insideMask = insideMask | power(2,2) 
        FROM #maskedObj t JOIN MaskedObject m ON t.objid=m.objid
	WHERE m.maskType=2

    UPDATE #maskedObj
	SET insideMask = insideMask | power(2,3) 
        FROM #maskedObj t JOIN MaskedObject m ON t.objid=m.objid
	WHERE m.maskType=3

    -- poor seeing masks (r band seeing>1.7)
    UPDATE #maskedObj
	SET insideMask = insideMask | power(2,4) 
        FROM #maskedObj t, MaskedObject mo, Mask m
	WHERE t.objid=mo.objid and mo.maskid=m.maskid
		and m.type=4 and m.filter=2 and m.seeing>1.7
    -- bad seeing masks (r band seeing>2.0)
    UPDATE #maskedObj
	SET insideMask = insideMask | power(2,5) 
        FROM #maskedObj t, MaskedObject mo, Mask m
	WHERE t.objid=mo.objid and mo.maskid=m.maskid
		and m.type=4 and m.filter=2 and m.seeing>2.0
    --
    BEGIN TRANSACTION
	UPDATE p
	    SET p.insideMask = m.insideMask
	    FROM PhotoObjAll p JOIN #maskedObj m ON p.objid=m.objid
	SET @total = @@ROWCOUNT
    COMMIT TRANSACTION
	--
    --
    IF @@error<>0
    BEGIN
	SET @msg = 'Error in spSetInsideMask'
	EXEC spEndStep @taskID, @stepID, 'ABORTING', @msg, @msg;
	RETURN(1);
    END
    SET @msg = CAST(@total as varchar(10)) + ' photoObj.insideMask updated.'
    EXEC spNewPhase @taskid, @stepid, 'Set values', 'OK', @msg;
    --------------------
    -- write phase log
    --------------------
    SET @msg = 'Done setting PhotoObjAll.insideMask and Mask.htmID'
    EXEC spNewPhase @taskid, @stepid, 'Set values', 'OK', @msg;
    --
    DROP TABLE #maskedObj
    RETURN(0);
END

GO
/****** Object:  StoredProcedure [dbo].[spSetLoadVersion]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spSetLoadVersion](@taskid int, @stepid int, @type varchar(32) )
-------------------------------------------------------------
--/H Update the loadVersion for various tables
--/A
--/T Part of the loading process
-------------------------------------------------------------
AS
BEGIN
    SET NOCOUNT On;
    --
    DECLARE
	@msg varchar(1024),
	@ret int;
    EXEC spNewPhase @taskid, @stepid, 'Set values', 'OK', 'Setting loadVersion';
    IF @type = 'PLATES'
      BEGIN
	------------------------------------------------
	-- plates
	------------------------------------------------
	UPDATE PlateX 		SET loadVersion = @taskid;
      END
    IF @type = 'TILES'
      BEGIN
	------------------------------------------------
	-- tiles
	------------------------------------------------
	UPDATE sdssTileAll 		SET loadVersion = @taskid;
	UPDATE sdssTilingGeometry 	SET loadVersion = @taskid;
	UPDATE sdssTiledTargetAll 	SET loadVersion = @taskid;
	UPDATE sdssTilingInfo	 	SET loadVersion = @taskid;
	UPDATE sdssTilingRun 		SET loadVersion = @taskid;
      END

    IF @type = 'WINDOW'
      BEGIN
	------------------------------------------------
	-- tiles
	------------------------------------------------
	UPDATE sdssImagingHalfSpaces 		SET loadVersion = @taskid;
	UPDATE sdssPolygons	SET loadVersion = @taskid;
	UPDATE sdssPolygon2Field 	SET loadVersion = @taskid;
      END

    IF @type IN ('BEST','TARGET', 'RUNS')
      BEGIN
	------------------------------------------------
	-- imaging (BEST, TARGET, RUNS)
	------------------------------------------------
	UPDATE Field 		SET loadVersion = @taskid;
	UPDATE Target 		SET loadVersion = @taskid;
	UPDATE TargetInfo 	SET loadVersion = @taskid;
      END
    ------------------------------------------------
	IF @@error<>0
	    BEGIN
		SET @msg = 'Error in setting loadVersion'
		EXEC spEndStep @taskID, @stepID, 'ABORTING', @msg, @msg;
		RETURN(1);
	    END

	-- write phase log
	EXEC spNewPhase @taskid, @stepid, 'Set values', 'OK', 'loadVersion updated';
END

GO
/****** Object:  StoredProcedure [dbo].[spSetPhotoClean]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spSetPhotoClean] (@taskid int, @stepid int)
------------------------------------------------
--/H Update the clean photometry flag for point sources in PhotoObjAll
--/A -------------------------------------------
--/T The PhotoObjAll.clean value is 1 if certain conditions are
--/T met for point source objects.  This signifies our best 
--/T judgement of "clean" photometry for these objects.  The
--/T same logic is not applicable to extended objects.
------------------------------------------------
AS BEGIN
    SET NOCOUNT ON;
    DECLARE @rows bigint,
            @msg varchar(1000),
            @status varchar(10);
    -----------------------------------------------------
    -- give phase start message 
    SET @msg =  'Starting to set clean photometry flag'
    EXEC spNewPhase @taskID, @stepID, 'Set PhotoObjAll.clean', 'OK', @msg;
    -----------------------------------------------------
    -- first reset flag to 0
    UPDATE PhotoObjAll SET clean = 0
    -- now set the flag
    UPDATE Star		-- apply only to point sources
    SET clean=1		-- set "clean photometry" to true
    WHERE
      (
       psfmag_i>14.5 AND psfmag_i-extinction_i<21.0
      ) AND (
        -- BRIGHT cut
        -- *all* BRIGHT objects are bad, no matter what
        (flags & 0x2) = 0
      ) AND (
        -- EDGE cuts
        -- reject EDGE & (COSMIC_RAY | DEBLEND_NOPEAK)
        -- also reject (flags_x & EDGE and flags_x & NOPROFILE)
       not ((flags & 0x4) > 0 AND ((flags & 0x1000) > 0 OR (flags & 0x400000000000) > 0))
       AND not ((flags_u & 0x4) > 0 AND (flags_u & 0x80) > 0)
       AND not ((flags_g & 0x4) > 0 AND (flags_g & 0x80) > 0)
       AND not ((flags_r & 0x4) > 0 AND (flags_r & 0x80) > 0)
       AND not ((flags_i & 0x4) > 0 AND (flags_i & 0x80) > 0)
       AND not ((flags_z & 0x4) > 0 AND (flags_z & 0x80) > 0)
      ) AND (
        -- SATUR_CENTER cut
        -- SATUR_CENTER is worse than SATUR, reject those
        -- and deal with additional bad SATUR objects later
        -- not ((flags & 0x80000000000) > 0)
        -- that didn't work, just reject SATURATED outright
        -- {saturated outright is commented out, back to satur center}
       not ((flags & 0x80000000000) > 0)	--    not ((flags & 0x40000) > 0)
      ) AND (
        -- BLENDED cuts
        -- keep blended objects if they are also NODEBLEND and DEBLEND_PRUNED
       ((flags & 0x8) = 0) OR ( ((flags & 0x8) > 0) AND ((flags & 0x40) > 0) AND ((flags & 0x4000000) > 0) )
      ) AND not (
        -- at least *one* band should be a 3 sigma detection!
    --       psfmagerr_u>0.333 AND psfmagerr_g>0.333 AND psfmagerr_r > 0.333 AND psfmagerr_i > 0.333 AND psfmagerr_z > 0.333
    --   )
       -- PSF_FLUX_INTERP cuts (2 independent sets)
       -- PSF_FLUX_INTERP TOO_FEW_GOOD_DETECTIONS, INTERP_CENTER, COSMIC_RAY, NOPETRO
    --   AND not (
    	(flags & 0x800000000000) > 0 AND (flags & 0x1000000000000) > 0 AND (flags & 0x100000000000) > 0 AND (flags & 0x1000) > 0 AND (flags & 0x100) > 0
      )
       -- PSF_FLUX_INTERP TOO_FEW_GOOD_DETECTIONS DEBLENDED_AS_PSF INTERP NOPETRO CHILD
      AND not (
    	(flags & 0x800000000000) > 0 AND (flags & 0x1000000000000) > 0 AND (flags & 0x2000000) > 0 AND (flags & 0x20000) > 0 AND (flags & 0x100) > 0 AND (flags & 0x10) > 0 
      )
       -- {the next two are new}
      AND not (
    	(flags & 0x800000000000) > 0 AND (flags & 0x400000000000) > 0 AND (flags & 0x2000000) > 0 AND (flags & 0x40000) > 0 AND (flags & 0x20000) > 0 AND (flags & 0x1000) > 0 AND (flags & 0x100) > 0 AND (flags & 0x10) > 0
      )
      AND not (
        (flags & 0x400000000000) > 0 AND (flags & 0x40000) > 0 AND (flags & 0x10) > 0
      )
       -- DEBLEND_NOPEAK cuts (2 sets)
       -- Reject DEBLEND_NOPEAK, CHILD without a 5-sigma detection in any band
      AND not (
        (flags & 0x400000000000) > 0 AND (flags & 0x10) > 0 AND
        psfmagerr_u>0.2 AND psfmagerr_g>0.2 AND psfmagerr_r > 0.2 AND psfmagerr_i > 0.2 AND psfmagerr_z > 0.2
      )
       -- Reject TOO_FEW_GOOD_DETECTIONS DEBLEND_NOPEAK DEBLENDED_AS_PSF INTERP NOPETRO CHILD (just because)
      AND not (
        (flags & 0x400000000000) > 0 AND (flags & 0x1000000000000) > 0 AND (flags & 0x2000000) > 0 AND (flags & 0x20000) > 0 AND (flags & 0x100) > 0 AND (flags & 0x10) > 0
      )
       -- PEAKCENTER cut
       -- Reject PEAKCENTER DEBLEND_NOPEAK DEBLENDED_AS_PSF INTERP CHILD with large errors in all bands
      AND not (
        (flags & 0x20) > 0 AND (flags & 0x400000000000) > 0 AND (flags & 0x2000000) > 0 AND (flags & 0x20000) > 0 AND (flags & 0x10) > 0 AND
        psfmagerr_u>0.1 AND psfmagerr_g>0.1 AND psfmagerr_r>0.1 AND psfmagerr_i>0.1 and psfmagerr_z>0.1
      )
      -- {this one is new}
      AND not (
        (flags & 0x20) > 0 AND (flags & 0x40000) > 0 AND (flags & 0x10) > 0
      )
       -- NOTCHECKED cut (2 sets)
       -- Reject DEBLEND_NOPEAK DEBLENDED_AT_EDGE DEBLENDED_AS_PSF NOTCHECKED INTERP COSMIC_RAY NOPETRO CHILD
      AND not (
        (flags & 0x400000000000) > 0 AND (flags & 0x200000000000) > 0 AND (flags & 0x2000000) > 0 AND (flags & 0x80000) > 0 AND (flags & 0x20000) > 0 AND (flags & 0x1000) > 0 AND (flags & 0x100) > 0 AND (flags & 0x10) > 0	
      )
      AND not (
        (flags & 0x80000) > 0 AND (flags & 0x40000) > 0 AND (flags & 0x10) > 0	
      )
       -- Reject DEBLENDED_AT_EDGE DEBLENDED_AS_PSF NOTCHECKED INTERP CHILD
      AND not (
        (flags & 0x80000) > 0 AND (flags & 0x200000000000) > 0 AND (flags & 0x2000000) > 0 AND (flags & 0x20000) > 0 AND (flags & 0x10) > 0
      )
       -- {this one is new}
      AND not (
      (flags & 0x1000000000000) > 0 AND (flags & 0x2000000) > 0 AND (flags & 0x40000) > 0 AND (flags & 0x20000) > 0 AND (flags & 0x1000) > 0 AND (flags & 0x100) > 0 AND (flags & 0x10) > 0
      )
       -- For good measure, reject
       -- TOO_FEW_GOOD_DETECTIONS DEBLENDED_AT_EDGE STATIONARY DEBLENDED_AS_PSF INTERP COSMIC_RAY NOPETRO CHILD
      AND not (
        (flags & 0x1000000000000) > 0 AND (flags & 0x200000000000) > 0 AND (flags & 0x1000000000) > 0 AND (flags & 0x2000000) > 0 AND (flags & 0x20000) > 0 AND (flags & 0x1000) > 0 AND (flags & 0x100) > 0 AND (flags & 0x10) > 0
      )
       -- and objects with large errors and TOO_FEW_GOOD_DETECTIONS
      AND not (
        (flags & 0x1000000000000) > 0 AND
        psfmagerr_u>0.2 AND psfmagerr_g>0.2 AND psfmagerr_r>0.2 AND psfmagerr_i>0.2 AND psfmagerr_z>0.2
      )       
    -----------------------------------------------------
    --
    SELECT @rows = count_big(*) FROM PhotoObjAll WITH (nolock)
        WHERE clean=1
    IF @rows = 0
        BEGIN
            SET @status = 'WARNING';
            SET @msg = '0 rows with PhotoObjAll.clean=1'
        END
    ELSE
        BEGIN
            SET @status = 'OK';
            SET @msg = 'PhotoObjAll.clean updated: ' + cast(@rows as varchar(10)) + ' rows with clean=1'
        END
	-- give phase message telling of success.
    EXEC spNewPhase @taskID, @stepID, 'Set PhotoObjAll.clean', @status, @msg;
    -----------------------------------------------------
    RETURN(0);
END

GO
/****** Object:  StoredProcedure [dbo].[spSetValues]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spSetValues](@taskid int, @stepid int)
-------------------------------------------------------------
--/H Compute the remaining attributes after bulk insert
--/A
--/T Part of the loading process: it computes first
--/T the HTMID for the Frame table, then the easy magnitudes
--/T then sets the boundaries for a given chunk. Writes log
--/T into the loadadmin database.
-------------------------------------------------------------
AS
BEGIN
    --
    SET NOCOUNT On;
    --  
    DECLARE
	@msg varchar(1024),
	@status varchar(10),
	@type varchar(32),
	@count bigint,
	@ret int;

    -- get the Task type
    SELECT @type=type FROM loadsupport.dbo.Task
	WHERE taskid=@taskid;

    -- set the loadVersion
    EXEC @ret=dbo.spSetLoadVersion @taskid, @stepid, @type
    IF @ret>0	RETURN(1);

    ------------------------------------------------
    -- imaging data, one of (BEST, TARGET, RUNS)
    ------------------------------------------------
    ELSE
      IF (@type = 'PLATES')
	BEGIN
	  EXEC spNewPhase @taskid, @stepid, 'Set values', 'OK', 'Un-escaping commas in PlateX.designComments';
	  -- reinstate the commas in designComments that were escaped for CSV
	  UPDATE PlateX
	    SET designComments = REPLACE( designComments, '%2C', ',' )
	  EXEC spNewPhase @taskid, @stepid, 'Set values', 'OK', 'Done un-escaping commas in PlateX.designComments';
	  IF @@error<>0
	    BEGIN
		SET @msg = 'Error in updating PlateX.designComments'
		EXEC spEndStep @taskID, @stepID, 'ABORTING', @msg, @msg;
		RETURN(1);
	    END

	  EXEC spNewPhase @taskid, @stepid, 'Set values', 'OK', 'Setting PlateX htmID';
	  UPDATE PlateX 
	    SET htmId = dbo.fHtmXYZ( cx, cy, cz )
          IF @@error<>0
	    BEGIN
		SET @msg = 'Error in setting PlateX htmID'
		EXEC spEndStep @taskID, @stepID, 'ABORTING', @msg, @msg;
		RETURN(1);
	    END

	  EXEC spNewPhase @taskid, @stepid, 'Set values', 'OK', 'Setting SpecObjAll htmID and loadVersion';
	  UPDATE SpecObjAll 
	    SET htmId = dbo.fHtmXYZ( cx, cy, cz ),
		loadVersion = @taskid
	  IF @@error<>0
	    BEGIN
		SET @msg = 'Error in setting specobjall htmID and loadVersion'
		EXEC spEndStep @taskID, @stepID, 'ABORTING', @msg, @msg;
		RETURN(1);
	    END

	END

      ELSE
	IF (@type IN ('BEST','TARGET','RUNS'))
	  BEGIN
	    ------------------------------------------------------
	    -- set Simplified magnitudes of all objects, and
	    -- also compute the dereddened magnitudes
	    EXEC spNewPhase @taskid, @stepid, 'Set values', 'OK', 'Setting PhotoObjAll dereddened magnitudes, loadVersion and htmID';
	    UPDATE PhotoObjAll
	      SET
	 	dered_u = CASE WHEN modelMag_u=-9999 THEN modelMag_u
			  ELSE modelMag_u - extinction_u
			  END,
	 	dered_g = CASE WHEN modelMag_g=-9999 THEN modelMag_g
			  ELSE modelMag_g - extinction_g
			  END,
	 	dered_r = CASE WHEN modelMag_r=-9999 THEN modelMag_r
			  ELSE modelMag_r - extinction_r
			  END,
	 	dered_i = CASE WHEN modelMag_i=-9999 THEN modelMag_i
			  ELSE modelMag_i - extinction_i
			  END,
	 	dered_z = CASE WHEN modelMag_z=-9999 THEN modelMag_z
			  ELSE modelMag_z - extinction_z
			  END,
		/* the ugriz and Err_ugriz should not be set for SDSS-III
		Err_u   = modelMagErr_u,
		Err_g   = modelMagErr_g,
		Err_r   = modelMagErr_r,
		Err_i   = modelMagErr_i,
		Err_z   = modelMagErr_z,
		u 	= modelMag_u,
		g 	= modelMag_g,
		r 	= modelMag_r,
		i 	= modelMag_i,
		z 	= modelMag_z,
		*/
		htmId = dbo.fHtmXYZ( cx, cy, cz ),
		loadVersion = @taskid
           
	    --
	    IF @@error<>0
	      BEGIN
		SET @msg = 'Error in setting PhotoObjAll dereddened magnitudes, loadVersion and htmID'
		EXEC spEndStep @taskID, @stepID, 'ABORTING', @msg, @msg;
		RETURN(1);
	      END

	    -- log the success
	    EXEC spNewPhase @taskid, @stepid, 'Set values','OK','PhotoObjAll dereddened magnitudes, loadVersion and htmID set';

	    -- remove AtlasOutline rows in hole fields
	    DELETE AtlasOutline
	      WHERE objid IN 
		(SELECT m.objid FROM AtlasOutline m,
		    (SELECT fieldid FROM Field
			WHERE quality=5) q
		    WHERE (m.objid & 0xFFFFFFFFFFFF0000) = q.fieldid
		)
		
		-- Replace '%2C' with comma in AtlasOutine span string
		UPDATE AtlasOutline 
		SET span=REPLACE(span,'%2C',',' )
		
	    -- log the result
	    SET @msg = 'Deleted ' + cast(ROWCOUNT_BIG() as varchar(20))+
		+ ' rows from the AtlasOutline table in HOLE fields';
	    EXEC spNewPhase @taskid, @stepid, 'Set values', 'OK', @msg;
	    -----------------------------------------------------
	    EXEC spNewPhase @taskid, @stepid, 'Set values', 'OK', 'Starting Frame HTM computation';

	    -- now compute the htmid for the Frame table
	    EXEC @ret=dbo.spComputeFrameHTM
	    --
	    IF @@error<>0 OR @ret>0
	      BEGIN
		SET @msg = 'Error in spComputeFrameHTM'
		EXEC spEndStep @taskID, @stepID, 'ABORTING', @msg, @msg;
		RETURN(1);
	      END
	    -- write phase log
	    EXEC spNewPhase @taskid, @stepid, 'Set values', 'OK', 'Frame HTM computed';
	    -----------------------------------------------------
	    -- set TargetInfo.targetObjid

	    IF @type='TARGET'
	      BEGIN
		--
		EXEC @ret=dbo.spTargetInfoTargetObjid @taskid, @stepid
		--
		IF @@error<>0 OR @ret>0
		    BEGIN
			SET @msg = 'Error in spTargetInfoTargetObjid';

			EXEC spEndStep @taskID, @stepID, 'ABORTING', @msg, @msg;
			RETURN(1);
		    END
		-- write phase log
		EXEC spNewPhase @taskid, @stepid, 'Set values', 'OK', 'TargetInfo.targetObjid set';
	      END
	    --
	    ------------------------------------------------------
	    -- update the Mask table
	    UPDATE Mask
	      SET cx  = COS(RADIANS(dec))*COS(RADIANS(ra)), 
		cy  = COS(RADIANS(dec))*SIN(RADIANS(ra)),
		cz  = SIN(RADIANS(dec)),
		area = REPLACE(area,'"','');
	    --
	    UPDATE Mask
	      SET htmId = dbo.fHtmXYZ(cx,cy,cz);
	    --		
	    IF @@error<>0
	      BEGIN
		SET @msg = 'Error in Mask HTM update'
		EXEC spEndStep @taskID, @stepID, 'ABORTING', @msg, @msg;
		RETURN(1);
	      END
	    -- write phase log
	    EXEC spNewPhase @taskid, @stepid, 'Set values', 'OK', 'Mask HTM computed';
	    -----------------------------------------------------
	    EXEC @ret=dbo.spFillMaskedObject @taskid, @stepid;
	    IF @ret<>0 OR @@error<>0
	      BEGIN
		SET @msg = 'Error in MaskedObject update'
		EXEC spEndStep @taskID, @stepID, 'ABORTING', @msg, @msg;
		RETURN(@ret);
	      END	
	    EXEC @ret=dbo.spSetInsideMask @taskid, @stepid, 0;
	    IF @ret<>0 OR @@error<>0
	      BEGIN
		SET @msg = 'Error in InsideMask update'
		EXEC spEndStep @taskID, @stepID, 'ABORTING', @msg, @msg;
		RETURN(@ret);
	      END	
	      -----------------------------------------------------
	  END
	ELSE
	  IF (@type = 'APOGEE')
	    BEGIN
	      UPDATE apogeeStar
		SET htmID = dbo.fHtmEq(ra, dec)
	      IF @@error<>0
		BEGIN
		  SET @msg = 'Error in apogeeStar htmID update'
		  EXEC spEndStep @taskID, @stepID, 'ABORTING', @msg, @msg;
		  RETURN(1);
		END
		-- write phase log
		EXEC spNewPhase @taskid, @stepid, 'Set values', 'OK', 'apogeeStar htmID computed';
 	    END
END

GO
/****** Object:  StoredProcedure [dbo].[spSetVersion]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE PROCEDURE [dbo].[spSetVersion](@taskid int, @stepid int,
		@release varchar(8)='4', 
		@dbversion varchar(128)='v4_18', 
		@vname varchar(128)='Initial version of DR', 
		@vnum varchar(8)='.0',
                @vdesc varchar(128)='Incremental load',
                @vtext varchar(4096)=' ',
		@vwho varchar(128) = ' ')
---------------------------------------------------
--/H Update the checksum and set the version info for this DB.
--/A -------------------------------------------------
--/T 
--/T 
--/T 
--/T 
---------------------------------------------------
AS
BEGIN
	-- Check schema skew
	EXEC spCheckDBObjects
	EXEC spCheckDBColumns
	EXEC spCheckDBIndexes

	-- Update statistics for all tables
	EXEC spUpdateStatistics

	-- generate diagnostics and checksum
	EXEC spMakeDiagnostics
	EXEC spUpdateSkyServerCrossCheck
	EXEC spCompareChecksum

	DECLARE @curtime VARCHAR(64), @prev VARCHAR(32)

	SET @curtime=CAST( GETDATE() AS VARCHAR(64) );

	-- update SiteConstants table
        UPDATE siteconstants SET value='http://dr'+@release+'.sdss.org/' WHERE name='DataServerURL'
        UPDATE siteconstants SET value='http://skyserver.sdss.org/dr'+@release+'/en/' WHERE name='WebServerURL'
        UPDATE siteconstants SET value=@release+@vnum WHERE name='DB Version'
        UPDATE siteconstants SET value=@dbversion WHERE name='Schema Version'
        UPDATE siteconstants SET value='DR'+@release+' SkyServer' WHERE name='DB Type'
        UPDATE siteconstants SET comment='from Data Release '+@release+' of the Sloan Digital Sky Survey (http://www.sdss.org/dr'+@release+'/).' WHERE name='Description'

        -- get checksum from site constants and add new entry to Versions       
        DECLARE @checksum VARCHAR(64)
        SELECT @checksum=value FROM siteconstants WHERE [name]='Checksum'
        SELECT TOP 1 @prev=version from Versions order by convert (datetime,[when]) desc

	-- get checksum from site constants and add new entry to Versions
	SELECT @checksum=value FROM siteconstants WHERE [name]='Checksum'
	SELECT TOP 1 @prev=version from Versions order by convert (datetime,[when]) desc

	-- update Versions table with latest version
	INSERT Versions
		VALUES( @vname+@release,@prev,@checksum,@release+@vnum,
			@vdesc, @vtext, @vwho, @curtime)
END
GO
/****** Object:  StoredProcedure [dbo].[spSetWebServerUrl]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spSetWebServerUrl]( @siteName VARCHAR(32) )
------------------------------------------------------
--/H Set the WebServerUrl value in SiteConstants based on the given site name. 
--
--/T The WebServerUrl in the SiteConstants table is set to:
--/T           'http://cas.sdss.org/'+@siteName+'/en/'
--/T e.g.,
--/T           'http://cas.sdss.org/dr5/en/' 
--/T when @siteName = 'dr5'.
------------------------------------------------------
AS BEGIN
    UPDATE SiteConstants
	SET value='http://cas.sdss.org/collabdr5/en/'
	WHERE [name]='WebServerUrl'
    PRINT 'WebServerUrl set to http://cas.sdss.org/'+@siteName+'/en/'
END

GO
/****** Object:  StoredProcedure [dbo].[spShrinkDB]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spShrinkDB]
----------------------------------------------------
--/H RShrinks each of the database files to minimum size
--/A
--/T  Jim Gray, Oct 2004
--/T Largely copied from the DBCC books online
--------------------------------------------------------------------------
AS BEGIN 
    SET NOCOUNT ON;
    DECLARE
	@fileName nvarchar(1000), 
	@cmd nvarchar(1000);
    --
    DECLARE fileCursor cursor for select  Name from sysfiles
    OPEN fileCursor
    WHILE (1=1)
      BEGIN
	FETCH fileCursor INTO @fileName
	IF (@@Fetch_Status <> 0) BREAK
	SET @cmd = 'DBCC SHRINKFILE ( N''' + rtrim(@fileName) 
		+ ''' , 1)  WITH  NO_INFOMSGS '
	EXECUTE (@cmd)
	PRINT @cmd
      END
    CLOSE fileCursor
    DEALLOCATE fileCursor 
END

GO
/****** Object:  StoredProcedure [dbo].[spStartStep]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spStartStep] ( @taskid int, @stepid int OUTPUT, @stepname varchar(16), 
	@status varchar(16), @stepmsg varchar(2048), @phasemsg varchar(2048)
)
-----------------------------------------------------------------
--/H Wraps the loadsupport spStartStep procedure for local use
--/A
--/T If @taskid=0, only prints the message, and returns 1 as @stepid
-----------------------------------------------------------------
AS
BEGIN
	-------------------------------------------------
	SET NOCOUNT ON;
	--
	IF @taskid>0
	    EXEC loadsupport.dbo.spStartStep @taskid, @stepid OUTPUT, 
		@stepname, @status, @stepmsg, @phasemsg;
	ELSE
	    BEGIN
		EXEC spNewPhase @taskID, @stepID, 'STARTING', 'START', @phasemsg
		------------------------------------------------
		SET @stepid = 1;
	    END
END

GO
/****** Object:  StoredProcedure [dbo].[spSynchronize]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE PROCEDURE [dbo].[spSynchronize] (
	@taskid int, 
	@stepid int
)
-------------------------------------------------------------
--/H  Finish Spectro object (do photo Spectro matchup)
--/A --------------------------------------------------------
--/T <p> parameters:   
--/T <li> taskid int,   		-- Task identifier
--/T <li> stepid int	   		-- Step identifier
--/T <li> returns  0 if OK, non zero if something wrong  
--/T <br>
--/T Sample call:<br>
--/T <samp> 
--/T <br> exec  spSynchronize @taskid , @stepid  
--/T </samp> 
--/T <br>  
------------------------------------------------------------- 
AS BEGIN
	SET NOCOUNT ON
	------------------------------------------------------
	--- Globals
	DECLARE @start datetime,
		@ret int, 
		@cmd varchar(8000),
		@msg varchar(1024),
		@targetDBname varchar(1000),
		@rows  bigint,
		@ttDupCount int 
	SET @start  = current_timestamp;
	IF (@taskid != 0) EXEC loadsupport.dbo.spSetFinishPhase 'syncSpectro'
	------------------------------------------------------
	-- Put out step greeting.
	EXEC spNewPhase @taskid, @stepid, 'Synchronize', 'OK', 'spSynchronize called';
	------------------------------------------------------
	--- First set PhotoObjAll.specobjid to 0 
	BEGIN TRANSACTION
	    UPDATE p
		SET p.specobjid=0
		FROM PhotoObjAll p WITH (tablock)
		WHERE 
		    p.specobjid != 0
		OPTION (MAXDOP 1)	
	    SET  @rows = ROWCOUNT_BIG();
	COMMIT TRANSACTION
	SET  @msg = 'Set specobjid to 0 for ' + str(@rows) + ' PhotoObjAll rows.'
	EXEC spNewPhase @taskid, @stepid, 'Synchronize', 'OK', @msg;
	BEGIN TRANSACTION
	    UPDATE p
		SET p.specobjid=s.specobjid
		FROM PhotoObjAll p WITH (tablock)
		     JOIN SpecObjAll s ON p.objid=s.bestobjid
		WHERE
		    p.specobjid=0
		OPTION (MAXDOP 1)	
	    SET  @rows = ROWCOUNT_BIG();
	COMMIT TRANSACTION
	IF (@rows = 0)
	   SELECT @rows=COUNT(*) FROM PhotoObjAll WHERE specobjid != 0
	SET  @msg = 'Updated unset specObjID links for ' + str(@rows) + ' PhotoObjAll rows.'
	EXEC spNewPhase @taskid, @stepid, 'Synchronize', 'OK', @msg;
	-----------------------------------------------------
	EXEC spBuildSpecPhotoAll @taskid, @stepid

	-- generate completion message.
	SET @msg = 'spSynchronize finished in '  
	    + cast(dbo.fDatediffSec(@start, current_timestamp) as varchar(30))
	    + ' seconds';

	EXEC spNewPhase @taskid, @stepid, 'Synchronize', 'OK', @msg;
	------------------------------------------------------
	RETURN(0);
END	-- End spSynchronize()
GO
/****** Object:  StoredProcedure [dbo].[spSyncSchema]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE PROCEDURE [dbo].[spSyncSchema](@taskid int, @stepid int,
		@dbname varchar(128)='', @metadir varchar(128)='', 
		@sqldir varchar(128)='', @vbsdir varchar(128)='')
---------------------------------------------------
--/H Synchronizes the on-disk schema with the one in the pub db.
--/A -------------------------------------------------
--/T Reload the metadata tables and the schema files so that
--/T the schema in the pub db is synchronized with the version
--/T on disk (sqlLoader/schema/sql).  This is mainly needed
--/T for incremental loading.
---------------------------------------------------
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @err int, @ret int, 
	    @fname varchar(80), @status varchar(80), @dbtype varchar(32),
	    @msg varchar(1024), @cmd nvarchar(2048), @targ varchar(8);
    --
    SET @err = 0;
    SET @targ = '';
    EXEC loadsupport.dbo.spSetFinishPhase 'syncSchema'
    ------------------------------
    -- log the beginning
    ------------------------------
    SET @msg   = 'Starting schema synchronization for ' + @dbname ;
    IF @taskid > 0
	EXEC spNewPhase @taskid, @stepid, 
		'SyncSchema', 'OK', @msg;
    ELSE
	PRINT @msg;
    ------------------------------------
    IF @dbname = ''
	    SELECT @dbname=dbname, @dbtype=type 
		FROM loadsupport..Task WITH (nolock)
		WHERE taskid=@taskid;
    ELSE
	    SELECT @dbtype=type 
		FROM loadsupport..Task WITH (nolock)
		WHERE taskid=@taskid;

    IF @metadir = ''
        BEGIN	
	    SELECT @metadir=value 
		FROM loadsupport..Constants WITH (nolock)
		WHERE name='metadir';
	    SELECT @sqldir=value 
		FROM loadsupport..Constants WITH (nolock)
		WHERE name='sqldir';
	    SELECT @vbsdir=value 
		FROM loadsupport..Constants WITH (nolock)
		WHERE name='vbsdir';
	END
    --
    CREATE TABLE #sync (id int identity(1,1), s varchar(2048));
    IF @dbtype LIKE 'TARG%'
	SET @targ = 'targ';
    SET @cmd = N'type '+@sqldir+'xsyncschema' + @targ + '.txt';

    INSERT INTO #sync EXEC @ret=master.dbo.xp_cmdshell @cmd;
    -----------------------------------
    -- check for error 
    -----------------------------------
    IF EXISTS (select id from #sync where s like '%cannot find%')
      BEGIN
	SET @err    = 1;
	SET @status = 'WARNING';
	SET @msg    = 'Cannot find xsyncschema.txt file';
      END
    ELSE
      BEGIN
	SET @err    = 0;
	SET @status = 'OK';
	SET @msg    = 'Schema synced for ' + @dbname 
      END
    --
    IF @err = 0
	BEGIN
	    -------------------------------------------------------------------
	    -- cursor for file loop
	    -- ignore comments and blank lines, only consider *.sql file names
	    -------------------------------------------------------------------
	    DECLARE fc CURSOR READ_ONLY
		FOR SELECT s FROM #sync with (nolock)
		WHERE s LIKE '%.sql' 
		  and s not like '--%' 
		  and s is not null
		  order by id
	    ----------------------------------------------
	    OPEN fc
	    FETCH NEXT FROM fc INTO @fname
	    WHILE (@@fetch_status <> -1)
	    BEGIN
		IF (@@fetch_status <> -2)
		    EXEC @ret = spRunSQLScript @taskid, @stepid, 
			'SyncSchema', @sqldir, @fname;
		FETCH NEXT FROM fc INTO @fname
	    END
	    --
	    CLOSE fc
	    DEALLOCATE fc
	    ----------------------------------------------
	END
    ELSE
	BEGIN
	    EXEC @ret=dbo.spRunSQLScript @taskid, @stepid,
			'SyncSchema', @sqldir, 'IndexMap.sql' 
	    IF @ret != 0 
		BEGIN
		    SET @msg =  'Script ' + @sqldir + 'IndexMap.sql returned ' 
				+ cast(@ret as varchar(16));
		    IF @taskid>0
			EXEC spNewPhase @taskID, @stepID, 'SyncSchema','WARNING',@msg;
		    ELSE
			PRINT @msg;
		END
	END
    SET @err = @err+@ret;
    --
    SET @cmd = @vbsdir + 'runAll.bat ' + @vbsdir + ' ' + @targ;
    EXEC @ret=master.dbo.xp_cmdshell @cmd, no_output
    IF @ret != 0 
	BEGIN
	    SET @msg =  'Script ' + @vbsdir + 'runAll.bat returned ' 
			+ cast(@ret as varchar(16));
	    IF @taskid>0
		EXEC spNewPhase @taskID, @stepID, 'SyncSchema','WARNING',@msg;
	    ELSE
		PRINT @msg;
	END
    --
    SET @cmd = N'EXEC '+@dbname+'.dbo.spLoadMetaData '
	+ cast(@taskid as varchar(16)) + ', '
	+ cast(@stepid as varchar(16)) + ', '''
	+ @metadir + ''', 1';
    --
    EXEC @ret=sp_executesql @cmd;
    IF @ret = 0 
	BEGIN
	    -- give phase message telling of success.
	    SET @status = 'OK';
	    SET @msg =  'spLoadMetadata done';
	END
    ELSE
	BEGIN
	    SET @status = 'WARNING';
	    SET @msg =  'spLoadMetadata did not execute cleanly';
	END
    IF @taskid>0
	EXEC spNewPhase @taskID, @stepID, 'spSyncSchema', @status, @msg;
    ELSE
	PRINT 'spSyncSchema: ' + @msg;
    SET @err = @err+@ret;
    RETURN @err
END
GO
/****** Object:  StoredProcedure [dbo].[spTableCopy]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE PROCEDURE [dbo].[spTableCopy] (@sourceTable nvarchar(1000), @targetTable nvarchar(1000))
-------------------------------------------------------------
--/H Incremental copies @source to @target table based on ObjID range
--/A -------------------------------------------------------------
--/T <br>Copies about 100,000 rows at a time in a transaction. 
--/T <br>This avoids log overflow and is restartable.
--/T <br>The two tables should exist and have the same schema.
--/T <br>Both tables should have a primary clustring key on ObjID
--/T <br>If the max objID in the target table is not null (not an empty table)
--/T <br> then it is assumed that all source records less than that ObjID are already in the target.
--/T <p> parameters:  
--/T <li> @sourceTable 	nvarchar(1000), -- Source table: e.g. BestDr1.dbo.PhotoObj
--/T <li> @targetTable 	nvarchar(1000), -- Target table: e.g. temp.dbo.PhotoObj
--/T <br>
--/T Sample call to copy PhotoObj from BestDr1 to Temp
--/T <samp> 
--/T <br> exec spTableCopy N'bestDr1.dbo.PhotoObj',N'Temp.dbo.PhotoObj'
--/T </samp> 
--/T  
AS
BEGIN
	DECLARE @base 		bigint, 		-- copy from this objID  
	        @limit 		bigint, 		-- to @limit ObjID
	        @delta 		bigint, 		-- the objID range to copy
	        @i 		int, 			-- transaction counter 
	        @rows 		bigint, 		-- rows copied so far
	        @deltaRows 	bigint,			-- rows copied in this step
		@minBaseCmd  	nvarchar(1000),		-- SQL command to compute min ObjID to copy
		@CopyCmd  	nvarchar(1000)		-- actual copy command
	
	------------------------------
	-- initalize loop variables
	------------------------------
	SET @i 		= 0				-- transaction count = 0	
	set @rows 	= 0				-- no rows moved yet
	set @delta 	= 1000000			-- move less than 1M rows at a time 
	set @base 	= 0 				-- base ObjID
	
	--------------------------------
	-- this is the top of the loop
	again:
	
	if (@@trancount > 0 ) commit transaction
	begin transaction

	----------------------------------------------
	-- Compute the starting ObjID for the copy.
	-- It should be bigger than the largest objID 
	-- in the target table.
	----------------------------------------------
	set @minBaseCmd = 'select @base = coalesce(max(objID),0) from ' + @targetTable 
 	exec sp_executesql  @minBaseCmd,   N'@base  bigint OUTPUT',  @base OUTPUT
	------------------------------------------------------
	-- this looks in source and gets the next larger objID
	------------------------------------------------------
	set @minBaseCmd = 'select @base = min(objID) from ' + @sourceTable + ' where objID > @base'
 	exec sp_executesql  @minBaseCmd,   N'@base  bigint OUTPUT',  @base OUTPUT
	---------------------------------------------------------	
	-- exit the loop and return if there is no such objectID
	---------------------------------------------------------
	if @base is null 
		begin
		commit transaction
		return
		end

	----------------------------------------
	-- OK, we have base, set limit and 
	-- do the copy as one transaction
	----------------------------------------
	set @limit = @base + @delta
	set @CopyCmd =  ' insert ' +  @targetTable +
			' select * from ' + @sourceTable  +
			' where objID between @base and @limit'
	exec sp_executesql  @CopyCmd,   N'@base bigint, @limit bigint',  @base, @limit  	
	set @deltaRows = @@rowcount
	set @rows = @rows + @deltaRows
	
	--------------------------------------------------------
	-- copy complete, commit transaction and print message 
	--------------------------------------------------------
	COMMIT TRANSACTION
	IF (@@trancount > 0 ) COMMIT TRANSACTION
	PRINT 'did transaction: ' + str(@i) 
				+ ' base: '  + cast(@base  as varchar(25)) 
				+ ' limit: ' + cast(@limit as varchar(25)) 
				+ ' Rows: '  + cast(@rows  as varchar(25))	
	------------------------------
	-- go to the top of the loop. 
	------------------------------
	goto again
END
GO
/****** Object:  StoredProcedure [dbo].[spTargetInfoTargetObjID]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spTargetInfoTargetObjID] (
	@taskid int, 
	@stepid int 
)
-------------------------------------------------------------
--/H Set TargetInfo.targetObjID
--/A 
--/T Connect TargetInfo to photo objects in Target 
--/T Designed to run in the target database.
--/T <p> parameters:   
--/T <li> taskid int,   		-- Task identifier
--/T <li> stepid int,   		-- Step identifier
--/T <br>
--/T Sample call   <br>
--/T <br> <samp> 
--/T exec spTargetInfoTargetObjID @taskid , @stepid  
--/T </samp> 
--/T <br>  
------------------------------------------------------------- 
AS BEGIN
	SET NOCOUNT ON;
	DECLARE @rows bigint,
		@msg varchar(1000),
		@status varchar(10),
		@mode tinyint,
		@firstfieldbit bigint;
	SET @firstfieldbit = dbo.ffirstfieldbit();
	-----------------------------------------------------
	-- give phase start message 
	SET @msg =  'Starting to set TargetInfo.targetObjID'
	EXEC spNewPhase @taskID, @stepID, 'Set TargetInfo.TargetObjID', 'OK', @msg;
	-----------------------------------------------------
	-- 
	SET @mode = 1;
	WHILE (@mode <= 4)
	BEGIN
		UPDATE TargetInfo
			SET targetObjId = p.objid, targetMode = @mode
			FROM TargetInfo t, PhotoObjAll p
			WITH (nolock)
			WHERE t.targetobjid = 0
			AND t.targetId = p.objid
			AND p.mode = @mode
		--
		UPDATE TargetInfo
			SET targetObjId = p.objid, targetMode = @mode
			FROM TargetInfo t, PhotoObjAll p
			WITH (nolock)
			WHERE t.targetobjid = 0
			AND p.objid = t.targetId + @firstfieldbit
			AND p.mode = @mode
		SET @mode = @mode + 1;
	END
	-----------------------------------------------------
	--
	SELECT @rows = count_big(*) FROM TargetInfo WITH (nolock)
		WHERE targetObjid = 0
	IF @rows > 0
	    BEGIN
		SET @status = 'WARNING';
		SET @msg = cast(@rows as varchar(20))+' rows with TargetInfo.targetobjid=0'
	    END
	ELSE
	    BEGIN
		SET @status = 'OK';
		SET @msg = 'TargetInfo.targetobjid updated'
	    END
	-- give phase message telling of success.
	EXEC spNewPhase @taskID, @stepID, 'Set TargetInfo.targetObjID', 'OK', @msg;
	-----------------------------------------------------
	RETURN(0);
END

GO
/****** Object:  StoredProcedure [dbo].[spTestForeignKey]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spTestForeignKey](
	@taskid int, 
	@stepid int,
	@SourceTable varchar(256), 
	@DestinationTable varchar(256), 		
	@field varchar(256), 
	@error bigint OUTPUT
)
-------------------------------------------------------------
--/H Tests a foreign key, gives error if test finds an orphan record
--/A 
--/T spTestForeignKey (taskID, stepID, sourceTable, targetTable, key, error output)
--/T
--/T    tests to see that all values in sourceTable(key) are in targetTable(key)
--/T  
--/T    Returns @error = 0 if foreigh key is OK
--/T		@error >0  if foreign key has a mismatch (in which case it is the count.
--/T
--/T In the failure case it inserts messages in the load measage log 
--/T  describing the first 10 distinct failing keys. 
--/T
--/T <p> parameters:  
--/T <li> taskid int,   		-- Task identifier
--/T <li> stepid int,   		-- Step identifier
--/T <li> SourceTable varchar() NOT NULL, -- name of source table to test
--/T <li> destinationTable varchar() NOT NULL, -- name of destination table to test  
--/T <li> key varchar() NOT NULL,   	-- name of foreign key in table to test
--/T <li> error int NOT NULL,         	-- output: 0 if OK (is a foreign key), non zero find orphan
--/T <br>
--/T Sample call to test that PhotoProfile.Objid is a foreign key to photoObjAll <br>
--/T <samp> 
--/T <br> exec spTestForeignKey @taskid, @stepID, 'PhotoProfile', 'photoObjAll','ObjID',  @error output
--/T </samp> 
--/T <br> see also spGenericTest, spTestPrimaryKey, 
-------------------------------------------------------------
AS BEGIN
	SET NOCOUNT ON
	DECLARE @errorMsg varchar(1000), @command varchar(1000);

	-- if test table left over from previous tests, drop it.
	IF EXISTS (SELECT [name]FROM   sysobjects 
		WHERE  [name]= N'test' )
		DROP TABLE test; 

	-- the foreign key test populates test table with failing keys.
	SET @command = 'select distinct ' + @field  
 		+ ' into test ' 
		+ ' from ' + @SourceTable  
		+ ' where ' + @field + ' not in ' 
  		+ '    (select ' + @field + ' from ' + @DestinationTable + ')';
	--print @command;
	EXEC (@command)

	-- if test table is not empty, we have a problem.
	SELECT @error = count_big(*) FROM test;
	IF (@error > 0) 
	    BEGIN
		SET @errorMsg = 'Foreign key test test failed: ' + cast(@error as varchar (10)) 
			+ ' times on  table ' 
			+ @sourceTable + '(' + @field + ') ->' + @DestinationTable      
		EXEC spNewPhase @taskid, @stepid, 'Foreign key test', 'ERROR', @errorMsg 
	    END
	ELSE		-- if test is empty, then test passed.
	    BEGIN
		SET @errorMsg = 'Foreign key test passed on table: ' 
			+ @sourceTable + '(' + @field + ') ->' + @DestinationTable      
	    	EXEC spNewPhase @taskid, @stepid, 'Foreign key test',  'OK', @errorMsg 
	    END

	-- clean up (drop test table) and return.
	DROP TABLE test 
	RETURN @error
END		-- End spTestForeignKey()

GO
/****** Object:  StoredProcedure [dbo].[spTestHtm]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spTestHtm](
	@taskid int, @stepid int,
	@Table varchar(256), 		
	@error bigint OUTPUT
)
-------------------------------------------------------------
--/H Tests 1000 htms to see if they match the "local" algorithm
--/A 
--/T <p> parameters:  
--/T <li> taskid int,   		-- Task identifier
--/T <li> stepid int,   		-- Step identifier
--/T <li> table varchar() NOT NULL,   	-- name of source table to test the htm field
--/T <li> errorMsg varchar() NOT NULL,  -- error message if key not unique
--/T <br>
--/T  Tests 100 Table(htmID) to match SkyServer function
--/T  
--/T      Returns @error = 0 if almost all keys match  
--/T		@error > 0  more than 1% of keys needed fixing.
--/T
--/T      In the failure case it inserts messages in the load measage log 
--/T      describing the first 10 failing htmIDs. 
--/T
--/T Sample call to test photoObjAll.htm <br>
--/T <samp> 
--/T <br> exec spTestHtm @taskid , @stepid, 'photoObjAll',  @error output
--/T </samp> 
--/T <br> see also spGenericTest, spTestPrimaryKey, 
-------------------------------------------------------------
AS BEGIN
	SET NOCOUNT ON;
	DECLARE @errorMsg varchar(1000), @errorVerb varchar(16),
		@mismatch bigint, @command varchar(1000);

	-- The test table holds the stored and computed HTM IDs
	IF ((select count_big(*) from dbo.sysobjects where [name] like  N'test') > 0) 
		DROP TABLE test; 
	-- Populate the test table
	SET @command =  'select top 100 HtmID as HTMstored ,'  
--		+  ' dbo.fHTMLookup(''J2000 20 '' + str(ra,15,9) + str(dec,15,9)) as HTMcomputed '
		+  ' dbo.fHtmEq(ra,dec) as HTMcomputed '
 		+  ' into test' 
		+  ' from ' + @Table
	EXEC (@command);
 	
	-- if count the number of times HTMstored != HTMcomputed
	SELECT @error = count_big(*) 
	   FROM test
	   WHERE HTMstored != HTMcomputed
 
	-- If count is non-zero we have a problem
 	IF (@error > 0)  
	    BEGIN
		SET @errorVerb = case when @error < 10 then 'WARNING' else 'ERROR' end 
   		SET @errorMsg = 'HTM test failed on '+ cast(@error as varchar(30)) 
			+ ' of 1000 HTM IDs in table ' + @Table + '(htmID)'      
	   	EXEC spNewPhase @taskid, @stepid, 'HTM test', 'ERROR', @errorMsg 
		IF @error < 10 SET @error = 0;
    	    END 
	ELSE	-- if count is zero, evrything is wonderful.
   	    BEGIN
	   	SET @errorMsg = 'HTM test passed on table: ' + @Table     
	    	EXEC spNewPhase @taskid, @stepid, 'HTM test', 'OK', @errorMsg 
	    END
 	--
	DROP TABLE test 
	RETURN @error
END		-- End spTestHtm()

GO
/****** Object:  StoredProcedure [dbo].[spTestPhotoParentID]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spTestPhotoParentID] (@taskid int, @stepid int)
-------------------------------------------------------------
--/H Tests that photoObjAll.nChild matches the number of children of each PhotoObj
--/A 
--/T Test that a parent with nChild has in fact n Children
--/T <p> parameters:  
--/T <li> taskid int,   		-- Task identifier
--/T <li> stepid int,   		-- Step identifier
--/T <li> returns  0 if OK (nChild is correct), non zero if nChild is wrong  
--/T <br>
--/T Sample call   <br>
--/T <samp> 
--/T <br> exec @error = spTestPhotoParentID @taskid , @stepid 
--/T </samp> 
--/T <br> see also spGenericTest, spTestPrimaryKey, 
-------------------------------------------------------------  
AS BEGIN
	SET NOCOUNT ON
	DECLARE @error int, @errorMsg varchar(100)
	SET @error = 0

	--===========================================================================
	--- Find 100 parents and their kid counts and store them in the parents table
	-- if test table left over from previous tests, drop it.
	IF EXISTS (SELECT [name]FROM   sysobjects 
		WHERE  [name]= N'ValidatorParents' )
		DROP TABLE ValidatorParents; 
	CREATE TABLE ValidatorParents ( objID bigint not null primary key, 
			nChild bigint not null, 
			nChildActual bigint null   -- note: allows nulls
		);
	
	-- find first 100 parents
	INSERT ValidatorParents
		SELECT TOP 100 objID, nChild, 0
		FROM photoObjAll
		WHERE nChild != 0
		ORDER BY ObjID

	-- if there are less than 100 parents, something is wrong.
	IF (rowcount_big() < 100)
	    BEGIN
		SET @errorMsg = 'Photo Parent Test failed: less than 100 parents in this run, something is wrong '
	   	EXEC spNewPhase @taskid, @stepid, 'Photo Parent test', 'ERROR', @errorMsg   
	   	GOTO bottom
	    END

	-- index the photoObjAll.Parent records to make the following join go fast.
	IF EXISTS (SELECT * from sysindexes where name = 'Parent' and id = object_id( 'photoObjAll')) 
			DROP INDEX photoObjAll.Parent
	CREATE UNIQUE INDEX Parent ON photoObjAll(parentID, objID)

	-- compute the actual kid population
	UPDATE ValidatorParents
	SET nChildActual =  (
		select count_big(*)
		from photoObjAll kid  
		where kid.parentID = ValidatorParents.objID
--		group by ValidatorParents.objID)
-- replaced this with group by on kid.parentID for sql2k5
		group by kid.parentID)

	-- now test to make sure that there are 100 good ones
	DECLARE @pop bigint
	SET @pop = (	select count_big(*) 
			from ValidatorParents
			where nChild != coalesce(nChildActual,0))
	-- if there are some parents with the wrong counts then...
	IF (@pop != 0) 	
	    BEGIN
		SET @errorMsg = 'photoObjAll Parent test failed: ' + cast(@pop as varchar (10)) + ' times out of 100'
   		EXEC spNewPhase @taskid, @stepid, 'Photo Parent test', 'ERROR', @errorMsg   
		SET @error = 1;
   	    END
	ELSE	-- if all the parents have the right counts...
	    BEGIN
		SET @errorMsg = 'photoObjAll Parent test succeeded'  
   		EXEC spNewPhase @taskid, @stepid, 'Photo Parent test', 'OK', @errorMsg   
		SET @error = 0;
   	    END

    -- common exit
    bottom: 
	-- clean up indices we created.
	DROP TABLE ValidatorParents
	IF EXISTS (SELECT * from sysindexes where name = 'Parent' and id = object_id( 'photoObjAll')) 
			DROP INDEX photoObjAll.Parent
	-- return status.
	RETURN @error
END			-- End spTestPhotoParentID()

GO
/****** Object:  StoredProcedure [dbo].[spTestQueries]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--
CREATE PROCEDURE [dbo].[spTestQueries](@n int, @comment varchar(100))
----------------------------------------------------------------------
--/H Runs the standard 37 SDSS queries and records their performance in QueryResults. 
--/A 
--/A Each querie's cpu time, elapsed time, physical IOs, and rows found is recorded. 
--/A In the end a statistical report is printed to sysOut. 
--/T  parameters are:
--/T	  <li> @n					The number of times to repeat the query run. 
--/T  <br>
--/T  <samp>
--/T  run the queries ten times:
--/T  <br>exec spTestQueries 10
--/T  </samp><p>
 
---------------------------------------------------
AS
BEGIN
	set nocount on
	-- Change History
	-- Query 1 change fGetNearbyObjEq(185,-0.5, 1) 
	--              to fGetNearbyObjEq(260,60, 1)
	-- Query 2 change ra between 170 and 190 and dec < 0 
	--             to ra between 193 and 197 and dec < 60
	--             to fit in personal best region. 
	-- Query 10A: there are 20 candidates with weak Halpha lines, but none qualify(Halpha/Hbeta > 20)
	-- Query 12: fixed rectangle to fit within personal BestDr2 region ('RECT J2000 193 5 197 -5')
	-- Query 12: added radians() for the cos()
	------------------------------------------------------------------------
	declare @cpu			bigint, 
			@physical_io	bigint, 
			@clock			datetime, 
			@elapsed		bigint,
			@i				bigint,
			@startTime		dateTime;
	------------------------------------------------------------------------
	-- Do the query set @n times. 	
	set @i = 1;
	set @startTime = getdate();
	while (@i <= @n)
		begin
 		DBCC DROPCLEANBUFFERS WITH NO_INFOMSGS 
 		--=====================================================================
		--Query 1: Find all galaxies without saturated pixels 
		--        within 1' of a given point of ra=75.327, dec=21.023
		exec spTestTimeStart  @clock OUTPUT, @cpu OUTPUT, @physical_io OUTPUT
		---------------------------------------------------------------------------
		declare @saturated bigint;							-- initialized “saturated” flag
		set     @saturated = dbo.fPhotoFlags('saturated');	-- avoids SQL2K optimizer problem
		select	G.objID, GN.distance  				-- return Galaxy Object ID and 
	  	into 	##results1   					-- angular distance (arc minutes)
		from 	Galaxy                     as G  		-- join Galaxies with
		join	fGetNearbyObjEq(195,2.5, 1) as GN             	-- objects within 1’ of ra=195 & dec=2
						on G.objID = GN.objID	-- connects G and GN
		where (G.flags & @saturated) = 0  			-- not saturated
		order by distance					-- sorted nearest first
		---------------------------------------------------------------------------
		exec spTestTimeEnd @clock, @elapsed, @cpu, @physical_io, 'Q01', @comment, 1, 1, @@RowCount 
		drop table ##results1
		--=====================================================================
 		DBCC DROPCLEANBUFFERS WITH NO_INFOMSGS  
		--=====================================================================
		--Query 2: Find all galaxies with blue surface brightness between and 23 and 25 mag 
		--         per square arcseconds, and -10<super galactic latitude (sgb) <10, 
		--         and declination less than zero. 
		exec spTestTimeStart  @clock OUTPUT, @cpu OUTPUT, @physical_io OUTPUT
		select ObjID
		into ##results2
		from Galaxy
		where mRrCc_r > 0			-- make sure the log is OK (size = SQRT(mRrCc_r/2.0))
		and 5*log10(SQRT(ABS(mRrCc_r)/2.0)*0.992574664)+modelMag_g between 23 and 25 -- surface brightness in g
		and ra between 150 and 270 	-- live with ra/dec till we get galactic coordinates
		and dec < 60 			-- declination less than 60.
		-- 0.39598* sqrt(2 *PI()) = 0.992574664 is the conversion from pixels to arcsec. 
		-- sqrt(2*PI()) is there for the area of a circular aperture.
		---------------------------------------------------------------------------
		exec spTestTimeEnd @clock, @elapsed, @cpu, @physical_io, 'Q02', @comment, 1, 1, @@RowCount   
		drop table ##results2
		--=====================================================================
		DBCC DROPCLEANBUFFERS WITH NO_INFOMSGS  
		--=====================================================================
		--Query 3: Find all galaxies brighter than magnitude 22, 
		--         where the local extinction is >0.75. 
		exec spTestTimeStart  @clock OUTPUT, @cpu OUTPUT, @physical_io OUTPUT
		---------------------------------------------------------------------------
		select objID				-- put objIDs into ##results
		into ##results3
		from Galaxy G    			-- join Galaxies with Extinction table
		where  	r < 22 				-- where brighter than 22 magnitude
		and  	extinction_r> 0.120  		-- extinction more than 0.175
		---------------------------------------------------------------------------
		exec spTestTimeEnd @clock, @elapsed, @cpu, @physical_io, 'Q03', @comment, 1, 1, @@RowCount 
		drop table ##results3
		--=====================================================================
		DBCC DROPCLEANBUFFERS WITH NO_INFOMSGS  
/*
		--=====================================================================
		--Query 4: Find galaxies with an isophotal surface brightness (SB) 
		--         larger than 24 in the red band, with an ellipticity>0.5, 
		--         and with the major axis of the ellipse having a declination 
		--         of between 30” and 60”arc seconds.
		exec spTestTimeStart  @clock OUTPUT, @cpu OUTPUT, @physical_io OUTPUT
		---------------------------------------------------------------------------
		select ObjID		   	 -- put the qualifying galaxies in a table
		into ##results4
		from Galaxy       		 -- select galaxies   
		where r + rho < 24   	    	 -- brighter than magnitude 24 in the red spectral band  
		and  isoA_r between 30 and 60  -- major axis between 30" and 60"
		and  (power(q_r,2) + power(u_r,2)) > 0.25 -- square of ellipticity is > 0.5 squared. 
		--------------------------------------------------------------------------
		exec spTestTimeEnd @clock, @elapsed, @cpu, @physical_io, 'Q04', @comment, 1, 1, @@RowCount 
		drop table ##results4
		--=====================================================================
		DBCC DROPCLEANBUFFERS WITH NO_INFOMSGS  
*/
		--=====================================================================
		--Query 5: Find all galaxies with a deVaucouleours profile (r¼ falloff 
		--         of intensity on disk) and the photometric colors consistent 
		--         with an elliptical galaxy.     NO COLOR TESTS YET
		exec spTestTimeStart  @clock OUTPUT, @cpu OUTPUT, @physical_io OUTPUT
		---------------------------------------------------------------------------
		declare @binned    bigint;			 	-- initialized “binned” literal
		set     @binned = 	dbo.fPhotoFlags('BINNED1') +	-- avoids SQL2K optimizer problem
   					dbo.fPhotoFlags('BINNED2') +
   					dbo.fPhotoFlags('BINNED4') ;
		declare @blended   bigint;			 	-- initialized “blended” literal
		set     @blended = 	dbo.fPhotoFlags('BLENDED');  	-- avoids SQL2K optimizer problem
		declare @noDeBlend bigint;			 	-- initialized “noDeBlend” literal
		set     @noDeBlend = 	dbo.fPhotoFlags('NODEBLEND'); -- avoids SQL2K optimizer problem
		declare @child     bigint;			 	-- initialized “child” literal
		set     @child = 	dbo.fPhotoFlags('CHILD');  	-- avoids SQL2K optimizer problem
		declare @edge      bigint;			 	-- initialized “edge” literal
		set     @edge = 	dbo.fPhotoFlags('EDGE');  	-- avoids SQL2K optimizer problem
		--declare @saturated bigint;			 	-- initialized “saturated” literal
		--set     @saturated = 	dbo.fPhotoFlags('SATURATED'); -- avoids SQL2K optimizer problem
		select objID
		into ##results5  
		from Galaxy as G 		-- count galaxies
		where	lnlDev_r > log(.1) + lnlExp_r -- red DeVaucouler fit likelihood greater than disk fit 
		and 	lnlExp_r > 0		-- exponential disk fit likelihood in red band > 0
		-- Color cut for an ellipical galaxy courtesy of James Annis of Fermilab
		and (G.flags & @binned) > 0  
		and (G.flags & ( @blended + @noDeBlend + @child)) != @blended
		and (G.flags & (@edge + @saturated)) = 0  
		and G.petroMag_i > 17.5
		and (G.petroMag_r > 15.5 OR G.petroR50_r > 2)
		and (G.petroMag_r < 30 and G.g < 30 and G.r < 30 and G.i < 30)
		and ((G.petroMag_r-G.extinction_r) < 19.2
		and ((G.petroMag_r - G.extinction_r) < (13.1 +     	-- deRed_r < 13.1 +
							(7/3)*(G.g - G.r) + 		-- 0.7 / 0.3 * deRed_gr
								4 *(G.r - G.i) -4 * 0.18 )) 	-- 1.2 / 0.3 * deRed_ri          
					and (( G.r - G.i - (G.g - G.r)/4 - 0.18) BETWEEN -0.2 AND  0.2 ) 
					)
			or (((G.petroMag_r - G.extinction_r) < 19.5 )
					and (( G.r - G.i -(G.g - G.r)/4 -.18) >    -- - deRed_gr/4 - 0.18 -- cperp = deRed_ri             
								(0.45 - 4*( G.g - G.r)))  	-- 0.45 - deRed_gr/0.25
					and ((G.g - G.r) > ( 1.35 + 0.25 *(G.r - G.i)))          
					) 
		---------------------------------------------------------------------------
		exec spTestTimeEnd @clock, @elapsed, @cpu, @physical_io,'Q05', @comment, 1, 1, @@RowCount 
		drop table ##results5
		--=====================================================================
		DBCC DROPCLEANBUFFERS WITH NO_INFOMSGS  
		--=====================================================================
		--Query 6: Find galaxies that are blended with a star, output the 
		--         deblended galaxy magnitudes.   
		exec spTestTimeStart  @clock OUTPUT, @cpu OUTPUT, @physical_io OUTPUT
		---------------------------------------------------------------------------
		select G.ObjID, G.u,G.g,G.r,G.i,G.z  			-- output galaxy and magnitudes.
		into   ##results6
		from 	Galaxy G, Star S  				-- for each galaxy and star
		where	G.parentID > 0					-- galaxy has a “parent”
		and   G.parentID = S.parentID				-- star has the same parent 
		---------------------------------------------------------------------------
		exec spTestTimeEnd @clock, @elapsed, @cpu, @physical_io, 'Q06', @comment, 1, 1, @@RowCount 
		drop table ##results6
		--=====================================================================
		DBCC DROPCLEANBUFFERS WITH NO_INFOMSGS  
		--=====================================================================
		--Query 7: Provide a list of star-like objects that are 1% rare.   
		exec spTestTimeStart  @clock OUTPUT, @cpu OUTPUT, @physical_io OUTPUT
		-----------------------------------------------------------------------
		select 	cast(round((u-g),0) as int) as UG, 
			cast(round((g-r),0) as int) as GR, 
			cast(round((r-i),0) as int) as RI, 
			cast(round((i-z),0) as int) as IZ,
			count(*) as pop
		into 	##results7 
		from 	Star
		where (u+g+r+i+z) < 150   -- exclude bogus magnitudes (== 999) 
		group by cast(round((u-g),0) as int), cast(round((g-r),0) as int), 
 				cast(round((r-i),0) as int), cast(round((i-z),0) as int) 
		order by count(*)   
		-- without the having clause, found  14,681 buckets, 
		-- first 140 buckets have 99%  time 104 seconds
		-- So, used having as a filter to return rare stars.
		--Common bucktes have 500 or more members, so delete them.
		delete  ##results7
		where pop > 500   
		/*
		select top 100 distinct dbo.fPhotoDescription(objID) as info  
		from  Star s,
			##results f
		where f.ug = round((s.u-s.g),0) 
		and f.gr = round((s.g-s.r),0)
		and f.ri = round((s.r-s.i),0)
		and f.iz = round((s.i-s.z),0)  */
		--------------------------------------------------------------------------
		exec spTestTimeEnd @clock, @elapsed, @cpu, @physical_io, 'Q07', @comment, 1, 1, @@RowCount 
		drop table ##results7
		--=====================================================================
		DBCC DROPCLEANBUFFERS WITH NO_INFOMSGS  
		--=====================================================================
		--Query 8:  Find all objects with unclassified spectra.   
		exec spTestTimeStart  @clock OUTPUT, @cpu OUTPUT, @physical_io OUTPUT
		---------------------------------------------------------------------------
		select specObjID
		into   ##results8
		from   SpecObj
		where  class = 'UNKNOWN'  
		--------------------------------------------------------------------------
		exec spTestTimeEnd @clock, @elapsed, @cpu, @physical_io,'Q08', @comment, 1, 1, @@RowCount 
		drop table ##results8
		--=====================================================================
		DBCC DROPCLEANBUFFERS WITH NO_INFOMSGS  
		--=====================================================================
	/*	--Query 9:  Find quasars with a line width >2000 km/s and 2.5<redshift<2.7.   
		exec spTestTimeStart  @clock OUTPUT, @cpu OUTPUT, @physical_io OUTPUT
		---------------------------------------------------------------------------
		select  s.specObjID, max(l.sigma*300000.0/l.wave) kmps,  avg(s.z) as z  
		into    ##results9 
		from    SpecObj s, specLine l          -- from the spectrum table. 
		where  s.specObjID=l.specObjID 
		and  (s.class = 'QSO')    -- quasar 
		and  s.z between 2.5 and 2.7   -- redshift of 2.0 to 2.2
		and  l.sigma*300000.0/l.wave >2000.0     -- convert sigma to km/s         
		-- and  s.zConf > 0.9                     -- high confidence on redshift estimate 
		group by s.specObjID
		--------------------------------------------------------------------------
		exec spTestTimeEnd @clock, @elapsed, @cpu, @physical_io, 'Q09', @comment, 1, 1, @@RowCount 
		drop table ##results9
		--=====================================================================
		DBCC DROPCLEANBUFFERS WITH NO_INFOMSGS  
		--=====================================================================
		--Query 10:  Find galaxies with spectra that have an equivalent width in Ha >40Å 
		exec spTestTimeStart  @clock OUTPUT, @cpu OUTPUT, @physical_io OUTPUT
		---------------------------------------------------------------------------
		select G.ObjID 			-- return qualifying galaxies
		into  ##results10
		from	Galaxy   as G, 			-- G is the galaxy
 			SpecObj    as S, 		-- S is the spectra of galaxy G
 			SpecLine   as L,		-- L is a line of S
			specLineNames as LN		-- the names of the lines
		where G.ObjID = S.BestObjID 		-- connect the galaxy to the spectrum    
		and S.SpecObjID = L.SpecObjID		-- L is a line of S.
		and L.LineId = LN.value			-- L is the H alpha line
		and LN.name =  'Ha_6565'   
		and L.ew > 40				-- H alpha is at least 40 angstroms wide. 
		exec spTestTimeEnd @clock, @elapsed, @cpu, @physical_io,'Q10', @comment, 1, 1, @@RowCount 
		drop table ##results10
		--=====================================================================
		DBCC DROPCLEANBUFFERS WITH NO_INFOMSGS  
		--=====================================================================
		--Query 10A: That was easy, so lets also find objects with a weak Hbeta 
		--   line (Halpha/Hbeta > 20.)
		exec spTestTimeStart  @clock OUTPUT, @cpu OUTPUT, @physical_io OUTPUT
		---------------------------------------------------------------------------
		select G.ObjID 				-- return qualifying galaxies
		into  ##results10A
		from	Galaxy   as G, 			-- G is the galaxy
 			SpecObj    as S, 		-- S is the spectra of galaxy G
 			SpecLine   as L1, 		-- L1 is a line of S
			SpecLine   as L2,		-- L2 is a second line of S
			specLineNames as LN1,		-- the names of the lines (Halpha)
			specLineNames as LN2		-- the names of the lines (Hbeta)
		where G.ObjID = S.BestObjID 		-- connect the galaxy to the spectrum  
		and S.SpecObjID = L1.SpecObjID		-- L1 is a line of S.
		and S.SpecObjID = L2.SpecObjID		-- L2 is a line of S. 
		and L1.LineId = LN1. value	
		and LN1.name =  'Ha_6565'   		-- L1 is the H alpha line
		and L2.LineId = LN2.value		-- L2 is the H alpha line
		and LN2.name =  'Hb_4863'     		--  
		and L1.ew > 200				-- BIG Halpha
		and L2.ew > 10				-- significant Hbeta emission line 
		and L2.ew * 5 < L1.ew 			-- Hbeta is comparatively small
		--------------------------------------------------------------------------
		exec spTestTimeEnd @clock, @elapsed, @cpu, @physical_io, 'Q10A', @comment, 1, 1, @@RowCount 
		drop table ##results10A
		--=====================================================================
		DBCC DROPCLEANBUFFERS WITH NO_INFOMSGS  
		--=====================================================================
		--Query 11:  Find all elliptical galaxies with spectra that have an anomalous emission line.
		exec spTestTimeStart  @clock OUTPUT, @cpu OUTPUT, @physical_io OUTPUT
		--------------------------------------------------------------------------
		select	distinct G.ObjID 			-- return qualifying galaxies
  		into   ##results11
		from	Galaxy       as G, 		-- G is the galaxy
 			SpecObj	       as S, 		-- S is the spectra of galaxy G
 			SpecLine       as L, 		-- L is a line of S
 			specLineNames  as LN,		-- the type of line
 			XCRedshift     as XC		-- the template cross-correlation 
		where G.ObjID = S.BestObjID   		-- connect galaxy to the spectrum 
		and S.SpecObjID = L.SpecObjID		-- L is a line of S
		and S.SpecObjID = XC.SpecObjID 		-- CC is a cross-correlation with templates 
		and XC.tempNo = 8                  	-- Template('Elliptical') -- CC says "elliptical"
		and L.LineID = LN.value			-- line type is found  
 		and LN.Name = 'UNKNOWN'			--       but not identified
		and L.ew > 10				-- a prominent (wide) line
		and S.SpecObjID not in (		-- insist that there are no other lines
			select S.SpecObjID		-- insist that there are no other lines
			from   	SpecLine as L1,		-- L1 is another line 
				specLineNames as LN1	
			where S.SpecObjID = L1.SpecObjID -- for this object 
  			and abs(L.wave - L1.wave) <.01 	-- at nearly the same wavelength
  			and  L1.LineID = LN1.value	-- line found and  
 			and LN1.Name != 'UNKNOWN' 	--       it IS identified
			)      
		--------------------------------------------------------------------------
		exec spTestTimeEnd @clock, @elapsed, @cpu, @physical_io, 'Q11 ', @comment, 1, 1, @@RowCount 
		drop table ##results11
		--=====================================================================
		DBCC DROPCLEANBUFFERS WITH NO_INFOMSGS  
		--=====================================================================
*/		
		-- Query 12: Create a grided count of galaxies with u-g>1 and r<21.5 over
		--          60<declination<70, and 200<right ascension<210, 
		--          on a grid of 2’, and create a map of masks over the same grid.  
		--          Scan the table for galaxies and group them in cells 2 arc-minutes
		--          on a side. Provide predicates for the color restrictions on u-g 
		--          and r and to limit the search to the portion of the sky defined 
		--          by the right ascension and declination conditions.  
		--          Return the count of qualifying galaxies in each cell. 
		--          Run another query with the same grouping, but with a predicate 
		--          to include only objects such as satellites, planets, and airplanes 
		--          that obscure the cell.  The second query returns a list of cell 
		--          coordinates that serve as a mask for the first query. The mask may 
		--          be stored in a temporary table and joined with the first query.      
		exec spTestTimeStart  @clock OUTPUT, @cpu OUTPUT, @physical_io OUTPUT
		---------------------------------------------------------------------------
		--- First find the grided galaxy count (with the color cut)
		--- In local tangent plane, ra/cos(dec) is a “linear” degree.
 		select cast((ra/cos(radians(cast(dec*30 as int)/30.0)))*30 as int)/30.0 as raCosDec, 
			cast(dec*30 as int)/30.0                                as dec, 
			count(*)                                                as pop
		into ##GalaxyGrid
		from   Galaxy as G, 
			dbo.fHtmCoverRegion('RECT J2000 193 5 197 -5') as T
		where  htmID  between T.HTMIDstart and T. HTMIDend  
		and  ra between 193 and 197
		and  dec between -5 and 5
		and  u-g > 1
		and  r < 21.5
		group by  cast((ra/cos(radians(cast(dec*30 as int)/30.0)))*30 as int)/30.0, 
				cast(dec*30 as int)/30.0    
		--- now build mask grid.
		select 	cast((ra/cos(radians(cast(dec*30 as int)/30.0)))*30 as int)/30.0 as raCosDec, 
			cast(dec*30 as int)/30.0                                as dec, 
			count(*)                                                as pop
		into ##MaskGrid                                                
		from    photoObjAll as PO, 
			dbo.fHtmCoverRegion('RECT J2000 193 5 197 -5') as T,
			PhotoType as PT
		where  htmID between T. HTMIDstart and T. HTMIDend 
		and  ra between 193 and 197
		and  dec between -5 and 5
		and PO.type = PT.value
		and PT.name in ('COSMIC_RAY', 'DEFECT', 'GHOST', 'TRAIL', 'UNKNOWN')
		group by  cast((ra/cos(radians(cast(dec*30 as int)/30.0)))*30 as int)/30.0, 
				cast(dec*30 as int)/30.0    
		--------------------------------------------------------------------------
		exec spTestTimeEnd @clock, @elapsed, @cpu, @physical_io, 'Q12', @comment, 1, 1, @@RowCount 
		drop table ##MaskGrid
		drop table ##GalaxyGrid
		--=====================================================================
		DBCC DROPCLEANBUFFERS WITH NO_INFOMSGS  
		--=====================================================================
		--Query 13:  Create a count of galaxies for each of the HTM triangles 
		--           which satisfy a certain color cut,  
		--           like 0.7u-0.5g-0.2i<1.25 && r<21.75, output it in a form 
		--           adequate for visualization.     
		exec spTestTimeStart  @clock OUTPUT, @cpu OUTPUT, @physical_io OUTPUT
		---------------------------------------------------------------------------
		declare @RightShift12 bigint;
		set @RightShift12 = power(2,24);
		select (htmID /@RightShift12) as htm_8 , 	-- group by 8-deep HTMID (rshift HTM by 12)
 			avg(ra) as ra, 
			avg(dec) as [dec], 
				count(*) as pop			-- return center point and count for display
		into  ##results13				-- put the answer in the results set.
		from  Galaxy	 				-- only look at galaxies
		where  (0.7*u - 0.5*g - 0.2*i) < 1.25 		-- meeting this color cut
		and  r < 21.75					-- brightr than 21.75 magnitude in red band.
		group by  (htmID /@RightShift12)		-- group into 8-deep HTM buckets.
		--------------------------------------------------------------------------
		exec spTestTimeEnd @clock, @elapsed, @cpu, @physical_io, 'Q13', @comment, 1, 1, @@RowCount 
		drop table ##results13
		--=====================================================================
		DBCC DROPCLEANBUFFERS WITH NO_INFOMSGS  
		--=====================================================================
		--Query 14:  Find stars with multiple measurements that have magnitude 
		--           variations >0.1.     
		exec spTestTimeStart  @clock OUTPUT, @cpu OUTPUT, @physical_io OUTPUT
		---------------------------------------------------------------------------
		-- hack for SQL Server 2000 optimizer bookmark bug.
		--drop index photoObj.ugriz
		--go
		--create index ugriz on photoObj(objID,run,type, status, flags, u,g,r,i,z, Err_u, Err_g, Err_r, Err_i, Err_z)
		--  6:59 == 420 sec
		--48245 row(s) affected)
		-- Q14 with ugriz index cpu:   288.27 sec, elapsed:   228.91 sec, physical_io: 520793 row_count: 48245
		--  so with index build it is 288+420 = 708 sec (10 min vs 50 minutes 3110 sec with bookmark bug)
		---------------------------------------------------------------------------
		---------------------------------------------------------------------------
		declare @star int;			    	-- initialized “star” literal
		set     @star = dbo.fPhotoType('Star'); 	-- avoids SQL2K optimizer problem
		select s1.objID as objID1, s2.objID as ObjID2	-- select object IDs of star and its pair	
		into ##results14
		from   Star     as   s1,			-- the primary star
			photoObj  as   s2,			-- the second observation of the star
			neighbors as   N			-- the neighbor record
		where s1.objID = N.objID			-- insist the stars are neighbors
		and s2.objID = N.neighborObjID			-- using precomputed neighbors table
		and distance < 0.5/60				-- distance is ½ arc second or less
		and s1.run != s2.run				-- observations are two different runs
		and s2.type = @star				-- s2 is indeed a star
		and  s1.u between 1 and 27			-- S1 magnitudes are reasonable
		and  s1.g between 1 and 27
		and  s1.r between 1 and 27
		and  s1.i between 1 and 27
		and  s1.z between 1 and 27
		and  s2.u between 1 and 27			-- S2 magnitudes are reasonable.
		and  s2.g between 1 and 27
		and  s2.r between 1 and 27
		and  s2.i between 1 and 27
		and  s2.z between 1 and 27
		and (    	                       	-- and one of the colors is  different.
				abs(S1.u-S2.u) > .1 + (abs(S1.Err_u) + abs(S2.Err_u))  		
				or abs(S1.g-S2.g) > .1 + (abs(S1.Err_g) + abs(S2.Err_g)) 	
				or abs(S1.r-S2.r) > .1 + (abs(S1.Err_r) + abs(S2.Err_r)) 
				or abs(S1.i-S2.i) > .1 + (abs(S1.Err_i) + abs(S2.Err_i)) 
				or abs(S1.z-S2.z) > .1 + (abs(S1.Err_z) + abs(S2.Err_z)) 
			)
		--------------------------------------------------------------------------
		exec spTestTimeEnd @clock, @elapsed, @cpu, @physical_io, 'Q14', @comment, 1, 1, @@RowCount 
		drop table ##results14
		--=====================================================================
		DBCC DROPCLEANBUFFERS WITH NO_INFOMSGS  
		--=====================================================================
		--Query 15: Provide a list of moving objects consistent with an asteroid.     
		exec spTestTimeStart  @clock OUTPUT, @cpu OUTPUT, @physical_io OUTPUT
		---------------------------------------------------------------------------
		select	objID,  											-- return object ID
 				sqrt( power(rowv,2) + power(colv, 2) ) as velocity	-- velocity
		into  ##results15A
		from	PhotoObj  											-- check each object.
		where (power(rowv,2) + power(colv, 2)) between 50 and 1000	-- square of velocity (units?)
    																-- big values indicate error
		--------------------------------------------------------------------------
		exec spTestTimeEnd @clock, @elapsed, @cpu, @physical_io,'Q15A', @comment, 1, 1, @@RowCount 
		drop table ##results15A
		DBCC DROPCLEANBUFFERS WITH NO_INFOMSGS  
/*
		--=====================================================================
		--Query 15B:  redo Q15 in a different way.
		---------------look for two different objects that are streaks that line up with one another.
		---------------in red, blue, and green.
		exec spTestTimeStart  @clock OUTPUT, @cpu OUTPUT, @physical_io OUTPUT
		---------------------------------------------------------------------------
		create index NEO on photoObj(run, camcol, field, parentID, 
 			q_r,q_g,u_r,u_g, isoA_r, isoB_r,  
 			FiberMag_u,FiberMag_g,FiberMag_r,FiberMag_i,FiberMag_z)
		SELECT r.objID as rId, g.objId as gId, 
			r.run, r.camcol, 
			r.field as field, g.field as gField,
			r.ra as ra_r, r.dec as dec_r, 
			g.ra as ra_g, g.dec as dec_g, --(note acos(x) ~ x for x~1)
			sqrt( power(r.cx -g.cx,2)+ power(r.cy-g.cy,2)+power(r.cz-g.cz,2) )*((180*60)/PI()) as distance,
			dbo.fGetUrlExpId(r.objID) as rURL, 
			dbo.fGetUrlExpId(g.objID) as gURL 
			into ##results15B
			FROM PhotoObj r, PhotoObj g
			WHERE 
			r.run = g.run and r.camcol=g.camcol and abs(g.field-r.field)<2  -- the match criteria
			-- the red selection criteria
			and ((power(r.q_r,2) + power(r.u_r,2)) > 0.111111 )
			and r.fiberMag_r between 6 and 22 and r.fiberMag_r < r.fiberMag_g and r.fiberMag_r < r.fiberMag_i
			and r.parentID=0 and r.fiberMag_r < r.fiberMag_u and r.fiberMag_r < r.fiberMag_z
			and r.isoA_r/r.isoB_r > 1.5 and r.isoA_r>2.0
			-- the green selection criteria
			and ((power(g.q_g,2) + power(g.u_g,2)) > 0.111111 )
			and g.fiberMag_g between 6 and 22 and g.fiberMag_g < g.fiberMag_r and g.fiberMag_g < g.fiberMag_i
			and g.fiberMag_g < g.fiberMag_u and g.fiberMag_g < g.fiberMag_z
			and g.parentID=0 and g.isoA_g/g.isoB_g > 1.5 and g.isoA_g > 2.0
			-- the matchup of the pair (note acos(x) ~ x for x~1)
			and sqrt(power(r.cx -g.cx,2)+ power(r.cy-g.cy,2)+power(r.cz-g.cz,2))*((60*180)/PI())< 4.0
			and abs(r.fiberMag_r-g.fiberMag_g)< 2.0
		--------------------------------------------------------------------------
		exec spTestTimeEnd @clock, @elapsed , @cpu , @physical_io ,'Q15B', @comment, 1, 1, @@RowCount 
		drop table ##results15B
		--=====================================================================
		DBCC DROPCLEANBUFFERS WITH NO_INFOMSGS  
*/
		--=====================================================================
		--Query 16: Find all objects similar to the colors of a quasar at 5.5<redshift<6.5.   	
		exec spTestTimeStart  @clock OUTPUT, @cpu OUTPUT, @physical_io OUTPUT
		---------------------------------------------------------------------------
		select count(*) 					as 'total', 	
		sum( case when (Type=3) then 1 else 0 end) 		as 'Galaxies',
		sum( case when (Type=6) then 1 else 0 end) 		as 'Stars',
		sum( case when (Type not in (3,6)) then 1 else 0 end) 	as 'Other'
		into ##results16
		from 	PhotoPrimary					-- for each object		 		
		where (( u - g > 2.0) or (u > 22.3) ) 			-- apply the quasar color cut.
		and ( i between 0 and 19 ) 
		and ( g - r > 1.0 ) 
		and ( (r - i < 0.08 + 0.42 * (g - r - 0.96)) or (g - r > 2.26 ) )
		and 	( i - z < 0.25 )
		--------------------------------------------------------------------------
		exec spTestTimeEnd @clock, @elapsed, @cpu, @physical_io, 'Q16', @comment, 1, 1, @@RowCount 
		drop table ##results16
		--=====================================================================
		DBCC DROPCLEANBUFFERS WITH NO_INFOMSGS  
		--=====================================================================
		--Query 17: Find binary stars where at least one of them has the colors 
		--          of a white dwarf.   
		exec spTestTimeStart  @clock OUTPUT, @cpu OUTPUT, @physical_io OUTPUT
		---------------------------------------------------------------------------
		--declare @star int;			    	-- initialized “star” literal
		--set     @star = dbo.fPhotoType('Star'); 	-- avoids SQL2K optimizer problem
		select	s1.objID as s1, s2.objID as s2		-- just count them
		into ##results17
		from	Star S1,				-- S1 is the white dwarf
 			Neighbors N,				-- N is the precomputed neighbors links
			Star S2					-- S2 is the second star
		where S1.objID = N. objID 			-- S1 and S2 are neighbors-within 30 arc sec
			and S2.objID = N.NeighborObjID  
			and N.NeighborType = @star       	-- and S2 is a star
			and N.distance < .05			-- the 3 arcsecond test
			and ((S1.u - S1.g) < 0.4 )		-- and S1 meets Paul Szkody’s color cut for
			and (S1.g - S1.r) < 0.7 		-- white dwarfs.
			and (S1.r - S1.i) > 0.4 
			and (S1.i - S1.z) > 0.4     
		--------------------------------------------------------------------------
		exec spTestTimeEnd @clock, @elapsed, @cpu, @physical_io, 'Q17', @comment, 1, 1, @@RowCount 
		--=====================================================================
		drop table ##results17
		DBCC DROPCLEANBUFFERS WITH NO_INFOMSGS  
		--=====================================================================
		--Query 18: Find all objects within 30 arcseconds of one another that 
		--          have very similar colors: that is where the color ratios
		--          u-g, g-r, r-I are less than 0.05m.      
		exec spTestTimeStart  @clock OUTPUT, @cpu OUTPUT, @physical_io OUTPUT
		---------------------------------------------------------------------------
		select distinct P.ObjID 		-- distinct cases  
		into ##results18			-- the oid compare eliminats dups
		From	PhotoPrimary   P,		-- P is the primary object
			Neighbors      N, 		-- N is the neighbor link
			PhotoPrimary   L		-- L is the lens candidate of P
		where P.ObjID = N.ObjID			-- N is a neighbor record
		and L.ObjID = N.NeighborObjID  		-- L is a neighbor of P
		and P.ObjID < L. ObjID 			-- avoid duplicates
		and abs((P.u-P.g)-(L.u-L.g))<0.05 	-- L and P have similar spectra.
		and abs((P.g-P.r)-(L.g-L.r))<0.05
		and abs((P.r-P.i)-(L.r-L.i))<0.05  
		and abs((P.i-P.z)-(L.i-L.z))<0.05  
		--------------------------------------------------------------------------
		exec spTestTimeEnd @clock, @elapsed, @cpu, @physical_io, 'Q18', @comment, 1, 1, @@RowCount 
		drop table ##results18
		--=====================================================================
		DBCC DROPCLEANBUFFERS WITH NO_INFOMSGS  
		--=====================================
		--Query 19: Find quasars with a broad absorption line in their spectra 
		--          and at least one galaxy within 10 arcseconds. 
		--          Return both the quasars and the galaxies.      
/*
		exec spTestTimeStart  @clock OUTPUT, @cpu OUTPUT, @physical_io OUTPUT
		---------------------------------------------------------------------------
		select Q.BestObjID as Quasar_candidate_ID , G.ObjID as Galaxy_ID, N.distance
		into ##results19   
		from SpecObj       	as Q, 		-- Q is the specObj of the quasar candidate
			Neighbors       as N,	-- N is the Neighbors list of Q
			Galaxy          as G,		-- G is the nearby galaxy
			class  		as SC,	-- Spec Class
			galSpecLine     as L, 	-- L is the broad line we are looking for 
		where Q.class =SC.value	  	-- Q is a QSO
			and SC.name  in ('QSO', 'HIZ_QSO') -- Spectrum says "QSO"
			and Q.SpecObjID = L.SpecObjID	-- L is a spectral line of Q.
			and L.ew < -10			-- but its a prominent absorption line
			and Q.BestObjID = N.ObjID	-- N is a neighbor record
			and G.ObjID = N.NeighborObjID  	-- G is a neighbor of Q
			and N.distance < 10.0/60	-- and it is within 10 arcseconds of the Q. 
		--------------------------------------------------------------------------

		exec spTestTimeEnd @clock, @elapsed, @cpu, @physical_io, 'Q19', @comment, 1, 1, @@RowCount 
		drop table ##results19
		--=====================================================================
		DBCC DROPCLEANBUFFERS WITH NO_INFOMSGS  
*/
		--=====================================================================
		--Query 20: : For each galaxy in the BCG data set (brightest color galaxy), 
		--            in 160<right ascension<170, -25<declination<35 count the number of 
		--            galaxies within 30" of it that have a photoz within 0.05 
		--            of that galaxy.
		exec spTestTimeStart  @clock OUTPUT, @cpu OUTPUT, @physical_io OUTPUT
		---------------------------------------------------------------------------
		--declare @binned    bigint;			 	-- initialized “binned” literal
		set     @binned = 	dbo.fPhotoFlags('BINNED1') +	-- avoids SQL2K optimizer problem
   				dbo.fPhotoFlags('BINNED2') +
   				dbo.fPhotoFlags('BINNED4') ;
		--declare @blended   bigint;			 	-- initialized “blended” literal
		set     @blended = 	dbo.fPhotoFlags('BLENDED');  	-- avoids SQL2K optimizer problem
		--declare @noDeBlend bigint;			 	-- initialized “noDeBlend” literal
		set     @noDeBlend = 	dbo.fPhotoFlags('NODEBLEND'); 	-- avoids SQL2K optimizer problem
		--declare @child     bigint;			 	-- initialized “child” literal
		set     @child = 	dbo.fPhotoFlags('CHILD');  	-- avoids SQL2K optimizer problem
		--declare @edge      bigint;			 	-- initialized “edge” literal
		set     @edge = 	dbo.fPhotoFlags('EDGE');  	-- avoids SQL2K optimizer problem
		--declare @saturated bigint;			 	-- initialized “saturated” literal
		set     @saturated = 	dbo.fPhotoFlags('SATURATED'); 	-- avoids SQL2K optimizer problem
		select  G.objID, count(N.NeighborObjID) as pop
		into    ##results20
		from 	Galaxy   as G,    	-- first gravitational lens candidate   
 			Neighbors  as N,   	-- precomputed list of neighbors
  			Galaxy   as U, 		-- a neighbor galaxy of G
			photoZ	   as Gpz,	-- photoZ of G.
				photoZ     as Npz -- Neighbor photoZ
		where G.ra between 190 and 200	-- changed range so matches perspnal DB.
			and G.dec between -5 and 5	--
			and G.objID = N.objID		-- connect G and U via the neighbors table
			and U.objID = N.neighborObjID 	-- so that we know G and U are within 
			and N.objID < N.neighborObjID 	-- 30 arcseconds of one another.
			and G.objID = Gpz.objID
			and U.objID = Npz.objID
			and abs(Gpz.Z - Npz.Z) < 0.05	-- restrict the photoZ differences
		-- Color cut for an BCG courtesy of James Annis of Fermilab
		and (G.flags & @binned) > 0  
		and (G.flags & ( @blended + @noDeBlend + @child)) != @blended
		and (G.flags & (@edge + @saturated)) = 0  
		and G.petroMag_i > 17.5
		and (G.petroMag_r > 15.5 OR G.petroR50_r > 2)
		and (G.petroMag_r < 30 and G.g < 30 and G.r < 30 and G.i < 30)
		and  (G.r < 19.2 
			and ( 1=1 or
					(G.r < (13.1 + (7/3)*(G.g - G.r) +  	-- deRed_r < 13.1 + 0.7 / 0.3 * deRed_gr
					4 *(G.r - G.i - 0.18 )) 		-- 1.2 / 0.3 * deRed_ri          
				and (( G.r - G.i - (G.g - G.r)/4 - 0.18) BETWEEN -0.2 AND  0.2 )
			and ((G.r +  	                        -- petSB - deRed_r + 2.5 log10(2Pi*petroR50^2)
					2.5 * LOG( 2 * 3.1415 * G.petroR50_r * G.petroR50_r )) < 24.2 )  
				)
				or 
				(      (G.r < 19.5 )
				and (( G.r - G.i -(G.g - G.r)/4 -.18) >    	-- - deRed_gr/4 - 0.18      									-- cperp = deRed_ri             
								(0.45 - 4*( G.g - G.r)))  		-- 0.45 - deRed_gr/0.25
				and ((G.g - G.r) > ( 1.35 + 0.25 *(G.r - G.i)))
				and ((G.r  + 	-- petSB - deRed_r + 2.5 log10(2Pi*petroR50^2)          
						2.5 * LOG( 2 * 3.1415 * G.petroR50_r * G.petroR50_r )) < 23.3 )
				))  )
		group by G.objID        
		--------------------------------------------------------------------------
		exec spTestTimeEnd @clock, @elapsed, @cpu, @physical_io, 'Q20', @comment, 1, 1, @@RowCount 
		--=====================================================================
		DROP TABLE ##results20
		--=====================================================================
		DBCC DROPCLEANBUFFERS WITH NO_INFOMSGS  
		--=====================================================================
		--Query SX1: Cataclysmic variables 
		-- Paula Szkody <szkody@alicar.astro.washington.edu>
		-- Search for Cataclysmic Variables and pre-CVs with White Dwarfs and
		-- very late secondaries:
		-- u-g < 0.4
		-- g-r < 0.7
		-- r-i > 0.4
		-- i-z > 0.4
		exec spTestTimeStart  @clock OUTPUT, @cpu OUTPUT, @physical_io OUTPUT
		---------------------------------------------------------------------------
		SELECT  run,               
				camCol,
			rerun,
			field,
			objID,
			u,g,r,i,z,
			ra,  dec
		INTO ##resultsX01
		FROM PhotoPrimary
		WHERE 	u - g < 0.4 and
			g - r < 0.7 and
    			r - i > 0.4 and
    			i - z > 0.4
		--------------------------------------------------------------------------
		exec spTestTimeEnd @clock, @elapsed, @cpu, @physical_io,'QSX01', @comment, 1, 1, @@RowCount 
		drop table ##resultsX01
		--=====================================================================
		DBCC DROPCLEANBUFFERS WITH NO_INFOMSGS  
		--=====================================================================
		--Query SX2: Velocities and errors ============================
		-- (Robert H. Lupton <rhl@astro.princeton.edu>)
		exec spTestTimeStart  @clock OUTPUT, @cpu OUTPUT, @physical_io OUTPUT
		---------------------------------------------------------------------------
		SELECT  run,
			camCol,
			field,
			objID,
			rowC,colC,rowV,colV,rowVErr,colVErr,
			flags,
			psfMag_u,psfMag_g,psfMag_r,psfMag_i,psfMag_z,
			psfMagErr_u,psfMagErr_g,psfMagErr_r,psfMagErr_i,psfMagErr_z
		INTO ##resultsX02
		FROM PhotoPrimary
		WHERE  rowvErr > 0 and colvErr> 0 
		and ((rowv * rowv) / (rowvErr * rowvErr) + 
			(colv * colv) / (colvErr * colvErr) > 4)
		--------------------------------------------------------------------------
		exec spTestTimeEnd @clock, @elapsed, @cpu, @physical_io, 'QSX02', @comment, 1, 1, @@RowCount 
		drop table ##resultsX02
		--=====================================================================
		DBCC DROPCLEANBUFFERS WITH NO_INFOMSGS  
		--=====================================================================
		--Query SX3: Coordinate cut 
		-- (Robert H. Lupton <rhl@astro.princeton.edu>)
		-- coordinate cut --> cut in ra --> 40:100
		exec spTestTimeStart  @clock OUTPUT, @cpu OUTPUT, @physical_io OUTPUT
		---------------------------------------------------------------------------
		SELECT colc_g, colc_r
		INTO ##resultsX03
		FROM  PhotoObj
		WHERE (-0.2 * cx + 0.766044 * cy>=0) 
		AND (-0.16 * cx +0.63648 * cy <0) 
		--------------------------------------------------------------------------
		exec spTestTimeEnd @clock, @elapsed, @cpu, @physical_io, 'QSX03', @comment, 1, 1, @@RowCount 
		drop table ##resultsX03
		--=====================================================================
		DBCC DROPCLEANBUFFERS WITH NO_INFOMSGS  
		--=====================================================================
		--Query SX4: Searching objects and fields by ID 
		-- (Robert H. Lupton <rhl@astro.princeton.edu>)
		-- Searching for a particular object in a particular field.
		exec spTestTimeStart  @clock OUTPUT, @cpu OUTPUT, @physical_io OUTPUT
		---------------------------------------------------------------------------
		SELECT  objID,
			field, ra, dec
		INTO ##resultsX04
		FROM PhotoObj
		WHERE  obj = 13 AND  field = 521
 
		--------------------------------------------------------------------------
		exec spTestTimeEnd @clock, @elapsed, @cpu, @physical_io,'QSX04', @comment, 1, 1, @@RowCount 
		drop table ##resultsX04
		--=====================================================================
		DBCC DROPCLEANBUFFERS WITH NO_INFOMSGS  
		--=====================================================================
		--Query SX5: Galaxies with bluer centers 
		-- Michael Strauss <strauss@astro.princeton.edu>
		-- For all galaxies with r_Petro < 18, not saturated, not bright, not
		-- edge, give me those whose centers are appreciably bluer than their
		-- outer parts. That is, define the center color as: u_psf - g_psf And
		-- define the outer color as: u_model - g_model Give me all objects
		-- which have (u_model - g_model) - (u_psf - g_psf) < -0.4
		exec spTestTimeStart  @clock OUTPUT, @cpu OUTPUT, @physical_io OUTPUT
		---------------------------------------------------------------------------
		DECLARE @flags  BIGINT;
		SET @flags = 	dbo.fPhotoFlags('SATURATED') +
				dbo.fPhotoFlags('BRIGHT')    +
				dbo.fPhotoFlags('EDGE') 
		SELECT colc_u, colc_g,  objID       --or whatever you want from each object
		INTO ##resultsX05
		FROM  Galaxy
		WHERE (Flags &  @flags )= 0  
		and petroRad_r < 18
		and ((colc_u - colc_g) - (psfMag_u - psfMag_g)) < -0.4 
		--------------------------------------------------------------------------
		exec spTestTimeEnd @clock, @elapsed, @cpu, @physical_io,'QSX05', @comment, 1, 1, @@RowCount 
		drop table ##resultsX05
		--=====================================================================
		DBCC DROPCLEANBUFFERS WITH NO_INFOMSGS  
		--=====================================================================
		--Query SX6:  PSF colors of stars 
		-- Michael Strauss <strauss@astro.princeton.edu>
		-- Give me the PSF colors of all stars brighter than 20th (rejecting on
		-- various flags) that have PSP_STATUS = 2
		exec spTestTimeStart  @clock OUTPUT, @cpu OUTPUT, @physical_io OUTPUT
		---------------------------------------------------------------------------
		SELECT  s.psfMag_g,         -- or whatever you want from each object
			s.run,
			s.camCol,
			s.rerun,
			s.field
		INTO ##resultsX06
		FROM Star s, Field f
		WHERE  s.fieldID = f.fieldID
		AND  s.psfMag_g < 20 
		AND  f.pspStatus = 2  
		--------------------------------------------------------------------------
		exec spTestTimeEnd @clock, @elapsed, @cpu, @physical_io, 'QSX06', @comment, 1, 1, @@RowCount 
		drop table ##resultsX06
		--=====================================================================
		DBCC DROPCLEANBUFFERS WITH NO_INFOMSGS  
		-----------------------------------------------------------------------
		--Query SX7:  Cluster finding 
		-- (James Annis <annis@fnal.gov>)
		-- if {AR_DFLAG_BINNED1 || AR_DFLAG_BINNED2 || AR_DFLAG_BINNED4} {
		--    if {! ( AR_DFLAG_BLENDED AND !( AR_DFLAG_NODEBLEND || AR_DFLAG_CHILD))} {
		--       if { galaxy } { ;# not star, asteroid, or bright
		--           if { primary_object} {
		--             if {petroMag{i} < 23 } { accept }
		--           }
		--       }
		--    }
		-- }
		
		exec spTestTimeStart  @clock OUTPUT, @cpu OUTPUT, @physical_io OUTPUT
		---------------------------------------------------------------------------
		--DECLARE @binned BIGINT
		SET @binned = 	dbo.fPhotoFlags('BINNED1') +
				dbo.fPhotoFlags('BINNED2') +
				dbo.fPhotoFlags('BINNED4') 
		DECLARE @deblendedChild BIGINT
		SET @deblendedChild =	dbo.fPhotoFlags('BLENDED')   +
					dbo.fPhotoFlags('NODEBLEND') +
					dbo.fPhotoFlags('CHILD')
		--DECLARE @blended BIGINT
		SET @blended = dbo.fPhotoFlags('BLENDED')
		SELECT  camCol,
				run,
			rerun,
				field,
				objID, ra, dec
		INTO ##resultsX07
		FROM Galaxy                             -- select galaxy and primary only
		WHERE (flags &  @binned )> 0  
		AND (flags &  @deblendedChild ) !=  @blended 
		AND petroMag_i < 23 
		--------------------------------------------------------------------------
		exec spTestTimeEnd @clock, @elapsed, @cpu, @physical_io, 'QSX07', @comment, 1, 1, @@RowCount 
		drop table ##resultsX07
		--=====================================================================
		DBCC DROPCLEANBUFFERS WITH NO_INFOMSGS  
		--=====================================================================
		--Query SX8: Diameter-limited sample of galaxies 
		-- (James Annis <annis@fnal.gov>)
		-- if {AR_DFLAG_BINNED1 || AR_DFLAG_BINNED2 || AR_DFLAG_BINNED4} {
		--   if {! ( AR_DFLAG_BLENDED AND !( AR_DFLAG_NODEBLEND || AR_DFLAG_CHILD)} {
		--      if { galaxy } { ;# not star, asteroid, or bright
		--         if (!AR_DFLAG_NOPETRO) {
		--           if { petrorad > 15 } { accept }
		--         } else {
		--           if { petror50 > 7.5 } { accept }
		--         }
		--         if (AR_DFLAG_TOO_LARGE AND petrorad > 2.5 ) { accept }
		--         if ( AR_DFLAG_SATUR AND petrorad < 17.5) { don't accept }
		--      }
		--    }
		--  }
		exec spTestTimeStart  @clock OUTPUT, @cpu OUTPUT, @physical_io OUTPUT
		---------------------------------------------------------------------------
		--DECLARE @binned BIGINT
		SET @binned = 	dbo.fPhotoFlags('BINNED1') +
				dbo.fPhotoFlags('BINNED2') +
				dbo.fPhotoFlags('BINNED4') 
		--DECLARE @deblendedChild BIGINT
		SET @deblendedChild =	dbo.fPhotoFlags('BLENDED')   +
					dbo.fPhotoFlags('NODEBLEND') +
					dbo.fPhotoFlags('CHILD')
		--DECLARE @blended BIGINT
		SET @blended = dbo.fPhotoFlags('BLENDED')
		DECLARE @noPetro BIGINT
		SET @noPetro = dbo.fPhotoFlags('NOPETRO')
		DECLARE @tooLarge BIGINT
		SET @tooLarge = dbo.fPhotoFlags('TOO_LARGE')
		--DECLARE @saturated BIGINT
		SET @saturated = dbo.fPhotoFlags('SATURATED')
		SELECT run,
			camCol,
			rerun,
			field,
			objID, 
			ra, 
			dec
		INTO ##resultsX08
		FROM Galaxy
		WHERE (flags &  @binned )> 0  
		AND (flags &  @deblendedChild ) !=  @blended
		AND (  (( flags & @noPetro = 0) 
				AND petroRad_i > 15)
			OR ((flags & @noPetro > 0) 
				AND petroRad_i > 7.5)
			OR ((flags & @tooLarge > 0) 
				AND petroRad_i > 2.5)
			OR --note, Gray changed this and to an or, becuase it did not make sense as an and.
				((flags & @saturated  = 0 )
				AND petroRad_i > 17.5)
			) 
		--------------------------------------------------------------------------
		exec spTestTimeEnd @clock, @elapsed, @cpu, @physical_io, 'QSX08', @comment, 1, 1, @@RowCount 
		drop table ##resultsX08
		--=====================================================================
		DBCC DROPCLEANBUFFERS WITH NO_INFOMSGS  
		--=====================================================================
		--Query SX9: Extremely red galaxies: 
		-- (James Annis <annis@fnal.gov>)
		-- if {AR_DFLAG_BINNED1 || AR_DFLAG_BINNED2 || AR_DFLAG_BINNED4} {
		--    if {! ( AR_DFLAG_BLENDED AND !( AR_DFLAG_NODEBLEND || AR_DFLAG_CHILD)} {
		--        if { galaxy } { ;# not star, asteroid, or bright
		--           if { primary_object} {
		--               if {!AR_DFLAG_CR AND !R_DFLAG_INTERP}
		--                   if { frame_seeing < 1.5" } {
		--                       if { Mag_model<i>-Mag_model<z> - 
		--                              (extinction<i> - extinction<z>) > 1.0 } {
		--                          accept
		--                       }
		--                   }
		--               }
		--           }
		--        }
		--     }
		-- }
		
		exec spTestTimeStart  @clock OUTPUT, @cpu OUTPUT, @physical_io OUTPUT
		---------------------------------------------------------------------------
		--DECLARE @binned BIGINT
		SET @binned = 	dbo.fPhotoFlags('BINNED1') +
				dbo.fPhotoFlags('BINNED2') +
				dbo.fPhotoFlags('BINNED4') 
		--DECLARE @deblendedChild BIGINT
		SET @deblendedChild =	dbo.fPhotoFlags('BLENDED')   +
					dbo.fPhotoFlags('NODEBLEND') +
					dbo.fPhotoFlags('CHILD')
		--DECLARE @blended BIGINT
		SET @blended = dbo.fPhotoFlags('BLENDED')
		DECLARE @crIntrp BIGINT
		SET @crIntrp = 	dbo.fPhotoFlags('COSMIC_RAY')  +
				dbo.fPhotoFlags('INTERP')
		SELECT g.run,
			g.camCol,
			g.rerun,
			g.field,
			g.objID, g.ra, g.dec
		INTO ##resultsX09
		FROM Galaxy g, Field f
		WHERE g.fieldID = f.fieldID
		AND (flags &  @binned )> 0  
		AND (flags &  @deblendedChild ) !=  @blended
		AND (flags &  @crIntrp ) = 0
		AND f.psfWidth_r < 1.5 
		AND (i - z > 1.0 )
		--------------------------------------------------------------------------
		exec spTestTimeEnd @clock, @elapsed, @cpu, @physical_io,'QSX09', @comment, 1, 1, @@RowCount 
		drop table ##resultsX09
		--=====================================================================
		DBCC DROPCLEANBUFFERS WITH NO_INFOMSGS  
		--=====================================================================
		--Query SX10: The BRG sample 
		-- (James Annis <annis@fnal.gov>)
		-- if {AR_DFLAG_BINNED1 || AR_DFLAG_BINNED2 || AR_DFLAG_BINNED4} {
		--    if {! ( AR_DFLAG_BLENDED AND !( AR_DFLAG_NODEBLEND || AR_DFLAG_CHILD)} {
		--       if {!AR_DFLAG_EDGE & !AR_DFLAG_SATUR} {
		--          if { galaxy} { ;# not star, asteroid, or bright
		--            if { primary_object} {
		--               if {! (petroMag<2> < 15.5 AND petror50<2> < 2) } {
		--                 if {petroMag<r> > 0 AND Mag_model<g> > 0 AND
		--                       Mag_model<r> > 0 AND Mag_model<i> > 0 } {
		--                     petSB = deRed_r + 2.5*log10(2*3.1415*petror50<r>^2)
		--                     deRed_g = petroMag<g> - extinction<g>
		--                     deRed_r = petroMag<r> - extinction<r>
		--                     deRed_i = petroMag<i> - extinction<i>
		--                     deRed_gr = deRed_g - deRed_r
		--                     deRed_ri = deRed_r - deRed_i
		--                     cperp = deRed_ri - deRed_gr/4.0 - 0.18
		--                     cpar = 0.7*deRed_gr + 1.2*(deRed_ri -0.18)
		--                     if {(deRed_r < 19.2 AND deRed_r < 13.1 + cpar/0.3 AND
		--                          abs(cperp) < 0.2 AND petSB < 24.2 ) ||
		--                          (deRed_r < 19.5 AND cperp > 0.45 - deRed_gr/0.25 AND
		--                           deRed_gr > 1.35 + deRed_ri*0.25 AND petSB < 23.3) {
		--                          accept ;# whew!!!
		--                      }
		--                   }
		--                }
		--             }
		--           }
		--        }
		--     }
		--  }
		--
		exec spTestTimeStart  @clock OUTPUT, @cpu OUTPUT, @physical_io OUTPUT
		---------------------------------------------------------------------------
		--DECLARE @binned BIGINT
		SET @binned = 	dbo.fPhotoFlags('BINNED1') +
				dbo.fPhotoFlags('BINNED2') +
				dbo.fPhotoFlags('BINNED4') 
		--DECLARE @deblendedChild BIGINT
		SET @deblendedChild =	dbo.fPhotoFlags('BLENDED')   +
					dbo.fPhotoFlags('NODEBLEND') +
					dbo.fPhotoFlags('CHILD')
		--DECLARE @blended BIGINT
		SET @blended = dbo.fPhotoFlags('BLENDED')
		DECLARE @edgedSaturated BIGINT
		SET @edgedSaturated =	dbo.fPhotoFlags('EDGE') +
		 			dbo.fPhotoFlags('SATURATED')
		SELECT	run,
			camCol,
			rerun,
			field,
			objID,
			ra,
			dec
		into ##resultsX10
		FROM Galaxy
		WHERE (flags &  @binned)> 0  
		AND (flags &  @deblendedChild) !=  @blended
		AND (flags &  @edgedSaturated)  = 0  
			AND petroMag_i > 17.5
			AND (petroMag_r > 15.5 OR petroR50_r > 2)
			AND (petroMag_r > 0 AND g>0 AND r>0 AND i>0)
			AND (petroR50_r > 0 ) -- petroR50 value is valid, need to avoid log(0)
			AND ((   (petroMag_r-extinction_r) < 19.2
					AND (petroMag_r - extinction_r < 
				(13.1 + (7/3)*( g - r) + 4 *( r  - i) - 4 * 0.18 ) )          
					AND ( ( (r - i) - (g -  r )/4 - 0.18 ) <  0.2 ) 
					AND ( ( (r - i)  - (g  - r)/4 - 0.18 ) > -0.2 ) 
					AND -- petSB - deRed_r + 2.5 log10(2Pi*petroR50^2)
					( (petroMag_r - extinction_r +         
						2.5 * LOG( 2 * 3.1415 * petroR50_r * petroR50_r )) < 24.2 
					)      
				OR
					(  (petroMag_r - extinction_r < 19.5) 
					AND ( ( (r - i) - (g - r)/4 - 0.18 ) > (0.45 - 4*( g - r)) )  -- 0.45 - deRed_gr/0.25       
					AND ( (g - r) > ( 1.35 + 0.25 *( r - i ) ) )
					AND  -- petSB - deRed_r + 2.5 log10(2Pi*petroR50^2)
					( (petroMag_r - extinction_r  +  2.5 * LOG( 2 * 3.1415 * petroR50_r * petroR50_r )) < 23.3 ) 
			) )
			)  
		--------------------------------------------------------------------------
		exec spTestTimeEnd @clock, @elapsed, @cpu, @physical_io,'QSX10', @comment, 1, 1, @@RowCount 
		drop table ##resultsX10
		--=====================================================================
		DBCC DROPCLEANBUFFERS WITH NO_INFOMSGS  
		--=====================================================================
		--Query SX11:  Low-z QSO candidates 
		-- Gordon Richards <richards@oddjob.uchicago.edu>
		-- Low-z QSO candidates using the following cuts:
		--
		-- -0.27 <= u-g < 0.71
		-- -0.24 <= g-r < 0.35
		-- -0.27 <= r-i < 0.57
		-- -0.35 <= i-z < 0.70
		-- g <= 22
		-- objc_type == 3
		exec spTestTimeStart  @clock OUTPUT, @cpu OUTPUT, @physical_io OUTPUT
		---------------------------------------------------------------------------
		SELECT g, objID    -- or whatever you want returned
		into ##resultsX11
		FROM Galaxy         -- takes care of objc_type == 3
		WHERE (
		(g <= 22) AND
		(u-g >= -0.27) AND (u-g < 0.71) AND
		(g-r >= -0.24) AND (g-r < 0.35) AND
		(r-i >= -0.27) AND (r-i < 0.57) AND
		(i-z >= -0.35) AND (i-z < 0.70)
		) 
		--------------------------------------------------------------------------
		exec spTestTimeEnd @clock, @elapsed, @cpu, @physical_io,'QSX11', @comment, 1, 1, @@RowCount 
		drop table ##resultsX11
		--===================================================================== 
		DBCC DROPCLEANBUFFERS WITH NO_INFOMSGS  
		--=====================================================================
		--Query SX12: Errors on moving objects 
		-- Gordon Richards <richards@oddjob.uchicago.edu>
		-- Another useful query is to see if the errors on moving (or apparently
		-- moving objects) are correct. For example it used to be that some
		-- known QSOs were being flagged as moving objects. One way to look for
		-- such objects is to compare the velocity to the error in velocity and
		-- see if the "OBJECT1_MOVED" or "OBJECT2_BAD_MOVING_FIT" is set. So
		-- return objects with
		--
		-- objc_type == 3
		-- sqrt(rowv*rowv + colv*colv) >= sqrt(rowvErr*rowvErr + colvErr*colvErr)
		--
		-- then output, the velocity, velocity errors, i' magnitude, and the
		-- relevant "MOVING" object flags.	
		exec spTestTimeStart  @clock OUTPUT, @cpu OUTPUT, @physical_io OUTPUT
		---------------------------------------------------------------------------
		DECLARE @moved BIGINT
		SET @moved =	dbo.fPhotoFlags('MOVED') 
		DECLARE @badMove BIGINT
		SET @badMove =	dbo.fPhotoFlags('BAD_MOVING_FIT') 
		SELECT rowv,
			colv,
			rowvErr,
			colvErr,
			i,
			(flags & @moved) as MOVED,
			(flags & @badMove) as BAD_MOVING_FIT
		INTO ##resultsX12
		FROM photoObj
		WHERE  (flags & (@moved + @badMove)) > 0 
		AND (rowv * rowv + colv * colv) >= 
							(rowvErr * rowvErr + colvErr * colvErr) 
		--------------------------------------------------------------------------
		exec spTestTimeEnd @clock, @elapsed, @cpu, @physical_io,'QSX12', @comment, 1, 1, @@RowCount 
		drop table ##resultsX12
		--=====================================================================
		DBCC DROPCLEANBUFFERS WITH NO_INFOMSGS  
		--=====================================================================
		--Query SX13: A random sample of the data 
		-- Karl Glazebrook <kgb@pha.jhu.edu>
		-- So as a newcomer I might want to do something like 'give me the colours
		-- of 100,000 random objects from all fields which are survey quality' so
		-- then I could plot up colour-colour diagrams and play around with
		-- more sophisticated cuts. How would I do that?
		exec spTestTimeStart  @clock OUTPUT, @cpu OUTPUT, @physical_io OUTPUT
		---------------------------------------------------------------------------
		SELECT u,g,r,i,z
		INTO ##resultsX13
		FROM Galaxy 
		WHERE  (obj  % 100 )= 1	 
		--------------------------------------------------------------------------
		exec spTestTimeEnd @clock, @elapsed, @cpu, @physical_io, 'QSX13', @comment, 1, 1, @@RowCount 
		drop table ##resultsX13
		--=====================================================================
		--DBCC DROPCLEANBUFFERS WITH NO_INFOMSGS  
		--=====================================================================
		--Query SX14:--  (Dan VandenBerk <danvb@fnal.gov>)
		-- We have a list of objects -- RA and DEC -- for which we would like
		-- matches and all of the Obj data. Can I send you the list?	
		--exec spTestTimeStart  @clock OUTPUT, @cpu OUTPUT, @physical_io OUTPUT
		---------------------------------------------------------------------------	 
		--------------------------------------------------------------------------
		--exec spTestTimeEnd @clock, @elapsed, @cpu, @physical_io, 'QSX14***  Match a list from another survey', @comment, 1, 1, @@RowCount 
		--drop table ##resultsX14
		--=====================================================================
		DBCC DROPCLEANBUFFERS WITH NO_INFOMSGS  
		--=====================================================================
		--Query SX15:  Find quasars 
		-- (Xiaohui Fan et.al. <fan@astro.princeton.edu>) 
		exec spTestTimeStart  @clock OUTPUT, @cpu OUTPUT, @physical_io OUTPUT
		---------------------------------------------------------------------------
		SELECT  run,
				camCol,
				rerun,
				field,
				objID,
				u,g,r,i,z,
				ra,
				dec
		into ##resultsX15
		FROM Star       -- or sxGalaxy 
		WHERE ( u - g > 2.0 OR u > 22.3 ) 
		AND ( i < 19 ) 
		AND ( i > 0 ) 
		AND ( g - r > 1.0 ) 
		AND ( r - i < (0.08 + 0.42 * (g - r - 0.96))
			OR g - r > 2.26 ) 
		AND  ( i - z < 0.25 ) 
		--------------------------------------------------------------------------
		exec spTestTimeEnd @clock, @elapsed, @cpu, @physical_io,'QSX15', @comment, 1, 1, @@RowCount 
		drop table ##resultsX15
		--=====================================================================
		--
		-- bottom of query loop, increment @i to @n
		set @i = @i + 1
		end
		--=====================================================================
		-- Generate a summary report and return
		print 'Ran the 36 queries ' + cast(@n as varchar(10)) + ' times. Elapsed time was: ' 
			+ convert(varchar(30), getdate()-@startTime,108) + ' hh:mm:ss.'
		select cast(query as char(8)) query
				, min(cpu_sec) mincpu, avg(Cpu_sec) cpu,max(cpu_sec) maxcpu 
				, min(elapsed_time) minElapsed, avg(elapsed_time) elapsed, max(elapsed_time) max_elapsed
				, min(physical_IO) minIO, avg(physical_IO) IO , max(physical_IO) maxIO
				, varp(Cpu_sec) vcpu, varp(elapsed_time) velapsed, varp(physical_IO) vIO
 		from queryResults  
		where time >= @startTime
		group by query 
		order by query
END

GO
/****** Object:  StoredProcedure [dbo].[spTestTimeEnd]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spTestTimeEnd](
	@clock 	     datetime,
	@elapsed     bigint        OUTPUT,
	@cpu 	     bigint        OUTPUT, 
        @physical_io bigint	   OUTPUT,
	@query	     varchar(10)  = '',
        @comment     varchar(100) = '', 
	@print       int        =0,
	@table       int        =0,
	@row_count   bigint     =0
)
---------------------------------------------------
--/H Stops the clock for performance testing and optionally records stats in QueryResults and in sysOut. 
--/A 
--/T  <p>parameters are (inputs should be set with spTestTimeStart as shown in example):
--/T       <li> clock datetime (input)       : current 64bit wallclock datetime
--/T       <li> elapsed float (output)       : elapsed milliseconds of wall clock time  
--/T       <li> cpu fkiat (input, output)    : an int of milliseconds of cpu time (wraps frequently so gives bogus answers)
--/T       <li> physical_Io bigint (input, output): count of disk reads and writes
--/T       <li> query varchar(10) (input)    : short text string describing the query
--/T       <li> commment varchar(100) (input) : longer text string describing the experiment
--/T       <li> print (input)       	      : flag, if true prints the output statistics on the console (default =no)
--/T       <li> table (input)                 : flag, if true inserts the statistics in the QueryResults table (default = no)
--/T       <li> row_Count(input)              : passed in RowCount_big for statistics
--/T  Here is an example that uses spTestTimeStart and spTestTimeEnd to record the cost of 
--/T  some SQL statements. The example both records the results in the QueryResults table
--/T  and also prints out a message summarizing the test (that is what the 1,1 flags are for.)
--/T  <samp>
--/T  <br>declare @clock datetime, @cpu bigint, @physical_io bigint,  @elapsed bigint;
--/T  <br>exec spTestTimeStart  @clock OUTPUT, @cpu OUTPUT, @physical_io OUTPUT
--/T  <br>  .... do some SQL work....
--/T  <br>exec spTestTimeEnd @clock, @elapsed, @cpu, @physical_io, 
--/T  <br>                          'Q10', '1GB buffer pool, read committed', 1, 1, @@RowCount_big
--/T  </samp><p>
--/T  see also spTestTimeStart
---------------------------------------------------
AS	
BEGIN
	set nocount on;
	--
	select  @elapsed = datediff(ms, @clock, getdate()),
		@cpu = (@@CPU_BUSY - @cpu) * @@TIMETICKS, -- scale by ticks per microsecond
       		@physical_io = (@@TOTAL_READ + @@TOTAL_WRITE) - @physical_io
	-- treat wraparound of counters as a zero value
	if @cpu < 0			set @cpu = 0
	if @physical_io < 0 set @physical_io = 0
	-- printout
	if (@print >0)
           begin
           print @query
               + ' cpu: '              + str(@cpu/1000000.0, 8,2)   
               + ' sec, elapsed: '     + str(@elapsed/1000.0,8,2) 
               + ' sec, physical_io: ' + cast(@physical_io as varchar(20))
               + ' row_count: '        + cast(@row_count as varchar(20))
	       + ' comment: ' + @comment 
           end
	-- table record
	if (@table > 0)
           begin
           insert dbo.QueryResults
              values(@query, @cpu/1000000.0, @elapsed/1000.0, @physical_io, @row_count,CURRENT_TIMESTAMP, @comment);
           end          
	return
END

GO
/****** Object:  StoredProcedure [dbo].[spTestTimeStart]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spTestTimeStart](	
	@clock 	     datetime	OUTPUT,
	@cpu 	     bigint     OUTPUT, 
        @physical_io bigint	OUTPUT
)
----------------------------------------------------------------------
--/H Starts the wall, cpu, and IO clocks for performance testing 
--/A 
--/T  parameters are:
--/T	  <li> clock (output):		current 64bit wallclock datetime
--/T      <li> cpu (output):		 bigint of cpu milliseconds (wraps frequently so gives bogus answers)
--/T      <li> physical_Io (output): bigint count of disk reads and writes
--/T  <br>
--/T  Here is an example that uses spTestTimeStart and spTestTimeEnd to record the cost of 
--/T  some SQL statements. The example both records the results in the QueryResults table
--/T  and also prints out a message summarizing the test (that is what the 1,1 flags are for.)
--/T  <samp>
--/T  <br>declare @clock datetime, @cpu bigint, @physical_io bigint,  @elapsed bigint;
--/T  <br>exec spTestTimeStart  @clock OUTPUT, @cpu OUTPUT, @physical_io OUTPUT
--/T  <br>  .... do some SQL work....
--/T  <br>exec spTestTimeEnd @clock, @elapsed, @cpu, @physical_io, 
--/T  <br>                           'Q10', '1GB buffer pool, read committed', 1, 1, @@RowCount_big
--/T  </samp><p>
--/T  see also spTestTimeEnd
---------------------------------------------------
AS
BEGIN
	SELECT	@clock	= getdate(), 
		@cpu	= @@CPU_BUSY, 
       		@physical_io = @@TOTAL_READ + @@TOTAL_WRITE
	RETURN
END

GO
/****** Object:  StoredProcedure [dbo].[spTestUniqueKey]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spTestUniqueKey](
	@taskid int, 
	@stepid int,
	@Table varchar(256), 		
	@fields varchar(256), 
	@error bigint OUTPUT
)
-------------------------------------------------------------
--/H Tests a unique key, gives error if test finds non unique key
--/A 
--/T
--/T    tests to see that sourceTable(key)is a unique key 
--/T    key can involve multipe fields as in neighbors (objID, neighborObjID)
--/T  
--/T    Returns @error = 0 if all keys unique  
--/T	@error >0  if duplicate keys (in which case it is the count of duplicate keys.
--/T
--/T    In the failure case it inserts messages in the phase table 
--/T <p> parameters:  
--/T <li> taskid bigint,   		-- task identifier
--/T <li> stepid bigint,   		-- step identifier
--/T <li> table varchar() NOT NULL,   	-- name of table to test 
--/T <li> key varchar() NOT NULL,   	-- name of key in table to test
--/T <li> error int NOT NULL,         	-- output: 0 if OK (key is unique), non zero if key not unique
--/T <br>
--/T Sample call to test that photoObjAll.Objid is unique <br>
--/T <samp> 
--/T <br> exec spTestUniqueKey @taskid, @stepid, 'photoObjAll', 'ObjID', @error output
--/T </samp> 
--/T <br> see also spGenericTest, spTestForeignKey, 
-------------------------------------------------------------
AS BEGIN 
	SET NOCOUNT ON;
	DECLARE @errorMsg varchar(1000), @command varchar(1000);

	-- drop test table if it was left behind by other tests.
	IF EXISTS (SELECT [name]FROM   sysobjects 
		WHERE  [name]= N'test' )
		DROP TABLE test; 

	-- create an index to make things go fast
	DECLARE @indexName varchar (100)
	set @indexName = @table + '_index_' +  cast(cast(rand()*100000000 as int)as varchar(100))  
	
	SET @command = 'CREATE INDEX ' + @indexName + ' ON ' 
			+ @Table + '(' + @fields + ')'
	-- print @command
	EXEC (@command)

	-- test uniqueness
	SET @command = 	' select '+ @fields + 
 			' into test '  +
			' from ' + @Table  +
			' group by ' + @fields +   
  			' having count_big(*) > 1';
	EXEC (@command)

	-- test table is empty if keys are unique.
	SELECT @error = count_big(*) FROM test;
	IF (@error > 0) 
	    BEGIN
		SET @errorMsg = 'Unique key test on '+ @Table + '(' + @fields + ')'
			+ ' failed ' + cast(@error as varchar (10)) + ' times. '         
	   	EXEC spNewPhase @taskid, @stepid, 'Unique key test', 'ERROR', @errorMsg 
	    END
	ELSE
	    BEGIN
		SET @errorMsg = 'Unique key test passed on '+ @Table + '(' + @fields + ')'   
	    	EXEC spNewPhase @taskid, @stepid, 'Unique key test', 'OK', @errorMsg 
	    END

	-- clean up test table on exit.
	DROP TABLE test
	RETURN @error
END		-- End spTestUniqueKey()
--===========================================================

GO
/****** Object:  StoredProcedure [dbo].[spTiledTargetDuplicates]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE PROCEDURE [dbo].[spTiledTargetDuplicates] (@counts int OUTPUT)
-------------------------------------------------------------
--/H  procedure to mark duplicate tiled targets
--/A --------------------------------------------------------
--/T  
------------------------------------------------------------- 
AS BEGIN
	SET NOCOUNT ON;
	DECLARE @tile smallint, @ra float, @dec float, @r float;
	DECLARE @qa int, @sky int, @spectrophoto_std int;
	set @qa = (select dbo.fSourceType('QA'));
	set @sky = (select dbo.fSourceType('SKY'));
	set @spectrophoto_std = (select dbo.fSourceType('SPECTROPHOTO_STD'));
	DECLARE tt_cursor CURSOR
		FOR SELECT tt.tile,tt.ra,tt.[dec]
		FROM TiledTarget tt, TargetInfo ti, Tile
		WHERE tt.sourcetype not in (@qa,@sky,@spectrophoto_std)
		AND tt.tile = Tile.tile
		AND Tile.programType = 0
		AND tt.targetID = ti.targetID
		AND ti.skyVersion = 0
		AND ti.targetMode = 1
	set @r = 0.5/60.0;
	OPEN tt_cursor;
	WHILE (1 = 1)
	BEGIN
	    FETCH NEXT FROM tt_cursor
		INTO  	@tile, @ra, @dec
	    IF (@@FETCH_STATUS != 0) BREAK;
	    SET @counts = (	select count(*) 
		from dbo.fgetNearbyTiledTargetsEq(@ra,@dec,@r) ntt, targetinfo ti, Tile
		where ntt.sourcetype not in (@qa,@sky,@spectrophoto_std)
		and ntt.tile = Tile.tile
		and Tile.programType = 0
		and ntt.tile < @tile
		and ntt.targetID = ti.targetID
		and ti.skyVersion = 0
		and ti.targetMode = 1);
	    IF (@counts > 0)
		BEGIN
			UPDATE 	TiledTarget
			SET	TiledTarget.duplicate = 1
			WHERE CURRENT OF tt_cursor;
		END
	END
	CLOSE tt_cursor;
	DEALLOCATE tt_cursor;
END
GO
/****** Object:  StoredProcedure [dbo].[spTransposeRmatrix]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE PROCEDURE [dbo].[spTransposeRmatrix](@to varchar(16), @from varchar(16))
-------------------------------------------------------
--/H Transposes and stores a rotation matrix
--/A --------------------------------------------------
--/T 
--/T 
-------------------------------------------------------
AS BEGIN
    --
    -- build the transpose
    --
    DECLARE @r11 float, @r12 float, @r13 float;
    DECLARE @r21 float, @r22 float, @r23 float;
    DECLARE @r31 float, @r32 float, @r33 float;
    --
    -- get the matrix
    --
    SELECT @r11=x, @r12=y, @r13=z FROM Rmatrix WHERE mode = @to and row=1
    SELECT @r21=x, @r22=y, @r23=z FROM Rmatrix WHERE mode = @to and row=2
    SELECT @r31=x, @r32=y, @r33=z FROM Rmatrix WHERE mode = @to and row=3
    --
    INSERT INTO Rmatrix VALUES(@from,1,@r11,@r21,@r31);
    INSERT INTO Rmatrix VALUES(@from,2,@r12,@r22,@r32);
    INSERT INTO Rmatrix VALUES(@from,3,@r13,@r23,@r33);
    --
END
GO
/****** Object:  StoredProcedure [dbo].[spTruncateFileGroupMap]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE PROCEDURE [dbo].[spTruncateFileGroupMap] 
-----------------------------------------------------------
--/H Clear the values in the FileGroupMap table
--/A
--/T <PRE> EXEC spTruncateFileGroupMap 1</PRE>
-----------------------------------------------------------
AS
BEGIN
	TRUNCATE TABLE FileGroupMap
	RETURN
END
GO
/****** Object:  StoredProcedure [dbo].[spUpdateSkyServerCrossCheck]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spUpdateSkyServerCrossCheck]
-------------------------------------------------------------------
--/H Update the contents of the SiteDiagnostics table
--/A
--/T This procedure copies the Diagnostics into the
--/T SiteDiagnostics table, then it update the value of
--/T the DB checksum and timestamp.
--/T It is used to cross-check the patches applied to the database
--/T <PRE>EXEC spUpdateSkyServerCrossCheck</PRE>
-------------------------------------------------------------------
AS
BEGIN
    --
    -- clear the SiteDiagnostics table
    --
    TRUNCATE TABLE SiteDiagnostics
    --
    -- replicate Diagnostics
    --
    INSERT INTO SiteDiagnostics
	SELECT * FROM Diagnostics
    --
    -- update the checksum
    --
    UPDATE SiteConstants
		SET value = cast(dbo.fGetDiagChecksum() as varchar(64))
		WHERE name='Checksum'
    --
    -- update the timestamp
    --
    UPDATE SiteConstants
		SET value = cast(getdate() as varchar(64))
		WHERE name='DB Version Date'
    --
END
GO
/****** Object:  StoredProcedure [dbo].[spUpdateStatistics]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUpdateStatistics] 
---------------------------------------
--/H Update the statistics on user tables
--/A
--/T Update the statistics on the user tables
--/T no parameters
--/T <samp>  exec spUpdateStatistics </samp>
---------------------------------------
AS BEGIN
    --
    SET NOCOUNT ON;
    --
    DECLARE userObject CURSOR READ_ONLY
	FOR select name from sysobjects 
	where type in ('U ')  -- for indexed views if we ever have them, 'V ') 
  	  and name not like 'dt_%'
    --
    DECLARE @name varchar(256)
    OPEN userObject
    --
    WHILE (@@fetch_status <> -1)
    BEGIN
	FETCH NEXT FROM userObject INTO @name
	IF (@@fetch_status != 0) BREAK
	EXEC ('UPDATE STATISTICS ' + @name)	
    END
    --
    CLOSE userObject
    DEALLOCATE userObject
    --
    RETURN
END
GO
/****** Object:  StoredProcedure [dbo].[spValidateApogee]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spValidateApogee] (
	@taskid int, 
	@stepid int,
	@destinationDB varchar(16)
)
-------------------------------------------------------------
--/H  Validate resolve tables  
--/A 
--/T <p> parameters:   
--/T <li> taskid int,   		-- Task identifier
--/T <li> stepid int,   		-- Step identifier
--/T <li> destinationDB int,   		-- Name of destination DB 
--/T <li> returns  0 if OK, non zero if something wrong  
--/T <br>
--/T Sample call:<br>
--/T <samp> 
--/T <br> exec  spValidateApogee @taskid , @stepid, 'targetDB'  
--/T </samp> 
--/T <br>  
------------------------------------------------------------- 
AS BEGIN
    	--
    	SET NOCOUNT ON

    	--- Globals
    	DECLARE	@start datetime,
		@summary bigint,
		@error bigint,
		@errorMsg varchar(1000),
		@verb varchar(16)

    -- Put out step greeting
    EXEC spNewPhase @taskid, @stepid, 'spValidateApogee', 'OK', 'spValidateApogee called'; 

    -------------------------------------
    SET @start  = current_timestamp
    SET @summary = 0

	---------------------
	-- test unique keys
	---------------------
	exec dbo.spTestUniqueKey  @taskid , @stepid,  'apogeeVisit', 'visit_id', @error OUTPUT
	set @summary = @summary + @error;

	-- generate completion message.
	IF @summary = 0
            BEGIN
	    	exec dbo.spTestUniqueKey  @taskid , @stepid,  'apogeeStar', 'apstar_id', @error OUTPUT
		set @summary = @summary + @error;
            END

                
	IF @summary = 0
            BEGIN
	    	exec dbo.spTestUniqueKey  @taskid , @stepid,  'aspcapStar', 'aspcap_id', @error OUTPUT
		set @summary = @summary + @error;
            END

                
	IF @summary = 0
            BEGIN
	    	exec dbo.spTestUniqueKey  @taskid , @stepid,  'apogeePlate', 'plate_visit_id', @error OUTPUT
		set @summary = @summary + @error;
            END

                
	IF @summary = 0
            BEGIN
	    	exec dbo.spTestUniqueKey  @taskid , @stepid,  'apogeeObject', 'target_id', @error OUTPUT
		set @summary = @summary + @error;
            END

                
	IF @summary = 0
            BEGIN
	    	exec dbo.spTestUniqueKey  @taskid , @stepid,  'apogeeDesign', 'designid', @error OUTPUT
		set @summary = @summary + @error;
            END

                
	IF @summary = 0
            BEGIN
	    	exec dbo.spTestUniqueKey  @taskid , @stepid,  'apogeeStarVisit', 'visit_id', @error OUTPUT
		set @summary = @summary + @error;
            END

                
	IF @summary = 0
            BEGIN
	    	exec dbo.spTestUniqueKey  @taskid , @stepid,  'apogeeStarAllVisit', 'visit_id,apstar_id', @error OUTPUT
		set @summary = @summary + @error;
            END

                
	IF @summary = 0
            BEGIN
	    	exec dbo.spTestUniqueKey  @taskid , @stepid,  'cannonStar', 'cannon_id', @error OUTPUT
		set @summary = @summary + @error;
            END

                
	IF @summary = 0 
	    BEGIN
		SET @errorMsg =   'APOGEE tables validated in '  
			+ cast(dbo.fDatediffSec(@start, current_timestamp) as varchar(30))+ ' seconds'
		SET @verb = 'OK'
	    END
	ELSE 	
	    BEGIN
		SET @errorMsg =   'APOGEE tables validation found ' +str(@summary) + ' errors in ' 
			+ cast(dbo.fDatediffSec(@start, current_timestamp) as varchar(30)) + ' seconds'
		SET @verb = 'ERROR'
	    END

	EXEC spNewPhase @taskid, @stepid, 'spValidateApogee', @verb, @errorMsg ;
	
	RETURN @summary
END		-- End spValidateApogee()
--======================================

GO
/****** Object:  StoredProcedure [dbo].[spValidateGalProd]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spValidateGalProd] (
	@taskid int, 
	@stepid int,
	@destinationDB varchar(16)
)
-------------------------------------------------------------
--/H  Validate galaxy product tables  
--/A 
--/T <p> parameters:   
--/T <li> taskid int,   		-- Task identifier
--/T <li> stepid int,   		-- Step identifier
--/T <li> destinationDB int,   		-- Name of destination DB 
--/T <li> returns  0 if OK, non zero if something wrong  
--/T <br>
--/T Sample call:<br>
--/T <samp> 
--/T <br> exec  spValidateGalProd @taskid , @stepid, 'targetDB'  
--/T </samp> 
--/T <br>  
------------------------------------------------------------- 
AS BEGIN
	SET NOCOUNT ON

	--- Globals
	DECLARE @start datetime, 
		@summary bigint, 
		@error bigint,
		@errorMsg varchar(1000), 
		@verb varchar(16)

	-- Put out step greeting.
	EXEC spNewPhase @taskid, @stepid, 'spValidateGalProd', 'OK', 'spValidateGalProd called'; 

	-------------------------------------
	SET @start  = current_timestamp
	SET @summary = 0

	--------------------
	-- test unique keys
	--------------------
	exec dbo.spTestUniqueKey  @taskid , @stepid,  'emissionLinesPort',  'specObjID',	@error OUTPUT
	set @summary = @summary + @error;
	exec dbo.spTestUniqueKey  @taskid , @stepid,  'stellarMassFSPSGranEarlyDust',   'specObjID',	@error OUTPUT
	set @summary = @summary + @error;
	exec dbo.spTestUniqueKey  @taskid , @stepid,  'stellarMassFSPSGranEarlyNoDust',   'specObjID',	@error OUTPUT
	set @summary = @summary + @error;
	exec dbo.spTestUniqueKey  @taskid , @stepid,  'stellarMassFSPSGranWideDust',   'specObjID',	@error OUTPUT
	set @summary = @summary + @error;
	exec dbo.spTestUniqueKey  @taskid , @stepid,  'stellarMassFSPSGranWideNoDust',   'specObjID',	@error OUTPUT
	set @summary = @summary + @error;
	exec dbo.spTestUniqueKey  @taskid , @stepid,  'stellarMassPassivePort',   'specObjID',	@error OUTPUT
	set @summary = @summary + @error;
	exec dbo.spTestUniqueKey  @taskid , @stepid,  'stellarMassPCAWiscBC03',   'specObjID',	@error OUTPUT
	set @summary = @summary + @error;
	exec dbo.spTestUniqueKey  @taskid , @stepid,  'stellarMassPCAWiscM11',   'specObjID',	@error OUTPUT
	set @summary = @summary + @error;
	exec dbo.spTestUniqueKey  @taskid , @stepid,  'stellarMassStarformingPort',   'specObjID',	@error OUTPUT
	set @summary = @summary + @error;

	-- generate completion message.
	SET @error = @summary
	IF @summary = 0 
	    BEGIN
		SET @errorMsg =   'GalProd validated in '  
			+ cast(dbo.fDatediffSec(@start, current_timestamp) as varchar(30))+ ' seconds'
		SET @verb = 'OK'
	    END
	ELSE 	
	    BEGIN
		SET @errorMsg =   'GalProd validation found ' +str(@summary) + ' errors in ' 
			+ cast(dbo.fDatediffSec(@start, current_timestamp) as varchar(30)) + ' seconds'
		SET @verb = 'ERROR'
	    END

	EXEC spNewPhase @taskid, @stepid, 'spValidateGalProd', @verb, @errorMsg ;	
	RETURN @error	-- return
END		-- End spValidateGalProd()

GO
/****** Object:  StoredProcedure [dbo].[spValidateGalSpec]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spValidateGalSpec] (
	@taskid int, 
	@stepid int,
	@destinationDB varchar(16)
)
-------------------------------------------------------------
--/H  Validate GalSpec tables  
--/A 
--/T <p> parameters:   
--/T <li> taskid int,   		-- Task identifier
--/T <li> stepid int,   		-- Step identifier
--/T <li> destinationDB int,   		-- Name of destination DB 
--/T <li> returns  0 if OK, non zero if something wrong  
--/T <br>
--/T Sample call:<br>
--/T <samp> 
--/T <br> exec  spValidateGalSpec @taskid , @stepid, 'targetDB'  
--/T </samp> 
--/T <br>  
------------------------------------------------------------- 
AS BEGIN
	SET NOCOUNT ON

	--- Globals
	DECLARE @start datetime, 
		@summary bigint, 
		@error bigint,
		@errorMsg varchar(1000), 
		@verb varchar(16)

	-- Put out step greeting.
	EXEC spNewPhase @taskid, @stepid, 'spValidateGalSpec', 'OK', 'spValidateGalSpec called'; 

	-------------------------------------
	SET @start  = current_timestamp
	SET @summary = 0

	--------------------
	-- test unique keys
	--------------------
	exec dbo.spTestUniqueKey  @taskid , @stepid,  'galSpecExtra',  'specObjID',	@error OUTPUT
	set @summary = @summary + @error;
	exec dbo.spTestUniqueKey  @taskid , @stepid,  'galSpecIndx',   'specObjID',	@error OUTPUT
	set @summary = @summary + @error;
	exec dbo.spTestUniqueKey  @taskid , @stepid,  'galSpecInfo',   'specObjID',	@error OUTPUT
	set @summary = @summary + @error;
	exec dbo.spTestUniqueKey  @taskid , @stepid,  'galSpecLine',   'specObjID',	@error OUTPUT
	set @summary = @summary + @error;

	-- generate completion message.
	SET @error = @summary
	IF @summary = 0 
	    BEGIN
		SET @errorMsg =   'GalSpec validated in '  
			+ cast(dbo.fDatediffSec(@start, current_timestamp) as varchar(30))+ ' seconds'
		SET @verb = 'OK'
	    END
	ELSE 	
	    BEGIN
		SET @errorMsg =   'GalSpec validation found ' +str(@summary) + ' errors in ' 
			+ cast(dbo.fDatediffSec(@start, current_timestamp) as varchar(30)) + ' seconds'
		SET @verb = 'ERROR'
	    END

	EXEC spNewPhase @taskid, @stepid, 'spValidateGalSpec', @verb, @errorMsg ;	
	RETURN @error	-- return
END		-- End spValidateGalSpec()

GO
/****** Object:  StoredProcedure [dbo].[spValidateManga]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spValidateManga] (
	@taskid int, 
	@stepid int,
	@destinationDB varchar(16)
)
-------------------------------------------------------------
--/H  Validate MaNGA tables  
--/A 
--/T <p> parameters:   
--/T <li> taskid int,   		-- Task identifier
--/T <li> stepid int,   		-- Step identifier
--/T <li> destinationDB int,   		-- Name of destination DB 
--/T <li> returns  0 if OK, non zero if something wrong  
--/T <br>
--/T Sample call:<br>
--/T <samp> 
--/T <br> exec  spValidateManga @taskid , @stepid, 'targetDB'  
--/T </samp> 
--/T <br>  
------------------------------------------------------------- 
AS BEGIN
    	--
    	SET NOCOUNT ON

    	--- Globals
    	DECLARE	@start datetime,
		@summary bigint,
		@error bigint,
		@errorMsg varchar(1000),
		@verb varchar(16)

    -- Put out step greeting
    EXEC spNewPhase @taskid, @stepid, 'spValidateManga', 'OK', 'spValidateManga called'; 

    -------------------------------------
    SET @start  = current_timestamp
    SET @summary = 0

	---------------------
	-- test unique keys
	---------------------
	exec dbo.spTestUniqueKey  @taskid , @stepid,  'mangaDrpAll',          	'plateIFU',	@error OUTPUT
	set @summary = @summary + @error;
 
	exec dbo.spTestUniqueKey  @taskid , @stepid,  'mangaTarget',          	'mangaID',	@error OUTPUT
	set @summary = @summary + @error;
 
	-- generate completion message.

	IF @summary = 0 
	    BEGIN
		SET @errorMsg =   'MaNGA tables validated in '  
			+ cast(dbo.fDatediffSec(@start, current_timestamp) as varchar(30))+ ' seconds'
		SET @verb = 'OK'
	    END
	ELSE 	
	    BEGIN
		SET @errorMsg =   'MaNGA tables validation found ' +str(@summary) + ' errors in ' 
			+ cast(dbo.fDatediffSec(@start, current_timestamp) as varchar(30)) + ' seconds'
		SET @verb = 'ERROR'
	    END

	EXEC spNewPhase @taskid, @stepid, 'spValidateManga', @verb, @errorMsg ;
	
	RETURN @summary
END		-- End spValidateManga()
--======================================

GO
/****** Object:  StoredProcedure [dbo].[spValidateMask]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spValidateMask] (
	@taskid int, 
	@stepid int,
	@destinationDB varchar(16)
)
-------------------------------------------------------------
--/H  Validate Mask tables  
--/A 
--/T <p> parameters:   
--/T <li> taskid int,   		-- Task identifier
--/T <li> stepid int,   		-- Step identifier
--/T <li> destinationDB int,   		-- Name of destination DB 
--/T <li> returns  0 if OK, non zero if something wrong  
--/T <br>
--/T Sample call:<br>
--/T <samp> 
--/T <br> exec  spValidateMask @taskid , @stepid, 'targetDB'  
--/T </samp> 
--/T <br>  
------------------------------------------------------------- 
AS BEGIN
    	--
    	SET NOCOUNT ON

    	--- Globals
    	DECLARE	@start datetime,
		@summary bigint,
		@error bigint,
		@errorMsg varchar(1000),
		@verb varchar(16)

    -- Put out step greeting
    EXEC spNewPhase @taskid, @stepid, 'spValidateMask', 'OK', 'spValidateMask called'; 

    -------------------------------------
    SET @start  = current_timestamp
    SET @summary = 0

	---------------------
	-- test unique keys
	---------------------
	exec dbo.spTestUniqueKey  @taskid , @stepid,  'Mask',          	'maskID',	@error OUTPUT
	set @summary = @summary + @error;
 
	-- generate completion message.

	IF @summary = 0 
	    BEGIN
		SET @errorMsg =   'mask tables validated in '  
			+ cast(dbo.fDatediffSec(@start, current_timestamp) as varchar(30))+ ' seconds'
		SET @verb = 'OK'
	    END
	ELSE 	
	    BEGIN
		SET @errorMsg =   'mask tables validation found ' +str(@summary) + ' errors in ' 
			+ cast(dbo.fDatediffSec(@start, current_timestamp) as varchar(30)) + ' seconds'
		SET @verb = 'ERROR'
	    END

	EXEC spNewPhase @taskid, @stepid, 'spValidateMask', @verb, @errorMsg ;
	
	RETURN @summary
END		-- End spValidateMask()
--======================================

GO
/****** Object:  StoredProcedure [dbo].[spValidateNSA]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spValidateNSA] (
	@taskid int, 
	@stepid int,
	@destinationDB varchar(16)
)
-------------------------------------------------------------
--/H  Validate NSA tables  
--/A 
--/T <p> parameters:   
--/T <li> taskid int,   		-- Task identifier
--/T <li> stepid int,   		-- Step identifier
--/T <li> destinationDB int,   		-- Name of destination DB 
--/T <li> returns  0 if OK, non zero if something wrong  
--/T <br>
--/T Sample call:<br>
--/T <samp> 
--/T <br> exec  spValidateNSA @taskid , @stepid, 'targetDB'  
--/T </samp> 
--/T <br>  
------------------------------------------------------------- 
AS BEGIN
    	--
    	SET NOCOUNT ON

    	--- Globals
    	DECLARE	@start datetime,
		@summary bigint,
		@error bigint,
		@errorMsg varchar(1000),
		@verb varchar(16)

    -- Put out step greeting
    EXEC spNewPhase @taskid, @stepid, 'spValidateNSA', 'OK', 'spValidateNSA called'; 

    -------------------------------------
    SET @start  = current_timestamp
    SET @summary = 0

	---------------------
	-- test unique keys
	---------------------
	exec dbo.spTestUniqueKey  @taskid , @stepid,  'nsatlas',          	'nsaid',	@error OUTPUT
	set @summary = @summary + @error;
 
	-- generate completion message.

	IF @summary = 0 
	    BEGIN
		SET @errorMsg =   'NSA tables validated in '  
			+ cast(dbo.fDatediffSec(@start, current_timestamp) as varchar(30))+ ' seconds'
		SET @verb = 'OK'
	    END
	ELSE 	
	    BEGIN
		SET @errorMsg =   'NSA tables validation found ' +str(@summary) + ' errors in ' 
			+ cast(dbo.fDatediffSec(@start, current_timestamp) as varchar(30)) + ' seconds'
		SET @verb = 'ERROR'
	    END

	EXEC spNewPhase @taskid, @stepid, 'spValidateNSA', @verb, @errorMsg ;
	
	RETURN @summary
END		-- End spValidateNSA()
--======================================

GO
/****** Object:  StoredProcedure [dbo].[spValidatePhoto]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spValidatePhoto] (
	@taskid int, 
	@stepid int,
	@type varchar(16),
	@destinationDB varchar(16)
)
-------------------------------------------------------------
--/H  Validate Photo object of a given type  
--/A 
--/T <p> parameters:   
--/T <li> taskid int,   		-- Task identifier
--/T <li> stepid int,   		-- Step identifier
--/T <li> targetType int,   		-- 'best', 'runs','target', 'tiling'  
--/T <li> destinationDB int,   		-- Name of destination DB 
--/T <li> returns  0 if OK, non zero if something wrong  
--/T <br>
--/T Sample call:<br>
--/T <samp> 
--/T <br> exec  spValidatePhoto @taskid , @stepid, 'best', 'targetDB'  
--/T </samp> 
--/T <br>  
------------------------------------------------------------- 
AS BEGIN
    --
    SET NOCOUNT ON;
    --- setup  
    DECLARE 
	@summary bigint, 
	@error bigint,
	@start datetime,
	@errorMsg varchar(1000),
	@verb varchar(16),
	@command varchar (1000)

    SET @start = current_timestamp
    SET @summary = 0

    -- Greeting
    EXEC spNewPhase @taskid, @stepid, 'spValidatePhoto', 'OK', 'spValidatePhoto called'
  
	--------------------------
	--- Test Photo uniqueness
	--------------------------
	exec dbo.spTestUniqueKey  @taskid , @stepid,  'StripeDefs',    	'stripe',	@error OUTPUT
	set @summary = @summary + @error;
	exec dbo.spTestUniqueKey  @taskid , @stepid,  'Field',		'FieldID',	@error OUTPUT
	set @summary = @summary + @error;
	exec dbo.spTestUniqueKey  @taskid , @stepid,  'FieldProfile',	'fieldID, bin, band', @error OUTPUT
	set @summary = @summary + @error;
	exec dbo.spTestUniqueKey  @taskid , @stepid,  'Frame',		'FieldID,Zoom',	@error OUTPUT
	set @summary = @summary + @error;
	exec dbo.spTestUniqueKey  @taskid , @stepid,  'PhotoObjAll',	'objID',	@error OUTPUT
	set @summary = @summary + @error; 
	exec dbo.spTestUniqueKey  @taskid , @stepid,  'PhotoProfile',  	'objID, bin, band', @error OUTPUT
	set @summary = @summary + @error;
--	exec dbo.spTestUniqueKey  @taskid , @stepid,  'PhotoZ',        	'objID',	@error OUTPUT
--	set @summary = @summary + @error;
	exec dbo.spTestUniqueKey  @taskid , @stepid,  'First',		'objID',	@error OUTPUT
	set @summary = @summary + @error;
--	exec dbo.spTestUniqueKey  @taskid , @stepid,  'Rosat',         	'objID',	@error OUTPUT
--	set @summary = @summary + @error;
--	exec dbo.spTestUniqueKey  @taskid , @stepid,  'USNO',          	'objID',	@error OUTPUT
--	set @summary = @summary + @error;
	exec dbo.spTestUniqueKey  @taskid , @stepid,  'Mask',          	'maskID',	@error OUTPUT
	set @summary = @summary + @error;
	exec dbo.spTestUniqueKey  @taskid , @stepid,  'AtlasOutline',        'objID',	@error OUTPUT
	set @summary = @summary + @error;
/* Commented out tests for Target tables - these tables are empty or deleted.
	exec dbo.spTestUniqueKey  @taskid , @stepid,  'Target',         'targetID',	@error OUTPUT
	set @summary = @summary + @error;
	-- remove the next if Southern Imaging
	exec dbo.spTestUniqueKey  @taskid , @stepid,  'TargetInfo',    	'targetObjID',	@error OUTPUT
	set @summary = @summary + @error;
	exec dbo.spTestUniqueKey  @taskid , @stepid,  'TargetInfo',    	'skyVersion,targetID',	@error OUTPUT
	set @summary = @summary + @error;
	exec dbo.spTestUniqueKey  @taskid , @stepid,  'TargetParam',    'targetVersion,name',	@error OUTPUT
	set @summary = @summary + @error;
 */
 
	--select 'Photo uniqueness summary is ' + cast(@summary as varchar(20)) 
  
	----------------------------------
	--- Test the photoObjAll foreign Keys
	---------------------------------- 
	exec dbo.spTestForeignKey @taskid , @stepid,  'Frame',        'Field',      'fieldID', @error OUTPUT
	set @summary = @summary + @error;
	exec dbo.spTestForeignKey @taskid , @stepid,  'FieldProfile', 'Field',      'fieldID', @error OUTPUT
	set @summary = @summary + @error;
	exec dbo.spTestForeignKey @taskid , @stepid,  'PhotoObjAll',     'Field',      'fieldID', @error OUTPUT
	set @summary = @summary + @error;
	exec dbo.spTestForeignKey @taskid , @stepid,  'PhotoProfile', 'photoObjAll',   'ObjID',   @error OUTPUT
	set @summary = @summary + @error;
--	exec dbo.spTestForeignKey @taskid , @stepid,  'PhotoZ',       'photoObjAll',   'ObjID',   @error OUTPUT
--	set @summary = @summary + @error;
	exec dbo.spTestForeignKey @taskid , @stepid,  'AtlasOutline',      'photoObjAll',   'ObjID',   @error OUTPUT
	set @summary = @summary + @error;
	exec dbo.spTestForeignKey @taskid , @stepid,  'First',        'photoObjAll',   'ObjID',   @error OUTPUT
	set @summary = @summary + @error;
	exec dbo.spTestForeignKey @taskid , @stepid,  'TargetInfo',    'Target',   'targetID', @error OUTPUT
	set @summary = @summary + @error;

	--===============
	-- Mask test
	--===============
	set @command =	'SELECT maskid INTO Test FROM Mask m '
		+ ' WHERE NOT EXISTS '
		+ '  (select fieldid from Field f '
		+ '   where m.run    = f.run '
		+ '     and m.rerun  = f.rerun '
		+ '     and m.camcol = f.camcol '
		+ '     and m.field  = f.field ) ';
	exec dbo.spGenericTest  @taskid , @stepid,  @command,        
		'Test Mask is in Field',
		'Mask objects do not match corresponding Field table',
		@error OUTPUT
	set @summary = @summary + @error;

	--====================
	-- Test cardinalities
	--====================
      -- testing Field.nTotal
	set @command = 	'select F.fieldID as BadKey, nTotal, count_big(*) as nTotalReal ' +
		'into test ' +
		'from Field as F join photoObjAll as P on F.fieldID = P.fieldID ' +
		'group by F.fieldID, nTotal ' +
		'having nTotal != count_big(*) '
	exec dbo.spGenericTest  @taskid , @stepid,  @command,        
		'Test Field.nTotal',
		'Field.nTotal does not match corresponding photoObjAll table',
		@error OUTPUT
	set @summary = @summary + @error;

/* Omit the zoom levels test for SDSS-III, will probably put it back in later [ART]
	-- do the zoom levels check only if this is not RUNS db
	if (@type != 'runs')
	    begin
		set @command = 	'SELECT field.fieldID, COUNT(DISTINCT  zoom) as zooms ' +
			'into test ' +
			'FROM field LEFT OUTER JOIN frame ON  field.fieldID = frame.fieldID ' +
			'GROUP BY field.fieldID ' +
			'HAVING COALESCE(COUNT(DISTINCT  zoom),-1) != 7 '
		exec dbo.spGenericTest  @taskid , @stepid,  @command,        
			'Test Field zoom levels',
			'some fields do not have seven zoom levels.',
			@error OUTPUT
		set @summary = @summary + @error;
	    end
*/

        -- testing photoObjAll.Nprofiles
	set @command =  'select top 10 P.objID as badKey, ' +
		'(nProf_u + nProf_g + nProf_r + nProf_i + nProf_z ) as nProf, ' +
		'count_big(*) as nProfReal ' +
		'into test ' +
		'from photoObjAll as P join PhotoProfile as PP on P.objID = PP.objID ' +
		'group by  P.objID,(nProf_u + nProf_g + nProf_r + nProf_i + nProf_z ) ' +
		'having (nProf_u + nProf_g + nProf_r + nProf_i + nProf_z ) != count_big(*) '
	exec dbo.spGenericTest  @taskid , @stepid,  @command,        
		'Test photoObjAll.nProf_ugriz',
		'photoObjAll.nProf_ugriz does not match corresponding PhotoProfile table',
		@error OUTPUT
	set @summary = @summary + @error;

/* Omit the HTM test for SDSS-III [ART]
	--===============
	-- Test the HTMs
	--===============
	exec dbo.spTestHtm  @taskid , @stepid,  'Frame',   @error OUTPUT   
	set @summary = @summary + @error;

	exec dbo.spTestHtm  @taskid , @stepid,  'Mask',   @error OUTPUT
	set @summary = @summary + @error;

	exec dbo.spTestHtm  @taskid , @stepid,  'photoObjAll',   @error OUTPUT
	set @summary = @summary + @error;
*/

	--=======================================================================
	-- test the parents, if there are problems, compute them.
	EXEC @error = dbo.spTestPhotoParentID @taskid , @stepid
	IF @error != 0
	    BEGIN 
		EXEC @error = dbo.spComputePhotoParentID @taskid , @stepid
 	    END
	SET @summary = @summary + @error

	--=======================================================================
	-- Clean up
	-- EXEC spDropIndexAll  -- IF YOU REALLY WANT TO CLEAN up the DB
	--=======================================================================

	-- give final summary of Step.
	IF @summary = 0 
	    BEGIN
		SET @errorMsg = 'Photo validated in '  
			+ cast(dbo.fDatediffSec(@start, current_timestamp) as varchar(30))+ ' seconds'
		SET @verb = 'OK'
	    END
	ELSE
	    BEGIN
		SET @errorMsg = 'Photo validation found ' +str(@summary) + ' errors in ' 
			+ cast(dbo.fDatediffSec(@start, current_timestamp) as varchar(30)) + ' seconds'
		SET @verb = 'ERROR'
	    END

	EXEC spNewPhase @taskid, @stepid, 'spValidatePhoto', @verb, @errorMsg ;
	 
	--=======================================================================
	-- common exit.
	SET @error = @summary
	RETURN @error
END	-- End spValidatePhoto()

GO
/****** Object:  StoredProcedure [dbo].[spValidatePlates]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spValidatePlates] (
	@taskid int, 
	@stepid int,
	@destinationDB varchar(16)
)
-------------------------------------------------------------
--/H  Validate Spectro object  
--/A 
--/T <p> parameters:   
--/T <li> taskid int,   		-- Task identifier
--/T <li> stepid int,   		-- Step identifier
--/T <li> destinationDB int,   		-- Name of destination DB 
--/T <li> returns  0 if OK, non zero if something wrong  
--/T <br>
--/T Sample call:<br>
--/T <samp> 
--/T <br> exec  spValidatePlates @taskid , @stepid, 'targetDB'  
--/T </samp> 
--/T <br>  
------------------------------------------------------------- 
AS BEGIN
	SET NOCOUNT ON

	--- Globals
	DECLARE @start datetime, 
		@summary bigint, 
		@error bigint,
		@errorMsg varchar(1000), 
		@verb varchar(16)

	-- Put out step greeting.
	EXEC spNewPhase @taskid, @stepid, 'spValidatePlates', 'OK', 'spValidatePlates called'; 

	-------------------------------------
	SET @start  = current_timestamp
	SET @summary = 0

	--------------------
	-- test unique keys
	--------------------
	exec dbo.spTestUniqueKey  @taskid , @stepid,  'PlateX',       'PlateID',	@error OUTPUT
	set @summary = @summary + @error;
	exec dbo.spTestUniqueKey  @taskid , @stepid,  'SpecObjAll',   'SpecObjID',	@error OUTPUT
	set @summary = @summary + @error;

  	----------------------------------
	--- Test the SpecObj foreign Keys 
	---------------------------------- 
	exec dbo.spTestForeignKey @taskid , @stepid,  'SpecObjAll',   'PlateX',      'PlateID',   @error OUTPUT
	set @summary = @summary + @error;

	-- test the HTMs
	exec dbo.spTestHtm  @taskid , @stepid,  'SpecObjAll',   @error OUTPUT
	set @summary = @summary + @error;

	-- generate completion message.
	SET @error = @summary
	IF @summary = 0 
	    BEGIN
		SET @errorMsg =   'Spectro validated in '  
			+ cast(dbo.fDatediffSec(@start, current_timestamp) as varchar(30))+ ' seconds'
		SET @verb = 'OK'
	    END
	ELSE 	
	    BEGIN
		SET @errorMsg =   'Spectro validation found ' +str(@summary) + ' errors in ' 
			+ cast(dbo.fDatediffSec(@start, current_timestamp) as varchar(30)) + ' seconds'
		SET @verb = 'ERROR'
	    END

	EXEC spNewPhase @taskid, @stepid, 'spValidatePlates', @verb, @errorMsg ;	
	RETURN @error	-- return
END		-- End spValidatePlates()

GO
/****** Object:  StoredProcedure [dbo].[spValidatePm]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spValidatePm] (
	@taskid int, 
	@stepid int,
	@destinationDB varchar(16)
)
-------------------------------------------------------------
--/H  Validate pm tables  
--/A 
--/T <p> parameters:   
--/T <li> taskid int,   		-- Task identifier
--/T <li> stepid int,   		-- Step identifier
--/T <li> destinationDB int,   		-- Name of destination DB 
--/T <li> returns  0 if OK, non zero if something wrong  
--/T <br>
--/T Sample call:<br>
--/T <samp> 
--/T <br> exec  spValidatePm @taskid , @stepid, 'targetDB'  
--/T </samp> 
--/T <br>  
------------------------------------------------------------- 
AS BEGIN
    	--
    	SET NOCOUNT ON

    	--- Globals
    	DECLARE	@start datetime,
		@summary bigint,
		@error bigint,
		@errorMsg varchar(1000),
		@verb varchar(16)

    -- Put out step greeting
    EXEC spNewPhase @taskid, @stepid, 'spValidatePm', 'OK', 'spValidatePm called'; 

    -------------------------------------
    SET @start  = current_timestamp
    SET @summary = 0

	---------------------
	-- test unique keys
	---------------------
	exec dbo.spTestUniqueKey  @taskid , @stepid,  'properMotions', 'objID', @error OUTPUT
	set @summary = @summary + @error;
 
	-- generate completion message.

	IF @summary = 0 
	    BEGIN
		SET @errorMsg =   'pm tables validated in '  
			+ cast(dbo.fDatediffSec(@start, current_timestamp) as varchar(30))+ ' seconds'
		SET @verb = 'OK'
	    END
	ELSE 	
	    BEGIN
		SET @errorMsg =   'pm tables validation found ' +str(@summary) + ' errors in ' 
			+ cast(dbo.fDatediffSec(@start, current_timestamp) as varchar(30)) + ' seconds'
		SET @verb = 'ERROR'
	    END

	EXEC spNewPhase @taskid, @stepid, 'spValidatePm', @verb, @errorMsg ;
	
	RETURN @summary
END		-- End spValidatePm()
--======================================

GO
/****** Object:  StoredProcedure [dbo].[spValidateResolve]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spValidateResolve] (
	@taskid int, 
	@stepid int,
	@destinationDB varchar(16)
)
-------------------------------------------------------------
--/H  Validate resolve tables  
--/A 
--/T <p> parameters:   
--/T <li> taskid int,   		-- Task identifier
--/T <li> stepid int,   		-- Step identifier
--/T <li> destinationDB int,   		-- Name of destination DB 
--/T <li> returns  0 if OK, non zero if something wrong  
--/T <br>
--/T Sample call:<br>
--/T <samp> 
--/T <br> exec  spValidateResolve @taskid , @stepid, 'targetDB'  
--/T </samp> 
--/T <br>  
------------------------------------------------------------- 
AS BEGIN
    	--
    	SET NOCOUNT ON

    	--- Globals
    	DECLARE	@start datetime,
		@summary bigint,
		@error bigint,
		@errorMsg varchar(1000),
		@verb varchar(16)

    -- Put out step greeting
    EXEC spNewPhase @taskid, @stepid, 'spValidateResolve', 'OK', 'spValidateResolve called'; 

    -------------------------------------
    SET @start  = current_timestamp
    SET @summary = 0

	---------------------
	-- test unique keys
	---------------------
	exec dbo.spTestUniqueKey  @taskid , @stepid,  'thingIndex', 'thingID', @error OUTPUT
	set @summary = @summary + @error;

	-- generate completion message.
	IF @summary = 0
            BEGIN
		select @error = count(thingID) 
		from thingIndex 
		where thingId NOT IN (select thingId from detectionIndex)
	    
		set @summary = @summary + @error;
                
		IF @summary > 0 
		    BEGIN
		        SET @errorMsg =   'resolve tables validation found ' +str(@summary) + ' thingIDs in thingIndex that were not in detectionIndex ' 
		        SET @verb = 'ERROR'
			EXEC spNewPhase @taskid, @stepid, 'spValidateResolve', @verb, @errorMsg ;
	            END
            END

	IF @summary = 0 
	    BEGIN
		SET @errorMsg =   'resolve tables validated in '  
			+ cast(dbo.fDatediffSec(@start, current_timestamp) as varchar(30))+ ' seconds'
		SET @verb = 'OK'
	    END
	ELSE 	
	    BEGIN
		SET @errorMsg =   'resolve tables validation found ' +str(@summary) + ' errors in ' 
			+ cast(dbo.fDatediffSec(@start, current_timestamp) as varchar(30)) + ' seconds'
		SET @verb = 'ERROR'
	    END

	EXEC spNewPhase @taskid, @stepid, 'spValidateResolve', @verb, @errorMsg ;
	
	RETURN @summary
END		-- End spValidateResolve()
--======================================

GO
/****** Object:  StoredProcedure [dbo].[spValidateSspp]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spValidateSspp] (
	@taskid int, 
	@stepid int,
	@destinationDB varchar(16)
)
-------------------------------------------------------------
--/H  Validate sspp tables  
--/A 
--/T <p> parameters:   
--/T <li> taskid int,   		-- Task identifier
--/T <li> stepid int,   		-- Step identifier
--/T <li> destinationDB int,   		-- Name of destination DB 
--/T <li> returns  0 if OK, non zero if something wrong  
--/T <br>
--/T Sample call:<br>
--/T <samp> 
--/T <br> exec  spValidateSspp @taskid , @stepid, 'targetDB'  
--/T </samp> 
--/T <br>  
------------------------------------------------------------- 
AS BEGIN
    	--
    	SET NOCOUNT ON

    	--- Globals
    	DECLARE	@start datetime,
		@summary bigint,
		@error bigint,
		@errorMsg varchar(1000),
		@verb varchar(16)

    -- Put out step greeting
    EXEC spNewPhase @taskid, @stepid, 'spValidateSspp', 'OK', 'spValidateSspp called'; 

    -------------------------------------
    SET @start  = current_timestamp
    SET @summary = 0

	---------------------
	-- test unique keys
	---------------------
	exec dbo.spTestUniqueKey  @taskid , @stepid,  'sppLines', 'specObjID', @error OUTPUT
	set @summary = @summary + @error;
	exec dbo.spTestUniqueKey  @taskid , @stepid,  'sppParams', 'specObjID', @error OUTPUT
	set @summary = @summary + @error;
	exec dbo.spTestUniqueKey  @taskid , @stepid,  'segueTargetAll', 'objID', @error OUTPUT
	set @summary = @summary + @error;
 
	-- generate completion message.

	IF @summary = 0 
	    BEGIN
		SET @errorMsg =   'sspp tables validated in '  
			+ cast(dbo.fDatediffSec(@start, current_timestamp) as varchar(30))+ ' seconds'
		SET @verb = 'OK'
	    END
	ELSE 	
	    BEGIN
		SET @errorMsg =   'sspp tables validation found ' +str(@summary) + ' errors in ' 
			+ cast(dbo.fDatediffSec(@start, current_timestamp) as varchar(30)) + ' seconds'
		SET @verb = 'ERROR'
	    END

	EXEC spNewPhase @taskid, @stepid, 'spValidateSspp', @verb, @errorMsg ;
	
	RETURN @summary
END		-- End spValidateSspp()
--======================================

GO
/****** Object:  StoredProcedure [dbo].[spValidateStep]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spValidateStep] (@taskid int, @stepID int output) 
----------------------------------------------------------------------
--/H Validation step, checks and augments Photo or Spectro data before publication
--/A 
--/T <li> taskid int,   		-- Task identifier
--/T <li> stepid int,   		-- Step identifier
--/T The data has been placed in the local DB.
--/T Most of the step parameters are extracted from the task table (see code)
--/T It is destined for task.dbName
--/T It is a task.type dataload (type in (target|best|runs|plates|galspec|sspp|tiling|window))
--/T The validation step writes many messages in the Phase table.
--/T It returns stepid and either:
--/T  	0 on success (no serious problems found)
--/T    1 on failure (serious problems found).
----------------------------------------------------------------------
AS
BEGIN
	-- parameters from task table
	DECLARE 
		@type varchar(16),	-- (target|best|runs|plates|galspec|sspp|tiling|window)  
		@destinationDBbname varchar(32), -- name of the destination database.
		@id varchar(16) 	-- ID of the CSV data export task from the Linux side

        -------------------------------------------------------------------------------------
	-- Get the task parameters.  
	SELECT  
		@type=type, 
		@destinationDBbname=dbname,
		@id=[id]
		FROM loadsupport.dbo.Task WITH (nolock)
		WHERE taskid = @taskID

	-------------------------------------------------------------------------------------
	-- local variables
	DECLARE 
		@stepName varchar(16),
		@stepMsg varchar(2048),  -- holds messages to Step table
		@phaseMsg varchar(2048), -- holds messages to Phase table
		@err	int		 -- return from the helper procs (0 is good, 1 is fatal)

	-- register the step.
	SET @stepName = 'VALIDATE'  
	SET @stepMsg = 'Validating ' + @type + ' database ' + @id
	EXEC spStartStep @taskID, @stepID OUTPUT, @stepName, 'WORKING', @stepMsg, @stepMsg;

	-- if step create fails, complain and return.
	IF @stepid IS NULL
	    BEGIN
		SET @phaseMsg = 'Could not create validation step for task '  
			+ str(@taskID) + ' database ' + @id
	 	EXEC spNewPhase 0, 0, 'Framework Error', 'ERROR', @phaseMsg;
		RETURN(1);
	    END
	---------------------------------------------------------------------------------------------

	IF @type = 'plates'
	    BEGIN
		EXEC @err = spValidatePlates @taskID, @stepID, @destinationDBbname 
	        IF @err = 0
		    BEGIN 
	   		set @stepMsg = 'Validated plates ' + @id
			set @phaseMsg = 'Validated plates ' + @id
		    END
		ELSE
		    BEGIN
		   	SET @stepMsg = 'Failed to validate plates ' + @id
			SET @phaseMsg = 'Failed to validate plates ' + @id
		    END
		GOTO commonExit
	    END


	IF @type = 'galprod'
	    BEGIN
		EXEC @err = spValidateGalProd @taskID, @stepID, @destinationDBbname 
	        IF @err = 0
		    BEGIN 
	   		set @stepMsg = 'Validated galprod ' + @id
			set @phaseMsg = 'Validated galprod ' + @id
		    END
		ELSE
		    BEGIN
		   	SET @stepMsg = 'Failed to validate galprod ' + @id
			SET @phaseMsg = 'Failed to validate galprod ' + @id
		    END
		GOTO commonExit
	    END


	IF @type = 'galspec'
	    BEGIN
		EXEC @err = spValidateGalSpec @taskID, @stepID, @destinationDBbname 
	        IF @err = 0
		    BEGIN 
	   		set @stepMsg = 'Validated galspec ' + @id
			set @phaseMsg = 'Validated galspec ' + @id
		    END
		ELSE
		    BEGIN
		   	SET @stepMsg = 'Failed to validate galspec ' + @id
			SET @phaseMsg = 'Failed to validate galspec ' + @id
		    END
		GOTO commonExit
	    END


	IF @type = 'sspp'
	    BEGIN
		EXEC @err = spValidateSspp @taskID, @stepID, @destinationDBbname 
	        IF @err = 0
		    BEGIN 
	   		set @stepMsg = 'Validated sspp ' + @id
			set @phaseMsg = 'Validated sspp ' + @id
		    END
		ELSE
		    BEGIN
		   	SET @stepMsg = 'Failed to validate sspp ' + @id
			SET @phaseMsg = 'Failed to validate sspp ' + @id
		    END
		GOTO commonExit
	    END


	IF @type = 'tiles'
	    BEGIN
		EXEC @err = spValidateTiles @taskID, @stepID, @destinationDBbname 
	        IF @err = 0
		    BEGIN 
	   		set @stepMsg = 'Validated tiles ' + @id
			set @phaseMsg = 'Validated tiles ' + @id
		    END
		ELSE
		    BEGIN
		   	SET @stepMsg = 'Failed to validate tiles ' + @id
			SET @phaseMsg = 'Failed to validate tiles ' + @id
		    END
		GOTO commonExit
	    END


	IF @type = 'window'
	    BEGIN
		EXEC @err = spValidateWindow @taskID, @stepID, @destinationDBbname 
	        IF @err = 0
		    BEGIN 
	   		set @stepMsg = 'Validated window tables ' + @id
			set @phaseMsg = 'Validated window tables ' + @id
		    END
		ELSE
		    BEGIN
		   	SET @stepMsg = 'Failed to validate window tables ' + @id
			SET @phaseMsg = 'Failed to validate window tables ' + @id
		    END
		GOTO commonExit
	    END

	IF @type = 'pm'
	    BEGIN
		EXEC @err = spValidatePm @taskID, @stepID, @destinationDBbname 
	        IF @err = 0
		    BEGIN 
	   		set @stepMsg = 'Validated pm ' + @id
			set @phaseMsg = 'Validated pm ' + @id
		    END
		ELSE
		    BEGIN
		   	SET @stepMsg = 'Failed to validate pm ' + @id
			SET @phaseMsg = 'Failed to validate pm ' + @id
		    END
		GOTO commonExit
	    END


	IF @type = 'mask'
	    BEGIN
		EXEC @err = spValidateMask @taskID, @stepID, @destinationDBbname 
	        IF @err = 0
		    BEGIN 
	   		set @stepMsg = 'Validated mask ' + @id
			set @phaseMsg = 'Validated mask ' + @id
		    END
		ELSE
		    BEGIN
		   	SET @stepMsg = 'Failed to validate mask ' + @id
			SET @phaseMsg = 'Failed to validate mask ' + @id
		    END
		GOTO commonExit
	    END


	IF @type = 'manga'
	    BEGIN
		EXEC @err = spValidateManga @taskID, @stepID, @destinationDBbname 
	        IF @err = 0
		    BEGIN 
	   		set @stepMsg = 'Validated MaNGA ' + @id
			set @phaseMsg = 'Validated MaNGA ' + @id
		    END
		ELSE
		    BEGIN
		   	SET @stepMsg = 'Failed to validate MaNGA ' + @id
			SET @phaseMsg = 'Failed to validate MaNGA ' + @id
		    END
		GOTO commonExit
	    END


	IF @type = 'nsa'
	    BEGIN
		EXEC @err = spValidateNSA @taskID, @stepID, @destinationDBbname 
	        IF @err = 0
		    BEGIN 
	   		set @stepMsg = 'Validated NSA ' + @id
			set @phaseMsg = 'Validated NSA ' + @id
		    END
		ELSE
		    BEGIN
		   	SET @stepMsg = 'Failed to validate NSA ' + @id
			SET @phaseMsg = 'Failed to validate NSA ' + @id
		    END
		GOTO commonExit
	    END


	IF @type = 'resolve'
	    BEGIN
		EXEC @err = spValidateResolve @taskID, @stepID, @destinationDBbname 
	        IF @err = 0
		    BEGIN 
	   		set @stepMsg = 'Validated resolve ' + @id
			set @phaseMsg = 'Validated resolve ' + @id
		    END
		ELSE
		    BEGIN
		   	SET @stepMsg = 'Failed to validate resolve ' + @id
			SET @phaseMsg = 'Failed to validate resolve ' + @id
		    END
		GOTO commonExit
	    END


	IF @type = 'apogee'
	    BEGIN
		EXEC @err = spValidateApogee @taskID, @stepID, @destinationDBbname 
	        IF @err = 0
		    BEGIN 
	   		set @stepMsg = 'Validated APOGEE ' + @id
			set @phaseMsg = 'Validated APOGEE ' + @id
		    END
		ELSE
		    BEGIN
		   	SET @stepMsg = 'Failed to validate APOGEE ' + @id
			SET @phaseMsg = 'Failed to validate APOGEE ' + @id
		    END
		GOTO commonExit
	    END


	IF @type = 'wise' or @type = 'forced'
	    BEGIN
		EXEC @err = spValidateWise @taskID, @stepID, @destinationDBbname 
	        IF @err = 0
		    BEGIN 
	   		set @stepMsg = 'Validated WISE ' + @id
			set @phaseMsg = 'Validated WISE ' + @id
		    END
		ELSE
		    BEGIN
		   	SET @stepMsg = 'Failed to validate WISE ' + @id
			SET @phaseMsg = 'Failed to validate WISE ' + @id
		    END
		GOTO commonExit
	    END


	IF @type in ( 'best', 'target', 'runs')
	    BEGIN
		EXEC @err = spValidatePhoto @taskID, @stepID, @type , @destinationDBbname 
	        IF @err = 0
		    BEGIN 
			SET @stepMsg =  'Validated photo ' + @type + ' id: ' + @id
			SET @phaseMsg = 'Validated photo ' + @type + ' id: ' + @id
		    END
		ELSE
		    BEGIN
		   	SET @stepMsg =  'Failed to validate photo ' + @type + ' id: ' + @id
			SET @phaseMsg = 'Failed to validate photo ' + @type + ' id: ' + @id
		    END
		GOTO commonExit
	    END

	-- if got here then we do not recognize the type 
	-- not in ('plates', 'best', 'runs', 'target', 'tiles'), give error message

	SET @err = 1
	SET @stepMsg =  'Failed to validate id: ' + @id + ' because type: ' + @type + ' is unknown'
	SET @phaseMsg = 'Failed to validate id: ' + @id + ' because type: ' + @type + ' is unknown'
   
	commonExit:	-- Common exit to end the step (based on err setting)

	-- create final logs (writes to phase table, and step table)
	IF @err = 0
	    BEGIN
	    	EXEC spEndStep @taskID, @stepID, 'DONE', @stepMsg, @phaseMsg;
		END
	ELSE
	    BEGIN
	    	EXEC spEndStep @taskID, @stepID, 'ABORTING', @stepMsg, @phaseMsg;
	    END

    RETURN @err
END
--===========================================================

GO
/****** Object:  StoredProcedure [dbo].[spValidateTiles]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spValidateTiles] (
	@taskid int, 
	@stepid int,
	@destinationDB varchar(16)
)
-------------------------------------------------------------
--/H  Validate Tiles  
--/A 
--/T <p> parameters:   
--/T <li> taskid int,   		-- Task identifier
--/T <li> stepid int,   		-- Step identifier
--/T <li> destinationDB int,   		-- Name of destination DB 
--/T <li> returns  0 if OK, non zero if something wrong  
--/T <br>
--/T Sample call:<br>
--/T <samp> 
--/T <br> exec  spValidateTiles @taskid , @stepid, 'targetDB'  
--/T </samp> 
--/T <br>  
------------------------------------------------------------- 
AS BEGIN
    	--
    	SET NOCOUNT ON

    	--- Globals
    	DECLARE	@start datetime,
		@summary bigint,
		@error bigint,
		@errorMsg varchar(1000),
		@verb varchar(16)

    -- Put out step greeting
    EXEC spNewPhase @taskid, @stepid, 'spValidateTiles', 'OK', 'spValidateTiles called'; 

    -------------------------------------
    SET @start  = current_timestamp
    SET @summary = 0

	---------------------
	-- test unique keys
	---------------------
	exec dbo.spTestUniqueKey  @taskid , @stepid,  'sdssTileAll', 'tile', @error OUTPUT
	set @summary = @summary + @error;
--	exec dbo.spTestUniqueKey  @taskid , @stepid,  'sdssTilingGeometry', 'regionID', @error OUTPUT
--	set @summary = @summary + @error;
	exec dbo.spTestUniqueKey  @taskid , @stepid,  'sdssTiledTargetAll', 'targetID', @error OUTPUT
	set @summary = @summary + @error;
	exec dbo.spTestUniqueKey  @taskid , @stepid,  'sdssTilingInfo', 'tileRun, targetID', @error OUTPUT
	set @summary = @summary + @error;
	exec dbo.spTestUniqueKey  @taskid , @stepid,  'sdssTilingRun', 'tileRun', @error OUTPUT
	set @summary = @summary + @error;
  
	----------------------------------
	--- Test the Tiles foreign Keys 
	---------------------------------- 
	exec dbo.spTestForeignKey  @taskid , @stepid, 'sdssTileAll',  'sdssTilingRun',	'tileRun',   @error OUTPUT
	set @summary = @summary + @error; 
	exec dbo.spTestForeignKey  @taskid , @stepid, 'sdssTilingGeometry',	'sdssTilingRun',   'tileRun', @error OUTPUT
	set @summary = @summary + @error;	 
	exec dbo.spTestForeignKey  @taskid , @stepid, 'sdssTilingGeometry',	'StripeDefs',   'stripe',  @error OUTPUT
	set @summary = @summary + @error; 
	exec dbo.spTestForeignKey  @taskid , @stepid, 'sdssTilingInfo',	'sdssTilingRun',   'tileRun',  @error OUTPUT
	set @summary = @summary + @error;
--	exec dbo.spTestForeignKey  @taskid , @stepid, 'sdssTiledTargetAll',	'sdssTileAll',         'tile',     @error OUTPUT
--	set @summary = @summary + @error;
 
	-- generate completion message.

	IF @summary = 0 
	    BEGIN
		SET @errorMsg =   'Tiles validated in '  
			+ cast(dbo.fDatediffSec(@start, current_timestamp) as varchar(30))+ ' seconds'
		SET @verb = 'OK'
	    END
	ELSE 	
	    BEGIN
		SET @errorMsg =   'Tiles validation found ' +str(@summary) + ' errors in ' 
			+ cast(dbo.fDatediffSec(@start, current_timestamp) as varchar(30)) + ' seconds'
		SET @verb = 'ERROR'
	    END

	EXEC spNewPhase @taskid, @stepid, 'spValidateTiles', @verb, @errorMsg ;
	
	RETURN @summary
END		-- End spValidateTiles()
--======================================

GO
/****** Object:  StoredProcedure [dbo].[spValidateWindow]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spValidateWindow] (
	@taskid int, 
	@stepid int,
	@destinationDB varchar(16)
)
-------------------------------------------------------------
--/H  Validate Window tables  
--/A 
--/T <p> parameters:   
--/T <li> taskid int,   		-- Task identifier
--/T <li> stepid int,   		-- Step identifier
--/T <li> destinationDB int,   		-- Name of destination DB 
--/T <li> returns  0 if OK, non zero if something wrong  
--/T <br>
--/T Sample call:<br>
--/T <samp> 
--/T <br> exec  spValidateWindow @taskid , @stepid, 'targetDB'  
--/T </samp> 
--/T <br>  
------------------------------------------------------------- 
AS BEGIN
    	--
    	SET NOCOUNT ON

    	--- Globals
    	DECLARE	@start datetime,
		@summary bigint,
		@error bigint,
		@errorMsg varchar(1000),
		@verb varchar(16)

    -- Put out step greeting
    EXEC spNewPhase @taskid, @stepid, 'spValidateWindow', 'OK', 'spValidateWindow called'; 

    -------------------------------------
    SET @start  = current_timestamp
    SET @summary = 0

	---------------------
	-- test unique keys
	---------------------
--	exec dbo.spTestUniqueKey  @taskid , @stepid,  'sdssImagingHalfSpaces' , 'sdssPolygonID', @error OUTPUT
--	set @summary = @summary + @error;
	exec dbo.spTestUniqueKey  @taskid , @stepid,  'sdssPolygons', 'sdssPolygonID', @error OUTPUT
	set @summary = @summary + @error;
--	exec dbo.spTestUniqueKey  @taskid , @stepid,  'sdssPolygon2Field', 'sdssPolygonID', @error OUTPUT
--	set @summary = @summary + @error;
 
	-- generate completion message.

	IF @summary = 0 
	    BEGIN
		SET @errorMsg =   'Window function tables validated in '  
			+ cast(dbo.fDatediffSec(@start, current_timestamp) as varchar(30))+ ' seconds'
		SET @verb = 'OK'
	    END
	ELSE 	
	    BEGIN
		SET @errorMsg =   'Window function tables validation found ' +str(@summary) + ' errors in ' 
			+ cast(dbo.fDatediffSec(@start, current_timestamp) as varchar(30)) + ' seconds'
		SET @verb = 'ERROR'
	    END

	EXEC spNewPhase @taskid, @stepid, 'spValidateWindow', @verb, @errorMsg ;
	
	RETURN @summary
END		-- End spValidateWindow()
--======================================

GO
/****** Object:  StoredProcedure [dbo].[spValidateWise]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[spValidateWise] (
	@taskid int, 
	@stepid int,
	@destinationDB varchar(16)
)
-------------------------------------------------------------
--/H  Validate resolve tables  
--/A 
--/T <p> parameters:   
--/T <li> taskid int,   		-- Task identifier
--/T <li> stepid int,   		-- Step identifier
--/T <li> destinationDB int,   		-- Name of destination DB 
--/T <li> returns  0 if OK, non zero if something wrong  
--/T <br>
--/T Sample call:<br>
--/T <samp> 
--/T <br> exec  spValidateWise @taskid , @stepid, 'BestDR8'  
--/T </samp> 
--/T <br>  
------------------------------------------------------------- 
AS BEGIN
    	--
    	SET NOCOUNT ON

    	--- Globals
    	DECLARE	@start datetime,
		@summary bigint,
		@error bigint,
		@errorMsg varchar(1000),
		@verb varchar(16)

    -- Put out step greeting
    EXEC spNewPhase @taskid, @stepid, 'spValidateWise', 'OK', 'spValidateWise called'; 

    -------------------------------------
    SET @start  = current_timestamp
    SET @summary = 0

	---------------------
	-- test unique keys
	---------------------
	exec dbo.spTestUniqueKey  @taskid , @stepid,  'wise_allsky', 'cntr', @error OUTPUT
	set @summary = @summary + @error;

	exec dbo.spTestUniqueKey  @taskid , @stepid,  'wiseForced', 'objID', @error OUTPUT
	set @summary = @summary + @error;

	-- generate completion message.
	IF @summary = 0 
	    BEGIN
		SET @errorMsg =   'WISE tables validated in '  
			+ cast(dbo.fDatediffSec(@start, current_timestamp) as varchar(30))+ ' seconds'
		SET @verb = 'OK'
	    END
	ELSE 	
	    BEGIN
		SET @errorMsg =   'WISE tables validation found ' +str(@summary) + ' errors in ' 
			+ cast(dbo.fDatediffSec(@start, current_timestamp) as varchar(30)) + ' seconds'
		SET @verb = 'ERROR'
	    END

	EXEC spNewPhase @taskid, @stepid, 'spValidateWise', @verb, @errorMsg ;
	
	RETURN @summary
END		-- End spValidateWise()
--======================================

GO
/****** Object:  StoredProcedure [dbo].[spZoneCreate]    Script Date: 4/6/2018 11:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE PROCEDURE [dbo].[spZoneCreate] (
	@taskid int, 
	@stepid int,	
	@radius float,
	@zoneHeight float 
) 
-------------------------------------------------------------
--/H Organizes PhotoObj objects into the Zone table
--/A --------------------------------------------------------
--/T The table holds ALL primary/secondary objects. 
--/T The table contains duplicates of objects which are within @radius distance 
--/T of the 0|360 meridian.
--/T <p> Parameters:   
--/T <li> taskid int,   		-- Task identifier
--/T <li> stepid int,   		-- Step identifier
--/T <li> radius float,   		-- radius in arcseconds
--/T <li> zoneHeight float,   	-- zoneHeight in arcsec
--/T <br>
--/T Sample call for a 2 arcseconds radius and a 1/2 arcminute zoneHeight <br>
--/T <samp> 
--/T <br> exec  spZoneCreate @taskid , @stepid, 2.0, 30.0;
--/T </samp> 
--/T <br>  
-------------------------------------------------------------
AS
BEGIN
	SET NOCOUNT ON;
	--
	DECLARE @start datetime,
		@ret int,
		@err int,
		@msg varchar(1000);
	--
	SET @start = CURRENT_TIMESTAMP
	SET @err   = 0;

	---------------------------------------------
	-- save the zoneHeight if it does not exist
	---------------------------------------------
	IF EXISTS (select name from SiteConstants where name='zoneHeight')
		UPDATE SiteConstants
		SET value = str(@zoneHeight,20,15)
		WHERE name='zoneHeight'
	ELSE
		INSERT SiteConstants VALUES('zoneHeight',
			str(@zoneHeight,20,15),'zone height in arcsec');

	---------------------------------------------------
	DECLARE @theta float; -- neighborhood radius 
	SET @theta = @radius/3600.000; -- convert arcsec to degrees
	SET @zoneHeight = @zoneHeight/3600.000; -- convert arcsec to degrees

	---------------------------------------------------
	-- Create and populate zone table. Each zone is a 
	-- latitude (dec) band of the celestial sphere with a 
	-- height of @zoneHeight. All objects in that band [dec,dec+@theta) 
	-- are in that zone. In addition, we add each object 
	-- near the edge to the left or right margin, so 
	-- marginal objects are present twice (once with the 
	-- ra +/- 360, and once with ra).

	-- Zone consits of 3 steps. Each step is within a BEGIN/COMMIT TRANSACTION
		-- 1. Creates main body of the Zone with SELECT INTO (Not sure requires B/E T but so be it)
		-- 2. Adds one @theta buffer near 0,360 (on the 360 side)
		-- 3. Builds index and foreign key

	---------------------------------------------------
	EXEC spNewPhase @taskid, @stepid, 'Neighbors', 'OK', 'Starting zone build';

	---------------------------------------------------
	-- drop all existing indices (fix this when load is incremental)
	---------------------------------------------------
	IF  EXISTS (SELECT TABLE_NAME 
				FROM INFORMATION_SCHEMA.TABLES 
				WHERE TABLE_NAME = 'Zone')
	BEGIN
	    EXEC spIndexDropSelection @taskid, @stepid, 'I,F,K', 'ZONE'
		DROP TABLE Zone
	END

	------------------------------------------------
	-- Each mode (1,2) object goes into a zone 
	-- (except non-objects like cosmic rays...)
	------------------------------------------------
    BEGIN TRANSACTION
	------------------------------------------------
	SELECT --count(*)
		cast(floor(([dec]+90.0)/@zoneHeight) as int) zoneID, 
		ra, [dec],objID, type, mode, 
		cx, cy, cz, cast (1 as tinyint) native -- its a native
	INTO Zone
	FROM photoObjAll
	WHERE TYPE IN (0, 3, 5, 6) -- unknown, galaxy, known, star
		-- not cosmic ray, defect, ghost, trail, or sky.
		AND mode IN (1,2)
	
	ALTER TABLE Zone  
			ALTER COLUMN ZoneID int NOT NULL -- The primary key constraint cannot 
											 -- be added if the column is NULL
	COMMIT TRANSACTION

	---------------------------------------------------------
	-- Precompute the ôalphaö expansion for each zone based 
	-- on the specified radius. This local temp table will 
	-- be automatically dropped when sp_ completes. 
	-----------------------------------------------------
	--
	CREATE TABLE #Alpha(
				zoneID		int	   NOT NULL primary key,	
				alphaMax	float  NOT NULL					
	)
	--------------------------------------------------
	-- Builds the #Alpha Table
	--------------------------------------------------
	DECLARE @maxZone int, @minZone int, @zoneDec float;
	
	SET @minZone = 0;
	SET @maxZone =  floor(180.0/@zoneHeight);

	SET @zoneDec = @minZone * @zoneHeight -90;
	   
	WHILE @minZone < = @maxZone
	BEGIN   
		INSERT #Alpha VALUES (
				@minZone, 
				CASE WHEN (@zoneDec < 0) AND (ABS(@zoneDec) > ABS(@zoneDec + @zoneHeight))
				  THEN dbo.fGetAlpha(@theta, @zoneDec)
				  ELSE dbo.fGetAlpha(@theta, @zoneDec + @zoneHeight)
				END 
			)
		SET @minZone = @minZone + 1
		SET @zoneDec = @zoneDec + @zoneHeight
	END

	-----------------------------------------------------
	-- add half-open interval right margin  (one radius)
	-----------------------------------------------------
	--
    BEGIN TRANSACTION
	INSERT Zone 
	    select z.zoneID, 
		ra+360.0, [dec], objID, type, mode, 
		cx, cy, cz, 0 -- a visitor, not a native 
		from Zone z join #Alpha a on z.zoneID = a.zoneID
		where 0.0 < ra and ra < a.alphaMax
 
	SET @msg = 'Neighbors zone build time: '
		+ cast(dbo.fDatediffSec(@start,current_timestamp) as varchar(30)) 
		+ ' seconds'
	EXEC spNewPhase @taskid, @stepid, 'Neighbors', 'OK', @msg;
	COMMIT TRANSACTION 

	----------------------------------------
	-- build all indexes for the Zone table 
	----------------------------------------
	BEGIN TRANSACTION
	SET @start = CURRENT_TIMESTAMP
	exec spIndexBuildSelection @taskid, @stepid, 'K,F,I', 'ZONE'
	SET @msg = 'Zone index and foreign key time: '
		+ cast(dbo.fDatediffSec(@start,current_timestamp) as varchar(30)) 
		+ ' seconds'
	EXEC spNewPhase @taskid, @stepid, 'Neighbors', 'OK', @msg ;
	COMMIT TRANSACTION 
	------------------------------------------------------------------------------

	RETURN;
END
GO
