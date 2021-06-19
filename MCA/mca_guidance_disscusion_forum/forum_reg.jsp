<%@ page language="java" import="java.sql.*,java.lang.*,java.util.Date,java.util.TimeZone,java.text.SimpleDateFormat" session="true" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<TiTLE>Sanmacs India - Discussion Forum Registration</TITLE>
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

</style>
<SCRIPT language=JavaScript src="http://www.sanmacs.com/images2/marquee.js"></SCRIPT>
</HEAD>
<BODY bgcolor="#FFFFFF" topmargin="0" leftmargin="0">

<%!
Connection con;
Statement st,st1;
ResultSet rs,rs1;

String password="";
String email="";
String name="", dob="";
String fname="", lname="";
int check;
int bday,byear,bmon;
String mon[]={"January","February","March","April","May","June","July","August","September","October","November","December"};
%>

<%
	try {
	HttpSession rsm=request.getSession(true);
	session.setMaxInactiveInterval(900);

	email=request.getParameter("emt");
	password=request.getParameter("pass");

	//out.println(email+" :::: "+password);

	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	con=DriverManager.getConnection("jdbc:odbc:discussion","","");

	st=con.createStatement();

	st1=con.createStatement();

	rs1=st1.executeQuery("Select * from Password where username='"+email+"' and password='"+password+"'");

	if (rs1.next()==false) {
	rs=st.executeQuery("Select * from SanLogin where email='"+email+"' and password='"+password+"'");

	if (rs.next()==true) {
	name=rs.getString("name");
	dob=rs.getString("date_of_birth");

	check=name.indexOf(" ");
	if (check!=-1) {
	fname=name.substring(0,check);
	lname=name.substring(check+1,name.length());
	}
	else {
	fname=name;
	lname="";
	}

	bday=Integer.parseInt(dob.substring(0,2));
	bmon=Integer.parseInt(dob.substring(3,5));
	byear=Integer.parseInt(dob.substring(6,10));
%>
<form name=f method=post action="http://www.sanmacs.com/mca_guidance_disscusion_forum/sanuser.jsp">
<input type=hidden name=firstname value="<%=fname %>">
<input type=hidden name=lastname value="<%=lname %>">
<input type=hidden name=userid value="<%=email %>">
<input type=hidden name=gender value="Not Define">
<input type=hidden name="b_day" value="<%=bday %>">
<input type=hidden name="b_mon" value="<%=mon[bmon-1] %>">
<input type=hidden name="b_year" value="<%=byear %>">
<input type=hidden name="pass" value="<%=password %>">
</form>
<script>
setTimeout("f.submit()",0);
</script>
<%
	}
	}
	else {
%>
<form name=f method=post action="http://www.sanmacs.com/mca_guidance_disscusion_forum/usercheck.jsp">
<input type=hidden name=userid value="<%=email %>">
<input type=hidden name="pass" value="<%=password %>">
</form>
<script>
setTimeout("f.submit()",0);
</script>
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

</BODY>
</HTML>