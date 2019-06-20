CREATE TABLE [dbo].[tblUpdateVehicleInfo] (
    [VehicleId]            INT            NOT NULL,
    [NewInformation]       NVARCHAR (MAX) NULL,
    [OldInformation]       NVARCHAR (MAX) NULL,
    [Difference]           INT            NULL,
    [NewInformationLength] INT            NULL,
    [OldInformationLength] INT            NULL,
    CONSTRAINT [PK_tblUpdateVehicleInfo] PRIMARY KEY CLUSTERED ([VehicleId] ASC)
);

