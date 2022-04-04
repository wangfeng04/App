<%--
  Created by IntelliJ IDEA.
  User: s'j'w
  Date: 2022/3/10
  Time: 15:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page  contentType="text/html" pageEncoding="UTF-8"%>

<% pageContext.setAttribute("APP_PATH",request.getContextPath()); %>

<html>
<head>
    <title>Title</title>
</head>
<link type="text/css"  rel="styleSheet" href="${APP_PATH}/dist/css/bootstrap.css"/>
<body>
<div class="container">

    <div class="col-lg-6 col-lg-offset-3">
        <form action="add" method="post">
            <div class="form-group">
                <label for="bookName">图书名称：</label>
                <input type="text" class="form-control" name="bookName" id="bookName" placeholder="图书名称">
            </div>
            <div class="form-group">
                <label for="bookCounts">图书数量</label>
                <input type="text" class="form-control" name="bookCounts" id="bookCounts" placeholder="图书数量">
            </div>
            <div class="form-group">
                <label for="detail">图书描述</label>
                <input type="text" class="form-control" name="detail" id="detail" placeholder="图书描述">
            </div>

            <button type="submit" class="btn btn-primary">点击添加</button>
        </form>
    </div>

</div>
</body>
</html>
