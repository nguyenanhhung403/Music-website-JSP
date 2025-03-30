<%@page import="model.Song"%>
<%@page import="dao.SongDAO"%>
<%@page import="model.Playlist"%>
<%@page import="java.util.List"%>
<%@page import="dao.PlaylistDAO"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Create Playlist</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        
        .audio-player {
            width: 500px; 
        }
    </style>
</head>
<body class="bg-[#292929]">
    <div class="container mx-auto">
        <div class="flex items-start">
            <!-- Sidebar -->
            <div class="w-[280px]">
                <%@include file="/partials/sider.jsp" %>
            </div>
            
            <!-- Main Content -->
            <div class="ml-[20px] flex-1 text-white">
                <h2 class="text-[24px] font-[700] text-[#EFEEE0] mb-[20px]">Create a New Playlist</h2>
                
                <!-- Create New Playlist Form -->
                <form action="playlist?action=create" method="post" class="mb-[30px] bg-[#212121] p-[20px] rounded-[15px]">
                    <label for="name" class="text-[16px] font-[500]">Playlist Name:</label>
                    <input type="text" id="name" name="name" required class="bg-[#333] text-white p-[10px] rounded-[8px] ml-[10px]">
                    <input type="submit" value="Create Playlist" class="bg-[#07A1C7] text-white px-[15px] py-[8px] rounded-[8px] ml-[10px]">
                </form>

                <!-- Add Songs to Playlist -->
                <div class="bg-[#212121] p-[20px] rounded-[15px] mb-[30px]">
                    <h3 class="text-[20px] font-[600] text-[#EFEEE0] mb-[20px]">Add Songs to an Existing Playlist</h3>
                    <form action="playlist?action=addSong" method="post">
                        <label for="playlistId" class="text-[16px] font-[500]">Select Playlist:</label>
                        <select id="playlistId" name="playlistId" required class="bg-[#333] text-white p-[10px] rounded-[8px] ml-[10px]">
                            <option value="">-- Select a Playlist --</option>
                            <% 
                                PlaylistDAO playlistDAO = new PlaylistDAO();
                                List<Playlist> playlists = playlistDAO.getAllPlaylists();
                                for (Playlist playlist : playlists) {
                                    out.println("<option value=\"" + playlist.getPlaylistId() + "\">" + playlist.getName() + "</option>");
                                }
                            %>
                        </select>

                        <label for="songId" class="text-[16px] font-[500]">Select Song:</label>
                        <select id="songId" name="songId" required class="bg-[#333] text-white p-[10px] rounded-[8px] ml-[10px]">
                            <option value="">-- Select a Song --</option>
                            <% 
                                SongDAO songDAO = new SongDAO();
                                List<Song> songs = songDAO.getAllSongs();
                                for (Song song : songs) {
                                    out.println("<option value=\"" + song.getSongId() + "\">" + song.getTitle() + "</option>");
                                }
                            %>
                        </select>

                        <input type="submit" value="Add Song" class="bg-[#07A1C7] text-white px-[15px] py-[8px] rounded-[8px] mt-[10px]">
                    </form>
                </div>

                <!-- Display Existing Playlists and Their Songs -->
                <div class="bg-[#212121] p-[20px] rounded-[15px]">
                    <h3 class="text-[20px] font-[600] text-[#EFEEE0] mb-[20px]">Existing Playlists</h3>
                    <% 
                        for (Playlist playlist : playlists) { 
                            List<Song> playlistSongs = playlistDAO.getSongsByPlaylistId(playlist.getPlaylistId());
                    %>
                        <div class="bg-[#333] p-[15px] rounded-[8px] mb-[10px]">
                            <strong>Playlist:</strong> <%= playlist.getName() %> 
                            <a href="playlist?action=deletePlaylist&playlistId=<%= playlist.getPlaylistId() %>" 
                               class="text-[#EF4444] ml-[10px]" 
                               onclick="return confirm('Are you sure you want to delete this playlist?');">
                                Delete Playlist
                            </a>
                            <br>
                            <strong>Songs:</strong>
                            <ul>
                                <% 
                                    if (playlistSongs != null && !playlistSongs.isEmpty()) {
                                        for (Song song : playlistSongs) { 
                                %>
                                    <li class="flex justify-between items-center mt-[5px]">
                                        <div>
                                            <%= song.getTitle() %> (<%= song.getGenre() %>)
                                            <a href="playlist?action=removeSong&playlistId=<%= playlist.getPlaylistId() %>&songId=<%= song.getSongId() %>" 
                                               class="text-[#EF4444] ml-[10px]"
                                               onclick="return confirm('Are you sure you want to remove this song from the playlist?');">
                                                Remove Song
                                            </a>
                                        </div>
                                        <!-- Embed an audio player with customized width -->
                                        <audio controls class="audio-player">
                                            <source src="<%= song.getFilePath() %>" type="audio/mpeg">
                                            Your browser does not support the audio tag.
                                        </audio>
                                    </li>
                                <% 
                                        }
                                    } else { 
                                %>
                                    <li>No songs in this playlist.</li>
                                <% } %>
                            </ul>
                        </div>
                    <% } %>
                </div>
            </div>
        </div>         
    </div>
</body>
</html>
