<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>注册检查</title>

</head>
<body>
<%
String driver = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/CarRental?useSSL=false";
String username = "root";
String password = "";
request.setCharacterEncoding("utf8");
%>

<% 
	String name_reg = request.getParameter("username");
	String relname=request.getParameter("relname");
	String sex=request.getParameter("sex");
	String idcard=request.getParameter("idcard");
	String phone=request.getParameter("phone");
	String address=request.getParameter("address");
	String pwd_reg = request.getParameter("password");
	
	if(name_reg==null)
	{%>
		<script type='text/javascript'>alert('请注册！');
		window.location.href='reg.jsp';</script>");
	<%}	
%>
<% 
try
{
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url,username,password); 
	if(conn != null)
	{
		Statement statement = conn.createStatement();
		//检测用户名是否已经存在	
		String sql = "select * from users where u_name='"+name_reg+"'";	
		ResultSet rs =  statement.executeQuery(sql);	
		if(rs.next())
		{%>
			<script type='text/javascript'>alert('已存在该用户名！');
			window.location.href='reg.jsp';</script>");
		<%}
		//插入信息
		else
		{
			String sqlinsert = "insert into users value('"+name_reg+"','"+relname+"','"+sex+"','"+idcard+"','"+phone+"','"+address+"','"+pwd_reg+"')";	
			int flag = 0;
			flag = statement.executeUpdate(sqlinsert);
			if(flag > 0)
			{%>
				<script type='text/javascript'>alert('注册成功！');
				window.location.href='index.jsp';</script>");
			<%}	
			statement.close();
			conn.close();		
		}
	}
}
catch (Exception e)
{
	out.print(e);
}
%>
</body>
</html>