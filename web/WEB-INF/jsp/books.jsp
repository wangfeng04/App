<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: s'j'w
  Date: 2022/3/9
  Time: 14:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<% pageContext.setAttribute("APP_PATH", request.getContextPath()); %>
<html>
<head>
    <title>Title</title>
</head>
<link type="text/css" rel="styleSheet" href="${APP_PATH}/dist/css/bootstrap.css"/>

<body>
<div class="container">

    <h1 class="col-lg-6">图书列表</h1>
    <div class="col-lg-2 col-lg-offset-4">
        <a href="add" class="btn btn-primary"><span class="glyphicon glyphicon-plus">添加图书</span></a>
    </div>

    <table class="table table-hover table-striped">
        <tr>
            <th>图书编号</th>
            <th>图书名称</th>
            <th>图书数量</th>
            <th>图书描述</th>
            <th>操作</th>
        </tr>
        <c:forEach var="book" items="${pageInfo.list}">
            <tr>
                <td>${book.id}</td>
                <td>${book.bookName}</td>
                <td>${book.bookCounts}</td>
                <td>${book.detail}</td>
                <td>
                    <a href="update?id=${book.id}" class="btn btn-primary"><span
                            class="glyphicon glyphicon-pencil">修改</span></a>
                    <a href="delet?id=${book.id}" class="btn btn-danger"><span
                            class="glyphicon glyphicon-trash">删除</span></a>
                </td>
            </tr>
        </c:forEach>
    </table>
    <div class="row">
        <div class="row">
            <div class="col-lg-6">
                当前是第<span class="badge">${pageInfo.pageNum}</span>页 ${pageInfo.pageNum}/${pageInfo.pages}页 共<span
                    class="badge">${pageInfo.total}</span>条信息
            </div>

            <nav aria-label="Page navigation">
                <ul class="pagination">


                    <c:if test="${pageInfo.isFirstPage !=true}">
                        <li><a href="/book/query">首页</a></li>
                        <li>
                            <a href="/book/query?pn=${pageInfo.pageNum-1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>

                    <c:forEach items="${pageInfo.navigatepageNums}" var="npn" end="${pageInfo.navigatePages-1}">
                        <c:if test="${pageInfo.pageNum == npn}">
                            <li class="active"><a href="/book/query?pn=${npn}">${npn}</a></li>
                        </c:if>
                        <c:if test="${pageInfo.pageNum != npn}">
                            <li><a href="/book/query?pn=${npn}">${npn}</a></li>
                        </c:if>
                    </c:forEach>

                    <c:if test="${pageInfo.isLastPage !=true}">
                        <li>
                            <a href="/book/query?pn=${pageInfo.pageNum+1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                        <li><a href="/book/query?pn=${pageInfo.pages}">尾页</a></li>
                    </c:if>

                </ul>
            </nav>
        </div>
    </div>
</div>
</body>
</html>
