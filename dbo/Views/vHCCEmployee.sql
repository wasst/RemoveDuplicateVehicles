CREATE VIEW dbo.vHCCEmployee
AS
SELECT     TOP 100 PERCENT HREmpRef.ID_NUMBER, HREmpRef.FAMILY_NAME, HREmpRef.GIVEN_NAME, HREmpRef.OTHER_GIVEN_NAME, 
                      HREmpRef.ACTIVE_IND, HREmpRef.ALIAS_NAME, HRAddress.TELEPHONE_1, HRAddress.TELEPHONE_2, HRAddress.TELEPHONE_3, 
                      HRAddress.MOBILE_PHONE, HRJobDtl.DEPARTMENT_CODE AS Division_ID, HRJobDtl.WORK_GROUP AS Unit_ID, 
                      Division.CODE_DESCR AS Division_Name, Unit.CODE_DESCR AS Unit_Name, Position.CODE_DESCR AS Job_Position, Unit.CODE_TYPE
FROM         dbo.vLink_HRHMN_EMPL_REF HREmpRef WITH (NOLOCK) INNER JOIN
                      dbo.vLink_HRCOM_ADDRESS_REF HRAddress WITH (NOLOCK) ON HREmpRef.ADDRSS_STREET_CODE = HRAddress.ADDRESS_CODE INNER JOIN
                      dbo.vLink_HRHMN_EMPLJOB_DTL HRJobDtl WITH (NOLOCK) ON HREmpRef.ID_NUMBER = HRJobDtl.ID_NUMBER INNER JOIN
                      dbo.vLink_HRSTC_CODE Division  WITH (NOLOCK) ON HRJobDtl.DEPARTMENT_CODE = Division.CODE_ID INNER JOIN
                      dbo.vLink_HRSTC_CODE Position WITH (NOLOCK) ON HRJobDtl.JOB_TITLE_CODE = Position.CODE_ID LEFT OUTER JOIN
                      dbo.vLink_HRSTC_CODE Unit WITH (NOLOCK) ON HRJobDtl.WORK_GROUP = Unit.CODE_ID
WHERE     (Division.CODE_TYPE = 'DEPARTMENT_CODE') AND (HRJobDtl.EFFECTIVE_DATE =
                          (SELECT     MAX(effective_date)
                            FROM          vLink_HRHMN_EMPLJOB_DTL t1 WITH (NOLOCK)
                            WHERE      t1.ID_Number = HRJobDtl.ID_Number)) AND (Position.CODE_TYPE = 'JOB_TITLE_CODE') AND (Unit.CODE_TYPE = 'WORK_GROUP'
			)