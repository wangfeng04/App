<%--
  Created by IntelliJ IDEA.
  User: s'j'w
  Date: 2022/3/11
  Time: 15:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<% pageContext.setAttribute("APP_PATH", request.getContextPath()); %>
<html>
<head>
    <title>后台软件审核列表</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link type="text/css" rel="styleSheet" href="${APP_PATH}/dist/css/bootstrap.css"/>
    <style type="text/css">
        .table tbody tr td {
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        #myInput {
            background-image: url('https://static.runoob.com/images/mix/searchicon.png'); /* 添加搜索按钮 */
            background-position: 10px 12px; /* 定位搜索按钮 */
            background-repeat: no-repeat; /* 图片不重复 */
            width: 100%; /* 全屏幕显示 */
            font-size: 16px; /* 字体大小 */
            padding: 12px 20px 12px 40px; /* 设置内边距 */
            border: 1px solid #ddd; /* 添加灰色边框 */
            margin-bottom: 12px; /* 添加顶部的外边距 */
        }

        #myTable {
            border-collapse: collapse; /* 折叠边框 */
            width: 100%; /* 全屏幕显示 */
            border: 1px solid #ddd; /* 设置灰色边框 */
            font-size: 18px; /* 字体大小 */
        }

        #myTable th, #myTable td {
            text-align: left; /* 文本靠左对齐 */
            padding: 12px; /* 设置内边距 */
        }

        #myTable tr {
            /* 每一行设置底部边框*/
            border-bottom: 1px solid #ddd;
        }

        #myTable tr.header, #myTable tr:hover {
            /* 表格头部设置背景 */
            background-color: #f1f1f1;
        }
    </style>
</head>
<body>
<%--      editModal           --%>
<%--      当前软件信息           --%>
<div class="modal fade" id="editModal" role="dialog" aria-labelledby="myModalLabel2">    
    <div class="modal-dialog" role="document">        
        <div class="modal-content">
            <div class="modal-header">                
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>
                     
                <h4 class="modal-title" id="myModalLabel2">软件信息</h4>            
            </div>
            <%--      当前软件信息           --%>
            <div class="modal-body">                
                <form name="addForm" id="updateForm" method="post">
                    <div class="form-group">
                        <div class="form-group">
                            <label for="edit_id">软件编号:</label>
                            <p id="edit_id"></p>
                            <span class="help-block"></span>
                        </div>
                        <label for="edit_appName">软件名称:</label>
                        <p id="edit_appName"></p>
                        <span class="help-block"></span>
                    </div>
                    <div class="form-group">
                        <label for="edit_APKName">APK名称:</label>
                        <p id="edit_APKName"></p>
                        <span class="help-block"></span>
                    </div>
                    <div class="form-group">
                        <label for="edit_appSize">软件大小:</label>
                        <p id="edit_appSize"></p>
                        <span class="help-block"></span>
                    </div>
                    <div class="form-group">
                        <label for="edit_tai">状态:</label>
                        <p id="edit_tai"></p>
                        <span class="help-block"></span>
                    </div>
                    <div class="form-group">
                        <label for="edit_pintai">所属平台:</label>
                        <p id="edit_pintai"></p>
                        <span class="help-block"></span>
                    </div>
                    <div class="form-group">
                        <label for="edit_kaifaze">开发者:</label>
                        <p id="edit_kaifaze"></p>
                        <span class="help-block"></span>
                    </div>
                    <div class="form-group">
                        <label for="edit_fenLei">分类:</label>
                        <p id="edit_fenLei"></p>
                        <span class="help-block"></span>
                    </div>

                    <div class="form-group">
                        <label for="edit_bbH">版本号:</label>
                        <p id="edit_bbH"></p>
                        <span class="help-block"></span>
                    </div>

                    <div class="form-group">
                        <label for="edit_appDetail">软件简介:</label>
                        <p id="edit_appDetail"></p>
                        <span class="help-block"></span>
                    </div>
                    <div class="form-group">
                        <label for="edit_LuJin">文件路径:</label>
                        <a id="edit_LuJin"></a>
                        <span class="help-block"></span>
                    </div>
                </form>
                       
            </div>
                     
            <div class="modal-footer">                
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                 
            </div>
                   
        </div>
           
    </div>
