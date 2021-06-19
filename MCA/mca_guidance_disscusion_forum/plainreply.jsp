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
DIV.Object1 { position:absolute; top:0px; left:0px; z-index:0;}
DIV.Object2 { position:absolute; top:-65px; left:302px; z-index:1;}

DIV.Object5 { position:absolute; top:148px; left:181px; width:484px; z-index:12;}
DIV.Object6 { position:absolute; top:148px; left:0px; z-index:5; }

DIV.Object7 { position:absolute; top:300px; left:181px; z-index:6; }

DIV.Object9 { position:absolute; top:638px; left:0px; width:780px; z-index:8;}

input {font-family:'Arial, Helvetica, sans-serif'; font-size:11px}
textarea {font-family:'Arial, Helvetica, sans-serif'; font-size:11px}
</style>
</HEAD>
<BODY bgcolor="#F4F4F4" topmargin="0" leftmargin="0">

<Div class="Object1">
<%@ include file="toplinks1.jsp" %>
</Div>

<Div class="Object2">
<embed src="http://www.sanmacs.com/swffiles/mca_identity.swf" wmode=transparent width=467></embed>
</Div>

<Div class="Object6">
<table border=0 cellpadding=0 cellspacing=0>
<tr><td><img src="http://www.sanmacs.com/images2/discussion_forum/expert-panel.gif"></img></td></tr>
<tr><td width=177 height=174 bgcolor=#933900></td></tr>
</table>
</Div>

<%!String chk="";
String conid="";
Connection con;
Statement stmt,stmt1;
ResultSet res,res1;

int contid;
String forum_t="";
%>
<%
	HttpSession rsm=request.getSession(true);
	session.setMaxInactiveInterval(900);

	chk=(String)rsm.getValue("my_topic");
	conid=(String)rsm.getValue("connectid");
	forum_t=(String)rsm.getValue("ftype");

	rsm.putValue("ftype",forum_t);
	rsm.putValue("connectid",conid);
	contid=Integer.parseInt(conid);

	rsm.putValue("check",chk);

	try {
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	con=DriverManager.getConnection("jdbc:odbc:discussion","","");

	stmt=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

	stmt1=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

	res=stmt.executeQuery("Select email from User2 where checkid="+contid+"");
	res.next();
	String myeid=res.getString("email");

	res1=stmt1.executeQuery("Select flag from UserSession where User_id='"+myeid+"'");
	if (res1.next()==true) {

	String flagr=res1.getString("flag");
	if (flagr.equals("Yes")) {
%>
<DIV class="Object5">
<table border=0 cellspacing=0 cellpadding=1>
<tr><img src="http://www.sanmacs.com/images2/discussion_forum/sanmacs_discussion_forum.gif" width=596></img></td></tr>
<tr><td height=10></td></tr>
<tr><td align=right>
<table border=0 cellspacing=0 cellpadding=2>
<tr><td align=right>
<form name=fb method="Post" action="http://www.sanmacs.com/mca_guidance_disscusion_forum/discussion.jsp">
<a href="http://www.sanmacs.com/mca_guidance_disscusion_forum/reply.jsp"><img border=0 name=imgth1 src="http://www.sanmacs.com/images2/discussion_forum/plain_mode.gif" onMouseover="imgth1.src='http://www.sanmacs.com/images2/discussion_forum/plain_mode1.gif'" onMouseout="imgth1.src='http://www.sanmacs.com/images2/discussion_forum/plain_mode.gif'" style="cursor:hand"></img></a> &nbsp; 
<a href="http://www.sanmacs.com/mca_guidance_disscusion_forum/plainreply.jsp"><img border=0 name=imgth src="http://www.sanmacs.com/images2/discussion_forum/graphics_mode.gif" onMouseover="imgth.src='http://www.sanmacs.com/images2/discussion_forum/graphics_mode1.gif'" onMouseout="imgth.src='http://www.sanmacs.com/images2/discussion_forum/graphics_mode.gif'" style="cursor:hand"></img></a> &nbsp; 
<img src="http://www.sanmacs.com/images2/discussion_forum/back.gif" onClick="fb.submit()" border=0 style="cursor:hand"></img> &nbsp; 
<a href="http://www.sanmacs.com/mca_guidance_disscusion_forum/logout.jsp"><img src="http://www.sanmacs.com/images2/discussion_forum/logout.gif" border=0></img></a>
</form>
</td></tr>
</table>
</td></tr>
</table>
</DIV>

<Div class="Object7">
<table border=0 cellpadding=0 cellspacing=0 width=599>
<tr><th>
<table border=0 cellpadding=2 cellspacing=2 width=80%>
<tr><th width=30%><p id="ftp" align="justify">Heading</p></th><th></th></tr>
<tr><th valign=top><p id="ftp" align="justify">Reply</p></th><th><%@ include file="replybar.jsp" %></th></tr>
</table>
</th></tr>
</table>
</Div>

<%
	}
	else if(flagr.equals("No")) {
	out.println("<Div class='Object7'><p id='ftp' style='font-weight:bold; margin-left:200px'>You have been logged out!</p></Div>");
	}
	}
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
<%@ include file="lowlinks.jsp" %>
</DIV>

</BODY>
</HTML>