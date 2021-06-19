<%@ page language="java" import="java.sql.*,java.lang.*,java.util.Date,java.util.TimeZone,java.text.SimpleDateFormat" session="true" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<TiTLE>Sanmacs India - MCA Entrance Discussion Forum</TITLE>
<HEAD>
<link rel=stylesheet type=text/css href=http://saisan7:8080/www.sanmacs.com/images2/sanmacs2.css>
<link rel=stylesheet type=text/css href=http://saisan7:8080/www.sanmacs.com/images2/sanmacs2.1.css>
<link rel=stylesheet type=text/css href=http://saisan7:8080/www.sanmacs.com/images2/sanmacs2.2.css>
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
DIV.Object5a { position:absolute; top:326px; left:395px; z-index:13;}
DIV.Object5b { position:absolute; top:326px; left:415px; z-index:14;}

DIV.Object6 { position:absolute; top:148px; left:0px; z-index:5; }

DIV.Object7 { position:absolute; top:330px; left:181px; z-index:6; }

DIV.Object9 { position:absolute; top:568px; left:0px; width:780px; z-index:8;}
DIV.Object10 { position:absolute; top:598px; left:0px; width:780px; z-index:9;}

input {font-family:'Arial, Helvetica, sans-serif'; font-size:11px}
textarea {font-family:'Arial, Helvetica, sans-serif'; font-size:11px}
</style>
<script>
function check()
{
	var a=true;
        a=name(document.f1.heading,"Enter a valid Heading!") && name(document.f1.thread,"Enter a valid Description!"); 
	if (a)
	{
		
		f1.submit();
	}
	else
	{
		return false;
	}
}

function name(val1,valx)
{
	var em,c1;
	em=val1.value;
	c1=em.length;
	if (c1<1)
	{
    	alert(valx);
  	  	val1.focus();
     	return false;
  	}
	else {
	return true;
	}
}
</script>
</HEAD>
<BODY bgcolor="#F4F4F4" topmargin="0" leftmargin="0">

<Div class="Object1">
<img src="http://saisan7:8080/www.sanmacs.com/images2/mca_logo.jpg" alt="MCA Entrance"></img>
</Div>

<Div class="Object2">
<embed src="http://saisan7:8080/www.sanmacs.com/swffiles/mca_identity.swf" wmode=transparent width=467></embed>
</Div>

<Div class="Object3">
<a href="http://saisan7:8080/www.sanmacs.com/index.htm"><img src="http://saisan7:8080/www.sanmacs.com/images2/home.gif" name=imgx onMouseover="imgx.src='http://saisan7:8080/www.sanmacs.com/images2/home2.gif'" onMouseout="imgx.src='http://saisan7:8080/www.sanmacs.com/images2/home.gif'" alt=Home border=0></img></a>
</Div>

<DIV class="Object4">
<SCRIPT type=text/javascript src="http://saisan7:8080/www.sanmacs.com/images2/mca_menu.js"></SCRIPT>
<NOSCRIPT>Your browser does not support script</NOSCRIPT> <!-- REST OF BODY CONTENT BELOW HERE -->
</DIV>

