--======================================================================
--   spSpectro.sql
--   2004-12-17 Ani Thakar and Alex Szalay
------------------------------------------------------------------------
--  Spectro functions and sps for SkyServer
------------------------------------------------------------------------
-- History:
--* 2004-12-17	Ani: Moved here from SpectroTables.sql.
--* 2010-06-29  Ani/Naren/Vamsi : Added spMakeSpecObjAll stored procedure for loading
--*				Spectrum images on to database. 
--* 2010-12-10  Ani: Removed "dbo." from spMakeSpecObjAll.
--* 2012-05-17  Ani: Excluded run2d from spec img path.
--* 2012-05-17  Ani: Reinstated run2d in img path.
--* 2012-06-01  Ani: Added code to spMakeSpecObjAll to check for 
--*             existence of image file names before ingesting them.
--* 2012-07-31  Ani: Updated fSpecidFromSDSS, fPlate, fMJD, fFiber for
--*             SDSS-III bit encoding schema.
--* 2013-12-02  Ani: Added fGetBlob CLR function from Deoyani.
--* 2013-12-02  Ani: Modified spMakeSpecObjAll to use fGetBlob instead of
--              OPENROWSET.
--* 2013-12-11  Ani: Updated assembly for fGetBlob and added code to set
--*             appropriate DB permissions.
--* 2013-12-13  Ani: Added COALESCE to fGetBlob call in case it returns
--*             NULL.
--* 2013-12-13  Ani: Made perms for GetBlob assembly conditionally set.
--* 2015-03-18  Ani: Added new function fSDSSfromSpecID (PR #2257).
------------------------------------------------------------------------

-----------------------------------------------------
-- The functions to extracts parts of a specObjID
-----------------------------------------------------

----------------------------------------------------------------------------------------------
-- CREATING THE ASSEMBLY
-----------------------------------------------------------------------------------------------
-- Set trustworthy permissions only if this is not a publish (Best*) db.
-- This is only required in the task db.
DECLARE @dbName VARCHAR(100)
SET @dbName=QUOTENAME(DB_NAME())
IF @dbName NOT LIKE 'Best%'
   BEGIN 
      EXEC('ALTER DATABASE '+@dbName+' SET trustworthy ON')
      -- Create the CLR assembly for fGetBlob function.
      CREATE ASSEMBLY [GetBlob]
      FROM 
0x4D5A90000300000004000000FFFF0000B800000000000000400000000000000000000000000000000000000000000000000000000000000000000000800000000E1FBA0E00B409CD21B8014CCD21546869732070726F6772616D2063616E6E6F742062652072756E20696E20444F53206D6F64652E0D0D0A2400000000000000504500004C010300572CA6520000000000000000E00002210B010B000008000000060000000000005E2700000020000000400000000040000020000000020000040000000000000004000000000000000080000000020000000000000300408500001000001000000000100000100000000000001000000000000000000000000C2700004F000000004000008003000000000000000000000000000000000000006000000C000000A42600001C0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000200000080000000000000000000000082000004800000000000000000000002E7465787400000064070000002000000008000000020000000000000000000000000000200000602E72737263000000800300000040000000040000000A0000000000000000000000000000400000402E72656C6F6300000C0000000060000000020000000E00000000000000000000000000004000004200000000000000000000000000000000402700000000000048000000020005009C2000000806000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001B300200250000000100001100000F00280F00000A281000000A0A06731100000A0CDE0A0B00281200000A0CDE0000082A00000001100000000001001718000A140000011E02281300000A2A42534A4201000100000000000C00000076322E302E35303732370000000005006C000000FC010000237E000068020000C402000023537472696E6773000000002C05000008000000235553003405000010000000234755494400000044050000C400000023426C6F620000000000000002000001471502000900000000FA2533001600000100000014000000020000000200000001000000130000000C00000001000000010000000200000000000A0001000000000006003C0035000A0064004F000A006D004F0006009B0089000600B20089000600CF0089000600EE00890006000701890006002001890006003B01890006005601890006008E016F010600A20189000600CE01BB013B00E201000006001102F10106003102F1010A007302580206009C0292020600B702350000000000010000000000010001000100100017000000050001000100502000000000960077000A00010094200000000086187F001100020000000100850021007F00150029007F00150031007F00150039007F00150041007F00150049007F00150051007F00150059007F00150061007F001A0069007F00150071007F001F0081007F00250089007F00110091007F001100190088022F009900A102330011007F0039001100AE023F0009007F001100200073002A002E002B004D002E0013005B002E001B005B002E00230061002E000B004D002E00330070002E003B005B002E004B005B002E005B0091002E0063009A002E006B00A30044000480000001000000E313036F0000000000004F02000002000000000000000000000001002C000000000002000000000000000000000001004300000000000000003C4D6F64756C653E00676574626C6F61622E646C6C0055736572446566696E656446756E6374696F6E73006D73636F726C69620053797374656D004F626A6563740053797374656D2E446174610053797374656D2E446174612E53716C54797065730053716C42797465730053716C537472696E6700676574426C6F62002E63746F72007374720053797374656D2E5265666C656374696F6E00417373656D626C795469746C6541747472696275746500417373656D626C794465736372697074696F6E41747472696275746500417373656D626C79436F6E66696775726174696F6E41747472696275746500417373656D626C79436F6D70616E7941747472696275746500417373656D626C7950726F6475637441747472696275746500417373656D626C79436F7079726967687441747472696275746500417373656D626C7954726164656D61726B41747472696275746500417373656D626C7943756C747572654174747269627574650053797374656D2E52756E74696D652E496E7465726F70536572766963657300436F6D56697369626C6541747472696275746500417373656D626C7956657273696F6E4174747269627574650053797374656D2E446961676E6F73746963730044656275676761626C6541747472696275746500446562756767696E674D6F6465730053797374656D2E52756E74696D652E436F6D70696C6572536572766963657300436F6D70696C6174696F6E52656C61786174696F6E734174747269627574650052756E74696D65436F6D7061746962696C69747941747472696275746500676574626C6F6162004D6963726F736F66742E53716C5365727665722E5365727665720053716C46756E6374696F6E417474726962757465006765745F56616C75650053797374656D2E494F0046696C650052656164416C6C4279746573006765745F4E756C6C00457863657074696F6E0000000000032000000000008A8937AC8443374BB93B48A8D1B52FBD0008B77A5C561934E0890600011209110D03200001042001010E042001010205200101113D042001010804010000000320000E0500011D050E052001011D0504000012090807031D05125112090D010008676574626C6F616200000501000000000E0100094D6963726F736F667400002001001B436F7079726967687420C2A9204D6963726F736F6674203230313300000801000701000000000801000800000000001E01000100540216577261704E6F6E457863657074696F6E5468726F777301000000000000572CA65200000000020000004C000000C0260000C00800005253445316F42A049060954A867285D3D158532B0F000000433A5C44656F79616E695C676574626C6F61625C676574626C6F61625C6F626A5C44656275675C676574626C6F61622E706462003427000000000000000000004E27000000200000000000000000000000000000000000000000000040270000000000000000000000005F436F72446C6C4D61696E006D73636F7265652E646C6C0000000000FF250020400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100100000001800008000000000000000000000000000000100010000003000008000000000000000000000000000000100000000004800000058400000280300000000000000000000280334000000560053005F00560045005200530049004F004E005F0049004E0046004F0000000000BD04EFFE0000010000000100036FE31300000100036FE3133F000000000000000400000002000000000000000000000000000000440000000100560061007200460069006C00650049006E0066006F00000000002400040000005400720061006E0073006C006100740069006F006E00000000000000B00488020000010053007400720069006E006700460069006C00650049006E0066006F00000064020000010030003000300030003000340062003000000034000A00010043006F006D00700061006E0079004E0061006D006500000000004D006900630072006F0073006F006600740000003C0009000100460069006C0065004400650073006300720069007000740069006F006E000000000067006500740062006C006F00610062000000000040000F000100460069006C006500560065007200730069006F006E000000000031002E0030002E0035003000390031002E0032003800340031003900000000003C000D00010049006E007400650072006E0061006C004E0061006D006500000067006500740062006C006F00610062002E0064006C006C00000000005C001B0001004C006500670061006C0043006F007000790072006900670068007400000043006F0070007900720069006700680074002000A90020004D006900630072006F0073006F0066007400200032003000310033000000000044000D0001004F0072006900670069006E0061006C00460069006C0065006E0061006D006500000067006500740062006C006F00610062002E0064006C006C0000000000340009000100500072006F0064007500630074004E0061006D0065000000000067006500740062006C006F00610062000000000044000F000100500072006F006400750063007400560065007200730069006F006E00000031002E0030002E0035003000390031002E00320038003400310039000000000048000F00010041007300730065006D0062006C0079002000560065007200730069006F006E00000031002E0030002E0035003000390031002E0032003800340031003900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002000000C000000603700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
      WITH PERMISSION_SET = EXTERNAL_ACCESS
   END
ELSE
   BEGIN
      -- Create the CLR assembly for fGetBlob function with SAFE perms.
      CREATE ASSEMBLY [GetBlob]
      FROM 
0x4D5A90000300000004000000FFFF0000B800000000000000400000000000000000000000000000000000000000000000000000000000000000000000800000000E1FBA0E00B409CD21B8014CCD21546869732070726F6772616D2063616E6E6F742062652072756E20696E20444F53206D6F64652E0D0D0A2400000000000000504500004C010300572CA6520000000000000000E00002210B010B000008000000060000000000005E2700000020000000400000000040000020000000020000040000000000000004000000000000000080000000020000000000000300408500001000001000000000100000100000000000001000000000000000000000000C2700004F000000004000008003000000000000000000000000000000000000006000000C000000A42600001C0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000200000080000000000000000000000082000004800000000000000000000002E7465787400000064070000002000000008000000020000000000000000000000000000200000602E72737263000000800300000040000000040000000A0000000000000000000000000000400000402E72656C6F6300000C0000000060000000020000000E00000000000000000000000000004000004200000000000000000000000000000000402700000000000048000000020005009C2000000806000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001B300200250000000100001100000F00280F00000A281000000A0A06731100000A0CDE0A0B00281200000A0CDE0000082A00000001100000000001001718000A140000011E02281300000A2A42534A4201000100000000000C00000076322E302E35303732370000000005006C000000FC010000237E000068020000C402000023537472696E6773000000002C05000008000000235553003405000010000000234755494400000044050000C400000023426C6F620000000000000002000001471502000900000000FA2533001600000100000014000000020000000200000001000000130000000C00000001000000010000000200000000000A0001000000000006003C0035000A0064004F000A006D004F0006009B0089000600B20089000600CF0089000600EE00890006000701890006002001890006003B01890006005601890006008E016F010600A20189000600CE01BB013B00E201000006001102F10106003102F1010A007302580206009C0292020600B702350000000000010000000000010001000100100017000000050001000100502000000000960077000A00010094200000000086187F001100020000000100850021007F00150029007F00150031007F00150039007F00150041007F00150049007F00150051007F00150059007F00150061007F001A0069007F00150071007F001F0081007F00250089007F00110091007F001100190088022F009900A102330011007F0039001100AE023F0009007F001100200073002A002E002B004D002E0013005B002E001B005B002E00230061002E000B004D002E00330070002E003B005B002E004B005B002E005B0091002E0063009A002E006B00A30044000480000001000000E313036F0000000000004F02000002000000000000000000000001002C000000000002000000000000000000000001004300000000000000003C4D6F64756C653E00676574626C6F61622E646C6C0055736572446566696E656446756E6374696F6E73006D73636F726C69620053797374656D004F626A6563740053797374656D2E446174610053797374656D2E446174612E53716C54797065730053716C42797465730053716C537472696E6700676574426C6F62002E63746F72007374720053797374656D2E5265666C656374696F6E00417373656D626C795469746C6541747472696275746500417373656D626C794465736372697074696F6E41747472696275746500417373656D626C79436F6E66696775726174696F6E41747472696275746500417373656D626C79436F6D70616E7941747472696275746500417373656D626C7950726F6475637441747472696275746500417373656D626C79436F7079726967687441747472696275746500417373656D626C7954726164656D61726B41747472696275746500417373656D626C7943756C747572654174747269627574650053797374656D2E52756E74696D652E496E7465726F70536572766963657300436F6D56697369626C6541747472696275746500417373656D626C7956657273696F6E4174747269627574650053797374656D2E446961676E6F73746963730044656275676761626C6541747472696275746500446562756767696E674D6F6465730053797374656D2E52756E74696D652E436F6D70696C6572536572766963657300436F6D70696C6174696F6E52656C61786174696F6E734174747269627574650052756E74696D65436F6D7061746962696C69747941747472696275746500676574626C6F6162004D6963726F736F66742E53716C5365727665722E5365727665720053716C46756E6374696F6E417474726962757465006765745F56616C75650053797374656D2E494F0046696C650052656164416C6C4279746573006765745F4E756C6C00457863657074696F6E0000000000032000000000008A8937AC8443374BB93B48A8D1B52FBD0008B77A5C561934E0890600011209110D03200001042001010E042001010205200101113D042001010804010000000320000E0500011D050E052001011D0504000012090807031D05125112090D010008676574626C6F616200000501000000000E0100094D6963726F736F667400002001001B436F7079726967687420C2A9204D6963726F736F6674203230313300000801000701000000000801000800000000001E01000100540216577261704E6F6E457863657074696F6E5468726F777301000000000000572CA65200000000020000004C000000C0260000C00800005253445316F42A049060954A867285D3D158532B0F000000433A5C44656F79616E695C676574626C6F61625C676574626C6F61625C6F626A5C44656275675C676574626C6F61622E706462003427000000000000000000004E27000000200000000000000000000000000000000000000000000040270000000000000000000000005F436F72446C6C4D61696E006D73636F7265652E646C6C0000000000FF250020400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100100000001800008000000000000000000000000000000100010000003000008000000000000000000000000000000100000000004800000058400000280300000000000000000000280334000000560053005F00560045005200530049004F004E005F0049004E0046004F0000000000BD04EFFE0000010000000100036FE31300000100036FE3133F000000000000000400000002000000000000000000000000000000440000000100560061007200460069006C00650049006E0066006F00000000002400040000005400720061006E0073006C006100740069006F006E00000000000000B00488020000010053007400720069006E006700460069006C00650049006E0066006F00000064020000010030003000300030003000340062003000000034000A00010043006F006D00700061006E0079004E0061006D006500000000004D006900630072006F0073006F006600740000003C0009000100460069006C0065004400650073006300720069007000740069006F006E000000000067006500740062006C006F00610062000000000040000F000100460069006C006500560065007200730069006F006E000000000031002E0030002E0035003000390031002E0032003800340031003900000000003C000D00010049006E007400650072006E0061006C004E0061006D006500000067006500740062006C006F00610062002E0064006C006C00000000005C001B0001004C006500670061006C0043006F007000790072006900670068007400000043006F0070007900720069006700680074002000A90020004D006900630072006F0073006F0066007400200032003000310033000000000044000D0001004F0072006900670069006E0061006C00460069006C0065006E0061006D006500000067006500740062006C006F00610062002E0064006C006C0000000000340009000100500072006F0064007500630074004E0061006D0065000000000067006500740062006C006F00610062000000000044000F000100500072006F006400750063007400560065007200730069006F006E00000031002E0030002E0035003000390031002E00320038003400310039000000000048000F00010041007300730065006D0062006C0079002000560065007200730069006F006E00000031002E0030002E0035003000390031002E0032003800340031003900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002000000C000000603700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
      WITH PERMISSION_SET = SAFE
   END
GO



--=============================================================
if exists (select * from dbo.sysobjects 
	where id = object_id(N'[dbo].[fGetBlob]') 
	and xtype in (N'FN', N'IF', N'TF'))
	drop function [dbo].[fGetBlob]
GO
--
CREATE FUNCTION  fGetBlob(@str nvarchar(4000))
RETURNS VARBINARY(max)
AS EXTERNAL NAME [GetBlob].[UserDefinedFunctions].[getBlob]
GO



--=============================================================
if exists (select * from dbo.sysobjects 
	where id = object_id(N'[dbo].[fSpecidFromSDSS]') 
	and xtype in (N'FN', N'IF', N'TF'))
	drop function [dbo].[fSpecidFromSDSS]
GO
--
CREATE FUNCTION fSpecidFromSDSS(@plate int, @mjd int, @fiber int, @run2d varchar(32))
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


--===============================================
IF EXISTS (SELECT name FROM   sysobjects 
	   WHERE  name = N'fSDSSfromSpecID' )
	DROP FUNCTION fSDSSfromSpecID
GO
--
CREATE FUNCTION fSDSSfromSpecID(@specID bigint)
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
--


--=============================================================
if exists (select * from dbo.sysobjects 
	where id = object_id(N'[dbo].[fPlate]') 
	and xtype in (N'FN', N'IF', N'TF'))
	drop function [dbo].[fPlate]
GO
--
CREATE FUNCTION fPlate(@SpecID bigint)
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


--=============================================================
if exists (select * from dbo.sysobjects 
	where id = object_id(N'[dbo].[fMJD]') 
	and xtype in (N'FN', N'IF', N'TF'))
	drop function [dbo].[fMJD]
GO
--
CREATE FUNCTION fMJD(@SpecID bigint)
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


--=============================================================
if exists (select * from dbo.sysobjects 
	where id = object_id(N'[dbo].[fFiber]') 
	and xtype in (N'FN', N'IF', N'TF'))
	drop function [dbo].[fFiber]
GO
--
CREATE FUNCTION fFiber(@SpecID bigint)
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

-- revert to primary file group

IF EXISTS ( SELECT [name] FROM dbo.sysobjects 
	WHERE [name] = N'spSetDefaultFileGroup' ) 
     EXEC spSetDefaultFileGroup 'PrimaryFileGroup'
GO




--===========================================================
if exists (select * from dbo.sysobjects 
	where id = object_id(N'spMakeSpecObjAll') 
	and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure spMakeSpecObjAll
GO
--
CREATE PROCEDURE spMakeSpecObjAll
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
--







PRINT '[spSpectro.sql]: Spectro functions/sps created'
GO
