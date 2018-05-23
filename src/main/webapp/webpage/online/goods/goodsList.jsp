<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/context/mytags.jsp"%>
<html>
<head>
    <title>商品列表</title>
    <link rel="stylesheet" type="text/css" href="${webRoot}/plug-in/bootstrap-3.3.7/css/bootstrap.css" />
    <script type="text/javascript" src="${webRoot}/plug-in/jquery/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="${webRoot}/plug-in/bootstrap-3.3.7/js/bootstrap.js"></script>
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
    <div class="container">  <!-- 开加一个container的目的是为了让整体布局居中 -->
        <!-- 开始 -->
        <div class="row" style="padding-top:10px"><!-- 将要加入的略缩图放入row中 -->

            <c:forEach var="good" items="${goods}">
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-6"><!-- 大屏幕放4张略缩图，pc端放3张，平板和手机放2张-->
                <div class="thumbnail">
                    <img src="${good.picture1}" alt="..."
                         class="img-responsive" style="width: 220px;height:220px">
                    <div class="caption">
                        <h4>¥${good.price}</h4>
                        <p style="color:red;">
                            ${good.title}
                        </p>
                    </div>
                </div>
            </div>
            </c:forEach>

        </div>

        <div>

            <div style="float:right">
                <ul class="pagination">
                    <li><a href="${webRoot}/goodsController/showAll.do?pageNo=${page.topPageNo }">首页</a></li>
                    <c:choose>
                    <c:when test="${page.pageNo!=1}">
                    <li><a href="${webRoot}/goodsController/showAll.do?pageNo=${page.previousPageNo }">上一页</a></li>
                    </c:when>
                    </c:choose>
                    <c:choose>
                    <c:when test="${page.pageNo != page.totalPages}">
                    <li><a href="${webRoot}/goodsController/showAll.do?pageNo=${page.nextPageNo }">下一页</a></li>
                    </c:when>
                    </c:choose>
                    <li><a href="${webRoot}/goodsController/showAll.do?pageNo=${page.bottomPageNo }">尾页</a></li>
                    <li>
                        <span style="margin-left:6px;">共${page.totalRecords}条记录 共${page.totalPages}页 当前第${page.pageNo}页</span>
                    </li>
                    <li>
                        <input type="text" id="skipPage" class="form-control" style="width: 10%;display: inline;margin-left:6px;"/>
                        <button type="button" onclick="skipPage()" class="btn btn-default">跳转</button>
                    </li>
                </ul>
            </div>
        </div>
        <!-- 结束 -->

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
    $('#skipPage').bind('keydown',function(event){
        if(event.keyCode == "13") {
            skipPage();
        }
    });
    function skipPage() {
        var skipPage = $("#skipPage").val();
        if(skipPage=='') {
            alert("请填写跳转的页数");
            return false;
        }
        else {
            var page = Number(skipPage);
            if(isNaN(page)) {
                alert("页数必须为数字");
                return false;
            }
            else if(page<1 || page>${page.totalPages}) {
                alert("页数不能小于1或大于最大页数");
                return false;
            }
            else {
                location.href="${webRoot}/goodsController/showAll.do?pageNo="+skipPage;
            }
        }
    }
</script>
</html>
