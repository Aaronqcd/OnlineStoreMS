<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/context/mytags.jsp"%>
<html>
<head>
    <title>导入商品</title>
    <link rel="stylesheet" type="text/css" href="${webRoot}/plug-in/bootstrap-3.3.7/css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="${webRoot}/plug-in/webuploader/webuploader.css" />
    <link rel="stylesheet" type="text/css" href="${webRoot}/plug-in/webuploader/custom_style.css" />
    <link rel="stylesheet" type="text/css" href="${webRoot}/plug-in/ztree-v3.5.29/zTreeStyle/zTreeStyle.css" />
    <link rel="stylesheet" type="text/css" href="${webRoot}/plug-in/ztree-v3.5.29/zTreeStyle/custom.css" />
    <script type="text/javascript" src="${webRoot}/plug-in/jquery/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="${webRoot}/plug-in/bootstrap-3.3.7/js/bootstrap.js"></script>
    <script type="text/javascript" src="${webRoot}/plug-in/layer/layer.js"></script>
    <script type="text/javascript" src="${webRoot}/plug-in/webuploader/webuploader.js"></script>
    <script type="text/javascript" src="${webRoot}/custom/js/goods/upload.js"></script>
    <script type="text/javascript" src="${webRoot}/plug-in/ztree-v3.5.29/js/jquery.ztree.core.min.js"></script>
    <script type="text/javascript" src="${webRoot}/plug-in/ztree-v3.5.29/js/jquery.ztree.excheck.min.js"></script>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <form id="uploadGoodsForm" method="get" class="form-inline">
                    <div class="form-group" style="margin-bottom: 10px;width: 100%;margin-top: 10px;">
                        <label for="category" class="col-sm-2 col-md-2" style="margin-top: 8px">商品类别：</label>
                        <input type="hidden" name="category" />
                        <input type="text" id="category" class="form-control col-sm-4 col-md-4" readonly placeholder="-----请选择商品类别-----" />
                        <button type="button" class="btn btn-primary btn-sm col-sm-2 col-md-2 col-sm-offset-1
                            col-md-offset-1" onclick="getCategory()" style="margin-top: 1px">选择商品类别</button>
                    </div>
                    <div id="wrapp">
                        <div id="container">
                            <div id="uploader">
                                <div class="queueList">
                                    <div id="dndArea" class="placeholder">
                                        <div id="filePicker"></div>
                                        <p>或将文件拖到这里</p>
                                    </div>
                                </div>
                                <div class="statusBar" style="display:none;">
                                    <div class="progress">
                                        <span class="text">0%</span>
                                        <span class="percentage"></span>
                                    </div><div class="info"></div>
                                    <div class="btns">
                                        <div id="filePicker2"></div><div class="uploadBtn">上传文件</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
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
    var swfUrl = "${webRoot}/plug-in/webuploader/Uploader.swf";
    var uploadUrl = "${webRoot}/goodsController/importExcel.do";
    var getCategoryUrl = "${webRoot}/goodsController/category/all.do";
    var screenHeight = window.screen.height;
    var setting = {
        check: {
            enable: true,
            chkStyle: "radio",
            chkboxType: { "Y": "ps", "N": "ps" },
            radioType: "all"
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
                    zNodes.push(obj);
                }
            }
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
</script>
</html>
