package com.online.utils;

import com.jd.open.api.sdk.DefaultJdClient;
import com.jd.open.api.sdk.JdClient;
import com.jd.open.api.sdk.JdException;
import com.jd.open.api.sdk.domain.list.CategoryAttrReadService.CategoryAttrJos;
import com.jd.open.api.sdk.domain.list.CategoryAttrReadService.FeatureCateAttrJos;
import com.jd.open.api.sdk.domain.list.CategoryAttrValueReadService.CategoryAttrValueJos;
import com.jd.open.api.sdk.domain.seller.CategorySafService.CategoryResult;
import com.jd.open.api.sdk.request.list.CategoryReadFindAttrsByCategoryIdJosRequest;
import com.jd.open.api.sdk.request.list.CategoryReadFindValuesByAttrIdJosRequest;
import com.jd.open.api.sdk.request.seller.VenderCategoryGetValidCategoryResultByVenderIdRequest;
import com.jd.open.api.sdk.request.ware.WareReadSearchWare4ValidRequest;
import com.jd.open.api.sdk.response.list.CategoryReadFindAttrsByCategoryIdJosResponse;
import com.jd.open.api.sdk.response.list.CategoryReadFindValuesByAttrIdJosResponse;
import com.jd.open.api.sdk.response.seller.VenderCategoryGetValidCategoryResultByVenderIdResponse;
import com.jd.open.api.sdk.response.ware.WareReadSearchWare4ValidResponse;
import org.jeecgframework.web.system.service.SystemService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/**
 * Created by aaronqin on 18/8/6.
 */
public class JDApiUtil {
    @Autowired
    private SystemService systemService;

    /**
     * 获取商家已开通的标准商品类目 jingdong.vender.category.getValidCategoryResultByVenderId 店铺API
     * @param serverUrl
     * @param accessToken
     * @param appKey
     * @param appSecret
     * @return
     */
    public static CategoryResult getWarecats(String serverUrl, String accessToken, String appKey,
                                                   String appSecret) {
        JdClient client=new DefaultJdClient(serverUrl,accessToken,appKey,appSecret);
        VenderCategoryGetValidCategoryResultByVenderIdRequest request = new VenderCategoryGetValidCategoryResultByVenderIdRequest();
        try {
            VenderCategoryGetValidCategoryResultByVenderIdResponse response = client.execute(request);
            System.out.println("code: "+response.getCode()+", desc: "+response.getZhDesc()+
                    ", msg: "+response.getMsg()+", url: "+response.getUrl());
            return response.getGetvalidcategoryresultbyvenderidResult();
        } catch (JdException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 获取类目属性列表 jingdong.category.read.findAttrsByCategoryIdJos 类目API
     * @param serverUrl
     * @param accessToken
     * @param appKey
     * @param appSecret
     * @param cid
     * @return
     */
    public static List<JDCategoryBean> getAttrsByCategory(String serverUrl, String accessToken, String appKey,
                                              String appSecret, String cid) {
        JdClient client=new DefaultJdClient(serverUrl,accessToken,appKey,appSecret);
        CategoryReadFindAttrsByCategoryIdJosRequest request=new CategoryReadFindAttrsByCategoryIdJosRequest();
        request.setCid(Long.valueOf(cid));
        try {
            CategoryReadFindAttrsByCategoryIdJosResponse response=client.execute(request);
            //获取类目属性列表
            List<CategoryAttrJos> categoryAttrJoses = response.getCategoryAttrs();
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
            return jdCategoryBeans;
        } catch (JdException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 根据商品title搜索有效商品 jingdong.ware.read.searchWare4Valid 商品API
     * @param serverUrl
     * @param accessToken
     * @param appKey
     * @param appSecret
     * @param title
     */
    public static Long searchWare4Valid(String serverUrl, String accessToken, String appKey,
                                        String appSecret, String title) {
        JdClient client=new DefaultJdClient(serverUrl,accessToken,appKey,appSecret);
        WareReadSearchWare4ValidRequest request=new WareReadSearchWare4ValidRequest();
        request.setSearchKey(title);
        request.setSearchField("title");
        try {
            WareReadSearchWare4ValidResponse response=client.execute(request);
            return response.getPage().getTotalItem();
        } catch (JdException e) {
            e.printStackTrace();
        }
        return null;
    }
}
