




/****** Object:  Stored Procedure dbo.sysDbReindex    Script Date: 22/11/1999 19:54:39 ******/
/****** Object:  Stored Procedure dbo.sysDbReindex    Script Date: 05/11/1999 9:54:55 ******/
CREATE PROCEDURE sysDbReindex
AS
set nocount on
set ansi_warnings off

/*
--===============================================================================================
--#~~ PROGRAM REGISTER INFORMATION
--    ============================
--#~~ PRECIS
--    ------
--#~~
--#~~
--#~~ CHANGE REGISTER
--    ---------------
--#~~ Date       	Who             	Ver         	AR          	REASON
--    -------------------------------------------------------------------------------------------
--#~~ |xx/xx/xxxx	|xxxxxxxxxxxxxxx	|xxxxxxxxxx	|xxxxxxxxxx	| xxxxxxxxxxxxxxxxxxxx
--#~~ |01/01/1999	|Proclaim		|001      	|      		| Initial Version
--#~~ |26/04/2000	|CSeroukas		|002      	|      		| Fix syntax for SQL 7.0
--#~~ |04/08/2000	|EChan			|003		|		| Ensure that this SP can be run 
--#~~ |		via Job schedules.  For some reason SQL fell over on tables which did no have user defined indexes 
--#~~ |		when attempting to reindex the table.  However when run in Query Analyzer, the SP had no problems 
--#~~ |		and did not crash at all.
--#~~ |15/08/2000	|EChan			|004		|		|Update the selection query
--#~~ |		of tables containing indexes.
--#~~ |23/02/2001	|EChan			|005		|		| Extend length for object names to faciliate for longer names
--===============================================================================================
*/

DECLARE @tablename varchar(50)
DECLARE @msg varchar(100)
DECLARE @sqlstring varchar(100)

DECLARE tnames_cursor CURSOR FOR 
/*	SELECT distinct o.name 
	FROM sysobjects o
	 WHERE o.type = 'U'
	and exists (select i.id, i.name 
			from sysindexes i
			where (i.id = o.id)
			and (i.name <> o.name)
			and (substring(i.name, 1, 3) <> '_WA'))
	order by o.name
*/

	SELECT distinct o.name -- , i.name
	FROM sysobjects o join sysindexes i
	on i.id = o.id
	 WHERE o.type = 'U'
--	and (i.name <> o.name)
	and (i.status&32) = 0	-- Hypotheticals!
	and i.indid > 0 and i.indid < 255
	and (substring(i.name, 1, 3) <> '_WA')
	order by o.name

OPEN tnames_cursor
FETCH NEXT FROM tnames_cursor INTO @tablename

WHILE (@@fetch_status <> -1)
BEGIN
	IF (@@fetch_status <> -2)
	BEGIN
		SELECT @msg = 'Reindexing ' +
		       RTRIM(UPPER(@tablename)) + '...'
		PRINT @msg
		SELECT @sqlstring = 'DBCC DBREINDEX(' + @tablename + ', " ", 0, SORTED_DATA_REORG)'
		EXEC (@sqlstring)
	END
	FETCH NEXT FROM tnames_cursor INTO @tablename
END

PRINT '  '
PRINT '  '
PRINT 'Reindexing is completed for all tables.'
DEALLOCATE tnames_cursor





