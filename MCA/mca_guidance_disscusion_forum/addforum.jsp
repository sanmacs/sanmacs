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
DIV.Object7 { position:absolute; top:68px; left:190px; z-index:6; }
input {font-family:'Arial, Helvetica, sans-serif'; font-size:11px}
textarea {font-family:'Arial, Helvetica, sans-serif'; font-size:11px}
</style>

</HEAD>
<BODY bgcolor="#F4F4F4" topmargin="0" leftmargin="0" onLoad="setTimeout(ft.submit,5000)">

<%!public String ecode(String dt) {
int len=dt.length();
String org="";
String org1="";
String org2="";
String org3="";

String alpha[]=new String[66];

alpha[0]="a";alpha[1]="b";alpha[2]="c";alpha[3]="d";alpha[4]="e";alpha[5]="f";
alpha[6]="g";alpha[7]="h";alpha[8]="i";alpha[9]="j";alpha[10]="k";alpha[11]="l";
alpha[12]="m";alpha[13]="n";alpha[14]="o";alpha[15]="p";alpha[16]="q";alpha[17]="r";
alpha[18]="s";alpha[19]="t";alpha[20]="u";alpha[21]="v";alpha[22]="w";alpha[23]="x";
alpha[24]="y";alpha[25]="z";alpha[26]="A";alpha[27]="B";alpha[28]="C";alpha[29]="D";
alpha[30]="E";alpha[31]="F";alpha[32]="G";alpha[33]="H";alpha[34]="I";alpha[35]="J";
alpha[36]="K";alpha[37]="L";alpha[38]="M";alpha[39]="N";alpha[40]="O";alpha[41]="P";
alpha[42]="Q";alpha[43]="R";alpha[44]="S";alpha[45]="T";alpha[46]="U";alpha[47]="V";
alpha[48]="W";alpha[49]="X";alpha[50]="Y";alpha[51]="Z";alpha[52]=" ";alpha[53]=".";
alpha[54]="-";alpha[55]="0";alpha[56]="1";alpha[57]="2";alpha[58]="3";alpha[59]="4";
alpha[60]="5";alpha[61]="6";alpha[62]="7";alpha[63]="8";alpha[64]="9";alpha[65]="_";

for(int g=0; g<len;g++) {
org=dt.substring(g,g+1);
	for(int p=0;p<66;p++) {
	if (org.equals(alpha[p])) {
	org2+=alpha[p+1];
	}
	}
}
org3=org2;
return org3;
}
%>

<%!int chk;
String forum_name="";
String comment="";
String eid="";
String forum_type="";
String topic="";

Connection con;
Statement st,st1;
ResultSet rs,rs1;
%>

<Div class="Object7">
<form name=ft method="Post" action="http://www.sanmacs.com/mca_guidance_disscusion_forum/discussion.jsp">
<table border=4 cellpadding=5 cellspacing=2 width=400 bgcolor=#ECE9E9 bordercolor=#848483>
<tr><th><p id="ftp" style="font-size:14px; color:#D53F01">Forum Alert!</p></th></tr>
<%
	Date dt=new java.util.Date();
        SimpleDateFormat sdf=new SimpleDateFormat("hh:mm a");
        String zone="IST";
        TimeZone tz=TimeZone.getTimeZone(zone);
        sdf.setTimeZone(tz);
        String time1=sdf.format(dt);
	String date=dt.getDate()+"/"+(dt.getMonth()+1)+"/"+(dt.getYear()+1900);

	try {
	HttpSession rsm=request.getSession(true);
	session.setMaxInactiveInterval(900);

	chk=Integer.parseInt((String)rsm.getValue("check"));

	forum_type=(String)rsm.getValue("ftype");

	rsm.putValue("connectid",""+chk);
	rsm.putValue("ftype",forum_type);

	forum_name=request.getParameter("forum_name");
	comment=request.getParameter("comments");

	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	con=DriverManager.getConnection("jdbc:odbc:discussion","","");

	st=con.createStatement();

	st1=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

	rs=st.executeQuery("Select Forum_name from Forum where Forum_name='"+forum_name+"'");
	if (rs.next()==true) {
%>
<tr><th><p id="ftp" style="font-size:14px" align="justify">“Sorry! This forum already exists! It can't be created. Try another one.”</p></th></tr>
<%
	}
	else {
	st1.executeUpdate("Insert into Forum(Forum_name, Last_postid, Status ,Comments) values('"+forum_name.toUpperCase()+"',0 ,'Active','"+comment+"')");
%>
<tr><th><p id="ftp" style="font-size:14px" align="justify">“Thank you for creating forum! After being approved, it will be added in the forum. Please contact for checking your posting.”</p></th></tr>
<%
	}
%>
</table>
<bR>
<center><a class="my1" href="http://www.sanmacs.com/mca_guidance_disscusion_forum/discussion.jsp"><img border=0 name="pro" src="http://www.sanmacs.com/images2/discussion_forum/discussion_proceed.gif" onMouseover="pro.src='http://www.sanmacs.com/images2/discussion_forum/discussion_proceed1.gif'" onMouseout="pro.src='http://www.sanmacs.com/images2/discussion_forum/discussion_proceed.gif'"></img></a></center>
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