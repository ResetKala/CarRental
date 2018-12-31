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
    <title>新增出租</title>
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<%
	if((String)session.getAttribute("userName")==null){
		out.print("<script language='JavaScript'>alert('请先登录！');window.location.href='index.jsp'</script>");
	}
	%>

<script type="text/javascript">
function check(){
   var carnumber = document.getElementById("carnumber").value;
   var cartype = document.getElementById("cartype").value;
   var carcolor = document.getElementById("carcolor").value;
   var rentprice = document.getElementById("rentprice").value;
   if( carnumber == ''||carnumber==null){
        alert("车牌不能为空");   
        return false;
   }
   else if(cartype==''||cartype==null)
   {
		alert("车类型不能为空");
		return false;
   }
    else if(carcolor==''||carcolor==null)
   {
		alert("车颜色不能为空");
		return false;
   }
    else if(rentprice==''||rentprice==null)
   {
		alert("租金不能为空");
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
  	<tr style="height:50px"><td style="background:#c78f8f;border:2px solid #804040;"><a style="color:#fff;" href="rentout.jsp">我的出租情况</a></td></tr>
  	<tr style="height:50px"><td style="background:#c78f8f;border:2px solid #804040;"><a style="color:#fff;" href="rentadd.jsp">新增出租车辆</a></td></tr>
 	</table>
  	</div>
  	 	
  	<div class="info">
  	<%
  	if(request.getParameter("add")!=null)
  	{
  		String carnumber=request.getParameter("carnumber");
  		String cartype=request.getParameter("cartype");
  		String carcolor=request.getParameter("carcolor");
  		String rentprice=request.getParameter("rentprice");
  		String state="在库";
  		String sqladd="insert into cars(carowner,carnumber,cartype,carcolor,rentprice,state) values('"+u_name+"','"+carnumber+"','"+cartype+"','"+carcolor+"','"+rentprice+"','"+state+"')";
  		int flag=0;
  		flag=statement.executeUpdate(sqladd);
  		if(flag > 0)
			{%>
				<script type='text/javascript'>alert('提交成功！');
				window.location.href='rentout.jsp';</script>");
			<%}	
  	}
  	 %>
  	 <h3>新增出租车辆信息</h3>
	<form action="rentadd.jsp" id="carform" onsubmit="return check()">
	<div class="group">
		<label>车牌号</label>
  		<input type="text" name="carnumber" id="carnumber" placeholder="请输入车牌号"/>
  	</div>
  	<div class="group">
  		<label>车辆型号</label>
  		<input type="text" name="cartype" id="cartype" placeholder="请输入车辆型号"/>
  	</div>
  	<div class="group">
  		<label>车辆颜色</label>
  		<input type="text" name="carcolor" id="carcolor" placeholder="请输入车辆颜色"/>
  	</div>
  	<div class="group">
  		<label>出租价格</label>
  		<input type="text" name="rentprice" id="rentprice" placeholder="请输入出租价格"/>
  	</div>
  		<input type="hidden" name="add" value="1"/>
  	<div class="button">
  	<input type="submit" value="提交"/>
  	</div>
  	</form>
  	</div>
</div>
<%
	conn.close();
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