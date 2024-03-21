/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.cnw.controller;


import com.example.cnw.dao.AccountDAO;
import com.example.cnw.dao.InvoiceDAO;
import com.example.cnw.dao.ProductDAO;
import com.example.cnw.dao.ReviewDAO;
import com.example.cnw.entity.Account;
import com.example.cnw.entity.Invoice;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;


@WebServlet(name = "StatisticControl", urlPatterns = {"/admin"})
public class StatisticControl extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("acc");
        int uID;

        InvoiceDAO invoiceDAO = new InvoiceDAO();
        ProductDAO productDAO = new ProductDAO();
        AccountDAO accountDAO = new AccountDAO();
        ReviewDAO reviewDAO = new ReviewDAO();
        if(a == null) {
        	response.sendRedirect("login");
        	return;
        }
        uID= a.getId();
 	   int checkIsAdmin = accountDAO.checkAccountAdmin(uID);
       if(checkIsAdmin == 0)
       {
       		response.sendRedirect("login");
       		return;
       }
        	
        	
       
        double totalMoney1 = invoiceDAO.totalMoneyDay(1);
        double totalMoney2 = invoiceDAO.totalMoneyDay(2);
        double totalMoney3 = invoiceDAO.totalMoneyDay(3);
        double totalMoney4 = invoiceDAO.totalMoneyDay(4);
        double totalMoney5 = invoiceDAO.totalMoneyDay(5);
        double totalMoney6 = invoiceDAO.totalMoneyDay(6);
        double totalMoney7 = invoiceDAO.totalMoneyDay(7);
        
        double totalMoneyMonth1 = invoiceDAO.totalMoneyMonth(1);
        double totalMoneyMonth2 = invoiceDAO.totalMoneyMonth(2);
        double totalMoneyMonth3 = invoiceDAO.totalMoneyMonth(3);
        double totalMoneyMonth4 = invoiceDAO.totalMoneyMonth(4);
        double totalMoneyMonth5 = invoiceDAO.totalMoneyMonth(5);
        double totalMoneyMonth6 = invoiceDAO.totalMoneyMonth(6);
        double totalMoneyMonth7 = invoiceDAO.totalMoneyMonth(7);
        double totalMoneyMonth8 = invoiceDAO.totalMoneyMonth(8);
        double totalMoneyMonth9 = invoiceDAO.totalMoneyMonth(9);
        double totalMoneyMonth10 = invoiceDAO.totalMoneyMonth(10);
        double totalMoneyMonth11 = invoiceDAO.totalMoneyMonth(11);
        double totalMoneyMonth12 = invoiceDAO.totalMoneyMonth(12);
        
        int allReview = reviewDAO.countAllReview();
        int allProduct = productDAO.countAllProduct();
        double sumAllInvoice = invoiceDAO.sumAllInvoice();
        
        List<Invoice> listAllInvoice = invoiceDAO.getAllInvoice();
        List<Account> listAllAccount = accountDAO.getAllAccount();
        
        request.setAttribute("listAllInvoice", listAllInvoice);
        request.setAttribute("listAllAccount", listAllAccount);
        request.setAttribute("sumAllInvoice", sumAllInvoice);
        
        request.setAttribute("allReview", allReview);
        request.setAttribute("allProduct", allProduct);
        
        request.setAttribute("totalMoney1", totalMoney1);
        request.setAttribute("totalMoney2", totalMoney2);
        request.setAttribute("totalMoney3", totalMoney3);
        request.setAttribute("totalMoney4", totalMoney4);
        request.setAttribute("totalMoney5", totalMoney5);
        request.setAttribute("totalMoney6", totalMoney6);
        request.setAttribute("totalMoney7", totalMoney7);
        
        request.setAttribute("totalMoneyMonth1", totalMoneyMonth1);
        request.setAttribute("totalMoneyMonth2", totalMoneyMonth2);
        request.setAttribute("totalMoneyMonth3", totalMoneyMonth3);
        request.setAttribute("totalMoneyMonth4", totalMoneyMonth4);
        request.setAttribute("totalMoneyMonth5", totalMoneyMonth5);
        request.setAttribute("totalMoneyMonth6", totalMoneyMonth6);
        request.setAttribute("totalMoneyMonth7", totalMoneyMonth7);
        request.setAttribute("totalMoneyMonth8", totalMoneyMonth8);
        request.setAttribute("totalMoneyMonth9", totalMoneyMonth9);
        request.setAttribute("totalMoneyMonth10", totalMoneyMonth10);
        request.setAttribute("totalMoneyMonth11", totalMoneyMonth11);
        request.setAttribute("totalMoneyMonth12", totalMoneyMonth12);
        
       
    
        request.getRequestDispatcher("statistic.jsp").forward(request, response);
      
       
       
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
