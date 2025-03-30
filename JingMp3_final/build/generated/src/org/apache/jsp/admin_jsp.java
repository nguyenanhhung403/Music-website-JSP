package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class admin_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write('\n');
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"vi\">\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"UTF-8\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("    <title>Admin - Quản lý người dùng và nhạc</title>\n");
      out.write("    <style>\n");
      out.write("        .dropdown {\n");
      out.write("    position: relative;\n");
      out.write("    display: inline-block;\n");
      out.write("}\n");
      out.write("\n");
      out.write("/* Hide the dropdown menu by default */\n");
      out.write(".dropdown-menu {\n");
      out.write("    display: none;\n");
      out.write("    position: absolute;\n");
      out.write("    background-color: #f9f9f9;\n");
      out.write("    box-shadow: 0px 8px 16px rgba(0,0,0,0.2);\n");
      out.write("    z-index: 1;\n");
      out.write("    list-style: none;\n");
      out.write("    padding: 0;\n");
      out.write("    margin: 0;\n");
      out.write("}\n");
      out.write("\n");
      out.write("/* Style the individual items in the dropdown */\n");
      out.write(".dropdown-menu li {\n");
      out.write("    padding: 8px 16px;\n");
      out.write("}\n");
      out.write("\n");
      out.write("/* Style the links in the dropdown */\n");
      out.write(".dropdown-menu li a {\n");
      out.write("    color: black;\n");
      out.write("    text-decoration: none;\n");
      out.write("    display: block;\n");
      out.write("}\n");
      out.write("\n");
      out.write("/* Change color when hovering over an option */\n");
      out.write(".dropdown-menu li a:hover {\n");
      out.write("    background-color: #ddd;\n");
      out.write("}\n");
      out.write("\n");
      out.write("/* Show the dropdown menu when hovering over the container */\n");
      out.write(".dropdown:hover .dropdown-menu {\n");
      out.write("    display: block;\n");
      out.write("}\n");
      out.write("    </style>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    <!-- Header -->\n");
      out.write("    <header>\n");
      out.write("        <h1>Trang quản trị - Jingmp3</h1>\n");
      out.write("        <nav>\n");
      out.write("            <ul>\n");
      out.write("                <li><a href=\"home.jsp\">Trang chủ</a></li>\n");
      out.write("                <li><a href=\"logout.jsp\">Đăng xuất</a></li>\n");
      out.write("            </ul>\n");
      out.write("        </nav>\n");
      out.write("        \n");
      out.write("<ul>\n");
      out.write("    <!-- Quản lý người dùng -->\n");
      out.write("    <li><a href=\"manageUsers\">Quản lý người dùng</a></li>\n");
      out.write("\n");
      out.write("    <!-- Quản lý nhạc dropdown -->\n");
      out.write("    <li class=\"dropdown\">\n");
      out.write("        <a href=\"#\" class=\"dropdown-toggle\">Quản lý nhạc</a>\n");
      out.write("        <ul class=\"dropdown-menu\">\n");
      out.write("            <li><a href=\"songManagement\">Quản lý nhạc</a></li>\n");
      out.write("            <li><a href=\"artistManagement\">Quản lý ca sĩ</a></li>\n");
      out.write("        </ul>\n");
      out.write("    </li>\n");
      out.write("</ul>\n");
      out.write("        \n");
      out.write("    </header>\n");
      out.write("\n");
      out.write("    <!-- Admin Dashboard -->\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("            \n");
      out.write("    <!-- Footer -->\n");
      out.write("    <footer>\n");
      out.write("        <p>Bản quyền © 2024 Jingmp3. Mọi quyền được bảo lưu.</p>\n");
      out.write("    </footer>\n");
      out.write("</body>\n");
      out.write("</html>\n");
      out.write("\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
