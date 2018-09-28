package com.online.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.jd.open.api.sdk.DefaultJdClient;
import com.jd.open.api.sdk.JdClient;
import com.jd.open.api.sdk.JdException;
import com.jd.open.api.sdk.domain.list.CategoryAttrReadService.CategoryAttrJos;
import com.jd.open.api.sdk.domain.list.CategoryAttrReadService.FeatureCateAttrJos;
import com.jd.open.api.sdk.domain.list.CategoryAttrValueReadService.CategoryAttrValueJos;
import com.jd.open.api.sdk.domain.seller.CategorySafService.Category;
import com.jd.open.api.sdk.domain.seller.CategorySafService.CategoryResult;
import com.jd.open.api.sdk.request.imgzone.ImgzonePictureUploadRequest;
import com.jd.open.api.sdk.request.list.CategoryReadFindAttrsByCategoryIdJosRequest;
import com.jd.open.api.sdk.request.list.CategoryReadFindValuesByAttrIdJosRequest;
import com.jd.open.api.sdk.request.seller.VenderCategoryGetValidCategoryResultByVenderIdRequest;
import com.jd.open.api.sdk.request.ware.ImageWriteUpdateRequest;
import com.jd.open.api.sdk.request.ware.WareAddRequest;
import com.jd.open.api.sdk.response.imgzone.ImgzonePictureUploadResponse;
import com.jd.open.api.sdk.response.list.CategoryReadFindAttrsByCategoryIdJosResponse;
import com.jd.open.api.sdk.response.list.CategoryReadFindValuesByAttrIdJosResponse;
import com.jd.open.api.sdk.response.seller.VenderCategoryGetValidCategoryResultByVenderIdResponse;
import com.jd.open.api.sdk.response.ware.ImageWriteUpdateResponse;
import com.jd.open.api.sdk.response.ware.WareAddResponse;
import com.online.dao.GoodsDao;
import com.online.entity.CategoryEntity;
import com.online.entity.GoodsEntity;
import com.online.entity.JdAppEntity;
import com.online.service.GoodsService;
import com.online.utils.*;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.jeecgframework.core.common.model.json.AjaxJson;
import org.jeecgframework.core.util.PropertiesUtil;
import org.jeecgframework.core.util.ResourceUtil;
import org.jeecgframework.web.system.pojo.base.TSUser;
import org.jeecgframework.web.system.service.SystemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.*;

/**
 * @description 商品管理Service实现类
 * @author      aaron
 * @date        2018/05/22
 */
@Service
public class GoodsServiceImpl implements GoodsService {
    @Autowired
    private GoodsDao goodsDao;
    @Autowired
    private SystemService systemService;
    /**
     * 分页查询
     * @param currentPage 当前页号：现在显示的页数
     * @param pageSize 每页显示的记录条数
     * @return 封闭了分页信息(包括记录集list)的Bean
     * */
    @SuppressWarnings("unchecked")
    @Override
    public Page queryForPage(int currentPage,int pageSize, Map<String,String> map) {
        Page page = new Page();
        //总记录数
        int allRow = goodsDao.getAllRowCount(map);
        //当前页开始记录
        int offset = page.countOffset(currentPage,pageSize);
        //分页查询结果集
        List<GoodsEntity> list = goodsDao.queryForPage(offset, pageSize, map);

        page.setPageNo(currentPage);
        page.setPageSize(pageSize);
        page.setTotalRecords(allRow);
        page.setList(list);

        return page;
    }

    /**
     * 根据商品id获取商品信息
     * @param id
     * @return
     */
    public GoodsEntity getDataById(Integer id) {
        GoodsEntity goods = (GoodsEntity) goodsDao.get(GoodsEntity.class, id);
        return goods;
    }

