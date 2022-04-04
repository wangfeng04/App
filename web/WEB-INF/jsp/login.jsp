<%--
  Created by IntelliJ IDEA.
  User: s'j'w
  Date: 2022/3/24
  Time: 16:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% pageContext.setAttribute("APP_PATH",request.getContextPath()); %>
<html>
<head>
    <title>用户登陆</title>
    <link type="text/css"  rel="styleSheet" href="${APP_PATH}/dist/css/bootstrap.css"/>
</head>
<body>
<div class="container" style="margin-top: 100px">
    <div class="col-lg-offset-3 col-lg-2" >

        <form class="form-horizontal" action="${APP_PATH}/hello">
            <div class="form-group">
                <label for="uName">用户名：</label>
                <input type="text" class="form-control" name="uName" id="uName" placeholder="用户名">
            </div>
            <div class="form-group">
                <label for="pwd">Password</label>
                <input type="password" class="form-control" name="pwd" id="pwd" placeholder="Password">
            </div>
            <div class="checkbox">
                <label>
                    <input type="checkbox"> Check me out
                </label>
            </div>
            <button type="submit" class="btn btn-default">登陆</button>
        </form>


    </div>
</div>
</body>
</html>
