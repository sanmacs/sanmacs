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

DIV.Object7 { position:absolute; top:290px; left:181px; z-index:6; }

DIV.Object9 { position:absolute; left:0px; width:780px; z-index:8;}

input {font-family:'Arial, Helvetica, sans-serif'; font-size:10px}

</style>
<script>
function openWin(theURL,winName,features) {
window.open(theURL,winName,features);
}
</script>
</HEAD>
<BODY bgcolor="#F4F4F4" topmargin="0" leftmargin="0">

<Div class="Object1">
<%@ include file="toplinks.jsp" %>
</Div>

<Div class="Object2">
<embed src="http://www.sanmacs.com/swffiles/mca_identity.swf" wmode=transparent width=467></embed>
</Div>

<%!Connection con;
Statement st,st1,st2,stmt;
ResultSet rst,rs,rs1,rs2;

Statement stmt2,stmt1;
ResultSet res,res1;

String forum_type="";
int checkid;
String head="";
String rep_f="";
String rep_date_time="";
String last_post="";
String eid="";
String full_name="";
String thrd_id="";

String conid="";
int contid;
int counter=0;
int count;
%>
<%
	HttpSession rsm=request.getSession(true);
	session.setMaxInactiveInterval(900);

	forum_type=(String)rsm.getValue("ftype");
	checkid=Integer.parseInt(request.getParameter("check"));
	conid=(String)rsm.getValue("connectid");
	contid=Integer.parseInt(conid);

	try {
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	con=DriverManager.getConnection("jdbc:odbc:discussion","","");

	stmt2=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

	stmt1=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

	res=stmt2.executeQuery("Select email from User2 where checkid="+contid+"");
	res.next();
	String myeid=res.getString("email");

	res1=stmt1.executeQuery("Select flag from UserSession where User_id='"+myeid+"'");
	if (res1.next()==true) {

	String flagr=res1.getString("flag");
	if (flagr.equals("Yes")) {
%>
<DIV class="Object5">
<table border=0 cellspacing=0 cellpadding=1>
<tr><td colspan=2><img src="http://www.sanmacs.com/images2/discussion_forum/sanmacs_discussion_forum.gif" width=596></img></td></tr>
<tr><td colspan=2 height=15></td></tr>
<tr><td width=60%><p id="ftp" align="justify">SANMACS Forum is a value added platform to share opinions, views and queries.</p><td align=right><form name=fb method="Post" action="http://www.sanmacs.com/mca_guidance_disscusion_forum/discussion.jsp"><img src="http://www.sanmacs.com/images2/discussion_forum/back.gif" style="cursor:hand" onClick="fb.submit()" border=0></img> &nbsp;&nbsp; <a href="http://www.sanmacs.com/mca_guidance_disscusion_forum/logout.jsp"><img src="http://www.sanmacs.com/images2/discussion_forum/logout.gif" border=0></img></a></form></td></tr>
</table>
</DIV>
<%
	stmt=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

	st1=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

	st=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

	st2=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

	rst=stmt.executeQuery("Select fname,lname,email from User2 where checkid="+checkid+"");
	rst.next();
	eid=rst.getString("email");
	full_name=rst.getString("fname")+" "+rst.getString("lname");

	rs1=st1.executeQuery("Select Thread_id,Heading,Latest_replyid,Views from Thread where User_id='"+eid+"' and Forum='"+forum_type+"'");
%>
<Div class="Object7">
<table border=1 cellpadding=3 cellspacing=0 width=100% bordercolor=white bgcolor=#E4EAF2>
<tr height=30><td colspan=6 background="http://www.sanmacs.com/images2/discussion_forum/bg_image.gif"><p id="ftpw"><b>General Discussion</b></p></td></tr>
<%
	if (rs1.next()==false) {
	out.println("<tr><th colspan=6><p id='tp'>"+"Queries does not exists!"+"</th></tr>");
	}
	else {
%>
<tr bgColor=#eef2f7 height=30><th background="http://www.sanmacs.com/images2/discussion_forum/bg_image1.gif"><p id="tp">Topic</p></th><th background="http://www.sanmacs.com/images2/discussion_forum/bg_image1.gif"><p id="tp">Topic Starter</p></th><th background="http://www.sanmacs.com/images2/discussion_forum/bg_image1.gif"><p id="tp">Forum</p></th><th background="http://www.sanmacs.com/images2/discussion_forum/bg_image1.gif"><p id="tp">Replies</p></th><th background="http://www.sanmacs.com/images2/discussion_forum/bg_image1.gif"><p id="tp">Views</p></th><th background="http://www.sanmacs.com/images2/discussion_forum/bg_image1.gif"><p id="tp">Last Post</p></th></tr>
<%
	rs1.previous();
	while(rs1.next()) {

	head=rs1.getString("Heading");
	thrd_id=rs1.getString("Thread_id");
	rs=st.executeQuery("Select Reply_from,Reply_date,Reply_time from Reply where Thread_id="+thrd_id+"");

	if (rs.next()==false) {
	last_post="No Reply";
	}
	else {
	rep_f=rs.getString("Reply_from");
	rep_date_time=rs.getString("Reply_date")+" "+rs.getString("Reply_time");

	rs.last();
	rs2=st2.executeQuery("Select fname,lname from User2 where email='"+rep_f+"'");
	rs2.next();
	last_post=rep_date_time + "<br>By "+rs2.getString("fname")+" "+rs2.getString("lname");
	}
	counter++;
%>
<tr><td width=31% onmouseout='this.style.backgroundColor=""' onmouseover="this.style.backgroundColor='#CCE6FF'"><p id="ftp" align="justify"><a class="lt" href="http://www.sanmacs.com/mca_guidance_disscusion_forum/topic.jsp?topic=<%=thrd_id %>"><b><%=head %></b></a></p></td><th width=22% onmouseout='this.style.backgroundColor=""' onmouseover="this.style.backgroundColor='#CCE6FF'"><p id="ftp" align="center"><a class="lt" href='javascript:openWin("http://www.sanmacs.com/mca_guidance_disscusion_forum/username.jsp?chk=<%=checkid %>","profile","toolbar=0,location=0,status=0,menubar=0,scrollbars=0,resizable=0,width=360,height=300")'><%=full_name %></a></p></th><th width=6%><p id="ftp" align="center"><font color=#333399><%=forum_type %></font></p></th><td width=7%><p id="ftp" align="center"><%=rs.getRow() %></p></td><td width=8%><p id="ftp" align="center"><%=rs1.getString("Views") %></p></td><td><p id="ftp" align="center"><%=last_post %></p></td></tr>
<%
	}
	}
%>
</table>
</Div>
<%
	}
	else if(flagr.equals("No")) {
	out.println("<Div class='Object7'><p id='ftp' style='font-weight:bold; margin-left:200px'>You have been logged out!</p></Div>");
	}
	}
	if (counter>4) {
	count=counter-4;
	}
	else {
	count=0;
	}
	counter=0;

	con.close();
	} catch(SQLException se) {
	  out.println("SQL Exception :"+se);
	} catch(ClassNotFoundException ce) {
	  out.println("Class Not Found Exception :"+ce);
	} catch(Exception e) {
	  out.println("General Exception :"+e);
	}
%>

<Div class="Object6">
<table border=0 cellpadding=0 cellspacing=0>
<tr><td><img src="http://www.sanmacs.com/images2/discussion_forum/expert-panel.gif"></img></td></tr>
<tr><td width=177 height=<%=34+(count*40) %> bgcolor=#933900></td></tr>
</table>
</Div>

<DIV class="Object9" style="top:<%=498+(count*40) %>px">
<%@ include file="lowlinks.jsp" %>
</DIV>

</BODY>
</HTML>