<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thêm người dùng</title>
    <link rel="stylesheet" href="Styles/admin.css">
</head>
<body>

    <!-- Header -->
    <header>
        <h1>Thêm người dùng mới</h1>
        <nav>
            <ul>
                <li><a href="manageUsers">Quay lại danh sách người dùng</a></li>
            </ul>
        </nav>
    </header>

    <!-- Main Content -->
    <div class="admin-container">
        <div class="admin-content">
            <h2>Thêm người dùng</h2>

            <!-- Display error message if present -->
            <% 
                String errorMessage = (String) request.getAttribute("errorMessage");
                if (errorMessage != null) { 
            %>
                <p class="error-message"><%= errorMessage %></p>
            <% } %>

            <!-- Add User Form -->
            <form action="addUser" method="POST" class="form-container">
                <div class="form-group">
                    <label for="username">Tên đăng nhập:</label>
                    <input type="text" id="username" name="username" required>
                </div>

                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" required>
                </div>

                <div class="form-group">
                    <label for="password">Mật khẩu:</label>
                    <input type="password" id="password" name="password" required>
                </div>

                <button type="submit" class="submit-button">Thêm người dùng</button>
            </form>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <p>Bản quyền © 2024 Jingmp3. Mọi quyền được bảo lưu.</p>
    </footer>
</body>
</html>
