<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/context/mytags.jsp"%>
<html>
<head>
    <title>商品列表</title>
    <link rel="stylesheet" type="text/css" href="${webRoot}/plug-in/bootstrap-3.3.7/css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="${webRoot}/plug-in/ztree-v3.5.29/zTreeStyle/zTreeStyle.css" />
    <link rel="stylesheet" type="text/css" href="${webRoot}/plug-in/ztree-v3.5.29/zTreeStyle/custom.css" />
    <script type="text/javascript" src="${webRoot}/plug-in/jquery/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="${webRoot}/plug-in/bootstrap-3.3.7/js/bootstrap.js"></script>
    <script type="text/javascript" src="${webRoot}/plug-in/layer-v3.1.1/layer.js"></script>
    <script type="text/javascript" src="${webRoot}/plug-in/ztree-v3.5.29/js/jquery.ztree.core.min.js"></script>
    <script type="text/javascript" src="${webRoot}/plug-in/ztree-v3.5.29/js/jquery.ztree.excheck.min.js"></script>
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
    <style>
        .search-box {
            border: 1px solid #ddd;
            border-radius: 4px;
            padding-top: 10px;
            margin-top: 10px;
            margin-right: 50px;
            position: fixed;
            z-index: 999;
        }
    </style>
</head>
<body>
    <div class="container">  <!-- 开加一个container的目的是为了让整体布局居中 -->
        <div class="row search-box">
            <form class="form-inline" style="padding-left: 10px">
                <div class="form-group" style="margin-bottom: 10px;">
                    <label for="category">商品类别：</label>
                    <input type="hidden" name="category" value="${map['category']}" />
                    <input type="text" id="category" class="form-control" readonly placeholder="-----请选择商品类别-----" value="${map['categoryName']}" />
                    <button type="button" class="btn btn-primary btn-sm" onclick="getCategory()">选择商品类别</button>
                </div>
                <div class="form-group">
                    <label for="title">商品标题</label>
                    <input type="text" class="form-control" id="title" name="title" placeholder="请输入商品标题"
                    value="${map['title']}">
                </div>
                <button type="button" class="btn btn-primary" onclick="query()">查询</button>
                <button type="button" class="btn btn-primary" onclick="empty()">重置</button>
                <button type="button" class="btn btn-primary" onclick="edit()">编辑</button>
                <button type="button" class="btn btn-primary" onclick="del()">删除</button>
                <button type="button" class="btn btn-primary" onclick="goImportStorePage()">导入至店铺</button>
                <button type="button" class="btn btn-primary" onclick="goBatchChangePrice()">批量更改价格</button>
                <button type="button" class="btn btn-primary" onclick="batchExportExcel()">excel批量导出</button>
                <button type="button" class="btn btn-primary" onclick="goBatchImportStorePage()">批量导入至店铺</button>
            </form>
        </div>
        <!-- 开始 -->
        <div class="row" style="padding-top:120px"><!-- 将要加入的略缩图放入row中 -->
        <c:choose>
            <c:when test="${page.totalRecords>0}">
            <c:forEach var="good" items="${goods}">
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-6"><!-- 大屏幕放4张略缩图，pc端放3张，平板和手机放2张-->
                <div class="thumbnail">
                    <c:choose>
                        <c:when test="${fn:contains(good.picture1,'https://')}">
                            <img src="${good.picture1}" title="商品图片"
                                 class="img-responsive" style="width: 220px;height:220px">
                        </c:when>
                        <c:otherwise>
                            <img src="${webRoot}/${good.picture1}" title="商品图片"
                                 class="img-responsive" style="width: 220px;height:220px">
                        </c:otherwise>
                    </c:choose>
                    <div class="caption">
                        <h4>¥${good.price}</h4>
                        <p style="color:red;">
                            <c:set var="title" value="${fn:replace(good.title,' ','')}" />
                            <c:choose>
                                <c:when test="${fn:length(title)>22}">
                                    <a href="javascript:void(0)" title="${title}" onclick="detail(${good.id})">${fn:substring(title, 0, 22)}...</a>
                                </c:when>
                                <c:otherwise>
                                    <a href="javascript:void(0)" title="${title}" onclick="detail(${good.id})">${title}</a>
                                </c:otherwise>
                            </c:choose>
                        </p>
                        <div style="text-align:right">
                            <input type="checkbox" name="goodsId" value="${good.id}"/>
                        </div>
                    </div>
                </div>
            </div>
            </c:forEach>
            </c:when>
            <c:otherwise>
            <div style="text-align: center">
                <span>无记录</span>
            </div>
            </c:otherwise>
        </c:choose>
        </div>

        <div>

            <div style="float:right">
                <c:if test="${page.totalRecords>0}">
                <ul class="pagination">
                    <li><a href="javascript:void(0)" onclick="topPage()">首页</a></li>
                    <c:choose>
                    <c:when test="${page.pageNo!=1}">
                    <li><a href="javascript:void(0)" onclick="previousPage()">上一页</a></li>
                    </c:when>
                    </c:choose>
                    <c:choose>
                    <c:when test="${page.pageNo != page.totalPages}">
                    <li><a href="javascript:void(0)" onclick="nextPage()">下一页</a></li>
                    </c:when>
                    </c:choose>
                    <li><a href="javascript:void(0)" onclick="bottomPage()">尾页</a></li>
                    <li>
                        <span style="margin-left:6px;">共${page.totalRecords}条记录 共${page.totalPages}页 当前第${page.pageNo}页</span>
                    </li>
                    <li>
                        <input type="text" id="skipPage" class="form-control" style="width: 10%;display: inline;margin-left:6px;"/>
                        <button type="button" onclick="skipPage()" class="btn btn-default">跳转</button>
                    </li>
                </ul>
                </c:if>
            </div>
        </div>
        <!-- 结束 -->

    </div>
    <div id="categoryDiv" style="display:none">
        <div>
            <ul id="treeCategory" class="ztree"></ul>
        </div>
        <div class="form-group p-d-30">
            <div class="col-sm-4 col-sm-offset-8">
                <button class="btn btn-primary" type="button" onclick="saveCategory()">确定</button>
                <button class="btn btn-primary" type="button" onclick="replacement()">重置</button>
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
    var screenHeight = window.screen.height;
    var detailUrl = "${webRoot}/goodsController/detail.do";
    var editUrl = "${webRoot}/goodsController/goEdit.do";
    var goImportStoreUrl = "${webRoot}/goodsController/goImportStore.do";
    var goBatchChangePriceUrl = "${webRoot}/goodsController/goBatchChangePrice.do";
    var getCategoryUrl = "${webRoot}/goodsController/category/all.do";
    var importStoreUrl = "${webRoot}/goodsController/importStore.do";
    var validateImportStoreUrl = "${webRoot}/goodsController/validateImportStore.do";
    var batchExportExcelUrl = "${webRoot}/goodsController/batchExportExcel.do";
    var leadInUrl = "${webRoot}/goodsController/leadIn.do";
    var setting = {
        check: {
            enable: true,
            chkStyle: "checkbox",
            chkboxType: { "Y": "ps", "N": "ps" }
        },
        data: {
            simpleData: {
                enable: true
            }
        }
    };
    var zNodes = new Array();
    $(function() {
        getAllCategory();
        $.fn.zTree.init($("#treeCategory"), setting, zNodes);
    });
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
    function query() {
        var title = $("#title").val();
        var category = $("[name='category']").val();
        var categoryName = $("#category").val();
        /*if(title=='') {
            alert("请输入商品标题");
            return false;
        }*/
        //var pageNo = ${page.pageNo};
        location.href="${webRoot}/goodsController/showAll.do?pageNo=1&title="+title+
                "&category="+category+"&categoryName="+categoryName;
    }
    function empty() {
        $("#title").val('');
        $("#category").val('');
        $("[name='category']").val('');
        location.href="${webRoot}/goodsController/showAll.do";
    }
    function topPage() {
        var title = $("#title").val();
        var category = $("[name='category']").val();
        var categoryName = $("#category").val();
        var url = "${webRoot}/goodsController/showAll.do?pageNo=${page.topPageNo }";
        if(title!='') {
            url += "&title="+title;
        }
        if(category!='') {
            url += "&category="+category+"&categoryName="+categoryName;
        }
        location.href = url;
    }
    function previousPage() {
        var title = $("#title").val();
        var category = $("[name='category']").val();
        var categoryName = $("#category").val();
        var url = "${webRoot}/goodsController/showAll.do?pageNo=${page.previousPageNo }";
        if(title!='') {
            url += "&title="+title;
        }
        if(category!='') {
            url += "&category="+category+"&categoryName="+categoryName;
        }
        location.href = url;
    }
    function nextPage() {
        var title = $("#title").val();
        var category = $("[name='category']").val();
        var categoryName = $("#category").val();
        var url = "${webRoot}/goodsController/showAll.do?pageNo=${page.nextPageNo }";
        if(title!='') {
            url += "&title="+title;
        }
        if(category!='') {
            url += "&category="+category+"&categoryName="+categoryName;
        }
        location.href = url;
    }
    function bottomPage() {
        var title = $("#title").val();
        var category = $("[name='category']").val();
        var categoryName = $("#category").val();
        var url = "${webRoot}/goodsController/showAll.do?pageNo=${page.bottomPageNo }";
        if(title!='') {
            url += "&title="+title;
        }
        if(category!='') {
            url += "&category="+category+"&categoryName="+categoryName;
        }
        location.href = url;
    }
    function detail(id) {
        if(screenHeight<=900) {
            layer.open({
                type: 2,
                title: '商品详情',
                maxmin: true,
                offset: '50px',
                area: ['900px', '400px'],
                scrollbar: false,
                content: detailUrl+"?id="+id,
                end: function(){
                    //reload();
                }
            });
        }
        else {
            layer.open({
                type: 2,
                title: '商品详情',
                maxmin: true,
                area: ['900px', '700px'],
                scrollbar: false,
                content: detailUrl+"?id="+id,
                end: function(){
                    //reload();
                }
            });
        }
    }
    function edit() {
        var goodsIds=new Array();
        $("input[name='goodsId']:checkbox").each(function(){
            if($(this).prop("checked")){
                goodsIds.push($(this).val());
            }
        });
        if(goodsIds.length==0){
            alert('请选择数据!');
            return false;
        }
        else if(goodsIds.length>1){
            alert('只能选择1条数据!');
            return false;
        }
        var goodsId = goodsIds.join(',');
        if(screenHeight<=900) {
            layer.open({
                type: 2,
                title: '修改商品信息',
                maxmin: true,
                offset: '50px',
                area: ['900px', '400px'],
                scrollbar: false,
                content: editUrl+"?id="+goodsId+"&pageNo=${page.pageNo}",
                end: function(){
                    location.href="${webRoot}/goodsController/showAll.do?pageNo=${page.pageNo}";
                }
            });
        }
        else {
            layer.open({
                type: 2,
                title: '修改商品信息',
                maxmin: true,
                area: ['900px', '700px'],
                scrollbar: false,
                content: editUrl+"?id="+goodsId+"&pageNo=${page.pageNo}",
                end: function(){
                    location.href="${webRoot}/goodsController/showAll.do?pageNo=${page.pageNo}";
                }
            });
        }
    }

    function del() {
        var goodsIds=new Array();
        $("input[name='goodsId']:checkbox").each(function(){
            if($(this).prop("checked")){
                goodsIds.push($(this).val());
            }
        });
        if(goodsIds.length==0){
            alert('请选择数据!');
            return false;
        }
        parent.layer.confirm('确定批量删除这些商品吗？', {
            btn: ['确定','取消'] //按钮
        }, function(){
            $.ajax({
                url:"${webRoot}/goodsController/delete.do",
                type:"post",
                dataType:"json",
                data:{
                    ids: goodsIds
                },
                success:function(data){
                    console.log(data);
                    parent.layer.closeAll();
                    location.href="${webRoot}/goodsController/showAll.do?pageNo=${page.pageNo}";
                }
            });
        }, function(){
            parent.layer.closeAll();
        });
    }
    //弹出选择商品类别框
    function getCategory() {
        var code = $("[name='category']").val();
        var zTreeObj = $.fn.zTree.getZTreeObj("treeCategory");
        var node = zTreeObj.getNodeByParam("code",code);
        if(node!=null) {
            zTreeObj.checkNode(node,true);
        }
        if(screenHeight<=900) {
            layer.open({
                type: 1,
                title: '选择商品类别',
                maxmin: true,
                offset: '50px',
                area: ['600px', '300px'],
                content: $('#categoryDiv'),
                end: function(){
                }
            });
        }
        else {
            layer.open({
                type: 1,
                title: '选择商品类别',
                maxmin: true,
                area: ['600px', '500px'],
                content: $('#categoryDiv'),
                end: function(){
                }
            });
        }
    }

    //获取所有商品类别
    function getAllCategory() {
        $.ajax({
            type: "post",
            async: false,
            dataType: "json",
            url: getCategoryUrl,
            success: function (data) {
                for (var i = 0; i < data.length; i++) {
                    var obj = new Object();
                    obj.name = data[i].name;
                    obj.id = data[i].id;
                    obj.pId = data[i].pid;
                    obj.checked = data[i].checked;
                    obj.open = data[i].open;
                    obj.code = data[i].code;
                    //obj.sign = data[i].sign;
                    zNodes.push(obj);
                }
            }
        });
    }

    function saveCategory() {
        var zTreeObj = $.fn.zTree.getZTreeObj("treeCategory");
        var checkedNodes = zTreeObj.getCheckedNodes();
        var codes = "";
        var names = "";
        console.log(checkedNodes);
        for(var i=0; i<checkedNodes.length; i++) {
            if(checkedNodes[i].check_Child_State!=1 && !checkedNodes[i].isParent) {
                codes += checkedNodes[i].code+",";
                names += checkedNodes[i].name+",";
            }
        }
        codes = codes.substr(0, codes.length - 1);
        names = names.substr(0, names.length - 1);
        $("#category").val(names);
        $("[name='category']").val(codes);
        layer.close(layer.index);
    }

    function replacement() {
        var zTreeObj = $.fn.zTree.getZTreeObj("treeCategory");
        zTreeObj.checkAllNodes(false);
        $("#category").val('');
        $("[name='category']").val('');
    }

    function importStore() {
        var goodsIds=new Array();
        $("input[name='goodsId']:checkbox").each(function(){
            if($(this).prop("checked")){
                goodsIds.push($(this).val());
            }
        });
        if(goodsIds.length==0){
            alert('请选择数据!');
            return false;
        }
        else if(goodsIds.length>1){
            alert('只能选择1条数据!');
            return false;
        }
        var goodsId = goodsIds.join(',');
        $.ajax({
            type: "post",
            dataType: "json",
            url: importStoreUrl,
            data:{
                id: goodsId
            },
            success: function (data) {

            }
        });
    }
    /**
     * 进入导入至店铺的页面
     * @returns {boolean}
     */
    function goImportStorePage() {
        var flag = true;
        var goodsIds=new Array();
        $("input[name='goodsId']:checkbox").each(function(){
            if($(this).prop("checked")){
                goodsIds.push($(this).val());
            }
        });
        if(goodsIds.length==0){
            alert('请选择数据!');
            return false;
        }
        else if(goodsIds.length>1){
            alert('只能选择1条数据!');
            return false;
        }
        var goodsId = goodsIds.join(',');
        $.ajax({
            type: "post",
            dataType: "json",
            url: validateImportStoreUrl,
            async: false,
            data:{
                id: goodsId
            },
            success: function (data) {
                if(!data.success) {
                    alert(data.msg);
                    flag = false;
                }
            }
        });
        if(!flag) {
            return flag;
        }
        if(screenHeight<=900) {
            layer.open({
                type: 2,
                title: '导入至店铺',
                maxmin: true,
                offset: '50px',
                area: ['900px', '400px'],
                scrollbar: false,
                content: goImportStoreUrl+"?id="+goodsId+"&pageNo=${page.pageNo}",
                end: function(){
                }
            });
        }
        else {
            layer.open({
                type: 2,
                title: '导入至店铺',
                maxmin: true,
                area: ['900px', '700px'],
                scrollbar: false,
                content: goImportStoreUrl+"?id="+goodsId+"&pageNo=${page.pageNo}",
                end: function(){
                }
            });
        }
    }

    function goBatchChangePrice() {
        var category = $("[name='category']").val();
        category = category.split(",");
        if(category.length==1&&category[0]=='') {
            alert("请选择一个商品类别");
            return false;
        }
        else if(category.length>1) {
            alert("只能选择一个商品类别");
            return false;
        }
        if(screenHeight<=900) {
            layer.open({
                type: 2,
                title: '批量更改价格',
                maxmin: true,
                offset: '50px',
                area: ['600px', '300px'],
                scrollbar: false,
                content: goBatchChangePriceUrl+"?category="+category+"&pageNo=${page.pageNo}",
                end: function(){
                }
            });
        }
        else {
            layer.open({
                type: 2,
                title: '批量更改价格',
                maxmin: true,
                area: ['600px', '400px'],
                scrollbar: false,
                content: goBatchChangePriceUrl+"?category="+category+"&pageNo=${page.pageNo}",
                end: function(){
                }
            });
        }
    }
    function batchExportExcel() {
        var category = $("[name='category']").val();
        category = category.split(",");
        if(category.length==1&&category[0]=='') {
            alert("请选择一个商品类别");
            return false;
        }
        else if(category.length>1) {
            alert("只能选择一个商品类别");
            return false;
        }
        location.href=batchExportExcelUrl+"?category="+category+"&pageNo=${page.pageNo}"
    }
    //批量导入至店铺
    function goBatchImportStorePage() {
        if(screenHeight<=900) {
            layer.open({
                type: 2,
                title: '导入',
                maxmin: true,
                offset: '50px',
                area: ['800px', '400px'],
                content: leadInUrl,
                end: function(){
                }
            });
        }
        else {
            layer.open({
                type: 2,
                title: '导入',
                maxmin: true,
                offset: '50px',
                area: ['800px', '700px'],
                content: leadInUrl,
                end: function(){
                }
            });
        }
    }
</script>
</html>
