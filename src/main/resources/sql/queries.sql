--1
--Получить список всех песен данной группы.
USE [music]
GO
CREATE PROCEDURE query1

@p1 nchar(15)

AS
SET NOCOUNT ON;
BEGIN
SELECT Music.*
FROM Music
INNER JOIN dbo.SongArtist ON dbo.SongArtist.FK_Music = Music.PK_Music
INNER JOIN dbo.Artist ON dbo.Artist.PK_Artist = SongArtist.FK_Artist 
INNER JOIN dbo.ArtistInBand ON dbo.ArtistInBand.FK_Artist = Artist.PK_Artist 
INNER JOIN dbo.Band ON dbo.Band.PK_Band = ArtistInBand.FK_Band 
WHERE Band.Name = @p1
END
EXEC query1 @p1 = 'TDG'
------------------------------------------------------------------------------------------------------------
--2
USE [music]
GO
CREATE PROCEDURE queryMusicInAlbum

@p1 nchar(50)

AS
SET NOCOUNT ON;
BEGIN
SELECT Music.*
FROM Music
INNER JOIN dbo.MusicInAlbum ON dbo.MusicInAlbum.FK_Music = Music.PK_Music
INNER JOIN dbo.Album ON dbo.Album.PK_Album = MusicInAlbum.FK_Album
WHERE Album.Name = @p1
END
EXEC queryMusicInAlbum @p1 = 'asd'
------------------------------------------------------------------------------------------------------------
--3
--Вывести список альбомов вышедших в период с по
USE [music]
GO
CREATE PROCEDURE queryAlbumPeriod

@p1 date,
@p2 date

AS
SET NOCOUNT ON;
BEGIN
SELECT Album.*
FROM Album
WHERE Album.ReleaseDate > @p1 and Album.ReleaseDate < @p2
END
EXEC queryAlbumPeriod @p1 = '11.11.2000', @p2 = '11.11.2019'
------------------------------------------------------------------------------------------------------------
--4
--Получить данные о составах групп на текущий момент: общая численность, возраст участников
IF EXISTS (SELECT * FROM music.sys.procedures WHERE name = 'queryInfoGroup')
DROP PROCEDURE queryInfoGroup 

USE [music]
GO

CREATE PROCEDURE queryInfoGroup

@p1 nchar(20)
AS
SET NOCOUNT ON;
BEGIN

SELECT Band.Name, (SELECT COUNT(ArtistInBand.FK_Artist)) as [Колличество участников], (SELECT (SELECT SUM(Artist.age)) / (SELECT COUNT(Artist.PK_Artist))) as [Средний возраст]
FROM Band
INNER JOIN dbo.ArtistInBand ON dbo.ArtistInBand.FK_Band = Band.PK_Band
INNER JOIN dbo.Artist ON dbo.Artist.PK_Artist = ArtistInBand.FK_Artist
WHERE Band.Name = @p1
GROUP BY Band.Name
END
EXEC queryInfoGroup @p1 = 'Skillet'

------------------------------------------------------------------------------------------------------------
--6
--Колличество поситителей
USE [music]
GO
CREATE PROCEDURE queryCountVisitors

@p1 date
AS
SET NOCOUNT ON;
BEGIN
SELECT COUNT(PK_Users)
FROM Users
INNER JOIN dbo.Login ON dbo.Login.FK_Users = Users.PK_Users
WHERE Login.DateLogin = @p1
END
EXEC queryCountVisitors @p1 = '11.11.2000'
------------------------------------------------------------------------------------------------------------
--7
--Сведения песен

USE [music]
GO
CREATE PROCEDURE queryCountVisitors

@p1 nchar(15)
AS
SET NOCOUNT ON;
BEGIN
SELECT Music.*, (SELECT SUM(Music.Duration))
FROM Album
INNER JOIN dbo.MusicInAlbum ON dbo.MusicInAlbum.FK_Album = Album.PK_Album
INNER JOIN dbo.Music ON dbo.Music.PK_Music = MusicInAlbum.FK_Music
WHERE Album.Name = @p1
GROUP BY Music.PK_Music, Music.Photo, Music.MusFormat, Music.Duration, Music.Cost
END 
EXEC queryCountVisitors @p1 = 'asd'
------------------------------------------------------------------------------------------------------------
--8
--Юбиляры текущего года

