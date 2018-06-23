package com.online.controller;

import com.online.entity.GoodsEntity;
import com.online.service.GoodsService;
import com.online.utils.Page;
import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.core.common.model.json.AjaxJson;
import org.jeecgframework.poi.util.PoiPublicUtil;
import org.jeecgframework.web.system.service.SystemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
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
    @Autowired
    private SystemService systemService;

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

    /**
     * 跳转至修改商品的页面
     * @param id
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/goEdit",method = RequestMethod.GET)
    public String goEditPage(Integer id, String pageNo, HttpServletRequest request, HttpServletResponse response) {
        GoodsEntity goods = goodsService.getDataById(id);
        request.setAttribute("goods", goods);
        request.setAttribute("pageNo", pageNo);
        return "online/goods/edit";
    }

    /**
     * 根据商品id修改商品信息
     * @param goods
     * @param pageNo
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/edit",method = RequestMethod.POST)
    @ResponseBody
    public AjaxJson edit(GoodsEntity goods, String pageNo, HttpServletRequest request, HttpServletResponse response) {
        AjaxJson ajaxJson = new AjaxJson();
        GoodsEntity goodsEntity = systemService.get(GoodsEntity.class, goods.getId());
        goodsEntity.setCategory(goods.getCategory());
        goodsEntity.setTitle(goods.getTitle());
        goodsEntity.setPrice(goods.getPrice());
        goodsEntity.setTaobaoPrice(goods.getTaobaoPrice());
        goodsEntity.setDealNumber(goods.getDealNumber());
        goodsEntity.setCommentNumber(goods.getCommentNumber());
        goodsEntity.setPopularityValue(goods.getPopularityValue());
        goodsEntity.setGrabDate(goods.getGrabDate());
        systemService.saveOrUpdate(goodsEntity);
        ajaxJson.setObj(pageNo);
        return ajaxJson;
    }

    /**
     * 修改商品图片功能
     * @param request
     * @param response
     * @return
     */
    @SuppressWarnings("unchecked")
    @RequestMapping(value = "upload", method = RequestMethod.POST)
    @ResponseBody
    public AjaxJson upload(Integer id,String field,HttpServletRequest request, HttpServletResponse response) {
        AjaxJson j = new AjaxJson();
        GoodsEntity goodsEntity = systemService.get(GoodsEntity.class, id);
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();
        for (Map.Entry<String, MultipartFile> entity : fileMap.entrySet()) {
            MultipartFile file = entity.getValue();// 获取上传文件对象
            if(!file.isEmpty()) {
                //上传文件路径
                String path = request.getServletContext().getRealPath("/upload/custom/");
                //上传文件名
                //String filename = file.getOriginalFilename();
                byte[] data = null;
                try {
                    data = file.getBytes();
                } catch (IOException e) {
                    e.printStackTrace();
                }
                String filename = "pic" + Math.round(Math.random() * 1.0E11D);
                filename = filename + "." + PoiPublicUtil.getFileExtendName(data);
                String fieldPath = "/upload/custom/"+filename;
                File filepath = new File(path,filename);
                //判断路径是否存在，如果不存在就创建一个
                if (!filepath.getParentFile().exists()) {
                    filepath.getParentFile().mkdirs();
                }
                //将上传文件保存到一个目标文件当中
                try {
                    file.transferTo(new File(path + File.separator + filename));
                } catch (IOException e) {
                    e.printStackTrace();
                }
                if("picture1".equals(field)) {
                    goodsEntity.setPicture1(fieldPath);
                }
                else if("picture2".equals(field)) {
                    goodsEntity.setPicture2(fieldPath);
                }
                else if("picture3".equals(field)) {
                    goodsEntity.setPicture3(fieldPath);
                }
                else if("picture4".equals(field)) {
                    goodsEntity.setPicture4(fieldPath);
                }
                systemService.saveOrUpdate(goodsEntity);
                j.setSuccess(true);
                j.setMsg("图片修改成功");
                j.setObj(fieldPath);
            } else {
                j.setSuccess(false);
            }
        }
        return j;
    }

    /**
     * 删除商品
     * @param ids
     * @param field
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "delete", method = RequestMethod.POST)
    @ResponseBody
    public AjaxJson delete(@RequestParam(value="ids[]") String[] ids, String field, HttpServletRequest request, HttpServletResponse response) {
        AjaxJson j = new AjaxJson();
        for(int i=0; i<ids.length; i++) {
            systemService.deleteEntityById(GoodsEntity.class, Integer.parseInt(ids[i]));
        }
        j.setSuccess(true);
        j.setMsg("图片修改成功");
        return j;
    }
}
