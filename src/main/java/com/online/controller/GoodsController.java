package com.online.controller;

import com.online.entity.GoodsEntity;
import com.online.service.GoodsService;
import com.online.utils.Page;
import org.jeecgframework.core.common.controller.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

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

    @RequestMapping(value = "/showAll")
    public String findAllCourse(HttpServletRequest request, HttpServletResponse response) {
        try {
            String pageNo = request.getParameter("pageNo");
            if (pageNo == null) {
                pageNo = "1";
            }
            Page page = goodsService.queryForPage(Integer.valueOf(pageNo), 10);
            request.setAttribute("page", page);
            List<GoodsEntity> goods = page.getList();
            request.setAttribute("goods", goods);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "online/goods/goodsList";
    }
}
