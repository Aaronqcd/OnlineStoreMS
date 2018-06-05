package com.online.service;

import com.online.entity.LightEntity;
import org.jeecgframework.core.common.service.CommonService;

import java.io.Serializable;

public interface LightServiceI extends CommonService{
	
 	public void delete(LightEntity entity) throws Exception;
 	
 	public Serializable save(LightEntity entity) throws Exception;
 	
 	public void saveOrUpdate(LightEntity entity) throws Exception;
 	
}
