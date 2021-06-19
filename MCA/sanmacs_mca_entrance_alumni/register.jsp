<%@ page language="java" import="java.sql.*,java.lang.*,java.io.*,sun.net.smtp.SmtpClient" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<TiTLE>Sanmacs India - Alumni Registration</TITLE>
<HEAD>
<link rel=stylesheet type=text/css href=http://www.sanmacs.com/images2/sanmacs2.css>
<link rel=stylesheet type=text/css href=http://www.sanmacs.com/images2/sanmacs2.1.css>
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
DIV.Object3 { position:absolute; top:33px; left:745px; z-index:2; }
DIV.Object4 { position:absolute; top:95px; left:0px; z-index:3; }
DIV.Object5 { position:absolute; top:148px; left:181px; width:486px; z-index:4;}
DIV.Object6 { position:absolute; top:148px; left:0px; z-index:5; }
DIV.Object7 { position:absolute; top:307px; left:4px; z-index:6;}

DIV.Object8 { position:absolute; top:545px; left:0px; width:780px; z-index:7;}
DIV.Object9 { position:absolute; top:575px; left:0px; width:780px; z-index:8;}

DIV.Object10 { position:absolute; top:144px; left:0px; z-index:9;}
DIV.Object11 { position:absolute; top:148px; left:670px; z-index:10;}

</style>
<SCRIPT language=JavaScript src="http://www.sanmacs.com/images2/marquee.js"></SCRIPT>
</HEAD>
<BODY bgcolor="#FFFFFF" topmargin="0" leftmargin="0">

<Div class="Object1">
<img src="http://www.sanmacs.com/images2/mca_logo.jpg" alt="MCA Entrance"></img>
</Div>

<Div class="Object2">
<embed src="http://www.sanmacs.com/swffiles/mca_identity.swf" wmode=transparent width=467></embed>
</Div>

<Div class="Object3">
<a href="http://www.sanmacs.com/index.htm"><img src="http://www.sanmacs.com/images2/home.gif" name=imgx onMouseover="imgx.src='http://www.sanmacs.com/images2/home2.gif'" onMouseout="imgx.src='http://www.sanmacs.com/images2/home.gif'" alt=Home border=0></img></a>
</Div>

<DIV class="Object4">
<SCRIPT type=text/javascript src="http://www.sanmacs.com/images2/mca_menu.js"></SCRIPT>
<NOSCRIPT>Your browser does not support script</NOSCRIPT> <!-- REST OF BODY CONTENT BELOW HERE -->
</DIV>

<DIV class="Object5">
<form method="POST" action="http://www.sanmacs.com/sanmacs_mca_entrance_alumni/reg.jsp" name="f">
<table border=0 cellspacing=0 cellpadding=0>
<tr><td><img src="http://www.sanmacs.com/images2/mca_alumni_registration.gif" width=486 height=74></img></td></tr>
<tr><td height=10></td></tr>
<%!Connection con;
Statement st;
ResultSet rs;

String Email="";
String name="";
int Birth_day;
String Birth_month="";
int Birth_year;

