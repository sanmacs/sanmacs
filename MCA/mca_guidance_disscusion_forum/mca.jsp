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
DIV.Object1 { position:absolute; top:0px; left:0px; z-index:0;}
DIV.Object2 { position:absolute; top:-65px; left:302px; z-index:1;}

DIV.Object5 { position:absolute; top:148px; left:181px; z-index:12;}
DIV.Object6 { position:absolute; top:148px; left:0px; z-index:5; }

DIV.Object7 { position:absolute; top:300px; left:181px; z-index:6; }

DIV.Object9 { position:absolute; left:0px; width:780px; z-index:8;}

input {font-family:'Arial, Helvetica, sans-serif'; font-size:10px}

</style>
<script>
function openWin(theURL,winName,features) {
window.open(theURL,winName,features);
}
</script>
</HEAD>
<BODY bgcolor="#F4F4F4" topmargin="0" leftmargin="0">

<DIV class="Object1">
<%@ include file="toplinks.jsp" %>
</DIV>

<DIV class="Object2">
<embed src="http://www.sanmacs.com/swffiles/mca_identity.swf" wmode=transparent width=467></embed>
</DIV>

<%!public String dcode(String dt) {
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
	org2+=alpha[p-1];
	}
	}
}
org3=org2;
return org3;
}
%>

<%!Connection con;
Statement st,st1,st2,st3;
ResultSet rs,rs1,rs2,rs3;
Statement stmt,stmt1;
ResultSet res,res1;

String forum_type="";
String uid="";
String head="";
String rep_f="";
String rep_date_time="";
String last_post="";
String full_name="";
String check="";
int repl;
String uid1="";
int thrd_id;
int count=0;
int counter;
String conid="";
int contid;
String active_status="";
String activity="";
%>

