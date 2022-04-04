<%--
  Created by IntelliJ IDEA.
  User: s'j'w
  Date: 2022/3/25
  Time: 11:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>错误信息</title>
</head>
<body>
<h1>抱歉！您查找的页面不存在或已被删除</h1>
<div>
    <h5> 请检查网址是否正确！</h5><br/>
    <hr/>
    <h6>${ex}</h6><br/>
    <a href="${APP_PATH}/index.jsp">返回首页</a>
</div>

</body>
</html>
