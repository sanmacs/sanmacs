<%@ page language="java" import="java.sql.*,java.lang.*,java.util.Date,java.util.TimeZone,java.text.SimpleDateFormat" session="true" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<TiTLE>Sanmacs India - MCA Entrance Discussion Forum</TITLE>
<HEAD>
<link rel=stylesheet type=text/css href=http://www.sanmacs.com/images2/sanmacs2.css>
<link rel=stylesheet type=text/css href=http://www.sanmacs.com/images2/sanmacs2.1.css>
<link rel=stylesheet type=text/css href=http://www.sanmacs.com/images2/sanmacs2.2.css>
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<meta http-equiv="Content-Language" content="en-us">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta name="Keywords" content="SANMACS, MCA, MCA Entrance, IIT MCA, MCA Discussion Forum, MCA Notification, MCA Entrance Test, Aligarh Muslim University, Banaras Hindu University, Delhi University, DU MCA ENTRANCE Exam, Megaleap, Career Guidance, Results, Careers, Test Analysis, Exam Deadlines, General Knowledge, career builder, career education, career change, career training, MCA Entrance Notifications, AMU, BHU, Jamia Millia Islamia, Banasthali vidyapith, Bharathiar university,Cochin University, central university, GJU, GOA University, IMT, NCST, NIMC, Jamia Hamdard" >
<meta name="description" content="www.sanmacs.com-The Authority in Test Preparation....Specialization in MCA preparation, free online tests, sectional tips, Information about the university providing MCA Courses all over India, Declared results available on site, admission announcements, coaching, CET Patterns, regular test series, mock tests based on previous and guessed exam patterns, proper correspondence to students, handling query of student with first preference">

<style type="text/css">
DIV.Object7 { position:absolute; top:68px; left:111px; z-index:6; }
input {font-family:'Arial, Helvetica, sans-serif'; font-size:11px}
textarea {font-family:'Arial, Helvetica, sans-serif'; font-size:11px}
</style>

</HEAD>
<BODY bgcolor="#F4F4F4" topmargin="0" leftmargin="0" onLoad="setTimeout(ft.submit,5000)">

<%!String eid="";
int conid;

Connection con;
Statement st,st1,st2;
ResultSet rs,rs1;
%>
<%
	try {
	HttpSession rsm=request.getSession(true);
	session.setMaxInactiveInterval(900);

	conid=Integer.parseInt((String)rsm.getValue("connectid"));

	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	con=DriverManager.getConnection("jdbc:odbc:discussion","","");

	st=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

	st1=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

	st2=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

	rs=st.executeQuery("Select fname,lname,email from User2 where checkid="+conid+"");
	rs.next();
	eid=rs.getString("email");

	rs1=st1.executeQuery("Select flag from UserSession where User_id='"+eid+"'");
	if (rs1.next()==true) {
	String flagr=rs1.getString("flag");
	if (flagr.equals("Yes")) {
	st2.executeUpdate("Update UserSession set flag='No' where User_id='"+eid+"'");
	st2.executeUpdate("Delete from message where (sender='"+eid+"' OR receiver='"+eid+"') and category='CHATBOX'");
	}
	}
%>
<Div class="Object7">
<form name=ft method="get" action="http://www.sanmacs.com/index.htm">
<table border=0 cellpadding=0 cellspacing=0>
<tr><th><p id="ftp" align=center>With in few seconds, you will be redirected to Home.</p></th></tr>
<tr><th height=20></th></tr>
<tr><th>
<table border=1 cellpadding=0 cellspacing=0 width=550 height=250 bordercolor=#C8C7C4 bgcolor=#DBDBD8>
<tr><th height=36 background="http://www.sanmacs.com/images2/discussion_forum/bg_image2.gif"><img src="http://www.sanmacs.com/images2/discussion_forum/redirecting.gif"></img></th></tr>
<tr><th>
<table border=3 cellpadding=0 width=480 height=150 cellspacing=0 bgcolor=#E6E6E3>
<tr><th>
<table border=0 cellpadding=5 cellspacing=0 width=470 bgcolor=#E6E6E3>
<tr><th><p id="ftp"><font color=red><%=rs.getString("fname") %> <%=rs.getString("lname") %></font>! You have logged out now.</p></th></tr>
<tr><th><p id="ftp">If your browser donot support redirection, then please <a class="lt" href="http://www.sanmacs.com/index.htm">Click Here</a>!</p></th></tr>
</table>
</th></tr>
</table>
</th></tr>
</table>
</th></tr>
</table>
</form>
</Div>
<%
	session.setMaxInactiveInterval(0);
	//session.invalidate();

	con.close();
	} catch(SQLException se) {
	  out.println("SQL Exception :"+se);
	} catch(ClassNotFoundException ce) {
	  out.println("Class Not Found Exception :"+ce);
	} catch(Exception e) {
	  out.println("General Exception :"+e);
	}
%>
</BODY>
</HTML>