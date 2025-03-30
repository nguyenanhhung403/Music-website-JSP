<%@ page import="model.User" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chỉnh sửa người dùng</title>
    <link rel="stylesheet" href="Styles/admin.css">
</head>
<body>

    <!-- Header -->
    <header>
        <h1>Trang quản trị - Jingmp3</h1>
        <nav>
            <ul>
                <li><a href="admin.jsp">Trở về trang quản trị</a></li>
                 </ul>
        </nav>
    </header>

    <!-- Main Container -->
    <div class="admin-container">
        <div class="admin-content">
            <h2>Chỉnh sửa thông tin người dùng</h2>

            <% 
                // Retrieve the user object and error message from the request
                User user = (User) request.getAttribute("user");
                String errorMessage = (String) request.getAttribute("errorMessage");
                if (errorMessage != null) {
            %>
                <p class="error-message" style="color: red;"><%= errorMessage %></p>
            <% } %>

            <!-- Edit User Form -->
            <form action="editUser" method="POST" class="form-container">
                 <div class="form-group">
                    <label for="userId">ID Người dùng:</label>
                    <input type="text" id="userId" name="userId" value="<%= user.getUserId() %>" readonly>
                </div>

                <div class="form-group">
                    
                    
                    <label for="username">Tên đăng nhập:</label>
                    <input type="text" id="username" name="username" value="<%= user.getUsername() %>" required>
                </div>

                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" value="<%= user.getEmail() %>" required>
                </div>

                <div class="form-group">
                    <label for="password">Mật khẩu:</label>
                    <input type="password" id="password" name="password" value="<%= user.getPassword() %>" required>
                </div>

                <button type="submit" class="submit-button">Cập nhật người dùng</button>
            </form>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <p>Bản quyền © 2024 Jingmp3. Mọi quyền được bảo lưu.</p>
    </footer>
</body>
</html>
