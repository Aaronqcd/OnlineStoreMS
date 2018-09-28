<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<t:base type="jquery,easyui,tools,DatePicker"></t:base>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:0px;border:0px">
  <t:datagrid name="goodsList" checkbox="true" pagination="true" fitColumns="true" title="商品详情列表" actionUrl="goodsListController.do?datagrid" idField="id" fit="true" queryMode="group">
   <t:dgCol title="主键"  field="id"  hidden="true"  queryMode="group"  width="120"></t:dgCol>
   <t:dgCol title="商品图片1"  field="picture1"  queryMode="group"  downloadName="附件下载"  width="120"></t:dgCol>
   <t:dgCol title="商品分类"  field="category"  query="true"  queryMode="single"  dictionary="category,code,name"  width="120"></t:dgCol>
   <t:dgCol title="商品标题"  field="title"  query="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="商品价格"  field="price"  queryMode="group"  width="120"></t:dgCol>
   <t:dgCol title="抓取售价"  field="taobaoPrice"  queryMode="group"  width="120"></t:dgCol>
   <t:dgCol title="交易数"  field="dealNumber"  queryMode="group"  width="120"></t:dgCol>
   <t:dgCol title="评论数"  field="commentNumber"  queryMode="group"  width="120"></t:dgCol>
   <t:dgCol title="人气值"  field="popularityValue"  queryMode="group"  width="120"></t:dgCol>
   <t:dgCol title="抓取时间"  field="grabDate"  query="true"  queryMode="group"  width="120"></t:dgCol>
   <t:dgCol title="原店铺链接"  field="link"  queryMode="group"  width="120"></t:dgCol>
   <t:dgCol title="商品图片2"  field="picture2"  hidden="true"  queryMode="group"  width="120"></t:dgCol>
   <t:dgCol title="商品图片3"  field="picture3"  hidden="true"  queryMode="group"  width="120"></t:dgCol>
   <t:dgCol title="商品图片4"  field="picture4"  hidden="true"  queryMode="group"  width="120"></t:dgCol>
   <t:dgCol title="自定义价格"  field="customPrice"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="修改后的价格"  field="changePrice"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
   <t:dgDelOpt title="删除" url="goodsListController.do?doDel&id={id}" urlclass="ace_button"  urlfont="fa-trash-o"/>
   <%--<t:dgToolBar title="录入" icon="icon-add" url="goodsListController.do?goAdd" funname="add"></t:dgToolBar>--%>
   <t:dgToolBar title="编辑" icon="icon-edit" url="goodsListController.do?goUpdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="批量删除"  icon="icon-remove" url="goodsListController.do?doBatchDel" funname="deleteALLSelect"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="goodsListController.do?goUpdate" funname="detail"></t:dgToolBar>
   <%--<t:dgToolBar title="导入" icon="icon-put" funname="ImportXls"></t:dgToolBar>
   <t:dgToolBar title="导出" icon="icon-putout" funname="ExportXls"></t:dgToolBar>
   <t:dgToolBar title="模板下载" icon="icon-putout" funname="ExportXlsByT"></t:dgToolBar>--%>
  </t:datagrid>
  </div>
 </div>
 <script src = "webpage/online/goods/goodsList/goodsList.js"></script>
 <script type="text/javascript">
 $(document).ready(function(){
 });
 
   
 
//导入
function ImportXls() {
	openuploadwin('Excel导入', 'goodsListController.do?upload', "goodsList");
}

//导出
function ExportXls() {
	JeecgExcelExport("goodsListController.do?exportXls","goodsList");
}

//模板下载
function ExportXlsByT() {
	JeecgExcelExport("goodsListController.do?exportXlsByT","goodsList");
}

 </script>