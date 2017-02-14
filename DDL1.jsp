<%@page import="java.sql.*"%>
<%
	  response.setHeader("Pragma", "no-cache");
	  response.setHeader("Cache-Control", "no-cache");
	  response.setDateHeader("Expires", -1);

	  try {
		new com.mysql.jdbc.Driver();
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");
		Statement stmt = conn.createStatement();

		String create = "CREATE TABLE accounts (			    	" +
		  "  accNum		integer	 primary key,	" +
		  "  holderName	varchar(20),	    		" +
		  "  balance		integer				" +
		  ")";
		stmt.executeUpdate(create);

		String insert = "INSERT INTO accounts VALUES(1,'Uttam K. Roy', 10000)";
		stmt.executeUpdate(insert);
		insert = "INSERT INTO accounts VALUES(2,'Bibhas Ch. Dhara', 20000)";
		stmt.executeUpdate(insert);

		stmt.close();
		conn.close();
	  } catch (Exception e) {
		out.println(e);
	  }

%>