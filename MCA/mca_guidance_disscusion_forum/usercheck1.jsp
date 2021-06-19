<%@ page language="java" import="java.sql.*,java.lang.*,java.util.Date,java.util.TimeZone,java.text.SimpleDateFormat" session="true" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<TITLE>Sanmacs India - MCA Entrance Discussion Forum</TITLE>
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
DIV.Object5 { position:absolute; top:68px; left:111px; z-index:1;}
DIV.Object6 { position:absolute; top:148px; left:181px; width:484px; z-index:2;}
</style>
</HEAD>

<BODY topmargin="0" leftmargin="0" onLoad="setTimeout(ft.submit,5000)">
<form name=ft method="Post" action="http://www.sanmacs.com/mca_guidance_disscusion_forum/discussion.jsp">
<%
class CustomBindingListener implements HttpSessionBindingListener {
        ServletContext context;
	String Userid=null;
        public CustomBindingListener(ServletContext context,String Userid) {
        this.context=context;
	this.Userid=Userid;
        }
        public void valueBound(HttpSessionBindingEvent event) {        
		Connection cnt=null;
		Statement stmt=null;
		Statement stmt1=null;
                ResultSet result=null;
                java.util.Date date=new java.util.Date();
                SimpleDateFormat sdf=new SimpleDateFormat("dd/MM/yyyy hh:mm a");
                String zone="IST";
                TimeZone tz=TimeZone.getTimeZone(zone);
                sdf.setTimeZone(tz);
                String date1=sdf.format(date);
                System.out.println(date1);
        try {
                
        	dbconnect db = new dbconnect();
                cnt=db.getConnection();
		stmt=cnt.createStatement();
		stmt1=cnt.createStatement();
                result=stmt.executeQuery("select Total_visit from UserSession where User_id='"+Userid+"'");
                if(result.next()==false) {
                stmt1.executeUpdate("insert into UserSession values('"+Userid+"','"+date1+"',0,'T')");
		}
            
                else {
                 synchronized(this) {
                 stmt1.executeUpdate("update UserSession Set flag='T' where User_id='"+Userid+"'");
                 }
                //System.out.println("In value bound");
              }
            
             }
           catch(ClassNotFoundException e)
    {
      System.out.println("could not load database" + e.getMessage());
    }
    catch(SQLException e)
    {
      System.out.println("SQL exception caught" + e.getMessage());
    }
    catch(Exception e) {}
	finally{
      try
      {
        if(cnt!=null)con.close();
      }
      catch(SQLException ignored)
      {
      }
	}
   }
	public void valueUnbound(HttpSessionBindingEvent event) {
		Connection cnt=null;
		Statement stmt=null;
		Statement stmt1=null;
		ResultSet rs=null;
		java.util.Date date=new java.util.Date();
		SimpleDateFormat sdf=new SimpleDateFormat("dd/MM/yyyy hh:mm a");
		String zone="IST";
		TimeZone tz=TimeZone.getTimeZone(zone);
		sdf.setTimeZone(tz);
		String date1=sdf.format(date);
		try {
		dbconnect db = new dbconnect();
		cnt=db.getConnection();
		stmt=cnt.createStatement();
		stmt1=cnt.createStatement();
		rs=stmt1.executeQuery("select flag from UserSession where User_id='"+Userid+"'");
		String Flag=null;
		if(rs.next()==true) {
			Flag=rs.getString("flag");
			if(Flag.equals("T")) {
				synchronized(this) {
                		stmt.executeUpdate("update UserSession set Total_visit=Total_visit+1, flag='F',Last_visit='"+date1+"' where User_id='"+Userid+"'");
                		}
              		}
                }                  
             }
             catch(Exception e) {}

	}
}		               
%>

<%!Connection con;
Statement st,st1;
ResultSet rs,rs1;
String uid="";
String pass="";
String conid="";
%>
<%
	HttpSession rsm=request.getSession(true);
	session.setMaxInactiveInterval(900);
	session.putValue("bindings.listener", new CustomBindingListener(getServletContext(),Userid));

	uid=request.getParameter("userid");
	pass=request.getParameter("pass");

	Date dt=new java.util.Date();
        SimpleDateFormat sdf=new SimpleDateFormat("hh:mm a");
        String zone="IST";
        TimeZone tz=TimeZone.getTimeZone(zone);
        sdf.setTimeZone(tz);
        String time1=sdf.format(dt);
	String date_time=(dt.getDate())+"/"+(dt.getMonth()+1)+"/"+(dt.getYear()+1900)+" "+time1;
	try {

	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	con=DriverManager.getConnection("jdbc:odbc:discussion","","");

	st=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

	st1=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

	rs=st.executeQuery("Select * from Password where username='"+uid+"' and password='"+pass+"'");
	if (rs.next()==true) {

	rsm.putValue("userid",uid);

	st.executeUpdate("Update UserSession set Last_visit='"+date_time+"' where User_id='"+uid+"'");

	st.executeUpdate("Update UserSession set Total_visit=Total_visit + 1 where User_id='"+uid+"'");

	st.executeUpdate("Update UserSession set flag='Yes' where User_id='"+uid+"'");

	rs1=st1.executeQuery("Select fname,lname,checkid from User2 where email='"+uid+"'");
	rs1.next();
	conid=""+rs1.getString("checkid");
	rsm.putValue("connectid",conid);
%>
<DIV class="Object5">
<table border=0 cellpadding=0 cellspacing=0>
<tr><th><p id="ftp" align=center>With in few seconds, you will be redirected to discussion forum.</p></th></tr>
<tr><th height=20></th></tr>
<tr><th>
<table border=1 cellpadding=0 cellspacing=0 width=550 height=250 bordercolor=#C8C7C4 bgcolor=#DBDBD8>
<tr><th height=36 background="http://www.sanmacs.com/images2/discussion_forum/bg_image2.gif"><img src="http://www.sanmacs.com/images2/discussion_forum/redirecting.gif"></img></th></tr>
<tr><th>
<table border=3 cellpadding=0 width=480 height=150 cellspacing=0 bgcolor=#E6E6E3>
<tr><th>
<table border=0 cellpadding=5 cellspacing=0 width=470 bgcolor=#E6E6E3>
<tr><th><p id="ftp">Thank you for logging in, <font color=red><%=rs1.getString("fname") %> <%=rs1.getString("lname") %></font></p></th></tr>
<tr><th><p id="ftp">If your browser donot support redirection, then please <a class="lt" href="http://www.sanmacs.com/mca_guidance_disscusion_forum/discussion.jsp">Click Here</a>!</p></th></tr>
</table>
</th></tr>
</table>
</th></tr>
</table>
</th></tr>
</table>
</DIV>
<%
	}
	else {
%>
<DIV class="Object6">
<table border=3 cellpadding=4 cellspacing=2 bordercolor=#BDBEBE bordercolorlight=#ADAEAF bordercolordark=#979899>
<tr><td><p id="ftp" align="center" style="font size:18px; color:red"><b>Please enter correct userid and password!</b></p></td></tr>
</table>
</DIV>
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
%>
</form>
</BODY>
</HTML>