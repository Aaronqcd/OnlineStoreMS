package com.online.service;

import com.online.entity.UploadGoodsEntity;
import com.online.utils.Page;

import java.io.Serializable;
import java.util.Map;

/**
 * @description 上传商品管理Service接口
 * @author      aaron
 * @date        2018/06/20
 */
public interface UploadGoodsService {
    /**
     * 分页查询
     * @param currentPage 当前页号：现在显示的页数
     * @param pageSize 每页显示的记录条数
     * @return 封闭了分页信息(包括记录集list)的Bean
     * */
    public Page queryForPage(int currentPage, int pageSize, Map<String, String> map);

    /**
     * 根据商品id获取商品信息
     * @param id
     * @return
     */
    public UploadGoodsEntity getDataById(String id);

    public Serializable save(UploadGoodsEntity entity) throws Exception;
}
