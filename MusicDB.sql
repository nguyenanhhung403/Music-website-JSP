-- Tạo cơ sở dữ liệu MUSICDB
CREATE DATABASE MUSICDB;
GO

-- Sử dụng cơ sở dữ liệu MUSICDB
USE MUSICDB;
GO

-- Bảng quản lý người dùng
CREATE TABLE users (
    user_id INT IDENTITY(1,1) PRIMARY KEY, -- Sử dụng IDENTITY thay cho AUTO_INCREMENT
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);
GO

-- Bảng quản lý bài hát
CREATE TABLE songs (
    song_id INT IDENTITY(1,1) PRIMARY KEY, -- Sử dụng IDENTITY
    title NVARCHAR(255) NOT NULL,
    artist_id INT,
    genre NVARCHAR(100),
    file_path NVARCHAR(255) NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id) ON DELETE SET NULL
);
GO

-- Bảng quản lý playlist của người dùng
CREATE TABLE playlists (
    playlist_id INT IDENTITY(1,1) PRIMARY KEY, -- Sử dụng IDENTITY
    user_id INT,
    name NVARCHAR(255) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);
GO

-- Bảng lưu trữ bài hát trong từng playlist
CREATE TABLE playlist_songs (
    playlist_id INT,
    song_id INT,
    PRIMARY KEY (playlist_id, song_id),
    FOREIGN KEY (playlist_id) REFERENCES playlists(playlist_id) ON DELETE CASCADE,
    FOREIGN KEY (song_id) REFERENCES songs(song_id) ON DELETE CASCADE
);
GO

-- Bảng quản lý admin
CREATE TABLE admins (
    admin_id INT IDENTITY(1,1) PRIMARY KEY, -- Sử dụng IDENTITY
    username NVARCHAR(50) NOT NULL UNIQUE,
    password NVARCHAR(255) NOT NULL
);
GO

-- Bảng lưu trữ thông tin ca sĩ
CREATE TABLE artists (
    artist_id INT IDENTITY(1,1) PRIMARY KEY, -- Sử dụng IDENTITY
    name NVARCHAR(255) NOT NULL,
    bio NVARCHAR(MAX),
    genre NVARCHAR(100)
);
GO

-- Chèn dữ liệu mẫu vào bảng users
INSERT INTO users (username, email, password) VALUES
('test', 'test@test.com', '123'),
('john_doe', 'john.doe@example.com', 'P@ssw0rd1'),
('jane_smith', 'jane.smith@example.com', 'P@ssw0rd2'),
('alice_johnson', 'alice.johnson@example.com', 'P@ssw0rd3'),
('bob_brown', 'bob.brown@example.com', 'P@ssw0rd4'),
('charlie_davis', 'charlie.davis@example.com', 'P@ssw0rd5'),
('david_evans', 'david.evans@example.com', 'P@ssw0rd6'),
('emily_wilson', 'emily.wilson@example.com', 'P@ssw0rd7'),
('frank_miller', 'frank.miller@example.com', 'P@ssw0rd8'),
('grace_moore', 'grace.moore@example.com', 'P@ssw0rd9'),
('hannah_thomas', 'hannah.thomas@example.com', 'P@ssw0rd10');
GO

