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
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import reqfiles.Utilities;

/**
 *
 * @author HaRshA CriMiNaLhEarT
 */
public class forcedNewlog extends HttpServlet {

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
            Utilities util = new Utilities();
            Connection conn = util.NewConnection("db_HF");
            String aircraft_reg = request.getParameter("aircraft_reg");
            int line = Integer.parseInt(request.getParameter("line")) ;
            String customer = request.getParameter("customer");
            String model = request.getParameter("model");
            String check = request.getParameter("check");
            int tat = Integer.parseInt(request.getParameter("tat"));
            String total = request.getParameter("date");
            java.sql.Date date = java.sql.Date.valueOf(total);
            String ses = request.getParameter("ses");
            String status = request.getParameter("status");
            CallableStatement cstm = conn.prepareCall("{call mp_Forceinsert(?,?,?,?,?,?,?,?,?)}");
            cstm.setString(1,aircraft_reg);
            cstm.setInt(2,line);
            cstm.setString(3,customer);
            cstm.setString(4,model);
            cstm.setString(5,check);
            cstm.setDate(6,date);
            cstm.setInt(7,tat);
            cstm.setString(8,ses);
            cstm.setString(9,status);
            cstm.executeUpdate();
            response.sendRedirect("newlog.jsp?url=Forcedly Submitted");
        } catch (SQLException ex) {
            Logger.getLogger(forcedNewlog.class.getName()).log(Level.SEVERE, null, ex);
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
