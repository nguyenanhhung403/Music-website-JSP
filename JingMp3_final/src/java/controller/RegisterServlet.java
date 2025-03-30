package controller;
import dao.UserDAO;
import model.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author nguye
 */
public class RegisterServlet extends HttpServlet {

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
            out.println("<title>Servlet RegisterServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterServlet at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirm_password");
        String email = request.getParameter("email");

        // Validate inputs
        if (!password.equals(confirmPassword)) {
            request.setAttribute("errorMessage", "Mật khẩu và xác nhận mật khẩu không khớp.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
    }
        
        
        try {
        UserDAO userDAO = new UserDAO();
        if (userDAO.isUsernameOrEmailTaken(username, email)) {
            request.setAttribute("errorMessage", "Tên người dùng hoặc email đã được sử dụng.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        // Nếu không bị trùng, thêm user vào cơ sở dữ liệu
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setEmail(email);

        userDAO.addUser(user);
        request.setAttribute("successMessage", "Bạn đã đăng ký thành công! Bạn có muốn quay về trang đăng nhập không?");
        request.getRequestDispatcher("register.jsp").forward(request, response);

    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
        request.setAttribute("errorMessage", "Đã xảy ra lỗi khi đăng ký tài khoản.");
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }
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
