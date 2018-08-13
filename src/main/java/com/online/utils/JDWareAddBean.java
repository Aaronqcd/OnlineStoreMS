package com.online.utils;

import java.util.List;

/**
 * 商品API 商品属性 新增商品 360buy.ware.add
 */
public class JDWareAddBean {
    private String cid;             //类目id
    private String title;           //商品标题
    private String stockNum;        //库存
    private String length;          //长(单位:mm)
    private String wide;            //宽(单位:mm)
    private String high;            //高(单位:mm)
    private String weight;          //重量(单位:kg)
    private String marketPrice;     //市场价, 精确到2位小数，单位:元
    private String jdPrice;         //京东价,精确到2位小数，单位:元
    private String notes;           //描述（最多支持3万个英文字符）
    private String cname;           //类目名称
    private List<JDCategoryBean> categories;        //商品类目属性
    private String attributes;      //商品属性列表,多组之间用|分隔
    private String pic1;            //图片1
    private String pic2;            //图片2
    private String pic3;            //图片3
    //private String wareImage;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }

    public String getStockNum() {
        return stockNum;
    }

    public void setStockNum(String stockNum) {
        this.stockNum = stockNum;
    }

    public String getWide() {
        return wide;
    }

    public void setWide(String wide) {
        this.wide = wide;
    }

    public String getLength() {
        return length;
    }

    public void setLength(String length) {
        this.length = length;
    }

    public String getHigh() {
        return high;
    }

    public void setHigh(String high) {
        this.high = high;
    }

    public String getWeight() {
        return weight;
    }

    public void setWeight(String weight) {
        this.weight = weight;
    }

    public String getMarketPrice() {
        return marketPrice;
    }

    public void setMarketPrice(String marketPrice) {
        this.marketPrice = marketPrice;
    }

    public String getJdPrice() {
        return jdPrice;
    }

    public void setJdPrice(String jdPrice) {
        this.jdPrice = jdPrice;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public List<JDCategoryBean> getCategories() {
        return categories;
    }

    public void setCategories(List<JDCategoryBean> categories) {
        this.categories = categories;
    }

    public String getAttributes() {
        return attributes;
    }

    public void setAttributes(String attributes) {
        this.attributes = attributes;
    }

    public String getPic1() {
        return pic1;
    }

    public void setPic1(String pic1) {
        this.pic1 = pic1;
    }

    public String getPic2() {
        return pic2;
    }

    public void setPic2(String pic2) {
        this.pic2 = pic2;
    }

    public String getPic3() {
        return pic3;
    }

    public void setPic3(String pic3) {
        this.pic3 = pic3;
    }
}
