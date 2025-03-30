package model;

/**
 *
 * @author nguye
 */
public class Song {
    private int songId;
    private String title;
    private int artistId;
    private String genre;
    private String filePath;
    private Artist artist;

    public Song(String title, int artistId, String genre, String filePath) {
        this.title = title;
        this.artistId = artistId;
        this.genre = genre;
        this.filePath = filePath;
    }
    
    
    
    public Song(int songId, String title, int artistId, String genre, String filePath) {
        this.songId = songId;
        this.title = title;
        this.artistId = artistId;
        this.genre = genre;
        this.filePath = filePath;
    }

    public Song() {
    }

    public int getSongId() {
        return songId;
    }

    public void setSongId(int songId) {
        this.songId = songId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getArtistId() {
        return artistId;
    }

    public void setArtistId(int artistId) {
        this.artistId = artistId;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }
public Artist getArtist() {
        return artist; // Thêm getter cho Artist
    }

    public void setArtist(Artist artist) {
        this.artist = artist;
    }
}
