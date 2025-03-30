package PlaylistManager;

import dao.PlaylistDAO;
import dao.SongDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Playlist;
import model.Song;

/**
 *
 * @author nguye
 */
public class PlaylistServlet extends HttpServlet {

    private PlaylistDAO playlistDAO;
    private SongDAO songDAO;

    @Override
    public void init() {
        playlistDAO = new PlaylistDAO();
        songDAO = new SongDAO();
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet PlaylistServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PlaylistServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        if (action == null) {
            action = "view";
        }

        switch (action) {
            case "view":
                showPlaylists(request, response);
                break;
            case "addSong":
                showAddSongForm(request, response);
                break;
            case "deletePlaylist":
                deletePlaylist(request, response);
                break;
            case "removeSong":
                removeSongFromPlaylist(request, response);
                break;
            default:
                showPlaylists(request, response);
                break;
        }
    }

    private void showPlaylists(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        List<Playlist> playlists = playlistDAO.getAllPlaylists();
        request.setAttribute("playlists", playlists);
        request.getRequestDispatcher("createPlaylist.jsp").forward(request, response);
    }

    // Show form to add a song to a playlist
    private void showAddSongForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        List<Song> songs = songDAO.getAllSongs();
        List<Playlist> playlists = playlistDAO.getAllPlaylists();
        request.setAttribute("songs", songs);
        request.setAttribute("playlists", playlists);
        request.getRequestDispatcher("createPlaylist.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");

        switch (action) {
            case "create":
                createPlaylist(request, response);
                break;
            case "addSong":
                addSongToPlaylist(request, response);
                break;
            default:
                response.sendRedirect("playlist?action=view");
                break;
        }
    }
// Method to create a new playlist

    private void createPlaylist(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String name = request.getParameter("name");
        playlistDAO.createPlaylist(name);
        response.sendRedirect("playlist?action=view");
    }

    // Method to add a song to a playlist
    private void addSongToPlaylist(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        int playlistId = Integer.parseInt(request.getParameter("playlistId"));
        int songId = Integer.parseInt(request.getParameter("songId"));
        playlistDAO.addSongToPlaylist(playlistId, songId);
        response.sendRedirect("playlist?action=view");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    private void deletePlaylist(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        int playlistId = Integer.parseInt(request.getParameter("playlistId"));
        playlistDAO.deletePlaylist(playlistId);
        response.sendRedirect("playlist?action=view");
    }

    private void removeSongFromPlaylist(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        int playlistId = Integer.parseInt(request.getParameter("playlistId"));
        int songId = Integer.parseInt(request.getParameter("songId"));
        playlistDAO.removeSongFromPlaylist(playlistId, songId);
        response.sendRedirect("playlist?action=view");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
