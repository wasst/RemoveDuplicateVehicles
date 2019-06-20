CREATE TABLE [dbo].[tblPhotoImages] (
    [ImageName] NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_tblPhotoImages] PRIMARY KEY CLUSTERED ([ImageName] ASC) WITH (FILLFACTOR = 90)
);

