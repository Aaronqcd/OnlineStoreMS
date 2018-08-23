package com.online.utils;

import com.jd.open.api.sdk.DefaultJdClient;
import com.jd.open.api.sdk.JdClient;
import com.jd.open.api.sdk.JdException;
import com.jd.open.api.sdk.domain.category.Category;
import com.jd.open.api.sdk.request.category.CategorySearchRequest;
import com.jd.open.api.sdk.response.category.CategorySearchResponse;
import org.jeecgframework.web.system.service.SystemService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by aaronqin on 18/8/6.
 */
public class JDApiUtil {
    @Autowired
    private SystemService systemService;

    /**
     * 获取商家已开通的标准商品类目 360buy.warecats.get 类目API
     * @param serverUrl
     * @param accessToken
     * @param appKey
     * @param appSecret
     * @return
     */
    public static List<Category> getWarecats(String serverUrl, String accessToken, String appKey,
                                             String appSecret) {
        JdClient client=new DefaultJdClient(serverUrl,accessToken,appKey,appSecret);
        CategorySearchRequest request=new CategorySearchRequest();
        try {
            CategorySearchResponse response=client.execute(request);
            System.out.println("code: "+response.getCode()+", desc: "+response.getZhDesc()+
                    ", msg: "+response.getMsg()+", url: "+response.getUrl());
            return response.getCategory();
        } catch (JdException e) {
            e.printStackTrace();
        }
        return null;
    }
}
