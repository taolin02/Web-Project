<%@ page language="java" contentType="text/html"
    pageEncoding="GB2312"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
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
String author=(String)request.getParameter("name");
author=new String(author.getBytes("ISO8859-1"),"gb2312");
rs=stmt.executeQuery("select * from user where name='"+author+"'");
if(!rs.next())
{
	response.setContentType("text/html; charset=gb2312");
	out.println("<html><head><meta http-equiv=\"refresh\" content=\"3; url=./atuser.html\"></head>");
	out.println("<body><h2>û������û���������ٹ�ע</h2>");
	out.println("<a href=\"./atuser.html\">3����Զ�������ӹ�ע��û����ת�����ת</a>");
	out.println("</body></html>");
}
else
{	
String ownname=(String)request.getSession().getAttribute("userinfo");
rs=stmt.executeQuery("select * from attention where username='"+ownname+"'and anname='"+author+"'");
if(rs.next())
{
	response.setContentType("text/html; charset=gb2312");
	out.println("<html><head><meta http-equiv=\"refresh\" content=\"3; url=./atuser.html\"></head>");
	out.println("<body><h2>�ѹ�ע�����û�</h2>");
	out.println("<a href=\"./atuser.html\">3����Զ�������ӹ�ע��û����ת�����ת</a>");
	out.println("</body></html>");
}
else
{
int num=0;
num=stmt.executeUpdate("INSERT INTO attention(username,anname) values('"+ownname+"','"+author+"')");
if(num>0)
{
	response.setContentType("text/html; charset=gb2312");
	out.println("<html><head><meta http-equiv=\"refresh\" content=\"3; url=./myat.jsp\"></head>");
	out.println("<body><h2>��ע�ɹ�</h2>");
	out.println("<a href=\"./myat.jsp\">3����Զ���ת�ҹ�ע�����б�û����ת�����ת</a>");
	out.println("</body></html>");
}
else 
{
	response.setContentType("text/html; charset=gb2312");
	out.println("<html><head><meta http-equiv=\"refresh\" content=\"3; url=./atuser.jsp\"></head>");
	out.println("<body><h2>����δ֪ԭ�������û������ٹ�ע</h2>");
	out.println("<a href=\"./atuser.html\">3����Զ�������ӹ�ע��û����ת�����ת</a>");
	out.println("</body></html>");
}
}
}
conn.close();
%>