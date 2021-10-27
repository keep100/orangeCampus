package cn.orangecampus.repository;

import cn.orangecampus.entity.WantRecord;
import cn.orangecampus.utils.JdbcTools;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * 负责求购记录的后台交互
 *
 * @author 16321
 */
public class WantRecordRepository {
    /**
     * 每次获取的记录数目
     */
    private static final int LIMIT = 10;

    /**
     * 查询求购记录总数目
     *
     * @return 求购记录总数
     */
    public static int countRecords() {
        Connection con = JdbcTools.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        String sql = "select count(*) from want_record";
        try {
            statement = con.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                return resultSet.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcTools.release(con, statement, resultSet);
        }
        return 0;
    }

    /**
     * @return 显示所有记录需要的总页数
     */
    public static int pages() {
        return (int) Math.ceil((double) countRecords() / LIMIT);
    }

    /**
     * 获取已经删除的求购记录数目
     *
     * @return {int}
     */
    public static int countDeleted() {
        Connection con = JdbcTools.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        String sql = "select count(*) from deleted where type='求购'";
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
     * 插入求购记录
     *
     * @param userId    用户id
     * @param title     求购标题
     * @param goodsDesc 求购商品描述
     * @param wantPrice 想要的价格
     */
    public static void addRecord(int userId, String title, String goodsDesc, int wantPrice) {
        Connection con = JdbcTools.getConnection();
        PreparedStatement statement = null;
        int id = countRecords() + countDeleted() + 1;
        String sql = "insert into want_record values (?,?,?,?,?)";
        try {
            statement = con.prepareStatement(sql);
            statement.setInt(1, id);
            statement.setInt(2, userId);
            statement.setString(3, title);
            statement.setString(4, goodsDesc);
            statement.setInt(5, wantPrice);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcTools.release(con, statement, null);
        }
    }

    /**
     * 获取求购记录
     *
     * @param page 页码
     * @return 十条求购记录
     */
    public static List<WantRecord> getRecords(int page) {
        Connection con = JdbcTools.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        String sql = "select * from (select row_number() over (order by getdate()) as row,* from want_record)" +
                "as # where row>=? and row<=?;";
        List<WantRecord> list = new ArrayList<>();
        try {
            statement = con.prepareStatement(sql);
            statement.setInt(1, page * 10 - 9);
            statement.setInt(2, page * 10);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                list.add(new WantRecord(resultSet.getInt(2), resultSet.getInt(3),
                        resultSet.getString(4), resultSet.getString(5),
                        resultSet.getInt(6)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcTools.release(con, statement, resultSet);
        }
        return list;
    }

    /**
     * 获取某个用户全部的求购记录
     *
     * @param userId 用户id
     * @return
     */
    public static List<WantRecord> getWantRecordList(int userId) {
        Connection con = JdbcTools.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        List<WantRecord> list = new ArrayList<>();
        String sql = "select * from want_record where userId=?;";
        try {
            statement = con.prepareStatement(sql);
            statement.setInt(1, userId);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                list.add(new WantRecord(resultSet.getInt(1), resultSet.getInt(2), resultSet.getString(3),
                        resultSet.getString(4), resultSet.getInt(5)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcTools.release(con, statement, resultSet);
        }
        return list;
    }

    /**
     * 删除一条求购记录
     *
     * @param id 求购记录id
     */
    public static void delWantRecord(int id) {
        Connection con = JdbcTools.getConnection();
        PreparedStatement statement = null;
        String sql = "delete from want_record where id=?";
        try {
            statement = con.prepareStatement(sql);
            statement.setInt(1, id);
            statement.executeUpdate();
            String newSql = "insert into deleted values ('求购')";
            statement = con.prepareStatement(newSql);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcTools.release(con, statement, null);
        }
    }
}