    /**
     * 导入至店铺
     * @param jdWareAddBean
     */
    public AjaxJson importStore(JDWareAddBean jdWareAddBean) throws IOException {
        AjaxJson ajaxJson = new AjaxJson();
        TSUser user = ResourceUtil.getSessionUser();
        JdAppEntity jdApp = systemService.findUniqueByProperty(JdAppEntity.class, "userId", user.getId());
        String accessToken = jdApp.getAccessToken();
        String appKey = jdApp.getAppKey();
        String appSecret = jdApp.getAppSecret();
        String serverUrl = jdApp.getServerUrl();
        JdClient client=new DefaultJdClient(serverUrl,accessToken,appKey,appSecret);
        WareAddRequest request=new WareAddRequest();
        ToolsUtil toolsUtil = new ToolsUtil();
        request.setCid(jdWareAddBean.getCid());
        request.setTitle(jdWareAddBean.getTitle());
        request.setStockNum(jdWareAddBean.getStockNum());
        request.setLength(jdWareAddBean.getLength());
        request.setWide(jdWareAddBean.getWide());
        request.setHigh(jdWareAddBean.getHigh());
        request.setWeight(jdWareAddBean.getWeight());
        request.setMarketPrice(jdWareAddBean.getMarketPrice());
        request.setJdPrice(jdWareAddBean.getJdPrice());
        request.setNotes(jdWareAddBean.getNotes());
        try {
            request.setWareImage(toolsUtil.getFile(jdWareAddBean.getPic1()));
        } catch (IOException e) {
            e.printStackTrace();
        }
        String attr = jdWareAddBean.getAttributes();
        request.setAttributes(attr);
        try {
            WareAddResponse response=client.execute(request);
            System.out.println("code: "+response.getCode()+", desc: "+response.getZhDesc()+
                    ", msg: "+response.getMsg()+", url: "+response.getUrl());
            long wareId = response.getWareId();
            /*WarePropimgAddRequest warePropimgAddRequest = new WarePropimgAddRequest();
            warePropimgAddRequest.setWareId(String.valueOf(wareId));
            warePropimgAddRequest.setAttributeValueId("0000000000");
            warePropimgAddRequest.setIsMainPic(false);
            warePropimgAddRequest.setImage(toolsUtil.getFile("https://gd4.alicdn.com/imgextra/i2/20784646/TB25uBNnS_I8KJjy0FoXXaFnVXa_!!20784646.jpg_400x400.jpg"));
            WarePropimgAddResponse warePropimgAddResponse = client.execute(warePropimgAddRequest);
            System.out.println("code: "+warePropimgAddResponse.getCode()+", desc: "+warePropimgAddResponse.getZhDesc()+
                    ", msg: "+warePropimgAddResponse.getMsg()+", url: "+warePropimgAddResponse.getUrl());*/
            String[] url = new String[2];
            url[0] = jdWareAddBean.getPic2();
            url[1] = jdWareAddBean.getPic3();
            for(int i=2; i<4; i++) {
                ImgzonePictureUploadRequest imgzonePictureUploadRequest = new ImgzonePictureUploadRequest();
                imgzonePictureUploadRequest.setImageData(toolsUtil.getFile(url[i-2]));
                ImgzonePictureUploadResponse imgzonePictureUploadResponse = client.execute(imgzonePictureUploadRequest);
                ImageWriteUpdateRequest imageWriteUpdateRequest = new ImageWriteUpdateRequest();
                imageWriteUpdateRequest.setWareId(wareId);
                imageWriteUpdateRequest.setColorId("0000000000");
                imageWriteUpdateRequest.setImgIndex(String.valueOf(i));
                imageWriteUpdateRequest.setImgUrl(imgzonePictureUploadResponse.getPictureUrl());
                ImageWriteUpdateResponse imageWriteUpdateResponse = client.execute(imageWriteUpdateRequest);
                System.out.println("code: "+imageWriteUpdateResponse.getCode()+", desc: "+imageWriteUpdateResponse.getZhDesc()+
                        ", msg: "+imageWriteUpdateResponse.getMsg()+", url: "+imageWriteUpdateResponse.getUrl());
            }
            ajaxJson.setMsg("成功导入至店铺");
        } catch (JdException e) {
            e.printStackTrace();
        }
        return ajaxJson;
    }

