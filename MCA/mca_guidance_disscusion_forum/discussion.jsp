<%@ page language="java" import="java.sql.*,java.lang.*,java.util.*,java.util.Date,java.text.SimpleDateFormat" session="true" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">


<HTML>
<TITLE>Sanmacs Contact Details</TITLE>
<style type="text/css">
<!--
.style2 {
	color: #FF0000;
	font-style: italic;
}
-->
</style>
<HEAD>
<link rel=stylesheet type=text/css href=http://www.sanmacs.com/MCA/images1/sanmacs2.css>
<link rel=stylesheet type=text/css href=http://www.sanmacs.com/MCA/images1/sanmacs2.1.css>
<link rel=stylesheet type=text/css href=http://www.sanmacs.com/MCA/mca_images/mca.css>




<meta http-equiv="Content-Language" content="en-us">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta name="Keywords" content="sanmacs, sanmacs india, Registered Office, Sanmacs Contact Address, Sanmacs Contact Details, Sanmacs Phone no, Sanmacs Address, Sanmacs Karol bagh Address, Sanmacs Rohini Address, Sanmacs Email id">
<meta name="description" content="For more information regarding MCA entrance preparation, Contact Karolbagh and Rohini Office at 28757630, 28757911, 32917966, 32458354, 32522575, 47094119">


<META NAME="ROBOTS" CONTENT="INDEX, FOLLOW">
<META NAME="COPYRIGHT" CONTENT="Copyright © 1994 Sanmacs India, all rights reserved">
<META NAME="AUTHOR" CONTENT="Sanmacs India">
<META NAME="CONTACT_ADDR" CONTENT="Registered Office: 309 & 313 Partap Chambers, Gurudwara Road, Karol Bagh, New Delhi - 110005 Phone: 91-11-28757630, 28757911, 32917966 Corporate Office: SAI SANMACS Plaza, Plot No.6-A, Community Centre, DDA, Sector - 8, Rohini, Delhi - 85 (Near Kendriya Vidyalaya) Phone: 32458354, 32522575, 47094119 E-mail: info@sanmacs.com, webmaster@sanmacs.com">
<META NAME="DISTRIBUTION" CONTENT="Global">
<META NAME="RESOURCE-TYPE" CONTENT="document">
<META HTTP-EQUIV="IMAGETOOLBAR" CONTENT="false">
<style type="text/css">
DIV.Object1 { position:absolute; top:0px; left:0px; z-index:1;}
DIV.Object2 { position:absolute; top:88px; left:895px; width:100px; z-index:2;}
DIV.Object3 { position:absolute; top:-72px; left:400px; z-index:3;}

a {text-decoration:none;}

</style>


