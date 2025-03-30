package dao;

/**
 *
 * @author nguye
 */
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Artist;
import until.DBContext;

public class ArtistDAO {

    // Get all artists from the database
    public List<Artist> getAllArtists() throws SQLException, ClassNotFoundException {
        List<Artist> artists = new ArrayList<>();
        String query = "SELECT * FROM artists";

        // Sử dụng try-with-resources để đảm bảo đóng tài nguyên tự động
        try (Connection conn = DBContext.getConnection();
                PreparedStatement ps = conn.prepareStatement(query);
                ResultSet rs = ps.executeQuery()) {

            // Duyệt qua từng bản ghi từ ResultSet và thêm vào danh sách
            while (rs.next()) {
                Artist artist = new Artist(
                        rs.getInt("artist_id"),
                        rs.getString("name"),
                        rs.getString("bio"),
                        rs.getString("genre"),
                        rs.getString("filePath")
                );
                artists.add(artist);
            }

        } catch (SQLException | ClassNotFoundException e) {
            // Ghi log hoặc xử lý ngoại lệ nếu cần thiết
            throw e;  // Quăng ngoại lệ lên tầng trên để xử lý
        }
        return artists;
    }

    // Get artist by id
    public Artist getArtistById(int artistId) throws ClassNotFoundException, SQLException {
        Artist artist = null;
        String query = "SELECT * FROM artists WHERE artist_id = ?";
        try (Connection conn = DBContext.getConnection();
                PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, artistId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    artist = new Artist(
                            rs.getInt("artist_id"),
                            rs.getString("name"),
                            rs.getString("bio"),
                            rs.getString("genre"),
                            rs.getString("filePath")
                    );
                }
            }
        }
        return artist;
    }

    // Add a new artist to the database
    public void addArtist(Artist artist) throws ClassNotFoundException, SQLException {
        String query = "INSERT INTO artists (name, bio, genre, filePath) VALUES (?, ?, ?, ?)";
        try (Connection conn = DBContext.getConnection();
                PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, artist.getName());
            ps.setString(2, artist.getBio());
            ps.setString(3, artist.getGenre());
            ps.setString(4, artist.getFilePath());
            ps.executeUpdate();
        }
    }

    // Update an artist's information
    public void updateArtist(Artist artist) throws ClassNotFoundException, SQLException {
        String query = "UPDATE artists SET name = ?, bio = ?, genre = ?, filePath = ? WHERE artist_id = ?";
        try (Connection conn = DBContext.getConnection();
                PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, artist.getName());
            ps.setString(2, artist.getBio());
            ps.setString(3, artist.getGenre());
            ps.setString(4, artist.getFilePath());
            ps.setInt(5, artist.getArtistId());

            ps.executeUpdate();
        }
    }

    // Delete an artist by ID
    public void deleteArtist(int artistId) throws ClassNotFoundException, SQLException {
        String query = "DELETE FROM artists WHERE artist_id = ?";
        try (Connection conn = DBContext.getConnection();
                PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, artistId);
            ps.executeUpdate();
        }
    }

    public List<Artist> searchArtists(String query) throws SQLException, ClassNotFoundException {
        List<Artist> artists = new ArrayList<>();

        String sql = "SELECT * FROM artists WHERE name LIKE ?";

        try (Connection conn = DBContext.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {

            // Use '%' wildcard for partial matching
            String searchQuery = "%" + query + "%";
            ps.setString(1, searchQuery);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Artist artist = new Artist();
                artist.setArtistId(rs.getInt("artist_id"));
                artist.setName(rs.getString("name"));
                artist.setBio(rs.getString("bio"));
                artist.setGenre(rs.getString("genre"));

                artists.add(artist);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return artists;
    }

}
