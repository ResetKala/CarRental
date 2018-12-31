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
    <title>修改密码</title>
	<link rel="stylesheet" type="text/css" href="css/login.css">
	<%
	if((String)session.getAttribute("userName")==null){
		out.print("<script language='JavaScript'>alert('请先登录！');window.location.href='index.jsp'</script>");
	}
	
	String u_name = (String)session.getAttribute("userName");
	String phone=request.getParameter("phone");
	String address=request.getParameter("address");	
	String o_pwd=request.getParameter("oldpassword");
	String n_pwd=request.getParameter("newpassword");
	%>
	
	</head>
<body>

<%  
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/CarRental?useSSL=false"; //数据库名
       String username = "root";  //数据库用户名
       String password = "";  //数据库用户密码
try 
{  
	Class.forName(driver);  ////驱动程序名 
    Connection conn = DriverManager.getConnection(url, username, password);  //连接状态
    if(conn != null)
    {  
    	Statement statement = conn.createStatement();
    	String sql = "select * from users where u_name='"+u_name+"'and pwd='"+o_pwd+"'";		
		ResultSet rs =  statement.executeQuery(sql);	
 		if(rs.next())
 		{%>			
			<%
 			String sqlupdate = "update users set phone='"+phone+"',address='"+address+"',pwd='"+n_pwd+"' where u_name='"+u_name+"'";	
			int flag=0;
			flag =statement.executeUpdate(sqlupdate);  	
    		if(flag > 0)
			{
			%>	
			<script type='text/javascript'>alert('修改成功！返回登录界面');
			window.location.href='index.jsp';
			</script>
			<%}
			rs.close();
		statement.close();
		conn.close();	
 		}else
 		{
			%>
			<script type='text/javascript'>alert('原密码不正确！返回登录页面');
			window.location.href='infochange.jsp';</script>
			<% 
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