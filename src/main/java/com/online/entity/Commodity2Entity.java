package com.online.entity;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;

/**   
 * @Title: Entity
 * @Description: 商品表
 * @author zhangdaihao
 * @date 2018-05-30 22:35:24
 * @version V1.0   
 *
 */
@Entity
@Table(name = "commodity", schema = "")
@DynamicUpdate(true)
@DynamicInsert(true)
@SuppressWarnings("serial")
public class Commodity2Entity implements java.io.Serializable {
	/**id*/
	private Integer id;
	/**col001*/
	private String col001;
	/**col002*/
	private String col002;
	/**col003*/
	private String col003;
	/**col004*/
	private String col004;
	/**col005*/
	private String col005;
	/**col006*/
	private String col006;
	/**col007*/
	private String col007;
	/**col008*/
	private String col008;
	/**col009*/
	private String col009;
	/**col010*/
	private String col010;
	/**col011*/
	private String col011;
	/**col012*/
	private String col012;
	/**col013*/
	private String col013;
	/**col014*/
	private String col014;
	/**col015*/
	private String col015;
	/**col016*/
	private String col016;
	/**col017*/
	private String col017;
	/**col018*/
	private String col018;
	/**col019*/
	private String col019;
	/**col020*/
	private String col020;
	/**col021*/
	private String col021;
	/**col022*/
	private String col022;
	/**col023*/
	private String col023;
	/**col024*/
	private String col024;
	/**col025*/
	private String col025;
	/**col026*/
	private String col026;
	/**col027*/
	private String col027;
	/**col028*/
	private String col028;
	/**col029*/
	private String col029;
	/**col030*/
	private String col030;
	/**col031*/
	private String col031;
	/**col032*/
	private String col032;
	/**col033*/
	private String col033;
	/**col034*/
	private String col034;
	/**col035*/
	private String col035;
	/**col036*/
	private String col036;
	/**col037*/
	private String col037;
	/**col038*/
	private String col038;
	/**col039*/
	private String col039;
	/**col040*/
	private String col040;
	/**col041*/
	private String col041;
	/**col042*/
	private String col042;
	/**col043*/
	private String col043;
	/**col044*/
	private String col044;
	/**col045*/
	private String col045;
	/**col046*/
	private String col046;
	/**col047*/
	private String col047;
	/**col048*/
	private String col048;
	/**col049*/
	private String col049;
	/**col050*/
	private String col050;
	/**col051*/
	private String col051;
	/**col052*/
	private String col052;
	/**col053*/
	private String col053;
	/**col054*/
	private String col054;
	/**col055*/
	private String col055;
	/**col056*/
	private String col056;
	/**col057*/
	private String col057;
	/**col058*/
	private String col058;
	/**col059*/
	private String col059;
	/**col060*/
	private String col060;
	/**col061*/
	private String col061;
	/**col062*/
	private String col062;
	/**col063*/
	private String col063;
	/**col064*/
	private String col064;
	/**col065*/
	private String col065;
	/**col066*/
	private String col066;
	/**col067*/
	private String col067;
	/**col068*/
	private String col068;
	/**col069*/
	private String col069;
	/**col070*/
	private String col070;
	/**col071*/
	private String col071;
	/**col072*/
	private String col072;
	/**col073*/
	private String col073;
	/**col074*/
	private String col074;
	/**col075*/
	private String col075;
	/**col076*/
	private String col076;
	/**col077*/
	private String col077;
	/**col078*/
	private String col078;
	/**col079*/
	private String col079;
	/**col080*/
	private String col080;

	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  id
	 */

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name ="ID",nullable=false,precision=10,scale=0)
	public Integer getId(){
		return this.id;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  id
	 */
	public void setId(Integer id){
		this.id = id;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col001
	 */
	@Column(name ="COL001",nullable=true,length=255)
	public String getCol001(){
		return this.col001;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col001
	 */
	public void setCol001(String col001){
		this.col001 = col001;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col002
	 */
	@Column(name ="COL002",nullable=true,length=255)
	public String getCol002(){
		return this.col002;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col002
	 */
	public void setCol002(String col002){
		this.col002 = col002;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col003
	 */
	@Column(name ="COL003",nullable=true,length=255)
	public String getCol003(){
		return this.col003;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col003
	 */
	public void setCol003(String col003){
		this.col003 = col003;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col004
	 */
	@Column(name ="COL004",nullable=true,length=255)
	public String getCol004(){
		return this.col004;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col004
	 */
	public void setCol004(String col004){
		this.col004 = col004;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col005
	 */
	@Column(name ="COL005",nullable=true,length=255)
	public String getCol005(){
		return this.col005;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col005
	 */
	public void setCol005(String col005){
		this.col005 = col005;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col006
	 */
	@Column(name ="COL006",nullable=true,length=255)
	public String getCol006(){
		return this.col006;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col006
	 */
	public void setCol006(String col006){
		this.col006 = col006;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col007
	 */
	@Column(name ="COL007",nullable=true,length=255)
	public String getCol007(){
		return this.col007;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col007
	 */
	public void setCol007(String col007){
		this.col007 = col007;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col008
	 */
	@Column(name ="COL008",nullable=true,length=255)
	public String getCol008(){
		return this.col008;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col008
	 */
	public void setCol008(String col008){
		this.col008 = col008;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col009
	 */
	@Column(name ="COL009",nullable=true,length=255)
	public String getCol009(){
		return this.col009;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col009
	 */
	public void setCol009(String col009){
		this.col009 = col009;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col010
	 */
	@Column(name ="COL010",nullable=true,length=255)
	public String getCol010(){
		return this.col010;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col010
	 */
	public void setCol010(String col010){
		this.col010 = col010;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col011
	 */
	@Column(name ="COL011",nullable=true,length=255)
	public String getCol011(){
		return this.col011;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col011
	 */
	public void setCol011(String col011){
		this.col011 = col011;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col012
	 */
	@Column(name ="COL012",nullable=true,length=255)
	public String getCol012(){
		return this.col012;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col012
	 */
	public void setCol012(String col012){
		this.col012 = col012;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col013
	 */
	@Column(name ="COL013",nullable=true,length=255)
	public String getCol013(){
		return this.col013;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col013
	 */
	public void setCol013(String col013){
		this.col013 = col013;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col014
	 */
	@Column(name ="COL014",nullable=true,length=255)
	public String getCol014(){
		return this.col014;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col014
	 */
	public void setCol014(String col014){
		this.col014 = col014;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col015
	 */
	@Column(name ="COL015",nullable=true,length=255)
	public String getCol015(){
		return this.col015;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col015
	 */
	public void setCol015(String col015){
		this.col015 = col015;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col016
	 */
	@Column(name ="COL016",nullable=true,length=255)
	public String getCol016(){
		return this.col016;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col016
	 */
	public void setCol016(String col016){
		this.col016 = col016;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col017
	 */
	@Column(name ="COL017",nullable=true,length=255)
	public String getCol017(){
		return this.col017;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col017
	 */
	public void setCol017(String col017){
		this.col017 = col017;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col018
	 */
	@Column(name ="COL018",nullable=true,length=255)
	public String getCol018(){
		return this.col018;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col018
	 */
	public void setCol018(String col018){
		this.col018 = col018;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col019
	 */
	@Column(name ="COL019",nullable=true,length=255)
	public String getCol019(){
		return this.col019;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col019
	 */
	public void setCol019(String col019){
		this.col019 = col019;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col020
	 */
	@Column(name ="COL020",nullable=true,length=255)
	public String getCol020(){
		return this.col020;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col020
	 */
	public void setCol020(String col020){
		this.col020 = col020;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col021
	 */
	@Column(name ="COL021",nullable=true,length=255)
	public String getCol021(){
		return this.col021;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col021
	 */
	public void setCol021(String col021){
		this.col021 = col021;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col022
	 */
	@Column(name ="COL022",nullable=true,length=255)
	public String getCol022(){
		return this.col022;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col022
	 */
	public void setCol022(String col022){
		this.col022 = col022;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col023
	 */
	@Column(name ="COL023",nullable=true,length=255)
	public String getCol023(){
		return this.col023;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col023
	 */
	public void setCol023(String col023){
		this.col023 = col023;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col024
	 */
	@Column(name ="COL024",nullable=true,length=255)
	public String getCol024(){
		return this.col024;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col024
	 */
	public void setCol024(String col024){
		this.col024 = col024;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col025
	 */
	@Column(name ="COL025",nullable=true,length=255)
	public String getCol025(){
		return this.col025;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col025
	 */
	public void setCol025(String col025){
		this.col025 = col025;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col026
	 */
	@Column(name ="COL026",nullable=true,length=255)
	public String getCol026(){
		return this.col026;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col026
	 */
	public void setCol026(String col026){
		this.col026 = col026;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col027
	 */
	@Column(name ="COL027",nullable=true,length=255)
	public String getCol027(){
		return this.col027;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col027
	 */
	public void setCol027(String col027){
		this.col027 = col027;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col028
	 */
	@Column(name ="COL028",nullable=true,length=255)
	public String getCol028(){
		return this.col028;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col028
	 */
	public void setCol028(String col028){
		this.col028 = col028;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col029
	 */
	@Column(name ="COL029",nullable=true,length=255)
	public String getCol029(){
		return this.col029;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col029
	 */
	public void setCol029(String col029){
		this.col029 = col029;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col030
	 */
	@Column(name ="COL030",nullable=true,length=255)
	public String getCol030(){
		return this.col030;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col030
	 */
	public void setCol030(String col030){
		this.col030 = col030;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col031
	 */
	@Column(name ="COL031",nullable=true,length=255)
	public String getCol031(){
		return this.col031;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col031
	 */
	public void setCol031(String col031){
		this.col031 = col031;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col032
	 */
	@Column(name ="COL032",nullable=true,length=255)
	public String getCol032(){
		return this.col032;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col032
	 */
	public void setCol032(String col032){
		this.col032 = col032;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col033
	 */
	@Column(name ="COL033",nullable=true,length=255)
	public String getCol033(){
		return this.col033;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col033
	 */
	public void setCol033(String col033){
		this.col033 = col033;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col034
	 */
	@Column(name ="COL034",nullable=true,length=255)
	public String getCol034(){
		return this.col034;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col034
	 */
	public void setCol034(String col034){
		this.col034 = col034;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col035
	 */
	@Column(name ="COL035",nullable=true,length=255)
	public String getCol035(){
		return this.col035;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col035
	 */
	public void setCol035(String col035){
		this.col035 = col035;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col036
	 */
	@Column(name ="COL036",nullable=true,length=255)
	public String getCol036(){
		return this.col036;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col036
	 */
	public void setCol036(String col036){
		this.col036 = col036;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col037
	 */
	@Column(name ="COL037",nullable=true,length=255)
	public String getCol037(){
		return this.col037;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col037
	 */
	public void setCol037(String col037){
		this.col037 = col037;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col038
	 */
	@Column(name ="COL038",nullable=true,length=255)
	public String getCol038(){
		return this.col038;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col038
	 */
	public void setCol038(String col038){
		this.col038 = col038;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col039
	 */
	@Column(name ="COL039",nullable=true,length=255)
	public String getCol039(){
		return this.col039;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col039
	 */
	public void setCol039(String col039){
		this.col039 = col039;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col040
	 */
	@Column(name ="COL040",nullable=true,length=255)
	public String getCol040(){
		return this.col040;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col040
	 */
	public void setCol040(String col040){
		this.col040 = col040;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col041
	 */
	@Column(name ="COL041",nullable=true,length=255)
	public String getCol041(){
		return this.col041;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col041
	 */
	public void setCol041(String col041){
		this.col041 = col041;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col042
	 */
	@Column(name ="COL042",nullable=true,length=255)
	public String getCol042(){
		return this.col042;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col042
	 */
	public void setCol042(String col042){
		this.col042 = col042;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col043
	 */
	@Column(name ="COL043",nullable=true,length=255)
	public String getCol043(){
		return this.col043;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col043
	 */
	public void setCol043(String col043){
		this.col043 = col043;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col044
	 */
	@Column(name ="COL044",nullable=true,length=255)
	public String getCol044(){
		return this.col044;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col044
	 */
	public void setCol044(String col044){
		this.col044 = col044;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col045
	 */
	@Column(name ="COL045",nullable=true,length=255)
	public String getCol045(){
		return this.col045;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col045
	 */
	public void setCol045(String col045){
		this.col045 = col045;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col046
	 */
	@Column(name ="COL046",nullable=true,length=255)
	public String getCol046(){
		return this.col046;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col046
	 */
	public void setCol046(String col046){
		this.col046 = col046;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col047
	 */
	@Column(name ="COL047",nullable=true,length=255)
	public String getCol047(){
		return this.col047;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col047
	 */
	public void setCol047(String col047){
		this.col047 = col047;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col048
	 */
	@Column(name ="COL048",nullable=true,length=255)
	public String getCol048(){
		return this.col048;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col048
	 */
	public void setCol048(String col048){
		this.col048 = col048;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col049
	 */
	@Column(name ="COL049",nullable=true,length=255)
	public String getCol049(){
		return this.col049;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col049
	 */
	public void setCol049(String col049){
		this.col049 = col049;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col050
	 */
	@Column(name ="COL050",nullable=true,length=255)
	public String getCol050(){
		return this.col050;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col050
	 */
	public void setCol050(String col050){
		this.col050 = col050;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col051
	 */
	@Column(name ="COL051",nullable=true,length=255)
	public String getCol051(){
		return this.col051;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col051
	 */
	public void setCol051(String col051){
		this.col051 = col051;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col052
	 */
	@Column(name ="COL052",nullable=true,length=255)
	public String getCol052(){
		return this.col052;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col052
	 */
	public void setCol052(String col052){
		this.col052 = col052;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col053
	 */
	@Column(name ="COL053",nullable=true,length=255)
	public String getCol053(){
		return this.col053;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col053
	 */
	public void setCol053(String col053){
		this.col053 = col053;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col054
	 */
	@Column(name ="COL054",nullable=true,length=255)
	public String getCol054(){
		return this.col054;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col054
	 */
	public void setCol054(String col054){
		this.col054 = col054;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col055
	 */
	@Column(name ="COL055",nullable=true,length=255)
	public String getCol055(){
		return this.col055;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col055
	 */
	public void setCol055(String col055){
		this.col055 = col055;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col056
	 */
	@Column(name ="COL056",nullable=true,length=255)
	public String getCol056(){
		return this.col056;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col056
	 */
	public void setCol056(String col056){
		this.col056 = col056;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col057
	 */
	@Column(name ="COL057",nullable=true,length=255)
	public String getCol057(){
		return this.col057;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col057
	 */
	public void setCol057(String col057){
		this.col057 = col057;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col058
	 */
	@Column(name ="COL058",nullable=true,length=255)
	public String getCol058(){
		return this.col058;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col058
	 */
	public void setCol058(String col058){
		this.col058 = col058;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col059
	 */
	@Column(name ="COL059",nullable=true,length=255)
	public String getCol059(){
		return this.col059;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col059
	 */
	public void setCol059(String col059){
		this.col059 = col059;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col060
	 */
	@Column(name ="COL060",nullable=true,length=255)
	public String getCol060(){
		return this.col060;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col060
	 */
	public void setCol060(String col060){
		this.col060 = col060;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col061
	 */
	@Column(name ="COL061",nullable=true,length=255)
	public String getCol061(){
		return this.col061;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col061
	 */
	public void setCol061(String col061){
		this.col061 = col061;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col062
	 */
	@Column(name ="COL062",nullable=true,length=255)
	public String getCol062(){
		return this.col062;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col062
	 */
	public void setCol062(String col062){
		this.col062 = col062;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col063
	 */
	@Column(name ="COL063",nullable=true,length=255)
	public String getCol063(){
		return this.col063;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col063
	 */
	public void setCol063(String col063){
		this.col063 = col063;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col064
	 */
	@Column(name ="COL064",nullable=true,length=255)
	public String getCol064(){
		return this.col064;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col064
	 */
	public void setCol064(String col064){
		this.col064 = col064;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col065
	 */
	@Column(name ="COL065",nullable=true,length=255)
	public String getCol065(){
		return this.col065;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col065
	 */
	public void setCol065(String col065){
		this.col065 = col065;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col066
	 */
	@Column(name ="COL066",nullable=true,length=255)
	public String getCol066(){
		return this.col066;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col066
	 */
	public void setCol066(String col066){
		this.col066 = col066;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col067
	 */
	@Column(name ="COL067",nullable=true,length=255)
	public String getCol067(){
		return this.col067;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col067
	 */
	public void setCol067(String col067){
		this.col067 = col067;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col068
	 */
	@Column(name ="COL068",nullable=true,length=255)
	public String getCol068(){
		return this.col068;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col068
	 */
	public void setCol068(String col068){
		this.col068 = col068;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col069
	 */
	@Column(name ="COL069",nullable=true,length=255)
	public String getCol069(){
		return this.col069;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col069
	 */
	public void setCol069(String col069){
		this.col069 = col069;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col070
	 */
	@Column(name ="COL070",nullable=true,length=255)
	public String getCol070(){
		return this.col070;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col070
	 */
	public void setCol070(String col070){
		this.col070 = col070;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col071
	 */
	@Column(name ="COL071",nullable=true,length=255)
	public String getCol071(){
		return this.col071;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col071
	 */
	public void setCol071(String col071){
		this.col071 = col071;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col072
	 */
	@Column(name ="COL072",nullable=true,length=255)
	public String getCol072(){
		return this.col072;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col072
	 */
	public void setCol072(String col072){
		this.col072 = col072;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col073
	 */
	@Column(name ="COL073",nullable=true,length=255)
	public String getCol073(){
		return this.col073;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col073
	 */
	public void setCol073(String col073){
		this.col073 = col073;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col074
	 */
	@Column(name ="COL074",nullable=true,length=255)
	public String getCol074(){
		return this.col074;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col074
	 */
	public void setCol074(String col074){
		this.col074 = col074;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col075
	 */
	@Column(name ="COL075",nullable=true,length=255)
	public String getCol075(){
		return this.col075;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col075
	 */
	public void setCol075(String col075){
		this.col075 = col075;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col076
	 */
	@Column(name ="COL076",nullable=true,length=255)
	public String getCol076(){
		return this.col076;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col076
	 */
	public void setCol076(String col076){
		this.col076 = col076;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col077
	 */
	@Column(name ="COL077",nullable=true,length=255)
	public String getCol077(){
		return this.col077;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col077
	 */
	public void setCol077(String col077){
		this.col077 = col077;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col078
	 */
	@Column(name ="COL078",nullable=true,length=255)
	public String getCol078(){
		return this.col078;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col078
	 */
	public void setCol078(String col078){
		this.col078 = col078;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col079
	 */
	@Column(name ="COL079",nullable=true,length=255)
	public String getCol079(){
		return this.col079;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col079
	 */
	public void setCol079(String col079){
		this.col079 = col079;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  col080
	 */
	@Column(name ="COL080",nullable=true,length=255)
	public String getCol080(){
		return this.col080;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  col080
	 */
	public void setCol080(String col080){
		this.col080 = col080;
	}
}
