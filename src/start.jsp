<%@ page language="java" contentType="text/html"
    pageEncoding="GB2312"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<html>
<link rel="stylesheet" type="text/css"
href="./css/atuser.css" />
<head>
<title>����</title>
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
<h2 style="text-align:center">�Լ��Ĺ���</h2>
<%
java.sql.Date date=new java.sql.Date(new java.util.Date().getTime());
SimpleDateFormat DF = new SimpleDateFormat("yyyy-MM-dd"); 
String storydate=DF.format(date);
String name=(String)request.getSession().getAttribute("userinfo");
out.println(name);
rs=stmt.executeQuery("SELECT*from story where Author='"+name+"'");
out.println("���գ�"+storydate);
while(rs.next())
{
	out.println("<br /><br />��������"+rs.getString("storyname")+"  ���µص㣺"+rs.getString("location")
	+"  ����ʱ�䣺"+rs.getString("happentime"));
	out.println("<br /><br />�������ݣ�");
	out.println("<br />"+rs.getString("storytext"));
	}
conn.close();
%>

</body>
</html>