    /**
     * 导入至店铺
     * @param id
     */
    public AjaxJson importStore1(Integer id) {
        AjaxJson ajaxJson = new AjaxJson();
        GoodsEntity goods = (GoodsEntity) goodsDao.get(GoodsEntity.class, id);
        JdAppEntity jdApp = systemService.get(JdAppEntity.class, "1");
        String accessToken = jdApp.getAccessToken();
        String appKey = jdApp.getAppKey();
        String appSecret = jdApp.getAppSecret();
        String serverUrl = jdApp.getServerUrl();
        JdClient client=new DefaultJdClient(serverUrl,accessToken,appKey,appSecret);
        WareAddRequest request=new WareAddRequest();
        ToolsUtil toolsUtil = new ToolsUtil();
        CategoryResult categoryResult = JDApiUtil.getWarecats(serverUrl,accessToken,appKey,appSecret);
        CategoryEntity category = systemService.findUniqueByProperty(CategoryEntity.class, "code", goods.getCategory());
        String name = category.getName();
        /*int i = 0;
        for (Category cate : categories) {
            if(cate.getName().equals(category.getName())) {
                i++;
                request.setCid(String.valueOf(cate.getId()));
                request.setTitle(goods.getTitle());
                request.setStockNum("1000");
                break;
            }
        }
        if(i==0) {
            ajaxJson.setSuccess(false);
            ajaxJson.setMsg("商家还未开通 " + category.getName() + " 商品类目");
        }*/
        /*try {
            WareAddResponse response=client.execute(request);
            System.out.println("code: "+response.getCode()+", desc: "+response.getZhDesc()+
                    ", msg: "+response.getMsg()+", url: "+response.getUrl());
        } catch (JdException e) {
            e.printStackTrace();
        }*/
        request.setCid("9863");
        request.setTitle("实木床1.8米中式胡桃木色双人床现代简约经济型高箱储物主卧婚床");
        request.setStockNum("1000");
        request.setLength("1500");
        request.setWide("1900");
        request.setHigh("500");
        request.setWeight("18");
        request.setMarketPrice("2160.00");
        request.setJdPrice("1080.00");
        request.setNotes("实木床1.8米中式胡桃木色双人床现代简约经济型高箱储物主卧婚床");
        try {
            request.setWareImage(toolsUtil.getFile("https://img.alicdn.com/imgextra/i1/2080375104/TB22UDLi_qWBKNjSZFxXXcpLpXa_!!2080375104-0-item_pic.jpg_430x430q90.jpg"));
        } catch (IOException e) {
            e.printStackTrace();
        }
        String attr = "16009:338820|110108:629525|110107:629515|110103:629492|10075859:20|10075858:180|10075857:180|10075855:橡胶木";
        //String attr = "110108:629525|110107:629515|110103:629492|10075859:20|10075858:180|10075857:180|10075855:橡胶木";
        request.setAttributes(attr);
        try {
            WareAddResponse response=client.execute(request);
            System.out.println("code: "+response.getCode()+", desc: "+response.getZhDesc()+
                    ", msg: "+response.getMsg()+", url: "+response.getUrl());
        } catch (JdException e) {
            e.printStackTrace();
        }
        return ajaxJson;
    }