<style type="text/css">
h1 { font-family: Arial, Helvetica, sans-serif; font-size: 30px; margin-bottom: 15px; margin-top: 15px; font-weight:bold; color:#000000; letter-spacing:3px; word-spacing:3px; filter: progid:DXImageTransform.Microsoft.shadow(color='#000000',strength=3); width:703px}

h2 { font-family: Arial, Helvetica, sans-serif; font-size: 25px; margin-bottom: 0px; margin-top: 0px; font-weight:bold; color:#000000; letter-spacing:0px; word-spacing:0px; filter: progid:DXImageTransform.Microsoft.shadow(color='#000000',strength=5) }


h3 {font-family: Arial, Helvetica, sans-serif; margin-bottom: 5px; margin-top: 5px; font-size: 11px; color:#FFFFFF; letter-spacing:1px; word-spacing:2px;}
</STYLE>

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

function openWin(theURL,winName,features) {
window.open(theURL,winName,features);
}

</script>



</HEAD>
<BODY>



<Div class="Object1">
<table width="1003" border="0">
  
  <table width="1003px" border="0">
  <tr><td valign="top">
  <table width="100%" border="0" cellpadding="2" cellspacing="2">
  <tr>
  <td rowspan="2" width="303" align="left" valign="top"><img src="http://www.sanmacs.com/MCA/mca_images/mca_sanmacslogo.gif" alt="Sanmacs India - Best for MCA Entrance Preparation" title="MCA Entrance Preparation"></img></td>
     <td colspan="2" align="right" valign="top"><table width="330" border="0" cellspacing="0" cellpadding="0">
<tr>
<td><img src="http://www.sanmacs.com/MCA/mca_images/topl.gif" alt="" /></td>
<td align="center" style="background:#e7e8e8; width:100%;"> 
<a class="topLinkbsan" href="http://www.sanmacs.com/MCA/gwu.htm">Franchisee Program</a>&nbsp;| &nbsp;
<a class="topLinkbsan" href="http://www.sanmacs.com/MCA/sanmacs_mca_entrance_course/sanmacs_regular.htm">Courses</a>&nbsp;|&nbsp;
<a class="topLinkbsan" href="http://www.sanmacs.com/MCA/mca_contact/Contact.htm">Contact Us</a></td>
<td><img src="http://www.sanmacs.com/MCA/mca_images/topr.gif" alt=""></td></td>
</tr>

</table></td>
     
  <tr>
    <td width="544"><img src="http://www.sanmacs.com/MCA/mca_images/leader_mca.gif" alt="Sanmacs India - Best for MCA Entrance Preparation" title="MCA Entrance Preparation"></img></td>
    <td align="right"><table width="110" border="0">
  
  <SCRIPT language=JavaScript src="http://www.sanmacs.com/MCA/images1/facebook.js"></SCRIPT>    
</table>
</td>
  </tr>
</table>

<table width="995px" border="0">
<tr><td height="20"></td></tr>
  <tr>
  <td align="center"><SCRIPT type=text/javascript src="http://www.sanmacs.com/MCA/mca_images/mca_menu.js"></SCRIPT></td>
  </tr>
</table>

<tr><td height="2" valign="top" align="center"></td></tr>
<table width="1003px" border="0" cellspacing="0" cellpadding="0" align="center">




<tr><td align="center">
<table width="1003" border="0">
  <tr>
    <td align="center" valign="top"><table border="0" cellpadding="0" cellspacing="0">
<tr>
<tr><td height="2px"></td></tr>
<td><img src="http://www.sanmacs.com/MCA/mca_images/c1.gif" width="5" height="5" border="0" alt=""></td>
<td style="background: url(http://www.sanmacs.com/MCA/mca_images/c_top.gif)"><img src="http://www.sanmacs.com/MCA/mca_images/spacer.gif" width="1" height="1" border="0" alt=""></td>
<td><img src="http://www.sanmacs.com/MCA/mca_images/c2.gif" width="5" height="5" border="0" alt=""></td>
</tr>
 
<tr>
<td style="background: url(http://www.sanmacs.com/MCA/mca_images/c_left.gif)"><img src="images/spacer.gif" width="1" 
height="1" border="0" alt=""></td>
<td> <table width="780" border="0">
  <tr>
    <td background="http://www.sanmacs.com/MCA/mca_images/strip.bmp" width="530"><p></span><h2><img src="http://www.sanmacs.com/MCA/mca_images/bullet.gif">&nbsp;DISCUSSION FORUM</h2></td>
  </tr>
 
 
  <tr>
   <td><table width="775" border="0" bgcolor="#F8FBFE">
  <tr>
    <td><table border=0 cellspacing=0 cellpadding=0 bgcolor="#F8FBFE">
<tr><td><table border=0 cellspacing=0 cellpadding=0>


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
<table border=0 cellspacing=0 cellpadding=1 width=100%>
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
<table border=0 cellspacing=0 cellpadding=1 width=100%>
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
<table border=0 cellspacing=0 cellpadding=1 width=100%>
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
<tr><td valign=top width=50%><p id="ftp" align="justify">The date and time now is <%=(dt.getDate()) %>/<%=(dt.getMonth()+1) %>/<%=(dt.getYear()+1900) %> <%=time1 %><br>Online Members: <%=rsg.getRow() %>, Online Visitors: <%=visitors %></p></td><td valign=top><p id="ftp" align="justify">Members: <%=(rsg.getRow()+visitors) %>, Forum: <%=rs.getRow() %><br>Total Post: <%=total_post %>, Total Reply: <%=rsx.getRow() %></p></td></tr>
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

</DIV>




<tr><td colspan=2><p id="ftb" align="justify"></p></td></tr>



</table>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
</td>

    
    
    
    
  </tr>
</table>
</td>
<td style="background: url(http://www.sanmacs.com/MCA/mca_images/c_right.gif)"><img src="http://www.sanmacs.com/MCA/mca_images/spacer.gif" width="1" height="1" border="0" alt=""></td>
</tr>
<tr>
<td><img src="http://www.sanmacs.com/MCA/mca_images/c4.gif" width="5" height="5" border="0" alt=""></td>
<td style="background: url(http://www.sanmacs.com/MCA/mca_images/c_bot.gif)"><img src="http://www.sanmacs.com/MCA/mca_images/spacer.gif" width="1" height="1" border="0" alt=""></td>
<td><img src="http://www.sanmacs.com/MCA/mca_images/c3.gif" width="5" height="5" border="0" alt=""></td>
</tr>
	</table></td>
</td>
    
    
    
    
    
    <td valign="top"><table width="80" border="0">
  <td><table background="http://www.sanmacs.com/MCA/mca_images/curve.gif" width=177 height=315 cellpadding=0 cellspacing=0>
<tr><td height=160>&nbsp;</td></tr>
<tr><td>&nbsp;&nbsp;<OBJECT classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width=160 height=140 id="course" ALIGN="">
 <PARAM NAME=movie VALUE="http://www.sanmacs.com/MCA/swffiles/course.swf">
 <PARAM NAME=quality VALUE=high>
 <PARAM NAME="wmode" VALUE="transparent">
 <PARAM NAME="SCALE" VALUE="exactfit">
 <PARAM NAME="menu" VALUE="false">
 <EMBED src="http://www.sanmacs.com/MCA/swffiles/course.swf" quality=high wmode=transparent width=160 height=140 NAME="course" ALIGN="" TYPE="application/x-shockwave-flash" PLUGINSPAGE="http://www.macromedia.com/go/getflashplayer"> 
 </EMBED>
</OBJECT></td></tr></table></td>
  
</table></td>
  </tr>
</table>

</td></td>












<tr><td colspan="3"><table border=0 cellspacing=0 cellpadding=0 background="http://www.sanmacs.com/MCA/mca_images/dmenubg.bmp" width=1003px>
<tr><td colspan="21" height="20px"></td></tr>

<tr>
<th><a class="me1" href="http://www.sanmacs.com/index.htm" title="Sanmacs Home">Home</a></th>
<th valign="top"><a class="me1">|</a></th>

<th><a class="me1" href="http://www.sanmacs.com/MCA/mca_entrance_about_us/identity.htm" title="About MCA Entrance">About Us</a> </th>
<th valign="top"><a class="me1">|</a></th>

<th><a class="me1" href="http://www.sanmacs.com/MCA/sanmacs_mca_entrance_course/megaleap.htm" title="Enrollment For MCA Entrance Coaching">Megaleap</a> </th>
<th valign="top"><a class="me1">|</a></th>

<th><a class="me1" href="http://www.sanmacs.com/MCA/mca_entrance_training/mca_entrance_syllabus_of_universities/mca_entrance_syllabus_of_universities.htm" title="Training For MCA Entrance">MCA Training</a> </th>
<th valign="top"><a class="me1">|</a></th>

<th><a class="me1" href="http://www.sanmacs.com/MCA/mca_entrance_notification/mca_entrance_admission_notification.htm" title="Notification For MCA Entrance">Notification</a> </th>
<th valign="top"><a class="me1">|</a></th>

<th><a class="me1" href="http://www.sanmacs.com/MCA/mca_entrance_voyage_of_success/mca_entrance_voyage_of_success.htm" title="Success of MCA Entrance">Voyage of Success</a> </td>
<th valign="top"><a class="me1">|</a></th>

<th><a class="me1" href="http://www.sanmacs.com/MCA/advertise/Advertisewithus.htm" title="ADvertise with us">Advertise with us</a> </th>
<th valign="top"><a class="me1">|</a></th>

<th><a class="me1" href="http://www.sanmacs.com/MCA/sanmacs_mca_entrance_alumni/register.htm" title="MCA Alumni">Alumni</a> </th>
<th valign="top"><a class="me1">|</a></th>

<th><a class="me1" href="http://www.sanmacs.com/MCA/gwu.htm" title="Franchisee Program">Franchisee Program</a></th>
<th valign="top"><a class="me1">|</a></th>

<th><a class="me1" href="http://www.sanmacs.com/MCA/sanmacs_mca_sitemap/sitemap.htm" title="Site Map">Site Map</a> </th>
<th valign="top"><a class="me1">|</a></th>

<th><a class="me1" href="http://www.sanmacs.com/MCA/mca_contact/Contact.htm" title="Contact For MCA Training">Contact Us</a> </th></tr>

<tr><td colspan="21" height="10px"></td></tr>

<tr><td colspan="21" height="10px" align="center"><a class="me1" align="center" ><b>(Best viewed in 1024 X 768 Resolution) All rights reserved. Copyright © SANMACS INDIA &nbsp;&nbsp;&nbsp;<a class="me1" href="http://www.sanmacs.com/MCA/mca_entrance_legal_disclaimer/Legal.htm" title="MCA Entrance Disclaimer">Legal Disclaimer</a></b></a></td></tr>

<tr>
<th colspan=21 height="20px"><th><tr>
</table>



</table>
  
  
  
  
  
  
  </td></tr>
</table>




</Div>






</BODY>
</HTML>