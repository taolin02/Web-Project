<%@ page language="java" contentType="text/html"
    pageEncoding="GB2312"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<html>
<head>
<link rel="stylesheet" type="text/css"
href="./css/atuser.css" />
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
<h2 style="text-align:center">���˵Ĺ���</h2>
<%
java.sql.Date date=new java.sql.Date(new java.util.Date().getTime());
SimpleDateFormat DF = new SimpleDateFormat("yyyy-MM-dd"); 
String storydate=DF.format(date);
String name=(String)request.getSession().getAttribute("userinfo");
rs=stmt.executeQuery("SELECT*from story where Author not in ('"+name +"')");
out.println("<h2>���գ�"+storydate+"</h2>");
while(rs.next())
{
	out.println("��������"+rs.getString("storyname")+"  ���µص㣺"+rs.getString("location")
	+"  ����ʱ�䣺"+rs.getString("happentime"));
	out.println("<br />�������ݣ�");
	out.println("<br />"+rs.getString("storytext"));
	out.println("<br />���ߣ�" +rs.getString("Author")+"<br /><br /><br />");
	}
%>

</body>
</html>