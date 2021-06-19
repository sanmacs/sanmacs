<%@ page language="java" import="java.sql.*,java.lang.*" %>

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

DIV.Object8 { position:absolute; left:0px; width:780px; z-index:7;}
DIV.Object9 { position:absolute; left:0px; width:780px; z-index:8;}

DIV.Object10 { position:absolute; top:144px; left:0px; z-index:9;}
DIV.Object11 { position:absolute; top:148px; left:670px; z-index:10;}
DIV.Object12 { position:absolute; top:251px; left:543px; z-index:11;}

input {font-size:11px}
select {font-size:11px}
textarea {font-size:11px}

</style>
<SCRIPT language=JavaScript src="http://www.sanmacs.com/images2/marquee.js"></SCRIPT>
<SCRIPT language=JavaScript src="http://www.sanmacs.com/sanmacs_mca_entrance_alumni/edit_profile.js"></SCRIPT>
<SCRIPT Language="Javascript">
function check()
{
	var a;
        a=name(document.f.fname) && name(document.f.lname) && isDate(); 
	if (a)
	{
		if(confirm("Do you want to update profile?")) {
		alert("Thanks for submitting the form.");
		selectme();
		setact();
		f.submit();
		}
		else {
		alert("Your profile is not updated!");
		f.action="http://www.sanmacs.com/sanmacs_mca_entrance_alumni/register.htm";
		f.submit();
		}
	}
	else {}
}
</script>
</HEAD>
<BODY bgcolor="#FFFFFF" topmargin="0" leftmargin="0" onLoad="edit1()">

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

<%!Connection con;
Statement st;
ResultSet rs;
String email="";
%>

