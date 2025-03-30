package controller;

import dao.ArtistDAO;
import dao.SongDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Artist;
import model.Song;

/**
 *
 * @author nguye
 */
public class ArtistSongServlet extends HttpServlet {
private SongDAO songDAO;
private ArtistDAO artistDAO;
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
     @Override
    public void init() throws ServletException {
        songDAO = new SongDAO(); 
         artistDAO = new ArtistDAO();// Initialize the DAO
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ArtistSongServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ArtistSongServlet at " + request.getContextPath() + "</h1>");
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
    try {
        int artistId = Integer.parseInt(request.getParameter("artistId"));  // Get artistId from request

        // Fetch the list of songs for the given artist
        List<Song> songList = songDAO.getSongsByArtist(artistId);
        Artist artist = artistDAO.getArtistById(artistId);
         request.setAttribute("artist", artist);
        // Set the song list as a request attribute and forward to JSP
        request.setAttribute("songList", songList);
        request.getRequestDispatcher("artistSongs.jsp").forward(request, response);
    } catch (ClassNotFoundException ex) {
        Logger.getLogger(ArtistSongServlet.class.getName()).log(Level.SEVERE, null, ex);
    } catch (SQLException ex) {
        Logger.getLogger(ArtistSongServlet.class.getName()).log(Level.SEVERE, null, ex);
    }
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
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
