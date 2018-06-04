package com.online.service.impl;

import com.online.dao.CommodityDao;
import com.online.entity.CommodityEntity;
import com.online.service.CommodityService;
import com.online.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @description 商品管理Service实现类
 * @author      aaron
 * @date        2018/05/22
 */
@Service
public class CommodityServiceImpl implements CommodityService {
    @Autowired
    private CommodityDao commodityDao;
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
        int allRow = commodityDao.getAllRowCount(map);
        //当前页开始记录
        int offset = page.countOffset(currentPage,pageSize);
        //分页查询结果集
        List<CommodityEntity> list = commodityDao.queryForPage(offset, pageSize, map);

        page.setPageNo(currentPage);
        page.setPageSize(pageSize);
        page.setTotalRecords(allRow);
        page.setList(list);

        return page;
    }

    /**
     * 根据商品id获取商品信息
     * @param id
     * @return
     */
    public CommodityEntity getDataById(Integer id) {
        CommodityEntity commodity = (CommodityEntity) commodityDao.get(CommodityEntity.class, id);
        return commodity;
    }
}
