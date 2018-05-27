package com.online.service;

import com.online.entity.GoodsEntity;
import com.online.utils.Page;

import java.util.Map;

/**
 * @description 商品管理Service接口
 * @author      aaron
 * @date        2018/05/22
 */
public interface GoodsService {
    /**
     * 分页查询
     * @param currentPage 当前页号：现在显示的页数
     * @param pageSize 每页显示的记录条数
     * @return 封闭了分页信息(包括记录集list)的Bean
     * */
    public Page queryForPage(int currentPage, int pageSize, Map<String,String> map);

    /**
     * 根据商品id获取商品信息
     * @param id
     * @return
     */
    public GoodsEntity getDataById(Integer id);
}
