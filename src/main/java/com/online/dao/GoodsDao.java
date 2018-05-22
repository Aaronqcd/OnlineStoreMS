package com.online.dao;

import com.online.entity.GoodsEntity;
import org.hibernate.Query;
import org.jeecgframework.core.common.dao.ICommonDao;
import org.jeecgframework.core.common.dao.IGenericBaseCommonDao;
import org.jeecgframework.core.common.dao.impl.CommonDao;
import org.jeecgframework.core.common.dao.impl.GenericBaseCommonDao;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @description 商品管理Dao
 * @author      aaron
 * @date        2018/05/22
 */
@Repository
public class GoodsDao extends CommonDao {
    /**
     * 分页查询
     * @param offset 开始记录
     * @param length 一次查询几条记录
     * @return 返回查询记录集合
     */
    @SuppressWarnings("unchecked")
    public List<GoodsEntity> queryForPage(int offset, int length) {
        List<GoodsEntity> entitylist=null;
        try{
            Query query = getSession().createQuery("from GoodsEntity");
            query.setFirstResult(offset);
            query.setMaxResults(length);
            entitylist = query.list();

        }catch(RuntimeException re){
            throw re;
        }

        return entitylist;
    }

    /**
     * 获取商品总记录数
     * @return
     */
    public int getAllRowCount() {
        Query query = getSession().createQuery("from GoodsEntity");
        int count = query.list().size();
        return count;
    }
}