    /**
     * 获取导入至店铺所需的数据
     * @param id
     */
    public AjaxJson getImportStoreData(Integer id) {
        JDWareAddBean jdWareAddBean = new JDWareAddBean();
        AjaxJson ajaxJson = new AjaxJson();
        GoodsEntity goods = (GoodsEntity) goodsDao.get(GoodsEntity.class, id);
        TSUser user = ResourceUtil.getSessionUser();
        JdAppEntity jdApp = systemService.findUniqueByProperty(JdAppEntity.class, "userId", user.getId());
        String accessToken = jdApp.getAccessToken();
        String appKey = jdApp.getAppKey();
        String appSecret = jdApp.getAppSecret();
        String serverUrl = jdApp.getServerUrl();
        JdClient client=new DefaultJdClient(serverUrl,accessToken,appKey,appSecret);
        WareAddRequest request=new WareAddRequest();
        ToolsUtil toolsUtil = new ToolsUtil();
        CategoryResult categoryResult = JDApiUtil.getWarecats(serverUrl,accessToken,appKey,appSecret);
        CategoryEntity category = systemService.findUniqueByProperty(CategoryEntity.class, "code", goods.getCategory());
        String name = category.getName();
        int i = 0;
        for (Category cate: categoryResult.getList()) {
            if(cate.getName()[0].equals(category.getName())) {
                i++;
                jdWareAddBean.setCid(String.valueOf(cate.getId()));
                jdWareAddBean.setCname(cate.getName()[0]);
                jdWareAddBean.setTitle(goods.getTitle());
                jdWareAddBean.setPic1(goods.getPicture1());
                jdWareAddBean.setPic2(goods.getPicture2());
                jdWareAddBean.setPic3(goods.getPicture3());
                jdWareAddBean.setMarketPrice(goods.getChangePrice());
                jdWareAddBean.setJdPrice(goods.getChangePrice());
                //获取类目属性列表 jingdong.category.read.findAttrsByCategoryIdJos
                CategoryReadFindAttrsByCategoryIdJosRequest categoryIdJosRequest=new CategoryReadFindAttrsByCategoryIdJosRequest();
                categoryIdJosRequest.setCid(Long.valueOf(cate.getId()[0]));
                try {
                    CategoryReadFindAttrsByCategoryIdJosResponse categoryIdJosResponse = client.execute(categoryIdJosRequest);
                    //获取类目属性列表
                    List<CategoryAttrJos> categoryAttrJoses = categoryIdJosResponse.getCategoryAttrs();
                    List<JDCategoryBean> jdCategoryBeans = new ArrayList<>();
                    for (CategoryAttrJos categoryAttrJos : categoryAttrJoses) {
                        //获取类目属性特殊属性列表
                        Set<FeatureCateAttrJos> featureCateAttrJoses = categoryAttrJos.getAttrFeatures();
                        for (FeatureCateAttrJos featureCateAttrJos : featureCateAttrJoses) {
                            //如果类目属性特殊属性key为isRequired,且类目属性特殊属性value=1,则表示必填
                            if("isRequired".equals(featureCateAttrJos.getAttrFeatureKey()) &&
                                    "1".equals(featureCateAttrJos.getAttrFeatureValue())) {
                                JDCategoryBean jdCategoryBean = new JDCategoryBean();
                                //属性名称
                                jdCategoryBean.setAttName(categoryAttrJos.getAttName());
                                //排序：越小越靠前
                                jdCategoryBean.setAttrIndexId(String.valueOf(categoryAttrJos.getAttrIndexId()));
                                //类目属性id
                                jdCategoryBean.setCategoryAttrId(String.valueOf(categoryAttrJos.getCategoryAttrId()));
                                //属性的输入类型.1:单选 2:多选 3:可输入
                                jdCategoryBean.setInputType(String.valueOf(categoryAttrJos.getInputType()));
                                //是否必填,0表示非必填,1表示必填
                                jdCategoryBean.setIsRequired("1");
                                if(categoryAttrJos.getInputType()==1 || categoryAttrJos.getInputType()==2) {
                                    //通过类目属性ID获取属性值列表 jingdong.category.read.findValuesByAttrIdJos
                                    CategoryReadFindValuesByAttrIdJosRequest categoryAttrIdJosRequest = new CategoryReadFindValuesByAttrIdJosRequest();
                                    categoryAttrIdJosRequest.setCategoryAttrId(categoryAttrJos.getCategoryAttrId());
                                    CategoryReadFindValuesByAttrIdJosResponse categoryAttrIdJosresponse = client.execute(categoryAttrIdJosRequest);
                                    //获取属性值对象
                                    List<CategoryAttrValueJos> categoryAttrValueJoses = categoryAttrIdJosresponse.getCategoryAttrValues();
                                    List<JDCategoryAttrValueBean> jdCategoryAttrValueBeans = new ArrayList<>();
                                    for (CategoryAttrValueJos categoryAttrValueJos : categoryAttrValueJoses) {
                                        JDCategoryAttrValueBean jdCategoryAttrValueBean = new JDCategoryAttrValueBean();
                                        //类目属性值id
                                        jdCategoryAttrValueBean.setId(String.valueOf(categoryAttrValueJos.getId()));
                                        //排序
                                        jdCategoryAttrValueBean.setIndexId(String.valueOf(categoryAttrValueJos.getIndexId()));
                                        //类目属性值
                                        jdCategoryAttrValueBean.setValue(categoryAttrValueJos.getValue());
                                        jdCategoryAttrValueBeans.add(jdCategoryAttrValueBean);
                                    }
                                    jdCategoryBean.setAttrValues(jdCategoryAttrValueBeans);
                                }
                                jdCategoryBeans.add(jdCategoryBean);
                            }
                        }
                        //如果属性名称为品牌,且属性的输入类型为单选,则必填
                        if("品牌".equals(categoryAttrJos.getAttName()) && categoryAttrJos.getInputType()==1) {
                            JDCategoryBean jdCategoryBean = new JDCategoryBean();
                            jdCategoryBean.setAttName("品牌");
                            jdCategoryBean.setAttrIndexId(String.valueOf(categoryAttrJos.getAttrIndexId()));
                            jdCategoryBean.setCategoryAttrId(String.valueOf(categoryAttrJos.getCategoryAttrId()));
                            jdCategoryBean.setInputType("1");
                            jdCategoryBean.setIsRequired("1");
                            //通过类目属性ID获取属性值列表 jingdong.category.read.findValuesByAttrIdJos
                            CategoryReadFindValuesByAttrIdJosRequest categoryAttrIdJosRequest = new CategoryReadFindValuesByAttrIdJosRequest();
                            categoryAttrIdJosRequest.setCategoryAttrId(categoryAttrJos.getCategoryAttrId());
                            CategoryReadFindValuesByAttrIdJosResponse categoryAttrIdJosresponse = client.execute(categoryAttrIdJosRequest);
                            //获取属性值对象
                            List<CategoryAttrValueJos> categoryAttrValueJoses = categoryAttrIdJosresponse.getCategoryAttrValues();
                            List<JDCategoryAttrValueBean> jdCategoryAttrValueBeans = new ArrayList<>();
                            for (CategoryAttrValueJos categoryAttrValueJos : categoryAttrValueJoses) {
                                JDCategoryAttrValueBean jdCategoryAttrValueBean = new JDCategoryAttrValueBean();
                                //类目属性值id
                                jdCategoryAttrValueBean.setId(String.valueOf(categoryAttrValueJos.getId()));
                                //排序
                                jdCategoryAttrValueBean.setIndexId(String.valueOf(categoryAttrValueJos.getIndexId()));
                                //类目属性值
                                jdCategoryAttrValueBean.setValue(categoryAttrValueJos.getValue());
                                jdCategoryAttrValueBeans.add(jdCategoryAttrValueBean);
                            }
                            jdCategoryBean.setAttrValues(jdCategoryAttrValueBeans);
                            jdCategoryBeans.add(jdCategoryBean);
                        }
                    }
                    jdWareAddBean.setCategories(jdCategoryBeans);
                } catch (JdException e) {
                    e.printStackTrace();
                }
                ajaxJson.setObj(jdWareAddBean);
                break;
            }
        }
        return ajaxJson;
    }

