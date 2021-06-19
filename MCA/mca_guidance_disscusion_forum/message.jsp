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

<style type="text/css">
DIV.Object7 {position:absolute; top:0px; left:0px; z-index:1;}

input {font-family:'Arial, Helvetica, sans-serif'; font-size:11px; color:forestgreen; font-weight:bold}
Select {font-family:'Arial, Helvetica, sans-serif'; font-size:11px; color:blue; font-weight:bold}

</style>
<script>
function check() {
f.submit();
}
</script>
</HEAD>
<BODY bgcolor="#F4F4F4" topmargin="0" leftmargin="0" style="border-width:0px;">

<Div class="Object7">
<form name=f method="Post" action="http://www.sanmacs.com/mca_guidance_disscusion_forum/send.jsp">
<table border=0 cellpadding=3 cellspacing=0 width=280 bgcolor=#E4EAF2 align=center>
<tr><th bgcolor=#F4F4F4><img src="http://www.sanmacs.com/images2/discussion_forum/send.gif"></img></th></tr>
<%!Connection con;
Statement st;
ResultSet rs,rs1,rs2;

int checkid;
String sender="";
String eid="";
String fname="";
String fullname="";
String prevmessage="";
int counter=1;
%>

<%
	HttpSession rsm=request.getSession(true);
	session.setMaxInactiveInterval(900);

	try {
	checkid=Integer.parseInt(request.getParameter("check"));
	eid=request.getParameter("mail");

	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	con=DriverManager.getConnection("jdbc:odbc:discussion","","");

	st=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

	rs2=st.executeQuery("Select fname,email from User2 where checkid="+checkid+"");
	rs2.next();
	fname=rs2.getString(1);
	sender=rs2.getString(2);

	rs=st.executeQuery("Select fname,lname from User2 where email='"+eid+"'");
	rs.next();
	fullname=rs.getString(1)+" "+rs.getString(2);

	rs1=st.executeQuery("Select message, rece_date from message where sender='"+sender+"' and receiver='"+eid+"' order by rece_date desc");
	if (rs1.next()==true) {
	rs1.previous();

	prevmessage="";
		while(rs1.next()==true) {
		prevmessage+="<b>"+counter+":</b> "+rs1.getString(1)+" ["+rs1.getString(2)+"]<br>";
		counter++;
			if (counter==3) {
			break;
			}
		}
		counter=1;
	}
	else {
	prevmessage="";
	}
%>
<tr bgColor=#ffffff><td valign=top align=center><span style="width:270px; height:80px; overflow-y:auto"><p id="ftp" align="justify"><b><%="Sent To: " + fullname %></b><br><%=prevmessage %></p></span></td></tr>
<tr><th>
<input type=hidden name=mail value="<%=eid %>">
<input type=hidden name=check value="<%=checkid %>">
<input type=hidden name=fname value="<%=fname %>">
</th></tr>
<tr bgColor=#eef2f7><th>
<input type=text name=message size=36 maxlength=500> <a href="javascript:check()"><img align=absmiddle border=0 src="http://www.sanmacs.com/images2/discussion_forum/send1.gif"></a>
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