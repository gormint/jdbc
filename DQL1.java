
import java.lang.reflect.Method;
import java.sql.*;

class DQL1 {

  public static void main(String args[]) throws SQLException {
	try {

	  new com.mysql.jdbc.Driver();
	  Connection conn = DriverManager.getConnection("jdbc:mysql://thinkpad:3306/test", "root", "nbuser");

	  Statement stmt = conn.createStatement();

	  String query = "SELECT * FROM accounts";
	  ResultSet rs = stmt.executeQuery(query);
	  while (rs.next()) {
		System.out.print(rs.getInt("accNum") + " ");
		System.out.print(rs.getString("holderName") + " ");
		System.out.println(rs.getInt("balance") + " ");
	  }

	  stmt.close();
	  conn.close();
	} catch (Exception e) {
	  System.out.println(e);
	}

  }
}