    /**
     * 验证是否能导入至店铺
     * @param id
     */
    public AjaxJson validateImportStore(Integer id) {
        AjaxJson ajaxJson = new AjaxJson();
        GoodsEntity goods = (GoodsEntity) goodsDao.get(GoodsEntity.class, id);
        TSUser user = ResourceUtil.getSessionUser();
        JdAppEntity jdApp = getJDAppConfig(user.getId());
        String accessToken = jdApp.getAccessToken();
        String appKey = jdApp.getAppKey();
        String appSecret = jdApp.getAppSecret();
        String serverUrl = jdApp.getServerUrl();
        CategoryResult categoryResult = JDApiUtil.getWarecats(serverUrl,accessToken,appKey,appSecret);
        CategoryEntity category = systemService.findUniqueByProperty(CategoryEntity.class, "code", goods.getCategory());
        int i = 0;
        for (Category cate : categoryResult.getList()) {
            if(cate.getName()[0].equals(category.getName())) {
                i++;
                ajaxJson.setSuccess(true);
                ajaxJson.setMsg("商家已开通 " + category.getName() + " 商品类目");
                return ajaxJson;
            }
        }
        if(i==0) {
            ajaxJson.setSuccess(false);
            ajaxJson.setMsg("商家还未开通 " + category.getName() + " 商品类目");
        }
        return ajaxJson;
    }

    @Override
    public AjaxJson testExpires(String userId, String accessToken) throws JdException {
        AjaxJson ajaxJson = new AjaxJson();
        JdAppEntity jdApp = getJDAppConfig(userId);
        JdClient client=new DefaultJdClient(jdApp.getServerUrl(),accessToken,jdApp.getAppKey(),jdApp.getAppSecret());
        VenderCategoryGetValidCategoryResultByVenderIdRequest request = new VenderCategoryGetValidCategoryResultByVenderIdRequest();
        VenderCategoryGetValidCategoryResultByVenderIdResponse response = client.execute(request);
        /*CategorySearchRequest request=new CategorySearchRequest();
        CategorySearchResponse response=client.execute(request);*/
        ajaxJson.setMsg(response.getMsg());
        Map<String, Object> attributes = new HashMap<>();
        attributes.put("code", response.getCode());
        attributes.put("zh_desc", response.getZhDesc());
        if("0".equals(response.getCode())) {
            ajaxJson.setSuccess(true);
        }
        else {
            ajaxJson.setSuccess(false);
        }
        ajaxJson.setAttributes(attributes);
        return ajaxJson;
    }

    /**
     * 开启自动授权功能
     * @param refreshToken
     */
    @Override
    public AjaxJson openAuthorize(String userId, String refreshToken) {
        AjaxJson ajaxJson = new AjaxJson();
        JdAppEntity jdApp = getJDAppConfig(userId);
        String url = "https://oauth.jd.com/oauth/token?client_id="+jdApp.getAppKey()+"&client_secret="+jdApp.getAppSecret()+
                "&grant_type=refresh_token&refresh_token="+refreshToken;
        String result = HttpClient4.doGet(url);
        JSONObject jsonObject = JSON.parseObject(result);
        Map<String, Object> attributes = new HashMap<>();
        attributes.put("code", jsonObject.getString("code"));
        attributes.put("expires_in", jsonObject.getString("expires_in"));
        ajaxJson.setAttributes(attributes);
        return ajaxJson;
    }

