package dao;

import model.Song;
import until.DBContext;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Artist;

public class SongDAO {
    // Lấy tất cả các bài hát
    public List<Song> getAllSongs() {
        List<Song> songs = new ArrayList<>();
        try (Connection conn = DBContext.getConnection()) {
            String sql = "SELECT * FROM songs";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Song song = new Song();
                song.setSongId(rs.getInt("song_id"));
                song.setTitle(rs.getString("title"));
                song.setArtistId(rs.getInt("artist_id"));
                song.setGenre(rs.getString("genre"));
                song.setFilePath(rs.getString("file_path"));
                songs.add(song);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return songs;
    }

    // Thêm bài hát mới
    public void addSong(Song song) {
    try (Connection conn = DBContext.getConnection()) {
        String sql = "INSERT INTO songs (title, artist_id, genre, file_path) VALUES (?, ?, ?, ?)";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, song.getTitle());
        ps.setInt(2, song.getArtistId());
        ps.setString(3, song.getGenre());
        ps.setString(4, song.getFilePath());

        System.out.println("Executing SQL: " + sql); // Debugging
        System.out.println("Song details: " + song.getTitle() + ", " + song.getArtistId() + ", " + song.getGenre() + ", " + song.getFilePath()); // Debugging

        int rowsAffected = ps.executeUpdate();
        System.out.println("Rows affected: " + rowsAffected); // Check if the insertion happened
    } catch (Exception e) {
        e.printStackTrace();
        System.out.println("Error adding song: " + e.getMessage()); // Log the specific error
    }
}


    // Cập nhật thông tin bài hát
    public void updateSong(Song song) {
        try (Connection conn = DBContext.getConnection()) {
            String sql = "UPDATE songs SET title = ?, artist_id = ?, genre = ?, file_path = ? WHERE song_id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, song.getTitle());
            ps.setInt(2, song.getArtistId());
            ps.setString(3, song.getGenre());
            ps.setString(4, song.getFilePath());
            ps.setInt(5, song.getSongId());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Xóa bài hát
    public void deleteSong(int songId) {
        try (Connection conn = DBContext.getConnection()) {
            String sql = "DELETE FROM songs WHERE song_id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, songId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Lấy bài hát theo ID
    public Song getSongById(int songId) throws SQLException, ClassNotFoundException {
    Song song = null;
    String sql = "SELECT * FROM songs WHERE song_id = ?";
    
    try (Connection conn = DBContext.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setInt(1, songId);
        ResultSet rs = stmt.executeQuery();
        
        if (rs.next()) {
            song = new Song(
                rs.getInt("song_id"),
                rs.getString("title"),
                rs.getInt("artist_id"),
                rs.getString("genre"),
                rs.getString("file_path")
            );
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return song;
}
    public List<Song> searchSongs(String query) throws SQLException, ClassNotFoundException {
        List<Song> songs = new ArrayList<>();

        String sql = "SELECT * FROM songs WHERE title LIKE ? OR genre LIKE ?";

        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            // Use '%' wildcard for partial matching
            String searchQuery = "%" + query + "%";
            ps.setString(1, searchQuery);
            ps.setString(2, searchQuery);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Song song = new Song();
                song.setSongId(rs.getInt("song_id"));
                song.setTitle(rs.getString("title"));
                song.setArtistId(rs.getInt("artist_id"));
                song.setGenre(rs.getString("genre"));
                song.setFilePath(rs.getString("file_path"));

                songs.add(song);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return songs;
    }
    public List<Song> getSongsByArtist(int artistId) throws ClassNotFoundException {
    List<Song> songs = new ArrayList<>();

    String sql = "SELECT * FROM songs WHERE artist_id = ?";

    try (Connection conn = DBContext.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {

        ps.setInt(1, artistId);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            Song song = new Song();
            song.setSongId(rs.getInt("song_id"));
            song.setTitle(rs.getString("title"));
            song.setArtistId(rs.getInt("artist_id"));
            song.setGenre(rs.getString("genre"));
            song.setFilePath(rs.getString("file_path"));

            songs.add(song);
        }

    } catch (SQLException e) {
        e.printStackTrace();
    }

    return songs;
}
     public List<Song> getSongsByGenre(String genre) throws ClassNotFoundException {
        List<Song> songs = new ArrayList<>();
        String query = "SELECT * FROM Songs WHERE genre = ?";
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
             
            stmt.setString(1, genre);
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                Song song = new Song();
                song.setSongId(rs.getInt("song_id"));
                song.setTitle(rs.getString("title"));
                song.setGenre(rs.getString("genre"));
                song.setFilePath(rs.getString("file_path"));
                 

                
                songs.add(song);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return songs;
    }
    
}