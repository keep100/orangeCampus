package cn.orangecampus.entity;

/**
 * @author 16321
 */
public class BuyRecord {
    Integer userId,goodsId;

    public BuyRecord(){}

    public BuyRecord(Integer userId, Integer goodsId) {
        this.userId = userId;
        this.goodsId = goodsId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }
}
