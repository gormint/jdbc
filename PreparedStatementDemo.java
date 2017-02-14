import java.sql.*;
import java.io.*;
import java.util.*;
class PreparedStatementDemo {
  public static void main (String args []) throws SQLException  {
    try {
	Class.forName("org.gjt.mm.mysql.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://thinkpad:3306/test", "root", "nbuser");
	
	PreparedStatement ps = con.prepareStatement("INSERT INTO questions values(?,?)");
	BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream("question.txt")));
	String line = br.readLine();
	while (line != null) {
		StringTokenizer st = new StringTokenizer(line, ":");
		String qno = st.nextToken();
		String question = st.nextToken();
		ps.setString(1, qno);
		ps.setString(2, question);
		ps.executeUpdate();
		line = br.readLine();
	}

      br.close();
    }catch(Exception e) {e.printStackTrace();}
  }
}

