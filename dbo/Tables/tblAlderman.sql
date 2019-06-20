CREATE TABLE [dbo].[tblAlderman] (
    [AldermanID]    INT           IDENTITY (1, 1) NOT NULL,
    [LastName]      NVARCHAR (50) NULL,
    [FirstName]     NVARCHAR (50) NULL,
    [Title]         NVARCHAR (50) NULL,
    [SortOrder]     INT           NULL,
    [PhWork1]       CHAR (12)     NULL,
    [PhWork2]       CHAR (12)     NULL,
    [PhMobile]      CHAR (15)     NULL,
    [PhHome]        CHAR (12)     NULL,
    [FaxHome]       CHAR (12)     NULL,
    [FaxWork]       CHAR (12)     NULL,
    [Email1]        NVARCHAR (50) NULL,
    [Email2]        NVARCHAR (50) NULL,
    [StreetAddress] NVARCHAR (50) NULL,
    [Suburb]        NVARCHAR (50) NULL,
    [Postcode]      NVARCHAR (50) NULL,
    [KeepPrivate]   CHAR (1)      CONSTRAINT [DF_tblAlderman_KeepPrivate] DEFAULT ('Y') NULL,
    CONSTRAINT [PK_tblAlderman] PRIMARY KEY CLUSTERED ([AldermanID] ASC) WITH (FILLFACTOR = 90)
);