-- Chèn dữ liệu mẫu vào bảng artists
INSERT INTO artists (name, bio, genre) VALUES
(N'Sơn Tùng M-TP', N'Một trong những nghệ sĩ hàng đầu của V-pop với nhiều bản hit nổi tiếng như "Lạc Trôi", "Hãy Trao Cho Anh".', N'Pop, R&B'),
(N'Mỹ Tâm', N'Ca sĩ gạo cội của làng nhạc Việt Nam, nổi tiếng với nhiều bản ballad cảm xúc như "Ước Gì", "Cây Đàn Sinh Viên".', N'Pop, Ballad'),
(N'Đen Vâu', N'Rapper nổi tiếng với phong cách âm nhạc nhẹ nhàng và chất đời thường trong các bản rap như "Đưa Nhau Đi Trốn", "Bài Này Chill Phết".', N'Rap, Hip-hop'),
(N'Hoàng Thùy Linh', N'Nữ ca sĩ với phong cách âm nhạc hiện đại, kết hợp văn hóa dân gian trong các bản hit như "Để Mị Nói Cho Mà Nghe".', N'Pop, Electro-folk'),
(N'Trúc Nhân', N'Ca sĩ trẻ với phong cách trình diễn cá tính, nổi bật qua các ca khúc như "Thật Bất Ngờ".', N'Pop'),
(N'Bích Phương', N'Nữ ca sĩ nổi tiếng với các bản pop nhẹ nhàng và tình cảm như "Bùa Yêu", "Đi Đu Đưa Đi".', N'Pop, Dance'),
(N'Noo Phước Thịnh', N'Một trong những giọng ca nam được yêu thích nhất của V-pop với các bài hát như "Cause I Love You".', N'Pop, Ballad'),
(N'Tóc Tiên', N'Nữ ca sĩ có phong cách âm nhạc hiện đại và sôi động, nổi bật với các bài hit như "Ngày Mai", "Em Không Là Duy Nhất".', N'Pop, Dance'),
(N'Hà Anh Tuấn', N'Nam ca sĩ nổi tiếng với chất giọng trầm ấm và những bản ballad nhẹ nhàng như "Tháng Tư Là Lời Nói Dối Của Em".', N'Ballad, Acoustic'),
(N'Vũ Cát Tường', N'Ca sĩ kiêm nhạc sĩ với khả năng sáng tác và thể hiện nhiều thể loại nhạc từ pop đến R&B, nổi bật với "Vết Mưa".', N'Pop, R&B');
GO

-- Chèn dữ liệu mẫu vào bảng songs
INSERT INTO songs (title, artist_id, genre, file_path) VALUES
-- Sơn Tùng M-TP
(N'Lạc Trôi', 1, N'Pop, R&B', N'songs/son-tung-lac-troi.mp3'),
(N'Hãy Trao Cho Anh', 1, N'Pop, R&B', N'songs/son-tung-hay-trao-cho-anh.mp3'),

-- Mỹ Tâm
(N'Ước Gì', 2, N'Pop, Ballad', N'songs/my-tam-uoc-gi.mp3'),
(N'Cây Đàn Sinh Viên', 2, N'Pop, Ballad', N'songs/my-tam-cay-dan-sinh-vien.mp3'),

-- Đen Vâu
(N'Đưa Nhau Đi Trốn', 3, N'Rap, Hip-hop', N'songs/den-vau-dua-nhau-di-tron.mp3'),
(N'Bài Này Chill Phết', 3, N'Rap, Hip-hop', N'songs/den-vau-bai-nay-chill-phet.mp3'),

-- Hoàng Thùy Linh
(N'Để Mị Nói Cho Mà Nghe', 4, N'Pop, Electro-folk', N'songs/hoang-thuy-linh-de-mi-noi-cho-ma-nghe.mp3'),

-- Trúc Nhân
(N'Thật Bất Ngờ', 5, N'Pop', N'songs/truc-nhan-that-bat-ngo.mp3'),

-- Bích Phương
(N'Bùa Yêu', 6, N'Pop, Dance', N'songs/bich-phuong-bua-yeu.mp3'),
(N'Đi Đu Đưa Đi', 6, N'Pop, Dance', N'songs/bich-phuong-di-du-dua-di.mp3'),

-- Noo Phước Thịnh
(N'Cause I Love You', 7, N'Pop, Ballad', N'songs/noo-phuoc-thinh-cause-i-love-you.mp3'),

-- Tóc Tiên
(N'Ngày Mai', 8, N'Pop, Dance', N'songs/toc-tien-ngay-mai.mp3'),
(N'Em Không Là Duy Nhất', 8, N'Pop, Dance', N'songs/toc-tien-em-khong-la-duy-nhat.mp3'),

-- Hà Anh Tuấn
(N'Tháng Tư Là Lời Nói Dối Của Em', 9, N'Ballad, Acoustic', N'songs/ha-anh-tuan-thang-tu-la-loi-noi-doi-cua-em.mp3'),

-- Vũ Cát Tường
(N'Vết Mưa', 10, N'Pop, R&B', N'songs/vu-cat-tuong-vet-mua.mp3'),

-- Orange
(N'Người Lạ Ơi', 11, N'Remix', N'songs/orange-nguoi-la-oi.mp3'),

-- Lê Lâm Quỳnh Như
(N'Vùng Lá Me Bay', 12, N'Nhạc vàng, Nhạc trẻ', N'songs/nhu-quynh-vung-la-me-bay.mp3'),
(N'Duyên Phận', 12, N'Nhạc vàng, Nhạc trẻ', N'songs/nhu-quynh-duyen-phan.mp3');
GO
