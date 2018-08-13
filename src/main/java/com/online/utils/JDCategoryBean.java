package com.online.utils;

import java.util.List;

/**
 * 类目API 类目属性对象 获取类目属性列表 jingdong.category.read.findAttrsByCategoryIdJos
 */
public class JDCategoryBean {
    private String isRequired;          //是否必填,0表示非必填,1表示必填
    private String attName;             //属性名称
    private String inputType;           //属性的输入类型.1:单选 2:多选 3:可输入
    private String categoryAttrId;      //类目属性id
    private String attrIndexId;         //排序：越小越靠前
    private List<JDCategoryAttrValueBean> attrValues;       //属性值对象

    public String getInputType() {
        return inputType;
    }

    public void setInputType(String inputType) {
        this.inputType = inputType;
    }

    public String getIsRequired() {
        return isRequired;
    }

    public void setIsRequired(String isRequired) {
        this.isRequired = isRequired;
    }

    public String getAttName() {
        return attName;
    }

    public void setAttName(String attName) {
        this.attName = attName;
    }

    public String getCategoryAttrId() {
        return categoryAttrId;
    }

    public void setCategoryAttrId(String categoryAttrId) {
        this.categoryAttrId = categoryAttrId;
    }

    public String getAttrIndexId() {
        return attrIndexId;
    }

    public void setAttrIndexId(String attrIndexId) {
        this.attrIndexId = attrIndexId;
    }

    public List<JDCategoryAttrValueBean> getAttrValues() {
        return attrValues;
    }

    public void setAttrValues(List<JDCategoryAttrValueBean> attrValues) {
        this.attrValues = attrValues;
    }
}
