<%@ page language="java" import="java.sql.*,java.lang.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<TiTLE>Sanmacs India - Sanmacs Previlege</TITLE>
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

DIV.Object5 { position:absolute; top:148px; left:181px; width:486px; z-index:4;}

DIV.Object6 { position:absolute; top:148px; left:0px; z-index:5; }

DIV.Object8 { position:absolute; top:545px; left:0px; width:780px; z-index:7;}

DIV.Object11 { position:absolute; top:148px; left:670px; z-index:10;}

</style>
<SCRIPT language=JavaScript src="http://www.sanmacs.com/images2/marquee.js"></SCRIPT>
<SCRIPT language=JavaScript src="http://www.sanmacs.com/images2/sanlogin.js"></SCRIPT>
<script language=JavaScript>
function openWin(theURL,winName,features) {
window.open(theURL,winName,features);
}

function check()
{
	var a;
        a=reg(document.f.old_pass) && reg(document.f.new_pass) && reg(document.f.confirm_pass); 

	if (a)
	{
		
		f.submit();
	}
	else
	{
		return false;
	}
}

function reg(val1)
{
	var em,c1,d1,e1,g1,h,str1;
	em=val1.value;
	str1="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
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
<SCRIPT language=javascript> function noRightClick() { if (event.button==2) { alert("Sorry! Right click is not permitted.") } } document.onmousedown=noRightClick </SCRIPT>
</HEAD>
<BODY bgcolor="#FFFFFF" topmargin="0" leftmargin="0">

<Div class="Object1">
<%@ include file="toplinks.jsp" %>
</Div>

<Div class="Object2">
<embed src="http://www.sanmacs.com/swffiles/mca_identity.swf" wmode=transparent width=467></embed>
</Div>

<%!String uid="";
%>

<%
	HttpSession rsm=request.getSession(true);
	session.setMaxInactiveInterval(900);

	uid=(String)rsm.getValue("userid");
	rsm.putValue("userid",uid);
%>

<DIV class="Object5">
<form name=f method="Post" action="http://www.sanmacs.com/mca_guidance_disscusion_forum/confirmpass.jsp">
<table border=0 cellspacing=0 cellpadding=0>
<tr><td><img src="http://www.sanmacs.com/images2/change_passwords.gif"></img></td></tr>
<tr><td height=15></td></tr>
<tr><th height=20 background="http://www.sanmacs.com/images2/red_strip.gif"><p id="ftp" align="justify" style="margin-left:5px; color:white">Enter Following Details To Change Password</p></th></tr>
<tr><td height=18></td></tr>
<tr><th>
<table border=0 cellspacing=0 cellpadding=3 width=70%>
<tr><th><p id="ftp" align="justify">Old Password</p></th><th><p id="ftp" align="justify"><input type=password name=old_pass></p></th></tr>
<tr><th><p id="ftp" align="justify">New Password</p></th><th><p id="ftp" align="justify"><input type=password name=new_pass></p></th></tr>
<tr><th><p id="ftp" align="justify">Confirm Password</p></th><th><p id="ftp" align="justify"><input type=password name=confirm_pass></p></th></tr>
<tr><th height=10></th></tr>
<tr><th colspan=2><p id="ftp" align="justify" style="margin-left:130px"><input type="button" value="Submit" onClick="check();"></p></th></tr>
</table>
</th></tr>
</table>
</form>
</DIV>

<Div class="Object6">
<table border=0 cellpadding=0 cellspacing=0>
<tr><td><img src="http://www.sanmacs.com/images2/discussion_forum/expert-panel.gif"></img></td></tr>
<tr><td width=177 height=81 bgcolor=#933900></td></tr>
</table>
</Div>

<DIV class="Object8">
<%@ include file="lowlinks.jsp" %>
</DIV>

<DIV class="Object11">
<table border=0 cellspacing=0 cellpadding=0>
<tr><td><embed src="http://www.sanmacs.com/swffiles/du_pune_toppers.swf" wmode=transparent width=106 height=395></embed></td></tr>
</table>
</DIV>

</BODY>
</HTML>