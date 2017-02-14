<%@page import="java.sql.*"%>
<%
response.setHeader("Pragma", "no-cache");
            response.setHeader("Cache-Control", "no-cache");
            response.setDateHeader("Expires", -1);

  try {
    String query = request.getParameter("sql");
    if(query != null) {
    new com.mysql.jdbc.Driver();
      String url = "jdbc:mysql://localhost:3306/test";
      Connection con = DriverManager.getConnection(url, "root", "");
      Statement stmt = con.createStatement();
      if (stmt.execute(query) == false) {
        out.println(stmt.getUpdateCount() + " rows affected");
      } 
	else {
        ResultSet rs = stmt.getResultSet();
        ResultSetMetaData md = rs.getMetaData();
	out.println("<table border=\"1\"><tr>");
        for (int i = 1; i <= md.getColumnCount(); i++) {
          out.print("<th>"+md.getColumnName(i) + "</th>");
        }
	out.println("</tr>");
        while (rs.next()) {
          out.println("<tr>");
          for (int i = 1; i <= md.getColumnCount(); i++) {
            out.print("<td>"+rs.getString(i) + "</td>");
          }
          out.println("</tr>");
        }
	out.println("</table>");
        rs.close();
      }
      stmt.close();
      con.close();
    }
  }catch(Exception e) {out.println(e);}

%>
<form name="sqlForm" method="post">
  SQL statement:<br><input type="text" name="sql" size="40"><br />
  <input type="reset"><input type="submit" value="Execute">
</form>