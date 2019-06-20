CREATE VIEW dbo.vtemp1
AS
SELECT     T1.TempID, T2.TempID AS Expr1
FROM         dbo.[temp] T1 LEFT OUTER JOIN
                      dbo.[temp] T2 ON T1.TempID + 1 = T2.TempID
WHERE     (T2.TempID IS NULL)
