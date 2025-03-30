package controller;

import dao.SongDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Song;

/**
 *
 * @author nguye
 */
public class SongServlet extends HttpServlet {
    
        private SongDAO songDAO = new SongDAO();

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SongServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SongServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    
     @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if (action == null) {
            action = "list";
        }
        
        switch (action) {
            case "edit":
        {
            try {
                showEditForm(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(SongServlet.class.getName()).log(Level.SEVERE, null, ex);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(SongServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
                break;
            case "delete":
                deleteSong(request, response);
                break;
            case "list":
            default:
                listSongs(request, response);
                break;
        }
    }
        private void listSongs(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("songs", songDAO.getAllSongs());
        request.getRequestDispatcher("admin.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException, ClassNotFoundException {
        int songId = Integer.parseInt(request.getParameter("id"));
        Song existingSong = songDAO.getSongById(songId);
        request.setAttribute("song", existingSong);
        request.getRequestDispatcher("editSong.jsp").forward(request, response);
    }

    private void deleteSong(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int songId = Integer.parseInt(request.getParameter("id"));
        songDAO.deleteSong(songId);
        response.sendRedirect("SongServlet?action=list");
    }

    @Override
     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        
        switch (action) {
            case "add":
                addSong(request, response);
                break;
            case "update":
                updateSong(request, response);
                break;
        }
    }

     private void addSong(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String title = request.getParameter("title");
        int artistId = Integer.parseInt(request.getParameter("artist_id"));
        String genre = request.getParameter("genre");
        String filePath = request.getParameter("file_path");

        Song newSong = new Song(0, title, artistId, genre, filePath);
        songDAO.addSong(newSong);
        response.sendRedirect("SongServlet?action=list");
    }

    private void updateSong(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int songId = Integer.parseInt(request.getParameter("song_id"));
        String title = request.getParameter("title");
        int artistId = Integer.parseInt(request.getParameter("artist_id"));
        String genre = request.getParameter("genre");
        String filePath = request.getParameter("file_path");

        Song song = new Song(songId, title, artistId, genre, filePath);
        songDAO.updateSong(song);
        response.sendRedirect("SongServlet?action=list");
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
