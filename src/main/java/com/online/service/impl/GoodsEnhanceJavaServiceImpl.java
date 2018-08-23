package com.online.service.impl;

import com.online.entity.GoodsEntity;
import org.jeecgframework.core.common.exception.BusinessException;
import org.jeecgframework.web.cgform.enhance.CgformEnhanceJavaInter;
import org.jeecgframework.web.system.service.SystemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * Created by aaronqin on 18/8/19.
 */
@Service("goodsEnhanceJava")
public class GoodsEnhanceJavaServiceImpl implements CgformEnhanceJavaInter {
    @Autowired
    private SystemService systemService;

    @Override
    public void execute(String tableName, Map map) throws BusinessException {
        String id = (String) map.get("id");
        String price = (String) map.get("price");
        String taobaoPrice = (String) map.get("taobaoPrice");
        GoodsEntity goods = systemService.get(GoodsEntity.class, id);
        String customPrice = "";
        if(price!=null && !"".equals(price)) {
            String prices[] = price.split("-");
            customPrice = prices[prices.length-1].trim();
        }
        goods.setCustomPrice(customPrice);
        systemService.updateEntitie(customPrice);
    }
}
