package com.example.cnw.dao;

import com.example.cnw.context.JDBCUtils;
import com.example.cnw.entity.TongChiTieuBanHang;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TongChiTieuBanHangDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;



    public TongChiTieuBanHang checkTongChiTieuBanHangExist(int userID) {

        String query = "select * from TongChiTieuBanHang where userID=?";
        try {
            conn = JDBCUtils.getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, userID);

            rs = ps.executeQuery();
            while (rs.next()) {
                return new TongChiTieuBanHang(rs.getInt(1),
                        rs.getDouble(2),
                        rs.getDouble(3)
                );
            }
        } catch (Exception e) {
        }
        return null;
    }
    public List<TongChiTieuBanHang> getTop5KhachHang() {
        List<TongChiTieuBanHang> list = new ArrayList<>();
        String query = "SELECT * FROM TongChiTieuBanHang ORDER BY TongChiTieu DESC LIMIT 5";

        try {
            conn = JDBCUtils.getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new TongChiTieuBanHang(rs.getInt(1),
                        rs.getDouble(2),
                        rs.getDouble(3)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<TongChiTieuBanHang> getTop5NhanVien() {
        List<TongChiTieuBanHang> list = new ArrayList<>();
        String query = "SELECT * FROM TongChiTieuBanHang ORDER BY TongBanHang DESC LIMIT 5";

        try {
            conn = JDBCUtils.getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new TongChiTieuBanHang(rs.getInt(1),
                        rs.getDouble(2),
                        rs.getDouble(3)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }
    public void deleteTongChiTieuBanHangByUserID(String id) {
        String query = "delete from TongChiTieuBanHang\n"
                + "where userID = ?";
        try {
            conn = JDBCUtils.getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    public void insertTongChiTieuBanHang(int userID, double tongChiTieu, double tongBanHang) {
        String query = "insert TongChiTieuBanHang(userID,TongChiTieu,TongBanHang)\r\n"
                + "values(?,?,?)";
        try {
            conn = JDBCUtils.getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, userID);
            ps.setDouble(2, tongChiTieu);
            ps.setDouble(3, tongBanHang);

            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    public void editTongChiTieu(int accountID, double totalMoneyVAT) {
        String procedureCall = "{CALL proc_CapNhatTongChiTieu(?, ?)}";
        try (CallableStatement cstmt = conn.prepareCall(procedureCall)) {
            cstmt.setInt(1, accountID);
            cstmt.setDouble(2, totalMoneyVAT);

            // Execute the stored procedure
            cstmt.execute();


        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
    public void editTongBanHang(int sell_ID, double tongTienBanHangThem) {
        String query = "CALL proc_CapNhatTongBanHang(?, ?)";

        try (Connection conn = JDBCUtils.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setInt(1, sell_ID);
            ps.setDouble(2, tongTienBanHangThem);

            int affectedRows = ps.executeUpdate();

            // Check the number of affected rows to determine if the update was successful
            if (affectedRows > 0) {
                System.out.println("TongBanHang updated successfully.");
            } else {
                System.out.println("No rows were updated. Check your parameters or stored procedure.");
            }

        } catch (SQLException e) {
            e.printStackTrace(); // Log or handle the exception appropriately
        }
    }



}
