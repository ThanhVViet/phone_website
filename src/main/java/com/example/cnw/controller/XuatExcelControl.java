/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.cnw.controller;


import com.example.cnw.dao.AccountDAO;
import com.example.cnw.dao.InvoiceDAO;
import com.example.cnw.entity.Account;
import com.example.cnw.entity.Invoice;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.Random;





@WebServlet(name = "XuatExcelControl", urlPatterns = {"/xuatExcelControl"})
public class XuatExcelControl extends HttpServlet {

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
      
        String ngayXuat = request.getParameter("dateInvoice");

        AccountDAO accountDAO = new AccountDAO();
        InvoiceDAO invoiceDAO = new InvoiceDAO();


        List<Invoice> list = invoiceDAO.searchByNgayXuat(ngayXuat);
        List<Account> listAllAccount = accountDAO.getAllAccount();
        
        int maximum=2147483647;
        int minimum=1;
        
        Random rn = new Random();
        int range = maximum - minimum + 1;
        int randomNum =  rn.nextInt(range) + minimum;




        FileOutputStream file = new FileOutputStream("/Users/thanhviet/ExcelPhone/" + "hoa-don" + Integer.toString(randomNum) + ".xlsx");
        XSSFWorkbook workbook=new XSSFWorkbook();

        Font headerFont = workbook.createFont();
        headerFont.setBold(true);
        headerFont.setColor(IndexedColors.WHITE.getIndex());

        // Create a style for headers
        CellStyle headerCellStyle = workbook.createCellStyle();
        headerCellStyle.setFillForegroundColor(IndexedColors.BLUE.getIndex());
        headerCellStyle.setFillPattern(CellStyle.SOLID_FOREGROUND);
        headerCellStyle.setFont(headerFont);

        // Apply the style to header cells


        // Create a font for data cells
        Font dataFont = workbook.createFont();
        dataFont.setColor(IndexedColors.BLACK.getIndex());

        // Create a style for data cells
        CellStyle dataCellStyle = workbook.createCellStyle();
        dataCellStyle.setFont(dataFont);

        XSSFSheet workSheet=workbook.createSheet("1");
        XSSFRow row;
        XSSFCell cell0;
        XSSFCell cell1;
        XSSFCell cell2;
        XSSFCell cell3;


        
        row=workSheet.createRow(0);
        cell0=row.createCell(0);
        cell0.setCellValue("Mã Hóa Đơn");
        cell1=row.createCell(1);
        cell1.setCellValue("Account");
        cell2=row.createCell(2);
        cell2.setCellValue("Tổng Giá($)");
        cell3=row.createCell(3);
        cell3.setCellValue("Ngày Xuất");

        cell0.setCellStyle(headerCellStyle);
        cell1.setCellStyle(headerCellStyle);
        cell2.setCellStyle(headerCellStyle);
        cell3.setCellStyle(headerCellStyle);
        
        double tongGia;
        int i=0;
        
        for (Invoice o : list) {
        	i=i+1;
        	for (Account a : listAllAccount) {
        		if(o.getAccountID()==a.getId()) {
        			tongGia=Math.round((o.getTongGia()) * 100.0) / 100.0;
        			 row=workSheet.createRow(i);
        			 cell0=row.createCell(0);
        		     cell0.setCellValue(o.getMaHD());
        		     cell1=row.createCell(1);
        		     cell1.setCellValue(a.getUser());
        		     cell2=row.createCell(2);
        		     cell2.setCellValue(tongGia);
        		     cell3=row.createCell(3);
        		     cell3.setCellValue(ngayXuat);	
        		}
        		}
        }
        workbook.write(file);
        workbook.close();
        file.close();
        
        request.setAttribute("mess", "Đã xuất file Excel thành công!");
        request.getRequestDispatcher("hoaDon").forward(request, response);

       
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
