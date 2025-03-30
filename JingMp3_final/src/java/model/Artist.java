package model;

/**
 *
 * @author nguye
 */
public class Artist {
    private int artistId;
    private String name;
    private String bio;
    private String genre;
    private String filePath;

    public Artist(int artistId, String name, String bio, String genre, String filePath) {
        this.artistId = artistId;
        this.name = name;
        this.bio = bio;
        this.genre = genre;
        this.filePath = filePath;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public Artist(String name, String bio, String genre, String filePath) {
        this.name = name;
        this.bio = bio;
        this.genre = genre;
        this.filePath = filePath;
    }
    
    
    
    public Artist() {}

    public Artist(String name, String bio, String genre) {
        this.name = name;
        this.bio = bio;
        this.genre = genre;
    }

    public Artist(int artistId, String name, String bio, String genre) {
        this.artistId = artistId;
        this.name = name;
        this.bio = bio;
        this.genre = genre;
    }

    // Getters and Setters
    public int getArtistId() {
        return artistId;
    }

    public void setArtistId(int artistId) {
        this.artistId = artistId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBio() {
        return bio;
    }

    public void setBio(String bio) {
        this.bio = bio;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }
}
