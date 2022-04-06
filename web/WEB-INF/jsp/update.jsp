<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: s'j'w
  Date: 2022/3/10
  Time: 17:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% pageContext.setAttribute("APP_PATH", request.getContextPath()); %>
<html>
<head>
    <title>修改</title>
</head>
<link type="text/css" rel="styleSheet" href="${APP_PATH}/dist/css/bootstrap.css"/>
<body>
<div class="container">
    <%--<%--%>
    <%--   Integer id= (Integer) request.getAttribute("id");--%>
    <%--%>--%>
    <div class="col-lg-6 col-lg-offset-3">

        <form action="update" method="post">
            <input type="hidden" class="form-control" name="id" value="${books.id}" id="id" placeholder="${books.id}">
            <div class="form-group">
                <label for="bookName">图书名称：</label>
                <input type="text" class="form-control" name="bookName" id="bookName" value="${books.bookName}"
                       placeholder="${books.bookName}">
            </div>
            <div class="form-group">
                <label for="bookCounts">图书数量</label>
                <input type="text" class="form-control" name="bookCounts" id="bookCounts" value="${books.bookCounts}"
                       placeholder="${books.bookCounts}">
            </div>
            <div class="form-group">
                <label for="detail">图书描述</label>
                <input type="text" class="form-control" name="detail" id="detail" value="${books.detail}"
                       placeholder="${books.detail}">
            </div>

            <button type="submit" class="btn btn-primary">点击修改</button>
        </form>

    </div>

</div>
</body>
</html>