int bday;
String bmonth="";
int byear;
%>
<%
	try {

	Email=request.getParameter("email");
	name=request.getParameter("name");

	Birth_day=Integer.parseInt(request.getParameter("birth_day"));
	Birth_month=request.getParameter("birth_month");
	Birth_year=Integer.parseInt(request.getParameter("birth_year"));

	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	con=DriverManager.getConnection("jdbc:odbc:alumni","","");
	st=con.createStatement();
%>
	<tr><th height=20 background="http://www.sanmacs.com/images2/red_strip.gif"><p id="ftpw" align="left" style="margin-left:5px">Dear <%=name %>,</p></th></tr>
	<tr><td height=10></td></tr>
<%
	rs=st.executeQuery("Select Birth_day, Birth_month, Birth_year from Alumni where Email='"+Email+"'");

	if (rs.next()==false) {
	st.executeUpdate("Insert into Alumni(Email, Birth_day, Birth_month, Birth_year) values('"+Email+"',"+Birth_day+",'"+Birth_month+"',"+Birth_year+")");
	response.sendRedirect("http://www.sanmacs.com/sanmacs_mca_entrance_alumni/reg.jsp");
	session.setAttribute("emid",Email);
	}
	else {
	bday=rs.getInt("Birth_day");
	bmonth=rs.getString("Birth_month");
	byear=rs.getInt("Birth_year");

	if (bday==Birth_day && bmonth.equals(Birth_month) && byear==Birth_year) {
	session.setAttribute("emid",Email);
%>
	<tr><th><p id="ftp">Your information already exists!</p></th></tr>
	<tr><td height=20></td></tr>
	<tr><th><a href="http://www.sanmacs.com/sanmacs_mca_entrance_alumni/edit_profile.jsp"><img src="http://www.sanmacs.com/images2/alumni/edit_profile.gif" name=bck onMouseover="bck.src='http://www.sanmacs.com/images2/alumni/edit_profile1.gif'" onMouseout="bck.src='http://www.sanmacs.com/images2/alumni/edit_profile.gif'" border=0></img></a></th></tr>
<%
	}
	else {
	session.setAttribute("emid",Email);
	session.setAttribute("nid",name);
%>
	<tr><td><p id="ftp" align=justify><b>Information Provided By You</b></p></td></tr>
	<tr><td><p id="ftp" align=justify>Email Id : <font color=#d53f01><b><%=Email %></b></font></p></td></tr>
	<tr><td><p id="ftp" align=justify>Date of Birth : <font color=#d53f01><b><%=Birth_day %>/<%=Birth_month %>/<%=Birth_year %></b></font></p></td></tr>
	<tr><td height=10></td></tr>
	<tr><td><p id="ftp" align=justify>Press <b>correct</b> or <b>incorrect</b> button to continue.....</p></td></tr>
	<tr><td height=20></td></tr>
	<tr>
	<th>
	<a href="http://www.sanmacs.com/sanmacs_mca_entrance_alumni/ereg.jsp"><img src="http://www.sanmacs.com/images2/alumni/correct.gif" name=bck1 onMouseover="bck1.src='http://www.sanmacs.com/images2/alumni/correct1.gif'" onMouseout="bck1.src='http://www.sanmacs.com/images2/alumni/correct.gif'" border=0></img></a>
	<a href="http://www.sanmacs.com/sanmacs_mca_entrance_alumni/register.htm"><img src="http://www.sanmacs.com/images2/alumni/incorrect.gif" name=bckx onMouseover="bckx.src='http://www.sanmacs.com/images2/alumni/incorrect1.gif'" onMouseout="bckx.src='http://www.sanmacs.com/images2/alumni/incorrect.gif'" border=0></img></a>
	</th>
	</tr>
<%
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
</table>
</form>
</DIV>

<Div class="Object6">
<table border=0 cellpadding=0 cellspacing=0>
<tr><td><img src="http://www.sanmacs.com/images2/curve.gif"></img></td></tr>
<tr><td height=81 width=177 bgcolor=#0d8666></td></tr>
</table>
</Div>

<Div class="Object7">
<table border=0 cellpadding=0 cellspacing=0>
<tr><td>
<OBJECT classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width=160 height=140 id="course" ALIGN="">
 <PARAM NAME=movie VALUE="http://www.sanmacs.com/swffiles/course.swf">
 <PARAM NAME=quality VALUE=high>
 <PARAM NAME="wmode" VALUE="transparent">
 <PARAM NAME="SCALE" VALUE="exactfit">
 <PARAM NAME="menu" VALUE="false">
 <EMBED src="http://www.sanmacs.com/swffiles/course.swf" quality=high wmode=transparent width=160 height=140 NAME="course" ALIGN="" TYPE="application/x-shockwave-flash" PLUGINSPAGE="http://www.macromedia.com/go/getflashplayer"> 
 </EMBED>
</OBJECT>
</td></tr>
</table>
</Div>

<DIV class="Object8">
<table border=0 cellspacing=2 cellpadding=0 background="http://www.sanmacs.com/images2/lowstrip.gif" width=100%>
<tr height=30>
<th valign=top><a class="me" href="http://www.sanmacs.com/index.htm" title="Sanmacs Home">Home</a> </th><th><img src="http://www.sanmacs.com/images2/lowerline.gif" height=22></img> </th>
<th valign=top><a class="me" href="http://www.sanmacs.com/mca_entrance_about_us/identity.htm" title="About MCA Entrance">About Us</a> </th><th><img src="http://www.sanmacs.com/images2/lowerline.gif" height=22></img> </th>
<th valign=top><a class="me" href="http://www.sanmacs.com/sanmacs_mca_entrance_course/megaleap.htm" title="Enrollment For MCA Entrance Coaching">Megaleap</a> </th><th><img src="http://www.sanmacs.com/images2/lowerline.gif" height=22></img> </th>
<th valign=top><a class="me" href="http://www.sanmacs.com/mca_entrance_training/mca_entrance_syllabus_of_universities/mca_entrance_syllabus_of_universities.htm" title="Training For MCA Entrance">MCA Training</a> </th><th><img src="http://www.sanmacs.com/images2/lowerline.gif" height=22></img> </th>
<th valign=top><a class="me" href="http://www.sanmacs.com/mca_entrance_notification/mca_entrance_admission_notification.htm" title="Notification For MCA Entrance">Notification</a> </th><th><img src="http://www.sanmacs.com/images2/lowerline.gif" height=22></img> </th>
<th valign=top><a class="me" href="http://www.sanmacs.com/mca_entrance_sanmacs_previlege/sanlogin.htm" title="MCA Entrance Previlege">Sanmacs Previlege</a> </th><th><img src="http://www.sanmacs.com/images2/lowerline.gif" height=22></img> </th>
<th valign=top><a class="me" href="http://www.sanmacs.com/information_for_mca_entrance_students/sanmacs_student_speaks/Student_speaks.htm" title="Student Central For MCA Students">Student Central</a> </th><th><img src="http://www.sanmacs.com/images2/lowerline.gif" height=22></img> </th>
<th valign=top><a class="me" href="http://www.sanmacs.com/mca_entrance_voyage_of_success/mca_entrance_voyage_of_success.htm" title="Success of MCA Entrance">Voyage of Success</a> </th><th><img src="http://www.sanmacs.com/images2/lowerline.gif" height=22></img> </th>
<th valign=top><a class="me" href="http://www.sanmacs.com/sanmacs_mca_entrance_alumni/register.htm" title="MCA Alumni">Alumni</a> </th><th><img src="http://www.sanmacs.com/images2/lowerline.gif" height=22></img> </th>
<th valign=top><a class="me" href="http://www.sanmacs.com/mca_contact/Contact.htm" title="Contact For MCA Training">Contact Us</a> </th>
</tr>
</table>
</DIV>

<DIV class="Object9">
<p id="ft5" align="center" style="BACKGROUND:#D9D5D4; color:#666666; font-weight:bold">All rights reserved. Copyright © Sanmacs India Pvt. Ltd &nbsp;&nbsp;&nbsp;<a href="http://www.sanmacs.com/mca_entrance_legal_disclaimer/Legal.htm" title="MCA Entrance Disclaimer">Legal Disclaimer</a></p>
</DIV>


<DIV class="Object10">
<a href="http://www.sanmacs.com/sanmacs_mca_entrance_course/megaleap.htm"><img src="http://www.sanmacs.com/images2/trans1.gif" border=0 width=173 height=136></img></a>
</DIV>

<DIV class="Object11">
<table border=0 cellpadding=0 cellspacing=0>
<tr><td><embed src="http://www.sanmacs.com/swffiles/mca_results.swf" wmode=transparent width=106 height=395></embed></td></tr>
<tr><td height=1 width=106 bgcolor=#ef9a4a></td></tr>
</table>
</DIV>

</BODY>
</HTML>