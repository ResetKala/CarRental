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
			String carid=request.getParameter("del");
			String sqldel="delete from cars where carid='"+carid+"'";
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
 	<tr><td colspan="10" style="height:40px;  width:900px;" ></td></tr>
 	<tr><td style="height:40px;">车辆id</td><td>车主</td><td>车牌号</td><td>车型号</td><td>车颜色</td><td>出租价格</td><td>出租日期</td><td>租借方</td><td>在库状态</td><td>删除记录</td></tr> 
 <%          
		String sqlshow = "select * from cars";            
        ResultSet rsshow = statement.executeQuery(sqlshow);
        while(rsshow.next())
        {%>
  			<tr style="height:40px;">
 			<td><%= rsshow.getString("carid")%></td>
 			<td><%= rsshow.getString("carowner")%></td>
  			<td><%= rsshow.getString("carnumber")%></td>
  			<td><%= rsshow.getString("cartype")%></td> 
  			<td><%= rsshow.getString("carcolor")%></td> 
  			<td><%= rsshow.getString("rentprice")%></td>
  			<td><%= rsshow.getString("renttime")%></td>
  			<td><%= rsshow.getString("rentout")%></td>
  			<td><%= rsshow.getString("state")%></td>  
 			<td><a href="admin/carsmanage.jsp?del=<%= rsshow.getString("carid")%>" onClick="return confirm('确定删除?');">删除</a></td> 
	  		</tr>
  		<%}
  		rsshow.close();
  		%>
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
