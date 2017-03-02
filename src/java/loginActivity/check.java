package loginActivity;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.text.ParseException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import reqfiles.Utilities;
/**
 *
 * @author HaRshA CriMiNaLhEarT
 */
public class check extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        try {
             Utilities utils = new Utilities();
             Connection conn = utils.NewConnection("db_HF");
             String udate = request.getParameter("date");
             String umonth = request.getParameter("month");
             String uyear = request.getParameter("year");
             int tat=0;
             try{
             tat = Integer.parseInt(request.getParameter("tat"));
             }catch(NumberFormatException e){
                 response.sendRedirect("portal.jsp");
             }
             String total = uyear+"-"+umonth+"-"+udate;
             System.out.println(total);
             java.sql.Date date = java.sql.Date.valueOf(total);
             String avil="";
             CallableStatement cstm = conn.prepareCall("{call mp_check(?,?)}");
             cstm.setDate(1,date);
             cstm.setInt(2,tat);
             ResultSet rs = cstm.executeQuery();
             while(rs.next()){
                avil += Integer.toString(rs.getInt("Linen"))+"-";
             }
             response.sendRedirect("portal.jsp?url="+avil);
        }catch(Exception e){
            e.printStackTrace();
        } 
        finally {
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
