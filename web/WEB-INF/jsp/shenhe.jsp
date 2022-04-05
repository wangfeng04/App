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
        .table tbody tr td{
            overflow: hidden;
            text-overflow:ellipsis;
            white-space: nowrap;

        }

    </style>
</head>
<body>
<!-- editModal -->
<div class="modal fade" id="editModal" role="dialog" aria-labelledby="myModalLabel2">    
    <div class="modal-dialog" role="document">        
        <div class="modal-content">
            <div class="modal-header">                
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>               
                <h4 class="modal-title" id="myModalLabel2">软件信息</h4>            
            </div>    
            <div class="container table-responsive">
                    <table style="overflow: hidden;  text-overflow:ellipsis; white-space: nowrap;" class=" table table-hover table-striped border-collapse table-bordered  table-condensed  table-layout:auto">
                    <tr style="overflow: hidden;  text-overflow:ellipsis; white-space: nowrap;" >
                        <th style="overflow: hidden;  text-overflow:ellipsis; white-space: nowrap;">软件名称</th>
                        <th style="overflow: hidden;  text-overflow:ellipsis; white-space: nowrap;">APK名称</th>
                        <th style="overflow: hidden;  text-overflow:ellipsis; white-space: nowrap;">软件大小</th>
                        <th style="overflow: hidden;  text-overflow:ellipsis; white-space: nowrap;">当前状态</th>
                        <th style="overflow: hidden;  text-overflow:ellipsis; white-space: nowrap;">下载次数</th>
                        <th style="overflow: hidden;  text-overflow:ellipsis; white-space: nowrap;">版本号</th>
                        <th style="overflow: hidden;  text-overflow:ellipsis; white-space: nowrap;">软件介绍</th>

                    </tr>
                    <tbody id="hisrj_table" style="overflow: hidden;  text-overflow:ellipsis; white-space: nowrap;" >

                    </tbody>
                </table> 
            </div>     
            <div class="modal-body">                
                <form name="addForm" id="updateForm" method="post">
                    <div class="form-group">
                        <label for="edit_appName">软件名称:</label>
                        <input type="text" class="form-control" name="appName" id="edit_appName" placeholder="软件名称">
                        <span class="help-block"></span>
                    </div>
                    <div class="form-group">
                        <label for="edit_APKName">APK名称:</label>
                        <input type="text" class="form-control" name="APKName" id="edit_APKName" placeholder="APK名称">
                        <span class="help-block"></span>
                    </div>
                    <div class="form-group">
                        <label for="edit_appSize">软件大小:</label>
                        <input type="text" class="form-control" name="bookCounts" id="edit_appSize" placeholder="软件大小">
                        <span class="help-block"></span>
                    </div>
                    <div class="form-group">
                        <label for="edit_tai">状态:</label>
                        <input type="text" class="form-control" name="tai" id="edit_tai" placeholder="状态">
                        <span class="help-block"></span>
                    </div>
                    <div class="form-group">
                        <label for="edit_pintai">所属平台:</label>
                        <input type="text" class="form-control" name="pintai" id="edit_pintai" placeholder="所属平台">
                        <span class="help-block"></span>
                    </div>
                    <div class="form-group">
                        <label for="edit_kaifaze">开发者:</label>
                        <input type="text" class="form-control" name="onefenLei" id="edit_kaifaze" placeholder="下载次数">
                        <span class="help-block"></span>
                    </div>
                    <div class="form-group">
                        <label for="edit_fenLei">分类:</label>
                        <input type="text" class="form-control" name="onefenLei" id="edit_fenLei" placeholder="下载次数">
                        <span class="help-block"></span>
                    </div>

                    <div class="form-group">
                        <label for="edit_bbH">版本号:</label>
                        <input type="text" class="form-control" name="bbH" id="edit_bbH" placeholder="版本号">
                        <span class="help-block"></span>
                    </div>

                    <div class="form-group">
                        <label for="edit_appDetail">软件简介:</label>
                        <input type="text" class="form-control" name="appDetail" id="edit_appDetail" placeholder="软件简介">
                        <span class="help-block"></span>
                    </div>
                    <div class="form-group">
                        <label for="edit_LuJin">文件上传:</label>
                        <input type="text" class="form-control" name="LuJin" id="edit_LuJin" placeholder="文件上传">
                        <span class="help-block"></span>
                    </div>
                </form>        
            </div>          
            <div class="modal-footer">                
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>                
                <button type="button" class="btn btn-primary" id="updateSubmit">更新</button>            
            </div>        
        </div>    
    </div>
</div>






<div class="dropdown">
    <a id="dLabel"  data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
     <h3 class="clear"  class="col-lg-5"> 分类</h3>
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
        三级分类
        <span class="caret"></span>
    </a>

    <ul class="dropdown-menu" aria-labelledby="dLabel">

    </ul>

</div>


<%out.print(request.getContextPath());%>

