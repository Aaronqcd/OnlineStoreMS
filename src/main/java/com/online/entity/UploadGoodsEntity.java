package com.online.entity;

import org.hibernate.annotations.GenericGenerator;
import org.jeecgframework.poi.excel.annotation.Excel;

import javax.persistence.*;
import java.util.Date;

/**   
 * @Title: Entity
 * @Description: 上传商品表
 * @author onlineGenerator
 * @date 2018-06-20 19:55:00
 * @version V1.0   
 *
 */
@Entity
@Table(name = "upload_goods", schema = "")
@SuppressWarnings("serial")
public class UploadGoodsEntity implements java.io.Serializable {
	/**主键*/
	private String id;
	/**创建人名称*/
	private String createName;
	/**创建人登录名称*/
	private String createBy;
	/**创建日期*/
	private Date createDate;
	/**更新人名称*/
	private String updateName;
	/**更新人登录名称*/
	private String updateBy;
	/**更新日期*/
	private Date updateDate;
	/**所属部门*/
	private String sysOrgCode;
	/**所属公司*/
	private String sysCompanyCode;
	/**序号*/
	@Excel(name="序号",width=15)
	private String serial;
	/**商品编号*/
	@Excel(name="商品编号",width=15)
	private String goodsNo;
	/**类别*/
	@Excel(name="类别",width=15)
	private String category;
	/**品牌*/
	@Excel(name="品牌",width=15)
	private String brand;
	/**产品名称*/
	@Excel(name="产品名称",width=15)
	private String productName;
	/**型号*/
	@Excel(name="型号",width=15)
	private String model;
	/**材质*/
	@Excel(name="材质",width=15)
	private String texture;
	/**规格*/
	@Excel(name="规格",width=15)
	private String specification;
	/**价格*/
	@Excel(name="价格",width=15)
	private String price;
	/**图片1*/
	@Excel(name="图片1",width=15,type=2)
	private String pic1;
	/**图片2*/
	@Excel(name="图片2",width=15,type=2)
	private String pic2;
	/**图片3*/
	@Excel(name="图片3",width=15,type=2)
	private String pic3;
	/**图片4*/
	@Excel(name="图片4",width=15,type=2)
	private String pic4;
	/**备注*/
	@Excel(name="备注",width=15)
	private String comment;
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  主键
	 */
	@Id
	@GeneratedValue(generator = "paymentableGenerator")
	@GenericGenerator(name = "paymentableGenerator", strategy = "uuid")

