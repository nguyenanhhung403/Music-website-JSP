<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.Song" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Edit Song</title>
    <link rel="stylesheet" href="Styles/admin.css">
</head>

<body>

    <!-- Header -->
    <header>
        <h1>Edit Song</h1>
        <nav>
            <ul>
                <li><a href="manageSongs.jsp">Back to Song Management</a></li>
            </ul>
        </nav>
    </header>

    <!-- Main Content -->
    <div class="admin-container">
        <div class="admin-content">
            <% 
                Song song = (Song) request.getAttribute("song");
                if (song == null) {
            %>
                <p>Song not found.</p>
            <%
                } else {
            %>
            
            <!-- Display Song Title -->
            <h2>Editing: <%= song.getTitle() %></h2>

            <!-- Edit Song Form -->
            <form action="songManagement?action=update" method="post" enctype="multipart/form-data" class="form-container">
                <!-- Hidden field to pass the song ID -->
                <input type="hidden" name="songId" value="<%= song.getSongId() %>">

                <div class="form-group">
                    <label for="title">Title:</label>
                    <input type="text" id="title" name="title" value="<%= song.getTitle() %>" required>
                </div>

                <div class="form-group">
                    <label for="artist">Artist ID:</label>
                    <input type="text" id="artist" name="artistId" value="<%= song.getArtistId() %>" required>
                </div>

                <div class="form-group">
                    <label for="genre">Genre:</label>
                    <select id="genre" name="genre" required>
                        <option value="Nhạc trẻ" <%= "Nhạc trẻ".equals(song.getGenre()) ? "selected" : "" %>>Nhạc trẻ</option>
                        <option value="Bolero" <%= "Bolero".equals(song.getGenre()) ? "selected" : "" %>>Bolero</option>
                        <option value="Rap" <%= "Rap".equals(song.getGenre()) ? "selected" : "" %>>Rap</option>
                        <option value="Remix" <%= "Remix".equals(song.getGenre()) ? "selected" : "" %>>Remix</option>
                        <option value="Latin" <%= "Latin".equals(song.getGenre()) ? "selected" : "" %>>Latin</option>
                        <option value="Aucoustic" <%= "Aucoustic".equals(song.getGenre()) ? "selected" : "" %>>Aucoustic</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="filePath">MP3 File:</label>
                    <input type="file" id="filePath" name="filePath" accept=".mp3">
                    <p>Current file: <%= song.getFilePath() %></p>
                </div>

                <button type="submit" class="submit-button">Update Song</button>
            </form>

            <%
                }
            %>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <p>Bản quyền © 2024 Jingmp3. Mọi quyền được bảo lưu.</p>
    </footer>
</body>
</html>
