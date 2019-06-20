CREATE PROCEDURE spTest
as 
Insert into TblTemp2 (ThisDate) Values ( getdate())
