package cn.orangecampus.entity;

/**
 * @author 16321
 */
public class WantRecord {
    Integer id, userId;
    String title, goodsDesc;
    Integer wantPrice;

    public WantRecord() {
    }

    public WantRecord(Integer id, Integer userId, String title, String goodsDesc, Integer wantPrice) {
        this.id = id;
        this.userId = userId;
        this.title = title;
        this.goodsDesc = goodsDesc;
        this.wantPrice = wantPrice;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getGoodsDesc() {
        return goodsDesc;
    }

    public void setGoodsDesc(String goodsDesc) {
        this.goodsDesc = goodsDesc;
    }

    public Integer getWantPrice() {
        return wantPrice;
    }

    public void setWantPrice(Integer wantPrice) {
        this.wantPrice = wantPrice;
    }
}
