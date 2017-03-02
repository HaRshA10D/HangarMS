/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package loginActivity;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
public class anyGantt extends HttpServlet {

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
            
            System.out.println(inDate+"\t"+outDate);
            
            java.sql.Date fromDate = java.sql.Date.valueOf(inDate);
            java.sql.Date toDate = java.sql.Date.valueOf(outDate);
            CallableStatement cstm = conn.prepareCall("{call mp_selectall(?,?)}");
            cstm.setDate(1,fromDate);
            cstm.setDate(2,toDate);
            ResultSet rs = cstm.executeQuery();
            lineRecord line1 = new lineRecord("1","Line 1A");
            lineRecord line2 = new lineRecord("2","Line 1B");
            lineRecord line3 = new lineRecord("3","Line 2A");
            lineRecord line4 = new lineRecord("4","Line 2B");
            lineRecord line5 = new lineRecord("5","Line 3");
            lineRecord pline1 = new lineRecord("1","1A parallel","1");
            lineRecord pline2 = new lineRecord("2","1B parallel","2");
            lineRecord pline3 = new lineRecord("3","2A parallel","3");
            lineRecord pline4 = new lineRecord("4","2B parallel","4");
            lineRecord pline5 = new lineRecord("5","3 parallel","5");
            /*Date dt = java.sql.Date.valueOf("2016-06-01");
            Date de = java.sql.Date.valueOf("2016-07-07");
            record rec  = new record("f",dt,de);
            Gson gs = new Gson();
            String Jso = gs.toJson(rec);
            System.out.println(Jso);*/
            int x11=0,x12=0,x21=0,x22=0,x31=0,x32=0,x41=0,x42=0,x51=0,x52=0;
            while(rs.next()){
                Date dt = rs.getDate(7); // I_date
                Date de = rs.getDate(9);  // E_date
                if(rs.getInt(3)==1){  // LINE
                    if(!(rs.getBoolean(10))){
                        x11++;
                    record rec  = new record(rs.getInt(1),rs.getString(4),rs.getString(2),rs.getString(5),rs.getString(6),dt,de,rs.getInt(8),rs.getString(4),rs.getString(11),x11);
                    System.out.println(rec);
                    line1.addRecord(rec);
                    }
                    else{
                        x12++;
                    record rec  = new record(rs.getInt(1),rs.getString(4),rs.getString(2),rs.getString(5),rs.getString(6),dt,de,rs.getInt(8),rs.getString(4),rs.getString(11),x12);
                    System.out.println(rec);
                    pline1.addRecord(rec);    
                    }
                }
                else if(rs.getInt(3)==2){
                    if(!(rs.getBoolean(10))){
                        x21++;
                    record rec  = new record(rs.getInt(1),rs.getString(4),rs.getString(2),rs.getString(5),rs.getString(6),dt,de,rs.getInt(8),rs.getString(4),rs.getString(11),x21);
                    System.out.println(rec);
                    line2.addRecord(rec);
                    }
                    else{
                        x22++;
                    record rec  = new record(rs.getInt(1),rs.getString(4),rs.getString(2),rs.getString(5),rs.getString(6),dt,de,rs.getInt(8),rs.getString(4),rs.getString(11),x22);
                    System.out.println(rec);
                    pline2.addRecord(rec);    
                    }
                }
                else if(rs.getInt(3)==3){
                    if(!(rs.getBoolean(10))){
                        x31++;
                    record rec  = new record(rs.getInt(1),rs.getString(4),rs.getString(2),rs.getString(5),rs.getString(6),dt,de,rs.getInt(8),rs.getString(4),rs.getString(11),x31);
                    System.out.println(rec);
                    line3.addRecord(rec);
                    }
                    else{
                        x32++;
                    record rec  = new record(rs.getInt(1),rs.getString(4),rs.getString(2),rs.getString(5),rs.getString(6),dt,de,rs.getInt(8),rs.getString(4),rs.getString(11),x32);
                    System.out.println(rec);
                    pline3.addRecord(rec);    
                    }
                }
                else if(rs.getInt(3)==4){
                    if(!(rs.getBoolean(10))){
                        x41++;
                    record rec  = new record(rs.getInt(1),rs.getString(4),rs.getString(2),rs.getString(5),rs.getString(6),dt,de,rs.getInt(8),rs.getString(4),rs.getString(11),x41);
                    System.out.println(rec);
                    line4.addRecord(rec);
                    }
                    else{
                        x42++;
                    record rec  = new record(rs.getInt(1),rs.getString(4),rs.getString(2),rs.getString(5),rs.getString(6),dt,de,rs.getInt(8),rs.getString(4),rs.getString(11),x42);
                    System.out.println(rec);
                    pline4.addRecord(rec);    
                    }
                }
                else if(rs.getInt(3)==5){
                    if(!(rs.getBoolean(10))){
                        x51++;
                    record rec  = new record(rs.getInt(1),rs.getString(4),rs.getString(2),rs.getString(5),rs.getString(6),dt,de,rs.getInt(8),rs.getString(4),rs.getString(11),x51);
                    System.out.println(rec);
                    line5.addRecord(rec);
                    }
                    else{
                        x52++;
                    record rec  = new record(rs.getInt(1),rs.getString(4),rs.getString(2),rs.getString(5),rs.getString(6),dt,de,rs.getInt(8),rs.getString(4),rs.getString(11),x52);
                    System.out.println(rec);
                    pline5.addRecord(rec);    
                    }
                }
            }
            System.out.println(x11);
            ArrayList<lineRecord> rec = new ArrayList<lineRecord>();
            rec.add(line1);
            rec.add(pline1);
            rec.add(line2);
            rec.add(pline2);
            rec.add(line3);
            rec.add(pline3);
            rec.add(line4);
            rec.add(pline4);
            rec.add(line5);
            rec.add(pline5);
            Gson gs = new Gson();
            //mapper.configure(SerializationFeature.INDENT_OUTPUT, true);
            String Jso = gs.toJson(rec);
            System.out.println("ANy Gant Value is  "+Jso);
            HttpSession session=request.getSession();
            session.setAttribute("jso", Jso);
            session.setAttribute("indate",inDate);
            session.setAttribute("outdate",outDate);
            request.getRequestDispatcher("gantt.jsp").forward(request, response);
        }catch(SQLException e){
        }finally {
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
