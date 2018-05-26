package com.online.service;

import com.online.utils.Page;

import java.util.Map;

/**
 * @description 商品管理Service接口
 * @author      aaron
 * @date        2018/05/22
 */
public interface GoodsService {
    public Page queryForPage(int currentPage, int pageSize, Map<String,String> map);
}
