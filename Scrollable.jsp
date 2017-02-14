<%@page import="java.sql.*"%>
<%
response.setHeader("Pragma", "no-cache");
            response.setHeader("Cache-Control", "no-cache");
            response.setDateHeader("Expires", -1);

  try {
    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	new com.mysql.jdbc.Driver();
      Connection con = DriverManager.getConnection("jdbc:mysql://thinkpad:3306/test", "root", "nbuser");

 
        // Create a scrollable result set
        Statement stmt = con.createStatement(
            ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        ResultSet rs = stmt.executeQuery("SELECT * FROM questions");
    
        // Move cursor forward
	while (rs.next()) {
		// Get data at cursor
		String s = rs.getString(1);
		//process it
	}
    
	// Move cursor backward
	while (rs.previous()) {
		// Get data at cursor
		String s = rs.getString(1);
		//process it
	}
    
	// Move cursor to the first row
	rs.first();
    
	// Move cursor to the last row
	rs.last();
    
	// Move cursor to the end, after the last row
	rs.afterLast();
    
	// Move cursor to the beginning, before the first row.
	// cursor position is 0.
	rs.beforeFirst();
    
	// Move cursor to the second row
	rs.absolute(2);
    
	// Move cursor to the last row
	rs.absolute(-1);
    
	// Move cursor to the second last row
	rs.absolute(-2);
    
	// Move cursor down 5 rows from the current row.  If this moves
	// cursor beyond the last row, cursor is put after the last row
	rs.relative(5);
    
	// Move cursor up 3 rows from the current row.  If this moves
	// cursor beyond the first row, cursor is put before the first row
	rs.relative(-3);

	stmt.close();
	con.close();
  }catch(Exception e) {out.println(e);}

%>