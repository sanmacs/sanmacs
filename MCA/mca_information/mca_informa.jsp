<%@ page language="java" import="java.sql.*,java.lang.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<TiTLE>Sanmacs India</TITLE>
<HEAD>
<link rel=stylesheet type=text/css href=http://www.sanmacs.com/MCA/images2/sanmacs2.css>
<link rel=stylesheet type=text/css href=http://www.sanmacs.com/MCA/images2/sanmacs2.1.css>
<style type="text/css">
DIV.Object5 { position:absolute; top:148px; left:181px; width:486px; z-index:4;}
</style>

</HEAD>
<BODY bgcolor="#FFFFFF" topmargin="0" leftmargin="0">

<%!Connection con;
Statement st;
ResultSet rs;
//String university="";
int university;
%>

<%
	try {

	
university=Integer.parseInt(request.getParameter("university"));

	String dns = "jdbc:mysql://sanmacs.db.6936442.hostedresource.com/sanmacs?user=sanmacs&password=macs@123SAN";
	Class.forName("org.gjt.mm.mysql.Driver");
	con= DriverManager.getConnection(dns);

	st=con.createStatement();
	rs=st.executeQuery("Select * from search_index where id="+university+"");
	if (rs.next()==true) {
	response.sendRedirect(""+rs.getString("path_link"));
	}
	else {
	out.println("We did not find results for "+university+".Also try:<br>Check your spelling<br>Try more general words<br>Try different words that mean the same thing");
	}
	con.close();
	} catch(SQLException se) {
	  out.println("SQL Exception :"+se);
	} catch(ClassNotFoundException ce) {
	  out.println("Class Not Found Exception :"+ce);
	} catch(Exception e) {
	  out.println("General Exception :"+e);

	}
finally { out.println("hello"); }


%>

</BODY>
</HTML>