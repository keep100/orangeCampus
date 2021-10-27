package cn.orangecampus.entity;

/**
 * @author 16321
 */
public class GoodsDetail {
    Integer id, userId;
    String goodsName, goodsDesc;
    Integer price;
    String labels, type, imgUrl;

    public GoodsDetail() {
    }

    public GoodsDetail(Integer id, Integer userId, String goodsName, String goodsDesc, Integer price, String labels, String type, String imgUrl) {
        this.id = id;
        this.userId = userId;
        this.goodsName = goodsName;
        this.goodsDesc = goodsDesc;
        this.price = price;
        this.labels = labels;
        this.type = type;
        this.imgUrl = imgUrl;
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

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public String getGoodsDesc() {
        return goodsDesc;
    }

    public void setGoodsDesc(String goodsDesc) {
        this.goodsDesc = goodsDesc;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public String getLabels() {
        return labels;
    }

    public void setLabels(String labels) {
        this.labels = labels;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }
}
