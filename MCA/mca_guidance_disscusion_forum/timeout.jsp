<%@ page language="java" import="java.sql.*,java.lang.*,java.util.Date,java.util.TimeZone,java.text.SimpleDateFormat" session="true" %>
<jsp:useBean id="tb" class="TBean.TimerBean" scope="session" />
<%
	tb.run();
	tb.stop();
%>
