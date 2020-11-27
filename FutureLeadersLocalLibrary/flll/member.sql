CREATE TABLE [dbo].[member]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [name] NCHAR(10) NULL, 
    [surname] NCHAR(10) NULL, 
    [email] NCHAR(10) NULL, 
    [password] NCHAR(10) NULL, 
    [contactno] NCHAR(10) NULL
)
