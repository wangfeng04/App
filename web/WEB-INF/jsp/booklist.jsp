<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% pageContext.setAttribute("APP_PATH", request.getContextPath()); %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link type="text/css" rel="styleSheet" href="http://localhost:8080/ssm/dist/css/bootstrap.css"/>
</head>
<body>
<%-- addModal --%>
<div class="modal fade" id="addModal" role="dialog" aria-labelledby="myModalLabel">    
    <div class="modal-dialog" role="document">        
        <div class="modal-content">            
            <div class="modal-header">                
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>
                               
                <h4 class="modal-title" id="myModalLabel">添加图书</h4>            
            </div>
                       
            <div class="modal-body">                
                <form name="addForm" id="addForm" method="post">
                    <div class="form-group">
                        <label for="bookName">图书名称：</label>
                        <input type="text" class="form-control" name="bookName" id="bookName" placeholder="图书名称">
                        <span class="help-block"></span>
                    </div>
                    <div class="form-group">
                        <label for="bookCounts">图书数量</label>
                        <input type="text" class="form-control" name="bookCounts" id="bookCounts" placeholder="图书数量">
                        <span class="help-block"></span>
                    </div>
                    <div class="form-group">
                        <label for="detail">图书描述</label>
                        <input type="text" class="form-control" name="detail" id="detail" placeholder="图书描述">
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

<!-- editModal -->
<div class="modal fade" id="editModal" role="dialog" aria-labelledby="myModalLabel2">    
    <div class="modal-dialog" role="document">        
        <div class="modal-content">
            <div class="modal-header">                
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>
                               
                <h4 class="modal-title" id="myModalLabel2">修改图书</h4>            
            </div>
                       
            <div class="modal-body">    
                <form name="editForm" id="editForm" method="post">
                    <div class="form-group">
                        <label for="bookName">图书编号：</label>
                        <p id="edit_bookid"></p>
                        <span class="help-block"></span>
                    </div>
                    <input type="hidden" name="id" id="bookId">
                    <input type="hidden" name="pn" id="pn">
                    <div class="form-group">
                        <label for="bookName">图书名称：</label>
                        <input type="text" class="form-control" name="bookName" id="edit_bookName" placeholder="图书名称">
                        <span class="help-block"></span>
                    </div>
                    <div class="form-group">
                        <label for="bookCounts">图书数量</label>
                        <input type="text" class="form-control" name="bookCounts" id="edit_bookCounts"
                               placeholder="图书数量">
                        <span class="help-block"></span>
                    </div>
                    <div class="form-group">
                        <label for="detail">图书描述</label>
                        <input type="text" class="form-control" name="detail" id="edit_detail" placeholder="图书描述">
                        <span class="help-block"></span>
                    </div>
                </form>
                       
            </div>
                       
            <div class="modal-footer">                
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                               
                <button type="button" class="btn btn-primary" id="updateSubmit">更新</button>
                           
            </div>
                   
        </div>
           
    </div>
</div>


<%out.print(request.getContextPath());%>
<div class="container">

    <h1 class="col-lg-6">图书列表</h1>
    <div class="col-lg-2 col-lg-offset-4">
        <button class="btn btn-primary" id="addBtn">
            <span class="glyphicon glyphicon-plus">添加图书</span>
        </button>
    </div>

    <table class="table table-hover table-striped">
        <tr>
            <th>图书编号</th>
            <th>图书名称</th>
            <th>图书数量</th>
            <th>图书描述</th>
            <th>操作</th>
        </tr>
        <tbody id="book_table">

        </tbody>
    </table>
    <div class="row">
        <div id="page_pageInfo" class="col-lg-6">

        </div>
        <nav aria-label="Page navigation">
            <ul class="pagination">

            </ul>
        </nav>
    </div>
</div>

