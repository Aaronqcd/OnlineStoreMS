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
                <form id="uploadGoodsForm" method="get" class="form-horizontal">
                    <div>
                        <div class="col-sm-4">
                            <div class="form-group">
                                <img src="${webRoot}/${uploadGoods.pic1}" title="商品图片"
                                     class="img-responsive" style="width: 220px;height:220px">
                            </div>
                            <div class="form-group">
                                <img src="${webRoot}/${uploadGoods.pic2}" title="商品图片"
                                     class="img-responsive" style="width: 220px;height:220px">
                            </div>
                            <div class="form-group">
                                <img src="${webRoot}/${uploadGoods.pic3}" title="商品图片"
                                     class="img-responsive" style="width: 220px;height:220px">
                            </div>
                            <div class="form-group">
                                <img src="${webRoot}/${uploadGoods.pic4}" title="商品图片"
                                     class="img-responsive" style="width: 220px;height:220px">
                            </div>
                        </div>
                        <div class="col-sm-8">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">商品编号</label>
                                <div class="col-sm-9">
                                    <p class="form-control-static">${uploadGoods.goodsNo}</p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">产品名称</label>
                                <div class="col-sm-9">
                                    <p class="form-control-static">${uploadGoods.productName}</p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">规格</label>
                                <div class="col-sm-9">
                                    <p class="form-control-static">${uploadGoods.specification}</p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">价格</label>
                                <div class="col-sm-9">
                                    <p class="form-control-static">¥${uploadGoods.price}</p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">材质</label>
                                <div class="col-sm-9">
                                    <p class="form-control-static">${uploadGoods.texture}</p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">型号</label>
                                <div class="col-sm-9">
                                    <p class="form-control-static">${uploadGoods.model}</p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">品牌</label>
                                <div class="col-sm-9">
                                    <p class="form-control-static">${uploadGoods.brand}</p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">备注</label>
                                <div class="col-sm-9">
                                    <p class="form-control-static">${uploadGoods.comment}</p>
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
