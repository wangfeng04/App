<%--
  Created by IntelliJ IDEA.
  User: s'j'w
  Date: 2022/3/9
  Time: 14:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page  contentType="text/html" pageEncoding="UTF-8"%>
<% pageContext.setAttribute("APP_PATH",request.getContextPath()); %>
<html>
  <head>
    <title>首页</title>
  </head>
  <link type="text/css"  rel="styleSheet" href="http://localhost:8080/ssm/dist/css/bootstrap.css"/>
  <body>
  <div class="container">
<%--  
      container-fluid：全屏
      container：容器
  --%>
<div class="container">
    <div class="row">
        <a href="${APP_PATH}/book/query" class="btn btn-primary">进入图书列表</a>
        <br/>
        <a href="${APP_PATH}/gotoBooks" class="btn btn-primary">进入图书列表2</a>
        <br/>
        <a href="${APP_PATH}/user" class="btn btn-primary">添加用户</a>
    </div>
</div>


  </div>
  </body>
</html>
