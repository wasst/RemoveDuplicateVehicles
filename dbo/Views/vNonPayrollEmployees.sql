CREATE VIEW dbo.vNonPayrollEmployees
AS
SELECT     TOP 100 PERCENT *
FROM         dbo.tblPerson
WHERE     (IsOnPayroll = 'N')
ORDER BY Last_Name, First_Name
