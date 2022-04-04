<%@ page  contentType="text/html" pageEncoding="UTF-8"%>
<% pageContext.setAttribute("APP_PATH",request.getContextPath()); %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>该页面不存在-404.life</title>
	<link type="text/css"  rel="styleSheet" href="${APP_PATH}/dist/css/style.css"/>
</head>
<body>
	<div id="notfound">
		<div class="notfound">
			<div class="notfound-404">
				<h1>404</h1>
				<h2>抱歉！找不到页面</h2>
			</div>
			<a href="${APP_PATH}/index.jsp">返回首页</a>
		</div>
	</div>
</body>
</html>
