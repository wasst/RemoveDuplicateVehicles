CREATE PROCEDURE pRetrieveParameter 
 @ParameterName  nvarchar(50)
,@ParameterValue  nvarchar(150) output

AS
	Set @ParameterValue = (Select ParameterValue from tblParameter where ParameterName = @ParameterName)

