﻿

CREATE VIEW [dbo].[vLink_HRSTC_CODE]
AS
SELECT     CODE_TYPE, CODE_ID, CODE_DESCR, ACTIVE_FLAG, SEQ_NO, MODIFIABLE_BY_USER, ABLE_CHANGE_DESC, CRUSER, CRDATEI, CRTIMEI, 
                      CRTERM, CRWINDOW, LAST_MOD_USER, LAST_MOD_DATEI, LAST_MOD_TIMEI, LAST_MOD_TERM, LAST_MOD_WINDOW, VERS
FROM          [FinProd].[dbo].HRSTC_CODE AS HRSTC_CODE_1
