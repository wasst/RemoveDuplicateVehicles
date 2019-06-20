CREATE PROCEDURE [spMyObject_delete]
	(@MyKeyField_1 	[int])

AS DELETE [HCCApps].[dbo].[tblMyObject] 

WHERE 
	( [MyKeyField]	 = @MyKeyField_1)