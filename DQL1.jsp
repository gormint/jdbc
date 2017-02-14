<%@page import="java.sql.*"%>
<%
response.setHeader("Pragma", "no-cache");
            response.setHeader("Cache-Control", "no-cache");
            response.setDateHeader("Expires", -1);

  try {
   
	new com.mysql.jdbc.Driver();
      Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "nbuser");

      Statement stmt = conn.createStatement();
	
	String query = "SELECT * FROM accounts";
	ResultSet rs = stmt.executeQuery(query);
	while(rs.next()) {
		out.println(rs.getString("accNum"));
		out.println(rs.getString("holderName"));
		out.println(rs.getString("balance"));
	}

      stmt.close();
      conn.close();
  }catch(Exception e) {out.println(e);}

%>