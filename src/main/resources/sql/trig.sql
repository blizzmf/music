
------------------------------------------------------------------------------------------------
CREATE TRIGGER toUp
ON dbo.Artist
INSTEAD OF INSERT-----+
AS
BEGIN
SET NOCOUNT ON;

declare @ID int
declare @surName nchar(30)
declare @name nchar(30)
declare @sec nchar(30)
declare @spec nchar(20)
declare @birthday date

select @ID = inserted.PK_Artist
from inserted
select @surName = inserted.Surname
from inserted
select @name = inserted.Name
from inserted
select @sec = inserted.Secondname
from inserted
select @spec = inserted.Spec
from inserted
select @birthday = inserted.birthday
from inserted

declare @new_surName nchar(30)
declare @new_name nchar(30)
declare @new_sec nchar(30)
set @new_surName = UPPER(SUBSTRING(@surName,1,1)) + LOWER(SUBSTRING(@surName,2,LEN(@surName)))
set @new_name = UPPER(SUBSTRING(@name,1,1)) + LOWER(SUBSTRING(@name,2,LEN(@name)))
set @new_sec = UPPER(SUBSTRING(@sec,1,1)) + LOWER(SUBSTRING(@sec,2,LEN(@sec)))

insert into Artist values(@new_surName,@new_name,@new_sec,@spec,@birthday)
END
GO
-----------------------------------------------------------------------------------------------
USE Music  
GO  

CREATE TRIGGER WhileTrigger--+
ON dbo.Music
AFTER INSERT
AS
BEGIN
SET NOCOUNT ON;
WHILE (SELECT AVG(Cost) FROM Music) < 30 
BEGIN  
   UPDATE Music
      SET Cost = Cost * 2  
   SELECT MAX(Cost) FROM Music  
   IF (SELECT MAX(Cost) FROM Music) > 5000  
      BREAK  
   ELSE  
      CONTINUE  
END  
END
GO
--------------------------------------------------------------------------------------------------
CREATE TRIGGER CheckDate
ON dbo.Band
AFTER INSERT--+
AS
BEGIN
SET NOCOUNT ON;
DECLARE @a date
SELECT @a = inserted.DateOfFoundation
FROM inserted
DECLARE @b date
SELECT @b = inserted.DateOfClose
FROM inserted
IF @a > @b
ROLLBACK TRANSACTION
END
GO
---------------------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO 
SET QUOTED_IDENTIFIER ON--+
GO

CREATE TRIGGER DeleteBand
ON dbo.Band
INSTEAD OF DELETE
AS
BEGIN
SET NOCOUNT ON;
BEGIN
DELETE dbo.GenreGr
FROM deleted
WHERE deleted.PK_Band = FK_Band
DELETE dbo.Band
FROM deleted
WHERE deleted.PK_Band = Band.PK_Band
END
END
GO

-------------------------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO 
SET QUOTED_IDENTIFIER ON--+
GO

CREATE TRIGGER DeleteGenre
ON dbo.Genre
INSTEAD OF DELETE
AS
SET NOCOUNT ON;
BEGIN
DELETE dbo.GenreGr
FROM deleted
WHERE deleted.PK_Genre = FK_Genre
DELETE dbo.Genre
FROM deleted
WHERE deleted.PK_Genre = Genre.PK_Genre
END

GO
-----------------------------------------------------------------------------------------------------------------
USE [music]
GO
/****** Object:  Trigger [dbo].[DeleteMusic]    Script Date: 13.12.2017 19:41:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER TRIGGER [dbo].[DeleteMusic]
ON [dbo].[Music]
INSTEAD OF DELETE
AS
SET NOCOUNT ON;
BEGIN
DELETE dbo.SongArtist
FROM deleted
WHERE deleted.PK_Music = SongArtist.FK_Music

DELETE dbo.MusicInAlbum
FROM deleted
WHERE deleted.PK_Music = FK_Music
DELETE dbo.Music
FROM deleted
WHERE deleted.PK_Music = Music.PK_Music
END