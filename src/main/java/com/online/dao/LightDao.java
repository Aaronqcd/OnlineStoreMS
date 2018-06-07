package com.online.dao;

import com.online.entity.LightEntity;
import org.hibernate.Criteria;
import org.hibernate.criterion.Expression;
import org.jeecgframework.core.common.dao.impl.CommonDao;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * @description 灯具管理Dao
 * @author      aaron
 * @date        2018/06/06
 */
@Repository
public class LightDao extends CommonDao {
    /**
     * 分页查询
     * @param offset 开始记录
     * @param length 一次查询几条记录
     * @return 返回查询记录集合
     */
    @SuppressWarnings("unchecked")
    public List<LightEntity> queryForPage(int offset, int length, Map<String,String> map) {
        List<LightEntity> entitylist=null;
        try{
            Criteria criteria = getSession().createCriteria(LightEntity.class);
            if(map.get("productName")!=null && !"".equals(map.get("productName"))) {
                criteria.add(Expression.like("productName", "%"+map.get("productName")+"%"));
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
     * 获取灯具总记录数
     * @return
     */
    public int getAllRowCount(Map<String,String> map) {
        Criteria criteria = getSession().createCriteria(LightEntity.class);
        if(map.get("productName")!=null && !"".equals(map.get("productName"))) {
            criteria.add(Expression.like("productName", "%"+map.get("productName")+"%"));
        }
        int count = criteria.list().size();
        return count;
    }
}
