package com.online.service;

import com.jd.open.api.sdk.JdException;
import com.online.entity.GoodsEntity;
import com.online.utils.JDWareAddBean;
import com.online.utils.Page;
import org.jeecgframework.core.common.model.json.AjaxJson;

import java.io.IOException;
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

    /**
     * 导入至店铺
     * @param jdWareAddBean
     */
    public AjaxJson importStore(JDWareAddBean jdWareAddBean) throws IOException;

    /**
     * 获取导入至店铺所需的数据
     * @param id
     */
    public AjaxJson getImportStoreData(Integer id) throws JdException;

    /**
     * 验证是否能导入至店铺
     * @param id
     */
    public AjaxJson validateImportStore(Integer id);

    /**
     * 验证访问令牌是否过期
     * @param accessToken
     */
    public AjaxJson testExpires(String accessToken) throws JdException;

    /**
     * 开启自动授权功能
     * @param refreshToken
     */
    public AjaxJson openAuthorize(String refreshToken);
}
