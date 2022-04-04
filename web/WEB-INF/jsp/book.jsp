<%--
  Created by IntelliJ IDEA.
  User: s'j'w
  Date: 2022/3/11
  Time: 15:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<% pageContext.setAttribute("APP_PATH",request.getContextPath()); %>
<head>
    <title>Title</title>
</head>
<link type="text/css"  rel="styleSheet" href="${APP_PATH}/dist/css/bootstrap.css"/>
<body>
<h1>${mag}</h1>
<div class="container">
    <div class="row">
        <a href="query" class="btn btn-primary">返回图书列表</a>
    </div>
</div>

</body>
</html>
