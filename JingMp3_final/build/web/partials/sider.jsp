<!DOCTYPE html>
<html>
<head>
    <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ page import="javax.servlet.http.HttpSession" %>
    <%@ page import="model.User" %>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <style>
        /* Custom Sidebar Styling */
        .sidebar-container {
            background-color: #212121;
            height: 100vh;
            width: 280px;
            padding: 20px;
            position: fixed;
            display: flex;
            flex-direction: column;
            align-items: center;
            color: #EFEEE0;
            transition: all 0.3s ease;
        }

        /* Logo and Title Centering */
        .sidebar-logo {
            display: flex;
            flex-direction: column; /* Stack vertically */
            align-items: center; /* Center elements horizontally */
            margin-bottom: 20px; /* Add space between logo/title and nav */
        }

        .sidebar-logo img {
            height: 80px;
            width: auto;
            padding: 5px;
            background-color: rgba(255, 255, 255, 0.2);
            border-radius: 50%;
            transition: transform 0.3s ease;
        }

        .sidebar-title {
            font-size: 30px;
            font-weight: 900;
            color: #07A1C7;
            margin-top: 10px; /* Spacing between logo and title */
        }

        /* Navigation Links */
        .sidebar-nav ul {
            width: 100%;
            padding-top: 30px;
            list-style: none;
        }

        .sidebar-nav ul li {
            margin-bottom: 20px;
        }

        .sidebar-nav a {
            display: flex;
            align-items: center;
            padding: 10px 20px;
            font-size: 16px;
            font-weight: 700;
            color: #EFEEE0;
            border-radius: 8px;
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        .sidebar-nav a:hover {
            background-color: #333333;
            color: #07A1C7;
        }

        .sidebar-nav i {
            font-size: 20px;
            margin-right: 15px;
        }
    </style>
    <title>Jing mp3 - Sidebar</title>
</head>

<body>
    <%
        User currentUser = (User) session.getAttribute("user");
    %>
    <div class="sidebar-container">
        <div class="sidebar-logo">
            <a href="home.jsp">
                <img src="images/logo-2.png" alt="Logo" />
            </a>
            <a href="home.jsp">
                <div class="sidebar-title">Jing mp3</div>
            </a>                
        </div>

        <!-- Navigation Links -->
        <nav class="sidebar-nav">
            <ul>
                <li>
                    <a href="home.jsp" class="flex items-center">
                        <i class="fa-solid fa-house"></i>
                        <span>Trang Chủ</span>
                    </a>
                </li>
                <li>
                    <a href="songlist.jsp" class="flex items-center">
                        <i class="fa-sharp fa-solid fa-music"></i>
                        <span>Danh Mục Bài Hát</span>
                    </a>
                </li>
                <li>
                    <a href="artists" class="flex items-center">
                        <i class="fa-solid fa-podcast"></i>
                        <span>Ca sĩ</span>
                    </a>
                </li>

                <% if (currentUser != null) { %>
                <li>
                    <a href="createPlaylist.jsp" class="flex items-center">
                        <i class="fa-solid fa-heart"></i>
                        <span>Tạo mới Danh sách yêu thích</span>
                    </a>
                </li>
                <li>
                    <a href="logout.jsp" class="flex items-center">
                        <i class="fa-solid fa-sign-out-alt"></i>
                        <span>Đăng xuất</span>
                    </a>
                </li>
                <% } else { %>
                <li>
                    <a href="login.jsp" class="flex items-center">
                        <i class="fa-solid fa-user"></i>
                        <span>Đăng Nhập</span>
                    </a>
                </li>
                <li>
                    <a href="register.jsp" class="flex items-center">
                        <i class="fa-solid fa-user-plus"></i>
                        <span>Đăng Ký</span>
                    </a>
                </li>
                <% } %>
            </ul> 
        </nav>
    </div>   
</body>
</html>
