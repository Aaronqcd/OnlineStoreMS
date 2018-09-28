package com.online.utils;

import org.apache.poi.hssf.usermodel.*;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;

/**
 * Created by aaronqin on 18/9/16.
 */
public class ExcelUtil {
    /**
     * 导出Excel
     * @param sheetName sheet名称
     * @param title 标题
     * @param values 内容
     * @param wb HSSFWorkbook对象
     * @return
     */
    public static HSSFWorkbook getHSSFWorkbook(String sheetName, String []title, String [][]values, HSSFWorkbook wb)
            throws Exception {

        // 第一步，创建一个HSSFWorkbook，对应一个Excel文件
        if(wb == null){
            wb = new HSSFWorkbook();
        }

        // 第二步，在workbook中添加一个sheet,对应Excel文件中的sheet
        HSSFSheet sheet = wb.createSheet(sheetName);
        /*sheet.setDefaultColumnWidth();
        sheet.setColumnWidth(5, 20*256);
        sheet.setDefaultRowHeight((short) (10*256));*/

        // 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制
        HSSFRow row = sheet.createRow(0);

        // 第四步，创建单元格，并设置值表头 设置表头居中
        HSSFCellStyle style = wb.createCellStyle();
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 创建一个居中格式

        //声明列对象
        HSSFCell cell = null;
        HSSFPatriarch patriarch = sheet.createDrawingPatriarch();

        //创建标题
        for(int i=0;i<title.length;i++){
            cell = row.createCell(i);
            cell.setCellValue(title[i]);
            cell.setCellStyle(style);
        }

        //创建内容
        for(int i=0;i<values.length;i++){
            row = sheet.createRow(i + 1);
            for(int j=0;j<values[i].length;j++){
                //将内容按顺序赋给对应的列对象
                /*if(j==5) {
                    URL url = new URL(values[i][j]);
                    //打开链接
                    HttpURLConnection conn = (HttpURLConnection)url.openConnection();
                    //设置请求方式为"GET"
                    conn.setRequestMethod("GET");
                    //超时响应时间为5秒
                    conn.setConnectTimeout(5 * 1000);
                    //通过输入流获取图片数据
                    InputStream inStream = conn.getInputStream();
                    //得到图片的二进制数据，以二进制封装得到数据，具有通用性
                    byte[] data = readInputStream(inStream);
                    //anchor主要用于设置图片的属性
                    HSSFClientAnchor anchor = new HSSFClientAnchor(0, 0, 1023, 250, (short)j, i+1, (short)j, i+1);
                    //Sets the anchor type （图片在单元格的位置）
                    //0 = Move and size with Cells, 2 = Move but don't size with cells, 3 = Don't move or size with cells.
                    anchor.setAnchorType(0);
                    patriarch.createPicture(anchor, wb.addPicture(data, HSSFWorkbook.PICTURE_TYPE_JPEG));
                }
                else {*/
                    row.createCell(j).setCellValue(values[i][j]);
                //}
            }
        }
        return wb;
    }

    private static byte[] readInputStream(InputStream inStream) throws Exception{
        ByteArrayOutputStream outStream = new ByteArrayOutputStream();
        //创建一个Buffer字符串
        byte[] buffer = new byte[1024];
        //每次读取的字符串长度，如果为-1，代表全部读取完毕
        int len = 0;
        //使用一个输入流从buffer里把数据读取出来
        while( (len=inStream.read(buffer)) != -1 ){
            //用输出流往buffer里写入数据，中间参数代表从哪个位置开始读，len代表读取的长度
            outStream.write(buffer, 0, len);
        }
        //关闭输入流
        inStream.close();
        //把outStream里的数据写入内存
        return outStream.toByteArray();
    }
}
