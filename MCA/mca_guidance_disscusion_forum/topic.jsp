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

DIV.Object7 { position:absolute; top:290px; left:181px; z-index:6; }

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

<Div class="Object1">
<%@ include file="toplinks.jsp" %>
</Div>

<Div class="Object2">
<embed src="http://www.sanmacs.com/swffiles/mca_identity.swf" wmode=transparent width=467></embed>
</Div>

<%!Connection con;
Statement st,st1,st2,st3;
ResultSet rs,rs1,rs2;

Statement stmt,stmt1;
ResultSet res,res1;

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
int contid;

String  activity="";
String active_status="";
%>
<%
	HttpSession rsm=request.getSession(true);
	session.setMaxInactiveInterval(900);

	forum_type=(String)rsm.getValue("ftype");
	conid=(String)rsm.getValue("connectid");
	rsm.putValue("connectid",conid);
	contid=Integer.parseInt(conid);
	rsm.putValue("ftype",forum_type);
	topic1=Integer.parseInt(request.getParameter("topic"));
	
	try {
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
<table border=0 cellspacing=0 cellpadding=0 width=100%>
<form name=fb method=Post action="http://www.sanmacs.com/mca_guidance_disscusion_forum/discussion.jsp">
<tr><td><img src="http://www.sanmacs.com/images2/discussion_forum/sanmacs_discussion_forum.gif" width=596></img></td></tr>
<tr><td align=right>
<a href="javascript:fb.submit()"><img src="http://www.sanmacs.com/images2/discussion_forum/back.gif" border=0></img></a> &nbsp; 
<a href="http://www.sanmacs.com/mca_guidance_disscusion_forum/thread.jsp"><img src="http://www.sanmacs.com/images2/discussion_forum/new_post.gif" border=0></img></a> &nbsp; 
<a href="http://www.sanmacs.com/mca_guidance_disscusion_forum/reply.jsp"><img src="http://www.sanmacs.com/images2/discussion_forum/post_reply.gif" border=0></img></a> &nbsp; 
<a href="http://www.sanmacs.com/mca_guidance_disscusion_forum/logout.jsp"><img src="http://www.sanmacs.com/images2/discussion_forum/logout.gif" border=0></img></a>
<td></tr>
<tr><td align=right>
<a href="http://www.sanmacs.com/mca_guidance_disscusion_forum/inlist.jsp"><img src="http://www.sanmacs.com/images2/discussion_forum/inbox.gif" border=0></img></a> &nbsp; 
<a href="http://www.sanmacs.com/mca_guidance_disscusion_forum/outlist.jsp"><img src="http://www.sanmacs.com/images2/discussion_forum/outbox.gif" border=0></img></a>
<td></tr>
</table>
</form>
</DIV>
<%
	st1=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

	st=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

	st2=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

	st3=con.createStatement();

	st3.executeUpdate("Update Thread set Views=Views+1 where Thread_id="+topic1+"");

	rs1=st1.executeQuery("Select Thread.User_id, Heading, Question, Thread_date, Thread_time, checkid, fname, lname, flag from Thread, User2, UserSession where Thread_id="+topic1+" and Thread.User_id=User2.email and Thread.User_id=UserSession.User_id and User2.email=UserSession.User_id");
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

	activity=rs1.getString("flag");

	if (activity.equals("No")) {
	active_status="Offline";
	}
	else if(activity.equals("Yes")) {
	active_status="Online";
	}

	rsm.putValue("my_topic",""+topic1);
%>
<tr><th width=30% rowspan=3 onmouseout='this.style.backgroundColor=""' onmouseover="this.style.backgroundColor='#CCE6FF'"><p id="ftp" align="center"><a class="lt" href='javascript:openWin("http://www.sanmacs.com/mca_guidance_disscusion_forum/username.jsp?chk=<%=check %>","profilex","toolbar=0, location=0, status=0, menubar=0, scrollbars=0, resizable=0, width=500, height=400, left=150, top=100")'><%=full_name %></a><br>(<%=active_status %>)</p></th><td style="border-right:0px"><p id="ftp" align="justify"><b>Posted: </b><%=rs1.getString("Thread_date") %> <%=rs1.getString("Thread_time") %></p></td><td align=right style="border-left:0px"><a href='http://www.sanmacs.com/mca_guidance_disscusion_forum/quote.jsp?check=<%=check %>&reply_id=<%=topic1 %>&current=<%="Thread" %>'><img border=0 align=absmiddle src="http://www.sanmacs.com/images2/discussion_forum/quote.gif"></img></a></td></tr>
<tr><td id=ntv colspan=2><p id="ftp" align="justify"><%=rs1.getString("Question") %></p></td></tr>
<tr><td colspan=2><a href='http://www.sanmacs.com/mca_guidance_disscusion_forum/search.jsp?check=<%=check %>'><img src="http://www.sanmacs.com/images2/discussion_forum/search.gif" border=0></img></a></td></tr>
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
<tr><th width=30% rowspan=3 onmouseout='this.style.backgroundColor=""' onmouseover="this.style.backgroundColor='#CCE6FF'"><p id="ftp" align="center"><a class="lt" href='javascript:openWin("http://www.sanmacs.com/mca_guidance_disscusion_forum/username.jsp?chk=<%=check1 %>","profile<%=count %>","toolbar=0, location=0, status=0, menubar=0, scrollbars=0, resizable=0, width=500, height=400, left=150, top=100")'><%=full_name1 %></a><br>(<%=active_status %>)</p></th><td style="border-right:0px"><p id="ftp" align="justify"><b>Posted: </b><%=rs.getString("Reply_date") %> <%=rs.getString("Reply_time") %></p></td><td align=right style="border-left:0px"><a href='http://www.sanmacs.com/mca_guidance_disscusion_forum/quote.jsp?check=<%=check1 %>&reply_id=<%=rep_id %>&current=<%="Reply" %>'><img border=0 align=absmiddle src="http://www.sanmacs.com/images2/discussion_forum/quote.gif"></img></a></td></tr>
<tr><td id=ntv1 colspan=2><p id="ftp" align="justify"><b>Heading:</b> <%=rep_head %><br><b>Reply:</b> <%=rs.getString("Reply") %></p></td></tr>
<tr><td colspan=2><a href='http://www.sanmacs.com/mca_guidance_disscusion_forum/search.jsp?check=<%=check1 %>'><img src="http://www.sanmacs.com/images2/discussion_forum/search.gif" border=0></img></a></td></tr>
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
	}
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

<Div class="Object6">
<table border=0 cellpadding=0 cellspacing=0>
<tr><td><img src="http://www.sanmacs.com/images2/discussion_forum/expert-panel.gif"></img></td></tr>
<tr><td width=177 height=<%=(34+((counter)*270))%> bgcolor=#933900></td></tr>
</table>
</Div>

<DIV class="Object9" style="top:<%=(498+((counter)*270))%>px;">
<%@ include file="lowlinks.jsp" %>
</DIV>

</BODY>
</HTML>