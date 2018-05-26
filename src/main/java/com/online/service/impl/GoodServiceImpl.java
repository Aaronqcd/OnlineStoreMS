package com.online.service.impl;

import com.online.dao.GoodsDao;
import com.online.entity.GoodsEntity;
import com.online.service.GoodsService;
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
public class GoodServiceImpl implements GoodsService {
    @Autowired
    private GoodsDao goodsDao;
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
        int allRow = goodsDao.getAllRowCount(map);
        //当前页开始记录
        int offset = page.countOffset(currentPage,pageSize);
        //分页查询结果集
        List<GoodsEntity> list = goodsDao.queryForPage(offset, pageSize, map);

        page.setPageNo(currentPage);
        page.setPageSize(pageSize);
        page.setTotalRecords(allRow);
        page.setList(list);

        return page;
    }
}
