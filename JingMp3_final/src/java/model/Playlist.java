package model;

/**
 *
 * @author nguye
 */
public class Playlist {
     private int playlistId;
    private int userId;
    private String name;

    // Constructors
    public Playlist() {}

    public Playlist(int playlistId, String name) {
        this.playlistId = playlistId;
        this.name = name;
    }

    
    public Playlist(int playlistId, int userId, String name) {
        this.playlistId = playlistId;
        this.userId = userId;
        this.name = name;
    }

    // Getters and Setters
    public int getPlaylistId() {
        return playlistId;
    }

    public void setPlaylistId(int playlistId) {
        this.playlistId = playlistId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