<DIV class="Object5">
<table border=0 cellspacing=0 cellpadding=1>
<tr><img src="http://saisan7:8080/www.sanmacs.com/images2/discussion_forum/sanmacs_discussion_forum.gif" width=596></img></td></tr>
<tr><td height=10></td></tr>
<tr><td align=right><form name=fb method="Post" action="http://saisan7:8080/www.sanmacs.com/mca_guidance_disscusion_forum/discussion.jsp"><img src="http://saisan7:8080/www.sanmacs.com/images2/discussion_forum/back.gif" border=0 style="cursor:hand" onClick="fb.submit()"></img> &nbsp; <a href="http://saisan7:8080/www.sanmacs.com/mca_guidance_disscusion_forum/"><img src="http://saisan7:8080/www.sanmacs.com/images2/discussion_forum/logout.gif" border=0></img></a></form></td></tr>
<tr><td align=center>
<table border=2 cellspacing=0 cellpadding=3 bgcolor=#C1C0BD bordercolor=#B1B1B0 width=52%>
<tr>
<th>
<img align=middle title="Cut" name=cut src="http://saisan7:8080/www.sanmacs.com/images2/discussion_forum/cut.gif" onMouseover="cut.src='http://saisan7:8080/www.sanmacs.com/images2/discussion_forum/cut1.gif'" onMouseout="cut.src='http://saisan7:8080/www.sanmacs.com/images2/discussion_forum/cut.gif'" border=0 style="cursor:hand"></img>&nbsp;<img title="Copy" align=middle name=copy src="http://saisan7:8080/www.sanmacs.com/images2/discussion_forum/copy.gif" onMouseover="copy.src='http://saisan7:8080/www.sanmacs.com/images2/discussion_forum/copy1.gif'" onMouseout="copy.src='http://saisan7:8080/www.sanmacs.com/images2/discussion_forum/copy.gif'" border=0 style="cursor:hand"></img>&nbsp;<img title="Paste" align=middle name=paste src="http://saisan7:8080/www.sanmacs.com/images2/discussion_forum/paste.gif" onMouseover="paste.src='http://saisan7:8080/www.sanmacs.com/images2/discussion_forum/paste1.gif'" onMouseout="paste.src='http://saisan7:8080/www.sanmacs.com/images2/discussion_forum/paste.gif'" border=0 style="cursor:hand"></img>
</th>
<th>
<img align=middle title="Background" name=bgcolor src="http://saisan7:8080/www.sanmacs.com/images2/discussion_forum/bgcolor.gif" onMouseover="bgcolor.src='http://saisan7:8080/www.sanmacs.com/images2/discussion_forum/bgcolor1.gif';bg.style.visibility='visible';fg.style.visibility='hidden'" onMouseout="bgcolor.src='http://saisan7:8080/www.sanmacs.com/images2/discussion_forum/bgcolor.gif';" border=0 style="cursor:hand"></img>&nbsp;<img align=middle title="Foreground" name=fgcolor src="http://saisan7:8080/www.sanmacs.com/images2/discussion_forum/fgcolor.gif" onMouseover="fgcolor.src='http://saisan7:8080/www.sanmacs.com/images2/discussion_forum/fgcolor1.gif';fg.style.visibility='visible';bg.style.visibility='hidden'" onMouseout="fgcolor.src='http://saisan7:8080/www.sanmacs.com/images2/discussion_forum/fgcolor.gif'" border=0 style="cursor:hand"></img>
</th>
<th>
<img align=middle title="Bold" name=bold src="http://saisan7:8080/www.sanmacs.com/images2/discussion_forum/bold.gif" onMouseover="bold.src='http://saisan7:8080/www.sanmacs.com/images2/discussion_forum/bold1.gif'" onMouseout="bold.src='http://saisan7:8080/www.sanmacs.com/images2/discussion_forum/bold.gif'" border=0 style="cursor:hand"></img>&nbsp;<img align=middle title="Italic" name=italic src="http://saisan7:8080/www.sanmacs.com/images2/discussion_forum/italic.gif" onMouseover="italic.src='http://saisan7:8080/www.sanmacs.com/images2/discussion_forum/italic1.gif'" onMouseout="italic.src='http://saisan7:8080/www.sanmacs.com/images2/discussion_forum/italic.gif'" border=0 style="cursor:hand"></img>&nbsp;<img align=middle title="Underline" name=underline src="http://saisan7:8080/www.sanmacs.com/images2/discussion_forum/underline.gif" onMouseover="underline.src='http://saisan7:8080/www.sanmacs.com/images2/discussion_forum/underline1.gif'" onMouseout="underline.src='http://saisan7:8080/www.sanmacs.com/images2/discussion_forum/underline.gif'" border=0 style="cursor:hand"></img>
</th>
<th>
<img align=middle title="Left Align" name=leftalign src="http://saisan7:8080/www.sanmacs.com/images2/discussion_forum/leftalign.gif" onMouseover="leftalign.src='http://saisan7:8080/www.sanmacs.com/images2/discussion_forum/leftalign1.gif'" onMouseout="leftalign.src='http://saisan7:8080/www.sanmacs.com/images2/discussion_forum/leftalign.gif'" border=0 style="cursor:hand"></img>&nbsp;<img align=middle title="Right Align" name=rightalign src="http://saisan7:8080/www.sanmacs.com/images2/discussion_forum/rightalign.gif" onMouseover="rightalign.src='http://saisan7:8080/www.sanmacs.com/images2/discussion_forum/rightalign1.gif'" onMouseout="rightalign.src='http://saisan7:8080/www.sanmacs.com/images2/discussion_forum/rightalign.gif'" border=0 style="cursor:hand"></img>&nbsp;<img align=middle title="Center" name=center src="http://saisan7:8080/www.sanmacs.com/images2/discussion_forum/center.gif" onMouseover="center.src='http://saisan7:8080/www.sanmacs.com/images2/discussion_forum/center1.gif'" onMouseout="center.src='http://saisan7:8080/www.sanmacs.com/images2/discussion_forum/center.gif'" borer=0 style="cursor:hand"></img>&nbsp;<img align=middle title="Justify" name=justify src="http://saisan7:8080/www.sanmacs.com/images2/discussion_forum/justify.gif" onMouseover="justify.src='http://saisan7:8080/www.sanmacs.com/images2/discussion_forum/justify1.gif'" onMouseout="justify.src='http://saisan7:8080/www.sanmacs.com/images2/discussion_forum/justify.gif'" border=0 style="cursor:hand"></img>&nbsp;
</th>
<th><img align=middle title="Undo" name=undo src="http://saisan7:8080/www.sanmacs.com/images2/discussion_forum/undo.gif" onMouseover="undo.src='http://saisan7:8080/www.sanmacs.com/images2/discussion_forum/undo1.gif'" onMouseout="undo.src='http://saisan7:8080/www.sanmacs.com/images2/discussion_forum/undo.gif'" border=0 style="cursor:hand"></img>&nbsp;<img align=middle title="Redo" name=redo src="http://saisan7:8080/www.sanmacs.com/images2/discussion_forum/redo.gif" onMouseover="redo.src='http://saisan7:8080/www.sanmacs.com/images2/discussion_forum/redo1.gif'" onMouseout="redo.src='http://saisan7:8080/www.sanmacs.com/images2/discussion_forum/redo.gif'" border=0 style="cursor:hand"></img>
</th>
</tr>
</table>
</td></tr>
</table>
</DIV>

