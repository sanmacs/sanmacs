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

DIV.Object8 { position:absolute; top:1030px; left:0px; width:780px; z-index:7;}
DIV.Object9 { position:absolute; top:1060px; left:0px; width:780px; z-index:8;}

DIV.Object10 { position:absolute; top:144px; left:0px; z-index:9;}
DIV.Object11 { position:absolute; top:148px; left:670px; z-index:10;}

input {font-size:11px}
select {font-size:11px}
textarea {font-size:11px}

</style>
<SCRIPT language=JavaScript src="http://www.sanmacs.com/images2/marquee.js"></SCRIPT>
<SCRIPT Language="Javascript">
function check()
{
	var a;
        a=email(document.f.altmail) && name(document.f.fname) && name(document.f.lname) && mycheckup(document.f.monthadm,"month") && mycheckup(document.f.yearadm,"year") && isDate(); 
	if (a)
	{
		alert("Thanks for submitting the form.");
		selectme();
		f.submit();
	}
	else
	{
		return false;
	}
}

function mycheckup(val1,val2) {
if (val1.selectedIndex<1) {
alert("Select the "+val2+" of admission at SANMACS");
val1.focus();
return false;
}
else {
return true;
}

}

function numeric(val1)
{
	var em,c1,d1,e1,g1,h,str1;
	em = val1.value;
	str1="1234567890-+" + " ";
	c1=em.length;
	if (c1!=0)
	{
    	d1=str1.length;
	 	for (k=0; k<c1; k++)
		{
			e1=em.charAt(k);
			g1=str1.indexOf(e1);
			if (g1 < 0)
			{
				alert ("Enter a valid data.");
				val1.focus();
				val1.select();
				return false;
			}
		}
	}
	return true;
}

function company(val1)
{
	var em,c1,d1,e1,g1,h,str1;
	em=val1.value;
	str1="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890_/.,()[]"+" ";
	c1=em.length;
	if (c1!=0)
	{
    	d1=str1.length;
	 	for (k=0; k<c1; k++)
		{
			e1=em.charAt(k);
			g1=str1.indexOf(e1);
			if (g1 < 0)
			{
				alert ("Enter a valid data.");
				val1.focus();
				val1.select();
				return false;
			}
		}
	}
	return true;
}

function email(val1)
{
	var em,c1,d1,e1,g1,h,str1;
	em=val1.value;
	str1="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890@._";
	c1=em.length;
	if (c1>0) {
    	d1=str1.length;
	 	for (k=0; k<c1; k++)
		{
			e1=em.charAt(k);
			g1=str1.indexOf(e1);
			if (g1 < 0)
			{
				err(val1);
				return false;
			}
		}
		if (em.indexOf('@')<0)
		{
			err(val1);
			return false;
		}
		if (em.charAt(0)=='@')
		{
			err(val1);
			return false;
		}

		if (em.charAt(c1-1)=='.')
		{
			err(val1);
			return false;
		}
		var dat,cnt,cnt1;
		cnt=0;
		cnt1=0;
		for (s=0; s<c1; s++)
		{
			dat=em.charAt(s);
			if (dat=='@')
				cnt=cnt+1;
			if (dat=='.')
				cnt1=cnt1+1;
		}
		if ((cnt >1) || (cnt1>3))
		{
			err(val1);
			return false;
		}
	}
	return true;
}

function home(val1)
{
	var em,c1,d1,e1,g1,h,str1;
	em=val1.value;
	str1="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890.?-_/:" + " ";
	c1=em.length;
	if (c1<1)
	{
    	}
	else
	{
    	d1=str1.length;
	 	for (k=0; k<c1; k++)
		{
			e1=em.charAt(k);
			g1=str1.indexOf(e1);
			if (g1 < 0)
			{
				alert ("Enter a valid Data.");
				val1.focus();
				val1.select();
				return false;
			}
		}
	}
	return true;
}

