<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>goods</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
	<link rel="stylesheet" href="plug-in/uploadify/css/uploadify.css" type="text/css" />
	<script type="text/javascript" src="plug-in/uploadify/jquery.uploadify-3.1.js"></script>
  <script type="text/javascript">
  //编写自定义JS代码
  </script>
 </head>
 <body>
		<t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="goodsListController.do?doUpdate" callback="jeecgFormFileCallBack@Override">
					<input id="id" name="id" type="hidden" value="${goodsPage.id }"/>
		<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
					<tr>
						<td align="right">
							<label class="Validform_label">
								商品图片1:
							</label>
						</td>
						<td class="value">
									<table id="picture1_fileTable"></table>
										<table></table>
										<script type="text/javascript">
											var serverMsg="";
											$(function(){
												$('#picture1').uploadify({
													buttonText:'修改文件',
													auto:false,
													progressData:'speed',
													multi:true,
													height:25,
													overrideEvents:['onDialogClose'],
													fileTypeDesc:'文件格式:',
													queueID:'filediv_picture1',
													fileSizeLimit:'15MB',
													swf:'plug-in/uploadify/uploadify.swf',	
													uploader:'cgUploadController.do?saveFiles&jsessionid='+$("#sessionUID").val()+'',
													onUploadStart : function(file) {
														var cgFormId=$("input[name='id']").val();
														$('#picture1').uploadify("settings", "formData", {
															'cgFormId':cgFormId,
															'cgFormName':'goods',
															'cgFormField':'PICTURE1'
														});
													} ,
													onQueueComplete : function(queueData) {
														 var win = frameElement.api.opener;
														 win.reloadTable();
														 win.tip(serverMsg);
														 frameElement.api.close();
													},
													onUploadSuccess : function(file, data, response) {
														var d=$.parseJSON(data);
														if(d.success){
															var win = frameElement.api.opener;
															serverMsg = d.msg;
														}
													},
													onFallback: function() {
									                    tip("您未安装FLASH控件，无法上传图片！请安装FLASH控件后再试")
									                },
									                onSelectError: function(file, errorCode, errorMsg) {
									                    switch (errorCode) {
									                    case - 100 : tip("上传的文件数量已经超出系统限制的" + $('#file').uploadify('settings', 'queueSizeLimit') + "个文件！");
									                        break;
									                    case - 110 : tip("文件 [" + file.name + "] 大小超出系统限制的" + $('#file').uploadify('settings', 'fileSizeLimit') + "大小！");
									                        break;
									                    case - 120 : tip("文件 [" + file.name + "] 大小异常！");
									                        break;
									                    case - 130 : tip("文件 [" + file.name + "] 类型不正确！");
									                        break;
									                    }
									                },
									                onUploadProgress: function(file, bytesUploaded, bytesTotal, totalBytesUploaded, totalBytesTotal) {}
												});
											});
										</script>
										<span id="file_uploadspan"><input type="file" name="picture1" id="picture1" /></span> 
										<div class="form" id="filediv_picture1"></div>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">商品图片1</label>
						</td>
						<td align="right">
							<label class="Validform_label">
								商品分类:
							</label>
						</td>
						<td class="value">
									<t:dictSelect field="category" type="list"  dictTable="category" dictField="code" dictText="name"   defaultVal="${goodsPage.category}" hasLabel="false"  title="商品分类" ></t:dictSelect>     
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">商品分类</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								商品标题:
							</label>
						</td>
						<td class="value">
						    <input id="title" name="title" type="text" style="width: 150px" class="inputxt"  ignore="ignore"  value='${goodsPage.title}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">商品标题</label>
						</td>
						<td align="right">
							<label class="Validform_label">
								商品价格:
							</label>
						</td>
						<td class="value">
						    <input id="price" name="price" type="text" style="width: 150px" class="inputxt"  ignore="ignore"  value='${goodsPage.price}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">商品价格</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								抓取售价:
							</label>
						</td>
						<td class="value">
						    <input id="taobaoPrice" name="taobaoPrice" type="text" style="width: 150px" class="inputxt"  ignore="ignore"  value='${goodsPage.taobaoPrice}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">抓取售价</label>
						</td>
						<td align="right">
							<label class="Validform_label">
								交易数:
							</label>
						</td>
						<td class="value">
						    <input id="dealNumber" name="dealNumber" type="text" style="width: 150px" class="inputxt"  ignore="ignore"  value='${goodsPage.dealNumber}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">交易数</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								评论数:
							</label>
						</td>
						<td class="value">
						    <input id="commentNumber" name="commentNumber" type="text" style="width: 150px" class="inputxt"  ignore="ignore"  value='${goodsPage.commentNumber}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">评论数</label>
						</td>
						<td align="right">
							<label class="Validform_label">
								人气值:
							</label>
						</td>
						<td class="value">
						    <input id="popularityValue" name="popularityValue" type="text" style="width: 150px" class="inputxt"  ignore="ignore"  value='${goodsPage.popularityValue}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">人气值</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								抓取时间:
							</label>
						</td>
						<td class="value">
						    <input id="grabDate" name="grabDate" type="text" style="width: 150px" class="inputxt"  ignore="ignore"  value='${goodsPage.grabDate}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">抓取时间</label>
						</td>
						<td align="right">
							<label class="Validform_label">
								原店铺链接:
							</label>
						</td>
						<td class="value">
						    <input id="link" name="link" type="text" style="width: 150px" class="inputxt"  ignore="ignore"  value='${goodsPage.link}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">原店铺链接</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								商品图片2:
							</label>
						</td>
						<td class="value">
						    <input id="picture2" name="picture2" type="text" style="width: 150px" class="inputxt"  ignore="ignore"  value='${goodsPage.picture2}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">商品图片2</label>
						</td>
						<td align="right">
							<label class="Validform_label">
								商品图片3:
							</label>
						</td>
						<td class="value">
						    <input id="picture3" name="picture3" type="text" style="width: 150px" class="inputxt"  ignore="ignore"  value='${goodsPage.picture3}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">商品图片3</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								商品图片4:
							</label>
						</td>
						<td class="value">
						    <input id="picture4" name="picture4" type="text" style="width: 150px" class="inputxt"  ignore="ignore"  value='${goodsPage.picture4}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">商品图片4</label>
						</td>
						<td align="right">
							<label class="Validform_label">
								自定义价格:
							</label>
						</td>
						<td class="value">
						    <input id="customPrice" name="customPrice" type="text" style="width: 150px" class="inputxt"  ignore="ignore"  value='${goodsPage.customPrice}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">自定义价格</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								修改后的价格:
							</label>
						</td>
						<td class="value">
						    <input id="changePrice" name="changePrice" type="text" style="width: 150px" class="inputxt"  ignore="ignore"  value='${goodsPage.changePrice}'/>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">修改后的价格</label>
						</td>
				<td align="right">
					<label class="Validform_label">
					</label>
				</td>
				<td class="value">
				</td>
					</tr>
				
			</table>
		</t:formvalid>
 </body>
  <script src = "webpage/online/goods/goodsList/goods.js"></script>
	  	<script type="text/javascript">
		  	//加载 已存在的 文件
		  	$(function(){
		  		var cgFormId=$("input[name='id']").val();
		  		$.ajax({
		  		   type: "post",
		  		   url: "goodsListController.do?getFiles&id=" +  cgFormId,
		  		   success: function(data){
		  			 var arrayFileObj = jQuery.parseJSON(data).obj;
					   console.log(arrayFileObj);
					   if(arrayFileObj.length == 0) {
						   console.log("111");
						   var pic1 = '${goodsPage.picture1}';
						   var table = $("#picture1_fileTable");
						   var tr = $("<tr style=\"height:34px;\"></tr>");
						   var td_img = $("<td><img src='"+pic1+"' width='100' height='100' class='picture1'></td>");
						   var url = '${webRoot}'+'/goodsController/downloadPic.do?url='+pic1+"&title=商品图片1";
						   var td_download = $("<td><a style='margin-left:10px;' href='"+url+"' title='下载'>下载</a></td>");
						   tr.appendTo(table);
						   td_img.appendTo(tr);
						   td_download.appendTo(tr);
					   }
		  			$.each(arrayFileObj,function(n,file){
						if(arrayFileObj.length>1) {
							if(n == arrayFileObj.length-1) {
								var fieldName = file.field.toLowerCase();
								var table = $("#"+fieldName+"_fileTable");
								var tr = $("<tr style=\"height:34px;\"></tr>");
								var title = file.title;
								var webRoot = '${webRoot}';
								if(title.length > 15){
									title = title.substring(0,12) + "...";
								}
								//var td_title = $("<td>" + title + "</td>");
								if(file.path.indexOf("https://") != -1) {
									var td_img = $("<td><img src='"+file.path+"' width='100' height='100' class='"+file.field+"'></td>");
								}
								else {
									var td_img = $("<td><img src='"+webRoot+"/"+file.path+"' width='100' height='100' class='"+file.field+"'></td>");
								}
								var td_download = $("<td><a style=\"margin-left:10px;\" href=\"commonController.do?viewFile&fileid=" + file.fileKey + "&subclassname=org.jeecgframework.web.cgform.entity.upload.CgUploadEntity\" title=\"下载\">下载</a></td>")
								var td_view = $("<td><a style=\"margin-left:10px;\" href=\"javascript:void(0);\" onclick=\"openwindow('预览','commonController.do?openViewFile&fileid=" + file.fileKey + "&subclassname=org.jeecgframework.web.cgform.entity.upload.CgUploadEntity','fList',700,500)\">预览</a></td>");
								var td_del = $("<td><a style=\"margin-left:10px;\" href=\"javascript:void(0)\" class=\"jeecgDetail\" onclick=\"del('cgUploadController.do?delFile&id=" + file.fileKey + "',this)\">删除</a></td>");
								tr.appendTo(table);
								td_img.appendTo(tr);
								td_download.appendTo(tr);
								td_view.appendTo(tr);
								td_del.appendTo(tr);
							}
						}
						else {
							var fieldName = file.field.toLowerCase();
							var table = $("#"+fieldName+"_fileTable");
							var tr = $("<tr style=\"height:34px;\"></tr>");
							var title = file.title;
							var webRoot = '${webRoot}';
							if(title.length > 15){
								title = title.substring(0,12) + "...";
							}
							//var td_title = $("<td>" + title + "</td>");
							if(file.path.indexOf("https://") != -1) {
								var td_img = $("<td><img src='"+file.path+"' width='100' height='100' class='"+file.field+"'></td>");
							}
							else {
								var td_img = $("<td><img src='"+webRoot+"/"+file.path+"' width='100' height='100' class='"+file.field+"'></td>");
							}
							var td_download = $("<td><a style=\"margin-left:10px;\" href=\"commonController.do?viewFile&fileid=" + file.fileKey + "&subclassname=org.jeecgframework.web.cgform.entity.upload.CgUploadEntity\" title=\"下载\">下载</a></td>")
							var td_view = $("<td><a style=\"margin-left:10px;\" href=\"javascript:void(0);\" onclick=\"openwindow('预览','commonController.do?openViewFile&fileid=" + file.fileKey + "&subclassname=org.jeecgframework.web.cgform.entity.upload.CgUploadEntity','fList',700,500)\">预览</a></td>");
							var td_del = $("<td><a style=\"margin-left:10px;\" href=\"javascript:void(0)\" class=\"jeecgDetail\" onclick=\"del('cgUploadController.do?delFile&id=" + file.fileKey + "',this)\">删除</a></td>");
							tr.appendTo(table);
							td_img.appendTo(tr);
							td_download.appendTo(tr);
							td_view.appendTo(tr);
							td_del.appendTo(tr);
						}
		  			 });
		  		   }
		  		});
		  	});
		  	
		  	/**
		 	 * 删除图片数据资源
		 	 */
		  	function del(url,obj){
		  		var content = "请问是否要删除该资源";
		  		var navigatorName = "Microsoft Internet Explorer"; 
		  		if( navigator.appName == navigatorName ){ 
		  			$.dialog.confirm(content, function(){
		  				submit(url,obj);
		  			}, function(){
		  			});
		  		}else{
		  			layer.open({
						title:"提示",
						content:content,
						icon:7,
						yes:function(index){
							submit(url,obj);
						},
						btn:['确定','取消'],
						btn2:function(index){
							layer.close(index);
						}
					});
		  		}
		  	}
		  	
		  	function submit(url,obj){
		  		$.ajax({
		  			async : false,
		  			cache : false,
		  			type : 'POST',
		  			url : url,// 请求的action路径
		  			error : function() {// 请求失败处理函数
		  			},
		  			success : function(data) {
		  				var d = $.parseJSON(data);
		  				if (d.success) {
		  					var msg = d.msg;
		  					tip(msg);
		  					obj.parentNode.parentNode.parentNode.deleteRow(obj.parentNode.parentNode);
		  				} else {
		  					tip(d.msg);
		  				}
		  			}
		  		});
		  	}
		  	
	  		function jeecgFormFileCallBack(data){
	  			if (data.success == true) {
					uploadFile(data);
				} else {
					if (data.responseText == '' || data.responseText == undefined) {
						$.messager.alert('错误', data.msg);
						$.Hidemsg();
					} else {
						try {
							var emsg = data.responseText.substring(data.responseText.indexOf('错误描述'), data.responseText.indexOf('错误信息'));
							$.messager.alert('错误', emsg);
							$.Hidemsg();
						} catch(ex) {
							$.messager.alert('错误', data.responseText + '');
						}
					}
					return false;
				}
				if (!neibuClickFlag) {
					var win = frameElement.api.opener;
					win.reloadTable();
				}
	  		}
	  		function upload() {
					$('#picture1').uploadify('upload', '*');
			}
			
			var neibuClickFlag = false;
			function neibuClick() {
				neibuClickFlag = true; 
				$('#btn_sub').trigger('click');
			}
			function cancel() {
					$('#picture1').uploadify('cancel', '*');	
			}
			function uploadFile(data){
				if(!$("input[name='id']").val()){
					if(data.obj!=null && data.obj!='undefined'){
						$("input[name='id']").val(data.obj.id);
					}
				}
				if($(".uploadify-queue-item").length>0){
					upload();
				}else{
					if (neibuClickFlag){
						alert(data.msg);
						neibuClickFlag = false;
					}else {
						var win = frameElement.api.opener;
						win.reloadTable();
						win.tip(data.msg);
						frameElement.api.close();
					}
				}
			}
	  	</script>
