<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/context/mytags.jsp"%>
<html>
<head>
    <title>商品详情</title>
    <link rel="stylesheet" type="text/css" href="${webRoot}/plug-in/bootstrap-3.3.7/css/bootstrap.css" />
    <script type="text/javascript" src="${webRoot}/plug-in/jquery/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="${webRoot}/plug-in/bootstrap-3.3.7/js/bootstrap.js"></script>
    <script type="text/javascript" src="${webRoot}/plug-in/layer/layer.js"></script>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <form id="lightForm" method="get" class="form-horizontal">
                    <div>
                        <div class="col-sm-4">
                            <div class="form-group">
                                <img src="${webRoot}/${light.pic}" title="商品图片"
                                     class="img-responsive" style="width: 220px;height:220px">
                            </div>
                        </div>
                        <div class="col-sm-8">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">型号</label>
                                <div class="col-sm-9">
                                    <p class="form-control-static">${light.model}</p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">产品型号</label>
                                <div class="col-sm-9">
                                    <p class="form-control-static">${light.productModel}</p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">产品名称</label>
                                <div class="col-sm-9">
                                    <p class="form-control-static">${light.productName}</p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">规格</label>
                                <div class="col-sm-9">
                                    <p class="form-control-static">${light.specification}</p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">单价</label>
                                <div class="col-sm-9">
                                    <p class="form-control-static">¥${light.price}</p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">公司名</label>
                                <div class="col-sm-9">
                                    <p class="form-control-static">${light.companyName}</p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">品牌</label>
                                <div class="col-sm-9">
                                    <p class="form-control-static">${light.brand}</p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">备注</label>
                                <div class="col-sm-9">
                                    <p class="form-control-static">${light.comment}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
