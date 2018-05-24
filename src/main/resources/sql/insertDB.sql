--PK_Artist Fio Spec
insert into Artist values ('Hafman','Dmit', 'Ser', 'bass', '12.12.1973')
insert into Artist values ('Alo', 'Qwe', 'Er', 'baraban', '15.04.1995')
insert into Artist values ('YUO', 'Den', 'Yan','vokal', '19.01.1969')
insert into Artist values ('Каралкj', 'Алех', 'Yan','Валерьевич', '29.12.1995')

--PK_Music FK_Artist Duration Photo MusFormat
insert into Music values ('power', 240, '.mp3', 0.89)
insert into Music values ('blink', 340, '.flac', 0.68)
insert into Music values ('monk', 440, '.mp3', 0.78)
insert into Music values ('Абсолют', 240, '.flac', 0.99)
insert into Music values ('Выбирай', 250, '.flac', 0.77)

--FK_Artist FK_Music WhoIs
insert into SongArtist values (3, 1, 'солист')
insert into SongArtist values (1, 2, 'солист')
insert into SongArtist values (2, 3, 'барабан')

--PK_Genre Name
insert into Genre values ('rock')
insert into Genre values ('rap')
insert into Genre values ('hip-hop')

--PK_Band FK_Genre DateOfFoundation Name DateOfClose
insert into Band values ('20.10.1997', 'Элизиум', 'Российская рок-группа из Нижнего Новгорода, основанная её бас-гитаристом и лидером Дмитрием Кузнецовым в 1995 году. За историю существования группы, в её составе сменилось множество участников; помимо её лидера Дмитрия Кузнецова, наиболее старым из них, остающимся в группе до сих пор, является вокалист Александр Телехов. В настоящее в составе «Элизиума» также играет виолончелист и клавишник Егор Баранов, барабанщик Максим Бурмаков и трубач Тимофей Осетров. Гитаристом «Элизиума» с 2004 по 2015 год был Кирилл Крылов; в данный момент его место занимает Александр Легасов.', '20.10.1999')
insert into Band values ('11.09.2001', 'Skillet', 'Американская христианская рок-группа из города Мемфис, штат Теннесси, основанная в 1996 году. На данный момент группой выпущено девять студийных альбомов, один EP и два концертных альбома.', null)
insert into Band values ('21.01.2000', 'TDG', 'Канадская рок-группа, исполняющая альтернативный метал и постгранж. Была сформирована под названием Groundswell в Норвуде, Онтарио, Канада в 1992 году. В 1997 году коллектив в составе гитариста и вокалиста Адама Гонтье, барабанщика Нила Сандерсона и басиста Брэда Уолста сменил название на нынешнее.', null)
insert into Band values ('21.06.2008', 'NizKiz', 'Белорусская рок-группа, исполняющая песни на русском и белорусском языках. Создана в 2008 году в Могилёве. Первая белорусская группа, издавшая альбом в цифровом формате 3plet', null)
insert into Band values ('15.03.1988', 'Bi-2', 'Альтернативная рок-группа, образованная в 1988 году в Бобруйске (Беларусь). Основатели и бессменные участники: Шура Би-2 и Лёва Би-2. В состав команды также входят: Андрей Звонков, Макс Лакмус, Борис Лифшиц и Ян Николенко. В данный момент Би-2 завершили работу над десятым студийным альбомом «Горизонт событий».', null)
insert into Band values ('13.02.1999', 'Eminem', 'Американский рэпер, музыкальный продюсер, композитор и актёр. Помимо сольной карьеры, Маршалл также состоит в группе D12 и хип-хоп-дуэте Bad Meets Evil. Эминем является одним из самых продаваемых музыкальных артистов в мире, а также самым продаваемым артистом 2000-х. Он назван одним из самых великих музыкантов всех времён многими журналами, включая Rolling Stone, который разместил Эминема под 83-м номером в списке 100 самых великих артистов. Этот же журнал провозгласил его Королём хип-хопа. Если считать и студийные работы его групп, то у Эминема имеется 10 альбомов, которые достигали первой строчки в Billboard 200. Как сольный артист, Эминем продал более 100 миллионов альбомов по всему миру.', null)

--PK_GenreGr FK_Genre
insert into GenreGr values (1, 1)
insert into GenreGr values (2, 2)
insert into GenreGr values (3, 3)
insert into GenreGr values (4, 1)
insert into GenreGr values (5, 1)
insert into GenreGr values (6, 2)

--PK_ArtistInBand FK_Artist	FK_Band DateIn DateOut
insert into ArtistInBand values (1, 2, '20.10.1997', '20.10.1999')
insert into ArtistInBand values (2, 2, '11.09.2001', null)
insert into ArtistInBand values (3, 3, '20.10.2000', null)
insert into ArtistInBand values (4, 4, '21.06.2008', null)

--PK_Role RoleName
insert into Role values ('admin')
insert into Role values ('user')

--PK_Album ReleaseDate Name FK_Band FK_Artist
insert into Album values ('11.11.2009', 'popal', 2, null)
insert into Album values ('23.04.2010', 'qwe', 2, null)
insert into Album values ('23.05.2011', 'asd', 3, null)
insert into Album values ('23.03.2017', 'Синоптик', 4, null)
insert into Album values ('16.07.2015', 'Лiрика', 4, null)

--FK_Music FK_Album
insert into MusicInAlbum values (2, 1)
insert into MusicInAlbum values (3, 2)
insert into MusicInAlbum values (1, 3)
insert into MusicInAlbum values (4, 4)
insert into MusicInAlbum values (5, 4)

--PK_Users FK_Role Login Pass
insert into Users values ('admin', 'admin')
insert into Users values ('user', 'user')
--user role
insert into UserRole values(1,1)
insert into UserRole values(2,2)

--PK_Login FK_Users	DateLogin DateLogout
insert into Login values (1, '11.11.2000', '12.12.2000')
insert into Login values (2, '11.10.2000', '12.11.2000')

--PK_Cart FK_login
insert into Cart values (3)
insert into Cart values (4)

--PK_MusicCart FK_Music 
insert into MusicCart values (3, 1)
insert into MusicCart values (2, 2)
insert into MusicCart values (1, 3)

--PK_AlbumCart FK_Album
insert into AlbumCart values (3, 2)
insert into AlbumCart values (2, 1)
insert into AlbumCart values (1, 2)

--FK_Cart FK_Band
insert into BandCart values (1, 2)
insert into BandCart values (1, 1)
insert into BandCart values (1, 3)

--FK_Band City
insert into Concert values (2, 'Витебск', 'Битлс клуб', '28.06.2018', '20:00', 16)
insert into Concert values (2, 'Минск', 'Republic club', '29.06.2018', '21:00', 16)
insert into Concert values (4, 'Витебск', 'Битлс клуб', '27.06.2018', '22:00', 12)