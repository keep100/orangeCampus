package cn.orangecampus.repository;

import cn.orangecampus.entity.BuyRecord;
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
public class BuyRecordRepository {
    /**
     *
     * @param userId 用户id
     * @param goodsId 商品id
     */
    public static void addBuyRecord(int userId,int goodsId){
        Connection con= JdbcTools.getConnection();
        PreparedStatement statement=null;
        String sql="insert into buyRecord values (?,?)";
        try {
            statement=con.prepareStatement(sql);
            statement.setInt(1,userId);
            statement.setInt(2,goodsId);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JdbcTools.release(con,statement,null);
        }
    }

    /**
     * 获取一个用户的购物记录
     *
     * @param userId 用户id
     * @return 购买记录
     */
    public static List<BuyRecord> getBuyRecords(int userId) {
        Connection con = JdbcTools.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        String sql = "select * from buyRecord where userId=?";
        List<BuyRecord> buyRecords = new ArrayList<>();
        try {
            statement = con.prepareStatement(sql);
            statement.setInt(1, userId);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                buyRecords.add(new BuyRecord(resultSet.getInt(1), resultSet.getInt(2)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcTools.release(con, statement, resultSet);
        }
        return buyRecords;
    }
}
