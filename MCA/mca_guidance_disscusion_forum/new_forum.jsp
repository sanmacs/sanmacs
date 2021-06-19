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

DIV.Object5 { position:absolute; top:148px; left:181px; width:484px; z-index:12;}

DIV.Object6 { position:absolute; top:148px; left:0px; z-index:5; }

DIV.Object7 { position:absolute; top:290px; left:181px; z-index:6; }

DIV.Object9 { position:absolute; top:523px; left:0px; width:780px; z-index:8;}

input {font-family:'Arial, Helvetica, sans-serif'; font-size:11px}
textarea {font-family:'Arial, Helvetica, sans-serif'; font-size:11px}

</style>
<script>
function check()
{
	var a;
	a=name(document.f.forum_name) && comt(); 

	if (a)
	{
		alert ("Thanks you for submitting the form.");
		f.submit();
	}
	else
	{
		return false;
	}
}

function comt() {
if (f.comments.value=="") {
alert("This field cannot be empty");
f.comments.focus();
return false;
}
else {
return true;
}
}

function name(val1)
{
	var em,c1,d1,e1,g1,h,str1;
	em=val1.value;
	str1="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ -";
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
				alert ("Enter a valid Data.");
				val1.focus();
				val1.select();
				return false;
			}
		}
	}
	return true;
}


</script>
</HEAD>
<BODY bgcolor="#F4F4F4" topmargin="0" leftmargin="0">

<Div class="Object1">
<%@ include file="toplinks.jsp" %>
</Div>

<Div class="Object2">
<embed src="http://www.sanmacs.com/swffiles/mca_identity.swf" wmode=transparent width=467></embed>
</Div>

<Div class="Object6">
<table border=0 cellpadding=0 cellspacing=0>
<tr><td><img src="http://www.sanmacs.com/images2/discussion_forum/expert-panel.gif"></img></td></tr>
<tr><td width=177 height=59 bgcolor=#933900></td></tr>
</table>
</Div>

<%!String chk="";
Connection con;
Statement stmt,stmt1;
ResultSet res,res1;
int contid;
String forum_type="";
%>

<%
	HttpSession rsm=request.getSession(true);
	session.setMaxInactiveInterval(900);

	chk=(String)rsm.getValue("connectid");
	forum_type=(String)rsm.getValue("ftype");

	rsm.putValue("check",chk);
	rsm.putValue("ftype",forum_type);

	contid=Integer.parseInt(chk);

	try {
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	con=DriverManager.getConnection("jdbc:odbc:discussion","","");

	stmt=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

	stmt1=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

	res=stmt.executeQuery("Select email from User2 where checkid="+contid+"");
	res.next();
	String myeid=res.getString("email");
	rsm.putValue("userid",myeid);

	res1=stmt1.executeQuery("Select flag from UserSession where User_id='"+myeid+"'");
	if (res1.next()==true) {

	String flagr=res1.getString("flag");
	if (flagr.equals("Yes")) {
%>

<DIV class="Object5">
<table border=0 cellspacing=0 cellpadding=1>
<tr><img src="http://www.sanmacs.com/images2/discussion_forum/sanmacs_discussion_forum.gif" width=596></img></td></tr>
<tr><td height=10></td></tr>
<tr><td align=right>
<form name=fb method="Post" action="http://www.sanmacs.com/mca_guidance_disscusion_forum/discussion.jsp">
<p id="ftp">
<img src="http://www.sanmacs.com/images2/discussion_forum/back.gif" border=0 style="cursor:hand" onClick="fb.submit()"></img> &nbsp; 
<a href="http://www.sanmacs.com/mca_guidance_disscusion_forum/logout.jsp"><img src="http://www.sanmacs.com/images2/discussion_forum/logout.gif" border=0></img></a>
</p>
</form>
</td></tr>
</table>
</DIV>

<Div class="Object7">
<form name=f method="Post" action="http://www.sanmacs.com/mca_guidance_disscusion_forum/addforum.jsp">
<table border=0 cellpadding=0 cellspacing=0 width=599>
<tr><th>
<table border=0 cellpadding=2 cellspacing=2 width=80%>
<tr><th width=30%><p id="ftp" align="justify">Forum Name</p></th><td><input type=text name="forum_name" size=30></td></tr>
<tr><td colspan=2 height=20></td></tr>
<tr><th valign=top><p id="ftp" align="justify">Comments</p></th><td><textarea name="comments" cols=60 rows=5>This Forum is for those students who are having problems related to this field. Feel free to engage other members in threaded discussions.</textarea></td></tr>
<tr><td colspan=2 height=10></td></tr>
<tr><th colspan=2><p id="ftp"><input type=button value="Create Forum" onClick="check();"></p></td></tr>
</table>
</th></tr>
</table>
</form>
</Div>
<%	}
	else if(flagr.equals("No")) {
	out.println("<Div class='Object7'><p id='ftp' style='font-weight:bold; margin-left:200px'>You have been logged out!</p></Div>");
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

<DIV class="Object9">
<%@ include file="lowlinks.jsp" %>
</DIV>

</BODY>
</HTML>