package com.online.utils;

import com.jd.open.api.sdk.DefaultJdClient;
import com.jd.open.api.sdk.JdClient;
import com.jd.open.api.sdk.JdException;
import com.jd.open.api.sdk.request.ware.WareReadSearchWare4ValidRequest;
import com.jd.open.api.sdk.response.ware.WareReadSearchWare4ValidResponse;

/**
 * Created by aaronqin on 18/6/13.
 */
public class JDApiTest {
    private static String SERVER_URL = "https://gw.api.360buy.com/routerjson";
    private static String accessToken = "fb876341-da15-444c-8352-c865ccf61adf";
    private static String appKey = "546CA2E26F73B8C0C4D2ED3371DD4675";
    private static String appSecret = "1362f22c26be42f6b0e45bc494dedede";
    public static JdClient client=new DefaultJdClient(SERVER_URL,accessToken,appKey,appSecret);

    public static void main(String[] args) {
        searchWare4Valid();
    }
    public static void searchWare4Valid() {
        WareReadSearchWare4ValidRequest request=new WareReadSearchWare4ValidRequest();

        /*request.setAppId("jingdong");
        request.setName("jingdong");*/
        /*request.setWareId("123,234,345");
        request.setSearchKey("jingdong");
        request.setSearchField("jingdong,yanfa,pop");
        request.setCategoryId(123l);
        request.setShopCategoryIdLevel1(123l);
        request.setShopCategoryIdLevel2(123l);
        request.setTemplateId(123l);
        request.setPromiseId(123l);
        request.setBrandId(123l);
        request.setFeatureKey("jingdong,yanfa,pop");
        request.setFeatureValue("jingdong,yanfa,pop");
        request.setWareStatusValue("123,234,345");
        request.setItemNum("jingdong");
        request.setBarCode("jingdong");
        request.setColType(123);
        request.setStartCreatedTime(new Date());
        request.setEndCreatedTime(new Date());
        request.setStartJdPrice(BigDecimal.valueOf(123));
        request.setEndJdPrice(BigDecimal.valueOf(123));
        request.setStartOnlineTime(new Date());
        request.setEndOnlineTime(new Date());
        request.setStartModifiedTime(new Date());
        request.setEndModifiedTime(new Date());
        request.setStartOfflineTime(new Date());
        request.setEndOfflineTime(new Date());
        request.setStartStockNum(123l);
        request.setEndStockNum(123l);
        request.setOrderField("jingdong,yanfa,pop");
        request.setOrderType("jingdong,yanfa,pop");
        request.setPageNo(123);
        request.setPageSize(123);
        request.setField("jingdong,yanfa,pop");*/

        try {
            WareReadSearchWare4ValidResponse response=client.execute(request);
            System.out.println(response);
        } catch (JdException e) {
            e.printStackTrace();
        }
    }

    /*public void getToken() {
        String url ="https://oauth.jd.com/oauth/token?grant_type=authorization_code&client_id="+appKey
                +"&client_secret="+ appSecret
                +"&scope=read&redirect_uri=http://47.92.32.129/"
                +"&code=BK4Fhy&state=1234";

        URL uri = null;
        try {
            uri = new URL(url);
        } catch (MalformedURLException e) {
            e.printStackTrace();
        }

        HttpURLConnection conn = null;
        try {
            conn = (HttpURLConnection) uri.openConnection();
        } catch (IOException e) {
            e.printStackTrace();
        }

        conn.setRequestProperty("Accept-Charset","utf-8");

        try {
            conn.setRequestMethod("POST");
        } catch (ProtocolException e) {
            e.printStackTrace();
        }

        try {
            int code = conn.getResponseCode();
        } catch (IOException e) {
            e.printStackTrace();
        }

        InputStream is = null;
        try {
            is = conn.getInputStream();
        } catch (IOException e) {
            e.printStackTrace();
        }

        String jsonStr =inputStream2String(is);

        StringaccessToken = this.getAccessToken(jsonStr);
    }*/
}
