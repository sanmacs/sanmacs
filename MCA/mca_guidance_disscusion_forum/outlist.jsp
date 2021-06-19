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
DIV.Object1 { position:absolute; top:0px; left:0px; z-index:0;}
DIV.Object2 { position:absolute; top:-65px; left:302px; z-index:1;}
DIV.Object3 { position:absolute; top:33px; left:745px; z-index:2; }
DIV.Object4 { position:absolute; top:110px; left:0px; z-index:12; }
DIV.Object5 { position:absolute; top:148px; left:181px; z-index:12;}

DIV.Object6 { position:absolute; top:148px; left:0px; z-index:5; }

DIV.Object7 { position:absolute; top:290px; left:181px; z-index:6; }

DIV.Object8 { position:absolute; top:263px; left:216px; width:85px; z-index:13;}

DIV.Object9 { position:absolute; left:0px; width:780px; z-index:8;}
DIV.Object10 { position:absolute; left:0px; width:780px; z-index:9;}

input {font-family:'Arial, Helvetica, sans-serif'; font-size:11px}
textarea {font-family:'Arial, Helvetica, sans-serif'; font-size:11px}

ul {font-family:'Arial, Helvetica, sans-serif'; font-size:11px; letter-spacing:1px; word-spacing:2px}
</style>

</HEAD>
<BODY bgcolor="#F4F4F4" topmargin="0" leftmargin="0" onMouseout="document.all.Ob8.style.display='none'">

<DIV class="Object1">
<img src="http://www.sanmacs.com/images2/mca_logo.jpg" alt="MCA Entrance"></img>
</DIV>

<DIV class="Object2">
<embed src="http://www.sanmacs.com/swffiles/mca_identity.swf" wmode=transparent width=467></embed>
</DIV>

<DIV class="Object3">
<a href="http://www.sanmacs.com/index.htm"><img src="http://www.sanmacs.com/images2/home.gif" name=imgx onMouseover="imgx.src='http://www.sanmacs.com/images2/home2.gif'" onMouseout="imgx.src='http://www.sanmacs.com/images2/home.gif'" alt=Home border=0></img></a>
</DIV>

<DIV class="Object4">
<SCRIPT type=text/javascript src="http://www.sanmacs.com/images2/mca_menu.js"></SCRIPT>
<NOSCRIPT>Your browser does not support script</NOSCRIPT> <!-- REST OF BODY CONTENT BELOW HERE -->
</DIV>

<%!String chk="";
Connection con;
Statement stmt,stmt1;
ResultSet rs,res,res1;
int contid;
String forum_type="";
String msgfrom="";
Date rece_date;
int counter=0;
int newcount;
String model_data="";
int msgid;
%>

