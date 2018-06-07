package com.online.controller;

import com.online.entity.LightEntity;
import com.online.service.LightService;
import com.online.utils.Page;
import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.core.common.model.json.AjaxJson;
import org.jeecgframework.poi.excel.ExcelImportUtil;
import org.jeecgframework.poi.excel.entity.ImportParams;
import org.jeecgframework.web.system.service.SystemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @description 灯具管理controller
 * @author      aaron
 * @date        2018/06/06
 */
@Controller
@RequestMapping("/lightController")
public class LightController extends BaseController {
    @Autowired
    private LightService lightService;
    @Autowired
    private SystemService systemService;

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
            String productName = request.getParameter("productName");
            if (pageNo == null) {
                pageNo = "1";
            }
            Map<String,String> map = new HashMap<>();
            map.put("productName", productName);
            Page page = lightService.queryForPage(Integer.valueOf(pageNo), 10, map);
            request.setAttribute("page", page);
            request.setAttribute("map", map);
            List<LightEntity> lights = page.getList();
            request.setAttribute("lights", lights);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "online/light/lightList";
    }

    /**
     * 根据灯具id获取灯具信息
     * @param id
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/detail",method = RequestMethod.GET)
    public String detail(String id, HttpServletRequest request, HttpServletResponse response) {
        LightEntity light = lightService.getDataById(id);
        request.setAttribute("light", light);
        return "online/light/detail";
    }

    /**
     *
     * 根据灯具id修改灯具信息
     * @param id
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/goEdit",method = RequestMethod.GET)
    public String goEditPage(String id, String pageNo, HttpServletRequest request, HttpServletResponse response) {
        LightEntity light = lightService.getDataById(id);
        request.setAttribute("light", light);
        request.setAttribute("pageNo", pageNo);
        return "online/light/edit";
    }

    @RequestMapping(value = "/edit",method = RequestMethod.POST)
    @ResponseBody
    public AjaxJson edit(LightEntity light, String pageNo, HttpServletRequest request, HttpServletResponse response) {
        AjaxJson ajaxJson = new AjaxJson();
        LightEntity lightEntity = systemService.get(LightEntity.class, light.getId());
        /*light.setCreateName(lightEntity.getCreateName());
        light.setCreateBy(lightEntity.getCreateBy());
        light.setCreateDate(lightEntity.getCreateDate());
        light.setSysCompanyCode(lightEntity.getSysCompanyCode());
        light.setSysOrgCode(lightEntity.getSysOrgCode());
        light.setPic(lightEntity.getPic());*/
        lightEntity.setSerial(light.getSerial());
        lightEntity.setModel(light.getModel());
        lightEntity.setProductModel(light.getProductModel());
        lightEntity.setProductName(light.getProductName());
        lightEntity.setSpecification(light.getSpecification());
        lightEntity.setPrice(light.getPrice());
        lightEntity.setCompanyName(light.getCompanyName());
        lightEntity.setBrand(light.getBrand());
        lightEntity.setComment(light.getComment());
        systemService.saveOrUpdate(lightEntity);
        ajaxJson.setObj(pageNo);
        return ajaxJson;
    }

    @RequestMapping(value = "/leadIn",method = RequestMethod.GET)
    public String leadIn(HttpServletRequest request, HttpServletResponse response) {
        return "online/light/leadIn";
    }

    /**
     * 导入功能跳转
     *
     * @return
     */
    @RequestMapping(params = "upload")
    public ModelAndView upload(HttpServletRequest req) {
        req.setAttribute("controller_name","lightController");
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
            params.setTitleRows(2);
            params.setHeadRows(1);
            params.setNeedSave(true);
            try {
                List<LightEntity> listLightEntitys = ExcelImportUtil.importExcel(file.getInputStream(),LightEntity.class,params);
                for (LightEntity light : listLightEntitys) {
                    String serial = light.getSerial();
                    serial = serial.replace(".0","");
                    light.setSerial(serial);
                    lightService.save(light);
                }
                j.setMsg("文件导入成功！");
            } catch (Exception e) {
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
}
