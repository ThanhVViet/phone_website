package com.example.cnw.controller;


import com.example.cnw.dao.*;
import com.example.cnw.entity.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * Servlet implementation class ForgotPasswordControl
 */
@WebServlet(name = "OrderControl", urlPatterns = {"/order"})
public class OrderControl extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("acc");
        if (a == null) {
            response.sendRedirect("login");
            return;
        }
        int accountID = a.getId();

        CartDAO cartDAO = new CartDAO();
        InvoiceDAO invoiceDAO = new InvoiceDAO();
        ProductDAO productDAO = new ProductDAO();
        SoLuongDaBanDAO soLuongDaBanDAO = new SoLuongDaBanDAO();
        TongChiTieuBanHangDAO tongChiTieuBanHangDAO = new TongChiTieuBanHangDAO();

        List<Cart> list = cartDAO.getCartByAccountID(accountID);
        List<Product> list2 = productDAO.getAllProduct();
        double totalMoney = 0;
        for (Cart c : list) {
            for (Product p : list2) {
                if (c.getProductID() == p.getId()) {
                    totalMoney = totalMoney + (p.getPrice() * c.getAmount());
                }
            }
        }
        double totalMoneyVAT = totalMoney + totalMoney * 0.1;

        double tongTienBanHangThem = 0;
        int sell_ID;
        for (Cart c : list) {
            for (Product p : list2) {
                if (c.getProductID() == p.getId()) {
                    tongTienBanHangThem = 0;
                    sell_ID = productDAO.getSellIDByProductID(p.getId());
                    tongTienBanHangThem = tongTienBanHangThem + (p.getPrice() * c.getAmount());
                    TongChiTieuBanHang t2 = tongChiTieuBanHangDAO.checkTongChiTieuBanHangExist(sell_ID);
                    if (t2 == null) {
                        tongChiTieuBanHangDAO.insertTongChiTieuBanHang(sell_ID, 0, tongTienBanHangThem);
                    } else {
                        tongChiTieuBanHangDAO.editTongBanHang(sell_ID, tongTienBanHangThem);
                    }
                }
            }
        }


        for (Cart c : list) {
            for (Product p : list2) {
                if (c.getProductID() == p.getId()) {
                    SoLuongDaBan s = soLuongDaBanDAO.checkSoLuongDaBanExist(p.getId());
                    if (s == null) {
                        soLuongDaBanDAO.insertSoLuongDaBan(p.getId(), c.getAmount());
                    } else {
                        soLuongDaBanDAO.editSoLuongDaBan(p.getId(), c.getAmount());
                    }
                }
            }
        }

        invoiceDAO.insertInvoice(accountID, totalMoneyVAT);
        TongChiTieuBanHang t = tongChiTieuBanHangDAO.checkTongChiTieuBanHangExist(accountID);
        if (t == null) {
            tongChiTieuBanHangDAO.insertTongChiTieuBanHang(accountID, totalMoneyVAT, 0);
        } else {
            tongChiTieuBanHangDAO.editTongChiTieu(accountID, totalMoneyVAT);
        }


        request.getRequestDispatcher("order.jsp").forward(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        try {
            String emailAddress = request.getParameter("email");
            String name = request.getParameter("name");
            String phoneNumber = request.getParameter("phoneNumber");
            String deliveryAddress = request.getParameter("deliveryAddress");

            HttpSession session = request.getSession();
            Account a = (Account) session.getAttribute("acc");
            if (a == null) {
                response.sendRedirect("login");
                return;
            }
            int accountID = a.getId();
            CartDAO cartDAO = new CartDAO();
            ProductDAO productDAO = new ProductDAO();
            List<Cart> list = cartDAO.getCartByAccountID(accountID);
            List<Product> list2 = productDAO.getAllProduct();

            double totalMoney = 0;
            for (Cart c : list) {
                for (Product p : list2) {
                    if (c.getProductID() == p.getId()) {
                        totalMoney = totalMoney + (p.getPrice() * c.getAmount());
                    }
                }
            }
            double totalMoneyVAT = totalMoney + totalMoney * 0.1;


            //old code
            Email email = new Email();
            email.setFrom("meomeo6lee69@gmail.com");
            email.setFromPassword("kkvkyeugrcfbhyqu");
            email.setTo(emailAddress);
            email.setSubject("Dat hang thanh cong tu VTV");
            StringBuilder sb = new StringBuilder();
            sb.append("Dear ").append(name).append("<br>");
            sb.append("Ban vua dat dang tu VTV. <br> ");
            sb.append("Dia chi nhan hang cua ban la: <b>").append(deliveryAddress).append(" </b> <br>");
            sb.append("Cac san pham ban dat la: <br>");
            for (Cart c : list) {
                for (Product p : list2) {
                    if (c.getProductID() == p.getId()) {
                        sb.append(p.getName()).append(" | ").append("Price:").append(p.getPrice()).append("$").append(" | ").append("Amount:").append(c.getAmount()).append(" | ").append("Memory:").append(c.getMemory()).append("<br>");
                    }
                }
            }
            sb.append("Tong Tien: ").append(String.format("%.02f", totalMoneyVAT)).append("$").append("<br>");
            sb.append("Cam on ban da dat hang tai VTV !! Keo li<br>");
            sb.append("bevis69");

            email.setContent(sb.toString());
            EmailUtils.send(email);
            request.setAttribute("mess", "Dat hang thanh cong!");

            cartDAO.deleteCartByAccountID(accountID);





        } catch (Exception e) {
            request.setAttribute("error", "Dat hang that bai!");
            e.printStackTrace();
        }

        request.getRequestDispatcher("order.jsp").forward(request, response);
    }

}
