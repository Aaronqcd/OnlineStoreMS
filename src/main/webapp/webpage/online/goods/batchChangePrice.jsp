<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/context/mytags.jsp"%>
<html>
<head>
    <title>批量更改价格</title>
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
                    <input type="hidden" name="category" value="${category}" />
                    <input type="hidden" name="pageNo" value="${pageNo}" />
                    <div>
                        <div class="col-sm-12" id="goodsDiv" style="margin-top: 20px;">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">更改方式</label>
                                <div class="col-sm-9">
                                    <select id="way" name="way" class="form-control">
                                        <option value="1">按百分比增加价格</option>
                                        <option value="2">按固定额增加价格</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">值</label>
                                <div class="col-sm-9">
                                    <input id="value" name="value" class="form-control" style="width: 90%;display:inline">
                                    <span id="percent" style="width: 10%;">%</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
                <div class="form-group">
                    <div class="col-sm-4 col-sm-offset-8">
                        <button class="btn btn-primary" type="button" onclick="changePrice()">批量更改价格</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script>
    var batchChangePriceUrl = "${webRoot}/goodsController/batchChangePrice.do";
    $(function() {
        $("#way").change(function() {
            var way = $(this).val();
            if(way==1) {
                $("#percent").show();
            }
            else if(way==2) {
                $("#percent").hide();
            }
        });
    });

    function changePrice() {
        var way = $("#way").val();
        var value = $("#value").val();
        var reg = /^[+]{0,1}(\d+)$|^[+]{0,1}(\d+\.\d+)$/;
        if(!reg.test(value)) {
            alert("值必须是非负数");
            return false;
        }
        $.ajax({
            type: "post",
            dataType: "json",
            url: batchChangePriceUrl,
            data: {
                category: $("[name='category']").val(),
                way: way,
                value: value
            },
            success: function (data) {
                console.log(data);
                alert(data.msg);
            }
        });
    }
</script>
</html>
