package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Playlist;
import model.Song;
import until.DBContext;

public class PlaylistDAO {

    private Connection conn;

    public PlaylistDAO() {
        try {
            conn = DBContext.getConnection(); // Assumes you have a DBContext class for handling connections
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Method to create a new playlist
    public void createPlaylist(String name) {
        String sql = "INSERT INTO playlists (name) VALUES (?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, name);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Method to retrieve all playlists
    public List<Playlist> getAllPlaylists() {
        List<Playlist> playlists = new ArrayList<>();
        String sql = "SELECT * FROM playlists";
        try (Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Playlist playlist = new Playlist(rs.getInt("playlist_id"), rs.getString("name"));
                playlists.add(playlist);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return playlists;
    }

    // Method to add a song to a playlist
    public void addSongToPlaylist(int playlistId, int songId) {
        String sql = "INSERT INTO playlist_songs (playlist_id, song_id) VALUES (?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, playlistId);
            ps.setInt(2, songId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Method to get songs by playlist ID
    public List<Song> getSongsByPlaylistId(int playlistId) {
        List<Song> songs = new ArrayList<>();
        String sql = "SELECT s.* FROM songs s INNER JOIN playlist_songs ps ON s.song_id = ps.song_id WHERE ps.playlist_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, playlistId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Song song = new Song(
                            rs.getInt("song_id"),
                            rs.getString("title"),
                            rs.getInt("artist_id"),
                            rs.getString("genre"),
                            rs.getString("file_path")
                    );
                    songs.add(song);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return songs;
    }
     public void deletePlaylist(int playlistId) {
        String deletePlaylistSQL = "DELETE FROM playlists WHERE playlist_id = ?";
        String deletePlaylistSongsSQL = "DELETE FROM playlist_songs WHERE playlist_id = ?";
        
        try {
            // First, delete songs associated with the playlist
            try (PreparedStatement ps = conn.prepareStatement(deletePlaylistSongsSQL)) {
                ps.setInt(1, playlistId);
                ps.executeUpdate();
            }
            // Then, delete the playlist itself
            try (PreparedStatement ps = conn.prepareStatement(deletePlaylistSQL)) {
                ps.setInt(1, playlistId);
                ps.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
      public void removeSongFromPlaylist(int playlistId, int songId) {
        String sql = "DELETE FROM playlist_songs WHERE playlist_id = ? AND song_id = ?";
        
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, playlistId);
            ps.setInt(2, songId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
