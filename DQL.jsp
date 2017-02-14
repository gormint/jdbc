<%@page import="java.sql.*"%>
<%
response.setHeader("Pragma", "no-cache");
            response.setHeader("Cache-Control", "no-cache");
            response.setDateHeader("Expires", -1);

  try {
   
	new com.mysql.jdbc.Driver();
      Connection conn = DriverManager.getConnection("jdbc:mysql://uroy:3306/test", "root", "nbuser");

      Statement stmt = conn.createStatement();
	
	String query = "SELECT * FROM users";
	ResultSet rs = stmt.executeQuery(query);
	while(rs.next()) {
		out.println(rs.getString("login"));
		out.println(rs.getString("password")+"<br>");
	}

	//rs = stmt.executeQuery("SELECT login, password FROM USERS");
	//rs.next();
	//out.println("--"+rs.getString(1));

      stmt.close();
      conn.close();
  }catch(Exception e) {out.println(e);}

%>