<DIV class="Object5a" id="bg" style="visibility:hidden">
<table border=1 cellspacing=2 cellpadding=0 bgcolor=white bordercolor=#c1c0bd>
<tr><td height=15 width=14 bgcolor=red onClick="f1.thread.style.background='red'"></td><td height=15 width=14 bgcolor=green onClick="f1.thread.style.background='green'"></td><td height=15 width=14 bgcolor=blue onClick="f1.thread.style.background='blue'"></td></tr>
<tr><td height=15 width=14 bgcolor=orange onClick="f1.thread.style.background='orange'"></td><td height=15 width=14 bgcolor=yellow onClick="f1.thread.style.background='yellow'"></td><td height=15 width=14 bgcolor=pink onClick="f1.thread.style.background='pink'"></td></tr>
<tr><td height=15 width=14 bgcolor=cyan onClick="f1.thread.style.background='cyan'"></td><td height=15 width=14 bgcolor=darkcyan onClick="f1.thread.style.background='darkcyan'"></td><td height=15 width=14 bgcolor=gray onClick="f1.thread.style.background='gray'"></td></tr>
<tr><td height=15 width=14 bgcolor=wheat onClick="f1.thread.style.background='wheat'"></td><td height=15 width=14 bgcolor=aquamarine onClick="f1.thread.style.background='aquamarine'"></td><td height=15 width=14 bgcolor=crimson onClick="f1.thread.style.background='crimson'"></td></tr>
</table>
</DIV>

<DIV class="Object5b" id="fg" style="visibility:hidden">
<table border=1 cellspacing=2 cellpadding=0 bgcolor=white bordercolor=#c1c0bd>
<tr><td height=15 width=14 bgcolor=orange onClick="f1.thread.style.color='orange'"></td><td height=15 width=14 bgcolor=yellow onClick="f1.thread.style.color='yellow'"></td><td height=15 width=14 bgcolor=pink onClick="f1.thread.style.color='pink'"></td></tr>
<tr><td height=15 width=14 bgcolor=red onClick="f1.thread.style.color='red'"></td><td height=15 width=14 bgcolor=green onClick="f1.thread.style.color='green'"></td><td height=15 width=14 bgcolor=blue onClick="f1.thread.style.color='blue'"></td></tr>
<tr><td height=15 width=14 bgcolor=wheat onClick="f1.thread.style.color='wheat'"></td><td height=15 width=14 bgcolor=aquamarine onClick="f1.thread.style.color='aquamarine'"></td><td height=15 width=14 bgcolor=crimson onClick="f1.thread.style.color='crimson'"></td></tr>
<tr><td height=15 width=14 bgcolor=cyan onClick="f1.thread.style.color='cyan'"></td><td height=15 width=14 bgcolor=darkcyan onClick="f1.thread.style.color='darkcyan'"></td><td height=15 width=14 bgcolor=gray onClick="f1.thread.style.color='gray'"></td></tr>
</table>
</DIV>

<Div class="Object6">
<table border=0 cellpadding=0 cellspacing=0>
<tr><td><img src="http://saisan7:8080/www.sanmacs.com/images2/discussion_forum/expert-panel.gif"></img></td></tr>
<tr><td width=177 height=104 bgcolor=#933900></td></tr>
</table>
</Div>

<%!String chk="";

%>
<%
	//HttpSession rsm=request.getSession(true);
	//chk=(String)rsm.getValue("connectid");
	//rsm.putValue("check",chk);
%>

