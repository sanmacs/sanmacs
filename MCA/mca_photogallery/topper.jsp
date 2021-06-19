<%@ page language="java" import="java.sql.*,java.lang.*" %>
<HTML>
<TiTLE>Sanmacs India - Delhi University MCA Entrance Result 2005</TITLE>
<HEAD>
<link rel=stylesheet type=text/css href=http://www.sanmacs.com/images2/sanmacs2.css>
<link rel=stylesheet type=text/css href=http://www.sanmacs.com/images2/sanmacs2.1.css>
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<style type="text/css">
DIV.Object111 { position:absolute; top:0px; left:0px; z-index:6; }

<%!int imgphoto=49;
%>

<% for(int i=1;i<=imgphoto;i++) {
%>
DIV.Object<%=i %> { position:absolute; top:0px; left:2px; z-index:6; }
<%
}
%>

DIV.Object91 { position:absolute; top:265px; left:85px; width:518px; z-index:8; }
DIV.Object101 { position:absolute; top:265px; left:0px; z-index:9; }

DIV.Object11.1 { position:absolute; top:371px; left:0px; z-index:10; }

</style>
<script>
function play() {
<% for(int i=1;i<=imgphoto;i++) {
%>
document.all.sam<%=i %>.style.visibility='hidden';
<%
}
%>
}

</script>
</HEAD>
<BODY bgcolor="#FFFFFF" topmargin="0" leftmargin="0">

<Div class="Object111" id="sam0" style="visibility:visible">
<table border=1 cellspacing=5 cellpadding=8 bgcolor=#FFFFFF bordercolor=#0069AA>
<tr>
<td>
<table border=0 cellspacing=0 cellpadding=0>
<tr><th>
<OBJECT classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width=573 height=235 id="du_result" ALIGN="">
 <PARAM NAME=movie VALUE="http://www.sanmacs.com/swffiles/all_entrance_result_2005.swf">
 <PARAM NAME=quality VALUE=high>
 <PARAM NAME="wmode" VALUE="transparent">
 <PARAM NAME="SCALE" VALUE="exactfit">
 <PARAM NAME="menu" VALUE="false">
 <EMBED src="http://www.sanmacs.com/swffiles/du_entrance_result_2005.swf" quality=high wmode=transparent width=573 height=235 NAME="du_result" ALIGN="" TYPE="application/x-shockwave-flash" PLUGINSPAGE="http://www.macromedia.com/go/getflashplayer"> 
 </EMBED>
</OBJECT>
</th></tr>
</table>
</td>
</tr>
</table>
</Div>

<%! Connection con;
ResultSet rs;
Statement st;
int cols=0;
String state="";
String fullname="";
String selected="";
int len=0;
String sel="";
String fin="<br><img src=http://www.sanmacs.com/mca_entrance_toppers/common_images/small.gif></img> ";
String finalx="";
String final1="";
int ind=0;
%>
<%
try {

	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	con=DriverManager.getConnection("jdbc:odbc:pride","","");
        Statement st=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	ResultSet rs=null;
	rs=st.executeQuery("select * from sanmacs_pride1");

	if(rs.next()==true) {
	for(int i=1;i<=imgphoto;i++) {
	state=rs.getString("statement");
	fullname=rs.getString("full_name").toUpperCase();

	selected=rs.getString("selections");
	len=selected.length();

	for(int j=1;j<=len;j++) {
	sel=selected.substring(j-1,j);
	if (sel.equals("|")) {
	finalx=fin + selected.substring(ind,j-1);
	final1+=finalx;
	ind=j;
	}
	}
	ind=0;
%>

<Div class=Object<%=i %> id=sam<%=i %> style="visibility:hidden">
<table border=1 cellspacing=5 cellpadding=8 bgcolor=#0069AA bordercolor=#FFFFFF>
<tr>
<td WIDTH=520 HEIGHT=250>
<table border=0 cellspacing=0 cellpadding=0>
<tr>
<th><img src=<%=rs.getString("pics") %> width=180></img></th>
	<th valign=top>
	<table border=0 cellspacing=0 cellpadding=0 width=390>
	<tr><th valign=top height=215><P ID="ftp2" STYLE="color:white; margin-left:10px; margin-right:5px" align="justify"><font color=red size=4 STYLE="filter: progid:DXImageTransform.Microsoft.Shadow(color='white', Strength=5); width:300;"><%=fullname %></font><%=final1 %><br><br><br><i><font color=orange>"<%=state %>"</font></i></p></th></tr>
	<tr><th colspan=2 valign=bottom align=right><img name=img0 src="http://www.sanmacs.com/mca_entrance_toppers/common_images/close.gif" style="cursor:hand" onMouseOver="img0.src='http://www.sanmacs.com/mca_entrance_toppers/common_images/closex.gif'" onMouseOut="img0.src='http://www.sanmacs.com/mca_entrance_toppers/common_images/close.gif'" onClick="document.all.sam<%=i %>.style.visibility='hidden'"></img></th>
	</table>
	</th>
</tr>
</table>
</td>
</tr>
</table>
</Div>

<%
final1="";
rs.next();
}
%>

<DIV class="Object91" style="background:#75B9E3">
<MARQUEE ID=marq onMouseOver=marq.stop() onMouseOut=marq.start() scrollamount=3 behavior=alternate>
<table border=0 cellspacing=2 cellpadding=0>
<tr>
<td colspan=<%=imgphoto %> height=6 background="http://www.sanmacs.com/mca_entrance_toppers/common_images/framestrip.gif"></td>
</tr>

<tr>
<% rs.first();
for(int i=1;i<=imgphoto;i++) {
%>
<th width=40 height=87><p id="ftp1" align=center><img src=<%=rs.getString("pics") %> width=50 border=0 onClick="play();document.all.sam<%=i %>.style.visibility='visible';" style="cursor:hand"></img><br><%=rs.getString("small_name")%></p></th>
<%
rs.next();
}
%>
</tr>

<tr>
<td colspan=<%=imgphoto %> height=6 background="http://www.sanmacs.com/mca_entrance_toppers/common_images/framestrip.gif"></td>
</tr>
</table>
</MARQUEE>
</Div>

<%
	}
	st.close();
	con.close();
	} catch(SQLException se) {
	  out.println("SQL Exception :"+se);
	} catch(ClassNotFoundException ce) {
	  out.println("Class Not Found Exception :"+ce);
	} catch(Exception e) {
	  out.println("General Exception :"+e);
	}
%>

<DIV class="Object101">
<img src="http://www.sanmacs.com/mca_entrance_toppers/common_images/du_mcatop.jpg"></img>
</DIV>

</BODY>
</HTML>