</div>
<!-- 当前软件的历史信息 -->
<div class="modal fade modal-body" id="histroyModal" role="dialog" aria-labelledby="myModalLabel2">    
    <div class="modal-dialog"
         style="height:900px;width:900px;text-overflow:ellipsis; white-space: nowrap; overflow:hidden;" role="document">
               
        <div class="modal-content">
            <div class="modal-header">                
                <button type="button" class="close searcher-text" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>
                               
                <h4 class="modal-title" id="hisModal">软件历史信息</h4>            
            </div>
            <div class="container table-responsive">
                <table class="table table-striped  table-bordered table-hover table-condensed">
                    <tr>
                        <th>软件名称</th>
                        <th>APK名称</th>
                        <th>软件大小</th>
                        <th>开发者</th>
                        <th>当前状态</th>
                        <th>版本号</th>
                        <th>软件介绍</th>
                        <th>下载路径</th>

                    </tr>
                    <tbody id="his_table">

                    </tbody>
                </table>
                 
            </div>
            <div class="modal-footer">                
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                 
            </div>
                   
        </div>
           
    </div>
</div>

<%out.print(request.getContextPath());%>
<%-- 软件信息列表 --%>
<div style="margin:50px auto">
    <h1 class="col-lg-6" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;软件信息审核列表</h1>
    <div class="col-lg-2 col-lg-offset-3">
        <input type="text" id="myInput" onkeyup="myFunction()" placeholder="搜索...">
    </div>
</div>
<div class="container table-responsive">

    <table id="myTable" style="overflow: scroll;  text-overflow:ellipsis; white-space: nowrap;"
           class="table table-hover table-striped border-collapse table-bordered  table-condensed  table-layout:auto">
        <tr class="header">
            <th>软件编号</th>
            <th>软件名称</th>
            <th>APK名称</th>
            <th>软件大小</th>
            <th>开发者</th>
            <th>所属分类</th>
            <th>所属平台</th>
            <th>当前状态</th>
            <th>下载次数</th>
            <th>版本号</th>
            <th>软件介绍</th>
            <th>操作</th>
        </tr>
        <tbody id="rj_table" style="overflow: scroll;white-space: nowrap;">

        </tbody>
    </table>

</div>
<div class="row">
    <div id="page_pageInfo" class="col-lg-6">

    </div>
    <nav class="col-lg-offset-8" aria-label="Page navigation">
        <ul class="pagination">

        </ul>
    </nav>
</div>

