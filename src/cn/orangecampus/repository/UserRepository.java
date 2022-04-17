package cn.orangecampus.repository;

import cn.orangecampus.entity.GoodsDetail;
import cn.orangecampus.entity.User;
import cn.orangecampus.utils.JdbcTools;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * 负责与数据库的用户表进行交互
 *
 * @author 16321
 */
public class UserRepository {
    /**
     * 处理登录业务
     *
     * @param username
     * @param password
     * @return
     */
    public static User login(String username, String password) {
        Connection connection = JdbcTools.getConnection();
        String sql = "select * from [user] where username=? and password=?";
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        User user = null;
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, password);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                user = new User(resultSet.getInt(1), resultSet.getString(2),
                        resultSet.getString(3), resultSet.getString(4),
                        resultSet.getString(5), resultSet.getString(6), resultSet.getString(7));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcTools.release(connection, statement, resultSet);
        }
        return user;
    }

    /**
     * 处理注册业务
     */
    public static boolean nameIsExist(String username) {
        Connection con = JdbcTools.getConnection();
        String sql = "select username from [user] where username=?";
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        String ans = "";
        try {
            statement = con.prepareStatement(sql);
            statement.setString(1, username);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                ans = resultSet.getString(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcTools.release(con, statement, resultSet);
        }
        if (ans.equals("")) {
            return false;
        }
        return true;
    }

    public static int countAllUsers() {
        Connection con = JdbcTools.getConnection();
        String sql = "select count(*) from [user]";
        PreparedStatement statement = null;
        ResultSet resultSet = null;
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

    public static int register(String username, String password, String tel) {
        Connection con = JdbcTools.getConnection();
        int id = countAllUsers() + 1;
        String sql = "insert into [user] values(?,?,?,null,?,null,?)";
        PreparedStatement statement = null;
        try {
            statement = con.prepareStatement(sql);
            statement.setInt(1, id);
            statement.setString(2, username);
            statement.setString(3, password);
            statement.setString(4, "image/默认头像.png");
            statement.setString(5, tel);
            return statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcTools.release(con, statement, null);
        }
        return 0;
    }

    public static String findPwd(String email) {
        Connection con = JdbcTools.getConnection();
        String sql = "select password from [user] where email=?";
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            statement = con.prepareStatement(sql);
            statement.setString(1, email);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                return resultSet.getString(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcTools.release(con, statement, null);
        }
        return "";
    }

    /**
     * 更新用户微信号
     *
     * @param userId
     * @param weChatId
     */
    public static void updateWeChatId(int userId, String weChatId) {
        Connection con = JdbcTools.getConnection();
        String sql = "update [user] set weChatId=? where id=?";
        PreparedStatement statement = null;
        try {
            statement = con.prepareStatement(sql);
            statement.setString(1, weChatId);
            statement.setInt(2, userId);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcTools.release(con, statement, null);
        }
    }

    /**
     * 更新用户部分信息
     *
     * @param id
     * @param weChatId
     * @param iconUrl
     * @param signature
     */
    public static void updateUserInfo(String username,int id, String weChatId, String iconUrl, String signature) {
        Connection con = JdbcTools.getConnection();
        String sql = "";
        PreparedStatement statement = null;
        try {
            if(iconUrl.equals("")){
                sql="update [user] set username=?,weChatId=?,signature=? where id=?";
                statement=con.prepareStatement(sql);
                statement.setString(1,username);
                statement.setString(2,weChatId);
                statement.setString(3,signature);
                statement.setInt(4,id);
            }
            else{
                sql="update [user] set username=?,weChatId=?,signature=?,iconUrl=? where id=?";
                statement=con.prepareStatement(sql);
                statement.setString(1,username);
                statement.setString(2,weChatId);
                statement.setString(3,signature);
                statement.setString(4,iconUrl);
                statement.setInt(5,id);
            }
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
        }
    }

    /**
     * 获取单个用户
     *
     * @param userId
     * @return
     */
    public static User getOneUser(int userId) {
        Connection con = JdbcTools.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        String sql = "select * from [user] where id=?";
        User user = null;
        try {
            statement = con.prepareStatement(sql);
            statement.setInt(1, userId);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                user = new User(resultSet.getInt(1), resultSet.getString(2),
                        resultSet.getString(3), resultSet.getString(4),
                        resultSet.getString(5), resultSet.getString(6),
                        resultSet.getString(7));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcTools.release(con, statement, resultSet);
        }
        return user;
    }
}
