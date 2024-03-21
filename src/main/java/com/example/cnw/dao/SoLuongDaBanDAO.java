package com.example.cnw.dao;

import com.example.cnw.context.JDBCUtils;
import com.example.cnw.entity.SoLuongDaBan;
import com.example.cnw.entity.TongChiTieuBanHang;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class SoLuongDaBanDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public void insertSoLuongDaBan(int productID, int soLuongDaBan) {
        String query = "insert SoLuongDaBan(productID,soLuongDaBan)\r\n"
                + "values(?,?)";
        try {
            conn = JDBCUtils.getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, productID);
            ps.setInt(2, soLuongDaBan);

            ps.executeUpdate();
        } catch (Exception e) {
        }
    }


    public List<SoLuongDaBan> getTop10SanPhamBanChay() {
        List<SoLuongDaBan> list = new ArrayList<>();
        String query = "SELECT * FROM SoLuongDaBan ORDER BY soLuongDaBan DESC LIMIT 10";

        try {
            conn = JDBCUtils.getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new SoLuongDaBan(rs.getInt(1),
                        rs.getInt(2)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public SoLuongDaBan checkSoLuongDaBanExist(int productID) {

        String query = "select * from SoLuongDaBan where productID = ?";
        try {
            conn = JDBCUtils.getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, productID);

            rs = ps.executeQuery();
            while (rs.next()) {
                return new SoLuongDaBan(rs.getInt(1),
                        rs.getInt(2)
                );
            }
        } catch (Exception e) {
        }
        return null;
    }
    public void deleteSoLuongDaBanByProductID(String productID) {
        String query = "delete from SoLuongDaBan where productID=?";
        try {
            conn = JDBCUtils.getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, productID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    public void editSoLuongDaBan(int productID, int soLuongBanThem) {

        String query = "CALL proc_CapNhatTongChiTieu(?, ?)";

        try {
            conn = JDBCUtils.getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, productID);
            ps.setInt(2, soLuongBanThem);

            ps.executeUpdate();

        } catch (Exception e) {

        }
    }



}
