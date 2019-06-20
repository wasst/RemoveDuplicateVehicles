CREATE PROCEDURE 

/*
This stored procedure determines the NextID to use as an automatic Index.
It finds the lowest available ID number



*/

spGetNextID 

  @TableName nvarchar(50) 
, @FieldName  nvarchar(50)      --FieldName of Primary Key
, @NextID Integer = 0 OUTPUT

AS

DECLARE @SQLText nvarchar(4000)
DECLARE @TempResult Integer
DECLARE @NL CHAR(2)

Set @NL = CHAR(13) + CHAR(10)

CREATE TABLE #TempResult (NextID Integer)

--Declare a table type variable
--(Same problem - out of scope)
--DECLARE @TempResultTable TABLE(NextID Integer)


/*
Why I used a temporary table:
@NextID and @TempResult within the Execute statement are not accessible from within the main body.

*/


--If 1 is not used we use this.
Set @SQLText = 'INSERT INTO #TempResult Select ' + @FieldName + ' FROM ' + @TableName + ' where ' + @FieldName + ' = 1'
EXECUTE (@SQLText)

IF NOT EXISTS(SELECT * FROM #TempResult)
BEGIN
	--1 is available so use this
	Insert into #TempResult values (1)
END
ELSE
BEGIN
 	delete from #TempResult

	Set @SQLText = 
		--'DECLARE @TempResult integer'  + @NL
		--+ 'SET @TempResult = (' +@NL
		-- 'SET @NextID = (' +@NL
		'INSERT INTO #TempResult ' + @NL 
		+ 'SELECT IsNull(MIN(T2.' + @Fieldname + '),0)  + 1 As NextID' + @NL
		+ ' FROM ' + @TABLENAME + ' t1 RIGHT OUTER JOIN ' + @Tablename + '  t2  ON t1.' + @FieldName + ' = t2.' + @FieldName + ' + 1' + @NL
		+ ' WHERE (t1.' + @FieldName + ' IS NULL)' + @NL
		--+ ')' + @NL



	PRINT @SQLText
	EXECUTE  (@SQLText)
END


SET @NextID = (Select NextID from #TempResult)





IF @@ERROR = 0
BEGIN
	--Return a postitive number to indicate all is well
	RETURN @NextID
END ELSE
BEGIN
	RETURN -1 --To indicate an error
END