<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/context/mytags.jsp"%>
<html>
<head>
    <title>导入至店铺</title>
    <link rel="stylesheet" type="text/css" href="${webRoot}/plug-in/bootstrap-3.3.7/css/bootstrap.css" />
    <script type="text/javascript" src="${webRoot}/plug-in/jquery/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="${webRoot}/plug-in/bootstrap-3.3.7/js/bootstrap.js"></script>
    <script type="text/javascript" src="${webRoot}/plug-in/layer/layer.js"></script>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <form id="goodsForm" method="get" class="form-horizontal">
                    <input type="hidden" name="id" value="${goods.id}" />
                    <input type="hidden" name="pageNo" value="${pageNo}" />
                    <div>
                        <div class="col-sm-12" id="goodsDiv" style="margin-top: 20px;">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">商品类目</label>
                                <div class="col-sm-9">
                                    <input type="hidden" class="form-control" name="cid" />
                                    <input type="hidden" class="form-control" name="pic1" />
                                    <input type="hidden" class="form-control" name="pic2" />
                                    <input type="hidden" class="form-control" name="pic3" />
                                    <input type="text" class="form-control" name="cname" readonly />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">商品标题</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="title" readonly />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">库存</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="stockNum" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">长(单位:mm)</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="length" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">宽(单位:mm)</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="wide" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">高(单位:mm)</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="high" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">重量(单位:kg)</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="weight" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">市场价, 精确到2位小数，单位:元</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="marketPrice" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">京东价,精确到2位小数，单位:元</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="jdPrice" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">描述（最多支持3万个英文字符）</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="notes" />
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
                <div class="form-group">
                    <div class="col-sm-4 col-sm-offset-8">
                        <button class="btn btn-primary" type="button" onclick="importStore()">导入</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script>
    var getImportStoreDataUrl = "${webRoot}/goodsController/getImportStoreData.do";
    var importStoreUrl = "${webRoot}/goodsController/importStore.do";
    $(function() {
        getImportStoreData();
    });

    function getImportStoreData() {
        $.ajax({
            type: "post",
            dataType: "json",
            url: getImportStoreDataUrl,
            async: false,
            data:{
                id: $("[name='id']").val()
            },
            success: function (data) {
                console.log(data);
                $("[name='cid']").val(data.obj.cid);
                $("[name='cname']").val(data.obj.cname);
                $("[name='title']").val(data.obj.title);
                $("[name='pic1']").val(data.obj.pic1);
                $("[name='pic2']").val(data.obj.pic2);
                $("[name='pic3']").val(data.obj.pic3);
                $("[name='marketPrice']").val(data.obj.marketPrice);
                $("[name='jdPrice']").val(data.obj.jdPrice);
                var html = "";
                for(var i=0; i<data.obj.categories.length; i++) {
                    if(data.obj.categories[i].inputType==1 || data.obj.categories[i].inputType==2) {
                        html += "<div class='form-group'><label class='col-sm-3 control-label'>"+data.obj.categories[i].attName+"" +
                                "</label><div class='col-sm-9'><select id='attName"+data.obj.categories[i].categoryAttrId+"'" +
                                "class='form-control categoryAttrId'>";
                        for(var j=0; j<data.obj.categories[i].attrValues.length; j++) {
                            html += "<option value='"+data.obj.categories[i].attrValues[j].id+"'>"+data.obj.categories[i].attrValues[j].value+"</option>";
                        }
                        html += "</select></div></div>";
                    }
                    else {
                        html += "<div class='form-group'><label class='col-sm-3 control-label'>"+data.obj.categories[i].attName+"" +
                                "</label><div class='col-sm-9'><input id='attName"+data.obj.categories[i].categoryAttrId+"'" +
                                "class='form-control categoryAttrId'></div></div>";
                    }
                }
                $("#goodsDiv").append(html);
            }
        });
    }

    function importStore() {
        if($("[name='stockNum']").val()==""||$("[name='length']").val()==""||$("[name='wide']").val()==""
                ||$("[name='high']").val()==""||$("[name='weight']").val()==""||$("[name='marketPrice']").val()==""
                ||$("[name='jdPrice']").val()==""||$("[name='notes']").val()=="") {
            alert("每项都必填");
            return false;
        }
        var data = $("#goodsForm").serialize();
        console.log(data);
        var attributes = "";
        $("[id^='attName']").each(function(){
            console.log($(this).attr('id').replace('attName','')+" "+ $(this).val());
            if($(this).val()=="") {
                alert("每项都必填");
                return false;
            }
            attributes += $(this).attr('id').replace('attName','')+":"+$(this).val()+"|";
        });
        attributes = attributes.substring(0, attributes.length-1);
        console.log(attributes);
        $.ajax({
            type: "get",
            dataType: "json",
            url: importStoreUrl+"?"+data+"&attributes="+attributes,
            success: function (data) {
                console.log(data);
                alert(data.msg);
            }
        });
    }
</script>
</html>
