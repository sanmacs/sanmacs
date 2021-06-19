<%@ page language="java" import="java.sql.*,java.lang.*,java.util.Date,java.util.TimeZone,java.text.SimpleDateFormat" session="true" %>
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
</HEAD>
<BODY topmargin="0" leftmargin="0" onLoad="setTimeout('f.submit()',10)">

<form name=f method="Post" action="http://www.sanmacs.com/mca_guidance_disscusion_forum/message.jsp">
<%!Connection con;
Statement st,st1;
ResultSet rs,rs1,rs2;

int check;
String eid="";
String firstname="";
String acuser="";
String message="";
String sender="";
int rcount;
%>

<%
	HttpSession rsm=request.getSession(true);
	session.setMaxInactiveInterval(900);

	Date dt=new java.util.Date();
	SimpleDateFormat sdf=new SimpleDateFormat("dd-MM-yyyy hh:mm a");
	String zone="IST";
	TimeZone tz=TimeZone.getTimeZone(zone);
	sdf.setTimeZone(tz);
	String cdate=sdf.format(dt);

	check=Integer.parseInt(request.getParameter("check"));

	try {

	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	con=DriverManager.getConnection("jdbc:odbc:discussion","","");

	st=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

	st1=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

	rs1=st.executeQuery("Select fname, lname, email from User2 where checkid="+check+"");
	rs1.next();
	sender=rs1.getString("email");

	acuser=request.getParameter("mail");
	message=request.getParameter("message");
	firstname=request.getParameter("fname");

	StringBuffer buf = new StringBuffer();
	rs=st.executeQuery("Select message from message where receiver='"+acuser+"'");
	if (rs.next()==true) {
	rs.previous();
		while(rs.next()==true) {
		buf.append(rs.getString(1));
		}
	}

	//if (buf.capacity()>102400) {
	if (buf.capacity()>1024) {
	rs2=st.executeQuery("Select message from suspense_account where receiver='"+acuser+"'");
		if (rs2.next()==true) {
		rs2.last();
			rcount=rs2.getRow();

			if (rcount<5) {
			st1.executeUpdate("Insert into suspense_account(sender, receiver, message, category, rece_date) values('"+sender+"', '"+acuser+"', '"+message+"', 'INBOX', '"+cdate+"')");
%>
			<script>
			alert("Message Sent to Suspense Account !");
			</script>
<%
			}
			else {
%>
			<script>
			alert("ERROR! Memory Full ! Message Discarded.");
			</script>
<%
			}
		}
		else {
		st1.executeUpdate("Insert into suspense_account(sender, receiver, message, category, rece_date) values('"+sender+"', '"+acuser+"', '"+message+"', 'INBOX', '"+cdate+"')");
%>
		<script>
		alert("Message Sent to Suspense Account !");
		</script>
<%
		}
	}
	else {
	st1.executeUpdate("Insert into message(sender, receiver, message, category, rece_date) values('"+sender+"', '"+acuser+"', '"+message+"', 'INBOX', '"+cdate+"')");
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
<input type=hidden name=check value="<%=check %>">
<input type=hidden name=mail value="<%=acuser %>">
</form>

</BODY>
</HTML>