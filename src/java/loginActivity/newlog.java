/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package loginActivity;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import reqfiles.Utilities;
import reqfiles.insertBean;

/**
 *
 * @author HaRshA CriMiNaLhEarT
 */
public class newlog extends HttpServlet {

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
            String udate = request.getParameter("date");
            String umonth = request.getParameter("month");
            String uyear = request.getParameter("year");
            int tat = Integer.parseInt(request.getParameter("tat"));
            String total = uyear+"-"+umonth+"-"+udate;
            java.sql.Date date = java.sql.Date.valueOf(total);
            String ses = request.getParameter("ses");
            String status = request.getParameter("status");
            java.util.Date today = (java.util.Date) Calendar.getInstance().getTime();
            SimpleDateFormat form = new SimpleDateFormat("yyyy-MM-dd");
            String datet = form.format(today);
            java.util.Date dateNow = (java.util.Date) form.parse(datet);
            java.util.Date date2 = (java.util.Date) form.parse(total);
            if(dateNow.compareTo(date2)>0){
                response.sendRedirect("newlog.jsp?url=You can't insert this record");
            }else{
            CallableStatement cstm = conn.prepareCall("{call mp_insert(?,?,?,?,?,?,?,?,?,?)}");
            cstm.setString(1,aircraft_reg);
            cstm.setInt(2,line);
            cstm.setString(3,customer);
            cstm.setString(4,model);
            cstm.setString(5,check);
            cstm.setDate(6,date);
            cstm.setInt(7,tat);
            cstm.setString(8,ses);
            cstm.registerOutParameter(9,java.sql.Types.INTEGER);
            cstm.setString(10,status);
            cstm.executeUpdate();
            int x = cstm.getInt(9);
            System.out.println(x);
            if(x==2){
                response.sendRedirect("newlog.jsp?url=Sucessfully Submitted");
            }
            else if(x==1) {
                insertBean bean = new insertBean(aircraft_reg, request.getParameter("line"), customer, model, check,total, request.getParameter("tat"), ses, status);
                HttpSession session = request.getSession();
                session.setAttribute("bean", bean);
                response.sendRedirect("overlap.jsp");
            }
            else{
                response.sendRedirect("newlog.jsp?url=Record already exists");
            }
            }
        }catch(SQLException e){
            
        } catch (ParseException ex) {
            Logger.getLogger(newlog.class.getName()).log(Level.SEVERE, null, ex);
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
