/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package loginActivity;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import reqfiles.Utilities;

/**
 *
 * @author HaRshA CriMiNaLhEarT
 */
public class xlsxexport extends HttpServlet {

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
        PrintWriter oute = response.getWriter();
        try {
            Utilities utils = new Utilities();
            Connection conn = utils.NewConnection("db_HF");
            CallableStatement cstm = conn.prepareCall("{call mp_selectbyorder()}");
            ResultSet rs = cstm.executeQuery();
            HSSFWorkbook workbook = new HSSFWorkbook();
            HSSFSheet sheet = workbook.createSheet("Hangar DB");
            HSSFRow row= sheet.createRow(0);
            HSSFCell cell;
            cell = row.createCell(0);
            cell.setCellValue("ID");
            cell = row.createCell(1);
            cell.setCellValue("Registration");
            cell = row.createCell(2);
            cell.setCellValue("Line");
            cell = row.createCell(3);
            cell.setCellValue("Customer");
            cell = row.createCell(4);
            cell.setCellValue("Aircraft Model");
            cell = row.createCell(5);
            cell.setCellValue("Check Type");
            cell = row.createCell(6);
            cell.setCellValue("Starting Date");
            cell = row.createCell(7);
            cell.setCellValue("TAT");
            cell = row.createCell(8);
            cell.setCellValue("Ending Date");
            cell = row.createCell(9);
            cell.setCellValue("Status");
            int i=1;
            while(rs.next()){
                row = sheet.createRow(i);
                DateFormat dtf = new SimpleDateFormat("dd-MM-yyyy");
                cell = row.createCell(0);
                cell.setCellValue(rs.getInt(1));
                cell = row.createCell(1);
                cell.setCellValue(rs.getString(2));
                cell = row.createCell(2);
                cell.setCellValue(rs.getInt(3));
                cell = row.createCell(3);
                cell.setCellValue(rs.getString(4));
                cell = row.createCell(4);
                cell.setCellValue(rs.getString(5));
                cell = row.createCell(5);
                cell.setCellValue(rs.getString(6));
                cell = row.createCell(6);
                cell.setCellValue(dtf.format(rs.getDate(7)));
                cell = row.createCell(7);
                cell.setCellValue(rs.getInt(8));
                cell = row.createCell(8);
                cell.setCellValue(dtf.format(rs.getDate(9)));
                cell = row.createCell(9);
                cell.setCellValue(rs.getString(11));
                i++;
            }
            FileOutputStream out = new FileOutputStream(new File("D://HFdata.xls"));
            workbook.write(out);
            System.out.println("Complete");
            response.sendRedirect("downloads.jsp");
        }catch(SQLException e){
        } finally {
            oute.close();
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
