package com.online.utils;

/**
 * 类目API 属性值对象 通过类目属性ID获取属性值列表 jingdong.category.read.findValuesByAttrIdJos
 */
public class JDCategoryAttrValueBean {
    private String value;           //类目属性值
    private String id;              //类目属性值id
    private String indexId;         //排序

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getIndexId() {
        return indexId;
    }

    public void setIndexId(String indexId) {
        this.indexId = indexId;
    }
}
