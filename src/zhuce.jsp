<%@page import="java.sql.*" %>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html"
    pageEncoding="GB2312"%>
<%
Connection conn=null;
int num=0;
String url="jdbc:mysql://localhost:3306/web1";
String user="root";
String passwd="root";
try{
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	conn=DriverManager.getConnection(url,user,passwd);
}catch(Exception e){e.printStackTrace();out.println("���ݿ��������ش���");}
Statement stmt=conn.createStatement();
String name=(String)request.getParameter("uname");
name=new String(name.getBytes("ISO8859-1"),"gb2312");
ResultSet rs=stmt.executeQuery("SELECT passwd FROM user WHERE name='"+name+"'");
if(rs.next())
{
	response.setContentType("text/html; charset=gb2312");
	out.println("<html><head><meta http-equiv=\"refresh\" content=\"5; url=./register.html\"></head>");
	out.println("<body><h2>���ڸ��û��Ѵ��ڣ�ע��ʧ��</h2>");
	out.println("<a href=\"./register.html\">5����Զ���ת��ע��ҳ�棬û����ת�����ת��ҳ��</a>");
	out.println("</body></html>");
conn.close();
	}
else
{
String pw=(String)request.getParameter("paword");
String remark=null,nickname=null;
int age=0,dormitory=0;
if(request.getParameter("inage")!=null&&request.getParameter("inage")!="")
	age=Integer.parseInt((String)request.getParameter("inage"));
	nickname=(String)request.getParameter("nick");
if(request.getParameter("usernum")!=null&&request.getParameter("usernum")!="")
	dormitory=Integer.parseInt((String)request.getParameter("usernum"));
if(request.getParameter("inremark")!=null&&request.getParameter("inremark")!="")
{
	remark=(String)request.getParameter("inremark");
	remark=new String(remark.getBytes("ISO8859-1"),"gb2312");
}
	
	 num=stmt.executeUpdate("INSERT INTO user(name,passwd,age,nickname,dormitory,remark) VALUES ('"+name+"','"+pw+"',"+age+",'"+nickname+"',"+dormitory+",'"+remark+"')");
if(num>0)
{
	session.setAttribute("userinfo", name);
	response.setContentType("text/html; charset=gb2312");
	out.println("<html><head><meta http-equiv=\"refresh\" content=\"5; url=./mainpage.html\"></head>");
	out.println("<body><h2>ע��ɹ�</h2>");
	out.println("<a href=\"./mainpage.html\">5����Զ���ת��û����ת�����ת��ҳ��</a>");
	out.println("</body></html>");
}
else
{
	response.sendRedirect("./register.html");
}
conn.close();
}
%>