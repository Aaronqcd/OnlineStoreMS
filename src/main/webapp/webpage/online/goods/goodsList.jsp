<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/context/mytags.jsp"%>
<html>
<head>
    <title>商品列表</title>
    <link rel="stylesheet" type="text/css" href="${webRoot}/plug-in/bootstrap-3.3.7/css/bootstrap.css" />
    <script type="text/javascript" src="${webRoot}/plug-in/jquery/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="${webRoot}/plug-in/bootstrap-3.3.7/js/bootstrap.js"></script>
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
                        <h4>${good.price}</h4>
                        <p style="color:red;">
                            ${good.title}
                        </p>
                    </div>
                </div>
            </div>
            </c:forEach>

        </div>

        <div>
            <ul class="pagination">
                <li><a href="#">&laquo;</a></li>
                <li><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5${page.topPageNo }</a></li>
                <li><a href="#">&raquo;</a></li>
            </ul>
        </div>
        <!-- 结束 -->

    </div>

</body>
</html>
