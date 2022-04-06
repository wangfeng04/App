<%--
  Created by IntelliJ IDEA.
  User: s'j'w
  Date: 2022/3/24
  Time: 16:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<% pageContext.setAttribute("APP_PATH", request.getContextPath()); %>
<html>
<head>
    <title>软件信息列表</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<h1>欢迎登陆！开发者先生</h1>
<%-- addModal --%>
<div class="modal fade" id="addModal" role="dialog" aria-labelledby="myModalLabel">    
    <div class="modal-dialog" role="document">        
        <div class="modal-content">            
            <div class="modal-header">                
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>
                               
                <h4 class="modal-title" id="myModalLabel">添加软件</h4>            
            </div>
                       
            <div class="modal-body">                
                <form name="addForm" id="addForm" method="post">
                    <div class="form-group">
                        <label for="appName">软件名称:</label>
                        <input type="text" class="form-control" name="appName" id="appName" placeholder="软件名称">
                        <span class="help-block"></span>
                    </div>
                    <div class="form-group">
                        <label for="APKName">APK名称:</label>
                        <input type="text" class="form-control" name="APKName" id="APKName" placeholder="APK名称">
                        <span class="help-block"></span>
                    </div>
                    <div class="form-group">
                        <label for="bookCounts">软件大小:</label>
                        <input type="text" class="form-control" name="bookCounts" id="bookCounts" placeholder="软件大小">
                        <span class="help-block"></span>
                    </div>
                    <div class="form-group">
                        <label for="tai">状态:</label>
                        <input type="text" class="form-control" name="tai" id="tai" placeholder="状态">
                        <span class="help-block"></span>
                    </div>
                    <div class="form-group">
                        <label for="pintai">所属平台:</label>
                        <input type="text" class="form-control" name="pintai" id="pintai" placeholder="所属平台">
                        <span class="help-block"></span>
                    </div>
                    <div class="form-group">
                        <label for="onefenLei">一级分类:</label>
                        <input type="text" class="form-control" name="onefenLei" id="onefenLei" placeholder="下载次数">
                        <span class="help-block"></span>
                    </div>
                    <div class="form-group">
                        <label for="twofenlei">二级分类:</label>
                        <input type="text" class="form-control" name="twofenlei" id="twofenlei" placeholder="下载次数">
                        <span class="help-block"></span>
                    </div>
                    <div class="form-group">
                        <label for="threefenli">三级分类:</label>
                        <input type="text" class="form-control" name="threefenli" id="threefenli" placeholder="下载次数">
                        <span class="help-block"></span>
                    </div>
                    <div class="form-group">
                        <label for="bbH">版本号:</label>
                        <input type="text" class="form-control" name="bbH" id="bbH" placeholder="版本号">
                        <span class="help-block"></span>
                    </div>

                    <div class="form-group">
                        <label for="appDetail">软件简介:</label>
                        <input type="text" class="form-control" name="appDetail" id="appDetail" placeholder="软件简介">
                        <span class="help-block"></span>
                    </div>
                    <div class="form-group">
                        <label for="LuJin">文件上传:</label>
                        <input type="text" class="form-control" name="LuJin" id="LuJin" placeholder="文件上传">
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
                               
                <h4 class="modal-title" id="myModalLabel2">修改软件信息</h4>            
            </div>
                       
            <div class="modal-body">                
                <form name="addForm" id="updateForm" method="post">
                    <div class="form-group">
                        <label for="appName">软件名称:</label>
                        <input type="text" class="form-control" name="appName" id="edit_appName" placeholder="软件名称">
                        <span class="help-block"></span>
                    </div>
                    <div class="form-group">
                        <label for="APKName">APK名称:</label>
                        <input type="text" class="form-control" name="APKName" id="edit_APKName" placeholder="APK名称">
                        <span class="help-block"></span>
                    </div>
                    <div class="form-group">
                        <label for="bookCounts">软件大小:</label>
                        <input type="text" class="form-control" name="bookCounts" id="edit_bookCounts"
                               placeholder="软件大小">
                        <span class="help-block"></span>
                    </div>
                    <div class="form-group">
                        <label for="tai">状态:</label>
                        <input type="text" class="form-control" name="tai" id="edit_tai" placeholder="状态">
                        <span class="help-block"></span>
                    </div>
                    <div class="form-group">
                        <label for="pintai">所属平台:</label>
                        <input type="text" class="form-control" name="pintai" id="edit_pintai" placeholder="所属平台">
                        <span class="help-block"></span>
                    </div>
                    <div class="form-group">
                        <label for="onefenLei">一级分类:</label>
                        <input type="text" class="form-control" name="onefenLei" id="edit_onefenLei" placeholder="下载次数">
                        <span class="help-block"></span>
                    </div>
                    <div class="form-group">
                        <label for="twofenlei">二级分类:</label>
                        <input type="text" class="form-control" name="twofenlei" id="edit_twofenlei" placeholder="下载次数">
                        <span class="help-block"></span>
                    </div>
                    <div class="form-group">
                        <label for="threefenli">三级分类:</label>
                        <input type="text" class="form-control" name="threefenli" id="edit_threefenli"
                               placeholder="下载次数">
                        <span class="help-block"></span>
                    </div>
                    <div class="form-group">
                        <label for="bbH">版本号:</label>
                        <input type="text" class="form-control" name="bbH" id="edit_bbH" placeholder="版本号">
                        <span class="help-block"></span>
                    </div>

                    <div class="form-group">
                        <label for="appDetail">软件简介:</label>
                        <input type="text" class="form-control" name="appDetail" id="edit_appDetail" placeholder="软件简介">
                        <span class="help-block"></span>
                    </div>
                    <div class="form-group">
                        <label for="LuJin">文件上传:</label>
                        <input type="text" class="form-control" name="LuJin" id="edit_LuJin" placeholder="文件上传">
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

</body>
</html>