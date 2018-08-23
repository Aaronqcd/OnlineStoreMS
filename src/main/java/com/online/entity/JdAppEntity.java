package com.online.entity;

import org.hibernate.annotations.GenericGenerator;
import org.jeecgframework.poi.excel.annotation.Excel;

import javax.persistence.*;

/**   
 * @Title: Entity
 * @Description: 京东app接口表
 * @author onlineGenerator
 * @date 2018-08-05 22:41:27
 * @version V1.0   
 *
 */
@Entity
@Table(name = "jd_app", schema = "")
@SuppressWarnings("serial")
public class JdAppEntity implements java.io.Serializable {
	/**主键*/
	private String id;
	/**token*/
	@Excel(name="token",width=15)
	private String accessToken;
	/**key*/
	@Excel(name="key",width=15)
	private String appKey;
	/**secret*/
	@Excel(name="secret",width=15)
	private String appSecret;
	/**url*/
	@Excel(name="url",width=15)
	private String serverUrl;
	private String refreshToken;
	private String userId;
	private String code;
	
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
	 *@return: java.lang.String  token
	 */

	@Column(name ="ACCESS_TOKEN",nullable=true,length=36)
	public String getAccessToken(){
		return this.accessToken;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  token
	 */
	public void setAccessToken(String accessToken){
		this.accessToken = accessToken;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  key
	 */

	@Column(name ="APP_KEY",nullable=true,length=32)
	public String getAppKey(){
		return this.appKey;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  key
	 */
	public void setAppKey(String appKey){
		this.appKey = appKey;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  secret
	 */

	@Column(name ="APP_SECRET",nullable=true,length=32)
	public String getAppSecret(){
		return this.appSecret;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  secret
	 */
	public void setAppSecret(String appSecret){
		this.appSecret = appSecret;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  url
	 */

	@Column(name ="SERVER_URL",nullable=true,length=255)
	public String getServerUrl(){
		return this.serverUrl;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  url
	 */
	public void setServerUrl(String serverUrl){
		this.serverUrl = serverUrl;
	}

	@Column(name ="REFRESH_TOKEN",nullable=true,length=36)
	public String getRefreshToken() {
		return refreshToken;
	}

	public void setRefreshToken(String refreshToken) {
		this.refreshToken = refreshToken;
	}

	@Column(name ="USER_ID",nullable=true,length=36)
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Column(name ="CODE",nullable=true,length=32)
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
}
