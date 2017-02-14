
import java.sql.*;

class UpdatableResultSetDemo {

  public static void main(String args[]) throws SQLException {
    if (changePassword(args[0], args[1], args[2])) {
      System.out.println("Password changed successfully");
    } else {
      System.out.println("Couldn't change password");
    }
  }

  public static boolean changePassword(String login, String oldPassword, String newPassword) {
    try {
      new com.mysql.jdbc.Driver();
      String url = "jdbc:mysql://thinkpad:3306/test";
      Connection conn = DriverManager.getConnection(url, "root", "nbuser");
      String query = "SELECT * FROM users WHERE login='" + login + "'";
      Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
      ResultSet rs = stmt.executeQuery(query);
      rs.next();
      String password = rs.getString("password");
      if (password.equals(oldPassword)) {
        System.out.println(password);
        rs.updateString("password", newPassword);
        rs.updateRow();
        return true;
      }
      stmt.close();
      conn.close();
      return false;
    } catch (Exception e) {
      return false;
    }
  }
}
