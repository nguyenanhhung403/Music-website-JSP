<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Song" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Manage Songs</title>
        <link rel="stylesheet" href="Styles/admin.css">
    </head>

    <body>

        <!-- Header -->
        <header>
            <h1>Trang quản lý bài hát</h1>
            <nav>
                <ul>
                    <li><a href="admin.jsp">Trở về trang quản trị</a></li>
                </ul>
            </nav>
        </header>

        <!-- Main Content -->
        <div class="admin-container">
            <div class="admin-content">
                <h2>Danh sách bài hát</h2>

                <!-- Song List Table -->
                <table class="song-table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Title</th>
                            <th>Artist ID</th>
                            <th>File Path</th>
                            <th>Genre</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<Song> songs = (List<Song>) request.getAttribute("songs");
                            if (songs != null && !songs.isEmpty()) {
                                for (Song song : songs) {
                        %>
                        <tr>
                            <td><%= song.getSongId()%></td>
                            <td><%= song.getTitle()%></td>
                            <td><%= song.getArtistId()%></td>
                            <td><%= song.getFilePath()%></td>
                            <td><%= song.getGenre()%></td>
                            <td>
                                <a href="songManagement?action=edit&songId=<%= song.getSongId()%>" class="edit-link">Edit</a>

                                |
                                <a href="songManagement?action=delete&songId=<%= song.getSongId()%>" 
                                   class="delete-link" 
                                   onclick="return confirm('Are you sure you want to delete this song?');">Delete</a>
                            </td>
                        </tr>
                        <%
                            }
                        } else {
                        %>
                        <tr>
                            <td colspan="6">No songs found.</td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>

                <hr>

                <!-- Add New Song Form -->
                <h2>Thêm bài hát mới</h2>
                <form action="songManagement?action=add" method="post" enctype="multipart/form-data" class="form-container">
                    <div class="form-group">
                        <label for="title">Tên bài hát:</label>
                        <input type="text" id="title" name="title" placeholder="Nhập tên bài hát" required>
                    </div>

                    <div class="form-group">
                        <label for="artist">Nghệ sĩ:</label>
                        <input type="text" id="artist" name="artist" placeholder="artist ID" required>
                        
                    </div>

                    <div class="form-group">
                        <label for="genre">Thể loại:</label>
                        <select id="genre" name="genre" required>
                            <option value="" disabled selected>Chọn thể loại</option>
                            <option value="Nhạc trẻ">Nhạc trẻ</option>
                            <option value="Bolero">Bolero</option>
                            <option value="Rap">Rap</option>
                            <option value="Remix">Remix</option>
                            <option value="Hip-Hop">Hip-Hop</option>
                            <option value="Latin">Latin</option>
                            <option value="Acoustic">Acoustic</option>
                            <option value="EDM">EDM</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="filePath">Tệp MP3:</label>
                        <input type="file" id="filePath" name="filePath" accept=".mp3" required>
                    </div>

                    <button type="submit" class="submit-button">Thêm bài hát</button>
                </form>

                <!-- Footer -->
                <footer>
                    <p>Bản quyền © 2024 Jingmp3. Mọi quyền được bảo lưu.</p>
                </footer>
                </body>
      </html>
