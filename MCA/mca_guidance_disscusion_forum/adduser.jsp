<%@ page language="java" import="java.sql.*,java.lang.*,java.io.*,java.util.Date,java.util.TimeZone,java.text.SimpleDateFormat,sun.net.smtp.SmtpClient" session="true" %>
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
DIV.Object7 { position:absolute; top:68px; left:111px; z-index:6; }
input {font-family:'Arial, Helvetica, sans-serif'; font-size:11px}
textarea {font-family:'Arial, Helvetica, sans-serif'; font-size:11px}
</style>

</HEAD>
<BODY bgcolor="#F4F4F4" topmargin="0" leftmargin="0" onLoad="setTimeout(ft.submit,5000)">

<%!
String fname="";
String lname="";
String email="";
String gender="";
String Birth_day="";
String Birth_month="";
String Birth_year="";
String address="";
String city="";
String state="";
String country="";
String postal="";
String phone="";
String Join_date="";
String password="";
String date_time="";

Connection con;
Statement st;
ResultSet rs;
%>
<%
	Date dt=new java.util.Date();
        SimpleDateFormat sdf=new SimpleDateFormat("hh:mm a");
        String zone="IST";
        TimeZone tz=TimeZone.getTimeZone(zone);
        sdf.setTimeZone(tz);
        String time1=sdf.format(dt);
	Join_date=(dt.getDate())+"/"+(dt.getMonth()+1)+"/"+(dt.getYear()+1900);
	date_time=Join_date+" "+time1;

	try {
	HttpSession rsm=request.getSession(true);
	session.setMaxInactiveInterval(900);

	fname=request.getParameter("fname");
	lname=request.getParameter("lname");
	email=request.getParameter("email");
	gender=request.getParameter("gender");
	Birth_day=request.getParameter("birth_day");
	Birth_month=request.getParameter("birth_month");
	Birth_year=request.getParameter("birth_year");
	address=request.getParameter("address");
	city=request.getParameter("city");
	state=request.getParameter("state");
	country=request.getParameter("country");
	postal=request.getParameter("postal");
	phone=request.getParameter("phone");

	String pa=fname+""+lname;
	String pb=pa.substring(2,6);
	int pc=(int)(1000*(Math.random()));
	password=pb+""+pc;

	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	con=DriverManager.getConnection("jdbc:odbc:discussion","","");

	st=con.createStatement();

	st.executeUpdate("Insert into User2(fname,lname,email,gender,Birth_day,Birth_month,Birth_year,address,city,state,country,postal,phone,Join_date) values ('"+fname+"','"+lname+"','"+email+"','"+gender+"','"+Birth_day+"','"+Birth_month+"','"+Birth_year+"','"+address+"','"+city+"','"+state+"','"+country+"','"+postal+"','"+phone+"','"+Join_date+"')");
	st.executeUpdate("Insert into Password(username,password) values ('"+email+"','"+password+"')");
	st.executeUpdate("Insert into UserSession(User_id, Last_visit, Total_visit, flag) values ('"+email+"', '"+date_time+"', 0, 'No')");

	String s = ""+email;
	out.println("Sending mail to....." + s);
	try {
	String s1 = "Sanmacs Discussion Forum ID and Password";
	String s20 = "Sanmacs discussion forum User ID and Password are as mentioned below:";
	String s2 = "ID : "+email;
	String s21 = "Password : "+password;
	String s22 = "Computer Department";
	String s23 = "Sanmacs India";

	String s3 = s;
	String s4 = "info@sanmacs.com";
	String s5 = "localhost";
	SmtpClient smtpclient = new SmtpClient(s5);
	smtpclient.from("info@sanmacs.com");
	smtpclient.to(s);
	PrintWriter printwriter = new PrintWriter(smtpclient.startMessage(), true);
	printwriter.println("From: " + s4);
	printwriter.println("To: " + s3);
	printwriter.println("Subject: " + s1 + "\n");
	printwriter.println(s20);
	printwriter.println(s2);
	printwriter.println(s21);
	printwriter.println("");
	printwriter.println("");
	printwriter.println(s22);
	printwriter.println(s23);
	smtpclient.closeServer();
	out.println("Mail Sent....to : " + s);
	}
	catch(Exception exception) {
	out.println("Mail Sent....Fail");
	out.println("Exception : " + exception);
	}

%>
<Div class="Object7">
<form name=ft method="Post" action="http://www.sanmacs.com/mca_guidance_disscusion_forum/discussion.jsp">
<table border=0 cellpadding=0 cellspacing=0>
<tr><th><p id="ftp" align=center>With in few seconds, you will be redirected to discussion forum.</p></th></tr>
<tr><th height=20></th></tr>
<tr><th>
<table border=1 cellpadding=0 cellspacing=0 width=550 height=250 bordercolor=#C8C7C4 bgcolor=#DBDBD8>
<tr><th height=36 background="http://www.sanmacs.com/images2/discussion_forum/bg_image2.gif"><img src="http://www.sanmacs.com/images2/discussion_forum/redirecting.gif"></img></th></tr>
<tr><th>
<table border=3 cellpadding=0 width=480 height=150 cellspacing=0 bgcolor=#E6E6E3>
<tr><th>
<table border=0 cellpadding=5 cellspacing=0 width=470 bgcolor=#E6E6E3>
<tr><th><p id="ftp">Thank you, <font color=red><%=fname %> <%=lname %></font> for registering in discussion forum.<br>Your Id and password has been mailed to you.</p></th></tr>
<tr><th><p id="ftp">If your browser donot support redirection, then please <a class="lt" href="http://www.sanmacs.com/mca_guidance_disscusion_forum/discussion.jsp">Click Here</a>!</p></th></tr>
</table>
</th></tr>
</table>
</th></tr>
</table>
</th></tr>
</table>
</form>
</Div>
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
</BODY>
</HTML>