	@Column(name ="ID",nullable=false,length=36)
	public String getId(){
		return this.id;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  主键
	 */
	public void setId(String id){
		this.id = id;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  创建人名称
	 */

	@Column(name ="CREATE_NAME",nullable=true,length=50)
	public String getCreateName(){
		return this.createName;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  创建人名称
	 */
	public void setCreateName(String createName){
		this.createName = createName;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  创建人登录名称
	 */

	@Column(name ="CREATE_BY",nullable=true,length=50)
	public String getCreateBy(){
		return this.createBy;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  创建人登录名称
	 */
	public void setCreateBy(String createBy){
		this.createBy = createBy;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  创建日期
	 */

	@Column(name ="CREATE_DATE",nullable=true,length=20)
	public Date getCreateDate(){
		return this.createDate;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  创建日期
	 */
	public void setCreateDate(Date createDate){
		this.createDate = createDate;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  更新人名称
	 */

	@Column(name ="UPDATE_NAME",nullable=true,length=50)
	public String getUpdateName(){
		return this.updateName;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  更新人名称
	 */
	public void setUpdateName(String updateName){
		this.updateName = updateName;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  更新人登录名称
	 */

	@Column(name ="UPDATE_BY",nullable=true,length=50)
	public String getUpdateBy(){
		return this.updateBy;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  更新人登录名称
	 */
	public void setUpdateBy(String updateBy){
		this.updateBy = updateBy;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  更新日期
	 */

	@Column(name ="UPDATE_DATE",nullable=true,length=20)
	public Date getUpdateDate(){
		return this.updateDate;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  更新日期
	 */
	public void setUpdateDate(Date updateDate){
		this.updateDate = updateDate;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  所属部门
	 */

	@Column(name ="SYS_ORG_CODE",nullable=true,length=50)
	public String getSysOrgCode(){
		return this.sysOrgCode;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  所属部门
	 */
	public void setSysOrgCode(String sysOrgCode){
		this.sysOrgCode = sysOrgCode;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  所属公司
	 */

	@Column(name ="SYS_COMPANY_CODE",nullable=true,length=50)
	public String getSysCompanyCode(){
		return this.sysCompanyCode;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  所属公司
	 */
	public void setSysCompanyCode(String sysCompanyCode){
		this.sysCompanyCode = sysCompanyCode;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  序号
	 */

	@Column(name ="SERIAL",nullable=true,length=10)
	public String getSerial(){
		return this.serial;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  序号
	 */
	public void setSerial(String serial){
		this.serial = serial;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  商品编号
	 */

	@Column(name ="GOODS_NO",nullable=true,length=50)
	public String getGoodsNo(){
		return this.goodsNo;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  商品编号
	 */
	public void setGoodsNo(String goodsNo){
		this.goodsNo = goodsNo;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  类别
	 */

	@Column(name ="CATEGORY",nullable=true,length=50)
	public String getCategory(){
		return this.category;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  类别
	 */
	public void setCategory(String category){
		this.category = category;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  品牌
	 */

	@Column(name ="BRAND",nullable=true,length=100)
	public String getBrand(){
		return this.brand;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  品牌
	 */
	public void setBrand(String brand){
		this.brand = brand;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  产品名称
	 */

	@Column(name ="PRODUCT_NAME",nullable=true,length=255)
	public String getProductName(){
		return this.productName;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  产品名称
	 */
	public void setProductName(String productName){
		this.productName = productName;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  型号
	 */

	@Column(name ="MODEL",nullable=true,length=100)
	public String getModel(){
		return this.model;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  型号
	 */
	public void setModel(String model){
		this.model = model;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  材质
	 */

	@Column(name ="TEXTURE",nullable=true,length=255)
	public String getTexture(){
		return this.texture;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  材质
	 */
	public void setTexture(String texture){
		this.texture = texture;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  规格
	 */

	@Column(name ="SPECIFICATION",nullable=true,length=100)
	public String getSpecification(){
		return this.specification;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  规格
	 */
	public void setSpecification(String specification){
		this.specification = specification;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  价格
	 */

	@Column(name ="PRICE",nullable=true,length=32)
	public String getPrice(){
		return this.price;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  价格
	 */
	public void setPrice(String price){
		this.price = price;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  图片1
	 */

	@Column(name ="PIC1",nullable=true,length=255)
	public String getPic1(){
		return this.pic1;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  图片1
	 */
	public void setPic1(String pic1){
		this.pic1 = pic1;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  图片2
	 */

	@Column(name ="PIC2",nullable=true,length=255)
	public String getPic2(){
		return this.pic2;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  图片2
	 */
	public void setPic2(String pic2){
		this.pic2 = pic2;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  图片3
	 */

	@Column(name ="PIC3",nullable=true,length=255)
	public String getPic3(){
		return this.pic3;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  图片3
	 */
	public void setPic3(String pic3){
		this.pic3 = pic3;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  图片4
	 */

	@Column(name ="PIC4",nullable=true,length=255)
	public String getPic4(){
		return this.pic4;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  图片4
	 */
	public void setPic4(String pic4){
		this.pic4 = pic4;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  备注
	 */

	@Column(name ="COMMENT",nullable=true,length=255)
	public String getComment(){
		return this.comment;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  备注
	 */
	public void setComment(String comment){
		this.comment = comment;
	}
}
