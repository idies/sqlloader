<h3>Appendix: some SQL </h3>
<pre>
-- ADD THIS TO THE SCHEMA
-------------------------------------------------------------------------------
--/H For each Tile, there is a list of the wedges and sectors contained by that Tile.
--
--/T Each Tile is an 89.4 arcminute circle with a hole in it.
--/T The Tiles overlap to form disjoint "wedges" that are convex regions.
--/T Each wedge has a "depth" indicating how many Tiles cover it.
--/T The wedges in turn form "sectors" when they are intersected with the tiliing 
--/T regions (Tiling regions are either positive or negative).
--/T This table stores a TileID, regionID, type for each "WEDGE" and "SECTOR" 
--/T with that regionID covered by that TileID.
-------------------------------------------------------------------------------
CREATE TABLE TileContains(
		tileID   BIGINT NOT NULL,  	-- maps Tiles to wedges, reduces search 
		regionID  INT NOT NULL,	-- 
		type 	  VARCHAR(16)		-- WEDGE or SECTOR
		PRIMARY   KEY(tileID, regionID))
GO
 
--=================================================================================
-- Tile is a temp table of tileIDs, ra, dec, and the complement of the region string.
CREATE TABLE #Tile(	tileID  BIGINT NOT NULL PRIMARY KEY, -- Tile ID
			ra float, dec float, r float, 	-- Tile coordinates.
			tileRegion	 VARCHAR(1000), -- the region string
			tileStringMinus VARCHAR(1000)) -- complement of the tile circle,
 --  used in negations.
--=================================================================================
-- A work table used to build up the Tile-wedge and Tile-sector contain map.
-- This data eventually goes to the TileContainsRegion table.
CREATE TABLE #TileWedge(tileID  BIGINT NOT NULL, 	-- map tiles to wedges, reduce search 
			 wedgeID  INT NOT NULL,		-- 
			 type 	  VARCHAR(16)		-- WEDGE or SECTOR
			 PRIMARY KEY(tileID, wedgeID))
--=================================================================================
-- A description of the wedge, eventually moves to region/convex tables.
CREATE TABLE #wedge(	wedgeID      INT IDENTITY(1,1) PRIMARY KEY, 
			depth        INT NOT NULL,   -- how many tiles cover this wedge
			plusOrMinus  INT NOT NULL,   -- a work variable for the computation
			wedgeIdOld   INT NOT NULL,   -- a work variable (wedge parent)
			convexString VARCHAR(7500) NOT NULL DEFAULT '')
CREATE INDEX WedgeOld ON #Wedge(wedgeIdOld)

--=================================================================================
-- The intersection of the wedge with the various Tile geometry regions.
CREATE TABLE #Sector(wedgeID	INT NOT NULL, 
			   regionID	INT NOT NULL,
			   regionString VARCHAR(7500),
			   PRIMARY KEY (wedgeID, regionID)) 
---================================================
--- First clean out any old wedges and sectors in case this is a restart
DELETE Convex 
	WHERE regionID in (SELECT RegionID 
			   FROM Region 
			   WHERE type in ('WEDGE', 'SECTOR'))
DELETE RegionConvexString
	WHERE regionID in (SELECT RegionID 
			   FROM Region 
			   WHERE type in ('WEDGE', 'SECTOR'))
DELETE Region WHERE type in ('WEDGE', 'SECTOR')
DELETE TileContains

---================================================
-- Start by computing the wedges.
---================================================
DECLARE @tileID BIGINT,			-- ID of the tile
	@maxWedgeID INT,
	@ra	 FLOAT, 
	@dec 	 FLOAT,
	@tileCircle      VARCHAR(8000),
	@tileRegion      VARCHAR(8000),
	@tileStringPlus  VARCHAR(8000),
	@tileStringMinus VARCHAR(8000),
	@tileRemainder   VARCHAR(8000),
	@tileRadiusArcMins float
SELECT  @tileRadiusArcMins = 60*value FROM SdssConstants WHERE name = 'tileRadius'
 
-- ====================================================================
-- for each new tile, divide up the wedges that tile intersects.
-- ====================================================================
DECLARE tiles CURSOR READ_ONLY FOR 
	SELECT tile, raCen, decCen
	FROM Tile 
	ORDER BY tile ASC
