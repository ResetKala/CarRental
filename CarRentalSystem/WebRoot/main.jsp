﻿<%@ page language="java" import="java.util.*" pageEncoding="utf-8" import="java.sql.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
  <meta http-equiv="content-type"content="text/html; charset=utf-8" />
    <base href="<%=basePath%>">
    <title>汽车租赁系统</title>

	<link rel="stylesheet" type="text/css" href="css/main.css">
	<%
	if((String)session.getAttribute("userName")==null){
		out.print("<script language='JavaScript'>alert('请先登录！');window.location.href='index.jsp'</script>");
	}
	%>	
	</head>
  <body>

<%  
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/CarRental?useSSL=false"; 
    String username = "root";
    String password = ""; 
    request.setCharacterEncoding("utf-8");
try {  
       Class.forName(driver); 
       Connection conn = DriverManager.getConnection(url, username, password); 
       if(conn != null){  
    	Statement statement = conn.createStatement();
%>  
  
  <div class="top">
  	<div class="log">
  	<img src="images/logo3.png"/>
  	</div>
  	<div class="search">

	</div>
	</div>

  
  <div class="navigation">
 	<table>
 	<tr>
 	<td><a href='main.jsp' target='_self'>首页</a></td>
 	<td><a href='rentin.jsp' target='_self'>我要租车</a></td>
 	<td><a href='rentout.jsp' target='_self'>我要出租</a></td>
 	<td><a href='help.jsp' target='_self'>用户帮助</a></td>
 	<td><%=request.getSession().getAttribute("userName") %></td>
 	<td><a href='infochange.jsp' target='_self'>修改个人信息</a></td>
 	<td><a href='index.jsp' target='_self'>返回登录</a></td>
 	</tr>
 	</table>
  </div>
  
  <div class="main">
  	<div class="list">
  
  	</div>
  	<div class="info" style="margin-left:0px;">
  	<br>
  	<h2 style="text-align:center">欢迎来到汽车租赁系统！</h2>
  	<hr></hr>
	<p>这里是汽车租赁中心</p>

  	</div>
  </div>
       <%conn.close();
    }
}
catch (Exception e) {        
	e.printStackTrace();  
}   
%>
  <div class ="footer">
  <P><u>COPYRIGHT BY <strong>RESETKALA</strong> ALL RIGHTS RESERVED,邮箱：<strong>871637897@qq.com</strong></u></P>
  </div>
  </body>
</html>