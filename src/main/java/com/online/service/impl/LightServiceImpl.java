package com.online.service.impl;

import com.online.dao.LightDao;
import com.online.entity.LightEntity;
import com.online.service.LightService;
import com.online.utils.Page;
import org.jeecgframework.core.common.service.CommonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

/**
 * @description 灯具管理Service实现类
 * @author      aaron
 * @date        2018/06/06
 */
@Service
public class LightServiceImpl implements LightService {
    @Autowired
    private LightDao lightDao;
    @Autowired
    private CommonService commonService;
    /**
     * 分页查询
     * @param currentPage 当前页号：现在显示的页数
     * @param pageSize 每页显示的记录条数
     * @return 封闭了分页信息(包括记录集list)的Bean
     * */
    @SuppressWarnings("unchecked")
    @Override
    public Page queryForPage(int currentPage,int pageSize, Map<String,String> map) {
        Page page = new Page();
        //总记录数
        int allRow = lightDao.getAllRowCount(map);
        //当前页开始记录
        int offset = page.countOffset(currentPage,pageSize);
        //分页查询结果集
        List<LightEntity> list = lightDao.queryForPage(offset, pageSize, map);
        page.setPageNo(currentPage);
        page.setPageSize(pageSize);
        page.setTotalRecords(allRow);
        page.setList(list);

        return page;
    }

    /**
     * 根据灯具id获取商品信息
     * @param id
     * @return
     */
    public LightEntity getDataById(String id) {
        LightEntity lights = (LightEntity) lightDao.get(LightEntity.class, id);
        return lights;
    }

    public Serializable save(LightEntity entity) throws Exception{
        Serializable t = commonService.save(entity);
        return t;
    }
}
