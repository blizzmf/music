USE MASTER 
GO 
 
------------------------------------------------------------- 
 
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'music')
DROP DATABASE music 
 
------------------------------------------------------------- 
 
CREATE DATABASE music 
 
------------------------------------------------------------- 
 
USE music 
GO 
 
-------------------------------------------------------------
create table Artist
(
	PK_Artist int UNIQUE identity(1,1) NOT NULL,
	Surname nvarchar(30) NOT NULL,
	Name nvarchar(30) NULL,
	Secondname nvarchar(30) NULL,
	Spec nvarchar(20) NULL,
	birthday date NOT NULL,
	
	constraint PK_Artist_Artist primary key (PK_Artist)
)

create table Music 
(  
	PK_Music int UNIQUE identity(1,1) NOT NULL,
	Name nvarchar(30) NOT NULL,
	Duration numeric(5,2) NOT NULL,
	MusFormat nvarchar(5) NOT NULL,
	Cost numeric(5,2) NOT NULL,
	
	
	constraint PK_Music_Music primary key (PK_Music),
)

create table SongArtist
(
	FK_Artist int NOT NULL,
	FK_Music int NOT NULL,
	WhoIs nvarchar(20) NOT NULL,
	constraint FK_Artist_SongArtist foreign key (FK_Artist) references Artist (PK_Artist),
	constraint FK_Music_SongArtist foreign key (FK_Music) references Music (PK_Music),
	constraint PK_SongArtist primary key (FK_Artist, FK_Music),
	
)

create table Genre
(
	PK_Genre int UNIQUE identity(1,1) NOT NULL,
	Name nvarchar(15) NOT NULL,
	
	constraint PK_Genre_Genre primary key (PK_Genre)
)
create table Band
(
	PK_Band int UNIQUE identity(1,1) NOT NULL,
	DateOfFoundation date NOT NULL,
	Name nvarchar(15) NOT NULL,
	Description nvarchar(max) NULL,
	DateOfClose date NULL,
	
	constraint PK_Band_Band primary key (PK_Band),
	constraint CH_DOF_Band check (DateOfFoundation<=GetDate())
)
create table GenreGr
(
	FK_Band int NOT NULL,
	FK_Genre int NOT NULL,
	
	constraint FK_Genre_GenreGr foreign key (FK_Genre) references Genre (PK_Genre),
	constraint FK_Band_GenreGr foreign key (FK_Band) references Band (PK_Band),
)
create table ArtistInBand
(
	FK_Artist int NOT NULL,
	FK_Band int NOT NULL,
	DateIn date NOT NULL,
	DateOut date NUll,
	
	constraint FK_Artist_ArtistInBand foreign key (FK_Artist) references Artist (PK_Artist),
	constraint FK_Band_ArtistInBand foreign key (FK_Band) references Band (PK_Band),
	constraint PK_ArtistInBand primary key (FK_Band, FK_Artist),
)

create table Album
(
	PK_Album int UNIQUE identity(1,1) NOT NULL,
	ReleaseDate date NOT NULL,
	Name nvarchar(20) NOT NULL,
	FK_Band int NULL,
	FK_Artist int NULL,
	
	constraint PK_Album_Album primary key (PK_Album),
	constraint FK_Artist_Album foreign key (FK_Artist) references Artist (PK_Artist),
	constraint FK_Band_Album foreign key (FK_Band) references Band (PK_Band),
	constraint CH_RD_Album check (ReleaseDate<=GetDate())
)

create table MusicInAlbum
(
	FK_Music int UNIQUE NOT NULL,
	FK_Album int NOT NULL,
	
	constraint FK_Music_MusicInAlbum foreign key (FK_Music) references Music (PK_Music),
	constraint FK_Album_MusicInAlbum foreign key (FK_Album) references Album (PK_Album),
	constraint PK_MusicInAlbum primary key (FK_Music, FK_Album)
)

create table Role
(
	PK_Role int UNIQUE identity(1,1) NOT NULL,
	RoleName nchar(30) NOT NULL,
	
	constraint PK_Role_Role primary key (PK_Role)
)

create table Users
(
	PK_Users int UNIQUE identity(1,1) NOT NULL,
	Login nvarchar(20) NOT NULL,
	Pass nvarchar(20) NOT NULL,
	
	constraint PK_Users_Users primary key (PK_Users)
)

create table UserRole
(
	FK_User int NOT NULL,
	FK_Role int NOT NULL,
	
	constraint FK_Role_UserRole foreign key (FK_Role) references Role (PK_Role),
	constraint FK_User_UserRole foreign key (FK_User) references Users (PK_Users),
	
)
create table Login
(
	PK_Login int UNIQUE identity(1,1) NOT NULL,
	FK_User int NOT NULL,
	DateLogin date NULL,
	DateLogout date NULL,
	
	constraint PK_Login_Login primary key (PK_Login),
	constraint FK_Users_Login foreign key (FK_User) references Users (PK_Users),
	constraint CH_DLN_Login check (DateLogin<=GetDate()), 
	constraint CH_DLT_Login check (DateLogout<=GetDate())
)
create table Cart
(
	PK_Cart int UNIQUE identity(1,1) NOT NULL,
	FK_User int NOT NULL,
	
	constraint PK_Cart_Cart primary key (PK_Cart),
	constraint FK_Users_Cart foreign key (FK_User) references Users (PK_Users),
)
create table MusicCart
(
	FK_Cart int NOT NULL,
	FK_Music int NOT NULL,
	
	constraint FK_Cart_MusicCart foreign key (FK_Cart) references Cart (PK_Cart),
	constraint FK_Music_MusicCart foreign key (FK_Music) references Music (PK_Music),
)
create table AlbumCart
(
	FK_Cart int NOT NULL,
	FK_Album int NOT NULL,
	
	constraint FK_Cart_AlbumCart foreign key (FK_Cart) references Cart (PK_Cart),
	constraint FK_Album_AlbumCart foreign key (FK_Album) references Album (PK_Album),
)
create table BandCart
(
	FK_Cart int NOT NULL,
	FK_Band int NOT NULL,
	
	constraint FK_Cart_BandCart foreign key (FK_Cart) references Cart (PK_Cart),
	constraint FK_Band_BandCart foreign key (FK_Band) references Band (PK_Band),
)
create table Concert
(
	PK_Concert int UNIQUE identity(1,1) NOT NULL,
	FK_Band int NULL,
	City nvarchar(30) NOT NULL,
	Place nvarchar(20) NOT NULL,
	ConcertDate date NOT NULL,
	ConcertTime time(0) NOT NULL,
	Age int NULL,

	
	constraint PK_Concert_Concert primary key (PK_Concert),
	constraint FK_Band_Concert foreign key (FK_Band) references Band (PK_Band),
)