function name(val1)
{
	var em,c1,d1,e1,g1,h,str1;
	em=val1.value;
	str1="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
	c1=em.length;
	if (c1<1)
	{
    	alert("This field cannot be empty");
  	  	val1.focus();
     	return false;
  	}
	else
	{
    	d1=str1.length;
	 	for (k=0; k<c1; k++)
		{
			e1=em.charAt(k);
			g1=str1.indexOf(e1);
			if (g1 < 0)
			{
				alert ("Enter a valid name.");
				val1.focus();
				val1.select();
				return false;
			}
		}
	}
	return true;
}

function reg(val1)
{
	var em,c1,d1,e1,g1,h,str1;
	em=val1.value;
	str1="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890-/";
	c1=em.length;
	if (c1>=1)
	
	{
    	d1=str1.length;
	 	for (k=0; k<c1; k++)
		{
			e1=em.charAt(k);
			g1=str1.indexOf(e1);
			if (g1 < 0)
			{
				alert ("Enter a valid Data.");
				val1.focus();
				val1.select();
				return false;
			}
		}
	}
	return true;
}

function isDate()
{
	var yy,mm,dd;
	var im,id,iy;
	var present_date = new Date();
	yy = 1900 + present_date.getYear();
	if (yy > 3000)
	{
		yy = yy - 1900;
	}
	mm = present_date.getMonth();
	dd = present_date.getDate();
	im = document.forms[0].birth_month.selectedIndex;
	id = document.forms[0].birth_day.selectedIndex;
	iy = document.forms[0].birth_year.selectedIndex;
	var entered_month = document.forms[0].birth_month.options[im].value;
	var invalid_month = document.forms[0].birth_month.options[im].value-1; 
	var entered_day = document.forms[0].birth_day.options[id].value; 
	var entered_year = document.forms[0].birth_year.options[iy].value; 
	if ( (entered_day == 0) || (entered_month == 0) || (entered_year == 0) )
	{
		alert("Please enter your birthday");
		return false;
	}
	if ( is_greater_date(entered_year,entered_month,entered_day,yy,mm,dd) && is_valid_day(invalid_month,entered_day,entered_year) )
	{
		return true; 
	}
	return false;
}

//Greater day function
function is_greater_date(entered_year,entered_month,entered_day,yy,mm,dd)
{
	if (parseInt(entered_year) > yy)
	{
		alert("The birthday field is entered incorrectly. The year entered exceeds the current year.");
		return false;
	}
	if (parseInt(entered_year) == yy)
	{
		if (parseInt(entered_month) > mm)
		{
			alert("The birthday field is entered incorrectly.");
			return false;
		}
		if (parseInt(entered_month) == mm)
		{
			if (parseInt(entered_day) > dd)
			{
				alert("The birthday field is entered incorrectly.");
				return false;
			}
		}
	}
	return true;
}

// Valid day function
function is_valid_day(entered_month,entered_day,entered_year)
{
	if ((parseInt(entered_year) % 4) == 0) 
	{ 
		var days_in_month = "312931303130313130313031";
 	}
 	else 
	{ 
		var days_in_month = "312831303130313130313031";
 	} 
	var months = new Array("January","February","March","April","May","June","July","August","September","October","November","December");
	if (parseInt(entered_month) != -1)
	{
	var dxt=days_in_month.substring(2*parseInt(entered_month),2*parseInt(entered_month)+2);

		if (parseInt(entered_day) > parseInt(dxt)) {
		alert ("The birthday field is entered wrongly (the day field value exceeds the number of days for the month entered).");
		return false;
		}
	}
	return true;
}

function name1(val1)
{
	var c1;
	c1=val1.value.length;
	if (c1==0)
	 return true;
	else
	{
    	a=name(val1);
    	if (a)
			return true;
		else
			return false;
  	}
}

function err(val1)
{
	alert ("Enter a valid email address.");
	val1.focus();
	val1.select();
}

