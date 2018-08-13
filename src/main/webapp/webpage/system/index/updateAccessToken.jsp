<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>用户信息</title>
	<link href="plug-in/lhgDialog/skins/metrole.css" rel="stylesheet">
<t:base type="jquery,easyui,tools"></t:base>
	<style>
		input.ui_state_highlight:hover{
			background: #18a689 none repeat scroll 0 0;
			color:#FFF;
			border: 1px solid #18a689;
		}
	</style>
</head>
<body style="overflow-y: hidden" scroll="no">
<t:formvalid formid="formobj" refresh="false" dialog="true" action="indexController.do?updateAccessToken" usePlugin="password" layout="table">
	<input id="id" type="hidden" name="id" value="${jdApp.id}">
	<table style="width: 550px" cellpadding="0" cellspacing="1" class="formtable">
		<tbody>
			<tr>
				<td align="right" width="10%"><span class="filedzt">访问令牌:</span></td>
				<td class="value"><input type="text" value="${jdApp.accessToken}" name="accessToken"
										 class="inputxt" datatype="*" errormsg="请输入访问令牌" style="width: 250px;" />
					<span class="Validform_checktip"> 请输入访问令牌 </span></td>
			</tr>
			<tr>
				<td align="right" width="10%"><span class="filedzt">刷新令牌:</span></td>
				<td class="value"><input type="text" value="${jdApp.refreshToken}" name="refreshToken"
										 class="inputxt" datatype="*" errormsg="请输入刷新令牌" style="width: 250px;" />
					<span class="Validform_checktip"> 请输入刷新令牌 </span></td>
			</tr>
			<%--<tr>
				<td align="right" width="10%"><span class="filedzt">操作:</span></td>
				<td class="value">
					<input type="button" value="验证访问令牌是否过期" class="ui_state_highlight" onclick="testExpires()">
				</td>
			</tr>--%>
			<tr>
				<td colspan="2">
					<div class="ui_buttons">
						<input type="hidden" id="flag" value="1">
						<input type="button" value="验证访问令牌是否过期" class="ui_state_highlight" onclick="testExpires()">
						<input type="button" value="开启自动授权功能" class="ui_state_highlight" onclick="openAuthorize()">
					</div>
				</td>
			</tr>
		</tbody>
	</table>
</t:formvalid>
</body>
<script>
	function testExpires() {
		var accessToken = $("[name='accessToken']").val();
		if(accessToken=='') {
			alert("访问令牌不能为空!");
			return false;
		}
		$.ajax({
			type: "post",
			dataType: "json",
			url: "${webRoot}/indexController/testExpires.do",
			data: {
				accessToken: accessToken
			},
			success: function (data) {
				if(data.attributes.code==0) {
					alert("该访问令牌还未过期!");
				}
				else {
					alert(data.attributes.zh_desc);
				}
			}
		});
	}
	function openAuthorize() {
		var refreshToken = $("[name='refreshToken']").val();
		if(refreshToken=='') {
			alert("刷新令牌不能为空!");
			return false;
		}
		$.ajax({
			type: "post",
			dataType: "json",
			url: "${webRoot}/indexController/openAuthorize.do",
			data: {
				refreshToken: refreshToken
			},
			success: function (data) {
				console.log(data);
				if(data.attributes.code==0) {
					var time = data.attributes.expires_in;
					var intervalTime = (time-1000)*1000;
					var timestamp = Date.parse(new Date()) + intervalTime;
					alert("成功重置有效时间!有效时间还有: " + secondToDate(time) +
							".下次自动刷新时间为: " + getMyDate(timestamp));
					setTimeout("openAuthorize()", intervalTime);
				}
			}
		});
	}

	// 输出03:05:59  时分秒
	function secondToDate(result) {
		var h = Math.floor(result / 3600) < 10 ? '0'+Math.floor(result / 3600) : Math.floor(result / 3600);
		var m = Math.floor((result / 60 % 60)) < 10 ? '0' + Math.floor((result / 60 % 60)) : Math.floor((result / 60 % 60));
		var s = Math.floor((result % 60)) < 10 ? '0' + Math.floor((result % 60)) : Math.floor((result % 60));
		return result = h + ":" + m + ":" + s;
	}

	function getMyDate(str){
		var oDate = new Date(str),
				oYear = oDate.getFullYear(),
				oMonth = oDate.getMonth()+1,
				oDay = oDate.getDate(),
				oHour = oDate.getHours(),
				oMin = oDate.getMinutes(),
				oSen = oDate.getSeconds(),
				oTime = oYear +'-'+ getzf(oMonth) +'-'+ getzf(oDay) +' '+ getzf(oHour) +':'+ getzf(oMin) +':'+getzf(oSen);//最后拼接时间
		return oTime;
	};
	//补0操作
	function getzf(num){
		if(parseInt(num) < 10){
			num = '0'+num;
		}
		return num;
	}
</script>