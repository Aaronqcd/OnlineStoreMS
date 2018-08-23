package com.online.controller;

import com.jd.open.api.sdk.JdException;
import com.online.entity.CategoryEntity;
import com.online.entity.GoodsEntity;
import com.online.service.GoodsService;
import com.online.utils.JDWareAddBean;
import com.online.utils.Page;
import com.online.utils.ZtreeUtil;
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
import java.util.ArrayList;
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
            String category = request.getParameter("category");
            String categoryName = request.getParameter("categoryName");
            if (pageNo == null) {
                pageNo = "1";
            }
            Map<String,String> map = new HashMap<>();
            map.put("title", title);
            map.put("category", category);
            map.put("categoryName", categoryName);
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
     * 跳转至导入至店铺的页面
     * @param id
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/goImportStore",method = RequestMethod.GET)
    public String goImportStore(Integer id, String pageNo, HttpServletRequest request, HttpServletResponse response) {
        GoodsEntity goods = goodsService.getDataById(id);
        //JDWareAddBean jdWareAddBean = (JDWareAddBean) goodsService.getImportStoreData(id).getObj();
        request.setAttribute("goods", goods);
        //request.setAttribute("jdWareAddBean", jdWareAddBean);
        request.setAttribute("pageNo", pageNo);
        return "online/goods/importStorePage";
    }

    /**
     * 跳转至批量更改价格的页面
     * @param category
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/goBatchChangePrice",method = RequestMethod.GET)
    public String goBatchChangePrice(String category, String pageNo, HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("category", category);
        request.setAttribute("pageNo", pageNo);
        return "online/goods/batchChangePrice";
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

    /**
     * 获取所有的商品分类,封装成ztree数据格式
     * @param request
     * @return
     */
    @RequestMapping(value="/category/all", method = RequestMethod.POST)
    @ResponseBody
    public List<ZtreeUtil> getCategoryAll(HttpServletRequest request) {
        List<CategoryEntity> list = systemService.getList(CategoryEntity.class);
        List<ZtreeUtil> ztreeUtils = new ArrayList<>();
        for (CategoryEntity category:list) {
            ZtreeUtil ztreeUtil = new ZtreeUtil();
            ztreeUtil.setId(category.getId());
            if(category.getParentId()!=null) {
                ztreeUtil.setPId(category.getParentId());
            }
            else {
                ztreeUtil.setPId("1");
            }
            ztreeUtil.setName(category.getName());
            ztreeUtil.setOpen(true);
            ztreeUtil.setChecked(false);
            ztreeUtil.setCode(category.getCode());
            //ztreeUtil.setSign("1");
            ztreeUtils.add(ztreeUtil);
        }
        return ztreeUtils;
    }

    /**
     * 导入至店铺
     * @param jdWareAddBean
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "importStore", method = RequestMethod.GET)
    @ResponseBody
    public AjaxJson importStore(JDWareAddBean jdWareAddBean, HttpServletRequest request, HttpServletResponse response) throws IOException {
        AjaxJson j = new AjaxJson();
        /*for(int i=0; i<ids.length; i++) {
            systemService.deleteEntityById(GoodsEntity.class, Integer.parseInt(ids[i]));
        }*/
        /*j.setSuccess(true);
        j.setMsg("成功导入至店铺");*/
        j = goodsService.importStore(jdWareAddBean);
        return j;
    }

    /**
     * 验证是否能导入至店铺
     * @param id
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "validateImportStore", method = RequestMethod.POST)
    @ResponseBody
    public AjaxJson validateImportStore(@RequestParam(value="id") Integer id, HttpServletRequest request, HttpServletResponse response) {
        AjaxJson ajaxJson = goodsService.validateImportStore(id);
        return ajaxJson;
    }

    /**
     * 验证是否能导入至店铺
     * @param id
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "getImportStoreData", method = RequestMethod.POST)
    @ResponseBody
    public AjaxJson getImportStoreData(@RequestParam(value="id") Integer id, HttpServletRequest request, HttpServletResponse response) {
        AjaxJson ajaxJson = null;
        try {
            ajaxJson = goodsService.getImportStoreData(id);
        } catch (JdException e) {
            e.printStackTrace();
        }
        return ajaxJson;
    }

    /**
     * 批量更改价格
     * @param category
     * @param way
     * @param value
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "batchChangePrice", method = RequestMethod.POST)
    @ResponseBody
    public AjaxJson batchChangePrice(String category, String way, String value,
                                       HttpServletRequest request, HttpServletResponse response) {
        AjaxJson ajaxJson = goodsService.batchChangePrice(category, way, value);
        return ajaxJson;
    }

}
