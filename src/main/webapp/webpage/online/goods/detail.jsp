<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/context/mytags.jsp"%>
<html>
<head>
    <title>商品详情</title>
    <link rel="stylesheet" type="text/css" href="${webRoot}/plug-in/bootstrap-3.3.7/css/bootstrap.css" />
    <script type="text/javascript" src="${webRoot}/plug-in/jquery/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="${webRoot}/plug-in/bootstrap-3.3.7/js/bootstrap.js"></script>
    <script type="text/javascript" src="${webRoot}/plug-in/layer/layer.js"></script>
    <%--<style>
        img{
            -webkit-transition: ease .2s;
            transition: ease .2s;
            -webkit-transform-origin:50% 50%; /* transform-origin默认值就是居中，可以不加 */
            transform-origin:50% 50%; /* transform-origin默认值就是居中，可以不加 */
        }
        .hover{
            -webkit-transform: scale(1.5); /*放大1.2倍*/
            transform: scale(1.5); /*放大1.2倍*/
        }
    </style>--%>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <form id="goodsForm" method="get" class="form-horizontal">
                    <div>
                        <div class="col-sm-4" style="margin-top: 20px;">
                            <div class="form-group">
                                <c:choose>
                                    <c:when test="${fn:contains(goods.picture1,'https://')}">
                                        <img src="${goods.picture1}" title="商品图片"
                                             class="img-responsive" style="width: 220px;height:220px">
                                    </c:when>
                                    <c:otherwise>
                                        <img src="${webRoot}/${goods.picture1}" title="商品图片"
                                             class="img-responsive" style="width: 220px;height:220px">
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="form-group">
                                <c:choose>
                                    <c:when test="${fn:contains(goods.picture2,'https://')}">
                                        <img src="${goods.picture2}" title="商品图片"
                                             class="img-responsive" style="width: 220px;height:220px">
                                    </c:when>
                                    <c:otherwise>
                                        <img src="${webRoot}/${goods.picture2}" title="商品图片"
                                             class="img-responsive" style="width: 220px;height:220px">
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <%--<c:set value="${fn:split(goods.picture1,'/')}" var="picture1" />
                            <c:set value="${fn:split(goods.picture2,'/')}" var="picture2" />
                            <c:if test="${picture1[fn:length(picture1)-1]!=picture2[fn:length(picture2)-1]}">
                            <div class="form-group">
                                <c:choose>
                                    <c:when test="${fn:contains(goods.picture2,'https://')}">
                                        <img src="${goods.picture2}" title="商品图片"
                                             class="img-responsive" style="width: 220px;height:220px">
                                    </c:when>
                                    <c:otherwise>
                                        <img src="${webRoot}/${goods.picture2}" title="商品图片"
                                             class="img-responsive" style="width: 220px;height:220px">
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            </c:if>--%>
                            <div class="form-group">
                                <c:choose>
                                    <c:when test="${fn:contains(goods.picture3,'https://')}">
                                        <img src="${goods.picture3}" title="商品图片"
                                             class="img-responsive" style="width: 220px;height:220px">
                                    </c:when>
                                    <c:otherwise>
                                        <img src="${webRoot}/${goods.picture3}" title="商品图片"
                                             class="img-responsive" style="width: 220px;height:220px">
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="form-group">
                                <c:choose>
                                    <c:when test="${fn:contains(goods.picture4,'https://')}">
                                        <img src="${goods.picture4}" title="商品图片"
                                             class="img-responsive" style="width: 220px;height:220px">
                                    </c:when>
                                    <c:otherwise>
                                        <img src="${webRoot}/${goods.picture4}" title="商品图片"
                                             class="img-responsive" style="width: 220px;height:220px">
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="col-sm-8">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">商品分类</label>
                                <div class="col-sm-9">
                                    <p class="form-control-static">${goods.category}</p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">商品标题</label>
                                <div class="col-sm-9">
                                    <p class="form-control-static">${goods.title}</p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">商品价格</label>
                                <div class="col-sm-9">
                                    <p class="form-control-static">¥${goods.price}</p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">淘宝价</label>
                                <div class="col-sm-9">
                                    <p class="form-control-static">¥${goods.taobaoPrice}</p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">交易数</label>
                                <div class="col-sm-9">
                                    <p class="form-control-static">${goods.dealNumber}</p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">评论数</label>
                                <div class="col-sm-9">
                                    <p class="form-control-static">${goods.commentNumber}</p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">人气值</label>
                                <div class="col-sm-9">
                                    <p class="form-control-static">${goods.popularityValue}</p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">抓取时间</label>
                                <div class="col-sm-9">
                                    <p class="form-control-static">${goods.grabDate}</p>
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
            </div>
        </div>
    </div>
</body>
<script>
    /*$(function() {
        $('img').hover(function(){
            $(this).addClass('hover')
        },function(){
            $(this).removeClass('hover')
        });
    });*/
</script>
</html>
