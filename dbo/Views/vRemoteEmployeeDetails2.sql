
CREATE VIEW [dbo].[vRemoteEmployeeDetails2]
AS
SELECT     T1.ID_NUMBER, T1.JOB_POS_TITLE, T1.POSITION_CODE, T1.POSITION_SUPERVSR, T2.CODE_ID AS DivisionCode, T2.CODE_DESCR AS Division, 
                      T4.CODE_ID AS UnitCode, T4.CODE_DESCR AS Unit, T3.CODE_ID AS LocationCode, T3.CODE_DESCR AS Location, T1.EFFECTIVE_DATE, 
                      T1.POSITION_TYPE_IND
FROM         dbo.vlink_HRHMN_EMPL_JOB_POS AS T1 INNER JOIN
                      dbo.vLink_HRSTC_CODE AS T2 ON T1.DEPARTMENT_CODE = T2.CODE_ID AND T2.CODE_TYPE = 'DEPARTMENT_CODE' INNER JOIN
                      dbo.vLink_HRSTC_CODE AS T3 ON T1.WORK_LOCATION = T3.CODE_ID AND T3.CODE_TYPE = 'LOCATION' INNER JOIN
                      dbo.vLink_HRSTC_CODE AS T4 ON T1.WORK_GROUP = T4.CODE_ID AND T4.CODE_TYPE = 'WORK_GROUP'
WHERE     (T1.EFFECTIVE_DATE =
                          (SELECT     MAX(EFFECTIVE_DATE) AS MaxEffectiveDate
                            FROM          dbo.vlink_HRHMN_EMPL_JOB_POS
                            WHERE      (ID_NUMBER = T1.ID_NUMBER))) AND (T1.POSITION_TYPE_IND = 'P')


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[24] 4[45] 2[11] 3) )"
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
         Begin Table = "T1"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 336
               Right = 270
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "T2"
            Begin Extent = 
               Top = 6
               Left = 228
               Bottom = 299
               Right = 420
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "T3"
            Begin Extent = 
               Top = 6
               Left = 458
               Bottom = 291
               Right = 650
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "T4"
            Begin Extent = 
               Top = 6
               Left = 688
               Bottom = 248
               Right = 880
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
      Begin ColumnWidths = 13
         Width = 284
         Width = 1500
         Width = 1725
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 2325
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 2355
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
   ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vRemoteEmployeeDetails2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'      Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vRemoteEmployeeDetails2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vRemoteEmployeeDetails2';

