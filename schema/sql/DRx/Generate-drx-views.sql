

  ----------------------
  -- Script to create views for BestDRx dbs

  declare @sql nvarchar(max)
  declare @tablename nvarchar(max)
  declare @sourceDB nvarchar(max), @destDB nvarchar(max)
  declare @schemaname nvarchar(max)
  declare @newline nvarchar(4000)

  declare @common int
  declare @doExecute bit

  set @sourceDB = 'BestDR15'
  set @destDB = 'DR15x'
  set @schemaname = 'dbo'
  set @newline = char(13)
 
  set @common = 1 --create views in destDB for 'common' tables in sourceDB

  set @doExecute = 1

  set @sql = null

  declare cur cursor for 
  select tablename from suedb.dbo.drxtables
  where common = @common

  open cur
  fetch next from cur into @tablename
  while @@FETCH_STATUS=0
  begin
	

	set @sql= concat('drop view if exists ',@tablename)
	print @sql
	print 'GO'

	if (@doExecute = 1)
		exec sp_executesql @sql

	set @sql = concat('create view ',@tablename, ' as select * from ',@sourcedb,'.',@schemaname,'.[',@tablename,'] with (nolock)') 
	print @sql
	print 'GO'
	print ''

	if (@doExecute = 1) begin
		exec sp_executesql @sql
		print 'views created'
	end

	fetch next from cur into @tablename
  end

  close cur
  deallocate cur





  ---FUCK THIS I WILL JUST USE A CURSOR
  --select @tablename =tablename from DRxTables where id = 52

  --select @sql = string_agg(concat('create view ',tablename, ' as select * from ',@sourcedb,'.',@schemaname,'.[',tablename,']'), @newline) from DRxTables where common=1

  /*
  select @sql =  
  (
	select concat('create view ',tablename, ' as select * from ',@sourcedb,'.',@schemaname,'.[',tablename,']', char(13))
		 from DRxTables where common = 1
		 for xml path (''), type
)
print @sql
*/
  /*
  select @sql = string_agg(concat('CREATE VIEW ', quotename(tablename), ' AS SELECT * FROM ', 
						quotename(@sourceDB), '.', quotename(@schemaname), '.', quotename(tablename)), char(13))
				from DRxTables where common = @common
 */
 					


