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
DIV.Object3 { position:absolute; top:33px; left:745px; z-index:2; }

DIV.Object5 { position:absolute; top:148px; left:181px; z-index:12;}
DIV.Object6 { position:absolute; top:148px; left:0px; z-index:5; }

DIV.Object7 { position:absolute; top:320px; left:181px; z-index:6; }

DIV.Object9 { position:absolute; left:0px; width:780px; z-index:8;}

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
<%@ include file="toplinks.jsp" %>
</Div>

<Div class="Object2">
<embed src="http://www.sanmacs.com/swffiles/mca_identity.swf" wmode=transparent width=467></embed>
</Div>

<Div class="Object3">
<a href="http://www.sanmacs.com/index.htm"><img src="http://www.sanmacs.com/images2/home.gif" name=imgx onMouseover="imgx.src='http://www.sanmacs.com/images2/home2.gif'" onMouseout="imgx.src='http://www.sanmacs.com/images2/home.gif'" alt=Home border=0></img></a>
</Div>

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
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	con=DriverManager.getConnection("jdbc:odbc:discussion","","");

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
<tr><th width=30% rowspan=3 onmouseout='this.style.backgroundColor=""' onmouseover="this.style.backgroundColor='#CCE6FF'"><p id="ftp" align="center"><a class="lt" href='javascript:openWin("http://www.sanmacs.com/mca_guidance_disscusion_forum/username1.jsp?chk=<%=check %>","profile","toolbar=0, location=0, status=0, menubar=0, scrollbars=0, resizable=0, width=500, height=400, left=150, top=100")'><%=full_name %></a></p></th><td style="border-right:0px"><p id="ftp" align="justify"><b>Posted: </b><%=rs1.getString("Thread_date") %> <%=rs1.getString("Thread_time") %></p></td><td align=right style="border-left:0px"><img border=0 align=absmiddle src="http://www.sanmacs.com/images2/discussion_forum/quote.gif" style="cursor:hand" onClick="alert('You have to login for using this facility');"></img></td></tr>
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
<tr><th width=30% rowspan=3 onmouseout='this.style.backgroundColor=""' onmouseover="this.style.backgroundColor='#CCE6FF'"><p id="ftp" align="center"><a class="lt" href='javascript:openWin("http://www.sanmacs.com/mca_guidance_disscusion_forum/username1.jsp?chk=<%=check1 %>","profile","toolbar=0, location=0, status=0, menubar=0, scrollbars=0, resizable=0, width=500, height=400, left=150, top=100")'><%=full_name1 %></a></p></th><td style="border-right:0px"><p id="ftp" align="justify"><b>Posted: </b><%=rs.getString("Reply_date") %> <%=rs.getString("Reply_time") %></p></td><td align=right style="border-left:0px"><img border=0 align=absmiddle src="http://www.sanmacs.com/images2/discussion_forum/quote.gif" style="cursor:hand" onClick="alert('You have to login for using this facility');"></img></td></tr>
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
<%@ include file="lowlinks.jsp" %>
</DIV>

</BODY>
</HTML>