<Div class="Object7">
<form name="f1" method="Post" action="http://saisan7:8080/www.sanmacs.com/mca_guidance_disscusion_forum/addthread.jsp">
<table border=0 cellpadding=0 cellspacing=0 width=599>
<tr><th>
<table border=0 cellpadding=2 cellspacing=2 width=80%>
<tr><th width=30%><p id="ftp" align="justify">Heading</p></th><th><p id="ftp" align="justify"><input type=text name="heading" size=30></p></th></tr>
<tr><th valign=top><p id="ftp" align="justify">Thread</p></th><th><p id="ftp" align="justify"><textarea name="thread" cols=70 rows=11 onMouseover="bg.style.visibility='hidden';fg.style.visibility='hidden'"></textarea></p></th></tr>
<tr><th colspan=2><p id="ftp"><input type=button value="Add Thread" onClick="check()"></p></th></tr>
</table>
</th></tr>
</table>
</form>
</Div>

<DIV class="Object9">
<table border=0 cellspacing=2 cellpadding=0 background="http://saisan7:8080/www.sanmacs.com/images2/lowstrip.gif" width=100%>
<tr height=30>
<th valign=top><a class="me" href="http://saisan7:8080/www.sanmacs.com/index.htm" title="Sanmacs Home">Home</a> </th><th><img src="http://saisan7:8080/www.sanmacs.com/images2/lowerline.gif" height=22></img> </th>
<th valign=top><a class="me" href="http://saisan7:8080/www.sanmacs.com/mca_entrance_about_us/identity.htm" title="About MCA Entrance">About Us</a> </th><th><img src="http://saisan7:8080/www.sanmacs.com/images2/lowerline.gif" height=22></img> </th>
<th valign=top><a class="me" href="http://saisan7:8080/www.sanmacs.com/sanmacs_mca_entrance_course/megaleap.htm" title="Enrollment For MCA Entrance Coaching">Megaleap</a> </th><th><img src="http://saisan7:8080/www.sanmacs.com/images2/lowerline.gif" height=22></img> </th>
<th valign=top><a class="me" href="http://saisan7:8080/www.sanmacs.com/mca_entrance_training/mca_entrance_syllabus_of_universities/mca_entrance_syllabus_of_universities.htm" title="Training For MCA Entrance">MCA Training</a> </th><th><img src="http://saisan7:8080/www.sanmacs.com/images2/lowerline.gif" height=22></img> </th>
<th valign=top><a class="me" href="http://saisan7:8080/www.sanmacs.com/mca_entrance_notification/mca_entrance_admission_notification.htm" title="Notification For MCA Entrance">Notification</a> </th><th><img src="http://saisan7:8080/www.sanmacs.com/images2/lowerline.gif" height=22></img> </th>
<th valign=top><a class="me" href="http://saisan7:8080/www.sanmacs.com/mca_entrance_sanmacs_previlege/sanlogin.htm" title="MCA Entrance Previlege">Sanmacs Previlege</a> </th><th><img src="http://saisan7:8080/www.sanmacs.com/images2/lowerline.gif" height=22></img> </th>
<th valign=top><a class="me" href="http://saisan7:8080/www.sanmacs.com/information_for_mca_entrance_students/sanmacs_student_speaks/Student_speaks.htm" title="Student Central For MCA Students">Student Central</a> </th><th><img src="http://saisan7:8080/www.sanmacs.com/images2/lowerline.gif" height=22></img> </th>
<th valign=top><a class="me" href="http://saisan7:8080/www.sanmacs.com/mca_entrance_voyage_of_success/mca_entrance_voyage_of_success.htm" title="Success of MCA Entrance">Voyage of Success</a> </th><th><img src="http://saisan7:8080/www.sanmacs.com/images2/lowerline.gif" height=22></img> </th>
<th valign=top><a class="me" href="http://saisan7:8080/www.sanmacs.com/sanmacs_mca_entrance_alumni/register.htm" title="MCA Alumni">Alumni</a> </th><th><img src="http://saisan7:8080/www.sanmacs.com/images2/lowerline.gif" height=22></img> </th>
<th valign=top><a class="me" href="http://saisan7:8080/www.sanmacs.com/mca_contact/Contact.htm" title="Contact For MCA Training">Contact Us</a> </th>
</tr>
</table>
</DIV>

<DIV class="Object10">
<p id="ft5" align="center" style="BACKGROUND:#D9D5D4; color:#666666; font-weight:bold">All rights reserved. Copyright © Sanmacs India Pvt. Ltd &nbsp;&nbsp;&nbsp;<a href="http://saisan7:8080/www.sanmacs.com/mca_entrance_legal_disclaimer/Legal.htm" title="MCA Entrance Disclaimer">Legal Disclaimer</a></p>
</DIV>

</BODY>
</HTML>