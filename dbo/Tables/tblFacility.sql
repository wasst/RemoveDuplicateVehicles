CREATE TABLE [dbo].[tblFacility] (
    [Facility_ID]    INT            IDENTITY (1, 1) NOT NULL,
    [Facility_Name]  NVARCHAR (150) NULL,
    [Address]        NVARCHAR (150) NULL,
    [Phone]          NVARCHAR (25)  NULL,
    [Fax]            NVARCHAR (15)  NULL,
    [Contact_Person] NVARCHAR (50)  NULL,
    CONSTRAINT [PK_tblFacility] PRIMARY KEY CLUSTERED ([Facility_ID] ASC) WITH (FILLFACTOR = 90)
);

