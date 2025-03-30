<%@page import="model.Artist"%>
<%@page import="java.util.List"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="model.Song"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Jing Mp3 - Danh Sách Bài Hát</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://cdn.tailwindcss.com"></script>
        <style>
            /* Song Card Hover Effect */
            .song-card {
                transition: transform 0.3s ease, box-shadow 0.3s ease;
                background-color: #1F1F1F;
            }
            .song-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
            }
            /* Custom styling for audio player */
            .audio-player {
                background-color: #333;
                padding: 8px;
                border-radius: 10px;
                width: 100%;
            }
            /* Truncate long song titles and artist names */
            .truncate {
                overflow: hidden;
                white-space: nowrap;
                text-overflow: ellipsis;
            }
        </style>
    </head>
    <body class="bg-[#292929] text-white">
        <div class="container mx-auto">
            <div class="flex items-start">
                <!-- Sidebar -->
                <div class="w-[280px]">
                    <%@include file="/partials/sider.jsp" %>
                </div>

                <!-- Main Content -->
                <div class="ml-[20px] flex-1">
                    <%@include file="/partials/search.jsp" %>

                    <div class="mt-[30px]">
                        <div class="flex items-center mb-8">
                            <div class="w-[80px] h-[80px] overflow-hidden rounded-full mr-4">
                                <img src="<%= ((Artist) request.getAttribute("artist")).getFilePath() %>" 
                                     alt="<%= ((Artist) request.getAttribute("artist")).getName() %>" 
                                     class="w-full h-full object-cover">
                            </div>
                            <div>
                                <h1 class="text-2xl font-bold"><%= ((Artist) request.getAttribute("artist")).getName() %></h1>
                                <p class="text-gray-400"><%= ((Artist) request.getAttribute("artist")).getGenre() %></p>
                            </div>
                        </div>

                        <div class="text-[24px] font-[700] text-[#EFEEE0] mb-[20px]">Danh Sách Bài Hát</div>
                        <div class="grid grid-cols-1 gap-[15px]">
                            <%
                                List<Song> songList = (List<Song>) request.getAttribute("songList");
                                if (songList != null && !songList.isEmpty()) {
                                    for (Song song : songList) {
                            %>

                            <!-- Song Card -->
                            <div class="song-card flex items-center justify-between bg-[#212121] px-[18px] py-[10px] rounded-[15px]">
                                <!-- Song Thumbnail and Title -->
                                <div class="w-[50%] flex items-center">
                                    <div class="w-[50px] h-[50px] overflow-hidden rounded-[8px] mx-[12px]">
                                        <img src="<%= ((Artist) request.getAttribute("artist")).getFilePath() %>" 
                                             alt="<%= song.getTitle() %>" 
                                             class="w-full h-full object-cover"/>
                                    </div>
                                    <div class="font-[700] text-[16px] text-white truncate">
                                        <a href="#" class="hover:underline">
                                            <%= song.getTitle() %>
                                        </a>
                                    </div>
                                </div>
                                <!-- Audio Player -->
                                <div class="audio-player w-[30%] text-center">
                                    <audio controls>
                                        <source src="<%= song.getFilePath() %>" type="audio/mpeg">
                                        Your browser does not support the audio tag.
                                    </audio>
                                </div>
                            </div>
                            <%
                                    }
                                } else {
                            %>
                            <!-- Message if no songs are available -->
                            <p class="text-center text-[#EFEEE0]">Không có bài hát nào cho nghệ sĩ này.</p>
                            <%
                                }
                            %>
                        </div>             
                    </div>  
                </div>
            </div>         
        </div>
    </body>
</html>
