<!DOCTYPE html>
<html lang="vi">
    <head>
        <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
        <%@ page import="javax.servlet.http.HttpSession" %>
        <%@ page import="model.User" %>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
        <title>Jing Mp3</title>
    </head>
    <body class="bg-[#292929] text-[#EFEEE0]">
        <%
            User user = (User) session.getAttribute("user");
        %>
        <div class="container mx-auto px-4">
            <div class="flex items-start space-x-4">
                <div class="w-[280px]">
                    <%@include file="partials/sider.jsp"%>
                </div>
                <div class="flex-1">
                    <%@include file="partials/search.jsp"%> 
                    <main class="mt-8 mb-32">
                        <div class="flex items-start space-x-6">
                            <!-- Main Featured Section -->
                            <div class="w-[534px]">
                                <a href="songlist.jsp?genre=EDM" class="block">
                                    <div class="w-full flex items-center rounded-xl bg-cover hover:shadow-lg hover:scale-105 transform transition duration-300 ease-in-out"
                                         style="background-image: url('images/background-1.png');">
                                        <div class="flex-1 p-6">
                                            <h2 class="text-[32px] font-bold text-white mb-2">Nhạc EDM</h2>
                                            <p class="text-sm font-medium text-white">
                                                Top 100 Nhạc Electronic/Dance Âu Mỹ là danh sách 100 ca khúc hot nhất hiện tại của thể loại này.
                                            </p>
                                        </div>
                                        <div class="w-[215px] mt-6 mr-4">
                                            <img src="images/image-2.png" alt="Nhạc EDM" class="w-full h-auto rounded-lg" />
                                        </div>
                                    </div>
                                </a>
                            </div>

                            <!-- Popular Songs Section -->
                            <div class="flex-1 space-y-4">
                                <h3 class="text-2xl font-bold text-[#EFEEE0] mb-6">Nghe nhiều</h3>
                                <div class="grid gap-4">
                                    <!-- Song Card Template -->
                                    <div class="bg-[#212121] rounded-lg flex items-center p-4 shadow-md hover:bg-[#333] transition">
                                        <img src="images/cat-doi-noi-sau.jpg" alt="Cắt Đôi Nỗi Sầu" class="w-20 h-20 rounded-lg object-cover mr-4" />
                                        <div class="flex-1">
                                            <h4 class="text-lg font-semibold text-white mb-1">Cắt Đôi Nỗi Sầu</h4>
                                            <p class="text-sm text-[#FFFFFF80]">Tăng Duy Tân</p>
                                            <p class="text-xs text-white">24,500 lượt nghe</p>
                                        </div>
                                        <audio controls class="w-50">
                                            <source src="songs/CatDoiNoiSau.mp3" type="audio/mpeg">
                                        </audio>
                                    </div>

                                    <div class="bg-[#212121] rounded-lg flex items-center p-4 shadow-md hover:bg-[#333] transition">
                                        <img src="images/ngay-mai-nguoi-ta-lay-chong.jpg" alt="Ngày Mai Người Ta Lấy Chồng" class="w-20 h-20 rounded-lg object-cover mr-4" />
                                        <div class="flex-1">
                                            <h4 class="text-lg font-semibold text-white mb-1">Ngày Mai Người Ta Lấy Chồng</h4>
                                            <p class="text-sm text-[#FFFFFF80]">Thành Đạt, Đông Thiên Đức</p>
                                            <p class="text-xs text-white">20,500 lượt nghe</p>
                                        </div>
                                        <audio controls class="w-50">
                                            <source src="songs/NgayMaiNguoiTaLayChongCover.mp3" type="audio/mpeg">
                                        </audio>
                                    </div>

                                    <div class="bg-[#212121] rounded-lg flex items-center p-4 shadow-md hover:bg-[#333] transition">
                                        <img src="images/tat-ca-hoac-khong-la-gi-ca.jpg" alt="Tất Cả Hoặc Không Là Gì Cả" class="w-20 h-20 rounded-lg object-cover mr-4" />
                                        <div class="flex-1">
                                            <h4 class="text-lg font-semibold text-white mb-1">Tất Cả Hoặc Không Là Gì Cả</h4>
                                            <p class="text-sm text-[#FFFFFF80]">Cao Thái Sơn, Đông Thiên Đức</p>
                                            <p class="text-xs text-white">18,800 lượt nghe</p>
                                        </div>
                                        <audio controls class="w-50">
                                            <source src="songs/tatcahoackhonglagica.mp3" type="audio/mpeg">
                                        </audio>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Featured Genres Section -->
                        <section class="mt-12">
                            <h3 class="text-2xl font-bold text-[#EFEEE0] mb-6">Danh Mục Nổi Bật</h3>
                            <div class="grid grid-cols-5 gap-6">
                                <!-- Genre Card Template -->
                                <a href="songlist.jsp?genre=Nhạc trẻ" class="block hover:shadow-lg hover:scale-105 transform transition duration-300 ease-in-out">
                                    <div class="relative w-full aspect-square rounded-xl overflow-hidden mb-2">
                                        <img src="images/nhac-tre.jpg" alt="Nhạc trẻ" class="w-full h-full object-cover">
                                    </div>
                                    <div>
                                        <p class="text-sm font-bold text-white">Nhạc trẻ</p>
                                        <p class="text-xs text-[#FFFFFF80]">Tổng hợp nhạc Nhạc trẻ mới nhất</p>
                                    </div>
                                </a>

                                <a href="songlist.jsp?genre=Bolero" class="block hover:shadow-lg hover:scale-105 transform transition duration-300 ease-in-out">
                                    <div class="relative w-full aspect-square rounded-xl overflow-hidden mb-2">
                                        <img src="images/bolero.jpg" alt="Bolero" class="w-full h-full object-cover">
                                    </div>
                                    <div>
                                        <p class="text-sm font-bold text-white">Bolero</p>
                                        <p class="text-xs text-[#FFFFFF80]">Tổng hợp nhạc Bolero mới nhất</p>
                                    </div>
                                </a>

                                <a href="songlist.jsp?genre=Remix" class="block hover:shadow-lg hover:scale-105 transform transition duration-300 ease-in-out">
                                    <div class="relative w-full aspect-square rounded-xl overflow-hidden mb-2">
                                        <img src="images/remix.jpg" alt="Remix" class="w-full h-full object-cover">
                                    </div>
                                    <div>
                                        <p class="text-sm font-bold text-white">Remix</p>
                                        <p class="text-xs text-[#FFFFFF80]">Tổng hợp nhạc Remix mới nhất</p>
                                    </div>
                                </a>

                                <a href="songlist.jsp?genre=Hip-Hop" class="block hover:shadow-lg hover:scale-105 transform transition duration-300 ease-in-out">
                                    <div class="relative w-full aspect-square rounded-xl overflow-hidden mb-2">
                                        <img src="images/hiphop.jpg" alt="Hip-Hop" class="w-full h-full object-cover">
                                    </div>
                                    <div>
                                        <p class="text-sm font-bold text-white">Hip-Hop</p>
                                        <p class="text-xs text-[#FFFFFF80]">Tổng hợp nhạc Hip-Hop mới nhất</p>
                                    </div>
                                </a>

                                <a href="songlist.jsp?genre=Latin" class="block hover:shadow-lg hover:scale-105 transform transition duration-300 ease-in-out">
                                    <div class="relative w-full aspect-square rounded-xl overflow-hidden mb-2">
                                        <img src="images/latin.jpg" alt="Latin" class="w-full h-full object-cover">
                                    </div>
                                    <div>
                                        <p class="text-sm font-bold text-white">Latin</p>
                                        <p class="text-xs text-[#FFFFFF80]">Tổng hợp nhạc Latin mới nhất</p>
                                    </div>
                                </a>
                            </div>
                        </section>
                    </main>
                </div>
            </div>
        </div>

        <!-- Custom JavaScript -->
        <script src="JavaScript/javascript.js"></script>
    </body>
</html>