<%
	HttpSession rsm=request.getSession(true);
	session.setMaxInactiveInterval(900);

	uid=(String)rsm.getValue("userid");
	conid=(String)rsm.getValue("connectid");
	rsm.putValue("connectid",conid);
	contid=Integer.parseInt(conid);

	try {
	forum_type=dcode(request.getParameter("ftype"));
	rsm.putValue("userid",uid);
	rsm.putValue("ftype",forum_type);

	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	con=DriverManager.getConnection("jdbc:odbc:discussion","","");

	stmt=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

	stmt1=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

	res=stmt.executeQuery("Select email from User2 where checkid="+contid+"");
	res.next();
	String myeid=res.getString("email");
	res1=stmt1.executeQuery("Select flag from UserSession where User_id='"+myeid+"'");
	if (res1.next()==true) {

	String flagr=res1.getString("flag");

	if (flagr.equals("Yes")) {
%>
<DIV class="Object5">
<table border=0 cellspacing=0 cellpadding=1>
<tr><img src="http://www.sanmacs.com/images2/discussion_forum/sanmacs_discussion_forum.gif" width=596></img></td></tr>
<tr><td>
<form name=fb method="Post" action="http://www.sanmacs.com/mca_guidance_disscusion_forum/discussion.jsp">
<table border=0 cellspacing=0 cellpadding=2>
<tr><td rowspan=2 valign=top width=40%><p id="ftp" align="justify" style="margin-top:5px">SANMACS Forum is a value added platform to share opinions, views and queries.</p></td><td align=right><a href="javascript:fb.submit()"><img src="http://www.sanmacs.com/images2/discussion_forum/back.gif" border=0></img></a> &nbsp; <a href="http://www.sanmacs.com/mca_guidance_disscusion_forum/thread.jsp"><img src="http://www.sanmacs.com/images2/discussion_forum/new_post.gif" border=0></img></a> &nbsp; <a href="http://www.sanmacs.com/mca_guidance_disscusion_forum/logout.jsp"><img src="http://www.sanmacs.com/images2/discussion_forum/logout.gif" border=0></img></a></tr>
<tr><td align=right><a href="http://www.sanmacs.com/mca_guidance_disscusion_forum/movechat.jsp"><img src="http://www.sanmacs.com/images2/discussion_forum/chat.gif" border=0></img></a> &nbsp; <a href="http://www.sanmacs.com/mca_guidance_disscusion_forum/inlist.jsp"><img src="http://www.sanmacs.com/images2/discussion_forum/inbox.gif" border=0></img></a> &nbsp; <a href="http://www.sanmacs.com/mca_guidance_disscusion_forum/outlist.jsp"><img src="http://www.sanmacs.com/images2/discussion_forum/outbox.gif" border=0></img></a></tr>
</table>
</form>
</td></tr>
</table>
</DIV>
<%
	st=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

	st1=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

	st2=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

	st3=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

	rs=st.executeQuery("Select Thread_id,User_id,Heading,Latest_replyid,Views from Thread where Forum='"+forum_type+"' order by Thread_id desc");
%>
<DIV class="Object7">
<table border=1 cellpadding=3 cellspacing=0 width=100% bordercolor=white bgcolor=#E4EAF2>
<tr height=30><td colspan=5 background="http://www.sanmacs.com/images2/discussion_forum/bg_image.gif"><p id="ftpw"><b><%=forum_type %> (General Discussion)</b></p></td></tr>
<tr bgColor=#eef2f7 height=30><th background="http://www.sanmacs.com/images2/discussion_forum/bg_image1.gif"><p id="tp">Topic</p></th><th background="http://www.sanmacs.com/images2/discussion_forum/bg_image1.gif"><p id="tp">Topic Starter</p></th><th background="http://www.sanmacs.com/images2/discussion_forum/bg_image1.gif"><p id="tp">Replies</p></th><th background="http://www.sanmacs.com/images2/discussion_forum/bg_image1.gif"><p id="tp">Views</p></th><th background="http://www.sanmacs.com/images2/discussion_forum/bg_image1.gif"><p id="tp">Last Post</p></th></tr>
<%
	while(rs.next()) {
	uid1=rs.getString("User_id");

	rs3=st3.executeQuery("Select fname, lname, checkid, flag from User2, UserSession where email='"+uid1+"' and User2.email=UserSession.User_id");
	rs3.next();
	check=rs3.getString("checkid");

	full_name=rs3.getString("fname")+" "+rs3.getString("lname");

	activity=rs3.getString("flag");

	if (activity.equals("No")) {
	active_status="Offline";
	}
	else if(activity.equals("Yes")) {
	active_status="Online";
	}

	head=rs.getString("Heading");
	thrd_id=Integer.parseInt(rs.getString("Thread_id"));

	rs1=st1.executeQuery("Select Reply_from,Reply_date,Reply_time from Reply where Thread_id="+thrd_id+"");

	if (rs1.next()==false) {
	last_post="No Reply";
%>
<tr><td width=28% onmouseout='this.style.backgroundColor=""' onmouseover="this.style.backgroundColor='#CCE6FF'"><p id="ftp" align="justify"><a class="lt" href="http://www.sanmacs.com/mca_guidance_disscusion_forum/topic.jsp?topic=<%=thrd_id %>"><b><%=head %></b></a></p></td><th width=25% onmouseout='this.style.backgroundColor=""' onmouseover="this.style.backgroundColor='#CCE6FF'"><p id="ftp" align="justify"><a class="lt" href='javascript:openWin("http://www.sanmacs.com/mca_guidance_disscusion_forum/username.jsp?chk=<%=check %>","profile<%=count %>","toolbar=0, location=0, status=0, menubar=0, scrollbars=0, resizable=0, width=500, height=400, left=150, top=100")'><%=full_name %></a><br>(<%=active_status %>)</p></th><td width=10%><p id="ftp" align="center"><%=0 %></p></td><td width=10%><p id="ftp" align="center"><%=rs.getString("Views") %></p></td><td><p id="ftp" align="justify"><%=last_post %></p></td></tr>
<%
	count++;
	}
	else {
	rs1.last();
	repl=rs1.getRow();

	rep_f=rs1.getString("Reply_from");
	rep_date_time=rs1.getString("Reply_date")+" "+rs1.getString("Reply_time");

	rs2=st2.executeQuery("Select fname,lname from User2 where email='"+rep_f+"'");
	while(rs2.next()) {
	last_post=rep_date_time +"<br>By "+rs2.getString("fname")+" "+rs2.getString("lname");
%>
<tr><td width=28% onmouseout='this.style.backgroundColor=""' onmouseover="this.style.backgroundColor='#CCE6FF'"><p id="ftp" align="justify"><a class="lt" href="http://www.sanmacs.com/mca_guidance_disscusion_forum/topic.jsp?topic=<%=thrd_id %>"><b><%=head %></b></a></p></td><th width=25% onmouseout='this.style.backgroundColor=""' onmouseover="this.style.backgroundColor='#CCE6FF'"><p id="ftp" align="justify"><a class="lt" href='javascript:openWin("http://www.sanmacs.com/mca_guidance_disscusion_forum/username.jsp?chk=<%=check %>","profile<%=count %>","toolbar=0, location=0, status=0, menubar=0, scrollbars=0, resizable=0, width=500, height=400, left=150, top=100")'><%=full_name %></a><br>(<%=active_status %>)</p></th><td width=10%><p id="ftp" align="center"><%=repl %></p></td><td width=10%><p id="ftp" align="center"><%=rs.getString("Views") %></p></td><td><p id="ftp" align="justify"><%=last_post %></p></td></tr>
<%
	count++;
	}
	}
	}
counter=count;
count=0;
%>
</table>
</DIV>
<%
	}
	else if(flagr.equals("No")) {
	out.println("<Div class='Object7'><p id='ftp' style='font-weight:bold;margin-left:200px'>You have been logged out!</p></Div>");
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

<DIV class="Object6">
<table border=0 cellpadding=0 cellspacing=0>
<tr><td><img src="http://www.sanmacs.com/images2/discussion_forum/expert-panel.gif"></img></td></tr>
<tr><td width=177 height=<%=(14+(counter*33)) %> bgcolor=#933900></td></tr>
</table>
</DIV>

<DIV class="Object9" style="top:<%=(478+(counter*33)) %>px;">
<%@ include file="lowlinks.jsp" %>
</DIV>

</BODY>
</HTML>