<%@page import="java.util.Map"%>
<%@page import="model.Artist"%>
<%@page import="model.Song"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Search Results - Jing Mp3</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <style>
        /* Additional styling for a more polished look */
        .section-heading {
            color: #FF6B6B;
            margin-bottom: 1rem;
            font-weight: 700;
        }
        .card {
            background-color: #212121;
            border-radius: 15px;
            padding: 15px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
        }
        .audio-player {
            background-color: #333;
            border-radius: 8px;
            width: 100%;
            margin-top: 5px;
        }
        .text-muted {
            color: #FFFFFF80;
        }
    </style>
</head>
<body class="bg-[#292929] text-white">

<div class="container mx-auto">
    <div class="flex items-start">
        <!-- Sidebar Section -->
        <div class="w-[280px]">
            <%@include file="partials/sider.jsp"%>
        </div>
        
        <!-- Main Content Section -->
        <div class="ml-[20px] flex-1">
            <!-- Search Results Heading -->
            <div class="text-[32px] font-[700] text-[#EFEEE0] mt-[20px] mb-[10px]">Search Results</div>

            <!-- Songs Section -->
            <h2 class="section-heading text-[24px]">Songs</h2>
            <%
                List<Song> songResults = (List<Song>) request.getAttribute("songResults");
                if (songResults != null && !songResults.isEmpty()) {
            %>
                <ul class="grid gap-[12px]">
                    <% for (Song song : songResults) { %>
                        <li class="card flex items-center">
                            <div class="flex-1">
                                <strong class="text-[16px] font-[600]"><%= song.getTitle() %></strong> - <%= song.getGenre() %>
                                <audio controls class="audio-player mt-[5px]">
                                    <source src="<%= song.getFilePath() %>" type="audio/mpeg">
                                    Your browser does not support the audio element.
                                </audio>
                            </div>
                        </li>
                    <% } %>
                </ul>
            <% } else { %>
                <p class="text-muted">No songs found matching your search.</p>
            <% } %>

            <!-- Artists Section -->
            <h2 class="section-heading text-[24px] mt-[30px]">Artists and Their Songs</h2>
            <%
                List<Artist> artistResults = (List<Artist>) request.getAttribute("artistResults");
                Map<Integer, List<Song>> artistSongsMap = (Map<Integer, List<Song>>) request.getAttribute("artistSongsMap");
                if (artistResults != null && !artistResults.isEmpty()) {
            %>
                <ul class="grid gap-[12px]">
                    <% for (Artist artist : artistResults) { %>
                        <li class="card p-[15px]">
                            <div class="text-[20px] font-[700] mb-[10px]"><%= artist.getName() %> - <%= artist.getGenre() %></div>
                            <ul>
                                <%
                                    List<Song> artistSongs = artistSongsMap.get(artist.getArtistId());
                                    if (artistSongs != null && !artistSongs.isEmpty()) {
                                        for (Song song : artistSongs) {
                                %>
                                    <li class="flex items-center mb-[10px]">
                                        <span class="text-[16px] font-[500] mr-[10px]"><%= song.getTitle() %> - <%= song.getGenre() %></span>
                                        <audio controls class="audio-player">
                                            <source src="<%= song.getFilePath() %>" type="audio/mpeg">
                                            Your browser does not support the audio element.
                                        </audio>
                                    </li>
                                <% 
                                        }
                                    } else { 
                                %>
                                    <li class="text-muted">No songs found for this artist.</li>
                                <% } %>
                            </ul>
                        </li>
                    <% } %>
                </ul>
            <% } else { %>
                <p class="text-muted">No artists found matching your search.</p>
            <% } %>
        </div>
    </div>         
</div>

</body>
</html>
