package com.online.service;

import com.online.entity.GoodsEntity;
import org.jeecgframework.core.common.service.CommonService;

import java.io.Serializable;

public interface GoodsListServiceI extends CommonService{
	
 	public void delete(GoodsEntity entity) throws Exception;
 	
 	public Serializable save(GoodsEntity entity) throws Exception;
 	
 	public void saveOrUpdate(GoodsEntity entity) throws Exception;
 	
}
