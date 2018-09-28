package com.online.service.impl;

import com.online.entity.GoodsEntity;
import com.online.service.GoodsListServiceI;
import org.jeecgframework.core.common.service.impl.CommonServiceImpl;
import org.jeecgframework.core.util.ApplicationContextUtil;
import org.jeecgframework.core.util.MyClassLoader;
import org.jeecgframework.core.util.StringUtil;
import org.jeecgframework.web.cgform.enhance.CgformEnhanceJavaInter;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Service("goodsListService")
@Transactional
public class GoodsListServiceImpl extends CommonServiceImpl implements GoodsListServiceI {

	
 	public void delete(GoodsEntity entity) throws Exception{
 		super.delete(entity);
 		//执行删除操作增强业务
		this.doDelBus(entity);
 	}
 	
 	public Serializable save(GoodsEntity entity) throws Exception{
 		Serializable t = super.save(entity);
 		//执行新增操作增强业务
 		this.doAddBus(entity);
 		return t;
 	}
 	
 	public void saveOrUpdate(GoodsEntity entity) throws Exception{
 		super.saveOrUpdate(entity);
 		//执行更新操作增强业务
 		this.doUpdateBus(entity);
 	}
 	
 	/**
	 * 新增操作增强业务
	 * @param t
	 * @return
	 */
	private void doAddBus(GoodsEntity t) throws Exception{
		//-----------------sql增强 start----------------------------
	 	//-----------------sql增强 end------------------------------
	 	
	 	//-----------------java增强 start---------------------------
	 		Map<String,Object> data = populationMap(t);
	 		executeJavaExtend("spring","goodsEnhanceJava",data);
	 	//-----------------java增强 end-----------------------------
 	}
 	/**
	 * 更新操作增强业务
	 * @param t
	 * @return
	 */
	private void doUpdateBus(GoodsEntity t) throws Exception{
		//-----------------sql增强 start----------------------------
	 	//-----------------sql增强 end------------------------------
	 	
	 	//-----------------java增强 start---------------------------
	 	//-----------------java增强 end-----------------------------
 	}
 	/**
	 * 删除操作增强业务
	 * @param id
	 * @return
	 */
	private void doDelBus(GoodsEntity t) throws Exception{
	    //-----------------sql增强 start----------------------------
	 	//-----------------sql增强 end------------------------------
	 	
	 	//-----------------java增强 start---------------------------
	 	//-----------------java增强 end-----------------------------
 	}
 	
 	private Map<String,Object> populationMap(GoodsEntity t){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("id", t.getId());
		map.put("category", t.getCategory());
		map.put("title", t.getTitle());
		map.put("price", t.getPrice());
		map.put("taobao_price", t.getTaobaoPrice());
		map.put("deal_number", t.getDealNumber());
		map.put("comment_number", t.getCommentNumber());
		map.put("popularity_value", t.getPopularityValue());
		map.put("grab_date", t.getGrabDate());
		map.put("link", t.getLink());
		map.put("picture1", t.getPicture1());
		map.put("picture2", t.getPicture2());
		map.put("picture3", t.getPicture3());
		map.put("picture4", t.getPicture4());
		map.put("custom_price", t.getCustomPrice());
		map.put("change_price", t.getChangePrice());
		return map;
	}
 	
 	/**
	 * 替换sql中的变量
	 * @param sql
	 * @param t
	 * @return
	 */
 	public String replaceVal(String sql,GoodsEntity t){
 		sql  = sql.replace("#{id}",String.valueOf(t.getId()));
 		sql  = sql.replace("#{category}",String.valueOf(t.getCategory()));
 		sql  = sql.replace("#{title}",String.valueOf(t.getTitle()));
 		sql  = sql.replace("#{price}",String.valueOf(t.getPrice()));
 		sql  = sql.replace("#{taobao_price}",String.valueOf(t.getTaobaoPrice()));
 		sql  = sql.replace("#{deal_number}",String.valueOf(t.getDealNumber()));
 		sql  = sql.replace("#{comment_number}",String.valueOf(t.getCommentNumber()));
 		sql  = sql.replace("#{popularity_value}",String.valueOf(t.getPopularityValue()));
 		sql  = sql.replace("#{grab_date}",String.valueOf(t.getGrabDate()));
 		sql  = sql.replace("#{link}",String.valueOf(t.getLink()));
 		sql  = sql.replace("#{picture1}",String.valueOf(t.getPicture1()));
 		sql  = sql.replace("#{picture2}",String.valueOf(t.getPicture2()));
 		sql  = sql.replace("#{picture3}",String.valueOf(t.getPicture3()));
 		sql  = sql.replace("#{picture4}",String.valueOf(t.getPicture4()));
 		sql  = sql.replace("#{custom_price}",String.valueOf(t.getCustomPrice()));
 		sql  = sql.replace("#{change_price}",String.valueOf(t.getChangePrice()));
 		sql  = sql.replace("#{UUID}",UUID.randomUUID().toString());
 		return sql;
 	}
 	
 	/**
	 * 执行JAVA增强
	 */
 	private void executeJavaExtend(String cgJavaType,String cgJavaValue,Map<String,Object> data) throws Exception {
 		if(StringUtil.isNotEmpty(cgJavaValue)){
			Object obj = null;
			try {
				if("class".equals(cgJavaType)){
					//因新增时已经校验了实例化是否可以成功，所以这块就不需要再做一次判断
					obj = MyClassLoader.getClassByScn(cgJavaValue).newInstance();
				}else if("spring".equals(cgJavaType)){
					obj = ApplicationContextUtil.getContext().getBean(cgJavaValue);
				}
				if(obj instanceof CgformEnhanceJavaInter){
					CgformEnhanceJavaInter javaInter = (CgformEnhanceJavaInter) obj;
					javaInter.execute("goods",data);
				}
			} catch (Exception e) {
				e.printStackTrace();
				throw new Exception("执行JAVA增强出现异常！");
			} 
		}
 	}
}