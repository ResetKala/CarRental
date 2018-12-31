<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>登录检测</title>
</head>
<body>
<%//jdbc连接数据库
String driver = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/CarRental?useSSL=false";
String username = "root";
String password = "";
%>
<%request.setCharacterEncoding("utf8"); %>


<% //获得登录界面传来的参数（登录方式、用户名、密码）
	String lv=request.getParameter("lv");
	String name_login = request.getParameter("username");
	String pwd_login = request.getParameter("password");
try
{
	Class.forName(driver);//数据库驱动程序加载
	Connection conn = DriverManager.getConnection(url,username,password); //数据库连接
	if(conn != null)
	{
		out.print("success");
		if(lv.equals("普通用户"))
		{
			String sql = "select * from users where u_name='"+name_login+"'and pwd='"+pwd_login+"'";	
			Statement statement = conn.createStatement();
			ResultSet rs =  statement.executeQuery(sql);
 			if(rs.next())
 			{
		
			session.setAttribute("userName",name_login);
			%>
			<script type='text/javascript'>alert('登录成功！');
			window.location.href='main.jsp';</script>
			<%
 			}else{
			%>
			<script type='text/javascript'>alert('账号名或密码不正确！返回登录页面');
			window.location.href='index.jsp';</script>");
			<% 
 			}
			rs.close();
			statement.close();
		}
		else if(lv.equals("管理员"))
		{
			String sql = "select * from admins where a_name='"+name_login+"'and a_pwd='"+pwd_login+"'";	
			Statement statement = conn.createStatement();
			ResultSet rs =  statement.executeQuery(sql);
 			if(rs.next())
 			{
		
			session.setAttribute("admin",name_login);
			%>
			<script type='text/javascript'>alert('登录成功！');
			window.location.href='admin/admin.jsp';</script>");
			<%
 			}else{
			%>
			<script type='text/javascript'>alert('账号名或密码不正确！返回登录页面');
			window.location.href='index.jsp';</script>");
			<% 
 			}
			rs.close();
			statement.close();
		}
		else{
		out.print(lv);
		}
	conn.close();
	}
}
catch (Exception e)
{
	out.print(e);
}
%>
</body>
</html>