USE [master]
GO
/****** Object:  Database [MUSICDB]    Script Date: 10/29/2024 10:14:30 AM ******/
CREATE DATABASE [MUSICDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MUSICDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\MUSICDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MUSICDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\MUSICDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [MUSICDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MUSICDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MUSICDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MUSICDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MUSICDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MUSICDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MUSICDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [MUSICDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [MUSICDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MUSICDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MUSICDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MUSICDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MUSICDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MUSICDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MUSICDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MUSICDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MUSICDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MUSICDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MUSICDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MUSICDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MUSICDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MUSICDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MUSICDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MUSICDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MUSICDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MUSICDB] SET  MULTI_USER 
GO
ALTER DATABASE [MUSICDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MUSICDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MUSICDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MUSICDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MUSICDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MUSICDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [MUSICDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [MUSICDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [MUSICDB]
GO
/****** Object:  Table [dbo].[admins]    Script Date: 10/29/2024 10:14:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admins](
	[admin_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[admin_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[artists]    Script Date: 10/29/2024 10:14:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[artists](
	[artist_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[bio] [nvarchar](max) NULL,
	[genre] [nvarchar](100) NULL,
	[filePath] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[artist_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[playlist_songs]    Script Date: 10/29/2024 10:14:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[playlist_songs](
	[playlist_id] [int] NOT NULL,
	[song_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[playlist_id] ASC,
	[song_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[playlists]    Script Date: 10/29/2024 10:14:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[playlists](
	[playlist_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[playlist_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[songs]    Script Date: 10/29/2024 10:14:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[songs](
	[song_id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](255) NULL,
	[artist_id] [int] NULL,
	[genre] [nvarchar](100) NULL,
	[file_path] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[song_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 10/29/2024 10:14:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[password] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[artists] ON 

INSERT [dbo].[artists] ([artist_id], [name], [bio], [genre], [filePath]) VALUES (21, N'Sơn Tùng M-TP', N'Một trong những nghệ sĩ hàng đầu của V-pop với nhiều bản hit nổi tiếng như "Lạc Trôi", "Hãy Trao Cho Anh".', N'Pop, R&B', N'images/avatars/sontung.jpg')
INSERT [dbo].[artists] ([artist_id], [name], [bio], [genre], [filePath]) VALUES (22, N'Mỹ Tâm', N'Ca sĩ gạo cội của làng nhạc Việt Nam, nổi tiếng với nhiều bản ballad cảm xúc như "Ước Gì", "Cây Đàn Sinh Viên".', N'Pop, Ballad', N'images/avatars/mytam.jpg')
INSERT [dbo].[artists] ([artist_id], [name], [bio], [genre], [filePath]) VALUES (23, N'Đen Vâu', N'Rapper nổi tiếng với phong cách âm nhạc nhẹ nhàng và chất đời thường trong các bản rap như "Đưa Nhau Đi Trốn", "Bài Này Chill Phết".', N'Rap, Hip-hop', N'images/avatars/denvau.jpg')
INSERT [dbo].[artists] ([artist_id], [name], [bio], [genre], [filePath]) VALUES (24, N'Hoàng Thùy Linh', N'Nữ ca sĩ với phong cách âm nhạc hiện đại, kết hợp văn hóa dân gian trong các bản hit như "Để Mị Nói Cho Mà Nghe".', N'Pop, Electro-folk', N'images/avatars/hoangthuylinh.jpg')
INSERT [dbo].[artists] ([artist_id], [name], [bio], [genre], [filePath]) VALUES (25, N'Trúc Nhân', N'Ca sĩ trẻ với phong cách trình diễn cá tính, nổi bật qua các ca khúc như "Thật Bất Ngờ".', N'Pop', N'images/avatars/trucnhan.jpg')
INSERT [dbo].[artists] ([artist_id], [name], [bio], [genre], [filePath]) VALUES (26, N'Bích Phương', N'Nữ ca sĩ nổi tiếng với các bản pop nhẹ nhàng và tình cảm như "Bùa Yêu", "Đi Đu Đưa Đi".', N'Pop, Dance', N'images/avatars/bichphuong.jpg')
INSERT [dbo].[artists] ([artist_id], [name], [bio], [genre], [filePath]) VALUES (27, N'Noo Phước Thịnh', N'Một trong những giọng ca nam được yêu thích nhất của V-pop với các bài hát như "Cause I Love You".', N'Pop, Ballad', N'images/avatars/noo.jpg')
INSERT [dbo].[artists] ([artist_id], [name], [bio], [genre], [filePath]) VALUES (28, N'Tóc Tiên', N'Nữ ca sĩ có phong cách âm nhạc hiện đại và sôi động, nổi bật với các bài hit như "Ngày Mai", "Em Không Là Duy Nhất".', N'Pop, Dance', N'images/avatars/toctien.jpg')
INSERT [dbo].[artists] ([artist_id], [name], [bio], [genre], [filePath]) VALUES (29, N'Hà Anh Tuấn', N'Nam ca sĩ nổi tiếng với chất giọng trầm ấm và những bản ballad nhẹ nhàng như "Tháng Tư Là Lời Nói Dối Của Em".', N'Ballad, Acoustic', N'images/avatars/haanhtuan.jpg')
INSERT [dbo].[artists] ([artist_id], [name], [bio], [genre], [filePath]) VALUES (31, N'Vũ Cát Tường', N'Ca sĩ kiêm nhạc sĩ với khả năng sáng tác và thể hiện nhiều thể loại nhạc từ pop đến R&B, nổi bật với "Vết Mưa".', N'Pop, R&B', N'images/avatars/vucatuong.jpg')
INSERT [dbo].[artists] ([artist_id], [name], [bio], [genre], [filePath]) VALUES (33, N'Orange ', N'Tên tuổi của Orange chỉ thực sự biết đến khi cô hợp tác với Karik để cho ra mắt ca khúc "Người lạ ơi" vào ngày 6 tháng 1 năm 2018. Ca khúc nhanh chóng trở thành một hiện tượng, đạt kỷ lục 50 triệu lượt views trong 13 ngày, 100 triệu lượt xem trong 38 ngày', N'remix', N'images/avatars/orange.jpg')
INSERT [dbo].[artists] ([artist_id], [name], [bio], [genre], [filePath]) VALUES (34, N'Lê Lâm Quỳnh Như', N'Những ca khúc do Như Quỳnh thể hiện đều được rất nhiều người yêu thích. Điển hình nhất là hai bài hát Vùng lá me bay và Duyên phận mà Như Quỳnh từng thể hiện vào năm 2010 đã trở thành một hiện tượng vào những năm 2016 - 2017, khi dòng nhạc Bolero bùng nổ mạnh mẽ tại Việt Nam. ', N'Nhạc vàng ,Nhạc trẻ', N'images/avatars/lelamquynhnhu.jpg')
INSERT [dbo].[artists] ([artist_id], [name], [bio], [genre], [filePath]) VALUES (35, N'Bruno Mars', N'Bruno Mars có tên khai sinh là Peter Gene Hernández, anh được sinh ra vào ngày 8 tháng 10 năm 1985 tại Honolulu, Hawaii và được lớn lên tại Waikiki, vùng bờ biển của Honolulu.Mars sống trong một gia đình có sáu người con và theo nghề âm nhạc, chính bởi vậy nên anh đã sớm được tiếp xúc với các thể loại nhạc như reggae, rock, hip hop, và R&B.', N'Latin', N'images/avatars/mars.jpg')
INSERT [dbo].[artists] ([artist_id], [name], [bio], [genre], [filePath]) VALUES (36, N'Jeremy Zucker ', N'Jeremy Scott Zucker (sinh ngày 3 tháng 3 năm 1996) là một ca sĩ và nhạc sĩ người Hoa Kỳ, nổi tiếng với các bài hát "Comethru" (2018), "All the Kids Are Depressed" (2018) và "You Were Good to Me" (2019). Kể từ lần đầu tiên bắt đầu xuất bản âm nhạc vào năm 2015,', N'Latin', N'images/avatars/jeremy.jpg')
INSERT [dbo].[artists] ([artist_id], [name], [bio], [genre], [filePath]) VALUES (37, N'Kendrick Lamar', N'Kendrick Lamar là một rapper người Mỹ đến từ Compton, California. Anh nổi tiếng với khả năng kể chuyện và lời rap sâu sắc về các vấn đề xã hội như phân biệt chủng tộc và bất công. ', N'Hip-Hop', N'images/avatars/lamar.jpg')
INSERT [dbo].[artists] ([artist_id], [name], [bio], [genre], [filePath]) VALUES (38, N'Drake', N'Drake, tên thật là Aubrey Drake Graham, là một rapper và ca sĩ người Canada. Bắt đầu nổi tiếng từ vai diễn trong Degrassi: The Next Generation, Drake chuyển sang âm nhạc và trở thành một trong những nghệ sĩ bán chạy nhất thế giới.', N'Hip-Hop', N'images/avatars/drake.jpg')
INSERT [dbo].[artists] ([artist_id], [name], [bio], [genre], [filePath]) VALUES (39, N' Hoàng Dũng', N'Hoàng Dũng là một ca sĩ và nhạc sĩ trẻ nổi tiếng với các ca khúc nhẹ nhàng và sâu lắng. Anh được biết đến qua những bản acoustic như Nàng Thơ, Yếu Đuối, và Chẳng Nói Nên Lời, gây ấn tượng với giọng hát ấm áp và phong cách âm nhạc đầy cảm xúc.', N'Acoustic', N'images/avatars/hoangdung.jpg')
INSERT [dbo].[artists] ([artist_id], [name], [bio], [genre], [filePath]) VALUES (40, N'Vũ', N'Tiểu sử: Vũ, tên thật là Thái Vũ, được mệnh danh là "hoàng tử indie" của Việt Nam với các ca khúc acoustic đầy chất thơ và tự sự. Các bài hát như Lạ Lùng, Đông Kiếm Em, và Hành Tinh Song Song đã giúp anh xây dựng lượng fan đông đảo, với phong cách hát mộc mạc và gần gũi.', N'Acoustic', N'images/avatars/vu.jpg')
INSERT [dbo].[artists] ([artist_id], [name], [bio], [genre], [filePath]) VALUES (41, N'Phan Mạnh Quỳnh', N'Phan Mạnh Quỳnh là một ca sĩ kiêm nhạc sĩ nổi tiếng, có phong cách acoustic độc đáo. Các ca khúc như Vợ Người Ta, Có Chàng Trai Viết Lên Cây, và Nước Ngoài mang phong cách dân dã, chân thực, và giai điệu dễ đi vào lòng người, giúp anh ghi dấu ấn trong làng nhạc Việt.', N'Acoustic', N'images/avatars/phanmanhquynh.jpg')
INSERT [dbo].[artists] ([artist_id], [name], [bio], [genre], [filePath]) VALUES (42, N'AlanWarker', N'DJ trẻ tài năng.', N'EDM', N'images/avatars/alanwalker.jpg')
INSERT [dbo].[artists] ([artist_id], [name], [bio], [genre], [filePath]) VALUES (45, N'Alesso', N'Anh được xếp hạng thứ 12 trong danh sách 100 DJ hàng đầu năm 2015 của Tạp chí DJ và thứ 20 vào năm 2016 trên Tạp chí DJ trong danh sách 100 DJ hàng đầu thế giới.', N'EDM', N'images/avatars/jjoz.jpg')
SET IDENTITY_INSERT [dbo].[artists] OFF
GO
INSERT [dbo].[playlist_songs] ([playlist_id], [song_id]) VALUES (6, 58)
INSERT [dbo].[playlist_songs] ([playlist_id], [song_id]) VALUES (6, 63)
INSERT [dbo].[playlist_songs] ([playlist_id], [song_id]) VALUES (6, 70)
INSERT [dbo].[playlist_songs] ([playlist_id], [song_id]) VALUES (6, 74)
INSERT [dbo].[playlist_songs] ([playlist_id], [song_id]) VALUES (7, 69)
INSERT [dbo].[playlist_songs] ([playlist_id], [song_id]) VALUES (7, 81)
INSERT [dbo].[playlist_songs] ([playlist_id], [song_id]) VALUES (9, 90)
INSERT [dbo].[playlist_songs] ([playlist_id], [song_id]) VALUES (9, 91)
GO
SET IDENTITY_INSERT [dbo].[playlists] ON 

INSERT [dbo].[playlists] ([playlist_id], [user_id], [name]) VALUES (6, NULL, N'test')
INSERT [dbo].[playlists] ([playlist_id], [user_id], [name]) VALUES (7, NULL, N'test2')
INSERT [dbo].[playlists] ([playlist_id], [user_id], [name]) VALUES (9, NULL, N'Nhạc hay ho')
SET IDENTITY_INSERT [dbo].[playlists] OFF
GO
SET IDENTITY_INSERT [dbo].[songs] ON 

INSERT [dbo].[songs] ([song_id], [title], [artist_id], [genre], [file_path]) VALUES (57, N'Lạc Trôi', 21, N'Nhạc trẻ', N'songs/son-tung-lac-troi.mp3')
INSERT [dbo].[songs] ([song_id], [title], [artist_id], [genre], [file_path]) VALUES (58, N'Hãy Trao Cho Anh', 21, N'Nhạc trẻ', N'songs/son-tung-hay-trao-cho-anh.mp3')
INSERT [dbo].[songs] ([song_id], [title], [artist_id], [genre], [file_path]) VALUES (59, N'Ước Gì', 22, N'Bolero', N'songs/my-tam-uoc-gi.mp3')
INSERT [dbo].[songs] ([song_id], [title], [artist_id], [genre], [file_path]) VALUES (60, N'Cây Đàn Sinh Viên', 22, N'Bolero', N'songs/my-tam-cay-dan-sinh-vien.mp3')
INSERT [dbo].[songs] ([song_id], [title], [artist_id], [genre], [file_path]) VALUES (61, N'Đưa Nhau Đi Trốn', 23, N'Rap', N'songs/den-vau-dua-nhau-di-tron.mp3')
INSERT [dbo].[songs] ([song_id], [title], [artist_id], [genre], [file_path]) VALUES (62, N'Bài Này Chill Phết', 23, N'Rap', N'songs/den-vau-bai-nay-chill-phet.mp3')
INSERT [dbo].[songs] ([song_id], [title], [artist_id], [genre], [file_path]) VALUES (63, N'Để Mị Nói Cho Mà Nghe', 24, N'Nhạc trẻ', N'songs/hoang-thuy-linh-de-mi-noi-cho-ma-nghe.mp3')
INSERT [dbo].[songs] ([song_id], [title], [artist_id], [genre], [file_path]) VALUES (64, N'Thật Bất Ngờ', 25, N'Nhạc trẻ', N'songs/truc-nhan-that-bat-ngo.mp3')
INSERT [dbo].[songs] ([song_id], [title], [artist_id], [genre], [file_path]) VALUES (65, N'Bùa Yêu', 26, N'Nhạc trẻ', N'songs/bich-phuong-bua-yeu.mp3')
INSERT [dbo].[songs] ([song_id], [title], [artist_id], [genre], [file_path]) VALUES (66, N'Đi Đu Đưa Đi', 26, N'Nhạc trẻ', N'songs/bich-phuong-di-du-dua-di.mp3')
INSERT [dbo].[songs] ([song_id], [title], [artist_id], [genre], [file_path]) VALUES (67, N'Cause I Love You', 27, N'Nhạc trẻ', N'songs/noo-phuoc-thinh-cause-i-love-you.mp3')
INSERT [dbo].[songs] ([song_id], [title], [artist_id], [genre], [file_path]) VALUES (68, N'Ngày Mai', 28, N'Nhạc trẻ', N'songs/toc-tien-ngay-mai.mp3')
INSERT [dbo].[songs] ([song_id], [title], [artist_id], [genre], [file_path]) VALUES (69, N'Em Không Là Duy Nhất', 28, N'Nhạc trẻ', N'songs/toc-tien-em-khong-la-duy-nhat.mp3')
INSERT [dbo].[songs] ([song_id], [title], [artist_id], [genre], [file_path]) VALUES (70, N'Tháng Tư Là Lời Nói Dối Của Em', 29, N'Nhạc trẻ', N'songs/ha-anh-tuan-thang-tu-la-loi-noi-doi-cua-em.mp3')
INSERT [dbo].[songs] ([song_id], [title], [artist_id], [genre], [file_path]) VALUES (71, N'Vết Mưa', 31, N'Nhạc trẻ', N'songs/vu-cat-tuong-vet-mua.mp3')
INSERT [dbo].[songs] ([song_id], [title], [artist_id], [genre], [file_path]) VALUES (72, N'Người Lạ Ơi', 33, N'Remix', N'songs/orange-nguoi-la-oi.mp3')
INSERT [dbo].[songs] ([song_id], [title], [artist_id], [genre], [file_path]) VALUES (73, N'Vùng Lá Me Bay', 34, N'Bolero', N'songs/nhu-quynh-vung-la-me-bay.mp3')
INSERT [dbo].[songs] ([song_id], [title], [artist_id], [genre], [file_path]) VALUES (74, N'Duyên Phận', 34, N'Bolero', N'songs/nhu-quynh-duyen-phan.mp3')
INSERT [dbo].[songs] ([song_id], [title], [artist_id], [genre], [file_path]) VALUES (81, N'Lối Nhỏ', 23, N'Rap', N'songs/loi-nho-den-vau.mp3')
INSERT [dbo].[songs] ([song_id], [title], [artist_id], [genre], [file_path]) VALUES (84, N'Die With A Smile', 35, N'Latin', N'songs/die-with-smile.mp3')
INSERT [dbo].[songs] ([song_id], [title], [artist_id], [genre], [file_path]) VALUES (85, N'comethru ', 36, N'Latin', N'songs/Jereme-Zucker-comehru.mp3')
INSERT [dbo].[songs] ([song_id], [title], [artist_id], [genre], [file_path]) VALUES (86, N'HotLine Bling', 38, N'Hip-Hop', N'songs/HotlineBling.mp3')
INSERT [dbo].[songs] ([song_id], [title], [artist_id], [genre], [file_path]) VALUES (87, N'HUMBLE', 37, N'Hip-Hop', N'songs/HUMBLE.mp3')
INSERT [dbo].[songs] ([song_id], [title], [artist_id], [genre], [file_path]) VALUES (89, N'Sau lời từ khước', 41, N'Acoustic', N'songs/sau-loi-tu-khuoc.mp3')
INSERT [dbo].[songs] ([song_id], [title], [artist_id], [genre], [file_path]) VALUES (90, N'Bảo tàng của sự nối tiếc', 40, N'Acoustic', N'songs/Bao-Tang-Cua-Nuoi-tiec.mp3')
INSERT [dbo].[songs] ([song_id], [title], [artist_id], [genre], [file_path]) VALUES (91, N'Faded', 42, N'EDM', N'songs/Faded.mp3')
INSERT [dbo].[songs] ([song_id], [title], [artist_id], [genre], [file_path]) VALUES (92, N'Muộn rồi mà sao còn', 21, N'Acoustic', N'songs/muon-roi-ma-sao-con.mp3')
SET IDENTITY_INSERT [dbo].[songs] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([user_id], [username], [email], [password]) VALUES (1, N'test', N'test@test.com', N'123')
INSERT [dbo].[users] ([user_id], [username], [email], [password]) VALUES (2, N'john_doe', N'john.doe@example.com', N'P@ssw0rd1')
INSERT [dbo].[users] ([user_id], [username], [email], [password]) VALUES (3, N'jane_smith', N'jane.smith@example.com', N'P@ssw0rd2')
INSERT [dbo].[users] ([user_id], [username], [email], [password]) VALUES (4, N'alice_johnson', N'alice.johnson@example.com', N'P@ssw0rd3')
INSERT [dbo].[users] ([user_id], [username], [email], [password]) VALUES (5, N'bob_brown', N'bob.brown@example.com', N'P@ssw0rd4')
INSERT [dbo].[users] ([user_id], [username], [email], [password]) VALUES (6, N'charlie_davis', N'charlie.davis@example.com', N'P@ssw0rd5')
INSERT [dbo].[users] ([user_id], [username], [email], [password]) VALUES (8, N'emily_wilson', N'emily.wilson@example.com', N'P@ssw0rd7')
INSERT [dbo].[users] ([user_id], [username], [email], [password]) VALUES (9, N'frank_miller', N'frank.miller@example.com', N'P@ssw0rd8')
INSERT [dbo].[users] ([user_id], [username], [email], [password]) VALUES (10, N'grace_moore', N'grace.moore@example.com', N'P@ssw0rd9')
INSERT [dbo].[users] ([user_id], [username], [email], [password]) VALUES (11, N'hannah_thomas', N'hannah.thomas@example.com', N'P@ssw0rd10')
INSERT [dbo].[users] ([user_id], [username], [email], [password]) VALUES (12, N'test2', N'test2@gmail.com', N'123321')
INSERT [dbo].[users] ([user_id], [username], [email], [password]) VALUES (13, N'mrBean', N'MrBean@gmail.com', N'123321')
INSERT [dbo].[users] ([user_id], [username], [email], [password]) VALUES (14, N'test3', N'ahihi333@gmailcom', N'321')
INSERT [dbo].[users] ([user_id], [username], [email], [password]) VALUES (16, N'tes7', N'test5@gmail.com', N'123321')
INSERT [dbo].[users] ([user_id], [username], [email], [password]) VALUES (17, N'test8', N'hungnase180159@fpt.edu.vn', N'321321')
INSERT [dbo].[users] ([user_id], [username], [email], [password]) VALUES (18, N'teddy', N'teddy@gmail.com', N'123123')
SET IDENTITY_INSERT [dbo].[users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__admins__F3DBC57269AC13BA]    Script Date: 10/29/2024 10:14:31 AM ******/
ALTER TABLE [dbo].[admins] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__users__AB6E616462DB371E]    Script Date: 10/29/2024 10:14:31 AM ******/
ALTER TABLE [dbo].[users] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__users__F3DBC5725626B997]    Script Date: 10/29/2024 10:14:31 AM ******/
ALTER TABLE [dbo].[users] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[playlist_songs]  WITH CHECK ADD FOREIGN KEY([playlist_id])
REFERENCES [dbo].[playlists] ([playlist_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[playlist_songs]  WITH CHECK ADD FOREIGN KEY([song_id])
REFERENCES [dbo].[songs] ([song_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[playlists]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[songs]  WITH CHECK ADD FOREIGN KEY([artist_id])
REFERENCES [dbo].[artists] ([artist_id])
ON DELETE SET NULL
GO
USE [master]
GO
ALTER DATABASE [MUSICDB] SET  READ_WRITE 
GO
