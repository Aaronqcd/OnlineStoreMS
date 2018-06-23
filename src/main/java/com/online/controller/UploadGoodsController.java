package com.online.controller;

import com.online.entity.UploadGoodsEntity;
import com.online.service.UploadGoodsService;
import com.online.utils.Page;
import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.core.common.model.json.AjaxJson;
import org.jeecgframework.poi.excel.ExcelImportUtil;
import org.jeecgframework.poi.excel.entity.ImportParams;
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
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @description 上传商品管理controller
 * @author      aaron
 * @date        2018/06/20
 */
@Controller
@RequestMapping("/uploadGoodsController")
public class UploadGoodsController extends BaseController {
    @Autowired
    private UploadGoodsService uploadGoodsService;
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
            String productName = request.getParameter("productName");
            if (pageNo == null) {
                pageNo = "1";
            }
            Map<String,String> map = new HashMap<>();
            map.put("productName", productName);
            Page page = uploadGoodsService.queryForPage(Integer.valueOf(pageNo), 10, map);
            request.setAttribute("page", page);
            request.setAttribute("map", map);
            List<UploadGoodsEntity> uploadGoodses = page.getList();
            request.setAttribute("uploadGoodses", uploadGoodses);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "online/uploadGoods/uploadGoodsList";
    }

    /**
     * 根据上传商品id获取上传商品信息
     * @param id
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/detail",method = RequestMethod.GET)
    public String detail(String id, HttpServletRequest request, HttpServletResponse response) {
        UploadGoodsEntity uploadGoods = uploadGoodsService.getDataById(id);
        request.setAttribute("uploadGoods", uploadGoods);
        return "online/uploadGoods/detail";
    }

    /**
     *
     * 根据上传商品id修改上传商品信息
     * @param id
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/goEdit",method = RequestMethod.GET)
    public String goEditPage(String id, String pageNo, HttpServletRequest request, HttpServletResponse response) {
        UploadGoodsEntity uploadGoods = uploadGoodsService.getDataById(id);
        request.setAttribute("uploadGoods", uploadGoods);
        request.setAttribute("pageNo", pageNo);
        return "online/uploadGoods/edit";
    }

    @RequestMapping(value = "/edit",method = RequestMethod.POST)
    @ResponseBody
    public AjaxJson edit(UploadGoodsEntity uploadGoods, String pageNo, HttpServletRequest request, HttpServletResponse response) {
        AjaxJson ajaxJson = new AjaxJson();
        UploadGoodsEntity uploadGoodsEntity = systemService.get(UploadGoodsEntity.class, uploadGoods.getId());
        uploadGoodsEntity.setSerial(uploadGoods.getSerial());
        uploadGoodsEntity.setModel(uploadGoods.getModel());
        uploadGoodsEntity.setProductName(uploadGoods.getProductName());
        uploadGoodsEntity.setSpecification(uploadGoods.getSpecification());
        uploadGoodsEntity.setPrice(uploadGoods.getPrice());
        uploadGoodsEntity.setBrand(uploadGoods.getBrand());
        uploadGoodsEntity.setComment(uploadGoods.getComment());
        //uploadGoodsEntity.setCategory(uploadGoods.getCategory());
        uploadGoodsEntity.setGoodsNo(uploadGoods.getGoodsNo());
        uploadGoodsEntity.setTexture(uploadGoods.getTexture());
        systemService.saveOrUpdate(uploadGoodsEntity);
        ajaxJson.setObj(pageNo);
        return ajaxJson;
    }

    @RequestMapping(value = "/leadIn",method = RequestMethod.GET)
    public String leadIn(HttpServletRequest request, HttpServletResponse response) {
        return "online/uploadGoods/leadIn";
    }

    /**
     * 导入功能跳转
     *
     * @return
     */
    @RequestMapping(params = "upload")
    public ModelAndView upload(HttpServletRequest req) {
        req.setAttribute("controller_name","uploadGoodsController");
        return new ModelAndView("common/upload/pub_excel_upload");
    }

    /**
     * 导入功能
     * @param request
     * @param response
     * @return
     */
    @SuppressWarnings("unchecked")
    @RequestMapping(params = "importExcel", method = RequestMethod.POST)
    @ResponseBody
    public AjaxJson importExcel(HttpServletRequest request, HttpServletResponse response) {
        AjaxJson j = new AjaxJson();
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();
        for (Map.Entry<String, MultipartFile> entity : fileMap.entrySet()) {
            MultipartFile file = entity.getValue();// 获取上传文件对象
            ImportParams params = new ImportParams();
            //params.setTitleRows(2);
            params.setHeadRows(1);
            params.setNeedSave(true);
            try {
                List<UploadGoodsEntity> uploadGoodses = ExcelImportUtil.importExcel(file.getInputStream(),UploadGoodsEntity.class,params);
                for (UploadGoodsEntity uploadGoods : uploadGoodses) {
                    String serial = uploadGoods.getSerial();
                    serial = serial.replace(".0","");
                    uploadGoods.setSerial(serial);
                    uploadGoodsService.save(uploadGoods);
                }
                j.setMsg("文件导入成功！");
            } catch (Exception e) {
                e.printStackTrace();
                j.setMsg("文件导入失败！");
            }finally{
                try {
                    file.getInputStream().close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return j;
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
    public AjaxJson upload(String id,String field,HttpServletRequest request, HttpServletResponse response) {
        AjaxJson j = new AjaxJson();
        UploadGoodsEntity uploadGoodsEntity = systemService.get(UploadGoodsEntity.class, id);
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
                if("pic1".equals(field)) {
                    uploadGoodsEntity.setPic1(fieldPath);
                }
                else if("pic2".equals(field)) {
                    uploadGoodsEntity.setPic2(fieldPath);
                }
                else if("pic3".equals(field)) {
                    uploadGoodsEntity.setPic3(fieldPath);
                }
                else if("pic4".equals(field)) {
                    uploadGoodsEntity.setPic4(fieldPath);
                }
                systemService.saveOrUpdate(uploadGoodsEntity);
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
            systemService.deleteEntityById(UploadGoodsEntity.class, ids[i]);
        }
        j.setSuccess(true);
        j.setMsg("图片修改成功");
        return j;
    }
}
