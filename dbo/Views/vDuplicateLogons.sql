create view vDuplicateLogons as
select top 100 percent Employee_ID, LogonName from tblPerson_Transfer t1
where exists
(
SELECT     LogonName
FROM         dbo.tblPerson_transfer t2
WHERE LogonName is not null AND LogonName <> '' and t1.LogonName = t2.LogonName
GROUP BY LogonName
HAVING      (COUNT(LogonName) > 1)
)
order by LogonName, Employee_ID

