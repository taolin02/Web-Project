<%@ page language="java" contentType="text/html"
    pageEncoding="GB2312"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*"%>
<html>
<link rel="stylesheet" type="text/css"
href="./css/frame.css" />
<head>
<title>�ҹ�ע����</title>
</head>
<body>
<%
Connection conn=null;
ResultSet rs=null;
String url="jdbc:mysql://localhost:3306/web1";
String user="root";
String passwd="root";
Statement stmt=null;
try{
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	conn=DriverManager.getConnection(url,user,passwd);
}catch(Exception e){e.printStackTrace();out.println("���ݿ��������ش���");}
stmt=conn.createStatement();
%>
<h2 >�ҹ�ע����</h2>
<%
String name=(String)request.getSession().getAttribute("userinfo");
rs=stmt.executeQuery("SELECT*from attention where username='"+name+"'");
while(rs.next())
{
	out.println("<br />"+rs.getString("anname")+"<br />");
	}
conn.close();
%>

</body>
</html>
