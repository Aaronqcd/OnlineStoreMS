package com.online.entity;

import javax.persistence.*;

/**
 * @description 商品实体类
 * @author      aaron
 * @date        2018/05/22
 */
@Entity
@Table(name = "goods", schema = "")
@SuppressWarnings("serial")
public class GoodsEntity implements java.io.Serializable {
	/**主键*/
	private Integer id;
	/**商品分类*/
	private String category;
	/**商品标题*/
	private String title;
	/**商品价格*/
	private String price;
	/**淘宝价*/
	private String taobaoPrice;
	/**交易数*/
	private String dealNumber;
	/**评论数*/
	private String commentNumber;
	/**人气值*/
	private String popularityValue;
	/**抓取时间*/
	private String grabDate;
	/**原店铺链接*/
	private String link;
	/**商品图片1*/
	private String picture1;
	/**商品图片2*/
	private String picture2;
	/**商品图片3*/
	private String picture3;

	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  主键
	 */

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name ="ID",nullable=false,precision=10,scale=0)
	public Integer getId(){
		return this.id;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  主键
	 */
	public void setId(Integer id){
		this.id = id;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  商品分类
	 */
	@Column(name ="CATEGORY",nullable=true,length=100)
	public String getCategory(){
		return this.category;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  商品分类
	 */
	public void setCategory(String category){
		this.category = category;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  商品标题
	 */
	@Column(name ="TITLE",nullable=true,length=255)
	public String getTitle(){
		return this.title;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  商品标题
	 */
	public void setTitle(String title){
		this.title = title;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  商品价格
	 */
	@Column(name ="PRICE",nullable=true,length=50)
	public String getPrice(){
		return this.price;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  商品价格
	 */
	public void setPrice(String price){
		this.price = price;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  淘宝价
	 */
	@Column(name ="TAOBAO_PRICE",nullable=true,length=50)
	public String getTaobaoPrice(){
		return this.taobaoPrice;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  淘宝价
	 */
	public void setTaobaoPrice(String taobaoPrice){
		this.taobaoPrice = taobaoPrice;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  交易数
	 */
	@Column(name ="DEAL_NUMBER",nullable=true,length=20)
	public String getDealNumber(){
		return this.dealNumber;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  交易数
	 */
	public void setDealNumber(String dealNumber){
		this.dealNumber = dealNumber;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  评论数
	 */
	@Column(name ="COMMENT_NUMBER",nullable=true,length=20)
	public String getCommentNumber(){
		return this.commentNumber;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  评论数
	 */
	public void setCommentNumber(String commentNumber){
		this.commentNumber = commentNumber;
	}
	/**
	 *方法: 取得java.lang.Object
	 *@return: java.lang.Object  人气值
	 */
	@Column(name ="POPULARITY_VALUE",nullable=true,length=20)
	public String getPopularityValue(){
		return this.popularityValue;
	}

	/**
	 *方法: 设置java.lang.Object
	 *@param: java.lang.Object  人气值
	 */
	public void setPopularityValue(String popularityValue){
		this.popularityValue = popularityValue;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  抓取时间
	 */
	@Column(name ="GRAB_DATE",nullable=true,length=30)
	public String getGrabDate(){
		return this.grabDate;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  抓取时间
	 */
	public void setGrabDate(String grabDate){
		this.grabDate = grabDate;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  原店铺链接
	 */
	@Column(name ="LINK",nullable=true,length=255)
	public String getLink(){
		return this.link;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  原店铺链接
	 */
	public void setLink(String link){
		this.link = link;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  商品图片1
	 */
	@Column(name ="PICTURE1",nullable=true,length=255)
	public String getPicture1(){
		return this.picture1;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  商品图片1
	 */
	public void setPicture1(String picture1){
		this.picture1 = picture1;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  商品图片2
	 */
	@Column(name ="PICTURE2",nullable=true,length=255)
	public String getPicture2(){
		return this.picture2;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  商品图片2
	 */
	public void setPicture2(String picture2){
		this.picture2 = picture2;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  商品图片3
	 */
	@Column(name ="PICTURE3",nullable=true,length=255)
	public String getPicture3(){
		return this.picture3;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  商品图片3
	 */
	public void setPicture3(String picture3){
		this.picture3 = picture3;
	}
}