OPEN tiles
-- ====================================================================
-- Main loop handles each tile once around the loop.
-- ====================================================================
FETCH NEXT FROM tiles INTO @tileID, @ra, @dec
WHILE (@@fetch_status = 0)
 	BEGIN 
	SELECT @maxWedgeID = coalesce(max(wedgeID),0) FROM #Wedge
	--==============================================================
	-- cast the tile as a circle and get its representation as a region
	SET @tileCircle = 'CIRCLE J2000 ' +str(@ra,18,15) + ' ' + str(@ra,18,15) 
					   + ' ' + str(@tileRadiusArcMins,18,15)  
	SET @tileRegion = dbo.fNormalizeString(dbo.fHtmToNormalForm(@tileCircle))
 
	--==============================================================
	-- get the tile's vector representation, both postive and negative.
	SELECT @tileStringPlus   = str( cx,18,15)  + ' ' 
				  + str( cy,18,15)  + ' ' 
				  + str( cz,18,15)  + ' ' 
				  + str(  d,18,15)  + ' ',
	       @tileStringMinus  = str(-cx,18,15)  + ' ' 
				  + str(-cy,18,15)  + ' ' 
				  + str(-cz,18,15)  + ' ' 
				  + str( -d,18,15)  + ' '    
	FROM  dbo.fHtmStringToRegion(@tileRegion)

	--==============================================================
	-- get the part of the tile outside all others (subtract all others) 
	SET @tileRemainder = 'REGION CONVEX ' + @tileStringPlus 
	SELECT @tileRemainder = @tileRemainder + tileStringMinus
	      FROM  #tile T
	      WHERE dbo.fDistanceArcMinEq(T.ra, T.dec, @ra, @dec) < 2*@tileRadiusArcMins
	INSERT #wedge  (depth,  plusOrMinus, wedgeIdOld,  convexString     ) 
		VALUES (  1,      +1       , 0         ,  @tileRemainder  )
 
	--==============================================================
	-- These are the candidate wedges, they are parts of tiles that 
	-- overlap the new tile.
	DECLARE @candidates TABLE(oldWedgeID INT NOT NULL PRIMARY KEY ); 
	DELETE @candidates		-- empty the table
	INSERT @candidates
		SELECT DISTINCT TW.wedgeID  
		FROM  #tile as T join #tileWedge as TW on T.tileID = TW.tileID
		AND dbo.fDistanceArcMinEq(T.ra, T.dec, @ra, @dec) < 2*@tileRadiusArcMins

	--==============================================================
	-- For each candidate wedge, insert the positive and the negative 1/2 of the wedge
	-- The positive 1/2 increases the depth.	
 
 	INSERT #wedge  (depth,  plusOrMinus, wedgeIdOld,  convexString    ) 
		SELECT depth+1,      +1    , oldWedgeID, convexString + @tileStringPlus 
		FROM   @candidates C join #wedge W  on C.oldWedgeID = W.wedgeID
		WHERE W.wedgeID <= @maxWedgeID
 		
	-- the negative half leaves the depth unchanged	
	INSERT #wedge  (depth,  plusOrMinus, wedgeIdOld,  convexString    ) 
		SELECT  depth,      -1     , oldWedgeID, convexString + @tileStringMinus 
		FROM   @candidates C join #wedge W  on C.oldWedgeID = W.wedgeID
			WHERE W.wedgeID <= @maxWedgeID

	--==============================================================
	-- Simplify the new wedges (it may simplify to null).	
  
	UPDATE #wedge 
		SET convexString = dbo.fNormalizeString(
					dbo.fHtmToNormalForm(convexString))
		WHERE wedgeID > @maxWedgeID
 
	--==============================================================
	-- Delete the null convexes from the scratch table.
	DELETE #wedge WHERE wedgeID > @maxWedgeID
			AND rtrim(convexString) = 'REGION CONVEX'
 	 
	--==============================================================
	-- Make old tile->Wedge pointers point to new instance 
	INSERT #tileWedge 
	SELECT TW.tileID, W.wedgeID, 'WEDGE'
	FROM   #tileWedge TW join #Wedge W on TW.wedgeID = W.wedgeIdOld
	WHERE W.wedgeID > @maxWedgeID + 1  -- next statement picks up the "remainder case"
	--==============================================================
	-- Create the new tile-> Wedge pointers  
	INSERT #tileWedge 
	SELECT @tileID, wedgeID, 'WEDGE'  
	FROM   #Wedge W  
	WHERE  wedgeID > @maxWedgeID
          AND  plusOrMinus = +1 
 	
	--==============================================================
	-- delete the old tile->Wedge pointers 
	DELETE #tileWedge 
	WHERE wedgeID in (SELECT wedgeIdOld
			  FROM   #Wedge  
			  WHERE wedgeID > @maxWedgeID)
	--==============================================================
	-- And delete the old wedges (that have now been split or at least recomputed. 
	DELETE #Wedge 
	WHERE wedgeID in (SELECT wedgeIdOld
			  FROM   #Wedge  
			  WHERE  wedgeID > @maxWedgeID)

	--==============================================================		
 	-- done with this tile tile, add it to the list of processed tiles.
	INSERT #tile VALUES(@tileID, @ra, @dec, @tileRadiusArcMins,@tileRegion, @tileStringMinus)
	FETCH NEXT FROM tiles INTO @tileID, @ra, @dec
	END   
	--=====================

CLOSE tiles
DEALLOCATE tiles

----------========================================= 
-- Put the Wedges in the region table
DECLARE @wedgeID INT,
	@regionID INT,
	@depth INT,
        @convexString VARCHAR(8000),
	@newSector VARCHAR(8000),
	@holeString VARCHAR(8000)

---================================================
--- A cursor on the wedges we just created
DECLARE wedges CURSOR READ_ONLY FOR 
	SELECT wedgeID, depth, convexString 
	FROM #wedge
	ORDER BY wedgeID ASC
OPEN wedges
-- ====================================================================
-- for each wedge compute its positive intersections with tile geometry.
-- ====================================================================
FETCH NEXT FROM wedges INTO @wedgeID, @depth, @convexString
WHILE (@@fetch_status = 0)
	BEGIN
	INSERT  Region ( [id]   ,    type,  [stripe], run, comment, ismask, area, sql, xml) 
		VALUES (@wedgeId, 'WEDGE',    @depth,   0,      '',      0,    0,  '',  '') 
	SELECT @regionID = @@IDENTITY -- the id of the last insert
		/*regionID 
		FROM Region
		WHERE [id] = @wedgeID and type = 'WEDGE'*/
	INSERT Convex 
		SELECT  @regionID, 1, 'WEDGE', cx, cy, cz, d
		FROM dbo.fHtmStringToRegion(@convexString)
	INSERT RegionConvexString 
		VALUES (@regionID, 1, 'WEDGE', 
			replace(@convexString,'REGION CONVEX ','')) 
	INSERT tileContains ( tileID, regionID,     type)
		VALUES (@tileID, @regionID, 'WEDGE')
	FETCH NEXT FROM wedges INTO @wedgeID, @depth, @convexString
	END
CLOSE wedges

-- ====================================================================
-- DONE WITH WEDGES.
-- Now compute SECTORS.
-- ====================================================================
-- ====================================================================
-- for each wedge compute its positive intersections with tile geometry.
-- ====================================================================
OPEN wedges
FETCH NEXT FROM wedges INTO @wedgeID, @depth, @convexString
WHILE (@@fetch_status = 0)
	BEGIN
	INSERT #Sector
	SELECT @wedgeID, Overlap.RegionID, Overlap.regionString  
	FROM fGetRegionsOverlapRegion(@convexString, 'TIGEOM', 0) Overlap
	     join Region R ON Overlap.regionID= R.regionID
	     and R.isMask = 0
	FETCH NEXT FROM wedges INTO @wedgeID, @depth, @convexString
	END   
CLOSE wedges
 
-- ====================================================================
-- for each sector compute its intersections with negative tile masks.
-- ====================================================================
-- Detect if hack works (will only work if each tile geometry element is convex).
IF exists (SELECT convexID 
	   FROM   RegionConvexString 
	   WHERE  type = 'TIGEOM'
	   GROUP BY convexID
	   HAVING count(*) > 1) 
	BEGIN
	print 'Sorry, some holes are not convexes do it wont work'
	GOTO Cleanup
	END  
-- Declare cursors over sectors and holes
DECLARE sectors CURSOR READ_ONLY FOR 
	SELECT wedgeID, regionID, regionString 
	FROM  #Sector
	ORDER BY wedgeID ASC
DECLARE holes CURSOR READ_ONLY FOR 
	SELECT convexString 
	FROM  Region R join regionConvexString RCS on R.regionID = RCS.regionID
	WHERE R.type = 'TIGEOM' 
	and R.isMask = 1  
	ORDER BY R.regionID ASC
OPEN sectors
--====================================================================
-- For each sector see if it overlaps a hole.  If so, subtract the hole
FETCH NEXT FROM sectors INTO @wedgeID, @regionID, @convexString
WHILE (@@fetch_status = 0)
	BEGIN
	-- ConvexString is the AND of the 1/2 circles in the sector.
	SET @convexString = replace(@convexString,'REGION ',' ') + ' '
	OPEN holes
	FETCH NEXT FROM holes INTO @holeString
	WHILE (@@fetch_status = 0)
		BEGIN
		-- @holeString is the and of the 1/2 circles in the sector 
		SET @holeString = replace(@holeString,'REGION CONVEX','') 
		SET @holeString =  ' ' + rtrim(dbo.fNormalizeString(@holeString))
		-- If the AND of the two has non null overlap
		IF len(dbo.fHtmToNormalForm('REGION ' + @convexString + @holeString)) 
			> len('REGION CONVEX')+ len(@convexString)
			BEGIN
			--==================================================
			-- this hole hits this sector, subtract it out.
			-- Sector is CONVEX ABC, hole is XYZ, 
			-- anwser is CONVEX ABC-X CONVEX ABC-Y CONVEX ABC-Z)
			-- negate the hole string (flip the sign bit)
			SET @holeString = replace(@holeString,' ',' -')  -- +   -> minius
			SET @holeString = replace(@holeString,'--',' ')  -- minus -> plus
			--- this turns every ' 'x to 'convex sector x' (ie sector and x)
			SET @newSector = replace(@holeString,' ', @convexString)
			SET @newSector = dbo.fNormalizeString('REGION ' + @newSector)
			-- Now simplify the region
	 		SET @newSector = dbo.fHtmToNormalForm(@newSector)
			-- The result is the new value of the sector.
			UPDATE #Sector
			SET regionString = @newSector
			WHERE @wedgeID= @wedgeID and regionID =@regionID   
			END
		FETCH NEXT FROM holes INTO @holeString
		END
	FETCH NEXT FROM sectors INTO @wedgeID, @regionID, @convexString
	CLOSE holes
	END   
