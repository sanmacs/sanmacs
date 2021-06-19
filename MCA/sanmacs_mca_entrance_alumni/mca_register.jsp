<%@ page language="java" import="java.sql.*,java.lang.*,java.io.*,java.util.Date,java.util.TimeZone,java.text.SimpleDateFormat,sun.net.smtp.SmtpClient" session="true" %>
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

DIV.Object8 { position:absolute; top:874px; left:0px; width:780px; z-index:7;}
DIV.Object9 { position:absolute; top:904px; left:0px; width:780px; z-index:8;}

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
<form method="POST" action="http://www.sanmacs.com/sanmacs_mca_entrance_alumni/final_register.jsp" name="f">
<table border=0 cellspacing=0 cellpadding=0>
<tr><td><img src="http://www.sanmacs.com/images2/mca_alumni_registration.gif" width=486 height=74></img></td></tr>
<tr><td height=10></td></tr>
<%!Connection con;
Statement st,st1;
ResultSet rs;

String Email="";
String alt_email="";

String res_isd="";
String res_std="";
String res_phone="";
String off_isd="";
String off_std="";
String off_phone="";
String Fname="";
String Lname="";
String Regd_No="";
String Monthadm="";
String Yearadm="";
String Selections="";
//String Finaljoin="";
String Othermca="";
int Birth_day;
String Birth_month="";
int Birth_year;
String Company="";
String Position="";
String Work_Country="";
String Work_ISD="";
String Work_STD="";
String Work_Phone="";
String Work_Web="";
String Comments="";
String Check="";
String p_selection="";
String psel_text="";
int psel;
String psel_check="";
String new_selections="";
String ranking[];
int rank_count=0;
String mon[]={"January","February","March","April","May","June","July","August","September","October","November","December"};
int calmon;
%>
<%
	try {

	Email=(String)session.getAttribute("emid");
	alt_email=request.getParameter("altmail");

	res_isd=request.getParameter("res_isd");
	res_std=request.getParameter("res_std");
	res_phone=request.getParameter("res_phone");

	off_isd=request.getParameter("off_isd");
	off_std=request.getParameter("off_std");
	off_phone=request.getParameter("off_phone");

	Fname=request.getParameter("fname");
	Lname=request.getParameter("lname");

	Regd_No=request.getParameter("regd_no");

	Monthadm=request.getParameter("monthadm");
	Yearadm=request.getParameter("yearadm");

	new_selections=request.getParameter("hsel");
	Othermca=request.getParameter("otherinstitute");

	Birth_day=Integer.parseInt(request.getParameter("birth_day"));
	Birth_month=request.getParameter("birth_month");
	Birth_year=Integer.parseInt(request.getParameter("birth_year"));

	Company=request.getParameter("company");

	Position=request.getParameter("position");

	Work_Country=request.getParameter("work_country");
	Work_ISD=request.getParameter("work_isd");
	Work_STD=request.getParameter("work_std");
	Work_Phone=request.getParameter("work_phone");
	Work_Web=request.getParameter("work_webaddress");

	Comments=request.getParameter("comments");
	Check=request.getParameter("check1");

	psel_text=request.getParameter("chx");
	psel=Integer.parseInt(psel_text);

	ranking=new String[psel];

	for(int pxt=0; pxt<psel; pxt++) {
	psel_check=request.getParameter("c"+pxt);
	if (psel_check==null) {
	}
	else {
	ranking[rank_count]=request.getParameter("rank"+pxt);
	p_selection+=psel_check+";";
	rank_count++;
	//out.println(p_selection);
	}
	}

	rank_count=0;

	if (new_selections==null) {
	Selections=p_selection;
	}
	else if(p_selection==null) {
	Selections=new_selections;
	}
	else {
	Selections=new_selections+""+p_selection;
	}
	//out.println("Satish : "+Selections);

	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	con=DriverManager.getConnection("jdbc:odbc:alumni","","");

	st=con.createStatement();

	st1=con.createStatement();

	st.executeUpdate("Update Alumni set alt_email='"+alt_email+"' where Email='"+Email+"'");
	st.executeUpdate("Update Alumni set res_isd='"+res_isd+"' where Email='"+Email+"'");
	st.executeUpdate("Update Alumni set res_std='"+res_std+"' where Email='"+Email+"'");
	st.executeUpdate("Update Alumni set res_phone='"+res_phone+"' where Email='"+Email+"'");
	st.executeUpdate("Update Alumni set off_isd='"+off_isd+"' where Email='"+Email+"'");
	st.executeUpdate("Update Alumni set off_std='"+off_std+"' where Email='"+Email+"'");
	st.executeUpdate("Update Alumni set off_phone='"+off_phone+"' where Email='"+Email+"'");
	st.executeUpdate("Update Alumni set Fname='"+Fname+"' where Email='"+Email+"'");
	st.executeUpdate("Update Alumni set Lname='"+Lname+"' where Email='"+Email+"'");
	st.executeUpdate("Update Alumni set Regd_No='"+Regd_No+"' where Email='"+Email+"'");
	st.executeUpdate("Update Alumni set Monthadm='"+Monthadm+"' where Email='"+Email+"'");
	st.executeUpdate("Update Alumni set Yearadm='"+Yearadm+"' where Email='"+Email+"'");
	st.executeUpdate("Update Alumni set Selections='"+Selections+"' where Email='"+Email+"'");
	st.executeUpdate("Update Alumni set Othermca='"+Othermca+"' where Email='"+Email+"'");
	st.executeUpdate("Update Alumni set Birth_day="+Birth_day+" where Email='"+Email+"'");
	st.executeUpdate("Update Alumni set Birth_month='"+Birth_month+"' where Email='"+Email+"'");
	st.executeUpdate("Update Alumni set Birth_year="+Birth_year+" where Email='"+Email+"'");
	st.executeUpdate("Update Alumni set Company='"+Company+"' where Email='"+Email+"'");
	st.executeUpdate("Update Alumni set Position='"+Position+"' where Email='"+Email+"'");
	st.executeUpdate("Update Alumni set Work_Country='"+Work_Country+"' where Email='"+Email+"'");
	st.executeUpdate("Update Alumni set Work_ISD='"+Work_ISD+"' where Email='"+Email+"'");
	st.executeUpdate("Update Alumni set work_STD='"+Work_STD+"' where Email='"+Email+"'");
	st.executeUpdate("Update Alumni set Work_Phone='"+Work_Phone+"' where Email='"+Email+"'");
	st.executeUpdate("Update Alumni set Work_Web='"+Work_Web+"' where Email='"+Email+"'");
	st.executeUpdate("Update Alumni set Comments='"+Comments+"' where Email='"+Email+"'");
	st.executeUpdate("Update Alumni set Check1='"+Check+"' where Email='"+Email+"'");

	Date dt=new java.util.Date();
	String Join_date=(dt.getDate())+"/"+(dt.getMonth()+1)+"/"+(dt.getYear()+1900);

	calmon=Integer.parseInt(Birth_month)-1;
	st1.executeUpdate("Insert into User2(fname, lname, email, gender, Birth_day, Birth_month, Birth_year, Join_date) values('"+Fname+"', '"+Lname+"', '"+Email+"', 'Not Define', '"+Birth_day+"', '"+mon[calmon]+"', '"+Birth_year+"', '"+Join_date+"')");
%>
<tr><th height=20 background="http://www.sanmacs.com/images2/red_strip.gif"><p id="ftpw" align="center">Selections And Their Respective Ranks</p></th></tr>
<tr><td height=8></td></tr>
<tr><th>
<table border=3 cellspacing=3 cellpadding=3 bgcolor=#FCF0E4 bordercolor=#ef9a4a bordercolorlight=#EFAA69 bordercolordark=f5821a>
<%
int num=new_selections.length();
int numt=p_selection.length();

String data="";
String data1="";
int ind=0;
int counter=0;

for(int i=0;i<num;i++) {
data=new_selections.substring(i,i+1);
if (data.equals(";")) {
data1=new_selections.substring(ind+1,i);
counter++;
%>
<tr><th><p id="ftp" align="justify"><%=data1 %></p></th><th><input type=text size=5 name="t<%=counter %>"></th></tr>
<%
ind=i;
}
}

ind=0;
data="";
data1="";

for(int i1=0;i1<numt;i1++) {
data=p_selection.substring(i1,i1+1);
if (data.equals(";")) {
data1=p_selection.substring(ind+1,i1);
counter++;
%>
<tr><th><p id="ftp" align="justify"><%=data1 %></p></th><th><input type=text size=5 name=t<%=counter %> value="<%=ranking[rank_count] %>"></th></tr>
<%
rank_count++;
ind=i1;
}
}

ind=0;

%>
</table>
</th></tr>
<tr><th><input type=hidden value="<%=counter %>" name=hcount></th></tr>
<tr><th><input type=hidden value="<%=Email %>" name=hmail></th></tr>
<tr><th><input type=hidden value="<%=Selections %>" name=hselected></th></tr>
<tr><th><input type=hidden value='<%=Fname+" "+Lname %>' name=hname></th></tr>
<tr><td height=12></td></tr>
<tr><th>
<table border=0 cellspacing=0 cellpadding=8>
<tr>
<th><p id="ftp" align="justify">Institution Finally Joined</p></th>
<td><p id="ftp" align="justify">
<select name="finaljoin">
<%
int tnum=Selections.length();
for(int p=0;p<tnum;p++) {
data=Selections.substring(p,p+1);
if (data.equals(";")) {
data1=Selections.substring(ind+1,p);
%>
<option value="<%=data1 %>"><%=data1 %></option>
<%
ind=p;
}
}
ind=0;
%>
</select>
</p></td>
</tr>
<tr><th colspan=2><p id="ftp"><input type=Submit value="Submit"></p></th></tr>
</table>
</th></tr>
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
</table>
</form>
</DIV>

<Div class="Object6">
<table border=0 cellpadding=0 cellspacing=0>
<tr><td><img src="http://www.sanmacs.com/images2/curve.gif"></img></td></tr>
<tr><td height=409 width=177 bgcolor=#0d8666></td></tr>
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
<tr><td height=329 width=106 bgcolor=#ef9a4a></td></tr>
</table>
</DIV>

</BODY>
</HTML>