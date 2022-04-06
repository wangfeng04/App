<%--
  Created by IntelliJ IDEA.
  User: s'j'w
  Date: 2022/3/9
  Time: 14:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<% pageContext.setAttribute("APP_PATH", request.getContextPath()); %>
<html>
<head>
    <title>App开发者平台</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


    <link type="text/css" rel="styleSheet" href="${APP_PATH}/dist/css/dl.css"/>
    <link type="text/css" rel="styleSheet" href="${APP_PATH}/dist/css/bootstrap.css"/>
</head>
<body>
<%-- 注册模态框 --%>
<div class="modal fade" id="addModal" role="dialog" aria-labelledby="myModalLabel">    
    <div class="modal-dialog" role="document">        
        <div class="modal-content">            
            <div class="modal-header">                
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>
                               
                <h4 class="modal-title" id="myModalLabel">注册用户</h4>            
            </div>
                       
            <div class="modal-body">                
                <form name="addForm" id="addForm" accept-charset="UTF-8" method="post">
                    <div class="form-group">
                        <label for="userName">用户名：</label>
                        <input type="text" class="form-control" name="userName" id="userName" placeholder="用户名">
                        <span class="help-block"></span>
                    </div>
                    <div class="form-group">
                        <label for="passward">密码：</label>
                        <input type="password" class="form-control" name="passward" id="passward" placeholder="密码">
                        <span class="help-block"></span>
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

<div class="login-box">
    <h2>欢迎来到App开发者平台登陆界面</h2>
    <form action="hello" accept-charset="UTF-8" method="Post">
        <div class="login-field">
            <input type="text" name="userName" required=""/>
            <label>用户名</label>
        </div>
        <div class="login-field">
            <input type="password" name="passward" required=""/>
            <label>密码</label>
        </div>
        <button type="submit">登录</button>&nbsp;&nbsp;&nbsp;
        <button class="btn btn-info" id="addBtn">
            <span>注册</span>
        </button>
    </form>
</div>


<script type="text/javascript" src="${APP_PATH}/dist/js/jquery-1.12.4.js"></script>
<%-- bootstrap的插件是依赖于 jquery实现的  --%>
<script type="text/javascript" src="${APP_PATH}/dist/js/bootstrap.min.js"></script>
<script type="text/javascript">
    //添加模态框
    $("#addBtn").click(function () {
        $("#addModal").modal({
            backdrop: "static",
            show: true//点击背景 模态框不会消失
        })

    })


    //注册用户
    $("#addSubmit").click(function () {
        if (!formYanZheng()) {
            return false;
        }
        //发送添加的请求
        $.ajax({
            url: "${APP_PATH}/add",
            method: "post",
            data: $("#addForm").serialize() + "&_method=put",
            success: function (data) {
                console.log(data);
                if (data.code == 100) {
                    // // 获取后端验证结果
                    var errorMap = data.returnData.errorMap
                    console.log(errorMap);
                    //将后端验证结果渲染到前端页面
                    yanZhengXiaoGuo($("#userName"), "error", errorMap.userName)
                    yanZhengXiaoGuo($("#passward"), "error", errorMap.passward);
                    console.log(data);
                }
                if (data.code == 200) {

                    $("#addModal").modal("hide");

                }

            }
        })

    })

    /**
     *   添加验证效果
     * @param meth  $("# ")
     * @param error 是否符合正则表达式
     * @param string 返回的提示信息
     */
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

    // 添加图书表单验证
    function formYanZheng() {
        //添加图书时
        //英文 数字 组合
        var userNameVal = $("#userName").val();
        var regBookName = /^[A-Za-z0-9_]+$/;
        if (!regBookName.test(userNameVal)) {
            yanZhengXiaoGuo($("#userName"), "error", "英文数字下划线组合，不能有其他字符")
            return false;
        } else {
            yanZhengXiaoGuo($("#userName"), "success", "√")
        }

        var passwardVal = $("#passward").val();
        var RegbookCounts = /^[A-Za-z0-9]+$/;
        if (!RegbookCounts.test(passwardVal)) {
            yanZhengXiaoGuo($("#passward"), "error", "只能由字母和数字组成！")
            return false;
        } else {
            yanZhengXiaoGuo($("#passward"), "success", "√")
        }
        return true;
    }
</script>
</body>
</html>
