CREATE VIEW dbo.vReport_PhoneNumbersInternal
AS

SELECT     TOP 100 PERCENT FullName_Backward,
 coalesce(phWork_Full, PhWork_Ext) as Phone
,phone_Alt =
	case isnull((phWork_Full + phWork_Ext), 'true') 
		when  'true' then null
	else
		phWork_ext
	end
,phMobile
 
FROM         dbo.vPerson
WHERE     (LogonName <> '') AND (LogonName IS NOT NULL) AND (Is_Current = 'Y')
ORDER BY FullName_Backward

