<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/Login.css">
<meta charset="utf-8">
<script type="text/javascript">
function check(){
   var name = document.getElementById("username").value;
   var pwd = document.getElementById("password").value;
   if( name == ''||name==null){
        alert("用户名不能为空");   
        return false;
   }
   else if(pwd==''||pwd==null)
   {
		alert("密码不能为空");
		return false;
   }
   else
   return true;
}
</script>
<title>汽车租赁系统登录界面</title>
</head>
<body style="background: url(images/Login.jpg)">

<div class="content">
	<!-- 登录 -->
	<div class="panel"> 
		<h3>用户登录</h3>
 		<!-- 账号和密码组 --> 
 		<form action="logincheck.jsp" method="post" id="loginform" onsubmit="return check()">
 		<div class="group"> 
 			<label>登录方式</label> 
 			<select name="lv">
 				<option value ="管理员">管理员</option>
 				 <option value ="普通用户" selected="selected">普通用户</option>
 			</select>
 		</div>
 		<div class="group"> 
 			<label>账号</label>
 			<input type="text" name="username" id="username"
 			placeholder="请输入账号"> 
 		</div> 
		<div class="group"> 
			<label>密码</label>
  			<input type="password" name="password" id="password"
  			placeholder="请输入密码">
   		</div> 
   		<!-- 登录按钮 -->
    	<div class="login">
    		<input type="submit"  value="登录"/> 
    	</div> 
    	</form>
    	
        <!-- 注册 --> 
    <form action="reg.jsp" method="post">
    <div class="register"> 
    	<input type="submit"  value="创建新用户"/> 
    </div>
    </form>
   
  </div>
   
</div>
</body>
</html>