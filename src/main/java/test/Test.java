package test;

import com.online.utils.JDApiUtil;

/**
 * Created by aaronqin on 18/9/27.
 */
public class Test {
    public static void main(String[] args) {
        String appKey = "AA89F622553D5C23AFCA6387566AE93E";
        String appSecret = "55a1d4b8907d446590f433b9a817fed4";
        String accessToken = "4eca82c4-4585-4042-9aab-06a558bf63c1";
        String serverUrl = "https://gw.api.360buy.com/routerjson";
        String title = "北欧餐椅简约扶手椅靠背漫咖啡桌椅星巴克休闲椅子时尚家用餐厅椅1";
        Long num = JDApiUtil.searchWare4Valid(serverUrl,accessToken,appKey,appSecret,title);
        System.out.println(num);
    }
}
