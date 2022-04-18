<%--
  Created by IntelliJ IDEA.
  User: s'j'w
  Date: 2022/3/24
  Time: 16:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page import="cn.sjw.pojo.User" %>
<% pageContext.setAttribute("APP_PATH", request.getContextPath()); %>
<html>
<head>
    <title>软件信息列表</title>
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

    </style>
</head>
<body>
<%
User user= (User) session.getAttribute("user");
%>
<%-- 添加软件  addModal --%>
<div class="modal fade" id="addModal" role="dialog" aria-labelledby="myModalLabel">    
    <div class="modal-dialog" role="document">        
        <div class="modal-content">            
            <div class="modal-header">                
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">添加软件</h4>            
            </div>
            <div class="modal-body">                
                <form name="addForm" id="addForm" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="appName">软件名称:</label>
                        <input type="text" class="form-control" name="appName" id="appName" placeholder="软件名称">
                        <span class="help-block"></span>
                    </div>
                    <div class="form-group">
                        <label for="APKName">APK名称:</label>
                        <input type="text" class="form-control" name="APKName" id="APKName" placeholder="APK名称">
                        <span class="help-block"></span>
                    </div>
                    <div class="form-group">
                        <label for="appSize">软件大小:</label>
                        <input type="text" class="form-control" name="appSize" id="appSize" placeholder="软件大小">
                        <span class="help-block"></span>
                    </div>
<div class="form-group" id="pintai">
        <label>所属平台:</label>
        <label class="radio-inline">
        <input type="radio" name="pintai"  id="inlineRadio1" value="1"> 手机
        </label>
        <label class="radio-inline"><input type="radio" name="pintai" id="inlineRadio2" value="2"> 平板
         </label>
         <label class="radio-inline">
         <input type="radio" name="pintai" id="inlineRadio3" value="3"> 通用
         </label>
 </div>
<div class="form-group" id="onefenLei">
         <label>一级分类:</label>
         <label class="radio-inline">
         <input type="radio" name="onefenLei"  id="onefenLei1" value="1"> 游戏
         </label>
         <label class="radio-inline">
         <input type="radio" name="onefenLei" id="onefenLei2" value="2"> 应用
         </label>
 </div>
<div class="form-group" id="twofenlei">
       <label>二级分类:</label>
       <label class="radio-inline">
       <input type="radio" name="twofenlei"  id="twofenlei1" value="1"> 角色扮演
       </label>
       <label class="radio-inline">
       <input type="radio" name="twofenlei" id="twofenlei2" value="2"> 休闲益智
       </label>
       <label class="radio-inline">
       <input type="radio" name="twofenlei" id="twofenlei3" value="3"> 棋牌游戏
       </label>
    <br/>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;
    <label class="radio-inline">
       <input type="radio" name="twofenlei"  id="twofenlei4" value="4"> 系统工具
       </label>
       <label class="radio-inline">
       <input type="radio" name="twofenlei" id="twofenlei5" value="5"> 拍摄美化
       </label>
       <label class="radio-inline">
       <input type="radio" name="twofenlei" id="twofenlei6" value="6"> 网上购物
       </label>
 </div>
<div class="form-group" id="threefenli">
         <label>三级分类:</label>
         <label class="radio-inline">
             <input type="radio" name="threefenli"  id="threefenli1" value="1"> 动作
         </label>
         <label class="radio-inline">
             <input type="radio" name="threefenli" id="threefenli2" value="2"> 冒险
         </label>
    <br/>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;
         <label class="radio-inline">
             <input type="radio" name="threefenli" id="threefenli3" value="3"> 消除
         </label>
         <label  class="radio-inline">
             <input type="radio" name="threefenli"  id="threefenli4" value="4"> 休闲
         </label>
    <br/>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;
         <label class="radio-inline">
             <input type="radio" name="threefenli" id="threefenli5" value="5"> 斗地主
         </label>
         <label  class="radio-inline">
         <input type="radio" name="threefenli" id="threefenli6" value="6"> 麻将
         </label>
    <br/>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;
         <label class="radio-inline">
             <input type="radio" name="threefenli"  id="threefenli7" value="7"> 浏览器
         </label>
         <label  class="radio-inline">
             <input type="radio" name="threefenli" id="threefenli8" value="8"> 输入法
         </label>
    <br/>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;
         <label class="radio-inline">
             <input type="radio" name="threefenli" id="threefenli9" value="9"> 相机
         </label >
         <label  class="radio-inline">
             <input type="radio" name="threefenli"  id="threefenli10" value="10"> 拍视频
         </label>
    <br/>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;
         <label class="radio-inline">
             <input type="radio" name="threefenli" id="threefenli11" value="11"> 商城
         </label>
         <label  class="radio-inline">
               <input type="radio" name="threefenli" id="threefenli12" value="12"> 快递
         </label>
