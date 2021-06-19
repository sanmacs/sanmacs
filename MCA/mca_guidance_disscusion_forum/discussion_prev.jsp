<%@ page language="java" import="java.sql.*,java.lang.*,java.util.Date,java.util.TimeZone,java.text.SimpleDateFormat" session="true" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<TiTLE>Sanmacs India - MCA Entrance Discussion Forum</TITLE>
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
DIV.Object5 { position:absolute; top:148px; left:181px; width:484px; z-index:12;}
DIV.Object6 { position:absolute; top:148px; left:0px; z-index:5; }
DIV.Object7 { position:absolute; top:395px; left:181px; z-index:6; }
DIV.Object8 { position:absolute; top:324px; left:181px; z-index:7; }

DIV.Object9 { position:absolute; left:0px; width:780px; z-index:8;}
DIV.Object10 { position:absolute; left:0px; width:780px; z-index:9;}

input {font-family:'Arial, Helvetica, sans-serif'; font-size:10px}

</style>
<SCRIPT language=JavaScript src="http://www.sanmacs.com/images2/marquee.js"></SCRIPT>
<SCRIPT Language="Javascript">
function check()
{
	var a=true;
        a=email(document.f1.userid) && name(document.f1.pass); 
	if (a)
	{
		
		f1.submit();
	}
	else
	{
		//return false;
	}
}

function email(val1)
{
	var em,c1,d1,e1,g1,h,str1;
	em=val1.value;
	str1="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890@._";
	c1=em.length;
	if (c1<1)
	{
    	alert("This field cannot be empty");
  	  	val1.focus();
     	return false;
  	}
	else
	{
    	d1=str1.length;
	 	for (k=0; k<c1; k++)
		{
			e1=em.charAt(k);
			g1=str1.indexOf(e1);
			if (g1 < 0)
			{
				err(val1);
				return false;
			}
		}
		if (em.indexOf('@')<0)
		{
			err(val1);
			return false;
		}
		if (em.charAt(0)=='@')
		{
			err(val1);
			return false;
		}
		var posat, posdt;
		posat=em.indexOf('@');
		posdt=em.indexOf('.');

		if (em.charAt(c1-1)=='.')
		{
			err(val1);
			return false;
		}
		var dat,cnt,cnt1;
		cnt=0;
		cnt1=0;
		for (s=0; s<c1; s++)
		{
			dat=em.charAt(s);
			if (dat=='@')
				cnt=cnt+1;
			if (dat=='.')
				cnt1=cnt1+1;
		}
		if ((cnt>1) || (cnt1>3))
		{
			err(val1);
			return false;
		}
	}
	return true;
}

function name(val1)
{
	var em,c1,d1,e1,g1,h,str1;
	em=val1.value;
	str1="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
	c1=em.length;
	if (c1<1)
	{
    	alert("This field cannot be empty");
  	  	val1.focus();
     	return false;
  	}
	else
	{
    	d1=str1.length;
	 	for (k=0; k<c1; k++)
		{
			e1=em.charAt(k);
			g1=str1.indexOf(e1);
			if (g1 < 0)
			{
				alert ("Enter a valid Password.");
				val1.focus();
				val1.select();
				return false;
			}
		}
	}
	return true;
}

function err(val1)
{
	alert ("Enter a valid Userid.");
	val1.focus();
	val1.select();
}

</script>

</HEAD>
<BODY bgcolor="#F4F4F4" topmargin="0" leftmargin="0">

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

<%!Connection con;
Statement st,st1,st2,st3,st4,stmt,stmt1;
ResultSet rs,rst,rss,rsg,rsx,res,res1;
String forum_type="";
String uid="";
int total_post;
int post;
int forum_count=0;
%>

