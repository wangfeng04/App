<%--
  Created by IntelliJ IDEA.
  User: s'j'w
  Date: 2022/3/22
  Time: 19:39
  To change this template use File | Settings | File Templates.
--%>
<% pageContext.setAttribute("APP_PATH",request.getContextPath()); %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="${APP_PATH}/test" method="post">

<%--    <input type="hidden" name="_method" value="put">--%>
<%--    <input type="submit" value="提交put请求">--%>

    <input type="text" name="_method" value="put">
    <input type="button" id="putBtn" value="提交put请求">

</form>

<script src="${APP_PATH}/dist/js/jquery-1.12.4.js"></script>
<script>
    $(function () {
        $("#putBtn").click(function () {
                $.ajax({
                    url:"${APP_PATH}/test",
                    method:"post",
                    data:"_method=put",
                    success:function () {
                        console.log(data);
                    }
                })
        })
    })
</script>
</body>
</html>
