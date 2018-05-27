package com.online.controller;

import com.online.entity.GoodsEntity;
import com.online.service.GoodsService;
import com.online.utils.Page;
import org.jeecgframework.core.common.controller.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @description 商品管理controller
 * @author      aaron
 * @date        2018/05/21
 */
@Controller
@RequestMapping("/goodsController")
public class GoodsController extends BaseController {
    @Autowired
    private GoodsService goodsService;

    @RequestMapping(value="goodsList")
    public String goodsList(HttpServletRequest request) {
        return "online/goods/goodsList1";
    }

    /**
     * 分页查询
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/showAll",method = RequestMethod.GET)
    public String findAllCourse(HttpServletRequest request, HttpServletResponse response) {
        try {
            String pageNo = request.getParameter("pageNo");
            String title = request.getParameter("title");
            if (pageNo == null) {
                pageNo = "1";
            }
            Map<String,String> map = new HashMap<>();
            map.put("title", title);
            Page page = goodsService.queryForPage(Integer.valueOf(pageNo), 10, map);
            request.setAttribute("page", page);
            request.setAttribute("map", map);
            List<GoodsEntity> goods = page.getList();
            request.setAttribute("goods", goods);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "online/goods/goodsList";
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
        GoodsEntity goods = goodsService.getDataById(id);
        request.setAttribute("goods", goods);
        return "online/goods/detail";
    }
}