<%
	HttpSession rsm=request.getSession(true);
	session.setMaxInactiveInterval(900);

	try {

	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	con=DriverManager.getConnection("jdbc:odbc:discussion","","");

	st=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

	st1=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

	st2=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

	st3=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

	st4=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

	int visitors=100;

	Date dt=new java.util.Date();
	SimpleDateFormat sdf=new SimpleDateFormat("hh:mm a");
	String zone="IST";
	TimeZone tz=TimeZone.getTimeZone(zone);
	sdf.setTimeZone(tz);
	String time1=sdf.format(dt);

	String uid1=(String)rsm.getValue("userid");
	String conid=(String)rsm.getValue("connectid");

	if (uid1!=null) {
	rsm.putValue("userid",uid1);
	rsm.putValue("connectid",conid);

	stmt=con.createStatement();

	stmt1=con.createStatement();

	res=stmt.executeQuery("Select flag from UserSession where User_id='"+uid1+"'");
	if (res.next()==true) {
	String flagr=res.getString("flag");
	if (flagr.equals("Yes")) {
	res1=stmt.executeQuery("Select fname,lname from User2 where email='"+uid1+"'");
	res1.next();
%>
<DIV class="Object5">
<table border=0 cellspacing=0 cellpadding=1>
<tr><img src="http://www.sanmacs.com/images2/discussion_forum/sanmacs_discussion_forum.gif" width=596></img></td></tr>
<tr><td height=10></td></tr>
<tr><td>
<table border=0 cellspacing=0 cellpadding=2>
<tr><td width=45%><p id="ftp" align="justify">SANMACS Forum is a value added platform to share opinions, views and queries.</p></td><td align=right><a href="http://www.sanmacs.com/mca_guidance_disscusion_forum/new_forum.jsp"><img src="http://www.sanmacs.com/images2/discussion_forum/new_forum.gif" border=0></img></a> &nbsp;&nbsp; <a href="http://www.sanmacs.com/mca_guidance_disscusion_forum/changepass.jsp"><img src="http://www.sanmacs.com/images2/discussion_forum/change_password.gif" border=0></img></a> &nbsp;&nbsp; <a href="http://www.sanmacs.com/mca_guidance_disscusion_forum/logout.jsp"><img src="http://www.sanmacs.com/images2/discussion_forum/logout.gif" border=0></img></a></tr>
</table>
</td></tr>
<tr><td height=10></td></tr>
<tr><td width=484 height=25 background="http://www.sanmacs.com/images2/red_strip.gif"><p id="ftpw" style="margin-left:2px"><b>Welcome <%=res1.getString("fname") %> <%=res1.getString("lname") %>,</b></p></td></tr>
<tr><td height=3></td></tr>
<tr><th></th></tr>
</table>
</DIV>
<%
	rs=st.executeQuery("Select Forum_name, Status, Comments from Forum where Status='Active' order by Forum_name desc");
%>
<Div class="Object7">
<table border=1 cellpadding=3 cellspacing=0 width=100% bordercolor=white bgcolor=#E4EAF2>
<tr height=30><th width=60% background="http://www.sanmacs.com/images2/discussion_forum/bg_image.gif"><p id="ftpw">Forum</p></th><th width=14% background="http://www.sanmacs.com/images2/discussion_forum/bg_image.gif"><p id="ftpw">Total Posts</p></th><th background="http://www.sanmacs.com/images2/discussion_forum/bg_image.gif"><p id="ftpw">Last Post</p></th></tr>
<%
	while(rs.next()==true) {
	forum_type=rs.getString("Forum_name");
	
	rst=st1.executeQuery("Select Forum,Thread_date,Thread_time,User_id from Thread where Forum='"+forum_type+"'");
	if (rst.next()==true) {
	rst.last();

	uid=rst.getString("User_id");

	rss=st2.executeQuery("Select fname,lname from User2 where email='"+uid+"'");
	rss.next();
%>
<tr height=30><th colspan=3 background="http://www.sanmacs.com/images2/discussion_forum/bg_image1.gif">
<table border=0 cellspacing=0 cellpadding=0 width=100%>
<%
	if (forum_type.equals("SANMACSIANS")) {
%>
<tr>
<th width=35%><p id="ftp" align="justify"><%=forum_type %></p></th>
<th><p id="ftp" align="justify"><a href="http://www.sanmacs.com/mca_guidance_disscusion_forum/mcacheck.jsp?ftype=<%=ecode(forum_type) %>"><img align=absmiddle border=0 src="http://www.sanmacs.com/images2/discussion_forum/right_arrow.gif"></img></a></p></th>
</tr>
<%
	}
	else {
%>
<tr>
<th width=35%><p id="ftp" align="justify"><%=forum_type %></p></th>
<th><p id="ftp" align="justify"><a href="http://www.sanmacs.com/mca_guidance_disscusion_forum/mca.jsp?ftype=<%=ecode(forum_type) %>"><img align=absmiddle border=0 src="http://www.sanmacs.com/images2/discussion_forum/right_arrow.gif"></img></a></p></th>
</tr>
<%
	}
%>
</table>
</th></tr>
<tr><td valign=top onmouseout='this.style.backgroundColor=""' onmouseover="this.style.backgroundColor='#CCE6FF'"><p id="ftp" align="justify"><b><u>Introduction</u></b><br><%=rs.getString("Comments") %></p></td><td><p id="ftp" align="center"><%=rst.getRow() %></p></td><td><p id="ftp" align="right"><%=rst.getString("Thread_date") %> at <%=rst.getString("Thread_time") %><br>By <%=rss.getString("fname") %> <%=rss.getString("lname") %></p></td></tr>
<%
	total_post+=rst.getRow();
	}
	else {
%>
<tr height=30><th colspan=3 background="http://www.sanmacs.com/images2/discussion_forum/bg_image1.gif">
<table border=0 cellspacing=0 cellpadding=0 width=100%>
<%
	if (forum_type.equals("SANMACSIANS")) {
%>
<tr>
<th width=35%><p id="ftp" align="justify"><%=forum_type %></p></th>
<th><p id="ftp" align="justify"><a href="http://www.sanmacs.com/mca_guidance_disscusion_forum/mcacheck.jsp?ftype=<%=ecode(forum_type) %>"><img align=absmiddle border=0 src="http://www.sanmacs.com/images2/discussion_forum/right_arrow.gif"></img></a></p></th>
</tr>
<%
	}
	else {
%>
<tr>
<th width=35%><p id="ftp" align="justify"><%=forum_type %></p></th>
<th><p id="ftp" align="justify"><a href="http://www.sanmacs.com/mca_guidance_disscusion_forum/mca.jsp?ftype=<%=ecode(forum_type) %>"><img align=absmiddle border=0 src="http://www.sanmacs.com/images2/discussion_forum/right_arrow.gif"></img></a></p></th>
</tr>
<%
	}
%>
</table>
</th></tr>

<tr><td valign=top onmouseout='this.style.backgroundColor=""' onmouseover="this.style.backgroundColor='#CCE6FF'"><p id="ftp" align="justify"><b><u>Introduction</u></b><br><%=rs.getString("Comments") %></p></td><td><p id="ftp" align="center">0</p></td><td><p id="ftp" align="center">-</p></td></tr>
<%
	}

	forum_count++;
	}
%>
</table>
</Div>
<%
	rsg=st3.executeQuery("Select * from Password");
	rsg.last();
	rs.last();

	rsx=st4.executeQuery("Select Reply_id from Reply");
	rsx.last();
%>
<Div class="Object8">
<table border=1 cellpadding=3 cellspacing=0 width=100% height=54 bordercolor=white bgcolor=#E4EAF2>
<tr height=30><th colspan=2 background="http://www.sanmacs.com/images2/discussion_forum/bg_image.gif"><p id="ftpw">Forum Statistics</p></th></tr>
<tr><td valign=top width=50%><p id="ftp" align="justify">The date and time now is <%=(dt.getDate()) %>/<%=(dt.getMonth()+1) %>/<%=(dt.getYear()+1900) %> <%=time1 %><br>Online Members: <%=rsg.getRow() %>, Online Visitors: <%=visitors %></p></td><td valign=top><p id="ftp" align="justify">Members: <%=(rsg.getRow()+visitors) %>, Forum: <%=rs.getRow() %>, Total Post: <%=total_post %>, Total Reply: <%=rsx.getRow() %></p></td></tr>
</table>
</Div>
<%
	}
	else {
%>
<DIV class="Object5">
<form method="Post" name=f1 action="http://www.sanmacs.com/mca_guidance_disscusion_forum/usercheck.jsp">
<table border=0 cellspacing=0 cellpadding=1>
<tr><img src="http://www.sanmacs.com/images2/discussion_forum/sanmacs_discussion_forum.gif" width=596></img></td></tr>
<tr><td height=3></td></tr>
<tr><td width=484 height=20 background="http://www.sanmacs.com/images2/red_strip.gif"><p id="ftpw" style="margin-left:2px"><b>Welcome Visitor</b></p></td></tr>
<tr><td height=3></td></tr>
<tr><td>
<table border=3 cellpadding=2 cellspacing=1 bgcolor=#E1E1E2 bordercolor=#BDBEBE bordercolorlight=#ADAEAF bordercolordark=#979899>
<tr>
<td width=45% valign=top>
<p id="ftp" align="justify">You currently have browse capabilities. To participate in the discussions and post your own comments, please log in.<br><a class="my1" href="http://www.sanmacs.com/information_for_mca_entrance_students/mca_entrance_discussion_forum/forum_registeration.htm"><b>Get a free SANMACS Forum Account.</b></a></p>
</td>
<th valign=top>
<table border=0 cellspacing=0 cellpadding=2>
	<tr><th valign=top colspan=5><p id="ftp" align="center" style="color:red">Existing Users!</p></th></tr>
	<tr><td colspan=5 height=2></td></tr>
	<tr><th valign=top><p id="ftp" align="justify">User Id</p></th><td valign=top align=right><input type=text name=userid size=12></td><th valign=top><p id="ftp" align="justify">Password</p></th><td valign=top align=right><input type=password name=pass size=12></td><th valign=top><a href="javascript:check()"><img border=0 src="http://www.sanmacs.com/images2/discussion_forum/sign_in.gif"></img></a></th></tr>
</table>
</th>
</tr>
</table>
</td></tr>
</table>
</form>
</DIV>
<%
	rs=st.executeQuery("Select Forum_name,Status,Comments from Forum where Status='Active' order by Forum_name desc");
%>
<Div class="Object7">
<table border=1 cellpadding=3 cellspacing=0 width=100% bordercolor=white bgcolor=#E4EAF2>
<tr height=30><th width=60% background="http://www.sanmacs.com/images2/discussion_forum/bg_image.gif"><p id="ftpw">Forum</p></th><th width=14% background="http://www.sanmacs.com/images2/discussion_forum/bg_image.gif"><p id="ftpw">Total Posts</p></th><th background="http://www.sanmacs.com/images2/discussion_forum/bg_image.gif"><p id="ftpw">Last Post</p></th></tr>
<%
	while(rs.next()==true) {
	forum_type=rs.getString("Forum_name");
	
	rst=st1.executeQuery("Select Forum,Thread_date,Thread_time,User_id from Thread where Forum='"+forum_type+"'");
	if (rst.next()==true) {
	rst.last();

	uid=rst.getString("User_id");

	rss=st2.executeQuery("Select fname,lname from User2 where email='"+uid+"'");
	rss.next();
%>
<tr height=30><th colspan=3 background="http://www.sanmacs.com/images2/discussion_forum/bg_image1.gif">
<table border=0 cellspacing=0 cellpadding=0 width=100%>
<tr>
<th width=35%><p id="ftp" align="justify"><%=forum_type %></p></th>
<th><p id="ftp" align="justify"><a href="http://www.sanmacs.com/mca_guidance_disscusion_forum/mca1.jsp?ftype=<%=ecode(forum_type) %>"><img align=absmiddle border=0 src="http://www.sanmacs.com/images2/discussion_forum/right_arrow.gif"></img></a></p></th>
</tr>
</table>
</th></tr>
<tr><td valign=top onmouseout='this.style.backgroundColor=""' onmouseover="this.style.backgroundColor='#CCE6FF'"><p id="ftp" align="justify"><b><u>Introduction</u></b><br><%=rs.getString("Comments") %></p></td><td><p id="ftp" align="center"><%=rst.getRow() %></p></td><td><p id="ftp" align="right"><%=rst.getString("Thread_date") %> at <%=rst.getString("Thread_time") %><br>By <%=rss.getString("fname") %> <%=rss.getString("lname") %></p></td></tr>
<%
	total_post+=rst.getRow();
	}
	else {
%>
<tr height=30><th colspan=3 background="http://www.sanmacs.com/images2/discussion_forum/bg_image1.gif">
<table border=0 cellspacing=0 cellpadding=0 width=100%>
<tr>
<th width=35%><p id="ftp" align="justify"><%=forum_type %></p></th>
<th><p id="ftp" align="justify"><a href="http://www.sanmacs.com/mca_guidance_disscusion_forum/mca1.jsp?ftype=<%=ecode(forum_type) %>"><img align=absmiddle border=0 src="http://www.sanmacs.com/images2/discussion_forum/right_arrow.gif"></img></a></p></th>
</tr>
</table>
</th></tr>
<tr><td valign=top onmouseout='this.style.backgroundColor=""' onmouseover="this.style.backgroundColor='#CCE6FF'"><p id="ftp" align="justify"><b><u>Introduction</u></b><br><%=rs.getString("Comments") %></p></td><td><p id="ftp" align="center">0</p></td><td><p id="ftp" align="center">-</p></td></tr>
<%
	}

	forum_count++;
	}

%>
</table>
</Div>
<%
	rsg=st3.executeQuery("Select * from Password");
	rsg.last();
	rs.last();

	rsx=st4.executeQuery("Select Reply_id from Reply");
	rsx.last();
%>
<Div class="Object8">
<table border=1 cellpadding=3 cellspacing=0 width=100% height=54 bordercolor=white bgcolor=#E4EAF2>
<tr height=30><th colspan=2 background="http://www.sanmacs.com/images2/discussion_forum/bg_image.gif"><p id="ftpw">Forum Statistics</p></th></tr>
<tr><td valign=top width=50%><p id="ftp" align="justify">The date and time now is <%=(dt.getDate()) %>/<%=(dt.getMonth()+1) %>/<%=(dt.getYear()+1900) %> <%=time1 %><br>Online Members: <%=rsg.getRow() %>, Online Visitors: <%=visitors %></p></td><td valign=top><p id="ftp" align="justify">Members: <%=(rsg.getRow()+visitors) %>, Forum: <%=rs.getRow() %>, Total Post: <%=total_post %>, Total Reply: <%=rsx.getRow() %></p></td></tr>
</table>
</Div>
<%
	}
	}
	}
	else {
%>
<DIV class="Object5">
<form method="Post" name=f1 action="http://www.sanmacs.com/mca_guidance_disscusion_forum/usercheck.jsp">
<table border=0 cellspacing=0 cellpadding=1>
<tr><img src="http://www.sanmacs.com/images2/discussion_forum/sanmacs_discussion_forum.gif" width=596></img></td></tr>
<tr><td height=3></td></tr>
<tr><td width=484 height=20 background="http://www.sanmacs.com/images2/red_strip.gif"><p id="ftpw" style="margin-left:2px"><b>Welcome Visitor</b></p></td></tr>
<tr><td height=3></td></tr>
<tr><td>
<table border=3 cellpadding=2 cellspacing=1 bgcolor=#E1E1E2 bordercolor=#BDBEBE bordercolorlight=#ADAEAF bordercolordark=#979899>
<tr>
<td width=45% valign=top>
<p id="ftp" align="justify">You currently have browse capabilities. To participate in the discussions and post your own comments, please log in.<br><a class="my1" href="http://www.sanmacs.com/information_for_mca_entrance_students/mca_entrance_discussion_forum/forum_registeration.htm"><b>Get a free SANMACS Forum Account.</b></a></p>
</td>
<th valign=top>
<table border=0 cellspacing=0 cellpadding=2>
	<tr><th valign=top colspan=5><p id="ftp" align="center" style="color:red">Existing Users!</p></th></tr>
	<tr><td colspan=5 height=2></td></tr>
	<tr><th valign=top><p id="ftp" align="justify">User Id</p></th><td valign=top align=right><input type=text name=userid size=12></td><th valign=top><p id="ftp" align="justify">Password</p></th><td valign=top align=right><input type=password name=pass size=12></td><th valign=top><a href="javascript:check()"><img border=0 src="http://www.sanmacs.com/images2/discussion_forum/sign_in.gif"></img></a></th></tr>
</table>
</th>
</tr>
</table>
</td></tr>
</table>
</form>
</DIV>
<%
	rs=st.executeQuery("Select Forum_name,Status,Comments from Forum where Status='Active' order by Forum_name desc");
%>
<Div class="Object7">
<table border=1 cellpadding=3 cellspacing=0 width=100% bordercolor=white bgcolor=#E4EAF2>
<tr height=30><th width=60% background="http://www.sanmacs.com/images2/discussion_forum/bg_image.gif"><p id="ftpw">Forum</p></th><th width=14% background="http://www.sanmacs.com/images2/discussion_forum/bg_image.gif"><p id="ftpw">Total Posts</p></th><th background="http://www.sanmacs.com/images2/discussion_forum/bg_image.gif"><p id="ftpw">Last Post</p></th></tr>
<%
	while(rs.next()==true) {
	forum_type=rs.getString("Forum_name");
	
	rst=st1.executeQuery("Select Forum,Thread_date,Thread_time,User_id from Thread where Forum='"+forum_type+"'");
	if (rst.next()==true) {

	rst.last();

	uid=rst.getString("User_id");

	rss=st2.executeQuery("Select fname,lname from User2 where email='"+uid+"'");
	rss.next();
%>
<tr height=30><th colspan=3 background="http://www.sanmacs.com/images2/discussion_forum/bg_image1.gif">
<table border=0 cellspacing=0 cellpadding=0 width=100%>
<tr>
<th width=35%><p id="ftp" align="justify"><%=forum_type %></p></th>
<th><p id="ftp" align="justify"><a href="http://www.sanmacs.com/mca_guidance_disscusion_forum/mca1.jsp?ftype=<%=ecode(forum_type) %>"><img align=absmiddle border=0 src="http://www.sanmacs.com/images2/discussion_forum/right_arrow.gif"></img></a></p></th>
</tr>
</table>
</th></tr>
<tr><td valign=top onmouseout='this.style.backgroundColor=""' onmouseover="this.style.backgroundColor='#CCE6FF'"><p id="ftp" align="justify"><b><u>Introduction</u></b><br><%=rs.getString("Comments") %></p></td><td><p id="ftp" align="center"><%=rst.getRow() %></p></td><td><p id="ftp" align="right"><%=rst.getString("Thread_date") %> at <%=rst.getString("Thread_time") %><br>By <%=rss.getString("fname") %> <%=rss.getString("lname") %></p></td></tr>
<%
	total_post+=rst.getRow();
	}
	else {
%>
<tr height=30><th colspan=3 background="http://www.sanmacs.com/images2/discussion_forum/bg_image1.gif">
<table border=0 cellspacing=0 cellpadding=0 width=100%>
<tr>
<th width=35%><p id="ftp" align="justify"><%=forum_type %></p></th>
<th><p id="ftp" align="justify"><a href="http://www.sanmacs.com/mca_guidance_disscusion_forum/mca1.jsp?ftype=<%=ecode(forum_type) %>"><img align=absmiddle border=0 src="http://www.sanmacs.com/images2/discussion_forum/right_arrow.gif"></img></a></p></th>
</tr>
</table>
</th></tr>
<tr><td valign=top onmouseout='this.style.backgroundColor=""' onmouseover="this.style.backgroundColor='#CCE6FF'"><p id="ftp" align="justify"><b><u>Introduction</u></b><br><%=rs.getString("Comments") %></p></td><td><p id="ftp" align="center">0</p></td><td><p id="ftp" align="center">-</p></td></tr>
<%
	}

	forum_count++;
	}
%>
</table>
</Div>
<%
	rsg=st3.executeQuery("Select * from Password");
	rsg.last();
	rs.last();

	rsx=st4.executeQuery("Select Reply_id from Reply");
	rsx.last();
%>
<Div class="Object8">
<table border=1 cellpadding=3 cellspacing=0 width=100% height=54 bordercolor=white bgcolor=#E4EAF2>
<tr height=30><th colspan=2 background="http://www.sanmacs.com/images2/discussion_forum/bg_image.gif"><p id="ftpw">Forum Statistics</p></th></tr>
<tr><td valign=top width=50%><p id="ftp" align="justify">The date and time now is <%=(dt.getDate()) %>/<%=(dt.getMonth()+1) %>/<%=(dt.getYear()+1900) %> <%=time1 %><br>Online Members : <%=rsg.getRow() %>, Online Visitors : <%=visitors %></p></td><td valign=top><p id="ftp" align="justify">Members: <%=(rsg.getRow()+visitors) %>, Forum: <%=rs.getRow() %>, Total Post: <%=total_post %>, Total Reply: <%=rsx.getRow() %></p></td></tr>
</table>
</Div>
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

	int newcounter = forum_count;
	forum_count = 0;
%>

<Div class="Object6">
<table border=0 cellpadding=0 cellspacing=0>
<tr><td><img src="http://www.sanmacs.com/images2/discussion_forum/expert-panel.gif"></img></td></tr>
<tr><td width=177 height=<%=74+(newcounter-1)*115  %> bgcolor=#933900></td></tr>
</table>
</Div>

<DIV class="Object9" style="top:<%=423+(newcounter*115) %>px">
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

<DIV class="Object10" style="top:<%=453+(newcounter*115) %>px">
<p id="ft5" align="center" style="BACKGROUND:#D9D5D4; color:#666666; font-weight:bold">All rights reserved. Copyright © Sanmacs India Pvt. Ltd &nbsp;&nbsp;&nbsp;<a href="http://www.sanmacs.com/mca_entrance_legal_disclaimer/Legal.htm" title="MCA Entrance Disclaimer">Legal Disclaimer</a></p>
</DIV>

</BODY>
</HTML>