<%@ page language="java" pageEncoding="UTF-8" import="java.io.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>后台登录界面</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="css/wordpress.css" media="all">
</head>
<body style="background: url(images/register_back.jpg) no-repeat center fixed;">
<div class="xh-regbox" style="margin-top: 120px">
    <div class="xh-title" id="form-title">登录</div>
    <form  action="/adminlogin.shtml" method="post" class="xh-form" >
        <div class="xh-form-group">
            <label class="required">用户名</label>
            <br>
            <input type="text"  required="true" name="user_name" class="form-control">
        </div>
        <p></p>
        <div class="xh-form-group">
            <label class="required">密码</label>
            <br>
            <input type="password"  required="true" name="password" class="form-control">
        </div>
        <p id="unmap" style="color: red"></p>
        <div class="xh-form-group">
            <input type="submit"  class="xh-btn xh-btn-primary xh-btn-block xh-btn-lg" value="立即登录">
        </div>
    </form>
</div>
<p></p>
<div class="xh-user-register">
    <a href="index.jsp">首页</a>
</div>
</body>
</html>