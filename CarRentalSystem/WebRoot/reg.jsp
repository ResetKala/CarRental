<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="css/reg.css">
<title>注册界面</title>
<script type="text/javascript">
<!--输入格式检查-->
function check(){
	var name_reg = document.getElementById("username").value;
	var relname=document.getElementById("relname").value;
	var idcard=document.getElementById("idcard").value;
	var phone=document.getElementById("phone").value;
	var address=document.getElementById("address").value;
	var pwd = document.getElementById("password").value;
   	var repwd = document.getElementById("repassword").value;
   	if( name_reg == ''){
       	alert("用户名不能为空");   
       	return false;
  	}
  	else if(relname=='')
   	{
		alert("真实姓名不能为空");
		return false;
   	}
   	else if(idcard=='')
   	{
		alert("身份证不能为空");
		return false;
   	}
   	else if(phone=='')
   	{
		alert("手机号不能为空");
		return false;
   	}
   	else if(address=='')
   	{
		alert("地址不能为空");
		return false;
   	}
   	else if(pwd=='')
   	{
		alert("密码不能为空");
		return false;
   	}
   	else if(repwd=='')
   	{	
   		alert("确认密码不能为空");
   		return false;
   	}
   	else if(pwd!=repwd)
   	{	
   		alert("两次输入的密码不一致");
   		return false;
   	}
   	else
   		return true;
}
</script>
</head>
<body style="background: url(images/Login.jpg)">
<div class="content">
	<div class="panel">
	<h3>注册新用户</h3>
		<form action="regaction.jsp" method="post" onsubmit="return check()">
 		<div class="group"> 
 			<label>账号</label> 
 			<input type="text" name="username" id="username"
 			placeholder="请输入账号"> 
 		</div> 
 		<div class="group"> 
			<label>姓名</label>
  			<input type="text" name="relname" id="relname"
  			placeholder="请输入真实姓名">
   		</div> 
   		<div class="group">
   			<label>性别</label>
   			<input name="sex" type="radio" checked="checked" value="男"/>男
   			<input name="sex" type="radio" value="女" />女
   		</div>
 		<div class="group"> 
			<label>身份证</label>
  			<input type="text" name="idcard" id="idcard"
  			placeholder="请输入身份证">
   		</div> 
   		<div class="group"> 
			<label>手机号</label>
  			<input type="text" name="phone" id="phone"
  			placeholder="请输入手机号">
   		</div> 
   		<div class="group"> 
			<label>地址</label>
  			<input type="text" name="address" id="address"
  			placeholder="请输入家庭地址">
   		</div> 
		<div class="group"> 
			<label>密码</label>
  			<input type="password" name="password" id="password"
  			placeholder="请输入密码">
   		</div> 
   		<div class="group"> 
			<label>确认密码</label>
  			<input type="password" name="repassword" id="repassword"
  			placeholder="请再次输入密码">
   		</div> 
   		
   		<!-- 注册按钮 -->
    	<div class="login">
    		<input type="submit" value="注册"> 
    	</div>  
    </form>
         <form action="index.jsp" method="post">
    <div class="register"> 
    	<input type="submit"  value="返回登录界面"/> 
    </div>
    </form>
    </div> 
 
</div>


</body>
</html>