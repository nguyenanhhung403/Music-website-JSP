package ArtistManagement;

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
public class ArtistDetailsServlet extends HttpServlet {
private ArtistDAO artistDAO;
    private SongDAO songDAO;

    @Override
    public void init() throws ServletException {
        artistDAO = new ArtistDAO();  // Initialize Artist DAO
        songDAO = new SongDAO();      // Initialize Song DAO
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
            out.println("<title>Servlet ArtistDetailsServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ArtistDetailsServlet at " + request.getContextPath() + "</h1>");
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
        // Get the artistId from the query parameters
        int artistId = Integer.parseInt(request.getParameter("artistId"));

        // Fetch artist details
        Artist artist = artistDAO.getArtistById(artistId);

        // Fetch all songs by this artist
        List<Song> artistSongs = songDAO.getSongsByArtist(artistId);

        // Store artist and their songs in the request scope
        request.setAttribute("artist", artist);
        request.setAttribute("artistSongs", artistSongs);

        // Forward the request to artistDetails.jsp
        request.getRequestDispatcher("artists/artistDetails.jsp").forward(request, response);
    } catch (ClassNotFoundException ex) {
        Logger.getLogger(ArtistDetailsServlet.class.getName()).log(Level.SEVERE, null, ex);
    } catch (SQLException ex) {
        Logger.getLogger(ArtistDetailsServlet.class.getName()).log(Level.SEVERE, null, ex);
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
