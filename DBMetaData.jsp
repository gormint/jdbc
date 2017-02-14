<%@page import="java.sql.*, java.lang.reflect.*"%>
<%
	new com.mysql.jdbc.Driver();
	String url = "jdbc:mysql://localhost:3306/test";
	Connection conn = DriverManager.getConnection(url, "root", "");
	DatabaseMetaData md = conn.getMetaData();
	Method[] methods = md.getClass().getMethods();
	Object[] param = new Object[0];
	out.println("<table border=\"1\">");
	for (int i = 0; i < methods.length; i++) {
		if (methods[i].getParameterTypes().length == 0) {
			if (methods[i].getReturnType() == Boolean.TYPE || methods[i].getReturnType() == String.class) {
				out.println("<tr>");
				out.println("<td>"+methods[i].getName() + "</td>");
				out.println("<td>" + methods[i].invoke(md, param)+"</td>");
				out.println("</tr>");
			}
		}
	}
	out.println("</table>");
%>