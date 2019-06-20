
CREATE VIEW [dbo].[vRemoteAllEmployeeDetails]
AS
SELECT     TOP (100) PERCENT dbo.vRemoteEmployeeDetails1.ID_NUMBER, dbo.vRemoteEmployeeDetails1.FAMILY_NAME, 
                      dbo.vRemoteEmployeeDetails1.GIVEN_NAME, dbo.vRemoteEmployeeDetails1.OTHER_GIVEN_NAME, dbo.vRemoteEmployeeDetails1.ALIAS_NAME, 
                      dbo.vRemoteEmployeeDetails1.ACTIVE_IND, dbo.vRemoteEmployeeDetails1.USER_ID, dbo.vRemoteEmployeeDetails1.WorkPhone_1, 
                      dbo.vRemoteEmployeeDetails1.WorkPhone_2, dbo.vRemoteEmployeeDetails1.EMAIL_ADDRESS, dbo.vRemoteEmployeeDetails1.MOBILE_PHONE, 
                      dbo.vRemoteEmployeeDetails1.MOBILE_PHONE_2, dbo.vRemoteEmployeeDetails2.JOB_POS_TITLE, 
                      dbo.vRemoteEmployeeDetails2.POSITION_CODE, dbo.vRemoteEmployeeDetails2.POSITION_SUPERVSR, 
                      dbo.vRemoteEmployeeDetails2.DivisionCode, dbo.vRemoteEmployeeDetails2.Division, dbo.vRemoteEmployeeDetails2.UnitCode, 
                      dbo.vRemoteEmployeeDetails2.Unit, dbo.vRemoteEmployeeDetails2.LocationCode, dbo.vRemoteEmployeeDetails2.Location, 
                      dbo.vRemoteEmployeeDetails1.LAST_TERM_DATEI, vRemoteEmployeeDetails1.ID_CLASS
FROM         dbo.vRemoteEmployeeDetails1 LEFT OUTER JOIN
                      dbo.vRemoteEmployeeDetails2 ON dbo.vRemoteEmployeeDetails1.ID_NUMBER = dbo.vRemoteEmployeeDetails2.ID_NUMBER
WHERE     (dbo.vRemoteEmployeeDetails1.ACTIVE_IND = 'Y') OR
                      (dbo.vRemoteEmployeeDetails1.ACTIVE_IND = 'N')
ORDER BY dbo.vRemoteEmployeeDetails1.FAMILY_NAME, dbo.vRemoteEmployeeDetails1.ALIAS_NAME, dbo.vRemoteEmployeeDetails1.OTHER_GIVEN_NAME


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "vRemoteEmployeeDetails1"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 294
               Right = 296
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "vRemoteEmployeeDetails2"
            Begin Extent = 
               Top = 54
               Left = 403
               Bottom = 271
               Right = 703
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 19
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vRemoteAllEmployeeDetails';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vRemoteAllEmployeeDetails';

