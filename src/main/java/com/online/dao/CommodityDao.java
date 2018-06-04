package com.online.dao;

import com.online.entity.CommodityEntity;
import org.hibernate.Criteria;
import org.hibernate.criterion.Projections;
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
public class CommodityDao extends CommonDao {
    /**
     * 分页查询
     * @param offset 开始记录
     * @param length 一次查询几条记录
     * @return 返回查询记录集合
     */
    @SuppressWarnings("unchecked")
    /*public List<CommodityEntity> queryForPage(int offset, int length, Map<String,String> map) {
        List<CommodityEntity> entitylist=null;
        try{
            Criteria criteria = getSession().createCriteria(CommodityEntity.class);
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
    }*/
    public List<CommodityEntity> queryForPage(int offset, int length, Map<String,String> map) {
        List<CommodityEntity> entitylist=null;
        try{
            Criteria criteria = getSession().createCriteria(CommodityEntity.class);
            /*if(map.get("title")!=null && !"".equals(map.get("title"))) {
                criteria.add(Expression.like("title", "%"+map.get("title")+"%"));
            }*/
            criteria.setProjection(Projections.projectionList()
                    .add(Projections.property("commId").as("commId") )
                    .add(Projections.groupProperty("commId").as("commId")));
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
    /*public int getAllRowCount(Map<String,String> map) {
        Criteria criteria = getSession().createCriteria(CommodityEntity.class);
        if(map.get("title")!=null && !"".equals(map.get("title"))) {
            criteria.add(Expression.like("title", "%"+map.get("title")+"%"));
        }
        int count = criteria.list().size();
        return count;
    }*/
    public int getAllRowCount(Map<String,String> map) {
        Criteria criteria = getSession().createCriteria(CommodityEntity.class);
        /*if(map.get("title")!=null && !"".equals(map.get("title"))) {
            criteria.add(Expression.like("title", "%"+map.get("title")+"%"));
        }*/
        criteria.setProjection(Projections.projectionList()
                .add(Projections.property("commId").as("commId") )
                .add(Projections.groupProperty("commId").as("commId")));
        int count = criteria.list().size();
        return count;
    }
}
