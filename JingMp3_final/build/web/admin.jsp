<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Quản lý người dùng và nhạc</title>
    <link rel="stylesheet" href="Styles/admin.css">
</head>
<body>

    <!-- Header -->
    <header>
        <h1>Trang quản trị - Jingmp3</h1>
        <nav>
            <ul>
                <li><a href="home.jsp">Trang chủ</a></li>
                <li><a href="logout.jsp">Đăng xuất</a></li>
            </ul>
        </nav>
    </header>

    <!-- Admin Dashboard Container -->
    <div class="admin-container">
        <div class="admin-content">
            <h2>Quản lý người dùng và nhạc</h2>
            <ul>
                <!-- Quản lý người dùng -->
                <li><a href="manageUsers" class="manage-link">Quản lý người dùng</a></li>

                <!-- Quản lý nhạc dropdown -->
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle">Quản lý nhạc</a>
                    <ul class="dropdown-menu">
                        <li><a href="songManagement">Quản lý nhạc</a></li>
                        <li><a href="artistManagement">Quản lý ca sĩ</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <p>Bản quyền © 2024 Jingmp3. Mọi quyền được bảo lưu.</p>
    </footer>
</body>
</html>