<%
	email=(String)session.getAttribute("emid");
	session.setAttribute("emid",email);

	try {

	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	con=DriverManager.getConnection("jdbc:odbc:alumni","","");
	st=con.createStatement();

	rs=st.executeQuery("Select * from Alumni where Email='"+email+"'");
	rs.next();
%>
<DIV class="Object5">
<form method="POST" name="f">
<table border=0 cellspacing=0 cellpadding=0>
<tr><td><img src="http://www.sanmacs.com/images2/mca_alumni_registration.gif" width=486 height=74></img></td></tr>
<tr><td height=15></td></tr>
<tr><th><p id="ftp" align="right" style="color:red">Field Names marked * are Compulsory</p></th></tr>
<tr><th height=20 background="http://www.sanmacs.com/images2/green_strip.gif"><p id="ftpw" style="margin-left:5px" align="justify">PERSONAL DATA</p></th></tr>
<tr><td height=8></td></tr>
<tr><th>
<table border=1 cellspacing=1 cellpadding=3 bordercolor=orange width=100%>
<tr>
<td><p id="ftp" align="justify">Alternate Email Address:</p></td>
<td><p id="ftp" align="justify"><input maxlength="50" name="altmail" size="30"value="<%=rs.getString("alt_email") %>"></p></td>
</tr>

<tr><td><p id="ftp" align="justify">Phone (Residence):</p></td>
<td height="41"><p id="ftp" align="justify">
<input type="text" name="res_isd" size="4" value="<%=rs.getString("res_isd") %>" maxlength="4">
&nbsp; 
<input type="text" name="res_std" autocomplete="off" value="<%=rs.getString("res_std") %>" size="5" maxlength="5">
&nbsp; 
<input type="text" name="res_phone" autocomplete="off" size="10" value="<%=rs.getString("res_phone") %>" maxlength="10">
<br>
ISD&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
STD&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
NO
</p></td>
</tr>

<tr> 
<td><p id="ftp" align="justify">Phone (Office):</p></td>
<td height="41"><p id="ftp" align="justify"> 
<input type="text" name="off_isd" size="4" value="<%=rs.getString("off_isd") %>" maxlength="4">
&nbsp; 
<input type="text" name="off_std" autocomplete="off" size="5" value="<%=rs.getString("off_std") %>" maxlength="5">
&nbsp; 
<input type="text" name="off_phone" autocomplete="off" size="10" value="<%=rs.getString("off_phone") %>" maxlength="10">
<br>
ISD&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
STD&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
NO
</p></td>
</tr>

<tr> 
<td><p id="ftp" align="justify">First name: *</p></td>
<td><p id="ftp" align="justify"><input maxlength="30" name="fname" value="<%=rs.getString("Fname") %>" size="30"></p></td>
</tr>

<tr> 
<td><p id="ftp" align="justify">Last name: *</p></td>
<td><p id="ftp" align="justify"><input maxlength="30" name="lname" value="<%=rs.getString("Lname") %>" size="30"></p></td>
</tr>

<tr> 
<td height="34"><p id="ftp" align="justify">Registration No. at SANMACS:</p></td>
<td height="34"><p id="ftp" align="justify"><input maxlength="10" name="regd_no" value="<%=rs.getString("Regd_no") %>" size="20"></p></td>
</tr>

<tr>
<td><p id="ftp" align="justify">Month &amp; Year of Joining SANMACS: </p></td>
<td><p id="ftp" align="justify">
<select name="monthadm" size="1">
<%!	String mon[]={"January","February","March","April","May","June","July","August","September","October","November","December"};
	String mon1[]={"01","02","03","04","05","06","07","08","09","10","11","12"};
	String selc[]={"AMU","BIT, Mesra","Banasthali Vidyapith","BHU","Bharathiar University","Bharati Vidyapeeth, Pune","Cochin University, Cochin","Central University, Hyderabad","Dr. B.R.Ambedkar Univ, Agra","Guru Nanak Dev Univ, Amritsar","Gurukul Kangri Vishwavidalaya, Haridwar","Guru Goving Singh Indraprastha Univ","Goa University","GJU, Hisar","IIT-Roorkee","IMT, Ghaziabad","IP University ","Jamia Hamdard University","Jawahar Lal Nehru University","Jalgaon University","Kurukshetra University","MP Combined","Madurai Kamraj University","Maharshi Dayanand University, Rohtak","NCST","NIMC, Kolkatta","MNNIT, Allahabad","MANIT, Bhopal","NIT, Calicut","NIT, Durgapur","NIT, Jamshedpur","NIT, Rourkela","NITK, Surathkal","NIT, Tiruchirappalli","NIT, Warangal","Punjabi University, Patiala","Pondicherry University","Symbiosis Institute(MSc.-CA), Pune","SCIT(MPIT)","SNDT, Mumbai","Thapar Institute, Patiala","Tezpur University, Assam","University of Delhi, South Campus","University of Jammu","University of West Bengal","University of Pune","University of Delhi(MCA)","University of Hyderabad","Vellore Institute of Technology","VJTI(MCA)"};

	String md="";
	int yd;
	String rox[];
	String ranking[];

	String sele="";
	String sx="";
	int orx=0;
	int slen;
	String rx="";
	int jt=0,kt=0;
	int counter;
%>
<%
	md=rs.getString("monthadm");
	for(int m=0; m<12; m++) {
	if(m<=9) {
		if (mon1[m]==md) {
		out.println("<option value=0"+(m+1)+" selected>"+mon[m]+"</option>");
		}
		else {
		out.println("<option value=0"+(m+1)+">"+mon[m]+"</option>");
		}
	}
	else {
		if (mon1[m]==md) {
		out.println("<option value="+(m+1)+" selected>"+mon[m]+"</option>");
		}
		else {
		out.println("<option value="+(m+1)+">"+mon[m]+"</option>");
		}
	}
	}
%>
</select>
<select name="yearadm" size="1">
<%
	yd=rs.getInt("yearadm");

	for(int i =1994; i<2011; i++) {
	if (i==yd) {
	out.println("<option value="+i+" selected>"+i+"</option>");
	}
	else {
	out.println("<option value="+i+">"+i+"</option>");
	}
	}
%>
</select>
</p></td>
</tr>

<tr> 
<td valign=top><p id="ftp" align="justify">Selected at:
<br>
<%
	sele=rs.getString("Selections");
	if (sele==null) {
	}
	else {
	slen=sele.length();

	for(int se=0; se<slen; se++) {
	sx=sele.substring(se,se+1);
	if(sx.equals("|")) {
	orx++;
	}
	}

	if(orx==0) {
	}
	else {
	rox=new String[orx];
	ranking=new String[orx];
	}

	if (orx>0) {
	for(int es=0; es<slen; es++) {
	rx=sele.substring(es,es+1);
	if (rx.equals("|")) {
	String dxt=sele.substring(kt,es);
	int ltme=dxt.length();
	int idext=dxt.indexOf(";");
	int fxdd=ltme-idext;
	rox[jt]=sele.substring(kt,es-fxdd);
	ranking[jt]=sele.substring(es-(fxdd-1),es);

	//out.println(rox[jt]);
	kt=es+1;
	out.println("<input type=checkbox name=c"+jt+" value='"+rox[jt]+"' checked> "+rox[jt]+"<br>");
	out.println("<input type=hidden name=rank"+jt+" value='"+ranking[jt]+"'><br>");
	jt++;
	}
	}
	}

	kt=0;

	if (jt>3) {
	counter=jt-3;
	}
	else {
	counter=0;
	}
	}
%>
<script>
function edit() {
for(tp=0; tp<=<%=(28+(2*jt)) %>; tp++) {
//document.forms[0].elements[tp].disabled=false;
document.f.elements[tp].disabled=false;
}
}

function edit1() {
for(tp=0; tp<=<%=(28+(2*jt)) %>; tp++) {
//document.forms[0].elements[tp].disabled=true;
document.f.elements[tp].disabled=true;
}
}
</script>
<input type=hidden name=chx value="<%=jt %>">
</td>
<td><p id="ftp" align="justify">
<select multiple name="selections" size="4">
<option>Please Select Multiple Values Using Ctrl</option>
<%
	for(int s=0; s<50; s++) {
	out.println("<option value='"+selc[s]+"'>"+selc[s]+"</option>");
	}
%>
</select>
Others:<br>
<input type=text name=otherinstitute size=37></p>
</td>
</tr>
<input type=hidden name=hsel>
<input type=hidden name=hcount>
<script>
function setact() {
var gtpq=f.hcount.value+<%=jt %>;
if (gtpq > 0) {
f.action="http://www.sanmacs.com/sanmacs_mca_entrance_alumni/mca_register.jsp";
}
else {
f.action="http://www.sanmacs.com/sanmacs_mca_entrance_alumni/final.jsp";
}
}
</script>
<tr> 
<td><p id="ftp" align="justify">Date of Birth:*</p></td>
<td><p id="ftp" align="justify"><font face="Verdana, Arial, Helvetica, sans_serif" size="2"> 
<select name="birth_day" size="1">
<option value=" "></option>
<%
int bd=rs.getInt("Birth_day");
for(int t=1; t<=31; t++) {
if (t<=9) {
	if (t==bd) {
	out.println("<option value=0"+t+" selected>"+t+"</option>");
	}
	else {
	out.println("<option value=0"+t+">"+t+"</option>");
	}
}
else {
	if (t==bd) {
	out.println("<option value="+t+" selected>"+t+"</option>");
	}
	else {
	out.println("<option value="+t+">"+t+"</option>");
	}
}
}
%>
</select>
<select name="birth_month" size="1">
<option value=" "> </option>
<%
String bm=rs.getString("Birth_month");
for(int m=0; m<12; m++) {
if(m<=9) {
	if (mon1[m].equals(bm)) {
	out.println("<option value=0"+(m+1)+" selected>"+mon[m]+"</option>");
	}
	else {
	out.println("<option value=0"+(m+1)+">"+mon[m]+"</option>");
	}
}
else {
	if (mon1[m].equals(bm)) {
	out.println("<option value="+(m+1)+" selected>"+mon[m]+"</option>");
	}
	else {
	out.println("<option value="+(m+1)+">"+mon[m]+"</option>");
	}
}
}
%>
</select>
<select name="birth_year" size="1">
<option value=" "> </option>
<%
int by=rs.getInt("Birth_year");

for(int i=1960;i<=1990;i++) {
	if (i==by) {
	out.println("<option value="+i+" selected>"+i+"</option>");
	}
	else {
	out.println("<option value="+i+">"+i+"</option>");
	}
}
%>
</select>
</p></td>
</tr>
</table>
</th></tr>
<tr><td height=8></td></tr>
<tr><th height=20 background="http://www.sanmacs.com/images2/blue_strip.gif"><p id="ftpw" style="margin-left:5px" align="justify">WORK DETAILS</p></th></tr>
<tr><td height=8></td></tr>
<tr><th>
<table border=1 cellpadding=3 cellspacing=1 bordercolor=orange width=100%>
<tr> 
<td><p id="ftp" align="justify">Company:</p></td>
<td><p id="ftp" align="justify"><input maxlength="30" name="company" value="<%=rs.getString("Company") %>" size="40"></p></td>
</tr>

<tr> 
<td><p id="ftp" align="justify">Position/title:</p></td>
<td><p id="ftp" align="justify"><input maxlength="30" name="position" value="<%=rs.getString("Position") %>" size="22"></p></td>
</tr>

<tr> 
<td><p id="ftp" align="justify">Country:</p></td>
<td><p id="ftp" align="justify">
<select name="work_country" size="1">
<%
String coun[]={"Afghanistan","Algeria","Argentina","Australia","Austria","Azerbaijan","Bangladesh","Belgium","Bolivia","Brazil","Brunei Darussalam","Bulgaria","Cambodia","Canada","Chile","China","Colombia","Congo","Costa Rica","Croatia","Cuba","Czech Republic","Denmark","Dominican Republic","Ecuador","Egypt","El Salvador","Ethiopia","Finland","France","French Guiana","Germany","Greece","Guam","Guatemala","Honduras","Hong Kong","Hungary","India","Indonesia","Iran","Iraq","Ireland","Israel","Italy","Jamaica","Japan","Jordan","Kazakstan","Kenya","Korea (North)","Korea (South)","Kuwait","Lithuania","Luxembourg","Macau","Malawi","Malaysia","Mexico","Morocco","Myanmar","Nepal","Netherlands","New Zealand","Nigeria","Norway","Pakistan","Peru","Philippines","Poland","Portugal","Puerto Rico","Romania","Russian Federation","Rwanda","Saudi Arabia","Singapore","South Africa","Spain","Sri Lanka","Sudan","Sweden","Switzerland","Tanzania","Thailand","Turkey","Ukraine","United Arab Emirates","United Kingdom","United States","Uzbekistan","Venezuela","Vietnam","Yemen","Yugoslavia"};

String cn=rs.getString("Work_Country");
for(int c=0; c<=94; c++) {
	if (coun[c].equals(cn)) {
	out.println("<option value="+coun[c]+" selected>"+coun[c]+"</option>");
	}
	else {
	out.println("<option value="+coun[c]+">"+coun[c]+"</option>");
	}
}
%>
</select>
</p></td>
</tr>

<tr> 
<td height="41"><p id="ftp" align="justify">Phone:</p></td>
<td height="41"><p id="ftp" align="justify">
<input type="text" name="work_isd" size="4" value="<%=rs.getString("Work_ISD") %>" maxlength="4">
&nbsp; 
<input type="text" name="work_std" autocomplete="off" size="5" value="<%=rs.getString("work_STD") %>" maxlength="5">
&nbsp; 
<input type="text" name="work_phone" autocomplete="off" size="10" value="<%=rs.getString("Work_Phone") %>" maxlength="10">
<br>
ISD&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
STD&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
NO
</p></td>
</tr>

<tr> 
<td height="34"><p id="ftp" align="justify">Website Address :</p></td>
<td height="34"><p id="ftp" align="justify"><input maxlength="60" name="work_webaddress" value="<%=rs.getString("Work_Web") %>" size="40"></p></td>
</tr>

<tr> 
<td valign=top><p id="ftp" align="justify">My Experience at SANMACS:</p></td>
<td><TEXTAREA NAME=comments rows=2 cols=30><%=rs.getString("Comments") %></textarea></td>
</tr>

<tr> 
<td colspan="2"><p id="ftp" align="justify"><input type=checkbox name=check1 CHECKED> &nbsp;I would like SANMACS to hightlight my achievements &amp; experience at  SANMACS in electronic or printed form.</p></td>
</tr>

</table>
</th></tr>
<tr><th height=15><input type=hidden name=hm value="1"></th></tr>
<tr> 
<td><p align="center"> 
<a href="javascript:edit()"><img src="http://www.sanmacs.com/images2/alumni/edit_profile.gif" name=bck1 onMouseover="bck1.src='http://www.sanmacs.com/images2/alumni/edit_profile1.gif'" onMouseout="bck1.src='http://www.sanmacs.com/images2/alumni/edit_profile.gif'" border=0></img></a>
<a href="javascript:check()"><img src="http://www.sanmacs.com/images2/alumni/update_profile.gif" name=bck onMouseover="bck.src='http://www.sanmacs.com/images2/alumni/update_profile1.gif'" onMouseout="bck.src='http://www.sanmacs.com/images2/alumni/update_profile.gif'" border=0></img></a>
</td>
</tr>
</table>
</form>
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

<Div class="Object6">
<table border=0 cellpadding=0 cellspacing=0>
<tr><td><img src="http://www.sanmacs.com/images2/curve.gif"></img></td></tr>
<tr><td height=<%=(570+(counter*21)) %> width=177 bgcolor=#0d8666></td></tr>
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

<DIV class="Object8" style="top:<%=(1034+(counter*21)) %>px;">
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

<DIV class="Object9" style="top:<%=(1064+(counter*21)) %>px;">
<p id="ft5" align="center" style="BACKGROUND:#D9D5D4; color:#666666; font-weight:bold">All rights reserved. Copyright © Sanmacs India Pvt. Ltd &nbsp;&nbsp;&nbsp;<a href="http://www.sanmacs.com/mca_entrance_legal_disclaimer/Legal.htm" title="MCA Entrance Disclaimer">Legal Disclaimer</a></p>
</DIV>


<DIV class="Object10">
<a href="http://www.sanmacs.com/sanmacs_mca_entrance_course/megaleap.htm"><img src="http://www.sanmacs.com/images2/trans1.gif" border=0 width=173 height=136></img></a>
</DIV>

<DIV class="Object11">
<table border=0 cellpadding=0 cellspacing=0>
<tr><td><embed src="http://www.sanmacs.com/swffiles/mca_results.swf" wmode=transparent width=106 height=395></embed></td></tr>
<tr><td height=<%=(490+(counter*21)) %> width=106 bgcolor=#ef9a4a></td></tr>
</table>
</DIV>

<DIV class="Object12">
<a href="javascript:edit()"><img src="http://www.sanmacs.com/images2/alumni/edit_profile.gif" name=bck1 onMouseover="bck1.src='http://www.sanmacs.com/images2/alumni/edit_profile1.gif'" onMouseout="bck1.src='http://www.sanmacs.com/images2/alumni/edit_profile.gif'" border=0></img></a>
</DIV>

</BODY>
</HTML>