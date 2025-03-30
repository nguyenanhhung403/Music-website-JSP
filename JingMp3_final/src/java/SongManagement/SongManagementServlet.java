package SongManagement;

import dao.SongDAO;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.Song;

/**
 *
 * @author nguye
 */
@MultipartConfig
public class SongManagementServlet extends HttpServlet {

    private SongDAO songDAO;

    @Override
    public void init() throws ServletException {
        songDAO = new SongDAO(); // Khởi tạo đối tượng DAO
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
            out.println("<title>Servlet SongManagementServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SongManagementServlet at " + request.getContextPath() + "</h1>");
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
        request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }
        
        try {
            switch (action) {
                case "new":
                    showNewForm(request, response); // Hiển thị form thêm bài hát mới
                    break;
                case "edit":
                    showEditForm(request, response); // Hiển thị form chỉnh sửa bài hát
                    break;
                case "delete":
                    deleteSong(request, response); // Xóa bài hát
                    break;
                default:
                    listSongs(request, response); // Hiển thị danh sách bài hát
                    break;
            }
        } catch (Exception e) {
            throw new ServletException(e);
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
        request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        try {
            switch (action) {
                case "add":
                    insertSong(request, response); // Thêm bài hát mới
                    break;
                case "update":
                    updateSong(request, response); // Cập nhật bài hát
                    break;
                default:
                    listSongs(request, response);
                    break;
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
 // Hiển thị danh sách các bài hát
    private void listSongs(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Song> songs = songDAO.getAllSongs();
        request.setAttribute("songs", songs);
        request.getRequestDispatcher("manageSongs.jsp").forward(request, response);
    }

    // Hiển thị form thêm bài hát mới
    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("songForm.jsp").forward(request, response);
    }

    // Hiển thị form chỉnh sửa bài hát
    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        int songId = Integer.parseInt(request.getParameter("songId"));
        Song existingSong = songDAO.getSongById(songId);
        request.setAttribute("song", existingSong);
        request.getRequestDispatcher("songForm.jsp").forward(request, response);
    }

    // Thêm bài hát mới vào cơ sở dữ liệu
   // Thêm bài hát mới vào cơ sở dữ liệu
private void insertSong(HttpServletRequest request, HttpServletResponse response)
        throws IOException, ServletException {
    
    request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");

    String title = request.getParameter("title");
    int artistId = Integer.parseInt(request.getParameter("artist"));
    String genre = request.getParameter("genre");

    // Handle the uploaded file
    Part filePart = request.getPart("filePath");
    String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

    // Set the target directory path
    String uploadDir = "C:\\Users\\nguye\\Desktop\\JingMp3_update\\JingMp3\\JingMp3_final\\web\\songs";
    File uploadDirFile = new File(uploadDir);

    // Ensure the directory exists
    if (!uploadDirFile.exists()) {
        uploadDirFile.mkdirs();
    }

    // Save the file to the specified directory
    String filePath = uploadDir + File.separator + fileName;
    File file = new File(filePath);
    filePart.write(file.getAbsolutePath());

    // Store the relative path in the database (assuming a web-relative path here)
    Song newSong = new Song(title, artistId, genre, "songs/" + fileName);
    songDAO.addSong(newSong);
    response.sendRedirect("songManagement");
}


    // Cập nhật thông tin bài hát
    private void updateSong(HttpServletRequest request, HttpServletResponse response)
        throws IOException, ServletException, SQLException, ClassNotFoundException {
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html;charset=UTF-8");

    // Retrieve the parameters from the form
    int songId = Integer.parseInt(request.getParameter("songId"));
    String title = request.getParameter("title");
    int artistId = Integer.parseInt(request.getParameter("artistId"));
    String genre = request.getParameter("genre");

    // Check if a new file is uploaded
    Part filePart = request.getPart("filePath");
    String filePath;
    if (filePart != null && filePart.getSize() > 0) {
        // A new file is uploaded
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String uploadDir = "C:\\Users\\nguye\\Desktop\\JingMp3_update\\JingMp3\\JingMp3_final\\web\\songs";
        File uploadDirFile = new File(uploadDir);

        // Ensure the directory exists
        if (!uploadDirFile.exists()) {
            uploadDirFile.mkdirs();
        }

        // Save the file and set the new file path
        filePath = "songs/" + fileName;
        File file = new File(uploadDir, fileName);
        filePart.write(file.getAbsolutePath());
    } else {
        // No new file uploaded, use the existing file path from the database
        filePath = songDAO.getSongById(songId).getFilePath();
    }

    // Create a new Song object with the updated information
    Song updatedSong = new Song(songId, title, artistId, genre, filePath);

    // Update the song in the database
    songDAO.updateSong(updatedSong);

    // Redirect to the song management page
    response.sendRedirect("songManagement");
}

    // Xóa bài hát
    private void deleteSong(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        int songId = Integer.parseInt(request.getParameter("songId"));
        songDAO.deleteSong(songId);
        response.sendRedirect("songManagement");
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
