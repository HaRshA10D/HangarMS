/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package loginActivity;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import reqfiles.Utilities;

/**
 *
 * @author HaRshA CriMiNaLhEarT
 */
public class pieChart extends HttpServlet {

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
            String udate2 = request.getParameter("date2");
            String umonth2 = request.getParameter("month2");
            String uyear2 = request.getParameter("year2");
            String inDate = uyear+"-"+umonth+"-"+udate;
            String outDate = uyear2+"-"+umonth2+"-"+udate2;
            java.sql.Date fromDate = java.sql.Date.valueOf(inDate);
            java.sql.Date toDate = java.sql.Date.valueOf(outDate);
            int line = Integer.parseInt(request.getParameter("line"));
            CallableStatement cstm = conn.prepareCall("{call mp_piechartData(?,?,?)}");
            cstm.setDate(2,fromDate);
            cstm.setDate(3,toDate);
            cstm.setInt(1,line);
            ResultSet rs = cstm.executeQuery();
            System.out.println(rs.next());
            String occupied = Integer.toString(rs.getInt(1));
            String free = Integer.toString(rs.getInt(2));
            System.out.println(occupied+" dd"+free);
            HttpSession session = request.getSession();
            session.setAttribute("occupied",occupied);
            session.setAttribute("free",free);
            response.sendRedirect("pieChart.jsp");
        }catch(SQLException e){
            
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
