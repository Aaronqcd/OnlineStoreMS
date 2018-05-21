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
        <div class="row"><!-- 将要加入的略缩图放入row中 -->
            <!-- 第一张略缩图开始 -->

            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-6"><!-- 大屏幕放4张略缩图，pc端放3张，平板和手机放2张-->
                <div class="thumbnail">
                    <img src="https://gd1.alicdn.com/imgextra/i1/0/T1dUYTFItaXXXXXXXX_!!0-item_pic.jpg_400x400.jpg" alt="..."
                         class="img-responsive" style="width: 220px;height:220px">
                    <div class="caption">
                        <h4>¥20.80</h4>
                        <p style="color:red;">
                            天然黑白水晶大理石马赛克文化石形象墙门头吧台电视......
                        </p>
                    </div>
                </div>
            </div>
            <!-- 第一张略缩图结束 -->

            <!-- 第二张略缩图开始 -->
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-6">
                <div class="thumbnail">
                    <img src="https://gd4.alicdn.com/imgextra/i1/890894315/TB2VJc2g5qAXuNjy1XdXXaYcVXa_!!890894315.jpg_400x400.jpg" alt="..."
                         class="img-responsive" style="width: 220px;height:220px">
                    <div class="caption">
                        <h4>¥3.80</h4>
                        <p style="color:red;">
                            简约北欧白色面包砖凹凸瓷砖厨房卫生间墙面砖巧克力系列
                        </p>
                    </div>
                </div>
            </div>

            <!-- 第二张略缩图结束 -->

            <!-- 第三张略缩图开始 -->
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-6">
                <div class="thumbnail">
                    <img src="https://gd1.alicdn.com/imgextra/i3/20784646/TB278EVmFXXXXb3XXXXXXXXXXXX_!!20784646.jpg_400x400.jpg" alt="..."
                         class="img-responsive" style="width: 220px;height:220px">
                    <div class="caption">
                        <h4>¥12.00</h4>
                        <p style="color:red;">
                            北欧200瓷砖地板砖客厅阳台防滑地砖MUJI文艺复古......
                        </p>
                    </div>
                </div>
            </div>

            <!-- 第三张略缩图结束 -->

            <!-- 第四张略缩图开始 -->
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-6">
                <div class="thumbnail">
                    <img src="https://gd3.alicdn.com/imgextra/i2/411978487/TB2JOo4cMSI.eBjy1XcXXc1jXXa_!!411978487.jpg_400x400.jpg" alt="..."
                         class="img-responsive" style="width: 220px;height:220px">
                    <div class="caption">
                        <h4>¥2.99</h4>
                        <p style="color:red;">
                            北欧纯色黑白灰六角砖哑光六边形瓷砖全瓷厨房卫生间......
                        </p>
                    </div>
                </div>
            </div>
            <!-- 第四张略缩图结束 -->

        </div>


        <!-- 结束 -->

    </div>

</body>
</html>