CLOSE sectors
--=====================================================================
-- Delete any sectors that are null because the holes covered them.
DELETE #Sector WHERE 'REGION CONVEX' = rtrim(regionString)

---====================================================================
--- Now put the sectors in the regions table 
--  Detect if hack works (will only work if each tile geometry element is convex).
--  Fail if convexString has two ... CONVEX .... CONVEX   (== 2 convexes)
IF exists (SELECT wedgeID 
	   FROM   #Wedge
	   WHERE  0 != patindex(convexString, '%CONVEX%CONVEX%')) 
	BEGIN
	print 'Sorry, some sectors are not convexs so Jim''s hack won''t work'
	GOTO Cleanup
	END  
-- Declare cursors over sectors and holes
OPEN wedges
-- ====================================================================
-- for each sector add it to the regions and tiles tables
-- ====================================================================
FETCH NEXT FROM wedges INTO @wedgeID, @depth, @convexString
WHILE (@@fetch_status = 0)
	BEGIN
	INSERT Region ( [id]   ,    type,  [stripe], run, comment, ismask, area, sql, xml) 
		VALUES (@wedgeId, 'SECTOR',   @depth,   0,      '',      0,   0,  '',  '') 
	SELECT @regionID = regionID 
		FROM Region
		WHERE [id] = @wedgeID and type = 'SECTOR'
 	INSERT Convex 
		SELECT  @regionID, [id], 'SECTOR', cx, cy, cz, d
		FROM dbo.fHtmStringToRegion(@convexString)
	INSERT RegionConvexString -- **** test above proves sectors are single convexes   
		VALUES (@regionID, 1, 'SECTOR', 
			replace(@convexString,'REGION CONVEX ','')) 
	INSERT tileContains ( tileID, regionID,      type)
		 VALUES      (@tileID, @regionID, 'SECTOR')
	FETCH NEXT FROM wedges INTO @wedgeID, @depth, @convexString
	END
CLOSE wedges
-- ====================================================================
-- Common exit, deallocate cursors, drop temporary tables.
-- ====================================================================
Cleanup:
DEALLOCATE wedges
DEALLOCATE holes
DEALLOCATE sectors
DROP TABLE #tile 
DROP TABLE #tileWedge
DROP TABLE #wedge
DROP TABLE #Sector
-------------------------------------------------------------
-- Lets see how it worked.
select * from tileContains
select * from region where type in ('WEDGE','SECTOR')
select * from convex where type in ('WEDGE','SECTOR')
select * from RegionConvexString where type in ('WEDGE','SECTOR')
</pre>