<script type="text/javascript" src="${APP_PATH}/dist/js/jquery-1.12.4.js"></script>
<%-- bootstrap的插件是依赖于 jquery实现的  --%>
<script type="text/javascript" src="${APP_PATH}/dist/js/bootstrap.min.js"></script>
<script type="text/javascript">
    $(function () {
        getPageNums(1)
    })
    //获取 json 数据
    function getPageNums(pn) {

        $.ajax({
            url: "${APP_PATH}/list",
            data: "pageNum=" + pn,
            type: "GET",
            success: function (data) {
                console.log(data);
                build_rj_table(data)
                page_pageInfo_(data)
                buid_RJlist(data)
            }
        })
    }
    //构建软件信息列表
    function build_rj_table(data) {
        //清空历史数据
        $("#rj_table").empty();
        //获取分页信息
        var rj = data.returnData.pageInfo.list;
        console.log(rj)

        $.each(rj, function (index, item) {
            //构建 td 存放数据
            var id_td = $("<td></td>").append(item.id);
            var appName_td = $("<td></td>").append(item.appName);
            var APKName_td = $("<td></td>").append(item.apkname);
            var appSize_td = $("<td></td>").append(item.appSize + " MB");
            var pintai_td = $("<td></td>").append(item.pintai.pintai);
            var fenLei_td = $("<td></td>").append(item.fenLei1.leixinName + "-" + item.fenLei2.leixinName + "-" + item.fenLei3.leixinName);
            var zhuantai_td = $("<td></td>").append(item.zhuanTai.tai);
            var kaifaze_td = $("<td></td>").append(item.user.userName);
            var xzCS_td = $("<td></td>").append(item.xzCS);
            var bbH_td = $("<td></td>").append(item.bbH);
            var appDetail_td = $("<td></td>").append(item.appDetail);
            var LuJin_td = $("<td></td>").append(item.luJin)

            //操作列的td
            //查看软件信息
            var eyes_btn = $("<button></button>").addClass("btn btn-sm btn-primary eyes_btn").attr("data-id", item.id).attr("data-pn", data.returnData.pageInfo.pageNum)
                .append($("<span></span>").addClass("glyphicon glyphicon-tasks")).append("&nbsp;  查看")
            var his_btn = $("<button></button>").addClass("btn btn-sm btn-primary his_btn").attr("data-id", item.id).attr("data-pn", data.returnData.pageInfo.pageNum)
                .append($("<span></span>").addClass("glyphicon glyphicon-tasks")).append("&nbsp;  查看历史信息")

            //审核通过按钮
            var edit_btn = $("<button></button>").addClass("btn btn-sm btn-primary edit_btn").attr("data-id", item.id).attr("data-pn", data.returnData.pageInfo.pageNum)
                .append($("<span></span>").addClass("glyphicon glyphicon-ok")).append("&nbsp;  通过")
            //审核  不通过按钮
            var del_btn = $("<button></button>").addClass("btn btn-sm btn-danger del_btn").attr("data-id", item.id).attr("data-pn", data.returnData.pageInfo.pageNum)
                .append($("<span></span>").addClass("glyphicon glyphicon-remove")).append("&nbsp;不通过")
            //将操作按钮放入操作的td列
            var ac = $("<td></td>").append(eyes_btn).append(edit_btn).append(del_btn).append(his_btn)

            if (item.zhuanTai.tai == "审核通过") {
                del_btn.prop('disabled', true);
                edit_btn.prop('disabled', true);
            }
            if (item.zhuanTai.tai == "审核未通过") {
                del_btn.prop('disabled', true);
                edit_btn.prop('disabled', true);
            }

            //将4个td 放入一个tr里
            var tr = $("<tr></tr>")
                .append(id_td)
                .append(appName_td)
                .append(APKName_td)
                .append(appSize_td)
                .append(kaifaze_td)
                .append(fenLei_td)
                .append(pintai_td)
                .append(zhuantai_td)
                .append(xzCS_td)
                .append(bbH_td)
                .append(appDetail_td)
                .append(ac);
            //将tr添加至tbody
            tr.appendTo($("#rj_table"))
        })
    }
    //分页信息
    function page_pageInfo_(data) {
        $("#page_pageInfo").empty();
        var rjPageInfo = data.returnData.pageInfo;
        // 当前是第<span class="current-page"></span> 页   /   ，共 <span  class="total"> </span> 条信息
        $("#page_pageInfo").append("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;当前是第 " + rjPageInfo.pageNum + " 页   " + rjPageInfo.pageNum + "/" + rjPageInfo.pages + " 页    共 " + rjPageInfo.total + "条信息");

    }
    // 页码
    function buid_RJlist(data) {
        $(".pagination").empty();
        //获取分页信息
        var rjPageInfo = data.returnData.pageInfo;

        var ul = $(".pagination");

        var firstLi = creatLi("首页");
        var previousLi = creatLi("&laquo;");

        if (!rjPageInfo.hasPreviousPage) {
            firstLi.addClass("disabled");
            previousLi.addClass("disabled");
        } else {
            creatClick(firstLi, 1);
            creatClick(previousLi, rjPageInfo.pageNum - 1);
        }

        ul.append(firstLi);
        ul.append(previousLi);

        //当前页
        $.each(rjPageInfo.navigatepageNums, function (index, item) {
            var labeLi = creatLi(item);
            creatClick(labeLi, item);
            if (item == rjPageInfo.pageNum) {
                labeLi.addClass("active")
            }
            ul.append(labeLi);
        })

        var nextLi = creatLi("&raquo;");
        var lastLi = creatLi("尾页");

        if (!rjPageInfo.hasNextPage) {

            nextLi.addClass("disabled");
            lastLi.addClass("disabled");

        } else {
            creatClick(nextLi, rjPageInfo.pageNum + 1);
            creatClick(lastLi, rjPageInfo.pages);
        }

        ul.append(nextLi);
        ul.append(lastLi);

    }
    //生成 li
    function creatLi(str) {

        return $("<li></li>").append($("<a></a>").attr("herf", "#").append(str));
    }
    //生成 li点击事件
    function creatClick(obj, pn) {
        obj.click(function () {
            getPageNums(pn)
        })
    }
    //修改软件状态为通过
    $(document).on("click", ".edit_btn", function () {
        //保存当前页码
        var p = $(this).attr("data-pn");

        //根据 ID 查询图书信息
        $.ajax({
            url: "${APP_PATH}/ruanjian/" + $(this).attr("data-id"),
            type: "GET",
            success: function (data) {
                if (data.code == 200) {

                    alert("审核通过")
                    getPageNums(p)
                } else if (data.code == 100) {

                    alert("系统错误，请重新审核")
                    getPageNums(p)
                } else {
                    console.log(data)
                    alert("系统错误，请重新审核")
                }

            }

        })
    })
    //修改软件状态为  不通过
    $(document).on("click", ".del_btn", function () {
        //保存当前页码
        var p = $(this).attr("data-pn");
        //根据 ID 查询图书信息
        $.ajax({
            url: "${APP_PATH}/rj/" + $(this).attr("data-id"),
            type: "GET",
            success: function (data) {
                if (data.code == 200) {

                    alert("审核通过")
                    getPageNums(p)
                } else if (data.code == 100) {
                    alert("系统错误，请重新审核")
                    getPageNums(p)
                } else {
                    console.log(data)
                    alert("系统错误，请重新审核")
                }
            }

        })
    })
    //根据 id 查看软件信息
    $(document).on("click", ".eyes_btn", function () {
        //保存当前页码
        $("#pn").val($(this).attr("data-pn"));

        $("#editModal").modal({
            backdrop: "static",
            show: true
        })

        //根据 ID 查询图书信息
        $.ajax({
            url: "${APP_PATH}/ruanJ/" + $(this).attr("data-id"),
            method: "GET",
            success: function (data) {
                console.log(data);
                var rj = data.returnData.ruanJian;//后端将数据放进了Model，然后前端从中获取数据;

                console.log(rj);
                $("#edit_id").text(rj.id);
                $("#edit_appName").text(rj.appName);
                $("#edit_APKName").text(rj.apkname);
                $("#edit_appSize").text(rj.appSize + " MB");
                $("#edit_pintai").text(rj.pintai.pintai);
                $("#edit_fenLei").text(rj.fenLei1.leixinName + "-" + rj.fenLei2.leixinName + "-" + rj.fenLei3.leixinName);
                $("#edit_tai").text(rj.zhuanTai.tai);
                $("#edit_kaifaze").text(rj.user.userName);
                $("#edit_xzCS").text(rj.xzCS);
                $("#edit_bbH").text(rj.bbH);
                $("#edit_appDetail").text(rj.appDetail).addClass("max-width: 150px;overflow: scroll; text-overflow:ellipsis;white-space: nowrap;");
                $("#edit_LuJin").text(rj.luJin).addClass("max-width: 150px;overflow: scroll; text-overflow:ellipsis;white-space: nowrap;");

            }

        })
    })
    //软件历史信息
    $(document).on("click", ".his_btn", function () {
        $("#histroyModal").modal({
            backdrop: "static",
            show: true
        })

        //根据 ID 查询相对应的软件历史信息
        $.ajax({
            url: "${APP_PATH}/histry/" + $(this).attr("data-id"),
            method: "GET",
            success: function (data) {
                console.log(data);
                var hisrj = data.returnData.histroryRJS;
                console.log(hisrj)
                $.each(hisrj, function (index, item) {
                    //构建 td 存放数据
                    var hisappName_td = $("<td></td>").append(item.appName);
                    var hisAPKName_td = $("<td></td>").append(item.apkname);
                    var hisappSize_td = $("<td></td>").append(item.appSize + " MB");
                    var hiszhuantai_td = $("<td></td>").append(item.zhuanTai2.tai2);
                    var hiskaifaze_td = $("<td></td>").append(item.user.userName);
                    var hisbbH_td = $("<td></td>").append(item.bbH);
                    var hisappDetail_td = $("<td></td>").append(item.appDetail);
                    var hisLuJin_td = $("<td></td>").append($("<button></butten>").append($("<a></a>").attr("herf", "#").append(item.luJin))).addClass("overflow: scroll; text-overflow:ellipsis;white-space: nowrap;");

                    //将4个td 放入一个tr里
                    var tr = $("<tr></tr>")
                        .append(hisappName_td)
                        .append(hisAPKName_td)
                        .append(hisappSize_td)
                        .append(hiskaifaze_td)
                        .append(hiszhuantai_td)
                        .append(hisbbH_td)
                        .append(hisappDetail_td)
                        .append(hisLuJin_td)

                    //将tr添加至tbody
                    tr.appendTo($("#his_table"))
                })
            }
        })
    })
    // 搜索
    function myFunction() {
        // 声明变量
        var input, filter, table, tr, td, i;
        input = document.getElementById("myInput");
        filter = input.value.toUpperCase();
        table = document.getElementById("myTable");
        tr = table.getElementsByTagName("tr");

        // 循环表格每一行，查找匹配项
        for (i = 0; i < tr.length; i++) {
            //只能搜索当前页面显示的内容
            td = tr[i].getElementsByTagName("td")[1];
            if (td) {
                if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
                    tr[i].style.display = "";
                } else {
                    tr[i].style.display = "none";
                }
            }
        }
    }
</script>
</body>
</html>
