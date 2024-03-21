package com.example.cnw.dao;

import com.example.cnw.context.JDBCUtils;
import com.example.cnw.entity.Invoice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class InvoiceDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    private static java.sql.Date getCurrentDate() {
        Date today = new Date();
        return new java.sql.Date(today.getTime());
    }

    public List<Invoice> getAllInvoice() {
        List<Invoice> list = new ArrayList<>();
        String query = "select * from Invoice";
        try {
            conn = JDBCUtils.getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Invoice(rs.getInt(1),
                        rs.getInt(2),
                        rs.getDouble(3),
                        rs.getDate(4)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }



    public void insertInvoice(int accountID, double tongGia) {
        String query = "insert Invoice(accountID,tongGia,ngayXuat)\r\n"
                + "values(?,?,?)";

        try {
            conn = JDBCUtils.getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, accountID);
            ps.setDouble(2, tongGia);
            ps.setDate(3,getCurrentDate());
            ps.executeUpdate();

        } catch (Exception e) {

        }
    }


    public void deleteInvoiceByAccountId(String id) {
        String query = "delete from Invoice\n"
                + "where accountID = ?";
        try {
            conn = JDBCUtils.getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    public double totalMoneyDay(int day) {
        String query = "SELECT SUM(tongGia) " +
                "FROM Invoice " +
                "WHERE DAYOFWEEK(ngayXuat) = ? " +
                "GROUP BY ngayXuat";

        try {
            conn = JDBCUtils.getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, day);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getDouble(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public double totalMoneyMonth(int month) {
        String query = "SELECT SUM(tongGia) " +
                "FROM Invoice " +
                "WHERE MONTH(ngayXuat) = ? " +
                "GROUP BY MONTH(ngayXuat)";

        try {
            conn = JDBCUtils.getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, month);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getDouble(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }



    public double sumAllInvoice() {
        String query = "select SUM(tongGia) from Invoice";
        try {
            conn = JDBCUtils.getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getDouble(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }
    public List<Invoice> searchByNgayXuat(String ngayXuat) {
        List<Invoice> list = new ArrayList<>();
        String query = "select * from Invoice\r\n"
                + "where ngayXuat ='"+ngayXuat+"'";
        try {
            conn = JDBCUtils.getConnection();
            ps = conn.prepareStatement(query);
//            ps.setString(1,ngayXuat);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Invoice(rs.getInt(1),
                        rs.getInt(2),
                        rs.getDouble(3),
                        rs.getDate(4)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

}