USE [music]
GO
CREATE PROCEDURE queryAnniversaries

@p1 date
AS
SET NOCOUNT ON;
BEGIN
SELECT Artist.*
FROM Artist
WHERE (DATEDIFF ( YEAR , @p1, Artist.birthday )  ) % 5 = '0'
END 
EXEC queryAnniversaries @p1 = '2015.11.11'
------------------------------------------------------------------------------------------------------------
--9
--Юбилейные группы текущего года
USE [music]
GO
CREATE PROCEDURE queryGroupAnniversaries

@p1 date
AS
SET NOCOUNT ON;
BEGIN
SELECT Band.*
FROM Band
WHERE (DATEDIFF ( YEAR , @p1, Band.DateOfFoundation )  ) % 5 = '0'
END 
EXEC queryGroupAnniversaries @p1 = '2017.11.11'
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
--search
USE [music]
GO
/****** Object:  StoredProcedure [dbo].[Search]    Script Date: 07.12.2017 1:01:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER Procedure [dbo].[Search] @find nvarchar(20)
AS
BEGIN
SELECT Band.PK_Band, Band.Name, Band.DateOfFoundation, Band.Description, Band.DateOfClose
FROM Band INNER JOIN GenreGr
ON GenreGr.FK_Band = Band.PK_Band
INNER JOIN Genre
ON Genre.PK_Genre = GenreGr.FK_Genre
INNER JOIN Album 
ON Album.FK_Band = Band.PK_Band 
INNER JOIN MusicInAlbum
ON MusicInAlbum.FK_Album = Album.PK_Album
INNER JOIN Music
ON Music.PK_Music = MusicInAlbum.FK_Music
WHERE lower(Band.Name) LIKE lower(@find) OR lower(Music.Name) LIKE lower(@find) OR Genre.Name LIKE lower(@find) OR lower(Album.Name) LIKE lower(@find)
GROUP BY Band.Name, Band.PK_Band, Band.DateOfFoundation, Band.Description, Band.DateOfClose
END
------------------------------------------------------------------------------------------------------------------------------
---similar bands
USE [music]
GO
/****** Object:  StoredProcedure [dbo].[Search]    Script Date: 10.12.2017 1:40:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[Similar] @find int
AS
BEGIN
select Band.* from Band 
INNER JOIN dbo.GenreGr ON GenreGr.FK_Band = PK_Band
inner join dbo.Genre on Genre.PK_Genre = GenreGr.FK_Genre
where dbo.Genre.PK_Genre = @find
END
------------------------------------------------------------------------------------------------------------------------------
---similar albums
USE [music]
GO
/****** Object:  StoredProcedure [dbo].[Search]    Script Date: 10.12.2017 1:40:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[SimilarAlbum] @id int
AS
BEGIN
select Album.* from Album
inner join dbo.Band on Album.FK_Band = Band.PK_Band
INNER JOIN dbo.GenreGr ON GenreGr.FK_Band = PK_Band
inner join dbo.Genre on Genre.PK_Genre = GenreGr.FK_Genre
where dbo.Genre.PK_Genre = @id
END
----------------------------------------------------------------------------------------------------------------------------------
--insert into login
USE [music]
GO
/****** Object:  StoredProcedure [dbo].[Search]    Script Date: 10.12.2017 1:40:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[insertLogin] @id int
AS
BEGIN
INSERT INTO Login (FK_Users, DateLogin, DateLogout) VALUES(@id, GETDATE() , null);
END
-------------------------------------------------------------------------------------------------------------------------------------
---Albums in cart
USE [music]
GO
/****** Object:  StoredProcedure [dbo].[AlbumMusic]    Script Date: 11.12.2017 0:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure CartAlbum @id int
AS
BEGIN
select Album.* from Album
inner join dbo.AlbumCart on AlbumCart.FK_Album = Album.PK_Album
inner join dbo.Cart on AlbumCart.FK_Cart = Cart.PK_Cart
inner join dbo.Users on Cart.FK_User = Users.PK_Users
where Users.PK_Users = @id
End
-------------------------------------------------------------------------------------------------------------------------------------
---Music in cart
USE [music]
GO
/****** Object:  StoredProcedure [dbo].[CartMusic]    Script Date: 11.12.2017 0:15:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[CartMusic] @id int
AS
BEGIN
select Music.* from Music
inner join dbo.MusicCart on MusicCart.FK_Music = Music.PK_Music
inner join dbo.Cart on MusicCart.FK_Cart = Cart.PK_Cart
inner join dbo.Users on Cart.FK_User = Users.PK_Users
where Users.PK_Users = @id
End
------------------------------------------------------------------------------------------------------------------------------------------
-------------Band in Card
GO
/****** Object:  StoredProcedure [dbo].[CartMusic]    Script Date: 11.12.2017 0:15:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[CartBand] @id int
AS
BEGIN
select Band.* from Band
inner join dbo.BandCart on BandCart.FK_Band = Band.PK_Band
inner join dbo.Cart on BandCart.FK_Cart = Cart.PK_Cart
inner join dbo.Users on Cart.FK_User = Users.PK_Users
where Users.PK_Users = @id
End
-------------------------------------------------------------------------------------------------------------------------------------------
-------альбомы по жанру
USE [music]
GO
/****** Object:  StoredProcedure [dbo].[AlbumMusic]    Script Date: 11.12.2017 0:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure recomend @find int
AS
BEGIN
SELECT Album.* from Album
inner join Band on PK_Band = Album.FK_Band
inner join GenreGr on GenreGr.FK_Band = Band.PK_Band
inner join Genre on GenreGr.FK_Genre = Genre.PK_Genre
where Genre.PK_Genre = @find
End
------------------------------------------------------------------------------------------------------------------------------------------------
----recomend
USE [music]
GO
/****** Object:  StoredProcedure [dbo].[AlbumMusic]    Script Date: 11.12.2017 0:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure recomend @find int
AS
BEGIN
Select TOP 1 COUNT(PK_Genre) as PK_count, Name 
FROM(
SELECT Genre.*
FROM Genre
INNER JOIN GenreGr ON Genre.PK_Genre = GenreGr.FK_Genre
INNER JOIN Band ON Band.PK_Band = GenreGr.FK_Band
INNER JOIN Album ON Album.FK_Band = Band.PK_Band
INNER JOIN (
select Album.* 
from Album
inner join dbo.AlbumCart on AlbumCart.FK_Album = Album.PK_Album
inner join dbo.Cart on AlbumCart.FK_Cart = Cart.PK_Cart
inner join dbo.Users on Cart.FK_User = Users.PK_Users
where Users.PK_Users = 3) as a ON a.PK_Album = Album.PK_Album
) as a
GROUP BY PK_Genre, Name
ORDER BY PK_count DESC
END
-----------------------------------------------------------------------------------------------------------------------------------------------------
-----популярная музыка
USE [music]
GO
/****** Object:  StoredProcedure [dbo].[recomend]    Script Date: 12.12.2017 12:22:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[pop] @find int
AS
BEGIN
Select TOP 5 COUNT(Music.PK_Music) as PK_count, Music.PK_Music, Music.Name
FROM Music inner join(
SELECT Music.*
FROM Music
inner join dbo.MusicCart on MusicCart.FK_Music = Music.PK_Music
inner join dbo.Cart on MusicCart.FK_Cart = Cart.PK_Cart
inner join dbo.Users on Cart.FK_User = Users.PK_Users) as a ON a.PK_Music = Music.PK_Music
GROUP BY Music.PK_Music, Music.Name
ORDER BY PK_count DESC
END
------------------------------------------------------------------------------------------------------------------------------------------------------------
USE [music]
GO
/****** Object:  StoredProcedure [dbo].[recomend]    Script Date: 12.12.2017 12:22:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[albumBand] @find nvarchar(30)
AS
BEGIN
SELECT Band.*
from Band
inner join Album on Album.FK_Band = PK_Band
where Album.Name = @find
END