<%@page import="java.util.List"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="model.Artist"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Jing Mp3</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://cdn.tailwindcss.com"></script>
        <style>
            .artist-card {
                transition: transform 0.3s ease, box-shadow 0.3s ease;
            }
            .artist-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
            }
            .bio-text {
                max-height: 60px; /* Set the max height */
                overflow-y: auto; /* Scrollable bio */
            }
            /* Scrollbar styling */
            .bio-text::-webkit-scrollbar {
                width: 6px;
            }
            .bio-text::-webkit-scrollbar-track {
                background: #404040;
            }
            .bio-text::-webkit-scrollbar-thumb {
                background: #07A1C7;
                border-radius: 10px;
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
                <div class="ml-[20px] flex-1">
                    <%@include file="/partials/search.jsp" %>

                    <div class="mt-[30px]">
                        <div class="text-[24px] font-[700] text-[#EFEEE0] mb-[20px]">Danh Sách Ca Sĩ</div>
                        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-5 gap-[20px]">
                            <%
                                List<Artist> artists = (List<Artist>) request.getAttribute("artist");
                                if (artists != null && !artists.isEmpty()) {
                                    for (Artist artist : artists) {
                            %> 
                            <!-- Artist Card -->
                            <div class="artist-card bg-[#1F1F1F] rounded-[15px] p-[15px]">
                                <a href="artistSongs?artistId=<%= artist.getArtistId()%>">
                                    <div class="w-full aspect-square overflow-hidden rounded-[15px] mb-[10px]">
                                        <img src="<%= artist.getFilePath()%>" alt="<%= artist.getName()%>" class="w-full h-full object-cover rounded-[15px]"/>
                                    </div>
                                    <div class="text-[14px] font-[700] text-white mb-[2px] text-center">
                                        <%= artist.getName()%>
                                    </div>
                                    <div class="bio-text text-[12px] font-[400] text-[#FFFFFF80] text-center">
                                        <%= artist.getBio()%>
                                    </div>
                                </a>
                            </div>
                            <%
                                }
                            } else {
                            %>
                            <p class="text-center text-white col-span-full">Không có ca sĩ nào.</p>
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
