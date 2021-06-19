<%@ page language="java" import="java.sql.*,java.lang.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<TiTLE>Sanmacs India - Sanmacs Previlege - Change Password</TITLE>
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

DIV.Object5 { position:absolute; top:148px; left:181px; width:486px; z-index:4;}

DIV.Object6 { position:absolute; top:148px; left:0px; z-index:5; }

DIV.Object8 { position:absolute; top:545px; left:0px; width:780px; z-index:7;}

DIV.Object11 { position:absolute; top:148px; left:670px; z-index:10;}

</style>
<SCRIPT language=JavaScript src="http://www.sanmacs.com/images2/marquee.js"></SCRIPT>
<SCRIPT language=JavaScript src="http://www.sanmacs.com/images2/sanlogin.js"></SCRIPT>
<script language=JavaScript>
function openWin(theURL,winName,features) {
window.open(theURL,winName,features);
}
</script>
<SCRIPT language=javascript> function noRightClick() { if (event.button==2) { alert("Sorry! Right click is not permitted.") } } document.onmousedown=noRightClick </SCRIPT>
</HEAD>
<BODY bgcolor="#F4F4F4" topmargin="0" leftmargin="0">

<Div class="Object1">
<%@ include file="toplinks.jsp" %>
</Div>

<Div class="Object2">
<embed src="http://www.sanmacs.com/swffiles/mca_identity.swf" wmode=transparent width=467></embed>
</Div>

<%!Connection con;
Statement st;
ResultSet rs;

String old_password="";
String new_password="";
String confirm_password="";
int conid;
String uid="";
%>

<%
	HttpSession rsm=request.getSession(true);
	session.setMaxInactiveInterval(900);

	conid=Integer.parseInt((String)rsm.getValue("connectid"));

	try {

	old_password=request.getParameter("old_pass");
	new_password=request.getParameter("new_pass");

	confirm_password=request.getParameter("confirm_pass");

	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	con=DriverManager.getConnection("jdbc:odbc:discussion","","");

	if (new_password.equals(confirm_password)) {
	if (!new_password.equals(old_password)) {

	st=con.createStatement();
	rs=st.executeQuery("Select email from User2 where checkid="+conid+"");
	rs.next();
	uid=rs.getString("email");

	rsm.putValue("userid",uid);
	rsm.putValue("connectid",""+conid);

	st.executeUpdate("Update Password set password='"+new_password+"' where username='"+uid+"'");
%>
<DIV class="Object5">
<form name=fb method="Post" action="http://www.sanmacs.com/mca_guidance_disscusion_forum/discussion.jsp">
<table border=0 cellspacing=0 cellpadding=0>
<tr><td><img src="http://www.sanmacs.com/images2/change_passwords.gif" width=486></img></td></tr>
<tr><td height=15></td></tr>
<tr><th height=25 background="http://www.sanmacs.com/images2/red_strip.gif"><p id="ftp" align="justify" style="margin-left:5px; color:white">Your password has been successfully changed!</p></th></tr>
<tr><td height=25></td></tr>
<tr><th><img src="http://www.sanmacs.com/images2/discussion_forum/back.gif" style="cursor:hand" onClick="fb.submit()"></img></th></tr>
</table>
</form>
</DIV>
<%	
	}
	else {
%>
<DIV class="Object5">
<table border=0 cellspacing=0 cellpadding=0>
<tr><td><img src="http://www.sanmacs.com/images2/discussion_forum/change_passwords.gif" width=486></img></td></tr>
<tr><td height=15></td></tr>
<tr><th><p id="ftp" align="justify">Password entered in new password field and old password field should be different. Enter password in both the fields properly!</p></th></tr>
<tr><td height=25></td></tr>
<tr><th><a href="http://www.sanmacs.com/mca_guidance_disscusion_forum/changepass.jsp"><img border=0 src="http://www.sanmacs.com/images2/back.gif" name=bck onMouseover="bck.src='http://www.sanmacs.com/images2/back1.gif'" onMouseout="bck.src='http://www.sanmacs.com/images2/back.gif'"></img></a></th></tr>
</table>
</DIV>
<%
	}
	}
	else {
%>
<DIV class="Object5">
<table border=0 cellspacing=0 cellpadding=0>
<tr><td><img src="http://www.sanmacs.com/images2/discussion_forum/change_passwords.gif" width=486></img></td></tr>
<tr><td height=15></td></tr>
<tr><th><p id="ftp" align="justify">Password entered in new password field and confirm password field should be same. Enter password in both the fields properly!</p></th></tr>
<tr><td height=25></td></tr>
<tr><th><a href="http://www.sanmacs.com/mca_guidance_disscusion_forum/changepass.jsp"><img border=0 src="http://www.sanmacs.com/images2/back.gif" name=bck onMouseover="bck.src='http://www.sanmacs.com/images2/back1.gif'" onMouseout="bck.src='http://www.sanmacs.com/images2/back.gif'"></img></a></th></tr>
</table>
</DIV>
<%
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

<Div class="Object6">
<table border=0 cellpadding=0 cellspacing=0>
<tr><td><img src="http://www.sanmacs.com/images2/discussion_forum/expert-panel.gif"></img></td></tr>
<tr><td width=177 height=81 bgcolor=#933900></td></tr>
</table>
</Div>

<DIV class="Object8">
<%@ include file="lowlinks.jsp" %>
</DIV>

<DIV class="Object11">
<table border=0 cellspacing=0 cellpadding=0>
<tr><td><embed src="http://www.sanmacs.com/swffiles/du_pune_toppers.swf" wmode=transparent width=106 height=395></embed></td></tr>
</table>
</DIV>

</BODY>
</HTML>