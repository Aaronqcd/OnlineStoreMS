<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/context/mytags.jsp"%>
<html>
<head>
    <title>导入商品</title>
    <link rel="stylesheet" type="text/css" href="${webRoot}/plug-in/bootstrap-3.3.7/css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="${webRoot}/plug-in/webuploader/webuploader.css" />
    <link rel="stylesheet" type="text/css" href="${webRoot}/plug-in/webuploader/custom_style.css" />
    <script type="text/javascript" src="${webRoot}/plug-in/jquery/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="${webRoot}/plug-in/bootstrap-3.3.7/js/bootstrap.js"></script>
    <script type="text/javascript" src="${webRoot}/plug-in/layer/layer.js"></script>
    <script type="text/javascript" src="${webRoot}/plug-in/webuploader/webuploader.js"></script>
    <script type="text/javascript" src="${webRoot}/custom/js/light/upload.js"></script>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <form id="lightForm" method="get" class="form-horizontal">
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
                                        <div id="filePicker2"></div><div class="uploadBtn">上传课件</div>
                                    </div>
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
    var swfUrl = "${webRoot}/plug-in/webuploader/Uploader.swf";
    var uploadUrl = "${webRoot}/lightController.do?importExcel";
</script>
</html>
