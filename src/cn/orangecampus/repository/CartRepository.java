package cn.orangecampus.repository;

import cn.orangecampus.entity.Cart;
import cn.orangecampus.utils.JdbcTools;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author 16321
 */
public class CartRepository {
    /**
     * 获取一个用户的购物车商品列表
     *
     * @param userId 用户id
     * @return 商品列表
     */
    public static List<Cart> getCartList(int userId) {
        Connection con = JdbcTools.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        String sql = "select * from shoppingCart where userId=?";
        List<Cart> cart = new ArrayList<>();
        try {
            statement = con.prepareStatement(sql);
            statement.setInt(1, userId);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                cart.add(new Cart(resultSet.getInt(1), resultSet.getInt(2)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcTools.release(con, statement, resultSet);
        }
        return cart;
    }

    /**
     * 插入用户选择这个商品的记录
     *
     * @param userId  用户id
     * @param goodsId 商品id
     */
    public static void addRecord(int userId, int goodsId) {
        Connection con = JdbcTools.getConnection();
        PreparedStatement statement = null;
        String sql = "insert into shoppingCart values(?,?)";
        try {
            statement = con.prepareStatement(sql);
            statement.setInt(1, userId);
            statement.setInt(2, goodsId);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcTools.release(con, statement, null);
        }
    }

    /**
     * 查询某条记录是否存在你
     *
     * @param userId  用户id
     * @param goodsId 商品id
     * @return {Cart}
     */

    public static Cart queryRecord(int userId, int goodsId) {
        Connection con = JdbcTools.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        Cart cartRecord = null;
        String sql = "select * from shoppingCart where userId=? and goodsId=?";
        try {
            statement = con.prepareStatement(sql);
            statement.setInt(1, userId);
            statement.setInt(2, goodsId);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                cartRecord = new Cart(resultSet.getInt(1), resultSet.getInt(2));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcTools.release(con, statement, resultSet);
        }
        return cartRecord;
    }

    /**
     * 删除某个用户购物车全部记录
     *
     * @param userId 用户id
     */
    public static void delAllRecord(int userId) {
        Connection con = JdbcTools.getConnection();
        PreparedStatement statement = null;
        String sql = "delete FROM shoppingCart where userId=?";
        try {
            statement = con.prepareStatement(sql);
            statement.setInt(1, userId);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcTools.release(con, statement, null);
        }
    }

    /**
     * 删除某个用户购物车中的某条记录
     *
     * @param userId  用户id
     * @param goodsId 商品id
     */
    public static void delOneRecord(int userId, int goodsId) {
        Connection con = JdbcTools.getConnection();
        PreparedStatement statement = null;
        String sql = "delete from shoppingCart where userId=? and goodsId=?;";
        try {
            statement = con.prepareStatement(sql);
            statement.setInt(1, userId);
            statement.setInt(2, goodsId);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcTools.release(con, statement, null);
        }
    }
}
