


CREATE PROCEDURE
spGetNextID_KeyLocation 
@KeyLocationID integer = 0 OUTPUT
AS

EXECUTE spGetNextID 'tblKeyLocation', 'KeyLocationID',  @NextID = @KeyLocationID OUTPUT