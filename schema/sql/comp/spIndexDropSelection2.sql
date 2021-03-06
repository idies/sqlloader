USE [SueDR13]
GO

/****** Object:  StoredProcedure [dbo].[spIndexDropSelection2]    Script Date: 11/10/2016 3:58:32 PM ******/
DROP PROCEDURE [dbo].[spIndexDropSelection2]
GO



USE [SueDR13]
GO

/****** Object:  StoredProcedure [dbo].[spIndexDropSelection]    Script Date: 11/10/2016 3:44:01 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

--
CREATE PROCEDURE [dbo].[spIndexDropSelection2](@taskid int, @stepid int, @type varchar(128), @group varchar(1024)='', @comp varchar(100)='')
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
--/T    exec spIndexDropSelection2 0,0, 'K,I' , 'ALL', 'PAGE'
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
		+ 'FROM IndexMap2 WITH (nolock) '
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

	---------------------------------------------------
	-- look for compression option
	---------------------------------------------------

	if @comp !=''
		set @cmd = @cmd + ' and compression = ''' + @comp +''''
	------------------------------------------------
	-- order it by code in reverse order, so pk are dropped last
	------------------------------------------------
	SET @cmd = @cmd + ' ORDER BY code ASC';
	--
	
	--print @cmd
	
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


