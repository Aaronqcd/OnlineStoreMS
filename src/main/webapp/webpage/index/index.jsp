<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!doctype html>
<!--[if lt IE 7]> <html class="no-js ie6 oldie" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js ie7 oldie" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js ie8 oldie" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>商品数据库平台</title>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="shortcut icon" href="${webRoot}/images/favicon.ico">
    <!-- CSS Reset -->
    <link rel="stylesheet" href="${webRoot}/custom/css/reset.css">

    <!-- Global CSS for the page and tiles -->
    <link rel="stylesheet" href="${webRoot}/custom/css/main.css">

</head>

<body>

<div id="container">
    <header>
    </header>
    <div id="main" role="main">

        <ul id="tiles">
            <!-- These are our grid blocks -->
            <li>
                <a herf="javascript:void(0)" onclick="goHome(1)">
                    <img src="${webRoot}/custom/sample-images/image_1.jpg" width="300" height="200">
                </a>
            </li>
            <li><img src="${webRoot}/custom/sample-images/image_2.jpg" width="300" height="200"></li>
            <li><img src="${webRoot}/custom/sample-images/image_3.jpg" width="300" height="200"></li>
            <li><img src="${webRoot}/custom/sample-images/image_4.jpg" width="300" height="200"></li>
            <li><img src="${webRoot}/custom/sample-images/image_5.jpg" width="300" height="200"></li>
            <li><img src="${webRoot}/custom/sample-images/image_6.jpg" width="300" height="200"></li>
            <%--<li><img src="${webRoot}/custom/sample-images/image_7.jpg" width="200" height="200"><p>7</p></li>
            <li><img src="${webRoot}/custom/sample-images/image_8.jpg" width="200" height="200"><p>8</p></li>
            <li><img src="${webRoot}/custom/sample-images/image_9.jpg" width="200" height="398"><p>9</p></li>
            <li><img src="${webRoot}/custom/sample-images/image_10.jpg" width="200" height="267"><p>10</p></li>
            <li><img src="${webRoot}/custom/sample-images/image_1.jpg" width="200" height="283"><p>11</p></li>
            <li><img src="${webRoot}/custom/sample-images/image_2.jpg" width="200" height="300"><p>12</p></li>
            <li><img src="${webRoot}/custom/sample-images/image_3.jpg" width="200" height="252"><p>13</p></li>
            <li><img src="${webRoot}/custom/sample-images/image_4.jpg" width="200" height="158"><p>14</p></li>
            <li><img src="${webRoot}/custom/sample-images/image_5.jpg" width="200" height="300"><p>15</p></li>
            <li><img src="${webRoot}/custom/sample-images/image_6.jpg" width="200" height="297"><p>16</p></li>
            <li><img src="${webRoot}/custom/sample-images/image_7.jpg" width="200" height="200"><p>17</p></li>
            <li><img src="${webRoot}/custom/sample-images/image_8.jpg" width="200" height="200"><p>18</p></li>
            <li><img src="${webRoot}/custom/sample-images/image_9.jpg" width="200" height="398"><p>19</p></li>
            <li><img src="${webRoot}/custom/sample-images/image_10.jpg" width="200" height="267"><p>20</p></li>
            <li><img src="${webRoot}/custom/sample-images/image_1.jpg" width="200" height="283"><p>21</p></li>
            <li><img src="${webRoot}/custom/sample-images/image_2.jpg" width="200" height="300"><p>22</p></li>
            <li><img src="${webRoot}/custom/sample-images/image_3.jpg" width="200" height="252"><p>23</p></li>
            <li><img src="${webRoot}/custom/sample-images/image_4.jpg" width="200" height="158"><p>24</p></li>
            <li><img src="${webRoot}/custom/sample-images/image_5.jpg" width="200" height="300"><p>25</p></li>
            <li><img src="${webRoot}/custom/sample-images/image_6.jpg" width="200" height="297"><p>26</p></li>
            <li><img src="${webRoot}/custom/sample-images/image_7.jpg" width="200" height="200"><p>27</p></li>
            <li><img src="${webRoot}/custom/sample-images/image_8.jpg" width="200" height="200"><p>28</p></li>
            <li><img src="${webRoot}/custom/sample-images/image_9.jpg" width="200" height="398"><p>29</p></li>
            <li><img src="${webRoot}/custom/sample-images/image_10.jpg" width="200" height="267"><p>30</p></li>--%>
            <!-- End of grid blocks -->
        </ul>

    </div>
</div>

<!-- include jQuery -->
<script type="text/javascript" src="${webRoot}/plug-in/jquery/jquery-1.8.3.min.js"></script>

<!-- Include the plug-in -->
<script src="${webRoot}/plug-in/jquery-wookmark/jquery.wookmark.min.js"></script>

<!-- Once the page is loaded, initalize the plug-in. -->
<script type="text/javascript">
    (function ($){
        var handler = $('#tiles li');

        handler.wookmark({
            // Prepare layout options.
            autoResize: true, // This will auto-update the layout when the browser window is resized.
            container: $('#main'), // Optional, used for some extra CSS styling
            offset: 5, // Optional, the distance between grid items
            outerOffset: 10, // Optional, the distance to the containers border
            itemWidth: 320 // Optional, the width of a grid item
        });

        // Capture clicks on grid items.
        /*handler.click(function(){
            // Randomize the height of the clicked item.
            var newHeight = $('img', this).height() + Math.round(Math.random() * 300 + 30);
            $(this).css('height', newHeight+'px');

            // Update the layout.
            handler.wookmark();
        });*/
    })(jQuery);

    function goHome(sign) {
        location.href = "${webRoot}/indexController.do?home&sign="+sign;
    }
</script>

</body>
</html>
