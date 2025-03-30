<%@ page import="java.util.List" %>
<%@ page import="model.Artist" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Manage Artists</title>
        <link rel="stylesheet" href="Styles/admin.css">
    </head>
    <body>

        <!-- Header -->
        <header>
            <h1>Trang quản lý nghệ sĩ</h1>
            <nav>
                <ul>
                    <li><a href="admin.jsp">Trở về trang quản trị</a></li>
                </ul>
            </nav>
        </header>

        <!-- Main Content -->
        <div class="admin-container">
            <div class="admin-content">
                <h2>Danh sách nghệ sĩ</h2>

                <!-- Artist List Table -->
                <table class="artist-table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Bio</th>
                            <th>Genre</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<Artist> artists = (List<Artist>) request.getAttribute("artist");
                            if (artists != null && !artists.isEmpty()) {
                                for (Artist artist : artists) {
                        %>
                        <tr>
                            <td><%= artist.getArtistId()%></td>
                            <td><%= artist.getName()%></td>
                            <td><%= artist.getBio()%></td>
                            <td><%= artist.getGenre()%></td>
                            <td>
                                <a href="artistManagement?action=edit&artistId=<%= artist.getArtistId()%>" class="edit-link">Edit</a> |
                                <a href="artistManagement?action=delete&artistId=<%= artist.getArtistId()%>" class="delete-link" 
                                   onclick="return confirm('Are you sure you want to delete this artist?');">Delete</a>
                            </td>
                        </tr>
                        <%
                            }
                        } else {
                        %>
                        <tr>
                            <td colspan="5">No artists found.</td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>

                <hr>

                <!-- Add New Artist Form -->
                <h2>Thêm nghệ sĩ mới</h2>
                <form action="artistManagement?action=insert" method="post"  enctype="multipart/form-data" class="form-container">
                    <div class="form-group">
                        <label for="name">Name:</label>
                        <input type="text" id="name" name="name" required>
                    </div>
                    <div class="form-group">
                        <label for="bio">Bio:</label>
                        <textarea id="bio" name="bio" required></textarea>
                    </div>
                    <div class="form-group">
                        <label for="genre">Genre:</label>
                        <select id="genre" name="genre" required>
                            <option value="Nhạc trẻ">Nhạc trẻ</option>
                            <option value="Bolero">Bolero</option>
                            <option value="Rap">Rap</option>
                            <option value="Remix">Remix</option>
                            <option value="Latin">Latin</option>
                            <option value="Hip-Hop">Hip-Hop</option>
                            <option value="Acoustic">Acoustic</option>
                            <option value="EDM">EDM</option>


                        </select>

                        <div class="form-group">
                            <label for="avatar" class="block font-semibold mb-2">Avatar:</label>
                            <input type="file" id="avatar" name="avatar" accept="image/jpeg" class="w-full p-2 rounded bg-[#333] text-[#EFEEE0]">
                        </div>
                    </div>
                    <button type="submit" class="submit-button">Add Artist</button>
                </form>

            </div>
        </div>

        <!-- Footer -->
        <footer>
            <p>Bản quyền © 2024 Jingmp3. Mọi quyền được bảo lưu.</p>
        </footer>
    </body>
</html>
