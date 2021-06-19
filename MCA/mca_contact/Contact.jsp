
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'reg.jsp' starting page</title>
    
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <%@ page import="java.sql.*"%>
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    <%@ page import="java.io.*"%>
<%@ page import="sun.net.smtp.SmtpClient"%>
  </head>
  
  <body>
  <%!   

String sendto="sanmacsindia@gmail.com";
String mailsubject="Sanmacs Enquiry";
String mailReply="Re : Sanmacs Enquiry";
String msg;
public String name,phone,email,college,course,enquiry,s1;

%>

<%
try{
name=request.getParameter("name");
phone=request.getParameter("phone");
email=request.getParameter("email");
college=request.getParameter("college");
course=request.getParameter("course");
enquiry=request.getParameter("enquiry");

SmtpClient smtpclient = new SmtpClient("localhost");

		smtpclient.from(email);
		smtpclient.to(sendto);
PrintWriter printwriter = new PrintWriter(smtpclient.startMessage(), true);
printwriter.println("From: " + email);
printwriter.println("To: " + sendto);
printwriter.println("Subject: " + mailsubject + "\n");
printwriter.println("Name: "+name);
printwriter.println("Contact No: "+phone);
printwriter.println("College: "+college);
printwriter.println("Course: "+course);
printwriter.println("Enquiry: "+enquiry);
smtpclient.closeServer();

SmtpClient smtpclient1 = new SmtpClient("localhost");
smtpclient1.from(sendto);
smtpclient1.to(email);
PrintWriter printwriter1 = new PrintWriter(smtpclient1.startMessage(), true);
printwriter1.println("From: " + sendto);
printwriter1.println("To: " + email);
printwriter1.println("Subject: " + mailReply + "\n");
printwriter1.println("Dear "+name+",");
printwriter1.println("");
printwriter1.println("Thanks for the query.");
printwriter1.println("");
printwriter1.println("As you must be aware, SANMACS INDIA pioneered the concept of MCA Entrance coaching in India long back in 1994.");
printwriter1.println("");
printwriter1.println("SANMACS was started and promoted by Dr. Sanjay Aggarwal, who is a Ph.D. in Software Reliability and has been a frequent visitor to foreign countries for delivering lectures on various topics.");
printwriter1.println("");
printwriter1.println("In all these years SANMACS has shown its excellence and expertise in this field by giving numerous top selections in all the top MCA Institutes/Universities. Last year also, 7 Out of First 9 All India Ranks in IIT-JAM MCA Entrance were from Sanmacs (http://www.sanmacs.com/mca_photogallery/iit_jam_2010.htm). Similarly at all other places SANMACSIANS captured majority of seats");
printwriter1.println("");
printwriter1.println("To maintain the quality of deliverance at SANMACS, a large number of lectures are delivered by Dr. Sanjay Aggarwal himself still today. All the major important topics for top MCA entrances are being taught by him.");
printwriter1.println("");
printwriter1.println("His constant endeavour along with his highly skilled and dedicated team has made SANMACS an unchallengeable name in MCA entrance coaching and as a result every subsequent year the more and more students join SANMACS for realising their dream of a good MCA entrance selection.");
printwriter1.println("");
printwriter1.println("This year also, in the very first result declared so far SANMACS has secured 15 selections out of top 21 ranks in IP University(Delhi) (http://www.sanmacs.com/index.htm). Other results are yet to be declared.");
printwriter1.println("");
printwriter1.println("So if you  are really a serious candidate for MCA entrance then it will be appropriate for you to talk to a SANMACS executive  to know more about MCA entrances and the admission process at SANMACS.  You can talk to Ms. Geeta/ Ms. Irem/Ms. Poonam  at Karol Bagh center at (011) 32917966, 28757630, 28757911 or Mr. Kapil/Ms. Preeti at the Rohini Canter at ( 011) 32522575, 32458354,47094119 during 10 am - 6 pm, Tuesday to Sunday.");
printwriter1.println("");
printwriter1.println("The Enrolments this year have already started and are still on.");
printwriter1.println("");
printwriter1.println("All the best for a great future.");
printwriter1.println("");
printwriter1.println("Thanks");
printwriter1.println("");
printwriter1.println("OFFICE OF ADMISSIONS");
printwriter1.println("SANMACS INDIA");
printwriter1.println("");
smtpclient1.closeServer();





%>
<jsp:include page="enquiry_ok.htm"/>
<%

}
catch(Exception e)
{
out.println(e);
}
%>
  </body>
</html>
