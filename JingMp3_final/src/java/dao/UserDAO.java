package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.User;
import until.DBContext;

/**
 *
 * @author nguye
 */
public class UserDAO {

    public List<User> getAllUsers() throws SQLException, ClassNotFoundException {
        List<User> users = new ArrayList<>();
        Connection conn = DBContext.getConnection();
        String query = "SELECT * FROM users";
        PreparedStatement ps = conn.prepareStatement(query);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            User user = new User(
                    rs.getInt("user_id"),
                    rs.getString("username"),
                    rs.getString("email"),
                    rs.getString("password")
            );
            users.add(user);
        }

        rs.close();
        ps.close();
        conn.close();

        return users;
    }

    public boolean isUsernameOrEmailTaken(String username, String email) throws SQLException, ClassNotFoundException {
        Connection conn = DBContext.getConnection();
        String query = "SELECT * FROM users WHERE username = ? OR email = ?";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setString(1, username);
        ps.setString(2, email);
        ResultSet rs = ps.executeQuery();

        boolean isTaken = rs.next(); // Trả về true nếu có kết quả trong CSDL (trùng username hoặc email)

        rs.close();
        ps.close();
        conn.close();

        return isTaken;
    }

    public boolean isUsernameOrEmailTakenZZ(String username, String email, int userId) throws SQLException, ClassNotFoundException {
    String query = "SELECT COUNT(*) FROM users WHERE (username = ? OR email = ?) AND user_id != ?";
    try (Connection connection = DBContext.getConnection();
         PreparedStatement statement = connection.prepareStatement(query)) {
        statement.setString(1, username);
        statement.setString(2, email);
        statement.setInt(3, userId);
        ResultSet rs = statement.executeQuery();
        if (rs.next()) {
            return rs.getInt(1) > 0;
        }
    }
    return false;
}
    
    public User getUserById(int userId) throws SQLException, ClassNotFoundException {
        Connection conn = DBContext.getConnection();
        String query = "SELECT * FROM users WHERE user_id = ?";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setInt(1, userId);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            User user = new User(
                    rs.getInt("user_id"),
                    rs.getString("username"),
                    rs.getString("email"),
                    rs.getString("password")
            );
            rs.close();
            ps.close();
            conn.close();
            return user;
        }

        rs.close();
        ps.close();
        conn.close();

        return null;
    }

    public void addUser(User user) throws SQLException, ClassNotFoundException {
        Connection conn = DBContext.getConnection();
        String query = "INSERT INTO users (username, email, password) VALUES (?, ?, ?)";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setString(1, user.getUsername());
        ps.setString(2, user.getEmail());
        ps.setString(3, user.getPassword());
        ps.executeUpdate();
        ps.close();
        conn.close();
    }

    public void updateUser(User user) throws SQLException, ClassNotFoundException {
        Connection conn = DBContext.getConnection();
        String query = "UPDATE users SET username = ?, email = ?, password = ? WHERE user_id = ?";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setString(1, user.getUsername());
        ps.setString(2, user.getEmail());
        ps.setString(3, user.getPassword());
        ps.setInt(4, user.getUserId());
        ps.executeUpdate();
        ps.close();
        conn.close();
    }

    public void deleteUser(int userId) throws SQLException, ClassNotFoundException {
        Connection conn = DBContext.getConnection();
        String query = "DELETE FROM users WHERE user_id = ?";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setInt(1, userId);
        ps.executeUpdate();
        ps.close();
        conn.close();
    }

    public User checkLogin(String username, String password) throws SQLException, ClassNotFoundException {
        Connection conn = DBContext.getConnection();
        String query = "SELECT * FROM users WHERE username = ? AND password = ?";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setString(1, username);
        ps.setString(2, password);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            User user = new User(
                    rs.getInt("user_id"),
                    rs.getString("username"),
                    rs.getString("email"),
                    rs.getString("password")
            );
            rs.close();
            ps.close();
            conn.close();
            return user; // Đăng nhập thành công
        }

        rs.close();
        ps.close();
        conn.close();
        return null; // Đăng nhập thất bại
    }
}
