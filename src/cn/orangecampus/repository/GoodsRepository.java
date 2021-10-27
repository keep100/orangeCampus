package cn.orangecampus.repository;

import cn.orangecampus.entity.GoodsDetail;
import cn.orangecampus.utils.JdbcTools;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * 负责与商品记录表进行交互
 *
 * @author 16321
 */
public class GoodsRepository {
    private static final int LIMIT = 16;

    /**
     * 获取某个用户发布的全部商品信息
     *
     * @param userId 用户id
     * @return
     */
    public static List<GoodsDetail> getGoodsDetailList(int userId) {
        Connection con = JdbcTools.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        String sql = "select * from goods_detail where userId=?";
        List<GoodsDetail> list = new ArrayList<>();
        try {
            statement = con.prepareStatement(sql);
            statement.setInt(1, userId);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                list.add(new GoodsDetail(resultSet.getInt(1), resultSet.getInt(2),
                        resultSet.getString(3), resultSet.getString(4), resultSet.getInt(5),
                        resultSet.getString(6), resultSet.getString(7), resultSet.getString(8)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcTools.release(con, statement, resultSet);
        }
        return list;
    }

    /**
     * 获取全部商品总页数
     *
     * @return
     */
    public static int getAllPages() {
        return (int) Math.ceil((double) getAllRecords() / LIMIT);
    }

    /**
     * 获取某种商品的总页数
     *
     * @param type 商品种类
     * @return
     */
    public static int getTypePages(String type) {
        return (int) Math.ceil((double) getTypesCount(type) / LIMIT);
    }

    /**
     * 获取商品记录总数
     *
     * @return
     */
    public static int getAllRecords() {
        Connection con = JdbcTools.getConnection();
        String sql = "select count(*) from goods_detail";
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        int count = 0;
        try {
            statement = con.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                count = resultSet.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcTools.release(con, statement, resultSet);
        }
        return count;
    }

    /**
     * 删除一条商品记录
     *
     * @param id 商品id
     */
    public static void delOneRecord(int id) {
        Connection con = JdbcTools.getConnection();
        PreparedStatement statement = null;
        String sql = "delete from goods_detail where id=?";
        try {
            statement = con.prepareStatement(sql);
            statement.setInt(1, id);
            statement.executeUpdate();
            String newSql = "insert into deleted values('商品')";
            statement = con.prepareStatement(newSql);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcTools.release(con, statement, null);
        }
    }

    public static int countDeleted() {
        Connection con = JdbcTools.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        String sql = "select count(*) from deleted where type='商品'";
        int num = 0;
        try {
            statement = con.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                num = resultSet.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcTools.release(con, statement, resultSet);
        }
        return num;
    }

    /**
     * 插入新的商品记录
     *
     * @param userId
     * @param goodsName
     * @param goodsDesc
     * @param price
     * @param labels
     * @param type
     * @param imgUrl
     * @return
     */
    public static int addGoodsRecord(int userId, String goodsName, String goodsDesc, int price, String labels, String type, String imgUrl) {
        Connection con = JdbcTools.getConnection();
        int id = getAllRecords() + countDeleted() + 1;
        String sql = "insert into goods_detail values (?,?,?,?,?,?,?,?)";
        PreparedStatement statement = null;
        try {
            statement = con.prepareStatement(sql);
            statement.setInt(1, id);
            statement.setInt(2, userId);
            statement.setString(3, goodsName);
            statement.setString(4, goodsDesc);
            statement.setInt(5, price);
            statement.setString(6, labels);
            statement.setString(7, type);
            statement.setString(8, imgUrl);
            return statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcTools.release(con, statement, null);
        }
        return 0;
    }

    /**
     * 获取规定数量的商品记录，用于展示每页的商品记录
     *
     * @param pageIndex
     * @return
     */
    public static List<GoodsDetail> getLimitedGoods(int pageIndex) {
        Connection con = JdbcTools.getConnection();
        String sql = "select * from (select row_number() over (order by getdate()) as row,* from goods_detail)" +
                "as # where row>=? and row<=?;";
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        List<GoodsDetail> goodsDetails = new ArrayList<GoodsDetail>();
        try {
            statement = con.prepareStatement(sql);
            statement.setInt(1, pageIndex * LIMIT - 15);
            statement.setInt(2, pageIndex * LIMIT);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                goodsDetails.add(new GoodsDetail(resultSet.getInt(2), resultSet.getInt(3),
                        resultSet.getString(4), resultSet.getString(5),
                        resultSet.getInt(6), resultSet.getString(7),
                        resultSet.getString(8), resultSet.getString(9)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcTools.release(con, statement, resultSet);
        }
        return goodsDetails;
    }

    /**
     * 获取各种种类的商品记录数目
     *
     * @param type
     * @return
     */
    public static int getTypesCount(String type) {
        Connection con = JdbcTools.getConnection();
        String sql = "select count(*) from goods_detail where type=?";
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        int count = 0;
        try {
            statement = con.prepareStatement(sql);
            statement.setString(1, type);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                count = resultSet.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcTools.release(con, statement, resultSet);
        }
        return count;
    }

    /**
     * 获取各种种类的商品记录
     *
     * @param type
     * @return
     */
    public static List<GoodsDetail> getTypesGoods(String type, int pageIndex) {
        Connection con = JdbcTools.getConnection();
        String sql = "select * from (select row_number() over (order by getdate()) as row,* from goods_detail where type=?)" +
                "as # where row>=? and row<=?;";
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        List<GoodsDetail> goods = new ArrayList<GoodsDetail>();
        try {
            statement = con.prepareStatement(sql);
            statement.setString(1, type);
            statement.setInt(2, pageIndex * 16 - 15);
            statement.setInt(3, pageIndex * 16);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                goods.add(new GoodsDetail(resultSet.getInt(2), resultSet.getInt(3),
                        resultSet.getString(4), resultSet.getString(5),
                        resultSet.getInt(6), resultSet.getString(7),
                        resultSet.getString(8), resultSet.getString(9)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcTools.release(con, statement, resultSet);
        }
        return goods;
    }

    /**
     * 获取指定id商品的全部信息
     *
     * @param id
     * @return
     */
    public static GoodsDetail getOneGoods(int id) {
        Connection con = JdbcTools.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        String sql = "select * from goods_detail where id=?;";
        GoodsDetail goodsDetail = null;
        try {
            statement = con.prepareStatement(sql);
            statement.setInt(1, id);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                goodsDetail = new GoodsDetail(resultSet.getInt(1), resultSet.getInt(2),
                        resultSet.getString(3), resultSet.getString(4), resultSet.getInt(5),
                        resultSet.getString(6), resultSet.getString(7), resultSet.getString(8));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcTools.release(con, statement, resultSet);
        }
        return goodsDetail;
    }
}
