﻿

CREATE VIEW [dbo].[vLink_HRHMN_EMPL_REF]
AS
SELECT     ID_NUMBER, FAMILY_NAME, GIVEN_NAME, OTHER_GIVEN_NAME, DATE_OF_BIRTH, ALIAS_NAME, MARITAL_STATUS_CDE, GENDER_CODE, 
                      ADDRSS_POSTAL_CODE, ADDRSS_STREET_CODE, ID_CLASS, ROW_STATUS, CLOSED_USER, CLOSED_DATE, CLOSED_TIME, CLOSED_TERM, 
                      CLOSED_WINDOW, CRUSER, CRDATEI, CRTIMEI, CRTERM, CRWINDOW, LAST_MOD_USER, LAST_MOD_DATEI, LAST_MOD_TIMEI, 
                      LAST_MOD_TERM, LAST_MOD_WINDOW, VERS, REHIRE_IND, ACTIVE_IND, EMPL_NATIONALITY, ETHNIC_GROUP, MAIN_LANGUAGE, 
                      EMPL_DISABILITY, EMPL_ID_CODE, USER_ID, ENT_TECH_KEY, REEMPL_CODE, LAST_TERM_DATEI, SALUTATION, PREVIOUS_NAME, 
                      RESIDENT_STATUS, VISA_TYPE, PREVIOUS_GIVEN_NAME, PREVIOUS_OTHER_GIVEN_NAME
FROM  [FinProd].[dbo].HRHMN_EMPL_REF
 

