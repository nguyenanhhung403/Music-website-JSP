package ArtistManagement;

import dao.ArtistDAO;
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
import model.Artist;

/**
 *
 * @author nguye
 */
@MultipartConfig 
public class ArtistManagementServlet extends HttpServlet {
            private ArtistDAO artistDAO;    
            
            @Override
    public void init() throws ServletException {
        artistDAO = new ArtistDAO();
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
            out.println("<title>Servlet ArtistManagementServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ArtistManagementServlet at " + request.getContextPath() + "</h1>");
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

        if (action == null) {
            action = "";
        }

        try {
            switch (action) {
                case "new":
                    showNewForm(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "delete":
                    deleteArtist(request, response);
                    break;
                default:
                    listArtists(request, response);
                    break;
            }
        } catch (SQLException | ClassNotFoundException ex) {
            throw new ServletException(ex);
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

        if (action == null) {
            action = "";
        }

        try {
            switch (action) {
                case "insert":
                    insertArtist(request, response);
                    break;
                case "update":
                    updateArtist(request, response);
                    break;
                default:
                    listArtists(request, response);
                    break;
            }
        } catch (SQLException | ClassNotFoundException ex) {
            throw new ServletException(ex);
        }
    }
    
    
 private void listArtists(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ClassNotFoundException, IOException, ServletException {
        List<Artist> artistList = artistDAO.getAllArtists();
        request.setAttribute("artist", artistList);
        request.getRequestDispatcher("manageArtists.jsp").forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("artistForm.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException, ClassNotFoundException {
        int artistId = Integer.parseInt(request.getParameter("artistId"));
        Artist existingArtist = artistDAO.getArtistById(artistId);
        request.setAttribute("artist", existingArtist);
        request.getRequestDispatcher("artistForm.jsp").forward(request, response);
    }

    private void insertArtist(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ClassNotFoundException, ServletException {
       request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");
        String name = request.getParameter("name");
    String bio = request.getParameter("bio");
    String genre = request.getParameter("genre");

    // Đường dẫn lưu trữ file
    String uploadPath = "C:\\Users\\nguye\\Desktop\\JingMp3_update\\JingMp3\\JingMp3_final\\web\\images\\avatars";
    Part filePart = request.getPart("avatar");
    String fileName = null;

    if (filePart != null && filePart.getSize() > 0) {
        fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        filePart.write(uploadPath + File.separator + fileName);
    }

    String filePath = (fileName != null) ? "images/avatars/" + fileName : null;

    Artist newArtist = new Artist(name, bio, genre, filePath);
    artistDAO.addArtist(newArtist);
    response.sendRedirect("artistManagement");
    }

   private void updateArtist(HttpServletRequest request, HttpServletResponse response)
        throws SQLException, IOException, ClassNotFoundException, ServletException {
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");

    // Lấy các tham số từ request
      int artistId = Integer.parseInt(request.getParameter("artistId"));
    String name = request.getParameter("name");
    String bio = request.getParameter("bio");
    String genre = request.getParameter("genre");

    // Đường dẫn lưu trữ file
    String uploadPath = "C:\\Users\\nguye\\Desktop\\JingMp3_update\\JingMp3\\JingMp3_final\\web\\images\\avatars";
    Part filePart = request.getPart("avatar");
    String fileName = null;

    if (filePart != null && filePart.getSize() > 0) {
        fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        filePart.write(uploadPath + File.separator + fileName);
    }

    // Kiểm tra xem người dùng có tải lên avatar mới hay không
    String filePath = (fileName != null) ? "images/avatars/" + fileName : null;

    // Cập nhật thông tin nghệ sĩ
    Artist artist = new Artist(artistId, name, bio, genre, filePath);
    artistDAO.updateArtist(artist);

    // Điều hướng về trang quản lý sau khi cập nhật thành công
    response.sendRedirect("artistManagement");
}

    private void deleteArtist(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ClassNotFoundException {
        int artistId = Integer.parseInt(request.getParameter("artistId"));
        artistDAO.deleteArtist(artistId);
        response.sendRedirect("artistManagement");
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
