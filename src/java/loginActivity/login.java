/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package loginActivity;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.directory.Attributes;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import reqfiles.LDAP;
import reqfiles.Utilities;

/**
 *
 * @author HaRshA CriMiNaLhEarT
 */
public class login extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.lang.ClassNotFoundException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException{
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            String username =request.getParameter("u_name");
            String upassword =request.getParameter("u_password");
            String userSource="";
            System.out.println(username+"\t"+upassword);
            HttpSession session =request.getSession();
            Utilities utils =new Utilities();
            Connection conn = utils.NewConnection("db_HF");
            CallableStatement clbs = conn.prepareCall("{call logincheck(?,?)}");
            clbs.setString(1,username);
            clbs.setString(2,upassword);
            ResultSet re = clbs.executeQuery();
            if(re.next()){
                System.out.println(">>>>>>inside resultSet");
                userSource =re.getString("userSource");
                session.setAttribute("usertype",re.getString(5));
                session.setAttribute("username",username);
            String url="",message="";
            if("LDAP".equalsIgnoreCase(userSource))
            {    
                    boolean isvalid=false;
                    LDAP ldap = new LDAP();
                    Attributes att = ldap.authenticateUser(username, upassword, "masgmr.com", "10.45.12.10", "DC=masgmr,DC=com");
                        if (att == null)
                        {
                            isvalid=false;
                            url="Home.jsp";
                            message="Sorry your user is invalid or password incorrect";
                            System.out.println(message);
                            session.setAttribute("message",message);
                        }
                        else
                        {
                            String s = att.get("givenName").toString();
                             //System.out.println("GIVEN NAME=" + s);
                            isvalid=true;
                            url="portal.jsp";
                            response.sendRedirect("Home.jsp");
                        }
                 }else{
                          response.sendRedirect("portal.jsp");
            }
            }
            else{
                              response.sendRedirect("Home.jsp");
            }
        } catch (SQLException ex) {
        } finally {
            out.close();
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
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
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

