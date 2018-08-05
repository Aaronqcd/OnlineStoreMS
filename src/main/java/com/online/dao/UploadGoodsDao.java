package com.online.dao;

import com.online.entity.UploadGoodsEntity;
import org.hibernate.Criteria;
import org.hibernate.criterion.Expression;
import org.jeecgframework.core.common.dao.impl.CommonDao;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * @description 上传商品管理Dao
 * @author      aaron
 * @date        2018/06/20
 */
@Repository
public class UploadGoodsDao extends CommonDao {
    /**
     * 分页查询
     * @param offset 开始记录
     * @param length 一次查询几条记录
     * @return 返回查询记录集合
     */
    @SuppressWarnings("unchecked")
    public List<UploadGoodsEntity> queryForPage(int offset, int length, Map<String,String> map) {
        List<UploadGoodsEntity> entitylist=null;
        try{
            Criteria criteria = getSession().createCriteria(UploadGoodsEntity.class);
            if(map.get("productName")!=null && !"".equals(map.get("productName"))) {
                criteria.add(Expression.like("productName", "%"+map.get("productName")+"%"));
            }
            if(map.get("category")!=null && !"".equals(map.get("category"))) {
                String[] category = map.get("category").split(",");
                criteria.add(Expression.in("category", category));
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
     * 获取上传商品总记录数
     * @return
     */
    public int getAllRowCount(Map<String,String> map) {
        Criteria criteria = getSession().createCriteria(UploadGoodsEntity.class);
        if(map.get("productName")!=null && !"".equals(map.get("productName"))) {
            criteria.add(Expression.like("productName", "%"+map.get("productName")+"%"));
        }
        if(map.get("category")!=null && !"".equals(map.get("category"))) {
            String[] category = map.get("category").split(",");
            criteria.add(Expression.in("category", category));
        }
        int count = criteria.list().size();
        return count;
    }
}
