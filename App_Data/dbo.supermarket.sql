CREATE TABLE [dbo].[supermarket] (
    [Id]        INT        IDENTITY (1, 1) NOT NULL,
    [name]      NCHAR (20) NULL,
    [adress]    NCHAR (50) NULL,
    [manager]   UNIQUEIDENTIFIER NULL,
    [email]     NCHAR (50) NULL,
    [telephone] NCHAR (20) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

