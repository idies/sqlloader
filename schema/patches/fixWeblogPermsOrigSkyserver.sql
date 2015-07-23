﻿-----------------------------
-- use this for all DRx DBs
-- using skyserver version less that 2.0
-----------------------------



---------------------------------------------------------------------------------
-- 1. create server-level login 'logger' that cannot log in or connect to the DB
---------------------------------------------------------------------------------

USE [master]
GO

--Check if logger user exists, if not, create it
if ((select count(*) from sys.server_principals where name = 'logger') = 0 )
	begin
		Print 'Creating logger user....'
		/* For security reasons the login is created disabled and with a random password. */
		/****** Object:  Login [logger]    Script Date: 7/10/2015 3:28:48 PM ******/
		CREATE LOGIN [logger] WITH PASSWORD=N'@êÐ^ðÛù0FÐÿèUnÙáø¶¤éµãâÄ²$R', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
		ALTER LOGIN [logger] DISABLE
		DENY CONNECT SQL TO [logger]

	end






-------------------------------------------------------------------------------
-- 2. add logger to BestDR12 db and weblog db without granting any permissions 
--    or role membership
-------------------------------------------------------------------------------

Print 'Adding logger user to DBs...'


declare @dbname sysname
declare @sql nvarchar(2000)

declare dbcur cursor fast_forward 
for select name from master.sys.databases
where name like 'BESTDR%'
open dbcur
fetch next from dbcur into @dbname
while @@FETCH_STATUS = 0
begin
	
	set @sql='USE ['+@dbname+']; 
			  CREATE USER [logger] for login [logger] with default_schema=[dbo];GO;'
	print @sql	

fetch next from dbcur into @dbname
end
close dbcur
deallocate dbcur

if (0 != (select count(*) from master.dbo.sysdatabases where name = 'weblog')) 
begin
	use [weblog]
	
	create user [logger] for login [logger] with default_schema=[dbo]
end
go


-------------------------------------------------------------------------------
-- 3. in master DB, grant impersonate privs to skyuser and webuser on logger 
-------------------------------------------------------------------------------

use master;

print 'Granting impersonate privs...'
select * from sys.server_principals
--check if webuser exists
if (select count(*) from sys.server_principals where name = 'webuser') != 0

	grant impersonate on login::logger to webuser

go

if (select count(*) from sys.server_principals where name = 'skyuser') != 0

	grant impersonate on login::logger to webuser

go

--------------------------------------------------------------------------------
-- 4. in weblog DB, grant insert privs on neccessary tables to logger
--------------------------------------------------------------------------------



use [weblog]
go

Print 'Granting insert privs on weblog tables to logger...'

grant insert on SqlPerformanceLogUTC to logger
go

grant insert on SqlStatementLogUTC to logger
go

---------------------------------------------------------------------------------
-- 5. remove skyuser and webuser from weblog db
---------------------------------------------------------------------------------

use [weblog]

drop user skyuser;

drop user webuser;

------------------------------------------------------------------------------------
-- 6. update spExecuteSQL and spExecuteSQL2 to use logger user
------------------------------------------------------------------------------------



/****** Object:  StoredProcedure [dbo].[spExecuteSQL]    Script Date: 07/21/2015 15:25:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spExecuteSQL]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spExecuteSQL]
GO

USE [BESTDR12]
GO

/****** Object:  StoredProcedure [dbo].[spExecuteSQL]    Script Date: 07/21/2015 15:25:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO


--
CREATE PROCEDURE [dbo].[spExecuteSQL] (@cmd VARCHAR(8000), @limit INT = 1000, 
        @webserver      VARCHAR(64) = '',   -- the url
	@winname	VARCHAR(64) = '',   -- the windows name of the server
        @clientIP       VARCHAR(16)  = 0,   -- client IP address 
	@access		VARCHAR(64) = '',    -- subsite of site,  if 'collab' statement 'hidden'
	@system		TINYINT = 0,         -- 1 if this is a system query from a skyserver page 
	@maxQueries	SMALLINT = 60		-- maximum number of queries per minute
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
        DECLARE @inputCmd varchar(8000)                 -- safe copy of command for log 
        SET 	@inputCmd = @cmd                            
        --      SET @cmd = LOWER(@cmd)+ ' ';            -- makes parsing easier 
        SET 	@cmd = @cmd + ' '; 
        DECLARE @oldCmd     VARCHAR (8000);             -- temporary copy of command 
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

	IF (@system = 0)	-- if not a system (internal) query from skyserver
	    BEGIN
		-- Restrict users to a certain number of queries per minute to
		-- prevent crawlers from hogging the system.
		DECLARE @ret INT, @nQueries INT
		SET @maxQueries = 60	-- max queries per minute limit.

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
	    END  -- IF (@system = 0)    -- not a system query

        DECLARE @top varchar(20); 
        SET @top = ' top '+cast(@limit as varchar(20))+' ';                          
        -------------------------------------------------------------------------- 
        -- Remove potentially dangerous expressions from the string. 
        UNTIL:  BEGIN 
                SET @oldCmd = @cmd; 
                SET @cmd = dbo.fReplace(@cmd, '.xp_',   '#'); -- discard extended SPs               
                SET @cmd = dbo.fReplace(@cmd, '.sp_',   '#'); -- discard stored procedures 
                SET @cmd = dbo.fReplace(@cmd, '.fn_',   '#'); -- discard functions 
                SET @cmd = dbo.fReplace(@cmd, '.ms_',   '#'); -- discard microsoft extensions 
                SET @cmd = dbo.fReplace(@cmd, '.dt_',   '#'); -- discard microsoft extensions 
                SET @cmd = dbo.fReplace(@cmd, ' xp_',   '#'); -- discard extended SPs               
                SET @cmd = dbo.fReplace(@cmd, ' sp_',   '#'); -- discard stored procedures 
                SET @cmd = dbo.fReplace(@cmd, ' fn_',   '#'); -- discard functions 
                SET @cmd = dbo.fReplace(@cmd, ' ms_',   '#'); -- discard microsoft extensions 
                SET @cmd = dbo.fReplace(@cmd, ' dt_',   '#'); -- discard microsoft extensions 
                SET @cmd =      replace(@cmd, '  ' ,   ' '); -- discard duplicate spaces 
                SET @cmd =      replace(@cmd, '  ' ,   ' '); -- discard duplicate spaces 
                SET @cmd=       replace(@cmd,0x0D0A,   0x200A);     -- replace cr/lf with space/lf 
                SET @cmd=       replace(@cmd,  0x09,   ' ');     -- discard tabs				
				SET @cmd =      replace(@cmd,   ' ; ',    '#'); -- discard semicolon
                SET @cmd =      replace(@cmd,   ';',    '#'); -- discard semicolon 
                END 
        IF (@cmd != @oldCmd) GOTO UNTIL; 
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
        -- execute the command, returning the rows. 
bottom: 
        IF (@errorMsg is null)                          -- if good, 
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
						end 

                --======================================================== 
                -- EXECUTE THE COMMAND 
                EXEC (@cmd)                             -- return the data 
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
		END
        END 
-------------------------------------------------------------------------------------- 


GO


USE [BESTDR12]
GO

/****** Object:  StoredProcedure [dbo].[spExecuteSQL2]    Script Date: 07/21/2015 15:26:07 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spExecuteSQL2]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spExecuteSQL2]
GO

USE [BESTDR12]
GO

/****** Object:  StoredProcedure [dbo].[spExecuteSQL2]    Script Date: 07/21/2015 15:26:07 ******/
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








