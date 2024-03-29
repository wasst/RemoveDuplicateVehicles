﻿
CREATE VIEW [dbo].[vlink_HRHMN_EMPLJOB_DTL]
AS
SELECT     ID_NUMBER, EFFECTIVE_DATE, COMPANY_CODE, DEPARTMENT_CODE, ID_NUMBER_SUPERVSR, WORK_GROUP, WORK_LOCATION, PAY_LOCATION, 
                      EMPL_COND_AWARD, EMPL_COND_GRADE1, EMPL_COND_LEVEL1, PAY_BASIS_CODE, EMPL_TYPE_CODE, TRADE_CODE, JOB_TITLE_CODE, DATE_HIRED, 
                      PROBATN_PERIOD_END, SUPERVISOR, UNION_CODE, ROW_STATUS, CLOSED_USER, CLOSED_DATE, CLOSED_TIME, CLOSED_TERM, CLOSED_WINDOW, 
                      CRUSER, CRDATEI, CRTIMEI, CRTERM, CRWINDOW, LAST_MOD_USER, LAST_MOD_DATEI, LAST_MOD_TIMEI, LAST_MOD_TERM, LAST_MOD_WINDOW, VERS, 
                      SEASON_STATUS, TRADESMAN, EMPL_CLASS, EMPL_COND_GRADE, EMPL_COND_LEVEL, TMC_SEQUENCE_NO, PAY_PERIOD_TYPE, NEXT_REVIEW_DATE, 
                      HOLIDAY_CTGY, PAYADV_TRANS_METH, PAYADV_ADDRESS, TMC_CALC_METHOD, TMC_LEAVE_RULE, RECOV_ITEM_TYPE, RECOV_ITEM_CODE, 
                      ONCRECOV_ITEM_TYPE, ONCRECOV_ITEM_CODE, COST_TYPE, COST_CODE, TS_SYSTEM_NAME, TS_FMT_NAME, TS_ENTRY_IND, PAY_TAX_STATE_CODE
FROM         [FinProd].[dbo].HRHMN_EMPLJOB_DTL
GO 