    /**
     * 根据授权码获取访问令牌
     * @param code
     */
    @Override
    public AjaxJson getAccessToken(String userId, String code) {
        AjaxJson ajaxJson = new AjaxJson();
        JdAppEntity jdApp = getJDAppConfig(userId);
        PropertiesUtil propertiesUtil = new PropertiesUtil("sysConfig.properties");
        Properties properties = propertiesUtil.getProperties();
        String redirectUri = properties.getProperty("redirect_uri");
        String state = properties.getProperty("state");
        String url = "https://oauth.jd.com/oauth/token?grant_type=authorization_code&client_id=" + jdApp.getAppKey() +
                "&redirect_uri="+redirectUri+"&code="+code+"&state="+state+"&client_secret="+jdApp.getAppSecret();
        String result = HttpClient4.doGet(url);
        JSONObject jsonObject = JSON.parseObject(result);
        Map<String, Object> attributes = new HashMap<>();
        attributes.put("accessToken", jsonObject.getString("access_token"));
        attributes.put("refreshToken", jsonObject.getString("refresh_token"));
        attributes.put("expires_in", jsonObject.getString("expires_in"));
        attributes.put("code", jsonObject.getString("code"));
        ajaxJson.setAttributes(attributes);
        return ajaxJson;
    }

    public JdAppEntity getJDAppConfig(String userId) {
        JdAppEntity jdApp = systemService.findUniqueByProperty(JdAppEntity.class, "userId", userId);
        if(jdApp==null) {
            jdApp = new JdAppEntity();
            PropertiesUtil propertiesUtil = new PropertiesUtil("sysConfig.properties");
            Properties properties = propertiesUtil.getProperties();
            jdApp.setAppKey(properties.getProperty("app_key"));
            jdApp.setAppSecret(properties.getProperty("app_secret"));
            jdApp.setServerUrl(properties.getProperty("server_url"));
        }
        return jdApp;
    }

    /**
     * 批量更改价格
     * @param category
     * @param way
     * @param value
     * @return
     */
    @Override
    public AjaxJson batchChangePrice(String category, String data, String way, String value) {
        AjaxJson ajaxJson = new AjaxJson();
        List<GoodsEntity> goodses = systemService.findByProperty(GoodsEntity.class, "category", category);
        DecimalFormat df = new DecimalFormat("#.00");
        for (GoodsEntity goods : goodses) {
            //批量修改所有数据的价格
            if("1".equals(data)) {
                String changePrice = "";
                if(goods.getCustomPrice()==null || "".equals(goods.getCustomPrice())) {
                    String customPrice = "";
                    if(goods.getPrice()!=null && !"".equals(goods.getPrice())) {
                        String prices[] = goods.getPrice().split("-");
                        customPrice = prices[prices.length-1].trim();
                    }
                    goods.setCustomPrice(customPrice);
                }
                if(goods.getChangePrice()!=null && !"".equals(goods.getChangePrice())) {
                    changePrice = goods.getChangePrice();
                    if("1".equals(way)) {
                        changePrice = df.format(Double.parseDouble(changePrice)*(1+
                                Double.parseDouble(value)/100));
                    }
                    else if("2".equals(way)) {
                        changePrice = df.format(Double.parseDouble(changePrice)+
                                Double.parseDouble(value));
                    }
                    goods.setChangePrice(changePrice);
                    systemService.updateEntitie(goods);
                }
                else if(goods.getCustomPrice()!=null && !"".equals(goods.getCustomPrice())) {
                    changePrice = goods.getCustomPrice();
                    if("1".equals(way)) {
                        changePrice = df.format(Double.parseDouble(changePrice)*(1+
                                Double.parseDouble(value)/100));
                    }
                    else if("2".equals(way)) {
                        changePrice = df.format(Double.parseDouble(changePrice)+
                                Double.parseDouble(value));
                    }
                    goods.setChangePrice(changePrice);
                    systemService.updateEntitie(goods);
                }
            }
            //批量修改还未更改价格的数据的价格
            else if("2".equals(data)) {
                if(goods.getCustomPrice()==null || "".equals(goods.getCustomPrice())) {
                    String changePrice = "";
                    if(goods.getCustomPrice()==null || "".equals(goods.getCustomPrice())) {
                        String customPrice = "";
                        if(goods.getPrice()!=null && !"".equals(goods.getPrice())) {
                            String prices[] = goods.getPrice().split("-");
                            customPrice = prices[prices.length-1].trim();
                        }
                        goods.setCustomPrice(customPrice);
                    }
                    if(goods.getChangePrice()!=null && !"".equals(goods.getChangePrice())) {
                        changePrice = goods.getChangePrice();
                        if("1".equals(way)) {
                            changePrice = df.format(Double.parseDouble(changePrice)*(1+
                                    Double.parseDouble(value)/100));
                        }
                        else if("2".equals(way)) {
                            changePrice = df.format(Double.parseDouble(changePrice)+
                                    Double.parseDouble(value));
                        }
                        goods.setChangePrice(changePrice);
                        systemService.updateEntitie(goods);
                    }
                    else if(goods.getCustomPrice()!=null && !"".equals(goods.getCustomPrice())) {
                        changePrice = goods.getCustomPrice();
                        if("1".equals(way)) {
                            changePrice = df.format(Double.parseDouble(changePrice)*(1+
                                    Double.parseDouble(value)/100));
                        }
                        else if("2".equals(way)) {
                            changePrice = df.format(Double.parseDouble(changePrice)+
                                    Double.parseDouble(value));
                        }
                        goods.setChangePrice(changePrice);
                        systemService.updateEntitie(goods);
                    }
                }
            }
        }
        ajaxJson.setMsg("批量修改价格成功");
        return ajaxJson;
    }

