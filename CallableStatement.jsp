<%@page import="java.sql.*"%>
<%
		try {
			new com.mysql.jdbc.Driver();
			String url = "jdbc:mysql://thinkpad:3306/test";
	  		Connection conn = DriverManager.getConnection(url, "root", "nbuser");
		  	String proCall = "{call changePassword(?, ?, ?)}";
	  		CallableStatement cstmt = conn.prepareCall(proCall);

      String login = request.getParameter("login");
      String oldPassword = request.getParameter("oldPassword");
      String newPassword = request.getParameter("newPassword");


	  		cstmt.setString(1, login);
	  		cstmt.setString(2, oldPassword);
	  		cstmt.setString(3, newPassword);
	  		if (cstmt.executeUpdate() > 0) {
				out.println("Password changed successfully");
	  		} else {
				out.println("Couldn't change password");
	  		}
/*
cstmt.setString(1, "user1");
cstmt.setString(2, "user1");
cstmt.setString(3, "pass1");
cstmt.addBatch();

cstmt.setString(1, "user2");
cstmt.setString(2, "user2");
cstmt.setString(3, "pass2");
cstmt.addBatch();

int [] updateCounts = cstmt.executeBatch();

*/

	  		cstmt.close();
	  		conn.close();
		} catch (Exception e) {
	  	out.println(e);
		}
%>