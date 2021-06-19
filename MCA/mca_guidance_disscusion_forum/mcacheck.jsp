<%@ page language="java" import="java.sql.*,java.lang.*,java.util.Date,java.util.TimeZone,java.text.SimpleDateFormat" session="true" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<TITLE>Sanmacs India - MCA Entrance Discussion Forum</TITLE>
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
DIV.Object5 { position:absolute; top:68px; left:111px; z-index:1;}
DIV.Object6 { position:absolute; top:148px; left:181px; width:484px; z-index:2;}
</style>
</HEAD>

<BODY topmargin="0" leftmargin="0">
<%!Connection con;
Statement st,st1;
ResultSet rs,rs1,rs2;
String uid="";
String pass="";
String conid="";
String f_type="";
int alumni[]=new int[3];
int user[]=new int[3];
String mon[]={"January","February","March","April","May","June","July","August","September","October","November","December"};
String month="";
%>
<%
	HttpSession rsm=request.getSession(true);
	session.setMaxInactiveInterval(900);

	f_type=request.getParameter("ftype");
	uid=(String)rsm.getValue("userid");
	conid=(String)rsm.getValue("connectid");

	rsm.putValue("userid",uid);
	rsm.putValue("connectid",conid);

	try {

	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	con=DriverManager.getConnection("jdbc:odbc:discussion","","");

	st=con.createStatement();

	st1=con.createStatement();

	rs=st.executeQuery("Select password from Password where username='"+uid+"'");
	rs.next();
	pass=rs.getString(1);

	rs1=st1.executeQuery("Select * from SanLogin where email='"+uid+"' and password='"+pass+"'");
	if (rs1.next()==true) {
%>
<form name=ft method="Post" action="http://www.sanmacs.com/mca_guidance_disscusion_forum/mca.jsp?ftype=<%=f_type %>">
</form>
<script>
setTimeout("ft.submit()",0);
</script>
<%
	}
	else {
	rs2=st1.executeQuery("Select Alumni.Birth_day, Alumni.Birth_month, Alumni.Birth_year, User2.Birth_day, User2.Birth_month, User2.Birth_year from Alumni,User2 where Alumni.Email='"+uid+"' and User2.email='"+uid+"'");
	if (rs2.next()==true) {
	alumni[0]=rs2.getInt(1);
	alumni[1]=Integer.parseInt(rs2.getString(2));
	alumni[2]=rs2.getInt(3);

	user[0]=Integer.parseInt(rs2.getString(4));
	month=rs2.getString(5);
	user[2]=Integer.parseInt(rs2.getString(6));

	for(int i=0; i<12; i++) {
	if (month.equalsIgnoreCase(mon[i])) {
	user[1]=i+1;
	}
	}

	if (alumni[0]==user[0] && alumni[1]==user[1] && alumni[2]==user[2]) {
%>
<form name=ft method="Post" action="http://www.sanmacs.com/mca_guidance_disscusion_forum/mca.jsp?ftype=<%=f_type %>">
</form>
<script>
setTimeout("ft.submit()",0);
</script>
<%
	}
	else {
%>
<DIV class="Object6">
<form name=ft method="Post" action="http://www.sanmacs.com/mca_guidance_disscusion_forum/discussion.jsp">
<table border=3 cellpadding=4 cellspacing=2 bordercolor=#BDBEBE bordercolorlight=#ADAEAF bordercolordark=#979899>
<tr><td><p id="ftp" align="center" style="color:red"><b>You are not eligible to enter into SANMACS Forum. It is only for SANMACSIANS.</b></p></td></tr>
<tr><td><p id="ftp" align="center"><a class="lt" href="javascript:ft.submit()">Click Here To Continue...</a></p></td></tr>
</table>
</form>
</DIV>
<script>
setTimeout("ft.submit()",5000);
</script>
<%
	}
	}
	else {
%>
<DIV class="Object6">
<form name=ft method="Post" action="http://www.sanmacs.com/mca_guidance_disscusion_forum/discussion.jsp">
<table border=3 cellpadding=4 cellspacing=2 bordercolor=#BDBEBE bordercolorlight=#ADAEAF bordercolordark=#979899>
<tr><td><p id="ftp" align="center" style="color:red"><b>You are not eligible to enter into SANMACS Forum. It is only for SANMACSIANS.</b></p></td></tr>
<tr><td><p id="ftp" align="center"><a class="lt" href="javascript:ft.submit()">Click Here To Continue...</a></p></td></tr>
</table>
</form>
</DIV>
<script>
setTimeout("ft.submit()",5000);
</script>
<%
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
</BODY>
</HTML>