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

DIV.Object8 { position:absolute; top:555px; left:0px; width:780px; z-index:7;}
DIV.Object9 { position:absolute; top:585px; left:0px; width:780px; z-index:8;}

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
<%!
	Connection con;
	Statement st,st1,st2;
	ResultSet rs;

	int count;
	String mail="";
	String selected="";
	String finaljoin="";
	String Name="";
	String data="";
	String data1="";
	int ind=0;
	String data2="";
	int jcounter=0;
	String cdata="";
	int num;
	int hmtnew;
	String hmt="";
%>

<%
	try {

	count=Integer.parseInt(request.getParameter("hcount"));
	mail=request.getParameter("hmail");
	selected=" "+request.getParameter("hselected");
	finaljoin=request.getParameter("finaljoin");
	Name=request.getParameter("hname");
	String rank[]=new String[count];

	for(int i=1;i<=count;i++) {
	rank[i-1]=request.getParameter("t"+i);
	}

	num=selected.length();

	for(int i=0;i<num;i++) {
	data=selected.substring(i,i+1);
	if (data.equals(";")) {
	data1=selected.substring(ind+1,i);
	if (rank[jcounter].equals("")) {
	data2=data1+"|";
	}
	else {
	data2=data1+";"+rank[jcounter]+"|";
	}
	jcounter++;
	ind=i;
	cdata+=data2;
	}
	}
	ind=0;
	jcounter=0;

	//out.println(""+cdata);

	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	con=DriverManager.getConnection("jdbc:odbc:alumni","","");

	st=con.createStatement();

	st1=con.createStatement();

	st2=con.createStatement();
	
	st.executeUpdate("Update Alumni set Selections='"+cdata+"' where Email='"+mail+"'");
	st.executeUpdate("Update Alumni set Finaljoin='"+finaljoin+"' where Email='"+mail+"'");

	String password=Name.substring(0,2)+""+(int)(Math.random()*1000)+""+mail.substring(0,3);

	Date dt=new java.util.Date();
        SimpleDateFormat sdf=new SimpleDateFormat("hh:mm a");
        String zone="IST";
        TimeZone tz=TimeZone.getTimeZone(zone);
        sdf.setTimeZone(tz);
        String time1=sdf.format(dt);
	String Join_date=(dt.getDate())+"/"+(dt.getMonth()+1)+"/"+(dt.getYear()+1900);
	String date_time=Join_date+" "+time1;

	hmt=request.getParameter("hm");
	System.out.println(hmt);
	if (hmt==null) {
	}
	else {
	hmtnew=Integer.parseInt(hmt);
	if (hmtnew==1) {
	}
	else {
	st2.executeUpdate("Insert into Password values('"+mail+"','"+password.toUpperCase()+"')");
	st2.executeUpdate("Insert into UserSession values('"+mail+"','"+date_time+"',0,'No')");
	}
	}

		try {
		String x1="Discussion Forum Userid And Password";
		String x2="Userid : "+mail;
		String x3="Password : "+password;
		String x31="Alumni's of Sanmacs, You are getting an option to be member of Sanmacs discussion forum and share their opinions and experiences with their junior fellow students studying in Sanmacs India. You can participate in the discussion and help your juniors to sort out their problems and queries.";

		String x4="info@sanmacs.com";
		String x=""+mail;
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

	rs=st1.executeQuery("Select * from Alumni where Email='"+mail+"'");
	if (rs.next()==true) {
	int ftx=0,ftx1=0;
	int pt=0,mt=0;

	String dm="",dm1="";
	String dm2[][]=new String[count][2];
	String alumni_data[]=new String[23];

	alumni_data[0]=rs.getString("Fname");
	alumni_data[1]=rs.getString("Lname");
	alumni_data[2]=rs.getString("Email");
	alumni_data[3]=""+rs.getString("Birth_day");
	alumni_data[4]=rs.getString("Birth_month");
	alumni_data[5]=""+rs.getString("Birth_year");
	alumni_data[6]=""+rs.getString("res_isd");
	alumni_data[7]=""+rs.getString("res_std");
	alumni_data[8]=""+rs.getString("res_phone");
	alumni_data[9]=""+rs.getString("off_isd");
	alumni_data[10]=""+rs.getString("off_std");
	alumni_data[11]=""+rs.getString("off_phone");
	alumni_data[12]=""+rs.getString("Monthadm");
	alumni_data[13]=""+rs.getString("Yearadm");
	alumni_data[14]=""+rs.getString("Finaljoin");
	alumni_data[15]=""+rs.getString("Company");
	alumni_data[16]=""+rs.getString("Position");
	alumni_data[17]=""+rs.getString("Work_Country");
	alumni_data[18]=""+rs.getString("Work_ISD");
	alumni_data[19]=""+rs.getString("work_STD");
	alumni_data[20]=""+rs.getString("Work_Phone");
	alumni_data[21]=""+rs.getString("Work_Web");
	alumni_data[22]=""+rs.getString("Comments");

	for(int i=0;i<num;i++) {
	dm=selected.substring(i,i+1);
	if (dm.equals(";")) {
	dm1=selected.substring(ftx+1,i);
	dm2[pt][0]=dm1;
	dm2[pt][1]=rank[ftx1];
	pt++;
	ftx1++;
	ftx=i;
	}
	}
	ftx=0;
	ftx1=0;
	pt=0;
	mt=0;

		try {
		String s1="Alumni Information";
		//String s2="";

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

		if (alumni_data[0]!=null || !alumni_data[0].equals("") || !alumni_data[0].equalsIgnoreCase("null")) {
		printwriter.println("Name : "+alumni_data[0]+" "+alumni_data[1]);
		}

		printwriter.println("Email ID : "+alumni_data[2]);
		printwriter.println("Date of Birth : "+alumni_data[3]+"-"+alumni_data[4]+"-"+alumni_data[5]);

		if (alumni_data[8]!=null || !alumni_data[8].equals("") || !alumni_data[8].equalsIgnoreCase("null")) {
		printwriter.println("Residence Phone (ISD-STD-Phone) : ("+alumni_data[6]+") - ("+alumni_data[7]+") - "+alumni_data[8]);
		}

		if (alumni_data[11]!=null || !alumni_data[11].equals("") || !alumni_data[11].equalsIgnoreCase("null")) {
		printwriter.println("Office Phone (ISD-STD-Phone) : ("+alumni_data[9]+") - ("+alumni_data[10]+") - "+alumni_data[11]);
		}

		if (alumni_data[12]!=null || !alumni_data[12].equals("") || !alumni_data[12].equalsIgnoreCase("null")) {
		printwriter.println("Joined Sanmacs On : "+alumni_data[12]+", "+alumni_data[13]);
		}

		printwriter.println(" ");
		printwriter.println(" ");
		printwriter.println("Selections : "+"Selections (Rank)");
		printwriter.println(" "+" ---------------");

		for(int k=0;k<count;k++) {
		printwriter.print(dm2[k][0]+"("+dm2[k][1]+")");
		}

		printwriter.println(" ");
		printwriter.println(" ");

		if (alumni_data[14]!=null || !alumni_data[14].equals("") || !alumni_data[14].equalsIgnoreCase("null")) {
		printwriter.println("Institution Finally Joined: "+alumni_data[14]);
		}

		if (alumni_data[15]!=null || !alumni_data[15].equals("") || !alumni_data[15].equalsIgnoreCase("null")) {
		printwriter.println("Company : "+alumni_data[15]);
		}

		if (alumni_data[16]!=null || !alumni_data[16].equals("") || !alumni_data[16].equalsIgnoreCase("null")) {
		printwriter.println("Position : "+alumni_data[16]);
		}

		if (alumni_data[17]!=null || !alumni_data[17].equals("") || !alumni_data[17].equalsIgnoreCase("null")) {
		printwriter.println("Country : "+alumni_data[17]);
		}

		if (alumni_data[20]!=null || !alumni_data[20].equals("") || !alumni_data[20].equalsIgnoreCase("null")) {
		printwriter.println("Work Phone (ISD-STD-Phone) : ("+alumni_data[18]+") - ("+alumni_data[19]+") - "+alumni_data[20]);
		}

		if (alumni_data[21]!=null || !alumni_data[21].equals("") || !alumni_data[21].equalsIgnoreCase("null")) {
		printwriter.println("Website : "+alumni_data[21]);
		}

		if (alumni_data[22]!=null || !alumni_data[22].equals("") || !alumni_data[22].equalsIgnoreCase("null")) {
		printwriter.println("Comments : "+alumni_data[22]);
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
<img src="http://www.sanmacs.com/images2/mca_alumni_registration.gif" width=486 height=74></img>
<table border=0 cellspacing=0 cellpadding=3 width=100%>
<tr><th><p id="ftp" align="justify" style="color:red">Dear <%=Name %>,</p></th></tr>
<tr><td><p id="ftp" align="justify">SANMACS INDIA's association with the students never withers away after the term or session of the coaching is over. It is a never ending relation for lifetime. In fact, over the past several golden and dedicated years SANMACS INDIA has formed an ALUMNI of its own where the old SANMACSIANS on being approached or contacted by the fresh accomplished MCAs, furnish a plethora of information for better job opportunities and career-facilities. This privilege is available to the SANMACSIANS only, nobody else. SANMACS INDIA stands as a Linkage between the established software professionals and the aspiring MCA entrants.</p></td></tr>
<tr><td><p id="ftp" align="justify">If you would like to contact us directly in the future, you can contact us at:</p></td></tr>
<tr><td><p id="ftp" align="justify">91-11-32917966, 28757630, 28757911, 32522575</p></td></tr>
<tr><td><p id="ftp" align="justify"><b>OR</b></p></td></tr>
<tr><td><p id="ftp" align="justify"><b>Email us at:</b> info@sanmacs.com or webmaster@sanmacs.com</p></td></tr>
<tr><td><p id="ftp" align="justify">Sincerely,</p></td></tr>
<tr><th><p id="ftp" align="justify">Director</p></th></tr>
<tr><th><p id="ftp" align="justify">Sanmacs India</p></th></tr>
<tr><th><a href="http://www.sanmacs.com/index.htm"><img src="http://www.sanmacs.com/images2/back.gif" name=bck onMouseover="bck.src='http://www.sanmacs.com/images2/back1.gif'" onMouseout="bck.src='http://www.sanmacs.com/images2/back.gif'" border=0></img></a></th></tr>
</table>
</DIV>

<Div class="Object6">
<table border=0 cellpadding=0 cellspacing=0>
<tr><td><img src="http://www.sanmacs.com/images2/curve.gif"></img></td></tr>
<tr><td height=91 width=177 bgcolor=#0d8666></td></tr>
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
<tr><td height=11 width=106 bgcolor=#ef9a4a></td></tr>
</table>
</DIV>

</BODY>
</HTML>