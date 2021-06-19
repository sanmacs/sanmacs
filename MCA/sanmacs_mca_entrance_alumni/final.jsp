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

	//String Selections=request.getParameter("hsel");
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

	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	con=DriverManager.getConnection("jdbc:odbc:alumni","","");

	st=con.createStatement();

	st1=con.createStatement();

	rs=st.executeQuery("Select Email from Alumni where Email='"+Email+"'");

	if (rs.next()==true) {

	if (alt_email!=null) {
	st.executeUpdate("Update Alumni set alt_email='"+alt_email+"' where Email='"+Email+"'");
	}

	if (res_isd!=null) {
	st.executeUpdate("Update Alumni set res_isd='"+res_isd+"' where Email='"+Email+"'");
	}

	if (res_std!=null) {
	st.executeUpdate("Update Alumni set res_std='"+res_std+"' where Email='"+Email+"'");
	}

	if (res_phone!=null) {
	st.executeUpdate("Update Alumni set res_phone='"+res_phone+"' where Email='"+Email+"'");
	}

	if (off_isd!=null) {
	st.executeUpdate("Update Alumni set off_isd='"+off_isd+"' where Email='"+Email+"'");
	}

	if (off_std!=null) {
	st.executeUpdate("Update Alumni set off_std='"+off_std+"' where Email='"+Email+"'");
	}

	if (off_phone!=null) {
	st.executeUpdate("Update Alumni set off_phone='"+off_phone+"' where Email='"+Email+"'");
	}

	if (Fname!=null) {
	st.executeUpdate("Update Alumni set Fname='"+Fname+"' where Email='"+Email+"'");
	}

	if (Lname!=null) {
	st.executeUpdate("Update Alumni set Lname='"+Lname+"' where Email='"+Email+"'");
	}

	if (Regd_No!=null) {
	st.executeUpdate("Update Alumni set Regd_No='"+Regd_No+"' where Email='"+Email+"'");
	}

	if (Monthadm!=null) {
	st.executeUpdate("Update Alumni set Monthadm='"+Monthadm+"' where Email='"+Email+"'");
	}

	if (Yearadm!=null) {
	st.executeUpdate("Update Alumni set Yearadm='"+Yearadm+"' where Email='"+Email+"'");
	}

	st.executeUpdate("Update Alumni set Selections='null' where Email='"+Email+"'");

	if (Othermca!=null) {
	st.executeUpdate("Update Alumni set Othermca='"+Othermca+"' where Email='"+Email+"'");
	}

	st.executeUpdate("Update Alumni set Birth_day="+Birth_day+" where Email='"+Email+"'");

	if (Birth_month!=null) {
	st.executeUpdate("Update Alumni set Birth_month='"+Birth_month+"' where Email='"+Email+"'");
	}

	st.executeUpdate("Update Alumni set Birth_year="+Birth_year+" where Email='"+Email+"'");

	if (Company!=null) {
	st.executeUpdate("Update Alumni set Company='"+Company+"' where Email='"+Email+"'");
	}

	if (Position!=null) {
	st.executeUpdate("Update Alumni set Position='"+Position+"' where Email='"+Email+"'");
	}

	if (Work_Country!=null) {
	st.executeUpdate("Update Alumni set Work_Country='"+Work_Country+"' where Email='"+Email+"'");
	}

	if (Work_ISD!=null) {
	st.executeUpdate("Update Alumni set Work_ISD='"+Work_ISD+"' where Email='"+Email+"'");
	}

	if (Work_STD!=null) {
	st.executeUpdate("Update Alumni set work_STD='"+Work_STD+"' where Email='"+Email+"'");
	}
	if (Work_Phone!=null) {
	st.executeUpdate("Update Alumni set Work_Phone='"+Work_Phone+"' where Email='"+Email+"'");
	}

	if (Work_Web!=null) {
	st.executeUpdate("Update Alumni set Work_Web='"+Work_Web+"' where Email='"+Email+"'");
	}

	if (Comments!=null) {
	st.executeUpdate("Update Alumni set Comments='"+Comments+"' where Email='"+Email+"'");
	}

	if (Check!=null) {
	st.executeUpdate("Update Alumni set Check1='"+Check+"' where Email='"+Email+"'");
	}

	String password=Fname.substring(0,2)+""+(int)(Math.random()*1000)+""+Email.substring(0,3);

	Date dt=new java.util.Date();
        SimpleDateFormat sdf=new SimpleDateFormat("hh:mm a");
        String zone="IST";
        TimeZone tz=TimeZone.getTimeZone(zone);
        sdf.setTimeZone(tz);
        String time1=sdf.format(dt);
	String Join_date=(dt.getDate())+"/"+(dt.getMonth()+1)+"/"+(dt.getYear()+1900);
	String date_time=Join_date+" "+time1;

	calmon=Integer.parseInt(Birth_month)-1;
	st1.executeUpdate("Insert into User2(fname, lname, email, gender, Birth_day, Birth_month, Birth_year, Join_date) values('"+Fname+"', '"+Lname+"', '"+Email+"', 'Not Define', '"+Birth_day+"', '"+mon[calmon]+"', '"+Birth_year+"', '"+Join_date+"')");
	st1.executeUpdate("Insert into Password values('"+Email+"','"+password.toUpperCase()+"')");
	st1.executeUpdate("Insert into UserSession values('"+Email+"','"+date_time+"',0,'No')");

		try {
		String x1="Discussion Forum Userid And Password";
		String x2="Userid : "+Email;
		String x3="Password : "+password;
		String x31="Alumni's of Sanmacs, You are getting an option to be member of Sanmacs discussion forum and share their opinions and experiences with their junior fellow students studying in Sanmacs India. You can participate in the discussion and help your juniors to sort out their problems and queries.";

		String x4="info@sanmacs.com";
		String x=""+Email;
		String x5="localhost";
		SmtpClient smtpclient = new SmtpClient(x5);
		smtpclient.from(x4);
		smtpclient.to(x);
		PrintWriter printwriter = new PrintWriter(smtpclient.startMessage(), true);
		printwriter.println("From: " + x4);
		printwriter.println("To: " + x);
		printwriter.println("Subject: " + x1);

		printwriter.println(x1);
		printwriter.println("------------------------------------");
		printwriter.println(x31);
		printwriter.println(x2);
		printwriter.println(x3);

		printwriter.println(" ");
		printwriter.println(" ");
		printwriter.println(" ");
		printwriter.println(" ");
		printwriter.println("Thanks");
		printwriter.println("Computer Department");
		printwriter.println("Sanmacs India");

		smtpclient.closeServer();
		//out.println("Mail Sent....to : " + x);
		} catch(Exception exception) {
		out.println("Mail Sent....Fail");
		out.println("Exception : " + exception);
		}
%>
<table border=0 cellspacing=0 cellpadding=0>
<tr><td><img src="http://www.sanmacs.com/images2/mca_alumni_registration.gif" width=486 height=74></img></td></tr>
<tr><td height=8></td></tr>
<tr><th><p id="ftp" align="justify" style="color:red">Dear <%=Fname %> <%=Lname %>,</p></th></tr>
<tr><td height=6></td></tr>
<tr><td><p id="ftp" align="justify">SANMACS INDIA's association with the students never withers away after the term or session of the coaching is over. It is a never ending relation for lifetime. In fact, over the past several golden and dedicated years SANMACS INDIA has formed an ALUMNI of its own where the old SANMACSIANS on being approached or contacted by the fresh accomplished MCAs, furnish a plethora of information for better job opportunities and career-facilities. This privilege is available to the SANMACSIANS only, nobody else. SANMACS INDIA stands as a Linkage between the established software professionals and the aspiring MCA entrants.</p></td></tr>
<tr><td height=4></td></tr>
<tr><td><p id="ftp" align="justify">If you would like to contact us directly in the future, you can contact us at:</p></td></tr>
<tr><td height=4></td></tr>
<tr><td><p id="ftp" align="justify">91-11-32917966, 28757630, 28757911, 32522575.</p></td></tr>
<tr><td height=4></td></tr>
<tr><td><p id="ftp" align="justify"><b>OR</b></p></td></tr>
<tr><td height=4></td></tr>
<tr><td><p id="ftp" align="justify"><b>Email us at:</b> info@sanmacs.com or webmaster@sanmacs.com</p></td></tr>
<tr><td height=8></td></tr>
<tr><td><p id="ftp" align="justify">Sincerely,</p></td></tr>
<tr><td height=2></td></tr>
<tr><th><p id="ftp" align="justify">Director</p></th></tr>
<tr><td height=2></td></tr>
<tr><th><p id="ftp" align="justify">Sanmacs India</p></th></tr>
<tr><td height=6></td></tr>
<tr><th><a href="http://www.sanmacs.com/index.htm"><img src="http://www.sanmacs.com/images2/back.gif" name=bck onMouseover="bck.src='http://www.sanmacs.com/images2/back1.gif'" onMouseout="bck.src='http://www.sanmacs.com/images2/back.gif'" border=0></img></a></th></tr>
</table>
<%
		//out.println("Residence Phone (ISD-STD-Phone) : ("+res_isd+") - ("+res_std+") - "+res_phone);
		//out.println("Office Phone (ISD-STD-Phone) : ("+off_isd+") - ("+off_std+") - "+off_phone);
		//out.println("Work Phone (ISD-STD-Phone) : ("+Work_ISD+") - ("+Work_STD+") - "+Work_Phone);

		try {
		String s1="Alumni Information";
		String s4="info@sanmacs.com";
		String s="info@sanmacs.com";
		String s5="localhost";
		SmtpClient smtpclient = new SmtpClient(s5);
		smtpclient.from(s4);
		smtpclient.to(s);
		PrintWriter printwriter = new PrintWriter(smtpclient.startMessage(), true);
		printwriter.println("From: " + s4);
		printwriter.println("To: " + s);
		printwriter.println("Subject: " + s1);

		printwriter.println(s1);
		printwriter.println("-----------------");

		if (Fname!=null || !Fname.equals("") || !Fname.equalsIgnoreCase("null")) {
		printwriter.println("Name : "+Fname+" "+Lname);
		}

		printwriter.println("Email ID : "+Email);
		printwriter.println("Date of Birth : "+Birth_day+"-"+Birth_month+"-"+Birth_year);

		if (res_phone!=null || !res_phone.equals("") || !res_phone.equalsIgnoreCase("null")) {
		printwriter.println("Residence Phone (ISD-STD-Phone) : ("+res_isd+") - ("+res_std+") - "+res_phone);
		}

		if (off_phone!=null || !off_phone.equals("") || !off_phone.equalsIgnoreCase("null")) {
		printwriter.println("Office Phone (ISD-STD-Phone) : ("+off_isd+") - ("+off_std+") - "+off_phone);
		}

		if (Monthadm!=null || !Monthadm.equals("") || !Monthadm.equalsIgnoreCase("null")) {
		printwriter.println("Joined Sanmacs On : "+Monthadm+", "+Yearadm);
		}

		if (Company!=null || !Company.equals("") || !Company.equalsIgnoreCase("null")) {
		printwriter.println("Company : "+Company);
		}

		if (Position!=null || !Position.equals("") || !Position.equalsIgnoreCase("null")) {
		printwriter.println("Position : "+Position);
		}

		if (Work_Country!=null || !Work_Country.equals("") || !Work_Country.equalsIgnoreCase("null")) {
		printwriter.println("Country : "+Work_Country);
		}

		if (Work_Phone!=null || !Work_Phone.equals("") || !Work_Phone.equalsIgnoreCase("null")) {
		printwriter.println("Work Phone (ISD-STD-Phone) : ("+Work_ISD+") - ("+Work_STD+") - "+Work_Phone);
		}

		if (Work_Web!=null || !Work_Web.equals("") || !Work_Web.equalsIgnoreCase("null")) {
		printwriter.println("Website : "+Work_Web);
		}

		if (Comments!=null || !Comments.equals("") || !Comments.equalsIgnoreCase("null")) {
		printwriter.println("Comments : "+Comments);
		}

		smtpclient.closeServer();
		//out.println("Mail Sent....to : " + s);
		} catch(Exception exception) {
		out.println("Mail Sent....Fail");
		out.println("Exception : " + exception);
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