<%@page import="java.sql.*"%>
<%
response.setHeader("Pragma", "no-cache");
            response.setHeader("Cache-Control", "no-cache");
            response.setDateHeader("Expires", -1);

  try {
    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
/*Class.forName("com.mysql.jdbc.Driver");
Class.forName("org.gjt.mm.mysql.Driver");
Class.forName("oracle.jdbc.driver.OracleDriver");
DriverManager.registerDriver(new sun.jdbc.odbc.JdbcOdbcDriver());
DriverManager.registerDriver(new com.mysql.jdbc.Driver());
DriverManager.registerDriver(new org.gjt.mm.mysql.Driver());

//DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
*/
new com.mysql.jdbc.Driver();
        Connection conn = DriverManager.getConnection("jdbc:mysql://thinkpad:3306/test", "root", "nbuser");

      Statement stmt = conn.createStatement();

	String query = "SELECT * from user";
	ResultSet rs = stmt.executeQuery(query);
      while(rs.next()) {
   	  String login = rs.getString("login");
	  String password = rs.getString("password");
        out.println(login+"\t"+password);
      }

      stmt.close();
      conn.close();
  }catch(Exception e) {out.println(e);}

%>