</div>
                    <div class="form-group">
                        <label for="bbH">版本号:</label>
                        <input type="text" class="form-control" name="bbH" id="bbH" placeholder="版本号">
                        <span class="help-block"></span>
                    </div>

                    <div class="form-group">
                        <label for="appDetail">软件简介:</label>
                        <input type="text" class="form-control" name="appDetail" id="appDetail" placeholder="软件简介">
                        <span class="help-block"></span>
                    </div>
                    <div class="form-group">
                        <label for="LuJin">文件上传:</label>
                        <input type="file"  name="file" id="LuJin">
                    </div>
                </form>
                       
            </div>
                       
            <div class="modal-footer">                
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                               
                <button type="button" class="btn btn-primary" id="addSubmit">添加</button>
                           
            </div>
                   
        </div>
           
    </div>
</div>

<!--修改软件信息 updateModal -->
<div class="modal fade" id="updateModal" role="dialog" aria-labelledby="myModalLabel2">    
    <div class="modal-dialog" role="document">        
        <div class="modal-content">
            <div class="modal-header">                
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>
                               
                <h4 class="modal-title" id="myModalLabel3">修改软件信息</h4>            
            </div>
                       
            <div class="modal-body">                
                <form name="addForm" id="update_Form" enctype="multipart/form-data"  method="post">
                    <div class="form-group">
                        <label for="update_id">软件编号:</label>
                        <p id="update_id" name="id"></p>
                         <span class="help-block"></span>
                    </div>
                    <div class="form-group">
                        <label for="appName">软件名称:</label>
                        <input type="text" class="form-control" name="appName" id="update_appName" placeholder="软件名称">
                        <span class="help-block"></span>
                    </div>
                    <div class="form-group">
                        <label for="APKName">APK名称:</label>
                        <input type="text" class="form-control" name="APKName" id="update_APKName" placeholder="APK名称">
                        <span class="help-block"></span>
                    </div>
                    <div class="form-group">
                        <label for="update_appSize">软件大小:</label>
                        <input type="text" class="form-control" name="appSize" id="update_appSize"
                               placeholder="软件大小">
                        <span class="help-block"></span>
                    </div>
                    <div class="form-group">
                        <label for="bbH">版本号:</label>
                        <input type="text" class="form-control" name="bbH" id="update_bbH" placeholder="版本号">
                        <span class="help-block"></span>
                    </div>
                    <div class="form-group">
                        <label for="appDetail">软件简介:</label>
                        <input type="text" class="form-control" name="appDetail" id="update_appDetail" placeholder="软件简介">
                        <span class="help-block"></span>
                    </div>
                    <div class="form-group">
                        <label for="LuJin">文件上传:</label>
                        <input type="file"  name="updatefile" id="update_LuJin">
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

<%--      editModal           --%>
<%--      当前软件信息           --%>
<div class="modal fade" id="editModal" role="dialog" aria-labelledby="myModalLabel2">    
    <div class="modal-dialog" style="height:900px;width:900px;text-overflow:ellipsis; white-space: nowrap; overflow:hidden;"  role="document">        
        <div class="modal-content">
            <div class="modal-header">                
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>     
                <h4 class="modal-title" id="myModalLabel2">软件信息</h4>            
            </div>
            <%--      当前软件信息           --%>
            <div class="modal-body center-block">                
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
    <div class="modal-dialog" style="height:900px;width:900px;text-overflow:ellipsis; white-space: nowrap; overflow:hidden;" role="document">        
        <div class="modal-content">
            <div class="modal-header">                
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>
                               
                <h4 class="modal-title" id="hisModal">软件历史信息</h4>            
            </div>
            <div class="container center-block table-responsive">
                <table   class="center-block table table-striped  table-bordered table-hover table-condensed">
                    <tr >
                        <th>软件名称</th>
                        <th>APK名称</th>
                        <th>软件大小</th>
                        <th>开发者</th>
                        <th>当前状态</th>
                        <th>版本号</th>
                        <th>软件介绍</th>
                        <th>操作</th>

                    </tr>
                    <tbody id="his_table" >

                    </tbody>
                </table>
                 
            </div>
            <div class="modal-footer">                
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                 
            </div>
                   
        </div>
           
    </div>
</div>

