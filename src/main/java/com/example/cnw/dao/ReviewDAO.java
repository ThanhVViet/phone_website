package com.example.cnw.dao;

import com.example.cnw.context.JDBCUtils;
import com.example.cnw.entity.Review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ReviewDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    private static java.sql.Date getCurrentDate() {
        Date today = new Date();
        return new java.sql.Date(today.getTime());
    }

    public void insertReview(int accountID, int productID, String contentReview) {
        String query = "insert Review(accountID, productID, contentReview, dateReview)\r\n"
                + "values(?,?,?,?)";

        try {
            conn = JDBCUtils.getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, accountID);
            ps.setInt(2, productID);
            ps.setString(3, contentReview);
            ps.setDate(4,getCurrentDate());
            ps.executeUpdate();

        } catch (Exception e) {
        }
    }
    public Review getNewReview(int accountID, int productID) {
        String query = "select top 1 * from Review\r\n"
                + "where accountID = ? and productID = ?\r\n"
                + "order by maReview desc";
        try {
            conn = JDBCUtils.getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, accountID);
            ps.setInt(2, productID);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Review(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getDate(4));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void deleteReviewByProductID(String productID) {
        String query = "delete from Review where productID = ?";
        try {
            conn = JDBCUtils.getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, productID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteReviewByAccountID(String id) {
        String query = "delete from Review where accountID = ?";
        try {
            conn = JDBCUtils.getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }



    public List<Review> getAllReviewByProductID(String productId) {
        List<Review> list = new ArrayList<>();
        String query = "select * from Review\r\n"
                + "where productID =?";
        try {
            conn = JDBCUtils.getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, productId);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Review(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getDate(4)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }
    public int countAllReview() {
        String query = "select count(*) from Review";
        try {
            conn = JDBCUtils.getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }



}
