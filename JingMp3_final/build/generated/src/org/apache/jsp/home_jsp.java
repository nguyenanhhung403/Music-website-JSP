package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import javax.servlet.http.HttpSession;
import model.User;
import javax.servlet.http.HttpSession;
import model.User;

public final class home_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(2);
    _jspx_dependants.add("/partials/sider.jsp");
    _jspx_dependants.add("/partials/search.jsp");
  }

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

      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        \r\n");
      out.write("        \r\n");
      out.write("        \r\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n");
      out.write("        <script src=\"https://cdn.tailwindcss.com\"></script>\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css\">\r\n");
      out.write("        <title>Jing Mp3</title>\r\n");
      out.write("    </head>\r\n");
      out.write("    <body class=\"bg-[#292929]\">\r\n");
      out.write("        ");

            User user = (User) session.getAttribute("user");
        
      out.write("\r\n");
      out.write("        <div class=\"container mx-auto\">\r\n");
      out.write("            <div class=\"flex items-start\">\r\n");
      out.write("                <div class=\"w-[280px]\">\r\n");
      out.write("                    ");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        \n");
      out.write("        \n");
      out.write("        \n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        <script src=\"https://cdn.tailwindcss.com\"></script>\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css\">\n");
      out.write("        <title>Jing mp3 - Sider</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");

            User currentUser = (User) session.getAttribute("user");
        
      out.write("\n");
      out.write("        <div class=\"bg-[#212121] h-[100vh] fixed w-[280px]\">\n");
      out.write("            <div class=\"bg-[#404040] py-[25px] px-[20px] flex justify-center items-center\">\n");
      out.write("                <a href=\"home.jsp\">\n");
      out.write("                    <img src=\"images/logo-2.png\" alt=\"Logo\" class=\"h-[80px] w-auto\"/>\n");
      out.write("                </a>\n");
      out.write("                <a href=\"home.jsp\">\n");
      out.write("                    <div class=\"text-[#07A1C7] ml-5 text-[30px] font-[900]\">Jing mp3</div>\n");
      out.write("                </a>                \n");
      out.write("            </div>\n");
      out.write("            <nav class=\"pt-[30px] px-[20px] \">\n");
      out.write("                <ul>\n");
      out.write("                    <li class=\"mb-[30px]\">\n");
      out.write("                        <a class=\"flex items-center text-white\" href=\"home.jsp\">\n");
      out.write("                            <i class=\"text-[20px] mr-[20px] icon fa-solid fa-house\"></i>\n");
      out.write("                            <span class=\"text-[16px] font-[700]\">\n");
      out.write("                                Trang Chủ\n");
      out.write("                            </span>\n");
      out.write("                        </a>\n");
      out.write("                    </li>\n");
      out.write("                    <li class=\"mb-[30px]\">\n");
      out.write("                        <a class=\"flex items-center text-white\" href=\"songlist.jsp\">\n");
      out.write("                            <i class=\"text-[20px] mr-[20px] icon fa-sharp fa-solid fa-music\"></i>\n");
      out.write("                            <span class=\"text-[16px] font-[700]\">\n");
      out.write("                                Danh Mục Bài Hát\n");
      out.write("                            </span>\n");
      out.write("                        </a>\n");
      out.write("                    </li>\n");
      out.write("                    <li class=\"mb-[30px]\">\n");
      out.write("                        <a class=\"flex items-center text-white\" href=\"artists\">\n");
      out.write("                            <i class=\"text-[20px] mr-[20px] icon fa-solid fa-podcast\"></i>\n");
      out.write("                            <span class=\"text-[16px] font-[700]\">\n");
      out.write("                                Ca sĩ\n");
      out.write("                            </span>\n");
      out.write("                        </a>\n");
      out.write("                    </li>\n");
      out.write("                    ");
 if (currentUser != null) { 
      out.write("\n");
      out.write("                        <li class=\"mb-[30px]\">\n");
      out.write("                            <a class=\"flex items-center text-white\" href=\"createPlaylist.jsp\">\n");
      out.write("                                <i class=\"text-[20px] mr-[20px] icon fa-solid fa-podcast\"></i>\n");
      out.write("                                <span class=\"text-[16px] font-[700]\">\n");
      out.write("                                    Tạo mới Danh sách yêu thích\n");
      out.write("</span>\n");
      out.write("                            </a>\n");
      out.write("                        </li>\n");
      out.write("                        <li class=\"mb-[30px]\">\n");
      out.write("                            <a class=\"flex items-center text-white\" href=\"logout.jsp\">\n");
      out.write("                                <i class=\"text-[20px] mr-[20px] icon fa-solid fa-podcast\"></i>\n");
      out.write("                                <span class=\"text-[16px] font-[700]\">\n");
      out.write("                                    Đăng xuất\n");
      out.write("                                </span>\n");
      out.write("                            </a>\n");
      out.write("                        </li>\n");
      out.write("                    ");
 } else { 
      out.write("\n");
      out.write("                        <li class=\"mb-[30px]\">\n");
      out.write("                            <a class=\"flex items-center text-white\" href=\"login.jsp\">\n");
      out.write("                                <i class=\"text-[20px] mr-[20px] icon fa-solid fa-user\"></i>\n");
      out.write("                                <span class=\"text-[16px] font-[700]\">\n");
      out.write("                                    Đăng Nhập\n");
      out.write("                                </span>\n");
      out.write("                            </a>\n");
      out.write("                        </li>\n");
      out.write("                        <li class=\"mb-[30px]\">\n");
      out.write("                            <a class=\"flex items-center text-white\" href=\"register.jsp\">\n");
      out.write("                                <i class=\"text-[20px] mr-[20px] icon fa-solid fa-user-plus\"></i>\n");
      out.write("                                <span class=\"text-[16px] font-[700]\">\n");
      out.write("                                    Đăng Ký\n");
      out.write("                                </span>\n");
      out.write("                            </a>\n");
      out.write("                        </li>\n");
      out.write("                    ");
 } 
      out.write("\n");
      out.write("                </ul> \n");
      out.write("            </nav>\n");
      out.write("        </div>   \n");
      out.write("    </body>\n");
      out.write("</html>");
      out.write("\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"ml-[20px] flex-1\">\r\n");
      out.write("                    ");
      out.write('\n');
      out.write('\n');
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("     <head>\n");
      out.write("        \n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        <link href=\"https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css\" rel=\"stylesheet\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css\">\n");
      out.write("        <title>Jing mp3 - Search</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <form  action=\"search\" method=\"get\" class=\"bg-[#212121] rounded-[50px] mt-[20px] sticky top-[20px] left-[20px] z-[999] py-[15px] px-[30px] flex items-center\">\n");
      out.write("            <input\n");
      out.write("              type=\"text\"\n");
      out.write("              name=\"query\"\n");
      out.write("              placeholder=\"Tìm kiếm bài hát, ca sĩ...\"\n");
      out.write("              class=\"order-2 text-[16px] font-[600] text-white bg-transparent outline-none flex-1\"\n");
      out.write("            />\n");
      out.write("            <button\n");
      out.write("              type=\"submit\"\n");
      out.write("              class=\"text-[22px] text-white order-1 mr-[20px]\"\n");
      out.write("            >\n");
      out.write("              <i class=\"fas fa-magnifying-glass\"></i>\n");
      out.write("            </button>\n");
      out.write("        </form>\n");
      out.write("    </body>\n");
      out.write("</html>");
      out.write(" \r\n");
      out.write("                    <main class=\"mt-[30px] mb-[120px]\">\r\n");
      out.write("                        <div class=\"flex items-start\">\r\n");
      out.write("                            <div class=\"w-[534px]\">\r\n");
      out.write("                                <div class=\"w-full flex items-center rounded-[15px] bg-cover\" style=\"background-image: url('images/background-1.png');\">\r\n");
      out.write("                                    \r\n");
      out.write("                                    <div class=\"flex-1 ml-[30px] mr-[34px]\">\r\n");
      out.write("                                        <div class=\"text-[32px] font-[700] text-white mb-[6px]\">\r\n");
      out.write("                                            Nhạc EDM\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                        <div class=\"text-[14px] font-[500] text-white\">\r\n");
      out.write("                                            Top 100 Nhạc Electronic/Dance Âu Mỹ là danh sách 100 ca khúc hot nhất hiện tại của thể loại Top 100 Nhạc Electronic/Dance Âu Mỹ\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                    <div class=\"w-[215px] mr-[22px] mt-[48px]\">\r\n");
      out.write("                                        <img src=\"images/image-2.png\" alt=\"Nhạc EDM\" class=\"w-full h-auto\" />\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                </div>\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <div class=\"flex-1 ml-[20px]\">\r\n");
      out.write("                                <div class=\"text-[24px] font-[700] text-[#EFEEE0] mb-[20px]\">Nghe nhiều</div>\r\n");
      out.write("                                <div class=\"grid grid-cols-1 gap-[12px]\">\r\n");
      out.write("                                    <div class=\"bg-[#212121] rounded-[15px] flex items-center p-[10px]\">\r\n");
      out.write("                                        <div class=\"w-[76px] rounded-[10px] aspect-square truncate mr-[10px]\">\r\n");
      out.write("                                            <img src=\"images/cat-doi-noi-sau.jpg\" alt=\"Cắt Đôi Nỗi Sầu\" class=\"w-full h-full object-cover\"/>\r\n");
      out.write("                                        </div>\r\n");
      out.write("<div class=\"flex-1\">\r\n");
      out.write("                                            <div class=\"mb-[2px]\">\r\n");
      out.write("                                                <a href=\"\" class=\"text-[16px] font-[600] text-white\">Cắt Đôi Nỗi Sầu</a>\r\n");
      out.write("                                            </div>\r\n");
      out.write("                                            <div class=\"text-[12px] font-[400] text-[#FFFFFF80] mb-[5px]\">\r\n");
      out.write("                                                Tăng Duy Tân\r\n");
      out.write("                                            </div>\r\n");
      out.write("                                            <div class=\"text-[12px] font-[400] text-white\">\r\n");
      out.write("                                                24,500 lượt nghe\r\n");
      out.write("                                            </div>\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                        <audio controls>\r\n");
      out.write("                                            <source src=\"songs/CatDoiNoiSau.mp3\" type=\"audio/mpeg\">\r\n");
      out.write("                                        </audio>\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                    <div class=\"bg-[#212121] rounded-[15px] flex items-center p-[10px]\">\r\n");
      out.write("                                        <div class=\"w-[76px] rounded-[10px] aspect-square truncate mr-[10px]\">\r\n");
      out.write("                                            <img src=\"images/ngay-mai-nguoi-ta-lay-chong.jpg\" alt=\"Ngày Mai Người Ta Lấy Chồng\" class=\"w-full h-full object-cover\"/>\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                        <div class=\"flex-1\">\r\n");
      out.write("                                            <div class=\"mb-[2px]\">\r\n");
      out.write("                                                <a href=\"\" class=\"text-[16px] font-[600] text-white\">Ngày Mai Người Ta Lấy Chồng</a>\r\n");
      out.write("                                            </div>\r\n");
      out.write("                                            <div class=\"text-[12px] font-[400] text-[#FFFFFF80] mb-[5px]\">\r\n");
      out.write("                                                Thành Đạt, Đông Thiên Đức\r\n");
      out.write("                                            </div>\r\n");
      out.write("                                            <div class=\"text-[12px] font-[400] text-white\">\r\n");
      out.write("                                                20,500 lượt nghe\r\n");
      out.write("                                            </div>\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                        <audio controls>\r\n");
      out.write("                                            <source src=\"songs/NgayMaiNguoiTaLayChongCover.mp3\" type=\"audio/mpeg\">\r\n");
      out.write("                                        </audio>\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                    <div class=\"bg-[#212121] rounded-[15px] flex items-center p-[10px]\">\r\n");
      out.write("                                        <div class=\"w-[76px] rounded-[10px] aspect-square truncate mr-[10px]\">\r\n");
      out.write("                                            <img src=\"images/tat-ca-hoac-khong-la-gi-ca.jpg\" alt=\"Tất Cả Hoặc Không Là Gì Cả\" class=\"w-full h-full object-cover\"/>\r\n");
      out.write("                                        </div>\r\n");
      out.write("<div class=\"flex-1\">\r\n");
      out.write("                                            <div class=\"mb-[2px]\">\r\n");
      out.write("                                                <a href=\"\" class=\"text-[16px] font-[600] text-white\">Tất Cả Hoặc Không Là Gì Cả</a>\r\n");
      out.write("                                            </div>\r\n");
      out.write("                                            <div class=\"text-[12px] font-[400] text-[#FFFFFF80] mb-[5px]\">\r\n");
      out.write("                                                Cao Thái Sơn, Đông Thiên Đức\r\n");
      out.write("                                            </div>\r\n");
      out.write("                                            <div class=\"text-[12px] font-[400] text-white\">\r\n");
      out.write("                                                18,800 lượt nghe\r\n");
      out.write("                                            </div>\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                         <audio controls>\r\n");
      out.write("                                            <source src=\"songs/tatcahoackhonglagica.mp3\" type=\"audio/mpeg\">\r\n");
      out.write("                                        </audio>\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                </div>                                \r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"mt-[30px]\">\r\n");
      out.write("                            <div class=\"text-[24px] font-[700] text-[#EFEEE0] mb-[20px]\">Danh Mục Nổi Bật</div>\r\n");
      out.write("                            <div class=\"grid grid-cols-5 gap-[20px]\">\r\n");
      out.write("                                <div class=\"\">\r\n");
      out.write("                                    <a href=\"nhactre.jsp\">\r\n");
      out.write("                                        <div class=\"w-full aspect-square truncate rounded-[15px] mb-[10px]\">\r\n");
      out.write("                                            <img src=\"images/nhac-tre.jpg\" alt=\"Nhạc trẻ\" class=\"w-full h-full object-cover\"/>\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                        <div class=\"text-[14px] font-[700] text-white mb-[10px] line-clamp-1\">\r\n");
      out.write("                                            Nhạc trẻ\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                        <div class=\"text-[12px] font-[400] text-[#FFFFFF80] line-clamp-1\">\r\n");
      out.write("                                            Tổng hợp nhạc Nhạc trẻ mới nhất\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                    </a>\r\n");
      out.write("                                </div>\r\n");
      out.write("                                <div class=\"\">\r\n");
      out.write("                                    <a href=\"bolero.jsp\">\r\n");
      out.write("                                        <div class=\"w-full aspect-square truncate rounded-[15px] mb-[10px]\">\r\n");
      out.write("                                            <img src=\"images/bolero.jpg\" alt=\"Bolero\" class=\"w-full h-full object-cover\"/>\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                        <div class=\"text-[14px] font-[700] text-white mb-[10px] line-clamp-1\">\r\n");
      out.write("                                            Bolero\r\n");
      out.write("                                        </div>\r\n");
      out.write("<div class=\"text-[12px] font-[400] text-[#FFFFFF80] line-clamp-1\">\r\n");
      out.write("                                            Tổng hợp nhạc Bolero mới nhất\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                    </a>\r\n");
      out.write("                                </div>\r\n");
      out.write("                                <div class=\"\">\r\n");
      out.write("                                    <a href=\"remix.jsp\">\r\n");
      out.write("                                        <div class=\"w-full aspect-square truncate rounded-[15px] mb-[10px]\">\r\n");
      out.write("                                            <img src=\"images/remix.jpg\" alt=\"Remix\" class=\"w-full h-full object-cover\"/>\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                        <div class=\"text-[14px] font-[700] text-white mb-[10px] line-clamp-1\">\r\n");
      out.write("                                            Remix\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                        <div class=\"text-[12px] font-[400] text-[#FFFFFF80] line-clamp-1\">\r\n");
      out.write("                                            Tổng hợp nhạc Remix mới nhất\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                    </a>\r\n");
      out.write("                                </div>\r\n");
      out.write("                                <div class=\"\">\r\n");
      out.write("                                    <a href=\"hiphop.jsp\">\r\n");
      out.write("                                        <div class=\"w-full aspect-square truncate rounded-[15px] mb-[10px]\">\r\n");
      out.write("                                            <img src=\"images/hiphop.jpg\" alt=\"Hip-Hop\" class=\"w-full h-full object-cover\"/>\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                        <div class=\"text-[14px] font-[700] text-white mb-[10px] line-clamp-1\">\r\n");
      out.write("                                            Hip-Hop \r\n");
      out.write("                                        </div>\r\n");
      out.write("                                        <div class=\"text-[12px] font-[400] text-[#FFFFFF80] line-clamp-1\">\r\n");
      out.write("                                            Tổng hợp nhạc Hip-Hop trẻ mới nhất\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                    </a>\r\n");
      out.write("                                </div>\r\n");
      out.write("                                <div class=\"\">\r\n");
      out.write("                                    <a href=\"latin.jsp\">\r\n");
      out.write("                                        <div class=\"w-full aspect-square truncate rounded-[15px] mb-[10px]\">\r\n");
      out.write("                                            <img src=\"images/latin.jpg\" alt=\"Latin\" class=\"w-full h-full object-cover\"/>\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                        <div class=\"text-[14px] font-[700] text-white mb-[10px] line-clamp-1\">\r\n");
      out.write("                                            Latin\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                        <div class=\"text-[12px] font-[400] text-[#FFFFFF80] line-clamp-1\">\r\n");
      out.write("                                            Tổng hợp nhạc Latin trẻ mới nhất\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                    </a>\r\n");
      out.write("</div>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </main>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>         \r\n");
      out.write("        </div>\r\n");
      out.write("    </body>\r\n");
      out.write("      \r\n");
      out.write("    <script src=\"JavaScript/javascript.js\"></script>\r\n");
      out.write("</html>");
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
