

CREATE VIEW [dbo].[vPerson_finProd]
AS 
SELECT 
Family_Name + ', ' + Alias_Name AS FullName_Backward
, Alias_Name + ' ' + Family_Name AS FullName_Forward
, ID_Number AS Employee_ID
, Family_Name AS last_Name
, Alias_Name AS First_Name
, Other_Given_Name AS  Middle_Name
, WorkPhone_1 AS    PhWork_Full
 , WorkPhone_2 AS  PhWork_Ext 
                      , Mobile_Phone AS PhMobile
                      , 'n/a' AS PhHome
                      ,  Email_address AS Email
                      , '' AS Fax
                      , Active_Ind AS Is_Current
                      , User_Id AS  LogonName
                      , Unit AS Unit_Name
                      , Division AS Division_Name
                      , Job_Pos_Title AS Position_Desc
 FROM dbo.vEmployee