<script type="text/javascript" src="${APP_PATH}/dist/js/jquery-1.12.4.js"></script>
<%-- bootstrap的插件是依赖于 jquery实现的  --%>
<script type="text/javascript" src="${APP_PATH}/dist/js/bootstrap.min.js"></script>
<script type="text/javascript">
    $(function () {
        getPageNums(1)
    })

    //构建图书列表
    function build_books_table(data) {
        //清空历史数据
        $("#book_table").empty();
        //获取分页信息
        var books = data.returnData.booksPageInfo.list;
        $.each(books, function (index, item) {
            //构建5个td 存放数据
            var id_td = $("<td></td>").append(item.id);
            var bookName_td = $("<td></td>").append(item.bookName);
            var bookCounts_td = $("<td></td>").append(item.bookCounts);
            var detail_td = $("<td></td>").append(item.detail);
            //操作列的td
            //编辑按钮
            var edit_btn = $("<button></button>").addClass("btn btn-sm btn-primary edit_btn").attr("data-id", item.id).attr("data-pn", data.returnData.booksPageInfo.pageNum)
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("&nbsp;修改")
            //删除按钮
            var del_btn = $("<button></button>").addClass("btn btn-sm btn-danger del_btn").attr("data-id", item.id).attr("data-pn", data.returnData.booksPageInfo.pageNum)
                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("&nbsp;删除")
            //将操作按钮放入操作的td列
            var ac = $("<td></td>").append(edit_btn).append(del_btn)

            //将4个td 放入一个tr里
            var tr = $("<tr></tr>")
                .append(id_td)
                .append(bookName_td)
                .append(bookCounts_td)
                .append(detail_td)
                .append(ac);
            //将tr添加至tbody
            tr.appendTo($("#book_table"))
        })
    }

    // 分页信息
    function page_pageInfo_(data) {
        $("#page_pageInfo").empty();
        var booksPageInfo = data.returnData.booksPageInfo;
        // 当前是第<span class="current-page"></span> 页   /   ，共 <span  class="total"> </span> 条信息
        $("#page_pageInfo").append("当前是第 "+booksPageInfo.pageNum+" 页   "+booksPageInfo.pageNum+"/"+booksPageInfo.pages+" 页    共 "+booksPageInfo.total+"条信息");


    }
    // 页码
    function buid_booklist(data) {
        $(".pagination").empty();
        //获取分页信息
        var booksPageInfo = data.returnData.booksPageInfo;

        var ul = $(".pagination");

        var firstLi = creatLi("首页");
        var previousLi = creatLi("&laquo;");

        if (!booksPageInfo.hasPreviousPage) {
            firstLi.addClass("disabled");
            previousLi.addClass("disabled");
        } else {
            creatClick(firstLi, 1);
            creatClick(previousLi, booksPageInfo.pageNum - 1);
        }

        ul.append(firstLi);
        ul.append(previousLi);

        //当前页
        $.each(booksPageInfo.navigatepageNums, function (index, item) {
            var labeLi = creatLi(item);
            creatClick(labeLi, item);
            if (item == booksPageInfo.pageNum) {
                labeLi.addClass("active")
            }
            ul.append(labeLi);
        })

        var nextLi = creatLi("&raquo;");
        var lastLi = creatLi("尾页");

        if (!booksPageInfo.hasNextPage) {

            nextLi.addClass("disabled");
            lastLi.addClass("disabled");

        } else {
            creatClick(nextLi, booksPageInfo.pageNum + 1);
            creatClick(lastLi, booksPageInfo.pages);
        }

        ul.append(nextLi);
        ul.append(lastLi);

    }

    //生成 li
    function creatLi(str) {

        return $("<li></li>").append($("<a></a>").attr("herf", "#").append(str));
    }

    //生成 li点击事件
    function creatClick(obj, pn) {
        obj.click(function () {
            getPageNums(pn)
        })
    }


    //获取 json 数据
    function getPageNums(pn) {

        $.ajax({
            url: "${APP_PATH}/list",
            data: "pageNum=" + pn,
            type: "GET",
            success: function (data) {
                console.log(data);
                build_books_table(data)
                page_pageInfo_(data)
                buid_booklist(data)
            }
        })
    }

    //添加模态框
    $("#addBtn").click(function () {
        $("#addModal").modal({
            backdrop: "static",
            show: true//点击背景 模态框不会消失
        })

    })
    //添加图书
    $("#addSubmit").click(function () {
        //进行数据校验
        if (!formYanZheng()) {
            return false;
        }
        //发送添加的请求
        $.ajax({
            url: "${APP_PATH}/add",
            method: "post",
            data: $("#addForm").serialize(),
            success: function (data) {
                if (data.code == 100) {
                    // 获取后端验证结果
                    var errorMap = data.returnData.errorMap
                    //将后端验证结果渲染到前端页面
                    yanZhengXiaoGuo($("#bookName"), "error", errorMap.bookName)
                    yanZhengXiaoGuo($("#bookCounts"), "error", errorMap.bookCounts);
                    yanZhengXiaoGuo($("#detail"), "error", errorMap.detail);
                    console.log(data);
                }
                if (data.code == 200) {

                    $("#addModal").modal("hide");
                    getPageNums(1);
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
        //英文 中文 数字 _ 组合
        var bookNameVal = $("#bookName").val();
        var regBookName = /^[A-Za-z0-9_\u2E80-\u9FFF]{1,50}$/;
        if (!regBookName.test(bookNameVal)) {
            yanZhengXiaoGuo($("#bookName"), "error", "中英文下划线组合，不能有图书字符")
            return false;
        } else {
            yanZhengXiaoGuo($("#bookName"), "success", "√")
        }

        var bookCountsVal = $("#bookCounts").val();
        var RegbookCounts = /^[0-9]+$/;
        if (!RegbookCounts.test(bookCountsVal)) {
            yanZhengXiaoGuo($("#bookCounts"), "error", "数量必须是数字")
            return false;
        } else {
            yanZhengXiaoGuo($("#bookCounts"), "success", "√")
        }
        var detailVal = $("#detail").val();
        var Regdetai = /^[A-Za-z0-9_\u2E80-\u9FFF]{5,100}$/;
        if (!Regdetai.test(detailVal)) {
            yanZhengXiaoGuo($("#detail"), "error", "描述太短，必须5个字以上")
            return false;
        } else {
            yanZhengXiaoGuo($("#detail"), "success", "√")
        }
        return true;
    }

    function updateYanZheng() {
        var regBookName = /^[A-Za-z0-9_\u2E80-\u9FFF]{1,50}$/;
        var RegbookCounts = /^[0-9]{1,5}$/;
        var Regdetai = /^[A-Za-z0-9_\u2E80-\u9FFF]{5,100}$/;
        //修改图书时
        var edit_bookNameVal = $("#edit_bookName").val();
        if (!regBookName.test(edit_bookNameVal)) {
            yanZhengXiaoGuo($("#edit_bookName"), "error", "中英文下划线组合，不能有图书字符")
            return false;
        } else {
            yanZhengXiaoGuo($("#edit_bookName"), "success", "√")
        }

        var edit_bookCountsVal = $("#edit_bookCounts").val();

        if (!RegbookCounts.test(edit_bookCountsVal)) {
            yanZhengXiaoGuo($("#edit_bookCounts"), "error", "数量必须是数字且不能大于9999")
            return false;
        } else {
            yanZhengXiaoGuo($("#edit_bookCounts"), "success", "√")
        }
        var edit_detailVal = $("#edit_detail").val();

        if (!Regdetai.test(edit_detailVal)) {
            yanZhengXiaoGuo($("#edit_detail"), "error", "描述太短，必须5个字以上")
            return false;
        } else {
            yanZhengXiaoGuo($("#edit_detail"), "success", "√")
        }
        return true;
    }

    //渲染修改图书界面
    $(document).on("click", ".edit_btn", function () {
        //保存当前页码
        $("#pn").val($(this).attr("data-pn"));

        $("#editModal").modal({
            backdrop: "static",
            show: true
        })

        //根据 ID 查询图书信息
        $.ajax({
            url: "${APP_PATH}/book/" + $(this).attr("data-id"),
            method: "GET",
            success: function (data) {
                console.log(data)
                var book = data.returnData.book;
                $("#edit_bookid").text(book.id);
                $("#bookId").val(book.id);
                $("#edit_bookName").val(book.bookName);
                $("#edit_bookCounts").val(book.bookCounts);
                $("#edit_detail").val(book.detail);
            }

        })
    })

    //修改图书
    $("#updateSubmit").on("click", function () {
        //进行数据校验
        if (!updateYanZheng()) {
            return false;
        }
        $.ajax({
            url: "${APP_PATH}/book",
            method: "post",
            data: $("#editForm").serialize() + "&_method=put",
            success: function (data) {
                if (data.code == 100) {
                    // 获取后端验证结果
                    var errorMap = data.returnData.errorMap;
                    //将后端验证结果渲染到前端页面
                    yanZhengXiaoGuo($("#edit_bookName"), "error", errorMap.bookName)
                    yanZhengXiaoGuo($("#edit_bookCounts"), "error", errorMap.bookCounts);
                    yanZhengXiaoGuo($("#edit_detail"), "error", errorMap.detail);
                    console.log(data);
                }
                if (data.code == 200) {
                    alert("修改成功！");
                    $("#editModal").modal("hide");
                    //跳转页面
                    getPageNums($("#pn").val());

                }

            }

        })
    })


    //给删除添加点击事件
    $(document).on("click", ".del_btn", function () {
        var pn = $(this).attr("data-pn");
        if (confirm("你确定删除吗")) {
            //发送删除的请求            
            $.ajax({
                url: "${APP_PATH}/book/" + $(this).attr("data-id"),
                data: "_method=delete",
                method: "POST",
                success: function (data) {
                    console.log(data)
                    if (data.returnData.msg == "success") {
                        alert("删除成功");
                        //跳转页面                        
                        getPageNums(pn);
                    }
                }
            })
        }
    })


</script>

</body>
</html>