    /**
     * 导出商品数据到excel
     * @param category
     * @return
     * @throws Exception
     */
    @Override
    public HSSFWorkbook batchExportExcel(String category) throws Exception {
        //获取数据
        List<GoodsEntity> goodses = systemService.findByProperty(GoodsEntity.class, "category", category);
        AjaxJson ajaxJson = getImportStoreData(goodses.get(0).getId());
        JDWareAddBean jdWareAddBean = (JDWareAddBean) ajaxJson.getObj();
        int size = 13+jdWareAddBean.getCategories().size();
        List<JDCategoryBean> jdCategoryBeans = jdWareAddBean.getCategories();
        //excel标题
        String[] title = new String[size];
        title[0] = "标识";
        title[1] = "商品分类";
        title[2] = "商品标题";
        title[3] = "抓取时间";
        title[4] = "原店铺链接";
        title[5] = "自定义价格";
        title[6] = "修改后的价格";
        title[7] = "库存";
        title[8] = "长(单位:mm)";
        title[9] = "宽(单位:mm)";
        title[10] = "高(单位:mm)";
        title[11] = "重量(单位:kg)";
        title[12] = "描述（最多支持3万个英文字符）";
        for(int i=0; i<jdCategoryBeans.size(); i++) {
            title[13+i] = jdCategoryBeans.get(i).getAttName();
        }

        //sheet名
        String sheetName = "商品表";
        String[][] content = new String[goodses.size()][];

        for (int i = 0; i < goodses.size(); i++) {
            content[i] = new String[title.length];
            GoodsEntity obj = goodses.get(i);
            CategoryEntity categoryEntity = systemService.findUniqueByProperty(CategoryEntity.class, "code", obj.getCategory());
            content[i][0] = String.valueOf(obj.getId());
            content[i][1] = categoryEntity.getName();
            content[i][2] = String.valueOf(obj.getTitle());
            content[i][3] = String.valueOf(obj.getGrabDate());
            content[i][4] = String.valueOf(obj.getLink());
            content[i][5] = String.valueOf(obj.getCustomPrice());
            content[i][6] = String.valueOf(obj.getChangePrice());
            content[i][7] = "";
            content[i][8] = "";
            content[i][9] = "";
            content[i][10] = "";
            content[i][11] = "";
            content[i][12] = "";
            for(int j=0; j<jdCategoryBeans.size(); j++) {
                if("1".equals(jdCategoryBeans.get(j).getInputType()) && jdCategoryBeans.get(j).getAttrValues().size()==1) {
                    content[i][13+j] = jdCategoryBeans.get(j).getAttrValues().get(0).getValue();
                }
                else {
                    content[i][13+j] = "";
                }
            }
        }

        //创建HSSFWorkbook
        HSSFWorkbook wb = ExcelUtil.getHSSFWorkbook(sheetName, title, content, null);
        return wb;
    }

