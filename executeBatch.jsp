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
      Connection con = DriverManager.getConnection(url, "root", "nbuser");
      Statement stmt = con.createStatement();
      if (stmt.execute(query) == false) {
        out.println(stmt.getUpdateCount() + " rows affected");
      } else {
        ResultSet rs = stmt.getResultSet();
        ResultSetMetaData md = rs.getMetaData();
        for (int i = 1; i <= md.getColumnCount(); i++) {
          out.print(md.getColumnName(i) + " ");
        }
        while (rs.next()) {
          out.println("<br>");
          for (int i = 1; i <= md.getColumnCount(); i++) {
            out.print(rs.getString(i) + " ");
          }
        }
        rs.close();
      }
      stmt.close();
      con.close();
    }
  }catch(Exception e) {out.println(e);}

%>
<form name="sqlForm" method="post">
  sql statement<input type="text" name="sql"><br />
  <input type="reset"><input type="submit" value="Execute">
</form>