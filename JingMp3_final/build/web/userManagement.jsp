<%@ page import="java.util.List" %>
<%@ page import="model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản lý người dùng</title>
    <link rel="stylesheet" href="Styles/admin.css">
</head>
<body>

    <!-- Header and Navigation -->
    <header>
        <h1>Trang quản lý người dùng</h1>
        <nav>
            <ul>
                <li><a href="admin.jsp">Trở về trang quản trị</a></li>
            </ul>
        </nav>
    </header>

    <!-- Main Content -->
    <div class="admin-container">
        <div class="admin-content">
            <h2>Danh sách người dùng</h2>
            <div class="user-actions">
                <a href="addUser.jsp" class="manage-link">Thêm người dùng</a>
            </div>
            
            <table class="user-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Tên đăng nhập</th>
                        <th>Email</th>
                        <th>Thao tác</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<User> users = (List<User>) request.getAttribute("userList");
                        if (users != null && !users.isEmpty()) {
                            for (User user : users) {
                    %>
                    <tr>
                        <td><%= user.getUserId() %></td>
                        <td><%= user.getUsername() %></td>
                        <td><%= user.getEmail() %></td>
                        <td>
                            <a href="editUser?userId=<%= user.getUserId() %>" class="edit-link">Sửa</a> |
                            <a href="deleteUser?userId=<%= user.getUserId() %>" class="delete-link">Xóa</a>
                        </td>
                    </tr>
                    <%
                            }
                        } else {
                    %>
                    <tr>
                        <td colspan="4">Không có người dùng nào.</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <p>Bản quyền © 2024 Jingmp3. Mọi quyền được bảo lưu.</p>
    </footer>
</body>
</html>
