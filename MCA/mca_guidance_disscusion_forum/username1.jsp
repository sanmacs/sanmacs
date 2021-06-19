<%@ page language="java" import="java.sql.*,java.lang.*,java.util.Date,java.util.TimeZone,java.text.SimpleDateFormat" session="true" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<TiTLE>Sanmacs India - MCA Entrance Discussion Forum</TITLE>
<HEAD>
<link rel=stylesheet type=text/css href=toolbar/discussion.css>
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
DIV.Object7 { position:absolute; top:-2px; left:0px; z-index:1;}
DIV.Object8 { position:absolute; top:0px; width:170px; height:400px; overflow:auto; left:330px; z-index:2; border-width:1px; border-style:solid; border-color:red}
DIV.Object9 { position:absolute; top:350px; left:0px; z-index:3;}
</style>
<script>
function openWin(theURL,winName,features) {
window.open(theURL,winName,features);
}
</script>
</HEAD>
<BODY bgcolor="#F4F4F4" topmargin="0" leftmargin="0">

<DIV class="Object7">
<table border=0 cellpadding=0 cellspacing=0 bgcolor=#F4F4F4  width=320>
<tr><th height=10></th></tr>
<tr><th><img src="http://www.sanmacs.com/images2/discussion_forum/profile.gif"></img></th></tr>
<tr><th height=6></th></tr>
<tr><th>
<table border=1 cellpadding=5 cellspacing=0 width=280 bordercolor=white bgcolor=#E4EAF2 align=center>
<%!Connection con;
Statement st,st1,st2,st3;
ResultSet rs,rs1,rs2,rs3;

int checkid;
int conid;

String eid="";
String activity="";
String fullname="",fullname1="";
String mail_id="",mail_id1="";
int profilecounter=0;
%>

<%
	HttpSession rsm=request.getSession(true);
	session.setMaxInactiveInterval(900);

	try {
	checkid=Integer.parseInt(request.getParameter("chk"));

	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	con=DriverManager.getConnection("jdbc:odbc:discussion","","");

	st=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

	st1=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

	st2=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

	st3=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

	rs=st.executeQuery("Select fname,lname,email,country,join_date from User2 where checkid="+checkid+"");
	rs.next();
	eid=rs.getString("email");
%>
<tr height=30><td colspan=2 background="http://www.sanmacs.com/images2/discussion_forum/bg_image.gif"><p id="ftpw" align=center><b><%=rs.getString("fname") %> <%=rs.getString("lname") %></b></p></td></tr>
<tr bgColor=#eef2f7><td><p id="ftp" align="Justify">Location</p></td><td><p id="ftp" align="justify"><%=rs.getString("country") %></p></td></tr>
<tr bgColor=#eef2f7><td><p id="ftp" align="Justify">Join Date</p></td><td><p id="ftp" align="justify"><%=rs.getString("join_date") %></p></td></tr>
<%
	rs2=st2.executeQuery("Select Forum from Thread where User_id='"+eid+"'");
	rs2.last();
%>
<tr bgColor=#eef2f7><td><p id="ftp" align="Justify">Posts</p></td><td><p id="ftp" align="justify"><%=rs2.getRow() %></p></td></tr>
<%
	rs3=st3.executeQuery("Select Reply from Reply where Reply_from='"+eid+"'");
	rs3.last();
%>
<tr bgColor=#eef2f7><td><p id="ftp" align="Justify">Replies</p></td><td><p id="ftp" align="justify"><%=rs3.getRow() %></p></td></tr>
<%
	rs1=st1.executeQuery("Select flag,Last_visit from UserSession where User_id='"+eid+"'");
	rs1.next();
	activity=rs1.getString("flag");
%>
<tr bgColor=#eef2f7><td width=50%><p id="ftp" align="Justify">Last Visit</p></td><td><p id="ftp" align="justify"><%=rs1.getString("Last_visit") %></p></td></tr>
<%
	if (activity.equals("Yes")) {
%>
<tr bgColor=#eef2f7><td width=50%><p id="ftp" align="Justify">Membership</p></td><td><p id="ftp" align="justify">Active</p></td></tr>
<%
	}
	else if(activity.equals("No")) {
%>
<tr bgColor=#eef2f7><td width=50%><p id="ftp" align="Justify">Membership</p></td><td><p id="ftp" align="justify">Inactive</p></td></tr>
<%
	}
%>
</table>
</th></tr>
</table>
</DIV>

<DIV class="Object8">
<table border=1 cellpadding=3 cellspacing=0 bordercolor=white bgcolor=#E4EAF2 align=right width=100%>
<tr><th><p id="ftp" align=center>Inactive User List</p></th></tr>
<%
	Statement stmt=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

	ResultSet rst=stmt.executeQuery("Select fname, lname, email from User2, UserSession where User2.email=UserSession.User_id and flag='No'");

	if (rst.next()==true) {
	rst.previous();
	while(rst.next()) {
	mail_id=rst.getString("email");
	fullname=rst.getString("fname")+" "+rst.getString("lname");
	profilecounter++;
%>
<tr><th><p id="ftp" align=left style="color:blue"><a class="ds" Nohref><%=fullname %></a></p></th></tr>
<%
	}
	profilecounter=0;
	}

	if (activity.equals("Yes")) {

	ResultSet rst1=stmt.executeQuery("Select fname, lname, email from User2, UserSession where User2.email=UserSession.User_id and flag='Yes'");

	if (rst1.next()==true) {
%>
<tr><th><p id="ftp" align=center>Active User List</p></th></tr>
<%
	rst1.previous();
	while(rst1.next()) {
	mail_id1=rst1.getString("email");
	fullname1=rst1.getString("fname")+" "+rst1.getString("lname");
	profilecounter++;
%>
<tr><th><p id="ftp" align=left style="color:blue"><a class="ds" Nohref><%=fullname1 %></a></p></th></tr>
<%
	}
	profilecounter=0;
	}
	}
%>
</table>
</DIV>
<%
	con.close();
	} catch(SQLException se) {
	  out.println("SQL Exception :"+se);
	} catch(ClassNotFoundException ce) {
	  out.println("Class Not Found Exception :"+ce);
	} catch(Exception e) {
	  out.println("General Exception :"+e);
	}
%>

<DIV class="Object9">
<table border=0 cellpadding=0 cellspacing=0 width=330>
<tr><th><a href="javascript:window.close()"><img border=0 src="http://www.sanmacs.com/images2/discussion_forum/close.gif"></a></th></tr>
<tr><th height=8></th></tr>
<tr><th><p id="ftp" align=center STYLE="color:red">All right reserved to <B>SANMACS INDIA</B></p></th></tr>
</table>
</DIV>

</BODY>
</HTML>