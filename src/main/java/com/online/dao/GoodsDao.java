package com.online.dao;

import com.online.entity.GoodsEntity;
import org.hibernate.Criteria;
import org.hibernate.criterion.Expression;
import org.jeecgframework.core.common.dao.impl.CommonDao;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

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
    public List<GoodsEntity> queryForPage(int offset, int length, Map<String,String> map) {
        List<GoodsEntity> entitylist=null;
        try{
            Criteria criteria = getSession().createCriteria(GoodsEntity.class);
            if(map.get("title")!=null && !"".equals(map.get("title"))) {
                criteria.add(Expression.like("title", "%"+map.get("title")+"%"));
            }
            criteria.setFirstResult(offset);
            criteria.setMaxResults(length);
            entitylist = criteria.list();

        }catch(RuntimeException re){
            throw re;
        }

        return entitylist;
    }

    /**
     * 获取商品总记录数
     * @return
     */
    public int getAllRowCount(Map<String,String> map) {
        Criteria criteria = getSession().createCriteria(GoodsEntity.class);
        if(map.get("title")!=null && !"".equals(map.get("title"))) {
            criteria.add(Expression.like("title", "%"+map.get("title")+"%"));
        }
        int count = criteria.list().size();
        return count;
    }
}
