<%@ page import="java.sql.*" %>
<%
	try {
		String login = request.getParameter("login");
		String oldPassword = request.getParameter("oldPassword");
		String newPassword = request.getParameter("newPassword");

		new com.mysql.jdbc.Driver();
		String url = "jdbc:mysql://thinkpad:3306/test";
		Connection con = DriverManager.getConnection(url, "root", "nbuser");
		Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		String query = "SELECT * FROM users WHERE login='" + login + "'";
		ResultSet rs = stmt.executeQuery(query);
		rs.next();
		String password = rs.getString("password");
		if (password.equals(oldPassword)) {
			System.out.println(password);
			rs.updateString("password", newPassword);
			rs.updateRow();
		}
	} catch (Exception e) {out.println(e); }
%>