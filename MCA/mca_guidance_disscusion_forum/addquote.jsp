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
DIV.Object7 { position:absolute; top:68px; left:181px; z-index:6; }
input {font-family:'Arial, Helvetica, sans-serif'; font-size:11px}
textarea {font-family:'Arial, Helvetica, sans-serif'; font-size:11px}
</style>

</HEAD>
<BODY bgcolor="#F4F4F4" topmargin="0" leftmargin="0" onLoad="setTimeout(ft.submit,5000)">

<%!int chk;
String head="";
String repli="";
String getReply="";
String new_reply="";
String eid="";
String forum_type="";
int rep_thid;
int conid;
int quote_id;
int reply_id;
String current="";
String date_time="";

Connection con;
Statement st,st1,st2,st3;
ResultSet rs,rs2,rs3;
%>
<%
	Date dt=new java.util.Date();
        SimpleDateFormat sdf=new SimpleDateFormat("hh:mm a");
        String zone="IST";
        TimeZone tz=TimeZone.getTimeZone(zone);
        sdf.setTimeZone(tz);
        String time1=sdf.format(dt);
	String date=dt.getDate()+"/"+(dt.getMonth()+1)+"/"+(dt.getYear()+1900);

	try {
	HttpSession rsm=request.getSession(true);
	session.setMaxInactiveInterval(900);

	chk=Integer.parseInt((String)rsm.getValue("check"));
	conid=Integer.parseInt((String)rsm.getValue("connectid"));
	quote_id=Integer.parseInt((String)rsm.getValue("quoteid"));
	reply_id=Integer.parseInt((String)rsm.getValue("replyid"));
	current=(String)rsm.getValue("curr");

	forum_type=(String)rsm.getValue("ftype");

	rsm.putValue("connectid",""+conid);

	head=request.getParameter("heading");
	repli=request.getParameter("PlainMsg");

	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	con=DriverManager.getConnection("jdbc:odbc:discussion","","");

	st=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

	st1=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

	st2=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

	st3=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

	rs=st.executeQuery("Select fname,lname,email from User2 where checkid="+conid+"");
	rs.next();
	eid=rs.getString("email");
	rsm.putValue("userid",eid);

	rs2=st2.executeQuery("Select Reply_id from Reply");
	rs2.last();
	rep_thid=(Integer.parseInt(rs2.getString("Reply_id"))+1);


	if (current.equals("Thread")) {
	rs3=st3.executeQuery("Select fname,lname,Thread_date,Thread_time from User2,Thread where checkid="+quote_id+" and Thread_id="+reply_id+" and Thread.User_id=User2.email");
	rs3.next();
	date_time=rs3.getString("Thread_date")+" "+rs3.getString("Thread_time");
	}
	else if(current.equals("Reply")) {
	rs3=st3.executeQuery("Select fname,lname,Reply_date,Reply_time from User2,Reply where checkid="+quote_id+" and Reply_id="+reply_id+" and Reply.Reply_from=User2.email");
	rs3.next();
	date_time=rs3.getString("Reply_date")+" "+rs3.getString("Reply_time");
	}
	getReply="[ Originally posted by "+rs3.getString("fname")+" "+rs3.getString("lname")+" "+date_time+" ]";
	new_reply=getReply+"<br>"+repli;

	st1.executeUpdate("Insert into Reply(Thread_id,Reply_from,Reply_head,Reply,Reply_date,Reply_time) values("+chk+",'"+eid+"','"+head+"','"+new_reply+"','"+date+"','"+time1+"')");

	st1.executeUpdate("Update Thread set Latest_replyid="+rep_thid+" where Thread_id="+chk+"");
%>
<Div class="Object7">
<form name=ft method="Post" action="http://www.sanmacs.com/mca_guidance_disscusion_forum/topic.jsp">
<input type=hidden name="topic" value=<%=chk %>>
<table border=4 cellpadding=5 cellspacing=2 width=400 bgcolor=#ECE9E9 bordercolor=#848483>
<tr><th><p id="ftp" style="font-size:14px; color:#D53F01">Forum Alert!</p></th></tr>
<tr><th><p id="ftp" style="font-size:14px" align="justify">“Thank you for your reply! After being approved, it will be posted in the forum. Please contact for checking your posting.”</p></th></tr>
</table>
<bR>
<center><a class="my1" href="http://www.sanmacs.com/mca_guidance_disscusion_forum/topic.jsp"><img border=0 name="pro" src="http://www.sanmacs.com/images2/discussion_forum/discussion_proceed.gif" onMouseover="pro.src='http://www.sanmacs.com/images2/discussion_forum/discussion_proceed1.gif'" onMouseout="pro.src='http://www.sanmacs.com/images2/discussion_forum/discussion_proceed.gif'"></img></a></center>
</form>
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
</BODY>
</HTML>