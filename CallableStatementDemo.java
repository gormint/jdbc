import java.sql.*;
class CallableStatementDemo {

  public static void main(String args[]) throws SQLException {
	try {
	  new com.mysql.jdbc.Driver();
	  String url = "jdbc:mysql://thinkpad:3306/test";
	  Connection conn = DriverManager.getConnection(url, "root", "nbuser");
	  String proCall = "{call changePassword(?, ?, ?)}";
	  CallableStatement cstmt = conn.prepareCall(proCall);
	  cstmt.setString(1,args[0]);
	  cstmt.setString(2,args[1]);
	  cstmt.setString(3,args[2]);
	  if(cstmt.executeUpdate() > 0)
	     System.out.println("Password changed successfully");
	  else 
	     System.out.println("Couldn't change password");
	  cstmt.close();
	  conn.close();
	} catch (Exception e) {
	  System.out.println(e);
	}

  }
}