function selectme() {
var len=f.selections.options.length;
var finsel=" ";
var other="";
if (f.selections.selectedIndex==0) {
f.action="http://www.sanmacs.com/sanmacs_mca_entrance_alumni/final.jsp";
}
else if(f.selections.selectedIndex>=0) {
f.action="http://www.sanmacs.com/sanmacs_mca_entrance_alumni/mca_register.jsp";
for(i=0;i<len;i++) {
if (f.selections.options[i].selected) {
finsel+=f.selections.options[i].value+";";
}
}

if (f.otherinstitute.value != "") {
other=f.otherinstitute.value+";";
}
f.hsel.value=finsel+other;
}
}
</script>
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
<form method="POST" name="f">
<table border=0 cellspacing=0 cellpadding=0>
<tr><td><img src="http://www.sanmacs.com/images2/mca_alumni_registration.gif" width=486 height=74></img></td></tr>
<tr><td height=10></td></tr>
<tr><th><p id="ftp" align="right" style="color:red"></p></th></tr>
<tr><td height=6></td></tr>
<tr><th height=20 background="http://www.sanmacs.com/images2/green_strip.gif"><p id="ftpw" style="margin-left:5px" align="justify">PERSONAL DATA</p></th></tr>
<tr><td height=8></td></tr>
<tr><th>
<%!
	Connection con;
	Statement st;
	ResultSet rs;
	String emailx="";
%>

