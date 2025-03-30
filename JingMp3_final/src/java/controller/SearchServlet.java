package controller;

import dao.ArtistDAO;
import dao.SongDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
public class SearchServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    private SongDAO songDAO;
    private ArtistDAO artistDAO;
     @Override
    public void init() throws ServletException {
        songDAO = new SongDAO();  // Initialize DAO for songs
        artistDAO = new ArtistDAO();  // Initialize DAO for artists
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SearchServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchServlet at " + request.getContextPath() + "</h1>");
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
            String query = request.getParameter("query");
            
            // Search for songs and artists matching the query
            List<Song> songResults = songDAO.searchSongs(query);
            List<Artist> artistResults = artistDAO.searchArtists(query);
            
            // Fetch songs for each artist
            Map<Integer, List<Song>> artistSongsMap = new HashMap<>();
            for (Artist artist : artistResults) {
                List<Song> artistSongs = songDAO.getSongsByArtist(artist.getArtistId());
                artistSongsMap.put(artist.getArtistId(), artistSongs);  // Store artist's songs in a map
            }
            
            // Store the results in the request scope
            request.setAttribute("songResults", songResults);
            request.setAttribute("artistResults", artistResults);
            request.setAttribute("artistSongsMap", artistSongsMap);  // Store the map with artist's songs
            
            // Forward to a JSP page to display the results
            request.getRequestDispatcher("searchResults.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(SearchServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SearchServlet.class.getName()).log(Level.SEVERE, null, ex);
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
