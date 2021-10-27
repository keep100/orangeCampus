package cn.orangecampus.repository;

import cn.orangecampus.entity.Comments;
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
public class CommentRepository {
    /**
     * 获取各种评论
     *
     * @param goodsId
     * @param commentType
     * @return
     */
    public static List<Comments> getTypeComment(int goodsId, int commentType) {
        Connection con = JdbcTools.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        String sql = "";
        List<Comments> comments = new ArrayList<>();
        switch (commentType) {
            case 0:
                sql = "select * from comments where goodsId=?;";
                break;
            case 1:
                sql = "select * from comments where goodsId=? and score=5;";
                break;
            case 2:
                sql = "select * from comments where goodsId=? and score between 3 and 4;";
                break;
            case 3:
                sql = "select * from comments where goodsId=? and score between 1 and 2;";
                break;
            default:
                break;
        }
        try {
            statement = con.prepareStatement(sql);
            statement.setInt(1, goodsId);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                comments.add(new Comments(resultSet.getInt(1), resultSet.getInt(2),
                        resultSet.getInt(3), resultSet.getString(4), resultSet.getInt(5)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcTools.release(con, statement, resultSet);
        }
        return comments;
    }

    /**
     * 获取全部评论数目
     *
     * @return
     */
    public static int countComments() {
        Connection con = JdbcTools.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        String sql = "select count(*) from comments";
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
     * 添加评论
     *
     * @param goodsId
     * @param userId
     * @param commentContent
     * @param score
     */
    public static void addComment(int goodsId, int userId, String commentContent, int score) {
        int id = countComments() + 1;
        Connection con = JdbcTools.getConnection();
        PreparedStatement statement = null;
        String sql = "insert into comments values (?,?,?,?,?)";
        try {
            statement = con.prepareStatement(sql);
            statement.setInt(1, id);
            statement.setInt(2, goodsId);
            statement.setInt(3, userId);
            statement.setString(4, commentContent);
            statement.setInt(5, score);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcTools.release(con, statement, null);
        }
    }
}
