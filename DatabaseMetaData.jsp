<%@page import="java.sql.*, java.lang.reflect.*"%>
<%
	try {
	Class.forName("org.gjt.mm.mysql.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");
	DatabaseMetaData md = conn.getMetaData();
%>
	<table border="1" width="400">
	<tr><td>DatabaseProductName</td><td><%= md.getDatabaseProductName()%></td></tr>
	<tr><td>DatabaseProductVersion</td><td><%=md.getDatabaseProductVersion()%></td></tr>
	<tr><td>DriverName</td><td><%=md.getDriverName()%></td></tr>
	<tr><td>NumericFunctions</td><td><%=md.getNumericFunctions()%></td></tr>
	<tr><td>StringFunctions</td><td><%=md.getStringFunctions()%></td></tr>
	<tr><td>SystemFunctions</td><td><%=md.getSystemFunctions()%></td></tr>
	<tr><td>URL</td><td><%=md.getURL()%></td></tr>
	<tr><td>UserName</td><td><%=md.getUserName()%></td></tr>
	<tr><td>SQLKeywords</td><td><%=md.getSQLKeywords()%></td></tr>
	</table>
<%
    }catch(Exception e) {out.println(e);}
%>