<%@page import="dao.ArtistDAO"%>
<%@page import="dao.SongDAO"%>
<%@page import="model.Song"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh mục bài hát - Jingmp3</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        /* Sidebar Styles */
        .sidebar-container {
            background-color: #212121;
            padding: 20px;
            width: 280px;
            height: 100vh;
            position: fixed;
            overflow-y: auto;
        }

        .main-content {
            margin-left: 280px; /* Offset to align with sidebar */
            padding: 20px;
        }

        /* Link and Hover Styles */
        .sidebar-link {
            color: #07A1C7;
            padding: 10px 20px;
            display: block;
            border-radius: 8px;
            font-weight: 600;
            transition: background-color 0.3s, color 0.3s;
        }

        .sidebar-link:hover {
            background-color: #333;
            color: #EFEEE0;
        }

        .active-link {
            color: #FF0000; /* Active link color */
            background-color: #444;
            font-weight: bold;
        }

        /* Song Item Hover */
        .song-item {
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .song-item:hover {
            transform: translateY(-3px);
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.3);
        }

        /* Song List Audio Player */
        .audio-player {
            width: 100%;
            background-color: #333;
            padding: 8px;
            border-radius: 8px;
        }
    </style>
</head>

<body class="bg-[#292929] text-[#EFEEE0]">
    <!-- Sidebar -->
    <div class="sidebar-container">
        <%@include file="partials/sider.jsp" %>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <!-- Header -->
        <header class="bg-[#1C1C1C] p-5 flex items-center shadow-lg">
            <a href="home.jsp" class="text-[#07A1C7] text-[30px] font-bold">Jing Mp3</a>
        </header>

        <!-- Genre and Song List Section -->
        <div class="flex mt-8">
            <!-- Genre List -->
            <aside class="w-[280px] p-5 bg-[#212121] rounded-lg shadow-lg mr-6">
                <h2 class="text-[24px] font-semibold mb-4 text-[#EFEEE0]">Danh mục bài hát</h2>
                <ul class="space-y-3">
                    <%
                        String selectedGenre = request.getParameter("genre");
                    %>
                    <li><a href="songlist.jsp?genre=Nhạc trẻ" class="sidebar-link <%= "Nhạc trẻ".equals(selectedGenre) ? "active-link" : ""%>">Nhạc Trẻ</a></li>
                    <li><a href="songlist.jsp?genre=Bolero" class="sidebar-link <%= "Bolero".equals(selectedGenre) ? "active-link" : ""%>">Bolero</a></li>
                    <li><a href="songlist.jsp?genre=Hip-Hop" class="sidebar-link <%= "Hip-Hop".equals(selectedGenre) ? "active-link" : ""%>">Hip-Hop</a></li>
                    <li><a href="songlist.jsp?genre=Remix" class="sidebar-link <%= "Remix".equals(selectedGenre) ? "active-link" : ""%>">Remix</a></li>
                    <li><a href="songlist.jsp?genre=Latin" class="sidebar-link <%= "Latin".equals(selectedGenre) ? "active-link" : ""%>">Latin</a></li>
                    <li><a href="songlist.jsp?genre=Acoustic" class="sidebar-link <%= "Acoustic".equals(selectedGenre) ? "active-link" : ""%>">Acoustic</a></li>
                    <li><a href="songlist.jsp?genre=Rock" class="sidebar-link <%= "Rock".equals(selectedGenre) ? "active-link" : ""%>">Rock</a></li>
                    <li><a href="songlist.jsp?genre=EDM" class="sidebar-link <%= "EDM".equals(selectedGenre) ? "active-link" : ""%>">EDM</a></li>
                </ul>
            </aside>

            <!-- Song List -->
            <main class="flex-1 p-5 bg-[#1C1C1C] rounded-lg shadow-lg">
                <h2 class="text-[24px] font-semibold mb-6">
                    Danh sách bài hát 
                    <% if (selectedGenre != null) { %> 
                        <span class="text-[#FF0000]">- <%= selectedGenre %></span>
                    <% } %>
                </h2>

                <section class="space-y-4">
                    <%
                        if (selectedGenre != null) {
                            SongDAO songDAO = new SongDAO();
                            List<Song> songs = songDAO.getSongsByGenre(selectedGenre);
                            
                            if (songs != null && !songs.isEmpty()) {
                                for (Song song : songs) {
                    %>
                    <div class="song-item flex items-center justify-between p-4 bg-[#212121] rounded-md">
                        <div class="text-left">
                            
                            
                            <p class="font-bold text-lg"><%= song.getTitle() %></p>
                            
                            <p class="text-sm text-gray-400"><%= song.getGenre() %></p>
                        </div>
                        <div class="audio-player w-[350px]">
                            <audio controls>
                                <source src="<%= song.getFilePath() %>" type="audio/mpeg">
                                Your browser does not support the audio element.
                            </audio>
                        </div>
                    </div>
                    <%
                                }
                            } else {
                    %>
                    <p class="text-gray-400">Không có bài hát nào cho thể loại này.</p>
                    <%
                            }
                        } else {
                    %>
                    <p class="text-gray-400">Vui lòng chọn một thể loại nhạc.</p>
                    <%
                        }
                    %>
                </section>
            </main>
        </div>
    </div>

    <!-- Footer -->
    <footer class="bg-[#1C1C1C] text-center py-5 mt-10 shadow-lg">
        <p>Bản quyền © 2024 Jingmp3. Mọi quyền được bảo lưu.</p>
    </footer>
</body>
</html>
