package com.online.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.jd.open.api.sdk.DefaultJdClient;
import com.jd.open.api.sdk.JdClient;
import com.jd.open.api.sdk.JdException;
import com.jd.open.api.sdk.domain.category.Category;
import com.jd.open.api.sdk.domain.list.CategoryAttrReadService.CategoryAttrJos;
import com.jd.open.api.sdk.domain.list.CategoryAttrReadService.FeatureCateAttrJos;
import com.jd.open.api.sdk.domain.list.CategoryAttrValueReadService.CategoryAttrValueJos;
import com.jd.open.api.sdk.request.category.CategorySearchRequest;
import com.jd.open.api.sdk.request.imgzone.ImgzonePictureUploadRequest;
import com.jd.open.api.sdk.request.list.CategoryReadFindAttrsByCategoryIdJosRequest;
import com.jd.open.api.sdk.request.list.CategoryReadFindValuesByAttrIdJosRequest;
import com.jd.open.api.sdk.request.ware.ImageWriteUpdateRequest;
import com.jd.open.api.sdk.request.ware.WareAddRequest;
import com.jd.open.api.sdk.response.category.CategorySearchResponse;
import com.jd.open.api.sdk.response.imgzone.ImgzonePictureUploadResponse;
import com.jd.open.api.sdk.response.list.CategoryReadFindAttrsByCategoryIdJosResponse;
import com.jd.open.api.sdk.response.list.CategoryReadFindValuesByAttrIdJosResponse;
import com.jd.open.api.sdk.response.ware.ImageWriteUpdateResponse;
import com.jd.open.api.sdk.response.ware.WareAddResponse;
import com.online.dao.GoodsDao;
import com.online.entity.CategoryEntity;
import com.online.entity.GoodsEntity;
import com.online.entity.JdAppEntity;
import com.online.service.GoodsService;
import com.online.utils.*;
import org.jeecgframework.core.common.model.json.AjaxJson;
import org.jeecgframework.web.system.service.SystemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
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
        JdAppEntity jdApp = systemService.get(JdAppEntity.class, "1");
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
        List<Category> categories = JDApiUtil.getWarecats(serverUrl,accessToken,appKey,appSecret);
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
        JdAppEntity jdApp = systemService.get(JdAppEntity.class, "1");
        String accessToken = jdApp.getAccessToken();
        String appKey = jdApp.getAppKey();
        String appSecret = jdApp.getAppSecret();
        String serverUrl = jdApp.getServerUrl();
        JdClient client=new DefaultJdClient(serverUrl,accessToken,appKey,appSecret);
        WareAddRequest request=new WareAddRequest();
        ToolsUtil toolsUtil = new ToolsUtil();
        List<Category> categories = JDApiUtil.getWarecats(serverUrl,accessToken,appKey,appSecret);
        CategoryEntity category = systemService.findUniqueByProperty(CategoryEntity.class, "code", goods.getCategory());
        String name = category.getName();
        int i = 0;
        for (Category cate : categories) {
            if(cate.getName().equals(category.getName())) {
                i++;
                jdWareAddBean.setCid(String.valueOf(cate.getId()));
                jdWareAddBean.setCname(cate.getName());
                jdWareAddBean.setTitle(goods.getTitle());
                jdWareAddBean.setPic1(goods.getPicture1());
                jdWareAddBean.setPic2(goods.getPicture2());
                jdWareAddBean.setPic3(goods.getPicture3());
                //获取类目属性列表 jingdong.category.read.findAttrsByCategoryIdJos
                CategoryReadFindAttrsByCategoryIdJosRequest categoryIdJosRequest=new CategoryReadFindAttrsByCategoryIdJosRequest();
                categoryIdJosRequest.setCid(Long.valueOf(cate.getId()));
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
        JdAppEntity jdApp = systemService.get(JdAppEntity.class, "1");
        String accessToken = jdApp.getAccessToken();
        String appKey = jdApp.getAppKey();
        String appSecret = jdApp.getAppSecret();
        String serverUrl = jdApp.getServerUrl();
        List<Category> categories = JDApiUtil.getWarecats(serverUrl,accessToken,appKey,appSecret);
        CategoryEntity category = systemService.findUniqueByProperty(CategoryEntity.class, "code", goods.getCategory());
        int i = 0;
        for (Category cate : categories) {
            if(cate.getName().equals(category.getName())) {
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
    public AjaxJson testExpires(String accessToken) throws JdException {
        AjaxJson ajaxJson = new AjaxJson();
        JdAppEntity jdApp = systemService.get(JdAppEntity.class, "1");
        String appKey = jdApp.getAppKey();
        String appSecret = jdApp.getAppSecret();
        String serverUrl = jdApp.getServerUrl();
        JdClient client=new DefaultJdClient(serverUrl,accessToken,appKey,appSecret);
        CategorySearchRequest request=new CategorySearchRequest();
        CategorySearchResponse response=client.execute(request);
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
    public AjaxJson openAuthorize(String refreshToken) {
        AjaxJson ajaxJson = new AjaxJson();
        JdAppEntity jdApp = systemService.get(JdAppEntity.class, "1");
        String appKey = jdApp.getAppKey();
        String appSecret = jdApp.getAppSecret();
        String url = "https://oauth.jd.com/oauth/token?client_id="+appKey+"&client_secret="+appSecret+
                "&grant_type=refresh_token&refresh_token="+refreshToken;
        String result = HttpClient4.doGet(url);
        JSONObject jsonObject = JSON.parseObject(result);
        Map<String, Object> attributes = new HashMap<>();
        attributes.put("code", jsonObject.getString("code"));
        attributes.put("expires_in", jsonObject.getString("expires_in"));
        ajaxJson.setAttributes(attributes);
        return ajaxJson;
    }
}
