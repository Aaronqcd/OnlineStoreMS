package com.jeecg.service.impl.online1;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jeecg.service.online1.CommodityServiceI;
import org.jeecgframework.core.common.service.impl.CommonServiceImpl;

@Service("commodityService")
@Transactional
public class CommodityServiceImpl extends CommonServiceImpl implements CommodityServiceI {
	
}