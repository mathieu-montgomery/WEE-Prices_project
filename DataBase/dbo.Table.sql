CREATE TABLE [dbo].[bookings]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [room] NCHAR(10) NOT NULL, 
    [bookedby] NCHAR(10) NOT NULL, 
    [date] DATE NOT NULL, 
    [time] NCHAR(10) NULL
)
