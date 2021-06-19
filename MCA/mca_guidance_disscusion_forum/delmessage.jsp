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
DIV.Object7 { position:absolute; top:68px; left:190px; z-index:6; }
input {font-family:'Arial, Helvetica, sans-serif'; font-size:11px}
textarea {font-family:'Arial, Helvetica, sans-serif'; font-size:11px}
</style>

</HEAD>
<BODY bgcolor="#F4F4F4" topmargin="0" leftmargin="0" onLoad="setTimeout(ft.submit,5000)">

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

<%!int chk;
String checkme="";
int msg[];
int counter;
int exact=0;
String eid="";
String forum_type="";
String topic="";

int delmsg[];
int newcount=0;

StringBuffer buf,buf1;
int addmore;

Connection con;
Statement st,st1,st2;
ResultSet rs,rs1,rs2,rs3;
%>

<Div class="Object7">
<form name=ft method="Post" action="http://www.sanmacs.com/mca_guidance_disscusion_forum/inlist.jsp">
<table border=4 cellpadding=5 cellspacing=2 width=400 bgcolor=#ECE9E9 bordercolor=#848483>
<tr><th><p id="ftp" style="font-size:14px; color:#D53F01">Delete Messages</p></th></tr>
<%
	try {
	HttpSession rsm=request.getSession(true);
	session.setMaxInactiveInterval(900);

	checkme=(String)rsm.getValue("check");
	chk=Integer.parseInt(checkme);

	forum_type=(String)rsm.getValue("ftype");

	rsm.putValue("connectid",""+chk);
	rsm.putValue("ftype",forum_type);

	counter=Integer.parseInt(request.getParameter("count"));
	msg=new int[counter];

	exact=0;

	for(int i=0; i<counter; i++) {
	String newdata=request.getParameter("c"+(i+1));

	if (newdata!=null) {
	msg[exact]=Integer.parseInt(newdata);
	}
	else {
	msg[exact]=0;
	}
	exact++;
	}

	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	con=DriverManager.getConnection("jdbc:odbc:discussion","","");

	st=con.createStatement();

	st1=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

	st2=con.createStatement();

	rs=st.executeQuery("Select email from User2 where checkid="+chk+"");
	rs.next();
	String myeid=rs.getString("email");
	rsm.putValue("userid",myeid);

	for(int i=0; i<counter; i++) {
		if (msg[i]!=0) {
		st2.executeUpdate("Delete from message where msid="+msg[i]+"");
%>
<tr><th><p id="ftp" style="font-size:14px" align="justify">Message No. <%=i+1 %> deleted.</p></th></tr>
<%
		}
	}

	buf=new StringBuffer(0);
	buf1=new StringBuffer(0);

	rs2=st1.executeQuery("Select message from message where receiver='"+myeid+"'");

	if (rs2.next()==true) {
	rs2.previous();

	while(rs2.next()==true) {
	buf.append(rs2.getString(1));
	}
	}

	//addmore=102400-buf.capacity();
	addmore=1024-buf.capacity();

	rs3=st1.executeQuery("Select message from suspense_account where receiver='"+myeid+"'");

	if (rs3.next()==true) {
	rs3.previous();
		while(rs3.next()==true) {
		buf1.append(rs3.getString(1));
			if (buf1.capacity() <= addmore) {
			newcount++;
			}
			else {
			break;
			}
		}
	}

	delmsg=new int[newcount];

	SimpleDateFormat sdf=new SimpleDateFormat("dd-MM-yyyy hh:mm a");
	String zone="IST";
	TimeZone tz=TimeZone.getTimeZone(zone);
	sdf.setTimeZone(tz);

	rs1=st1.executeQuery("Select msid,sender,receiver,message,category,rece_date from suspense_account where receiver='"+myeid+"'");

		if (rs1.next()==true) {
		rs1.previous();

			for(int j=0; j<newcount; j++) {
			rs1.next();
			delmsg[j]=rs1.getInt(1);

			Date dt=rs1.getTimestamp(6);
			String timex=sdf.format(dt);
			//System.out.println(timex);
			st2.executeUpdate("Insert into message(sender, receiver, message, category, rece_date) values('"+rs1.getString(2)+"', '"+rs1.getString(3)+"', '"+rs1.getString(4)+"', '"+rs1.getString(5)+"', '"+timex+"')");
			}

			for(int k=0; k<newcount; k++) {
			if (delmsg[k]!=0) {
			st2.executeUpdate("Delete from suspense_account where msid="+delmsg[k]+"");
%>
<tr><th><p id="ftp" style="font-size:14px" align="justify">Message No. <%=k+1 %> added to your account.</p></th></tr>
<%
			}
			}
		}
%>
</table>
<BR>
<center><a class="my1" href="http://www.sanmacs.com/mca_guidance_disscusion_forum/inlist.jsp"><img border=0 name="pro" src="http://www.sanmacs.com/images2/discussion_forum/discussion_proceed.gif" onMouseover="pro.src='http://www.sanmacs.com/images2/discussion_forum/discussion_proceed1.gif'" onMouseout="pro.src='http://www.sanmacs.com/images2/discussion_forum/discussion_proceed.gif'"></img></a></center>
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