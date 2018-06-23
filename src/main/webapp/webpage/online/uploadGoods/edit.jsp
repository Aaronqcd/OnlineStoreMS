<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/context/mytags.jsp"%>
<html>
<head>
    <title>修改商品信息</title>
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
                    <input type="hidden" name="id" value="${uploadGoods.id}" />
                    <input type="hidden" name="pageNo" value="${pageNo}" />
                    <div>
                        <div class="col-sm-4">
                            <div class="form-group">
                                <img src="${webRoot}/${uploadGoods.pic1}" title="商品图片" class="pic1"
                                     class="img-responsive" style="width: 180px;height:180px;cursor:pointer" onclick="fileSelect('pic1');">
                            </div>
                            <div class="form-group">
                                <img src="${webRoot}/${uploadGoods.pic2}" title="商品图片" class="pic2"
                                     class="img-responsive" style="width: 180px;height:180px;cursor:pointer" onclick="fileSelect('pic2');">
                            </div>
                            <div class="form-group">
                                <img src="${webRoot}/${uploadGoods.pic3}" title="商品图片" class="pic3"
                                     class="img-responsive" style="width: 180px;height:180px;cursor:pointer" onclick="fileSelect('pic3');">
                            </div>
                            <div class="form-group">
                                <img src="${webRoot}/${uploadGoods.pic4}" title="商品图片" class="pic4"
                                     class="img-responsive" style="width: 180px;height:180px;cursor:pointer" onclick="fileSelect('pic4');">
                            </div>
                        </div>
                        <div class="col-sm-8">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">商品编号</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="goodsNo" value="${uploadGoods.goodsNo}" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">产品名称</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="productName" value="${uploadGoods.productName}" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">规格</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="specification" value="${uploadGoods.specification}" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">价格</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="price" value="${uploadGoods.price}" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">材质</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="texture" value="${uploadGoods.texture}" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">型号</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="model" value="${uploadGoods.model}" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">品牌</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="brand" value="${uploadGoods.brand}" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">备注</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="comment" value="${uploadGoods.comment}" />
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
                <div class="form-group">
                    <div class="col-sm-4 col-sm-offset-8">
                        <button class="btn btn-primary" type="button" onclick="edit()">修改</button>
                    </div>
                </div>
                <form id="picForm" action="${webRoot}/uploadGoodsController/upload.do" method="post" enctype="multipart/form-data" style="width:auto;">
                    <input type="hidden" name="id" value="${uploadGoods.id}" />
                    <input type="hidden" name="field" />
                    <input type="file" name="fileToUpload" id="fileToUpload" onchange="fileSelected();" style="display:none;">
                </form>
            </div>
        </div>
    </div>
</body>
<script>
    var editUrl = "${webRoot}/uploadGoodsController/edit.do";
    function edit() {
        $.ajax({
            type: "post",
            url: editUrl,
            dataType: "json",
            data: $("#uploadGoodsForm").serialize(),
            success: function(data){
                parent.layer.closeAll();
            }
        });
    }
    function fileSelect(field) {
        $("[name='field']").val(field);
        $("#fileToUpload").click();
    }

    function fileSelected() {
        var form = new FormData($("#picForm")[0]);
        $.ajax({
            url:"${webRoot}/uploadGoodsController/upload.do",
            type:"post",
            data:form,
            processData:false,
            contentType:false,
            success:function(data){
                var obj = JSON.parse(data);
                layer.msg(obj.msg);
                var field = $("[name='field']").val();
                $("."+field).attr("src","${webRoot}/"+obj.obj);
            },
            error:function(e){
                console.log(e);
            }
        });
    }
</script>
</html>