    /**
     * 执行批量导入商品至京东店铺
     * @param category
     * @param fileMap
     * @return
     * @throws IOException
     */
    @Override
    @Async
    public AjaxJson importExcel(String category, Map<String, MultipartFile> fileMap) throws IOException {
        CategoryEntity categoryEntity = systemService.findUniqueByProperty(CategoryEntity.class, "code", category);
        TSUser user = ResourceUtil.getSessionUser();
        JdAppEntity jdApp = getJDAppConfig(user.getId());
        String accessToken = jdApp.getAccessToken();
        String appKey = jdApp.getAppKey();
        String appSecret = jdApp.getAppSecret();
        String serverUrl = jdApp.getServerUrl();
        CategoryResult categoryResult = JDApiUtil.getWarecats(serverUrl,accessToken,appKey,appSecret);
        String cid = "";
        ToolsUtil toolsUtil = new ToolsUtil();
        //根据类别名获取京东店铺上的类别id
        for (Category cate : categoryResult.getList()) {
            if(cate.getName()[0].equals(categoryEntity.getName())) {
                cid = cate.getId()[0]+"";
            }
        }
        AjaxJson ajaxJson = new AjaxJson();
        int i=0;
        //获取该类别的商品需要必填的属性
        List<JDCategoryBean> jdCategoryBeans = JDApiUtil.getAttrsByCategory(serverUrl,accessToken,appKey,appSecret,cid);
        for (Map.Entry<String, MultipartFile> entity : fileMap.entrySet()) {
            if(i==0) {
                MultipartFile file = entity.getValue();// 获取上传文件对象
                List<String[]> datas = ExcelData.getExcelData(file);
                for(int j=1; j<4; j++) {
                    JdClient client=new DefaultJdClient(serverUrl,accessToken,appKey,appSecret);
                    WareAddRequest request=new WareAddRequest();
                    request.setCid(cid);
                    request.setTitle(datas.get(j)[2]);
                    request.setStockNum(datas.get(j)[7]);
                    request.setLength(datas.get(j)[8]);
                    request.setWide(datas.get(j)[9]);
                    request.setHigh(datas.get(j)[10]);
                    request.setWeight(datas.get(j)[11]);
                    request.setMarketPrice(datas.get(j)[6]);
                    request.setJdPrice(datas.get(j)[6]);
                    request.setNotes(datas.get(j)[2]);
                    GoodsEntity goods = null;
                    try {
                        //获取该商品的详细信息
                        goods = systemService.get(GoodsEntity.class, Integer.parseInt(datas.get(j)[0]));
                        request.setWareImage(toolsUtil.getFile(goods.getPicture1()));
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                    //查询京东店铺里面是否有该商品title,如果存在,则中止上传此商品
                    Long num = JDApiUtil.searchWare4Valid(serverUrl,accessToken,appKey,appSecret,goods.getTitle());
                    if(num>0) {
                        continue;
                    }
                    StringBuffer stringBuffer = new StringBuffer();
                    int n = 13;
                    //设置商品的属性,格式为:16009:338820|110108:629525|110107:629515|110103:629492|10075859:20|10075858:180|10075857:180|10075855:橡胶木
                    for (JDCategoryBean jdCategoryBean : jdCategoryBeans) {
                        stringBuffer.append(jdCategoryBean.getCategoryAttrId()+":");
                        if("1".equals(jdCategoryBean.getInputType())) {
                            for (JDCategoryAttrValueBean jdCategoryAttrValueBean :jdCategoryBean.getAttrValues()) {
                                if(jdCategoryAttrValueBean.getValue().equals(datas.get(j)[n])) {
                                    stringBuffer.append(jdCategoryAttrValueBean.getId()+"|");
                                }
                            }
                        }
                        else if("3".equals(jdCategoryBean.getInputType())) {
                            stringBuffer.append(datas.get(j)[n]+"|");
                        }
                        n++;
                    }
                    String attr = stringBuffer.substring(0, stringBuffer.length()-1);
                    request.setAttributes(attr);
                    try {
                        //添加商品至京东店铺
                        WareAddResponse response=client.execute(request);
                        System.out.println("code: "+response.getCode()+", desc: "+response.getZhDesc()+
                                ", msg: "+response.getMsg()+", url: "+response.getUrl());
                        long wareId = response.getWareId();
                        String[] url = new String[2];
                        url[0] = goods.getPicture2();
                        url[1] = goods.getPicture3();
                        //上传商品图片
                        for(int m=2; m<4; m++) {
                            ImgzonePictureUploadRequest imgzonePictureUploadRequest = new ImgzonePictureUploadRequest();
                            imgzonePictureUploadRequest.setImageData(toolsUtil.getFile(url[m-2]));
                            ImgzonePictureUploadResponse imgzonePictureUploadResponse = client.execute(imgzonePictureUploadRequest);
                            ImageWriteUpdateRequest imageWriteUpdateRequest = new ImageWriteUpdateRequest();
                            imageWriteUpdateRequest.setWareId(wareId);
                            imageWriteUpdateRequest.setColorId("0000000000");
                            imageWriteUpdateRequest.setImgIndex(String.valueOf(m));
                            imageWriteUpdateRequest.setImgUrl(imgzonePictureUploadResponse.getPictureUrl());
                            ImageWriteUpdateResponse imageWriteUpdateResponse = client.execute(imageWriteUpdateRequest);
                            System.out.println("code: "+imageWriteUpdateResponse.getCode()+", desc: "+imageWriteUpdateResponse.getZhDesc()+
                                    ", msg: "+imageWriteUpdateResponse.getMsg()+", url: "+imageWriteUpdateResponse.getUrl());
                        }
                        ajaxJson.setMsg("成功导入至店铺");
                    } catch (JdException e) {
                        e.printStackTrace();
                    }
                }
                ajaxJson.setObj(datas);
            }
            i++;
        }
        return ajaxJson;
    }
}
