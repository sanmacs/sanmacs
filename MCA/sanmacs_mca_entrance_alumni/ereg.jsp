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

input {font-size:11px}
select {font-size:11px}
textarea {font-size:11px}

input.a {cursor:hand; color:#0415B5; background:#E6E6E6; font-weight:bold; width:50px; border-width:1px; border-color:red}

</style>
<SCRIPT language=JavaScript src="http://www.sanmacs.com/images2/marquee.js"></SCRIPT>
<SCRIPT Language="Javascript">
function check()
{
	var a;
        a=email(document.f.email) && alpnumeric(document.f.gcode); 
	if (a)
	{
		alert("Thanks for submitting the form.");
		f.submit();
	}
	else
	{
		return false;
	}
}

function email(val1)
{
	var em,c1,d1,e1,g1,h,str1;
	em=val1.value;
	str1="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890@._";
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

function alpnumeric(val1)
{
	var em,c1,d1,e1,g1,h,str1;
	em=val1.value;
	str1="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
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

function err(val1)
{
	alert ("Enter a valid email address.");
	val1.focus();
	val1.select();
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
<%!	Connection con;
	Statement st;
	String emailx="";
	String name="";
	String meetid="";

	double gx;
	String gen_code="";
	int gcode;
%>

<%
	emailx=(String)session.getAttribute("emid");
	name=(String)session.getAttribute("nid");

	gx=Math.random()*10000;
	gcode=(int)(gx);
	gen_code=emailx.substring(0,4)+""+gcode;

	//out.println("Satish : "+gen_code);

	try {

	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	con=DriverManager.getConnection("jdbc:odbc:alumni","","");
	st=con.createStatement();

	st.executeUpdate("Update Alumni set gencode='"+gen_code+"' where Email='"+emailx+"'");
	st.executeUpdate("Update Alumni set gen_status=0 where Email='"+emailx+"'");

	meetid=(String)session.getAttribute("getid");

	if (meetid!=null) {
	st.executeUpdate("Update Alumni set alumnimeet='"+meetid+"' where Email='"+emailx+"'");
	}

	//out.println("Data Added!");
	con.close();
	} catch(SQLException se) {
	  out.println("SQL Exception :"+se);
	} catch(ClassNotFoundException ce) {
	  out.println("Class Not Found Exception :"+ce);
	} catch(Exception e) {
	  out.println("General Exception :"+e);
	}

		try {
		String s1="Sanmacs India (Alumni Information) - Auto Generated Code";
		String s2="An auto generated code : "+gen_code;
		String s3="Use this auto generated code given here to add your information in Sanmacs Alumni Area. Click the following link below to continue and enter the auto generated code .....";
		String s13="http://www.sanmacs.com/sanmacs_mca_entrance_alumni/ereg1.jsp";
		String s4="info@sanmacs.com";
		String s=""+emailx;
		String s5="localhost";
		SmtpClient smtpclient = new SmtpClient(s5);
		smtpclient.from(s4);
		smtpclient.to(s);
		PrintWriter printwriter = new PrintWriter(smtpclient.startMessage(), true);
		printwriter.println("From: " + s4);
		printwriter.println("To: " + s);
		printwriter.println("Subject: " + s1);
		printwriter.println(s1);
		printwriter.println(s2);
		printwriter.println(s3);
		printwriter.println(s13);
		smtpclient.closeServer();
		//out.println("Mail Sent....to : " + s);
		} catch(Exception exception) {
		out.println("Mail Sent....Fail");
		out.println("Exception : " + exception);
		}
%>
<DIV class="Object5">
<form method="POST" name="f" action="http://www.sanmacs.com/sanmacs_mca_entrance_alumni/eregister.jsp">
<table border=0 cellspacing=0 cellpadding=0>
<tr><td><img src="http://www.sanmacs.com/images2/mca_alumni_registration.gif" width=486 height=74></img></td></tr>
<tr><td height=15></td></tr>
<tr><th height=20 background="http://www.sanmacs.com/images2/red_strip.gif"><p id="ftpw" style="margin-left:5px" align="justify">AUTO GENERATED CODE</p></th></tr>
<tr><td height=6></td></tr>
<tr><td><p id="ftp" align="justify" style="margin-left:5px; margin-right:5px">An auto - generated mail along with auto generated code is sent to your email id mentioned as below. Enter that code in the field <b>"Code Issued"</b> given below:</p></td></tr>
<tr><th><p id="ftp" align="right" style="color:red; margin-right:5px">Field Names marked * are Compulsory</p></th></tr>
<tr><td height=6></td></tr>
<tr><th height=20 background="http://www.sanmacs.com/images2/green_strip.gif"><p id="ftpw" style="margin-left:5px" align="justify">GENERAL INFORMATION</p></th></tr>
<tr><td height=8></td></tr>
<tr><th>
<table border=0 cellspacing=0 cellpadding=5 bordercolor=orange width=65%>
<tr><th width=50%><p id="ftp" align="left">Email Address*</p></td><td><p id="ftp" align="left"><%=emailx %><input type=hidden name="email" value="<%=emailx %>"><input type=hidden name="name" value="<%=name %>"></p></td></tr>
<tr><th><p id="ftp" align="left">Code Issued*</p></td><td><input type=password name="gcode" maxlength=8 size="24"></td></tr>
</table>
</th></tr>
<tr><th height=12></th></tr>
<tr><th><input class=a name="s1" type="button" onclick="check();" value="Next >>"></th></tr>
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