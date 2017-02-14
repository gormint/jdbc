<%@page import="java.sql.*"%>
<%!
	Connection con;
	Statement stmt;
	ResultSet rs;
	String query;
	public void jspInit() {
		try {
			new com.mysql.jdbc.Driver();
			String url = "jdbc:mysql://thinkpad:3306/test";
			con = DriverManager.getConnection(url, "root", "nbuser");
			Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			query = "SELECT * FROM users";
			rs = stmt.executeQuery(query);
			System.out.println("loaded");

		}catch(Exception e) {}
	}
%>
<table border="1">
<tr><th>Login name</th><th>Password</th></tr>
<%
	try {
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", -1);

		rs.beforeFirst();
		while(rs.next()) {
			rs.refreshRow();
			out.println("<tr><td>" + rs.getString("login") + "</td>");
			out.println("<td>" + rs.getString("password")+"</td></tr>");
		}
	}catch(Exception e) {out.println(e);}
%>
</table>