<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="css/Login.css">
<title>修改个人信息</title>
<%
	if((String)session.getAttribute("userName")==null){
		out.print("<script language='JavaScript'>alert('请先登录！');window.location.href='index.jsp'</script>");
	}
	%>	
<script type="text/javascript">
function check(){
	var phone=document.getElementById("phone").value;
	var address=document.getElementById("address").value;
	var oldpwd = document.getElementById("oldpassword").value;
	var newpwd = document.getElementById("newpassword").value;
   	var renewpwd = document.getElementById("renewpassword").value;
   	if(phone=='')
   	{	
   		alert("手机号不能为空");
   		return false;
   	}
   	else if(address=='')
   	{	
   		alert("地址不能为空");
   		return false;
   	}
   	else if( oldpwd == ''){
       	alert("原密码不能为空");   
       	return false;
  	}
   	else if(newpwd=='')
   	{
		alert("新密码不能为空");
		return false;
   	}
   	else if(renewpwd=='')
   	{	
   		alert("确认密码不能为空");
   		return false;
   	}
   	else if(newpwd!=renewpwd)
   	{	
   		alert("两次输入的密码不一致");
   		return false;
   	}
   	else if(newpwd==oldpwd)
   	{	
   		alert("新密码和旧密码相同！");
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
	<h3>修改个人信息</h3>
		<form action="infochangeaction.jsp" method="post" onsubmit="return check()">
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
			<label>旧密码</label>
  			<input type="password" name="oldpassword" id="oldpassword"
  			placeholder="请输入旧密码">
   		</div> 
   		<div class="group"> 
			<label>新密码</label>
  			<input type="password" name="newpassword" id="newpassword"
  			placeholder="请输入新密码">
   		</div> 
   		<div class="group"> 
			<label>确认密码</label>
  			<input type="password" name="renewpassword" id="renewpassword"
  			placeholder="请再次输入新密码">
   		</div> 
   		
   		<!-- 注册按钮 -->
    	<div class="login">
    		<input type="submit" value="提交修改"> 
    	</div>  
    </form>
         <form action="main.jsp" method="post">
    <div class="register"> 
    	<input type="submit"  value="返回"/> 
    </div>
    </form>
    </div> 
 
</div>
</body>
</html>