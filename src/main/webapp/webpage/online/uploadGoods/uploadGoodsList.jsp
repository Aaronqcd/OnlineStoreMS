<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/context/mytags.jsp"%>
<html>
<head>
    <title>上传商品列表</title>
    <link rel="stylesheet" type="text/css" href="${webRoot}/plug-in/bootstrap-3.3.7/css/bootstrap.css" />
    <script type="text/javascript" src="${webRoot}/plug-in/jquery/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="${webRoot}/plug-in/bootstrap-3.3.7/js/bootstrap.js"></script>
    <script type="text/javascript" src="${webRoot}/plug-in/layer/layer.js"></script>
    <script type="text/javascript" src="${webRoot}/plug-in/lhgDialog/lhgdialog.min.js?skin=metrole"></script>
    <script type="text/javascript" src="${webRoot}/plug-in/tools/curdtools_zh-cn.js"></script>
</head>
<body>
    <div class="container">  <!-- 开加一个container的目的是为了让整体布局居中 -->
        <div class="row" style="border: 1px solid #ddd;border-radius: 4px;padding-top: 10px;margin-top: 10px">
            <form class="form-inline" style="padding-left: 10px">
                <div class="form-group">
                    <label for="productName">产品名称</label>
                    <input type="text" class="form-control" id="productName" name="productName" placeholder="请输入产品名称"
                    value="${map['productName']}">
                </div>
                <button type="button" class="btn btn-primary" onclick="query()">查询</button>
                <button type="button" class="btn btn-primary" onclick="empty()">重置</button>
                <button type="button" class="btn btn-primary" onclick="edit()">编辑</button>
                <button type="button" class="btn btn-primary" onclick="del()">删除</button>
                <button type="button" class="btn btn-primary" onclick="importXls()">导入</button>
            </form>
        </div>
        <!-- 开始 -->
        <div class="row" style="padding-top:10px"><!-- 将要加入的略缩图放入row中 -->
        <c:choose>
            <c:when test="${page.totalRecords>0}">
            <c:forEach var="uploadGoods" items="${uploadGoodses}">
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-6"><!-- 大屏幕放4张略缩图，pc端放3张，平板和手机放2张-->
                <div class="thumbnail">
                    <img src="${webRoot}/${uploadGoods.pic1}" title="商品图片"
                         class="img-responsive" style="width: 220px;height:220px">
                    <div class="caption">
                        <h4>¥${uploadGoods.price}</h4>
                        <p style="color:red;">
                            <c:set var="productName" value="${fn:replace(uploadGoods.productName,' ','')}" />
                            <c:choose>
                                <c:when test="${fn:length(productName)>22}">
                                    <a href="javascript:void(0)" title="${productName}" onclick="detail('${uploadGoods.id}')">${fn:substring(productName, 0, 22)}...</a>
                                </c:when>
                                <c:otherwise>
                                    <a href="javascript:void(0)" title="${productName}" onclick="detail('${uploadGoods.id}')">${productName}</a>
                                </c:otherwise>
                            </c:choose>
                        </p>
                        <div style="text-align:right">
                            <input type="checkbox" name="uploadGoodsId" value="${uploadGoods.id}"/>
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

</body>
<script>
    var screenHeight = window.screen.height;
    var detailUrl = "${webRoot}/uploadGoodsController/detail.do";
    var leadInUrl = "${webRoot}/uploadGoodsController/leadIn.do";
    var editUrl = "${webRoot}/uploadGoodsController/goEdit.do";
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
                location.href="${webRoot}/uploadGoodsController/showAll.do?pageNo="+skipPage;
            }
        }
    }
    function query() {
        var productName = $("#productName").val();
        var pageNo = ${page.pageNo};
        location.href="${webRoot}/uploadGoodsController/showAll.do?pageNo="+pageNo+"&productName="+productName;
    }
    function empty() {
        $("#title").val('');
        location.href="${webRoot}/uploadGoodsController/showAll.do";
    }
    function topPage() {
        var title = $("#title").val();
        var url = "${webRoot}/uploadGoodsController/showAll.do?pageNo=${page.topPageNo }";
        if(title!='') {
            url += "&title="+title;
        }
        location.href = url;
    }
    function previousPage() {
        var title = $("#title").val();
        var url = "${webRoot}/uploadGoodsController/showAll.do?pageNo=${page.previousPageNo }";
        if(title!='') {
            url += "&title="+title;
        }
        location.href = url;
    }
    function nextPage() {
        var title = $("#title").val();
        var url = "${webRoot}/uploadGoodsController/showAll.do?pageNo=${page.nextPageNo }";
        if(title!='') {
            url += "&title="+title;
        }
        location.href = url;
    }
    function bottomPage() {
        var title = $("#title").val();
        var url = "${webRoot}/uploadGoodsController/showAll.do?pageNo=${page.bottomPageNo }";
        if(title!='') {
            url += "&title="+title;
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
                }
            });
        }
    }
    //导入
    function importXls() {
        if(screenHeight<=900) {
            layer.open({
                type: 2,
                title: '导入',
                maxmin: true,
                area: ['800px', '400px'],
                content: leadInUrl,
                end: function(){
                    location.href="${webRoot}/uploadGoodsController/showAll.do?pageNo=1";
                }
            });
        }
        else {
            layer.open({
                type: 2,
                title: '导入',
                maxmin: true,
                area: ['800px', '700px'],
                content: leadInUrl,
                end: function(){
                    location.href="${webRoot}/uploadGoodsController/showAll.do?pageNo=1";
                }
            });
        }
    }

    function edit() {
        var uploadGoodsIds=new Array();
        $("input[name='uploadGoodsId']:checkbox").each(function(){
            if($(this).prop("checked")){
                uploadGoodsIds.push($(this).val());
            }
        });
        if(uploadGoodsIds.length==0){
            alert('请选择数据!');
            return false;
        }
        else if(uploadGoodsIds.length>1){
            alert('只能选择1条数据!');
            return false;
        }
        var uploadGoodsId = uploadGoodsIds.join(',');
        if(screenHeight<=900) {
            layer.open({
                type: 2,
                title: '修改商品信息',
                maxmin: true,
                offset: '50px',
                area: ['900px', '400px'],
                scrollbar: false,
                content: editUrl+"?id="+uploadGoodsId+"&pageNo=${page.pageNo}",
                end: function(){
                    location.href="${webRoot}/uploadGoodsController/showAll.do?pageNo=${page.pageNo}";
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
                content: editUrl+"?id="+uploadGoodsId+"&pageNo=${page.pageNo}",
                end: function(){
                    location.href="${webRoot}/uploadGoodsController/showAll.do?pageNo=${page.pageNo}";
                }
            });
        }
    }
    function del() {
        var uploadGoodsIds=new Array();
        $("input[name='uploadGoodsId']:checkbox").each(function(){
            if($(this).prop("checked")){
                uploadGoodsIds.push($(this).val());
            }
        });
        if(uploadGoodsIds.length==0){
            alert('请选择数据!');
            return false;
        }
        parent.layer.confirm('确定批量删除这些商品吗？', {
            btn: ['确定','取消'] //按钮
        }, function(){
            $.ajax({
                url:"${webRoot}/uploadGoodsController/delete.do",
                type:"post",
                dataType:"json",
                data:{
                    ids: uploadGoodsIds
                },
                success:function(data){
                    console.log(data);
                    parent.layer.closeAll();
                    location.href="${webRoot}/uploadGoodsController/showAll.do?pageNo=${page.pageNo}";
                }
            });
        }, function(){
            parent.layer.closeAll();
        });
    }
</script>
</html>
