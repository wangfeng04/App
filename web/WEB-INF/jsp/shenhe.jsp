<%--
  Created by IntelliJ IDEA.
  User: s'j'w
  Date: 2022/3/11
  Time: 15:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<% pageContext.setAttribute("APP_PATH",request.getContextPath()); %>
<html>
<head>
    <title>后台软件审核列表</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link type="text/css"  rel="styleSheet" href="http://localhost:8080/ssm/dist/css/bootstrap.css"/>
    <style type="text/css">
        table tbody tr td{
            overflow: hidden;
            text-overflow:ellipsis;
            white-space: nowrap;

        }
        h1{
            position:relative;
        }
    </style>
</head>
<body>

<div class="dropdown">
    <a id="dLabel" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
     <h3 class="clear"> 分类</h3>
        <span class="caret"></span>
    </a>
    <a id="d1Label" data-target="#" href="http://example.com/" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
         一级分类
        <span class="caret"></span>
    </a>

    <ul class="dropdown-menu" aria-labelledby="dLabel">

    </ul>
    <a id="d2Label" data-target="#" href="http://example.com/" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
        二级分类
        <span class="caret"></span>
    </a>

    <ul class="dropdown-menu" aria-labelledby="dLabel">

    </ul>
    <a id="d3Label" data-target="#" href="http://example.com/" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
        <h3 class="clear:none"> 三级分类</h3>
        <span class="caret"></span>
    </a>

    <ul class="dropdown-menu" aria-labelledby="dLabel">

    </ul>

</div>


<%out.print(request.getContextPath());%>

<div><h1 class="col-lg-6">软件信息审核列表</h1></div>
<div class="container table-responsive">

 <table class="table table-hover table-striped border-collapse table-bordered  table-condensed  table-layout:auto">
        <tr>
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
        <tbody id="rj_table" >

        </tbody>
    </table>
    <div class="row">
        <div id="page_pageInfo" class="col-lg-6">

        </div>
        <nav aria-label="Page navigation">
            <ul class="pagination">

            </ul>
        </nav>
    </div>
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
            url:"${APP_PATH}/list",
            data:"pageNum="+pn,
            type:"GET",
            success:function (data) {
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
        var rj= data.returnData.pageInfo.list;
        console.log(rj)

        $.each(rj,function (index,item) {
            //构建 td 存放数据
            var id_td = $("<td></td>").append(item.id);
            var appName_td = $("<td></td>").append(item.appName);
            var APKName_td = $("<td></td>").append(item.apkname);
            var appSize_td = $("<td></td>").append(item.appSize+" MB");
            var pintai_td = $("<td></td>").append(item.pintai.pintai);
            var fenLei_td = $("<td></td>").append(item.fenLei1.leixinName+"-"+item.fenLei2.leixinName+"-"+item.fenLei3.leixinName);
            var zhuantai_td =$("<td></td>").append(item.zhuanTai.tai);
            var kaifaze_td = $("<td></td>").append(item.user.userName);
            var xzCS_td = $("<td></td>").append(item.xzCS);
            var bbH_td = $("<td></td>").append(item.bbH);
            var appDetail_td = $("<td></td>").append(item.appDetail);
            var LuJin_td= $("<td></td>").append(item.luJin);

            //操作列的td
            //编辑按钮
            var edit_btn = $("<button></button>").addClass("btn btn-sm btn-primary edit_btn").attr("data-id",item.id).attr("data-pn",data.returnData.pageInfo.pageNum)
                .append($("<span></span>").addClass("glyphicon glyphicon-ok")).append("&nbsp;  通过")
            //删除按钮
            var del_btn = $("<button></button>").addClass("btn btn-sm btn-danger del_btn").attr("data-id",item.id).attr("data-pn",data.returnData.pageInfo.pageNum)
                .append($("<span></span>").addClass("glyphicon glyphicon-remove")).append("&nbsp;不通过")
            //将操作按钮放入操作的td列
            var ac =$("<td></td>").append(edit_btn).append(del_btn)

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
        $("#page_pageInfo").append("当前是第 "+rjPageInfo.pageNum+" 页   "+rjPageInfo.pageNum+"/"+rjPageInfo.pages+" 页    共 "+rjPageInfo.total+"条信息");

    }

    // 页码
    function buid_RJlist(data) {
        $(".pagination").empty();
        //获取分页信息
        var rjPageInfo = data.returnData.pageInfo;

        var  ul=$(".pagination");

        var firstLi = creatLi("首页");
        var previousLi = creatLi("&laquo;");

        if(!rjPageInfo.hasPreviousPage){
            firstLi.addClass("disabled");
            previousLi.addClass("disabled");
        }else {
            creatClick(firstLi,1);
            creatClick(previousLi,rjPageInfo.pageNum -1);
        }

        ul.append(firstLi);
        ul.append(previousLi);

        //当前页
        $.each(rjPageInfo.navigatepageNums,function (index,item) {
            var  labeLi=creatLi(item);
            creatClick(labeLi,item);
            if(item == rjPageInfo.pageNum){
                labeLi.addClass("active")
            }
            ul.append(labeLi);
        })

        var nextLi = creatLi("&raquo;");
        var lastLi = creatLi("尾页");

        if(!rjPageInfo.hasNextPage){

            nextLi.addClass("disabled");
            lastLi.addClass("disabled");

        }else {
            creatClick(nextLi,rjPageInfo.pageNum +1);
            creatClick(lastLi,rjPageInfo.pages);
        }

        ul.append(nextLi);
        ul.append(lastLi);

    }

    //生成 li
    function creatLi(str) {

        return  $("<li></li>").append($("<a></a>").attr("herf","#").append(str));
    }
    //生成 li点击事件
    function creatClick(obj,pn) {
        obj.click(function () {
            getPageNums(pn)
        })
    }






</script>
</body>
</html>
