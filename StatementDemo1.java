import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.sql.*;
import java.util.*;
class StatementDemo1 {

  public static void main(String args[]) throws SQLException {
	try {
	  new com.mysql.jdbc.Driver();
	  Connection conn = DriverManager.getConnection("jdbc:mysql://thinkpad:3306/test", "root", "nbuser");

	  Statement stmt = conn.createStatement();
	  BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream("question.txt")));
	  String line = br.readLine();
	  while (line != null) {
		StringTokenizer st = new StringTokenizer(line, ":");
		String qno = st.nextToken();
		String question = st.nextToken();
		String query = "INSERT INTO questions values("+qno+",'"+question+"')";
		System.out.println(query);
		stmt.executeUpdate(query);
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

