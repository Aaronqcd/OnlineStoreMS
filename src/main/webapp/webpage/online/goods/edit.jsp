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
                <form id="goodsForm" method="get" class="form-horizontal">
                    <input type="hidden" name="id" value="${goods.id}" />
                    <input type="hidden" name="pageNo" value="${pageNo}" />
                    <div>
                        <div class="col-sm-3">
                            <div class="form-group">
                                <c:choose>
                                    <c:when test="${fn:contains(goods.picture1,'https://')}">
                                        <img src="${goods.picture1}" class="picture1" title="商品图片" class="img-responsive"
                                             style="width: 180px;height:180px;cursor:pointer" onclick="fileSelect('picture1');">
                                    </c:when>
                                    <c:otherwise>
                                        <img src="${webRoot}/${goods.picture1}" class="picture1" title="商品图片" class="img-responsive"
                                             style="width: 180px;height:180px;cursor:pointer" onclick="fileSelect('picture1');">
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="form-group">
                                <c:choose>
                                    <c:when test="${fn:contains(goods.picture2,'https://')}">
                                        <img src="${goods.picture2}" class="picture2" title="商品图片" class="img-responsive"
                                             style="width: 180px;height:180px;cursor:pointer" onclick="fileSelect('picture2');">
                                    </c:when>
                                    <c:otherwise>
                                        <img src="${webRoot}/${goods.picture2}" class="picture2" title="商品图片" class="img-responsive"
                                             style="width: 180px;height:180px;cursor:pointer" onclick="fileSelect('picture2');">
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="form-group">
                                <c:choose>
                                    <c:when test="${fn:contains(goods.picture3,'https://')}">
                                        <img src="${goods.picture3}" class="picture3" title="商品图片" class="img-responsive"
                                             style="width: 180px;height:180px;cursor:pointer" onclick="fileSelect('picture3');">
                                    </c:when>
                                    <c:otherwise>
                                        <img src="${webRoot}/${goods.picture3}" class="picture3" title="商品图片" class="img-responsive"
                                             style="width: 180px;height:180px;cursor:pointer" onclick="fileSelect('picture3');">
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="col-sm-9">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">商品分类</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="category" value="${goods.category}" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">商品标题</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="title" value="${goods.title}" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">商品价格</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="price" value="${goods.price}" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">淘宝价</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="taobaoPrice" value="${goods.taobaoPrice}" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">交易数</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="dealNumber" value="${goods.dealNumber}" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">评论数</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="commentNumber" value="${goods.commentNumber}" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">人气值</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="popularityValue" value="${goods.popularityValue}" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">抓取时间</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="grabDate" value="${goods.grabDate}" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">原店铺链接</label>
                                <div class="col-sm-9">
                                    <p class="form-control-static">
                                        <a href="${goods.link}" target=”_blank">原店铺链接</a>
                                    </p>
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
                <form id="picForm" action="${webRoot}/goodsController/upload.do" method="post" enctype="multipart/form-data" style="width:auto;">
                    <input type="hidden" name="id" value="${goods.id}" />
                    <input type="hidden" name="field" />
                    <input type="file" name="fileToUpload" id="fileToUpload" onchange="fileSelected();" style="display:none;">
                </form>
            </div>
        </div>
    </div>
</body>
<script>
    var editUrl = "${webRoot}/goodsController/edit.do";
    function edit() {
        $.ajax({
            type: "post",
            url: editUrl,
            dataType: "json",
            data: $("#goodsForm").serialize(),
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
        //$("#picForm").submit();
        var form = new FormData($("#picForm")[0]);
        $.ajax({
            url:"${webRoot}/goodsController/upload.do",
            type:"post",
            data:form,
            processData:false,
            contentType:false,
            success:function(data){
                //debugger;
                var obj = JSON.parse(data);
                console.log(obj);
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
