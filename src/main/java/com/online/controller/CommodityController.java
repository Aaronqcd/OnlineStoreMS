package com.online.controller;

import com.online.entity.CategoryFieldEntity;
import com.online.entity.Commodity2Entity;
import com.online.entity.CommodityEntity;
import com.online.entity.GoodsEntity;
import com.online.service.CommodityService;
import com.online.utils.Page;
import com.online.utils.UUIDGenerator;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.web.system.service.SystemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @description 商品管理controller
 * @author      aaron
 * @date        2018/05/21
 */
@Controller
@RequestMapping("/commodityController")
public class CommodityController extends BaseController {
    @Autowired
    private CommodityService commodityService;
    @Autowired
    private SystemService systemService;

    /**
     * 分页查询
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/showAll",method = RequestMethod.GET)
    public String showAll(HttpServletRequest request, HttpServletResponse response) {
        try {
            String pageNo = request.getParameter("pageNo");
            String title = request.getParameter("title");
            if (pageNo == null) {
                pageNo = "1";
            }
            Map<String,String> map = new HashMap<>();
            map.put("title", title);
            Page page = commodityService.queryForPage(Integer.valueOf(pageNo), 10, map);
            request.setAttribute("page", page);
            request.setAttribute("map", map);
            List<Commodity2Entity> Commodities = page.getList();
            for (Commodity2Entity commodity:Commodities) {
                Field[] field = commodity.getClass().getDeclaredFields();
                System.out.print("123");
            }
            request.setAttribute("Commodities", Commodities);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "online/commodity/commodityList";
    }

    /**
     * 根据商品id获取商品信息
     * @param id
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/detail",method = RequestMethod.GET)
    public String detail(Integer id, HttpServletRequest request, HttpServletResponse response) {
        CommodityEntity commodity = commodityService.getDataById(id);
        request.setAttribute("commodity", commodity);
        return "online/commodity/detail";
    }

    /**
     * 保存商品信息
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/save",method = RequestMethod.GET)
    public void save(HttpServletRequest request, HttpServletResponse response) {


        DetachedCriteria criteria = DetachedCriteria.forClass(CategoryFieldEntity.class);
        criteria.add(Restrictions.eq("categoryCode", "ETWJ"));
        criteria.addOrder(Order.asc("sort"));
        List<CategoryFieldEntity> categoryFields = systemService.findByDetached(criteria);
        List<GoodsEntity> goodsis = systemService.findByProperty(GoodsEntity.class, "category", "儿童玩具");
        UUIDGenerator uu = new UUIDGenerator();
        String uuid = null;
        for (GoodsEntity goods:goodsis) {
            uuid = uu.generate().toString();
            for (CategoryFieldEntity categoryField:categoryFields) {
                CommodityEntity commodity = new CommodityEntity();
                if("商品标题".equals(categoryField.getName())) {
                    commodity.setValue(goods.getTitle());
                }
                else if("商品价格".equals(categoryField.getName())) {
                    commodity.setValue(goods.getPrice());
                }
                else if("淘宝价".equals(categoryField.getName())) {
                    commodity.setValue(goods.getTaobaoPrice());
                }
                else if("交易数".equals(categoryField.getName())) {
                    commodity.setValue(goods.getDealNumber());
                }
                else if("评论数".equals(categoryField.getName())) {
                    commodity.setValue(goods.getCommentNumber());
                }
                else if("人气值".equals(categoryField.getName())) {
                    commodity.setValue(goods.getPopularityValue());
                }
                else if("抓取时间".equals(categoryField.getName())) {
                    commodity.setValue(goods.getGrabDate());
                }
                else if("原店铺链接".equals(categoryField.getName())) {
                    commodity.setValue(goods.getLink());
                }
                else if("商品图片1".equals(categoryField.getName())) {
                    commodity.setValue(goods.getPicture1());
                }
                else if("商品图片2".equals(categoryField.getName())) {
                    commodity.setValue(goods.getPicture2());
                }
                else if("商品图片3".equals(categoryField.getName())) {
                    commodity.setValue(goods.getPicture3());
                }
                if(!"商品分类".equals(categoryField.getName())) {
                    CategoryFieldEntity category = systemService.get(CategoryFieldEntity.class, categoryField.getId());
                    commodity.setTypeName(categoryField.getName());
                    commodity.setCategoryField(category);
                    commodity.setSort(categoryField.getSort());
                    commodity.setCommId(uuid);
                    systemService.save(commodity);
                }
            }
        }
    }

    @RequestMapping(params = "getSession")
    @ResponseBody
    public String getSession(HttpServletRequest req) {
        String name = req.getParameter("name");
        String result = String.valueOf(req.getSession().getAttribute(name));
        return result;
    }

    @RequestMapping(params = "setSession")
    @ResponseBody
    public String setSession(HttpServletRequest req) {
        String name = req.getParameter("name");
        String value = req.getParameter("value");
        req.getSession().setAttribute(name, value);
        return "1";
    }
}