<%
	HttpSession rsm=request.getSession(true);
	session.setMaxInactiveInterval(900);

	chk=(String)rsm.getValue("connectid");
	forum_type=(String)rsm.getValue("ftype");

	rsm.putValue("check",chk);
	rsm.putValue("ftype",forum_type);

	contid=Integer.parseInt(chk);

	try {
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	con=DriverManager.getConnection("jdbc:odbc:discussion","","");

	stmt=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

	stmt1=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

	res=stmt.executeQuery("Select email from User2 where checkid="+contid+"");
	res.next();
	String myeid=res.getString("email");
	rsm.putValue("userid",myeid);

	res1=stmt1.executeQuery("Select flag from UserSession where User_id='"+myeid+"'");
	if (res1.next()==true) {

	String flagr=res1.getString("flag");
	if (flagr.equals("Yes")) {
%>

<DIV class="Object5">
<form name=fb method="Post" action="http://www.sanmacs.com/mca_guidance_disscusion_forum/discussion.jsp">
<table border=0 cellspacing=0 cellpadding=1 width=100%>
<tr><img src="http://www.sanmacs.com/images2/discussion_forum/sanmacs_discussion_forum.gif" width=596></img></td></tr>
<tr><td height=10></td></tr>
<tr><td align=right>
<p id="ftp">
<a Nohref onMouseover="document.all.Ob8.style.display='block'"><img src="http://www.sanmacs.com/images2/discussion_forum/move-to.gif" border=0></img></a> &nbsp; 
<a href="http://www.sanmacs.com/mca_guidance_disscusion_forum/inlist.jsp"><img src="http://www.sanmacs.com/images2/discussion_forum/inbox.gif" border=0></img></a> &nbsp; 
<a href="http://www.sanmacs.com/mca_guidance_disscusion_forum/outlist.jsp"><img src="http://www.sanmacs.com/images2/discussion_forum/outbox.gif" border=0></img></a> &nbsp; 
<a href="javascript:fb.submit()"><img src="http://www.sanmacs.com/images2/discussion_forum/back.gif" border=0></img></a> &nbsp; 
<a href="http://www.sanmacs.com/mca_guidance_disscusion_forum/logout.jsp"><img src="http://www.sanmacs.com/images2/discussion_forum/logout.gif" border=0></img></a>
</p>
</td></tr>
</table>
</form>
</DIV>

<DIV class="Object8" id="Ob8" style="display:none" onMouseover="document.all.Ob8.style.display='block'">
<table border=0 cellspacing=0 cellpadding=0 width=100% bgcolor=#A5C9F9>
<tr><th><p id="ftp"><a class="ds1" href="javascript:deldata1()"><img border=0 src="http://www.sanmacs.com/images2/discussion_forum/sub_inbox.gif"></img></a></p></th></tr>
<tr><th><p id="ftp"><a class="ds1" href="javascript:deldata()"><img border=0 src="http://www.sanmacs.com/images2/discussion_forum/sub_delete.gif"></img></a></p></th></tr>
</table>
</DIV>

<DIV class="Object7">
<form name=f method="Post">
<table border=0 cellpadding=0 cellspacing=0 width=599>
<tr><th>
<table border=1 cellpadding=5 cellspacing=1 width=80% bordercolor=white bgcolor=#E4EAF2>
<tr height=30><th colspan=3 background="http://www.sanmacs.com/images2/discussion_forum/bg_image.gif"><p id="ftpw"><b>OUTBOX</b></p></th></tr>
<%
	rs=stmt.executeQuery("Select msid,sender,rece_date from message where receiver='"+myeid+"' and category='OUTBOX' order by rece_date desc");

	if (rs.next()==true) {
	rs.previous();
%>
<tr>
<th background="http://www.sanmacs.com/images2/discussion_forum/bg_image.gif"><input type=checkbox name=ct value="All" onClick="checkdata()"></th>
<th background="http://www.sanmacs.com/images2/discussion_forum/bg_image.gif"><p id="ftpw">Messsage</p></th>
<th background="http://www.sanmacs.com/images2/discussion_forum/bg_image.gif"><p id="ftpw">Received Date</p></th>
</tr>
<%
	while(rs.next()==true) {
	msgid=rs.getInt("msid");
	msgfrom=rs.getString(2);
	Date rece_date=rs.getTimestamp(3);
%>
<tr>
<th><input type=checkbox name=c<%=counter+1 %> value="<%=msgid %>"></th>
<th><p id="ftp"><a class="ds" href="http://www.sanmacs.com/mca_guidance_disscusion_forum/showinlist.jsp?ppt=abxdtjlkllhjhgdssgfhplllkjgytrtfdhjk5657679898776654545&msid=<%=msgid %>"><%=msgfrom %></a></p></th>
<td><p id="ftp" align=center><%=new SimpleDateFormat("dd-MM-yyyy hh:mm a").format(rece_date) %></p></td>
</tr>
<%
	counter++;
	}
%>
<input type=hidden name=count value="<%=counter %>">
<script>
function checkdata() {
if (f.ct.checked) {
	for(i=1; i<=<%=counter %>; i++) {
	f.elements[i].checked=true;
	}
}
else {
	for(i=1; i<=<%=counter %>; i++) {
	f.elements[i].checked=false;
	}
}
}
<%
	model_data="";	
	for(int i=1; i<=counter; i++) {
	if (i==counter) {
	model_data+="f.elements["+i+"].checked";
	}
	else {
	model_data+="f.elements["+i+"].checked || ";
	}
	}
	//System.out.println(model_data);
%>
function deldata() {
if (<%=model_data %>) {
	if (confirm("Do you really want to delete these messages?")) {
	f.action="http://www.sanmacs.com/mca_guidance_disscusion_forum/delmessage.jsp";
	f.submit();
	}
	else {
	}
}
else {
alert("No message is selected for deletion!");
}
}

function deldata1() {
if (<%=model_data %>) {
	if (confirm("Do you really want to add these messages to inbox?")) {
	f.action="http://www.sanmacs.com/mca_guidance_disscusion_forum/updateinlist.jsp";
	f.submit();
	}
	else {
	}
}
else {
alert("No message is selected to move to outbox!");
}
}

</script>
<%
	model_data="";
	}
	else {
%>
<tr>
<th background="http://www.sanmacs.com/images2/discussion_forum/bg_image.gif"><input type=checkbox name=ct value="All" disabled></th>
<th background="http://www.sanmacs.com/images2/discussion_forum/bg_image.gif"><p id="ftpw">Messsage</p></th>
<th background="http://www.sanmacs.com/images2/discussion_forum/bg_image.gif"><p id="ftpw">Received Date</p></th>
</tr>
<tr><th colspan=3><p id="ftp" align="center" style="color:blue">Outbox Empty!</p></th></tr>
<%	
	}
%>
</table>
</th></tr>
</table>
</form>
</DIV>
<%	}
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

	if (counter > 6) {
	newcount=counter - 6;
	}
	else {
	newcount=0;
	}
	counter=0;
%>

<DIV class="Object6">
<table border=0 cellpadding=0 cellspacing=0>
<tr><td><img src="http://www.sanmacs.com/images2/discussion_forum/expert-panel.gif"></img></td></tr>
<tr><td width=177 height=<%=59+(newcount*27) %> bgcolor=#933900></td></tr>
</table>
</DIV>

<DIV class="Object9" style="top:<%=523+(newcount*27) %>px">
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

<DIV class="Object10" style="top:<%=553+(newcount*27) %>px">
<p id="ft5" align="center" style="BACKGROUND:#D9D5D4; color:#666666; font-weight:bold">All rights reserved. Copyright © Sanmacs India Pvt. Ltd &nbsp;&nbsp;&nbsp;<a href="http://www.sanmacs.com/mca_entrance_legal_disclaimer/Legal.htm" title="MCA Entrance Disclaimer">Legal Disclaimer</a></p>
</DIV>

</BODY>
</HTML>