<div><h1 class="col-lg-6">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;软件信息审核列表</h1></div>
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
            //查看软件信息
            var eyes_btn = $("<button></button>").addClass("btn btn-sm btn-primary eyes_btn").attr("data-id",item.id).attr("data-pn",data.returnData.pageInfo.pageNum)
                .append($("<span></span>").addClass("glyphicon glyphicon-tasks")).append("&nbsp;  查看")

            //审核通过按钮
            var edit_btn = $("<button></button>").addClass("btn btn-sm btn-primary edit_btn").attr("data-id",item.id).attr("zt",2).attr("data-pn",data.returnData.pageInfo.pageNum)
                .append($("<span></span>").addClass("glyphicon glyphicon-ok")).append("&nbsp;  通过")
            //审核  不通过按钮
            var del_btn = $("<button></button>").addClass("btn btn-sm btn-danger del_btn").attr("data-id",item.id).attr("zt",3).attr("data-pn",data.returnData.pageInfo.pageNum)
                .append($("<span></span>").addClass("glyphicon glyphicon-remove")).append("&nbsp;不通过")
            //将操作按钮放入操作的td列
            var ac =$("<td></td>").append(eyes_btn).append(edit_btn).append(del_btn)

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


    //修改软件状态为通过
    $(document).on("click",".edit_btn",function () {
        //保存当前页码
       var p=$(this).attr("data-pn");

        //根据 ID 查询图书信息
        $.ajax({
            url:"${APP_PATH}/rj",
            method: "POST",
            data: { // 提交数据
                "id": $(this).attr("data-id"), // 前者为字段名，后者为数据
                "zhuan":$(this).attr("zt")
            },
            success:function (data) {
                console.log(data)
                alert("审核通过")
                getPageNums(p)
            }

        })
    })
    //修改软件状态为  不通过
    $(document).on("click",".del_btn",function () {
        //保存当前页码
        var p=$(this).attr("data-pn");
        //根据 ID 查询图书信息
        $.ajax({
            url:"${APP_PATH}/rj",
            method: "POST",
            data: { // 提交数据
                "id": $(this).attr("data-id"), // 前者为字段名，后者为数据
                "zhuan":$(this).attr("zt")
            },
            success:function (data) {
                console.log(data)
                alert("审核未通过")
                getPageNums(p)
            }

        })
    })

    //根据 id 查看软件信息
    $(document).on("click",".eyes_btn",function () {
        //保存当前页码
        $("#pn").val($(this).attr("data-pn"));

        $("#editModal").modal({
            backdrop: "static",
            show:true
        })

        //根据 ID 查询图书信息
        $.ajax({
            url:"${APP_PATH}/ruanJ/"+$(this).attr("data-id"),
            method: "post",
            success:function (data) {
                console.log(data)
                var rj=data.returnData.ruanJian;
                $("#edit_appName").val(rj.appName);
                $("#edit_APKName").val(rj.apkname);
                $("#edit_appSize").val(rj.appSize+" MB");
                $("#edit_pintai").val(rj.pintai.pintai);
                $("#edit_detail").val(rj.fenLei1.leixinName+"-"+rj.fenLei2.leixinName+"-"+rj.fenLei3.leixinName);
                $("#edit_tai").val(rj.zhuanTai.tai);
                $("#edit_kaifaze").val(rj.user.userName);
                $("#edit_xzCS").val(rj.xzCS);
                $("#edit_bbH").val(rj.bbH);
                $("#edit_appDetail").val(rj.appDetail);
                $("#edit_LuJin").val(rj.luJin);
                build_hisrj_table(data)
            }

        })
    })
    function build_hisrj_table(data) {
        //清空历史数据
        $("#rj_table").empty();
        //获取分页信息
        var hisrj=data.returnData.histroryRJS;
        console.log(hisrj)

        $.each(hisrj,function (index,item) {
            //构建 td 存放数据
            var hisappName_td = $("<td></td>").append(item.appName);
            var hisAPKName_td = $("<td></td>").append(item.apkname);
            var hisappSize_td = $("<td></td>").append(item.appSize+" MB");
            var hispintai_td = $("<td></td>").append(item.pintai.pintai);
            var hisfenLei_td = $("<td></td>").append(item.fenLei1.leixinName+"-"+item.fenLei2.leixinName+"-"+item.fenLei3.leixinName);
            var hiszhuantai_td =$("<td></td>").append(item.zhuanTai.tai);
            var hiskaifaze_td = $("<td></td>").append(item.user.userName);
            var hisbbH_td = $("<td></td>").append(item.bbH);
            var hisappDetail_td = $("<td></td>").append(item.appDetail);
            var hisLuJin_td= $("<td></td>").append($("<a></a>").attr("herf",item.luJin).append(item.luJin));

            //将4个td 放入一个tr里
            var tr = $("<tr></tr>")
                .append(hisappName_td)
                .append(hisAPKName_td)
                .append(hisappSize_td)
                .append(hiskaifaze_td)
                .append(hisfenLei_td)
                .append(hispintai_td)
                .append(hiszhuantai_td)
                .append(xzCS_td)
                .append(hisbbH_td)
                .append(hisappDetail_td)
                .append(hisLuJin_td).addClass()

            //将tr添加至tbody
            tr.appendTo($("#hisrj_table"))
        })
    }






</script>
</body>
</html>