<%-- 软件信息列表 --%>
<div><h1 class="col-lg-6">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;软件信息列表</h1>
    <div class="col-lg-2 col-lg-offset-4">
        <button class="btn btn-primary" id="addBtn">
            <span class="glyphicon glyphicon-plus">添加软件</span>
        </button>
    </div>
</div>
<div class="container center-block table-responsive">

    <table style="overflow: scroll;  text-overflow:ellipsis; white-space: nowrap;"  class="center-block  table table-hover table-striped border-collapse table-bordered  table-condensed  table-layout:auto">
        <tr>
            <th style="overflow:hidden;white-space: nowrap;">软件编号</th>
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
            url: "${APP_PATH}/hstry",
            data: "pageNum="+pn,
            type: "GET",
            success: function (data) {
                console.log(data);
                build_rj_table(data)
                page_pageInfo_(data)
                buid_RJlist(data)

            }
        })
    }
    //   验证效果
    function yanZhengXiaoGuo(meth, error, string) {
        if (error == "error") {
            meth.parent().removeClass("has-error success-error sr-only");
            meth.parent().addClass("has-error");
            meth.next("span").text(string);
        }
        if (error == "success") {
            meth.parent().removeClass("has-error success-error sr-only");
            meth.parent().addClass("has-success ");
            meth.next("span").text(string);
        }
    }
    //修改验证样式
    function updateYanZheng() {
        var regBookName = /^[\w\d_\+\.]+$/;
        var str1= "英文数字下划线,加号及点组合，不能有特殊字符！";
        var nonull=/^[\s\S]*$/;
        var str2="该项不能为空！"
        var Regdetai = /^[A-Za-z0-9_\u2E80-\u9FFF]{5,100}$/;
        var str3="描述太短不能少于5个字！";

        //修改软件信息时
        var update_appNameVal = $("#update_appName").val();
        if (!nonull.test(update_appNameVal)) {
            yanZhengXiaoGuo($("#update_appName"), "error",str2)
            return false;
        } else {
            yanZhengXiaoGuo($("#update_appName"), "success", "√")
        }

        var update_APKNameVal = $("#update_APKName").val();
        if (!regBookName.test(update_APKNameVal)) {
            yanZhengXiaoGuo($("#update_APKName"), "error",str1)
            return false;
        } else {
            yanZhengXiaoGuo($("#update_APKName"), "success", "√")
        }

        var update_appSizeVal = $("#update_appSize").val();
        if (!nonull.test(update_appSizeVal)) {
            yanZhengXiaoGuo($("#update_appSize"), "error",str2)
            return false;
        } else {
            yanZhengXiaoGuo($("#update_appSize"), "success", "√")
        }

        var update_bbHVal = $("#update_bbH").val();
        if (!nonull.test(update_bbHVal)) {
            yanZhengXiaoGuo($("#update_bbH"), "error",str2)
            return false;
        } else {
            yanZhengXiaoGuo($("#update_bbH"), "success", "√")
        }
        var update_appDetailVal = $("#update_appDetail").val();
        if (!Regdetai.test(update_appDetailVal)) {
            yanZhengXiaoGuo($("#update_appDetail"), "error",str3)
            return false;
        } else {
            yanZhengXiaoGuo($("#update_appDetail"), "success", "√")
        }
        var update_LuJinVal = $("#update_LuJin").val();
        if (!nonull.test(update_LuJinVal)) {
            yanZhengXiaoGuo($("#update_LuJin"), "error",str2)
            return false;
        } else {
            yanZhengXiaoGuo($("#update_LuJin"), "success", "√")
        }


        return true;
    }
    //构建软件信息列表
    function build_rj_table(data) {
        //清空历史数据
        $("#rj_table").empty();
        //获取分页信息
        var rj = data.returnData.pageInfo.list;
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
            //操作列的td
            //查看软件信息
            var eyes_btn = $("<button></button>").addClass("btn btn-sm btn-primary eyes_btn").attr("data-id", item.id).attr("data-pn", data.returnData.pageInfo.pageNum)
                .append($("<span></span>").addClass("glyphicon glyphicon-tasks")).append("&nbsp;  查看")
            var his_btn = $("<button></button>").addClass("btn btn-sm btn-primary his_btn").attr("data-id", item.id).attr("data-pn", data.returnData.pageInfo.pageNum)
                .append($("<span></span>").addClass("glyphicon glyphicon-tasks")).append("&nbsp;  查看历史信息")
            var update_btn = $("<button></button>").addClass("btn btn-sm btn-primary update_btn").attr("data-id", item.id).attr("data-pn", data.returnData.pageInfo.pageNum)
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("&nbsp;  修改软件信息")
            //上架
            var edit_btn = $("<button></button>").addClass("btn btn-sm btn-primary edit_btn").attr("data-id", item.id).attr("data-pn", data.returnData.pageInfo.pageNum)
                .append($("<span></span>").addClass("glyphicon glyphicon-ok")).append("&nbsp;  上架")
            //下架
            var del_btn = $("<button></button>").addClass("btn btn-sm btn-danger del_btn").attr("data-id", item.id).attr("data-pn", data.returnData.pageInfo.pageNum)
                .append($("<span></span>").addClass("glyphicon glyphicon-remove")).append("&nbsp;下架")
            //删除
            var rem_btn = $("<button></button>").addClass("btn btn-sm btn-danger rem_btn").attr("data-id", item.id).attr("data-pn", data.returnData.pageInfo.pageNum)
                .append($("<span></span>").addClass("glyphicon glyphicon-remove")).append("&nbsp;删除")

            //将操作按钮放入操作的td列
            var ac = $("<td></td>").append(eyes_btn).append(update_btn).append(edit_btn).append(del_btn).append(his_btn).append(rem_btn)


            if (item.zhuanTai.tai=="待审核") {
                del_btn.prop('disabled', true);
                edit_btn.prop('disabled', true);
            }
            if (item.zhuanTai.tai=="审核通过") {
                del_btn.prop('disabled', true);

            }
            if (item.zhuanTai.tai=="审核未通过") {
                del_btn.prop('disabled', true);
                edit_btn.prop('disabled', true);
            }
            if (item.zhuanTai.tai=="已上架") {
                edit_btn.prop('disabled', true);
                update_btn.prop('disabled', true);
            }
            if (item.zhuanTai.tai=="已下架") {
                del_btn.prop('disabled', true);

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


    //修改软件状态为  上架
    $(document).on("click", ".edit_btn", function () {
        //保存当前页码
        var p = $(this).attr("data-pn");

        //根据 ID 查询图书信息
        $.ajax({
            url: "${APP_PATH}/shanjia/"+$(this).attr("data-id"),
            type: "GET",
            success: function (data) {
                if (data.code == 200) {

                    alert("上架成功")
                    getPageNums(p)
                }else if (data.code == 100) {

                    alert("系统错误，请重新审核")
                    getPageNums(p)
                }else {
                    console.log(data)
                    alert("系统错误，请重新审核")
                }

            }

        })
    })
    //修改软件状态为  下架
    $(document).on("click", ".del_btn", function () {

        //根据 ID 查询图书信息
        $.ajax({
            url: "${APP_PATH}/xiajia/"+$(this).attr("data-id"),
            type: "GET",
            success: function (data) {
                if (data.code == 200) {

                    alert("下架成功")
                    getPageNums(p)
                }else if (data.code == 100) {
                    alert("系统错误，请重新审核")
                    getPageNums(p)
                }else {
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

        //根据 ID 查询软件信息
        $.ajax({
            url: "${APP_PATH}/ruanJ/"+ $(this).attr("data-id"),
            method: "GET",
            success: function (data) {
                console.log(data);
                var rj =data.returnData.ruanJian;//后端将数据放进了Model，然后前端从中获取数据;
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
                $("#edit_appDetail").text(rj.appDetail);
            }

        })
    })

    //软件历史信息
    $(document).on("click", ".his_btn", function () {
        //清空历史数据
        $("#his_table").empty();
        $("#histroyModal").modal({
            backdrop: "static",
            show: true
        })

        //根据 ID 查询相对应的软件历史信息
        $.ajax({
            url: "${APP_PATH}/histry/"+ $(this).attr("data-id"),
            method: "GET",
            success: function (data) {
                console.log(data);
                var hisrj =data.returnData.histroryRJS;
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
                    var hisLuJin_td = $("<button></button>").addClass("btn btn-sm btn-danger hisLuJin_td").append($("<span></span>").addClass("glyphicon glyphicon-download-alt")).append("&nbsp;下载")
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

    //给删除添加点击事件
    $(document).on("click", ".hisLuJin_td", function () {
        if (confirm("你确定下载吗")) {
            //发送删除的请求            
            $.ajax({
                url: "${APP_PATH}/xiazhai",
                method: "POST",
                success: function (data) {
                    alert("下载成功！")
                    console.log(data);
                    getPageNums(1);
                }
            })
        }
    })
    //渲染修改界面
    $(document).on("click", ".update_btn", function () {
        //保存当前页码
        $("#pn").val($(this).attr("data-pn"));

        $("#updateModal").modal({
            backdrop: "static",
            show: true
        })
        //根据 ID 查询图书信息
        $.ajax({
            url: "${APP_PATH}/ruanJ/"+$(this).attr("data-id"),
            method: "GET",
            success: function (data) {
                console.log(data);
                var rj =data.returnData.ruanJian;//后端将数据放进了Model，然后前端从中获取数据;
                console.log(rj);
                $("#update_id").text(rj.id);
                sessionStorage.setItem("id",rj.id);
                $("#update_appName").val(rj.appName);
                $("#update_APKName").val(rj.apkname);
                $("#update_appSize").val(rj.appSize);
                $("#update_bbH").val(rj.bbH);
                $("#update_appDetail").val(rj.appDetail);


            }

        })
    })

    //修改图书
    $("#updateSubmit").on("click", function () {
        //保存当前页码
        var p = $(this).attr("data-pn");
        //进行数据校验
        if (!updateYanZheng()) {
            return false;
        }

        var formData = new FormData();
        var id=Number(sessionStorage.getItem("id"));
        console.log(id);
        var appName = $("#update_appName").val();
        var APKName = $("#update_APKName").val();
        var appSize = $("#update_appSize").val();
        var bbH = $("#update_bbH").val();
        var appDetail = $("#update_appDetail").val();
        formData.append("updatefile",$("#update_LuJin")[0].files[0]);
        formData.append("appName",appName);
        formData.append("APKName",APKName);
        formData.append("id",id);
        formData.append("appSize",appSize);
        formData.append("bbH",bbH);
        formData.append("appDetail",appDetail);
                $.ajax({
                    url:"${APP_PATH}/update",
                    method:"post",
                    data:formData,
                    // 告诉jQuery不要去处理发送的数据
                    processData : false,
                    // 告诉jQuery不要去设置Content-Type请求头
                    contentType : false,
                    success:function (data) {
                        console.log(data)
                        alert("修改成功！")
                        $("#updateModal").modal("hide");
                        getPageNums(pn);
                    },
                    error:function (data) {

                        console.log("error")
                        console.log(data)
                        alert("APK名称不能与之前的相同！！！")
                    }
    })
    })


    //给删除添加点击事件
    $(document).on("click", ".rem_btn", function () {
        var pn = $(this).attr("data-pn");
        if (confirm("你确定删除吗")) {
            //发送删除的请求            
            $.ajax({
                url: "${APP_PATH}/delete/"+$(this).attr("data-id"),
                data:"_method=delete",
                method: "POST",
                success: function (data) {
                    console.log(data)
                    if (data.returnData.msg == "success") {
                        alert("删除成功");
                        //跳转页面                        
                        getPageNums(pn);
                    }
                }
            })
        }
    })
    //添加模态框
    $("#addBtn").click(function () {
        $("#addModal").modal({
            backdrop: "static",
            show: true//点击背景 模态框不会消失
        })

    })
    $("#addSubmit").click(function () {
        var kaifazId="<%=session.getAttribute("kaifazId")%>";
        console.log(kaifazId);
        var formData = new FormData();
        var appName = $("#appName").val();
        var APKName = $("#APKName").val();
        var appSize = $("#appSize").val();
        var pintai = $("#pintai input").val();
        var onefenLei = $("#onefenLei  input").val();
        var twofenLei = $("#twofenlei  input").val();
        var threefenLi = $("#threefenli input").val();
        var bbH = $("#bbH").val();
        var appDetail = $("#appDetail").val();
        formData.append("file",$("#LuJin")[0].files[0]);
        formData.append("appName",appName);
        formData.append("APKName",APKName);
        formData.append("kaifazId",Number(kaifazId));
        formData.append("appSize",appSize);
        formData.append("appPinTai",Number(pintai));
        formData.append("onefenLei",Number(onefenLei));
        formData.append("twofenlei",Number(twofenLei));
        formData.append("threefenli",Number(threefenLi));
        formData.append("bbH",bbH);
        formData.append("appDetail",appDetail);
        $.ajax({
            url:"${APP_PATH}/file",
            method:"post",
            data:formData,
            // 告诉jQuery不要去处理发送的数据
            processData : false,
            // 告诉jQuery不要去设置Content-Type请求头
            contentType : false,
            success:function (data) {
                console.log(data)
                alert("添加成功！")
                $("#addModal").modal("hide");
            },
            error:function (data) {
                console.log("error")
                console.log(data)
            }
        })

})



</script>
</body>
</html>