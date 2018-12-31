<%@ page language="java" import="java.util.*" pageEncoding="utf-8" import="java.sql.*"%>
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
	if((String)session.getAttribute("admin")==null){
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
 <%
		if(request.getParameter("del")!=null)
		{
			String idcard=request.getParameter("del");
			String sqldel="delete from users where idcard='"+idcard+"'";
			int flag=0;
			flag=statement.executeUpdate(sqldel);
			if(flag>0)
			{%>
				<script type='text/javascript'>alert('删除成功！');
				window.location.href='admin/usersmanage.jsp';</script>");
			<%}	
		} 	
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
 	<td><a href='admin/usersmanage.jsp' target='_self'>用户管理</a></td>
 	<td><a href='admin/carsmanage.jsp' target='_self'>车辆管理</a></td>
 	<td><%=request.getSession().getAttribute("userName") %></td>
 	<td><a href='index.jsp' target='_self'>返回登录</a></td>
 	</tr>
 	</table>
  </div>
  
  <div class="main">
  	<div class="list">
  
  	</div>
  	<div class="info" style="margin-left:0px;">
    	<table border="1" rules="all" style="margin:60px auto;">
 		<tr><td colspan="8" style="height:40px;  width:900px;" ></td></tr>
 		<tr><td style="height:40px;">用户名</td><td>真实姓名</td><td>性别</td><td>身份证</td><td>手机号</td><td>地址</td><td>密码</td><td>删除该用户</td></tr> 
 		<%          
		String sqlshow = "select * from users";            
        ResultSet rsshow = statement.executeQuery(sqlshow);
        while(rsshow.next())
        {%>
  			<tr style="height:40px;">
 			<td><%= rsshow.getString("u_name")%></td>
 			<td><%= rsshow.getString("relname")%></td>
  			<td><%= rsshow.getString("sex")%></td>
  			<td><%= rsshow.getString("idcard")%></td> 
  			<td><%= rsshow.getString("phone")%></td> 
  			<td><%= rsshow.getString("address")%></td>
  			<td><%= rsshow.getString("pwd")%></td>  
 			<td><a href="admin/usersmanage.jsp?del=<%= rsshow.getString("idcard")%>" onClick="return confirm('确定删除?');">删除</a></td> 
	  		</tr>
  		<%}
  		rsshow.close();%>
  		</table>
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