<%
	emailx=(String)session.getAttribute("emid");
	session.setAttribute("emid",emailx);

	try {

	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	con=DriverManager.getConnection("jdbc:odbc:alumni","","");
	st=con.createStatement();

	rs=st.executeQuery("Select Birth_day, Birth_month, Birth_year from Alumni where Email='"+emailx+"'");
	rs.next();
%>
<table border=1 cellspacing=1 cellpadding=2 bordercolor=orange width=100%>
<tr>
<td> 
<p id="ftp" align="justify">Alternate Email 
Address: </p> 
</td>
<td> 
<p id="ftp" align="justify"> 
	<input maxlength="50" name="altmail" size="30">
</p> 
</td>
</tr>

<tr> 
<td><p id="ftp" align="justify">Phone (Residence):</p></td>
<td height="41"><p id="ftp" align="justify"> 
<input type="text" name="res_isd" size="4" maxlength="4">
&nbsp; 
<input type="text" name="res_std" value autocomplete="off" size="5" maxlength="5">
&nbsp; 
<input type="text" name="res_phone" value autocomplete="off" size="10" maxlength="10">
<br>
ISD&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
STD&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
NO</p></td>
</tr>

<tr> 
<td><p id="ftp" align="justify">Phone (Office):</p></td>
<td height="41"><p id="ftp" align="justify"> 
<input type="text" name="off_isd" size="4" maxlength="4">
&nbsp; 
<input type="text" name="off_std" value autocomplete="off" size="5" maxlength="5">
&nbsp; 
<input type="text" name="off_phone" value autocomplete="off" size="10" maxlength="10">
<br>
ISD&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
STD&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
NO</p></td>
</tr>
<tr> 

<td><p id="ftp" align="justify">First 
name: *</p></td>
<td><p id="ftp" align="justify"> 
<input maxlength="30" name="fname" size="30">
</p></td>
</tr>
<tr> 
<td><p id="ftp" align="justify">Last 
name: *</p></td>
<td><p id="ftp" align="justify"> 
<input maxlength="30" name="lname" size="30">
</p></td>
</tr>
<tr> 
<td height="34"><p id="ftp" align="justify">Registration 
No. at SANMACS:</p></td>
<td height="34"><p id="ftp" align="justify"> 
<input maxlength="10" name="regd_no" size="20">
</p></td>
</tr>

<tr> 
<td><p id="ftp" align="justify">Month &amp; Year of Joining SANMACS: *</p></td>
<td><p id="ftp" align="justify"> 
<select name="monthadm" size="1">
<option></option>
<option value="01">January</option>
<option value="02">February</option>
<option value="03">March</option>
<option value="04">April</option>
<option value="05">May</option>
<option value="06">June</option>
<option value="07">July</option>
<option value="08">August</option>
<option value="09">September</option>
<option value="10">October</option>
<option value="11">November</option>
<option value="12">December</option>
</select>
 <select name="yearadm" size="1">
<option></option>
<script language="JavaScript">
				<!--
				for(var i =1994; i<2011; i++)
				{
					document.write("<option value="+i+">"+i);
				}
				//-->
				</script>
</select>
</p></td>
</tr>

<tr> 
<td valign=top><p id="ftp" align="justify">Selected 
at:</p></td>
<td><p id="ftp" align="justify">
<select multiple name="selections" size="4">
<option selected>Please Select Multiple Values Using Ctrl</option>
<option value="AMU">AMU</option>
<option value="BIT-Mesra">BIT, Mesra</option>
<option value="Banasthali Vidyapith">Banasthali Vidyapith</option>
<option value="BHU">BHU</option>
<option value="Bharathiar University">Bharathiar University</option>
<option value="Bharati Vidyapeeth-Pune">Bharati Vidyapeeth, Pune</option>
<option value="Cochin University-Cochin">Cochin University, Cochin</option>
<option value="Central University-Hyderabad">Central University, Hyderabad</option>
<option value="Dr. B.R.Ambedkar Univ-Agra">Dr. B.R.Ambedkar Univ, Agra</option>
<option value="Guru Nanak Dev Univ-Amritsar">Guru Nanak Dev Univ, Amritsar</option>
<option value="Gurukul Kangri vishwavidalaya-Haridwar">Gurukul Kangri Vishwavidalaya, Haridwar</option>
<option value="Guru Govind Singh Indraprastha Univ">Guru Goving Singh Indraprastha Univ</option>
<option value="Goa University">Goa University</option>
<option value="GJU-Hisar">GJU, Hisar</option>
<option value="IIT-Roorkee">IIT-Roorkee</option>
<option value="IMT-Ghaziabad">IMT, Ghaziabad</option>
<option value="IP University">IP University</option> 
<option value="Jamia Hamdard University">Jamia Hamdard University</option>
<option value="Jawahar Lal Nehru University">Jawahar Lal Nehru University</option>
<option value="Jalgaon University">Jalgaon University</option>
<option value="Kurukshetra University">Kurukshetra University</option>
<option value="MP Combined">MP Combined</option>
<option value="Madurai Kamraj University">Madurai Kamraj University</option>
<option value="Maharshi Dayanand University-Rohtak">Maharshi Dayanand University, Rohtak</option>
<option value="NCST">NCST</option>
<option value="NIMC-Kolkatta">NIMC, Kolkatta</option>
<option value="MNNIT-Allahabad">MNNIT, Allahabad</option>
<option value="MANIT-Bhopal">MANIT, Bhopal</option>
<option value="NIT-Calicut">NIT, Calicut</option>
<option value="NIT-Durgapur">NIT, Durgapur</option>
<option value="NIT-Jamshedpur">NIT, Jamshedpur</option>
<option value="NIT-Rourkela">NIT, Rourkela</option>
<option value="NITK-Surathkal">NITK, Surathkal</option>
<option value="NIT-Tiruchirappalli">NIT, Tiruchirappalli</option>
<option value="NIT-Warangal">NIT, Warangal</option>
<option value="Punjabi University-Patiala">Punjabi University, Patiala</option>
<option value="Pondicherry University">Pondicherry University</option>
<option value="Symbiosis Institute(MSc.-CA)-Pune">Symbiosis Institute(MSc.-CA), Pune</option>
<option value="SCIT(MPIT)">SCIT(MPIT)</option>
<option value="SNDT-Mumbai">SNDT, Mumbai</option>
<option value="Thapar Institute-Patiala">Thapar Institute, Patiala</option>
<option value="Tezpur University-Assam">Tezpur University, Assam</option>
<option value="University of Delhi-South Campus">University of Delhi, South Campus</option>
<option value="University of Jammu">University of Jammu</option>
<option value="University of West Bengal">University of West Bengal</option>
<option value="University of Pune">University of Pune</option>
<option value="University of Delhi(MCA)">University of Delhi(MCA)</option>
<option value="University of Hyderabad">University of Hyderabad</option>
<option value="Vellore Institute of Technology">Vellore Institute of Technology</option>
<option value="VJTI(MCA)">VJTI(MCA)</option>
</select>
<p id="ftp" align="justify">Others:<br>
<input type=text name=otherinstitute size=37></p>
</td>
</tr>
<input type=hidden name=hsel>
<input type=hidden name=chx value=0>
<tr> 
<td><p id="ftp" align="justify">Date 
of Birth:*</p></td>
<td><p id="ftp" align="justify"><font face="Verdana, Arial, Helvetica, sans_serif" size="2"> 
<select name="birth_day" size="1">
<option value=" " selected></option>
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
<option value=" " selected> </option>
<%
String mon[]={"January","February","March","April","May","June","July","August","September","October","November","December"};
String mon1[]={"01","02","03","04","05","06","07","08","09","10","11","12"};
String bm=rs.getString("Birth_month");
for(int m=0; m<12; m++) {
	if(m<9) {
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
<option value=" " selected> </option>
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
<table border=1 cellpadding=2 cellspacing=1 bordercolor=orange width=100%>
<tr> 
<td width=60%><p id="ftp" align="justify">Company: #</p></td>
<td><p id="ftp" align="justify"> 
<input maxlength="30" name="company" size="40">
</p></td>
</tr>
<tr> 
<td><p id="ftp" align="justify">Position/title:</p></td>
<td><p id="ftp" align="justify"> 
<input maxlength="30" name="position" size="22">
</p></td>
</tr>
<tr> 
<td><p id="ftp" align="justify">Country:</p></td>
<td><p id="ftp" align="justify"> 
<select name="work_country" size="1">
<option value="Afghanistan">Afghanistan</option>
<option value="Algeria">Algeria</option>
<option value="Argentina">Argentina</option>
<option value="Australia">Australia</option>
<option value="Austria">Austria</option>
<option value="Azerbaijan">Azerbaijan</option>
<option value="Bangladesh">Bangladesh</option>
<option value="Belgium">Belgium</option>
<option value="Belgium">Bolivia</option>
<option value="Brazil">Brazil</option>
<option value="Brunei Darussalam">Brunei 
Darussalam</option>
<option value="Bulgaria">Bulgaria</option>
<option value="Cambodia">Cambodia</option>
<option value="Canada">Canada</option>
<option value="Chile">Chile</option>
<option value="China">China</option>
<option value="Colombia">Colombia</option>
<option value="Congo">Congo</option>
<option value="Costa Rica">Costa Rica</option>
<option value="Croatia">Croatia</option>
<option value="Cuba">Cuba</option>
<option value="Czech Republic">Czech 
Republic</option>
<option value="Denmark">Denmark</option>
<option value="Dominican Republic">Dominican 
Republic</option>
<option value="Ecuador">Ecuador</option>
<option value="Egypt">Egypt</option>
<option value="El Salvador">El Salvador</option>
<option value="Ethiopia">Ethiopia</option>
<option value="Finland">Finland</option>
<option value="France">France</option>
<option value="French Guiana">French 
Guiana</option>
<option value="Germany">Germany</option>
<option value="Greece">Greece</option>
<option value="Guam">Guam</option>
<option value="Guatemala">Guatemala</option>
<option value="Honduras">Honduras</option>
<option value="Hong Kong">Hong Kong</option>
<option value="Hungary">Hungary</option>
<option value="India" selected>India</option>
<option value="Indonesia">Indonesia</option>
<option value="Iran">Iran</option>
<option value="Iraq">Iraq</option>
<option value="Ireland">Ireland</option>
<option value="Israel">Israel</option>
<option value="Italy">Italy</option>
<option value="Jamaica">Jamaica</option>
<option value="Japan">Japan</option>
<option value="Jordan">Jordan</option>
<option value="Kazakstan">Kazakstan</option>
<option value="Kenya">Kenya</option>
<option value="Korea (North)">Korea 
(North)</option>
<option value="Korea (South)">Korea 
(South)</option>
<option value="Kuwait">Kuwait</option>
<option value="Lithuania">Lithuania</option>
<option value="Luxembourg">Luxembourg</option>
<option value="Macau">Macau</option>
<option value="Malawi">Malawi</option>
<option value="Malaysia">Malaysia</option>
<option value="Mexico">Mexico</option>
<option value="Morocco">Morocco</option>
<option value="Myanmar">Myanmar</option>
<option value="Nepal">Nepal</option>
<option value="Netherlands">Netherlands</option>
<option value="New Zealand">New Zealand</option>
<option value="Nigeria">Nigeria</option>
<option value="Norway">Norway</option>
<option value="Pakistan">Pakistan</option>
<option value="Peru">Peru</option>
<option value="Philippines">Philippines</option>
<option value="Poland">Poland</option>
<option value="Portugal">Portugal</option>
<option value="Puerto Rico">Puerto 
Rico</option>
<option value="Romania">Romania</option>
<option value="Russian Federation">Russian 
Federation</option>
<option value="Rwanda">Rwanda</option>
<option value="Saudi Arabia">Saudi 
Arabia</option>
<option value="Singapore">Singapore</option>
<option value="South Africa">South 
Africa</option>
<option value="Spain">Spain</option>
<option value="Sri Lanka">Sri Lanka</option>
<option value="Sudan">Sudan</option>
<option value="Sweden">Sweden</option>
<option value="Switzerland">Switzerland</option>
<option value="Tanzania">Tanzania</option>
<option value="Thailand">Thailand</option>
<option value="Turkey">Turkey</option>
<option value="Ukraine">Ukraine</option>
<option value="United Arab Emirates">United 
Arab Emirates</option>
<option value="United Kingdom">United 
Kingdom</option>
<option value="United States">United 
States</option>
<option value="Uzbekistan">Uzbekistan</option>
<option value="Venezuela">Venezuela</option>
<option value="Vietnam">Vietnam</option>
<option value="Yemen">Yemen</option>
<option value="Yugoslavia">Yugoslavia</option>
</select>
</p></td>
</tr>
<tr> 
<td height="41"><p id="ftp" align="justify">Phone:</p></td>
<td height="41"><p id="ftp" align="justify"> 
<input type="text" name="work_isd" size="4" maxlength="4">
&nbsp; 
<input type="text" name="work_std" value autocomplete="off" size="5" maxlength="5">
&nbsp; 
<input type="text" name="work_phone" value autocomplete="off" size="10" maxlength="10">
<br>
ISD&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
STD&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
NO</p></td>
</tr>
<tr> 
<td height="34"><p id="ftp" align="justify">Website 
Address :</p></td>
<td height="34"><p id="ftp" align="justify"> 
<input maxlength="60" name="work_webaddress" size="40">
</p></td>
</tr>
<tr> 
<td valign=top><p id="ftp" align="justify">My Experience at SANMACS:</p></td>
<td>
<TEXTAREA NAME=comments rows=2 cols=30></textarea>
</td>
</tr>
<tr> 
<td colspan="2"><p id="ftp" align="justify">
<input type=checkbox name=check1 CHECKED> &nbsp;I would like SANMACS to hightlight my achievements &amp; experience at  SANMACS in electronic or printed form.</p></td>
</tr>

<tr><th colspan=2><p id="ftp" align="left" style="color:red"> <b>*</b> Compulsory Fields <br><br> # Detailed resume for National / International job also be sent as an &nbsp;&nbsp;attachments to jobsit@sanmacs.com.</p>

<align="right"> 
<p align="center"> 
<input name="s1" type="button" onclick="check();" value="Submit">
<input name="s2" type="reset" value="Reset">
</tr>


<!--
<tr> 
<td colspan="2" align="right"> 
<p align="center"> 
<input name="s1" type="button" onclick="check();" value="Submit">
<input name="s2" type="reset" value="Reset">
</td>
</tr>
-->

</table>
</th></tr>
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
<tr><td height=565 width=177 bgcolor=#0d8666></td></tr>
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
<tr><td height=485 width=106 bgcolor=#ef9a4a></td></tr>
</table>
</DIV>

</BODY>
</HTML>