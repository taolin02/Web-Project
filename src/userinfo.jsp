<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html"
    pageEncoding="GB2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" type="text/css"
href="./css/atuser.css" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>UserInfo</title>
</head>
<body>
<% 
Connection conn=null;
String url="jdbc:mysql://localhost:3306/web1";
String user="root";
String passwd="root";
try{
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	conn=DriverManager.getConnection(url,user,passwd);
}catch(Exception e){e.printStackTrace();out.println("数据库驱动加载错误");}
Statement stmt=conn.createStatement();
ResultSet rs=stmt.executeQuery("select *from user where name='"+request.getSession().getAttribute("userinfo")+"'");
rs.next();
%>
<script type="text/javascript">
function show_confirm()
{
var r=confirm("确定修改？");
return r;
}
</script>
<form name="info" onsubmit="return show_confirm()" action="modify.jsp" method="post" >
<h1 style="text-align: center">用户个人信息</h1>
用户名：
<%=rs.getString("name") %>
<br />
<br />
密码：
<input type="text" name="passwd" size="20" value="<%=rs.getString("passwd") %>" />
<br />
<br />
昵称：
<input type="text" name="nick" size="20" value="<%=rs.getString("nickname") %>" />
<br />
<br />
年龄：
<input type="text" name="inage" size="20" value="<%=rs.getInt("age") %>" maxlength="20" />
<br />
<br />
宿舍楼号：
<input type="text" name="usernum" size="20" value="<%=rs.getInt("dormitory") %>" maxlength="20" />
<br />
<br />
备注：
<input type="text" name="inremark" size="20" value="<%=rs.getString("remark") %>" maxlength="20" />
<br />
<br />
<input type="submit" value="修改">
</form>
<%
conn.close();
%>
</body>
</html>