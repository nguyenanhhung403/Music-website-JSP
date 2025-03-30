<%@page import="model.Artist"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Update Artist</title>
        <link rel="stylesheet" href="Styles/admin.css">
    </head>
    <body class="bg-[#292929] text-[#EFEEE0]">

        <!-- Header -->
        <header class="bg-[#1C1C1C] p-5 flex items-center justify-between">
            <h1 class="text-[24px] font-bold">Cập nhật Nghệ sĩ</h1>
            <nav>
                <ul class="flex space-x-4">
                    <li><a href="artistManagement" class="text-[#07A1C7] hover:underline">Trở về trang quản lý nghệ sĩ</a></li>
                </ul>
            </nav>
        </header>

        <!-- Main Content -->
        <div class="container mx-auto py-8 px-4">
            <div class="bg-[#212121] p-6 rounded-lg shadow-md">
                <h2 class="text-[24px] font-semibold mb-4">Cập nhật thông tin nghệ sĩ</h2>

                <!-- Error Message -->
                <%
                    String errorMessage = (String) request.getAttribute("errorMessage");
                    Artist artist = (Artist) request.getAttribute("artist");
                    if (errorMessage != null) {
                %>
                <p class="text-red-500 mb-4"><%= errorMessage%></p>
                <%
                    }
                %>

                <!-- Update Artist Form -->
                <form action="artistManagement?action=update" method="post" enctype="multipart/form-data" class="form-container">
                    <input type="hidden" name="artistId" value="<%= artist.getArtistId()%>">

                    <div class="form-group mb-4">
                        <label for="name" class="block font-semibold mb-2">Name:</label>
                        <input type="text" id="name" name="name" value="<%= artist.getName()%>" class="w-full p-2 rounded bg-[#333] text-[#EFEEE0]" required>
                    </div>

                    <div class="form-group mb-4">
                        <label for="bio" class="block font-semibold mb-2">Bio:</label>
                        <textarea id="bio" name="bio" class="w-full p-2 rounded bg-[#333] text-[#EFEEE0]" required><%= artist.getBio()%></textarea>
                    </div>

                    <div class="form-group mb-4">
                        <label for="genre" class="block font-semibold mb-2">Genre:</label>
                        <input type="text" id="genre" name="genre" value="<%= artist.getGenre()%>" class="w-full p-2 rounded bg-[#333] text-[#EFEEE0]" required>
                    </div>
                    <div class="form-group mb-4">
                        <label for="avatar" class="block font-semibold mb-2">Avatar:</label>
                        <input type="file" id="avatar" name="avatar" accept="image/jpeg" class="w-full p-2 rounded bg-[#333] text-[#EFEEE0]">
                    </div>
                    <button type="submit" class="submit-button w-full py-2 mt-4 bg-[#07A1C7] text-white rounded font-semibold">Update Artist</button>
                </form>
            </div>
        </div>

        <!-- Footer -->
        <footer class="bg-[#1C1C1C] text-center py-5 mt-10 text-[#EFEEE0]">
            <p>Bản quyền © 2024 Jingmp3. Mọi quyền được bảo lưu.</p>
        </footer>
    </body>
</html>
