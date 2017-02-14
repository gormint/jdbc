import java.io.*;
import java.sql.*;
import java.util.*;
class Insert {

  public static void main(String args[]) throws SQLException {
	try {
	  new com.mysql.jdbc.Driver();
	  Connection conn = DriverManager.getConnection("jdbc:mysql://thinkpad:3306/test", "root", "nbuser");

      Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		ResultSet rs = stmt.executeQuery("SELECT * FROM questions");
	  BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream("question.txt")));
	  String line = br.readLine();
	  while (line != null) {
		StringTokenizer st = new StringTokenizer(line, ":");
		String qno = st.nextToken();
		String question = st.nextToken();

		rs.moveToInsertRow();
		rs.updateString(1, qno);
		rs.updateString(2, question);
		rs.insertRow();
		line = br.readLine();
	  }
	  br.close();
	  stmt.close();
	  conn.close();
	} catch (Exception e) {
	  System.out.println(e);
	}

  }
}

