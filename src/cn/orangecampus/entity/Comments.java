package cn.orangecampus.entity;

/**
 * @author 16321
 */
public class Comments {
    Integer id, goodsId, userId;
    String commentContent;
    Integer score;

    public Comments() {
    }

    public Comments(Integer id, Integer goodsId, Integer userId, String commentContent, Integer score) {
        this.id = id;
        this.goodsId = goodsId;
        this.userId = userId;
        this.commentContent = commentContent;
        this.score = score;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }
}
