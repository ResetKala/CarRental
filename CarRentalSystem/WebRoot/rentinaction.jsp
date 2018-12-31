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
    <title>我要出租</title>
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<%
	if((String)session.getAttribute("userName")==null){
		out.print("<script language='JavaScript'>alert('请先登录！');window.location.href='index.jsp'</script>");
	}
	%>
	<script type="text/javascript">
	function check()
	{
		var renttime=docunment.getElementById("renttime").value;
		alert(renttime); 
		if(renttime==''||renttime==null)
		{
			alert("租借时间不能为空");   
       		return false;
		}
		else
   			return true;
	}
	</script>	
	</head>
  
  <body>
<%  String u_name=(String)request.getSession().getAttribute("userName");
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/CarRental?useSSL=false";
       String username = "root"; 
       String password = ""; 
try 
{  
	Class.forName(driver); 
    Connection conn = DriverManager.getConnection(url, username, password);
    if(conn != null)
    {  
    	Statement statement = conn.createStatement();
%>  
		<%request.setCharacterEncoding("utf-8");%>  
		 
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
  			<table>
  			<tr style="height:50px"><td style="background:#c78f8f;border:2px solid #804040;"><a style="color:#fff;" href="rentin.jsp">新增租借车辆</a></td></tr>
  			<tr style="height:50px"><td style="background:#c78f8f;border:2px solid #804040;"><a style="color:#fff;" href="rentinfo.jsp">我的租借情况</a></td></tr>
 			</table>
  			</div>
  	 	
  			<div class="info">
  			<%
  			if(request.getParameter("add")==null)
  			{
  				out.print("<script language='JavaScript'>alert('请先提交租车信息！');window.location.href='rentin.jsp'</script>");
  			}
  			else
  			{
  				String carid=request.getParameter("add");
  				if(request.getParameter("renttime")!=null)
  				{
  					String renttime=request.getParameter("renttime");
  					String state="不在库";
  					String sqladd="update cars set renttime='"+renttime+"',rentout='"+u_name+"',state='"+state+"' where carid="+carid;
  					int flag=0;
  					flag=statement.executeUpdate(sqladd);
  					if(flag > 0)
					{%>
						<script type='text/javascript'>alert('提交成功！');
						window.location.href='rentin.jsp';</script>");
					<%}	
  				}
  				
  				 %>
  			 	<h3>请填写租借时间</h3>
				<form action="rentinaction.jsp" id="carform" onsubmit="return check()">
				<div class="group">
					<label>租车时间</label>
  					<input type="text" name="renttime" id="renttime" placeholder="请输入租车时间"/>
  				</div>
  				<input type="hidden" name="add" value='<%=carid%>'/>
  				<div class="button">
  					<input type="submit" value="提交"/>
  				</div>
  				</form>
  			<%
  			}
  			statement.close();
  			conn.close();
  			%>
  			</div>
  		</div>
<%
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
