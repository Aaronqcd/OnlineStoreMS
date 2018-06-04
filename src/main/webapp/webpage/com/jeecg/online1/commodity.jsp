<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>商品表</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="commodityController.do?save">
			<input id="id" name="id" type="hidden" value="${commodityPage.id }">
			<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
				<tr>
					<td align="right">
						<label class="Validform_label">
							col001:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col001" name="col001" ignore="ignore"  value="${commodityPage.col001}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col002:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col002" name="col002" ignore="ignore"  value="${commodityPage.col002}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col003:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col003" name="col003" ignore="ignore"  value="${commodityPage.col003}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col004:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col004" name="col004" ignore="ignore"  value="${commodityPage.col004}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col005:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col005" name="col005" ignore="ignore"  value="${commodityPage.col005}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col006:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col006" name="col006" ignore="ignore"  value="${commodityPage.col006}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col007:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col007" name="col007" ignore="ignore"  value="${commodityPage.col007}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col008:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col008" name="col008" ignore="ignore"  value="${commodityPage.col008}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col009:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col009" name="col009" ignore="ignore"  value="${commodityPage.col009}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col010:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col010" name="col010" ignore="ignore"  value="${commodityPage.col010}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col011:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col011" name="col011" ignore="ignore"  value="${commodityPage.col011}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col012:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col012" name="col012" ignore="ignore"  value="${commodityPage.col012}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col013:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col013" name="col013" ignore="ignore"  value="${commodityPage.col013}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col014:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col014" name="col014" ignore="ignore"  value="${commodityPage.col014}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col015:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col015" name="col015" ignore="ignore"  value="${commodityPage.col015}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col016:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col016" name="col016" ignore="ignore"  value="${commodityPage.col016}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col017:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col017" name="col017" ignore="ignore"  value="${commodityPage.col017}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col018:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col018" name="col018" ignore="ignore"  value="${commodityPage.col018}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col019:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col019" name="col019" ignore="ignore"  value="${commodityPage.col019}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col020:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col020" name="col020" ignore="ignore"  value="${commodityPage.col020}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col021:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col021" name="col021" ignore="ignore"  value="${commodityPage.col021}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col022:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col022" name="col022" ignore="ignore"  value="${commodityPage.col022}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col023:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col023" name="col023" ignore="ignore"  value="${commodityPage.col023}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col024:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col024" name="col024" ignore="ignore"  value="${commodityPage.col024}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col025:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col025" name="col025" ignore="ignore"  value="${commodityPage.col025}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col026:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col026" name="col026" ignore="ignore"  value="${commodityPage.col026}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col027:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col027" name="col027" ignore="ignore"  value="${commodityPage.col027}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col028:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col028" name="col028" ignore="ignore"  value="${commodityPage.col028}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col029:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col029" name="col029" ignore="ignore"  value="${commodityPage.col029}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col030:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col030" name="col030" ignore="ignore"  value="${commodityPage.col030}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col031:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col031" name="col031" ignore="ignore"  value="${commodityPage.col031}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col032:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col032" name="col032" ignore="ignore"  value="${commodityPage.col032}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col033:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col033" name="col033" ignore="ignore"  value="${commodityPage.col033}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col034:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col034" name="col034" ignore="ignore"  value="${commodityPage.col034}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col035:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col035" name="col035" ignore="ignore"  value="${commodityPage.col035}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col036:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col036" name="col036" ignore="ignore"  value="${commodityPage.col036}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col037:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col037" name="col037" ignore="ignore"  value="${commodityPage.col037}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col038:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col038" name="col038" ignore="ignore"  value="${commodityPage.col038}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col039:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col039" name="col039" ignore="ignore"  value="${commodityPage.col039}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col040:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col040" name="col040" ignore="ignore"  value="${commodityPage.col040}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col041:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col041" name="col041" ignore="ignore"  value="${commodityPage.col041}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col042:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col042" name="col042" ignore="ignore"  value="${commodityPage.col042}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col043:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col043" name="col043" ignore="ignore"  value="${commodityPage.col043}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col044:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col044" name="col044" ignore="ignore"  value="${commodityPage.col044}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col045:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col045" name="col045" ignore="ignore"  value="${commodityPage.col045}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col046:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col046" name="col046" ignore="ignore"  value="${commodityPage.col046}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col047:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col047" name="col047" ignore="ignore"  value="${commodityPage.col047}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col048:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col048" name="col048" ignore="ignore"  value="${commodityPage.col048}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col049:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col049" name="col049" ignore="ignore"  value="${commodityPage.col049}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col050:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col050" name="col050" ignore="ignore"  value="${commodityPage.col050}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col051:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col051" name="col051" ignore="ignore"  value="${commodityPage.col051}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col052:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col052" name="col052" ignore="ignore"  value="${commodityPage.col052}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col053:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col053" name="col053" ignore="ignore"  value="${commodityPage.col053}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col054:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col054" name="col054" ignore="ignore"  value="${commodityPage.col054}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col055:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col055" name="col055" ignore="ignore"  value="${commodityPage.col055}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col056:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col056" name="col056" ignore="ignore"  value="${commodityPage.col056}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col057:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col057" name="col057" ignore="ignore"  value="${commodityPage.col057}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col058:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col058" name="col058" ignore="ignore"  value="${commodityPage.col058}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col059:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col059" name="col059" ignore="ignore"  value="${commodityPage.col059}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col060:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col060" name="col060" ignore="ignore"  value="${commodityPage.col060}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col061:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col061" name="col061" ignore="ignore"  value="${commodityPage.col061}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col062:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col062" name="col062" ignore="ignore"  value="${commodityPage.col062}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col063:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col063" name="col063" ignore="ignore"  value="${commodityPage.col063}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col064:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col064" name="col064" ignore="ignore"  value="${commodityPage.col064}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col065:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col065" name="col065" ignore="ignore"  value="${commodityPage.col065}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col066:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col066" name="col066" ignore="ignore"  value="${commodityPage.col066}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col067:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col067" name="col067" ignore="ignore"  value="${commodityPage.col067}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col068:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col068" name="col068" ignore="ignore"  value="${commodityPage.col068}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col069:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col069" name="col069" ignore="ignore"  value="${commodityPage.col069}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col070:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col070" name="col070" ignore="ignore"  value="${commodityPage.col070}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col071:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col071" name="col071" ignore="ignore"  value="${commodityPage.col071}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col072:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col072" name="col072" ignore="ignore"  value="${commodityPage.col072}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col073:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col073" name="col073" ignore="ignore"  value="${commodityPage.col073}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col074:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col074" name="col074" ignore="ignore"  value="${commodityPage.col074}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col075:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col075" name="col075" ignore="ignore"  value="${commodityPage.col075}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col076:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col076" name="col076" ignore="ignore"  value="${commodityPage.col076}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col077:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col077" name="col077" ignore="ignore"  value="${commodityPage.col077}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col078:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col078" name="col078" ignore="ignore"  value="${commodityPage.col078}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col079:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col079" name="col079" ignore="ignore"  value="${commodityPage.col079}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							col080:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="col080" name="col080" ignore="ignore"  value="${commodityPage.col080}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
			</table>
		</t:formvalid>
 </body>