CREATE VIEW dbo.vCurrentVehicleList
AS
SELECT     dbo.tblVehicle.VehicleID, dbo.tblVehicleMake.vehicle_make_name + ' ' + dbo.tblVehicleModel.vehicle_model_name AS [Make and Model], 
                      dbo.tblPerson.FullName_Forward + ' ' + dbo.tblPerson.FullName_Backward AS [Vehicle Assigned To], dbo.tblVehicle.ParkingSpace, dbo.tblVehicle.Registration, 
                      dbo.tblVehicle.Colour, dbo.tblVehicle.Information, dbo.tblVehicle.AcquisitionDate
FROM         dbo.tblVehicleModel INNER JOIN
                      dbo.tblVehicle ON dbo.tblVehicleModel.vehicle_model_id = dbo.tblVehicle.vehicle_model_id INNER JOIN
                      dbo.tblVehicleMake ON dbo.tblVehicleModel.vehicle_make_id = dbo.tblVehicleMake.vehicle_make_id LEFT OUTER JOIN
                      dbo.tblPerson ON dbo.tblVehicle.AssignedToPersonId = dbo.tblPerson.Employee_ID
WHERE     (dbo.tblVehicle.DisposalDate IS NULL)

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
         Begin Table = "tblVehicleModel"
            Begin Extent = 
               Top = 173
               Left = 619
               Bottom = 343
               Right = 807
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblVehicle"
            Begin Extent = 
               Top = 6
               Left = 260
               Bottom = 389
               Right = 477
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "tblVehicleMake"
            Begin Extent = 
               Top = 29
               Left = 826
               Bottom = 118
               Right = 1011
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblPerson"
            Begin Extent = 
               Top = 6
               Left = 18
               Bottom = 125
               Right = 202
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
      Begin ColumnWidths = 10
         Width = 284
         Width = 1500
         Width = 2205
         Width = 2415
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
        ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vCurrentVehicleList';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N' Or = 1350
         Or = 1350
      End
   End
End
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vCurrentVehicleList';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vCurrentVehicleList';

