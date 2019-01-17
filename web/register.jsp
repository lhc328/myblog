<%@ page language="java" pageEncoding="UTF-8" import="java.io.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>注册界面</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" href="css/wordpress.css" media="all">
</head>
<body style="background: url(images/register_back.jpg) no-repeat center fixed;">
	<div class="xh-regbox" style="margin-top: 120px">
		<div class="xh-title" id="form-title">注册</div>
	<form  action="" method="post" class="xh-form" >
		<div class="xh-form-group">
             <label class="required">用户名</label>
             <br>
             <input type="text" id="register_register_user_login" required="true" name="username" class="form-control">
        </div>
        <p></p>
        <div class="xh-form-group">
             <label class="required">邮箱</label>
             <br>
             <input type="email" id="register_register_user_email" required="true" name="email" class="form-control">
        </div>
        <p></p>
        <div class="xh-form-group">
             <label class="required">密码</label>
             <br>
             <input type="password" id="register_register_user_password" required="true" name="password" class="form-control">
        </div>
        <p></p>
        <div class="xh-form-group">
             <label class="required">确认密码</label>
             <br>
             <input type="password" id="register_register_user_repassword" required="true" name="repassword" class="form-control" onkeyup="validate()">
        </div>
        <p id="unmap" style="color: red"></p>
        <div class="xh-form-group">
            <input type="submit" id="btn-register" class="xh-btn xh-btn-primary xh-btn-block xh-btn-lg" value="立即注册">
        </div>
   </form>
   </div>
   <p></p>
   <div class="xh-user-register">
   	<a href="index.jsp">首页</a>
   </div>
   <script>
   	  function validate(){
   	  	var pwd1 = document.getElementById("register_register_user_password").value;
   	  	var pwd2 = document.getElementById("register_register_user_repassword").value;
   	  	if(pwd1 == pwd2){
   	  		document.getElementById("btn-register").style.background = "#64c320";
   	  		document.getElementById("btn-register").disabled = false;
   	  		document.getElementById("unmap").innerHTML="";
   	  		
   	  	}else{
   	  		document.getElementById("btn-register").style.background = "#e4e3e1";
   	  		document.getElementById("btn-register").disabled = true;
   	  		document.getElementById("unmap").innerHTML="两次密码不一致";
   	  		
   	  	}
   	  }
   </script>
</body>
</html>