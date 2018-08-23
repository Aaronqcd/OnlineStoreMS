package com.online.controller;

import com.baomidou.kisso.SSOHelper;
import com.baomidou.kisso.SSOToken;
import com.baomidou.kisso.common.util.HttpUtil;
import com.jd.open.api.sdk.JdException;
import com.online.entity.JdAppEntity;
import com.online.service.GoodsService;
import com.online.utils.ToolsUtil;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.jeecgframework.core.common.model.json.AjaxJson;
import org.jeecgframework.core.enums.SysThemesEnum;
import org.jeecgframework.core.util.*;
import org.jeecgframework.web.system.manager.ClientManager;
import org.jeecgframework.web.system.pojo.base.TSRole;
import org.jeecgframework.web.system.pojo.base.TSRoleUser;
import org.jeecgframework.web.system.pojo.base.TSUser;
import org.jeecgframework.web.system.service.SystemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/indexController")
public class IndexController {
    private Logger log = Logger.getLogger(IndexController.class);
    @Autowired
    private SystemService systemService;
    @Autowired
    private GoodsService goodsService;

    /**
     * 跳转到首页
     * @return
     */
    @RequestMapping(value = "/index",method = RequestMethod.GET)
    public String index() {
        return "index/index";
    }

    /**
     * 跳转到首页
     * @return
     */
    @RequestMapping(params = "goUpdateAccessToken",method = RequestMethod.GET)
    public String goUpdateAccessToken(HttpServletRequest request) {
        JdAppEntity jdApp = systemService.get(JdAppEntity.class, "1");
        request.setAttribute("jdApp", jdApp);
        return "system/index/updateAccessToken";
    }

    /**
     * 修改密码
     *
     * @return
     */
    @RequestMapping(params = "updateAccessToken")
    @ResponseBody
    public AjaxJson updateAccessToken(HttpServletRequest request) {
        AjaxJson j = new AjaxJson();
        String id = oConvertUtils.getString(request.getParameter("id"));
        String accessToken = oConvertUtils.getString(request.getParameter("accessToken"));
        String refreshToken = oConvertUtils.getString(request.getParameter("refreshToken"));
        JdAppEntity jdApp = systemService.get(JdAppEntity.class, id);
        jdApp.setAccessToken(accessToken);
        jdApp.setRefreshToken(refreshToken);
        systemService.saveOrUpdate(jdApp);
        j.setMsg("成功更新访问令牌");
        return j;
    }

    /**
     * 验证访问令牌是否过期
     * @param accessToken
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "testExpires", method = RequestMethod.POST)
    @ResponseBody
    public AjaxJson testExpires(String userId, String accessToken, HttpServletRequest request, HttpServletResponse response) throws JdException {
        AjaxJson ajaxJson = goodsService.testExpires(userId, accessToken);
        return ajaxJson;
    }

    /**
     * 开启自动授权功能
     * @param refreshToken
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "openAuthorize", method = RequestMethod.POST)
    @ResponseBody
    public AjaxJson openAuthorize(String userId, String refreshToken, HttpServletRequest request, HttpServletResponse response) throws JdException {
        AjaxJson ajaxJson = goodsService.openAuthorize(userId, refreshToken);
        return ajaxJson;
    }

    /**
     * 根据授权码获取访问令牌
     * @param code
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "getAccessToken", method = RequestMethod.POST)
    @ResponseBody
    public AjaxJson getAccessToken(String userId, String code, HttpServletRequest request, HttpServletResponse response) throws JdException {
        AjaxJson ajaxJson = goodsService.getAccessToken(userId, code);
        return ajaxJson;
    }

    /**
     * 首页跳转
     *
     * @param request
     * @return
     */
    @RequestMapping(params = "home",method = RequestMethod.GET)
    public String home(String sign, ModelMap modelMap, HttpServletRequest request, HttpServletResponse response) {
        ToolsUtil toolsUtil = new ToolsUtil();
        TSUser user = ResourceUtil.getSessionUser();
        String roles = "";
        if (user != null) {
            List<TSRoleUser> rUsers = systemService.findByProperty(TSRoleUser.class, "TSUser.id", user.getId());
            for (TSRoleUser ru : rUsers) {
                TSRole role = ru.getTSRole();
                roles += role.getRoleName() + ",";
            }
            if (roles.length() > 0) {
                roles = roles.substring(0, roles.length() - 1);
            }

            modelMap.put("sign", sign);
            modelMap.put("roleName", roles.length()>3?roles.substring(0,3)+"...":roles);
            modelMap.put("userName", user.getUserName().length()>5?user.getUserName().substring(0, 5)+"...":user.getUserName());
            modelMap.put("portrait", user.getPortrait());

            modelMap.put("currentOrgName", ClientManager.getInstance().getClient().getUser().getCurrentDepart().getDepartname());


            SysThemesEnum sysTheme = SysThemesUtil.getSysTheme(request);
            if("fineui".equals(sysTheme.getStyle())|| "ace".equals(sysTheme.getStyle())||"diy".equals(sysTheme.getStyle())||"acele".equals(sysTheme.getStyle())||"hplus".equals(sysTheme.getStyle())){
                request.setAttribute("menuMap", toolsUtil.getFunctionMap(user));
            }

            Cookie cookie = new Cookie("JEECGINDEXSTYLE", sysTheme.getStyle());
            //设置cookie有效期为一个月
            cookie.setMaxAge(3600*24*30);
            response.addCookie(cookie);

            Cookie zIndexCookie = new Cookie("ZINDEXNUMBER", "1990");
            zIndexCookie.setMaxAge(3600*24);//一天
            response.addCookie(zIndexCookie);

			/*
			 * 单点登录 - 登录需要跳转登录前页面，自己处理 ReturnURL 使用
			 * HttpUtil.decodeURL(xx) 解码后重定向
			 */
            String returnURL = (String)request.getSession().getAttribute("ReturnURL");
            log.info("login 资源路径returnURL："+returnURL);
            if(StringUtils.isNotEmpty(returnURL)){
                SSOToken st = new SSOToken(request);
                st.setId(UUID.randomUUID().getMostSignificantBits());
                st.setUid(user.getUserName());
                st.setType(1);
                //request.setAttribute(SSOConfig.SSO_COOKIE_MAXAGE, maxAge);
                // 可以动态设置 Cookie maxAge 超时时间 ，优先于配置文件的设置，无该参数 - 默认读取配置文件数据 。
                //  maxAge 定义：-1 浏览器关闭时自动删除 0 立即删除 120 表示Cookie有效期2分钟(以秒为单位)
//				request.setAttribute(SSOConfig.SSO_COOKIE_MAXAGE, 60);
                SSOHelper.setSSOCookie(request, response, st, true);
                returnURL = HttpUtil.decodeURL(returnURL);
                log.info("login 资源路径returnURL："+returnURL);
                request.getSession().removeAttribute("ReturnURL");
                try {
                    response.sendRedirect(returnURL);
                } catch (IOException e) {
                    e.printStackTrace();
                }
                return null;
            }

            return "index/main";
        } else {

            //单点登录 - 返回链接
            String returnURL = (String)request.getSession().getAttribute("ReturnURL");
            if(StringUtils.isNotEmpty(returnURL)){
                request.setAttribute("ReturnURL", returnURL);
            }

            return "login/login";
        }

    }
}
