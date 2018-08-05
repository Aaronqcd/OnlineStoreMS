package com.online.utils;

import com.jd.open.api.sdk.DefaultJdClient;
import com.jd.open.api.sdk.JdClient;
import com.jd.open.api.sdk.JdException;
import com.jd.open.api.sdk.request.ware.WareAddRequest;
import com.jd.open.api.sdk.request.ware.WareReadSearchWare4ValidRequest;
import com.jd.open.api.sdk.response.ware.WareAddResponse;
import com.jd.open.api.sdk.response.ware.WareReadSearchWare4ValidResponse;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;

/**
 * Created by aaronqin on 18/6/13.
 */
public class JDApiTest {
    private static String SERVER_URL = "https://gw.api.360buy.com/routerjson";
    private static String accessToken = "7e8ab934-211b-4388-b633-ee1bebfca177";
    private static String appKey = "546CA2E26F73B8C0C4D2ED3371DD4675";
    private static String appSecret = "1362f22c26be42f6b0e45bc494dedede";
    public static JdClient client=new DefaultJdClient(SERVER_URL,accessToken,appKey,appSecret);

    public static void main(String[] args) {
        add();
        //searchWare4Valid();
        /*try {
            getFile("https://img.alicdn.com/imgextra/i1/2080375104/TB22UDLi_qWBKNjSZFxXXcpLpXa_!!2080375104-0-item_pic.jpg_430x430q90.jpg");
        } catch (IOException e) {
            e.printStackTrace();
        }*/
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
            System.out.println("code: "+response.getCode()+", desc: "+response.getZhDesc()+
                ", msg: "+response.getMsg()+", url: "+response.getUrl());
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

    public static void add() {
        WareAddRequest request=new WareAddRequest();
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
            request.setWareImage(getFile("https://img.alicdn.com/imgextra/i1/2080375104/TB22UDLi_qWBKNjSZFxXXcpLpXa_!!2080375104-0-item_pic.jpg_430x430q90.jpg"));
        } catch (IOException e) {
            e.printStackTrace();
        }
        String attr = "16009:338820|110108:629525|110107:629515|110103:629492|10075859:20|10075858:180|10075857:180|10075855:橡胶木";
        request.setAttributes(attr);
        //request.setWareBigSmallModel("1");
        //request.setWarePackType("1");
        try {
            WareAddResponse response=client.execute(request);
            System.out.println("code: "+response.getCode()+", desc: "+response.getZhDesc()+
                    ", msg: "+response.getMsg()+", url: "+response.getUrl());
        } catch (JdException e) {
            e.printStackTrace();
        }
        //request.setW
    }

    public static byte[] image2Bytes(String imgSrc)
    {
        FileInputStream fin;
        byte[] bytes = null;
        try {
            fin = new FileInputStream(new File(imgSrc));
            bytes  = new byte[fin.available()];
            //将文件内容写入字节数组
            fin.read(bytes);
            fin.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(bytes);
        return bytes;
    }

    private static byte[] getFile(String url) throws IOException {
        URL urlConet = new URL(url);
        HttpURLConnection con = (HttpURLConnection)urlConet.openConnection();
        con.setRequestMethod("GET");
        con.setConnectTimeout(4 * 1000);
        InputStream inStream = con .getInputStream();    //通过输入流获取图片数据
        ByteArrayOutputStream outStream = new ByteArrayOutputStream();
        byte[] buffer = new byte[2048];
        int len = 0;
        while( (len=inStream.read(buffer)) != -1 ){
            outStream.write(buffer, 0, len);
        }
        inStream.close();
        byte[] data =  outStream.toByteArray();
        System.out.println(data.toString());
        return data;
    }
}
