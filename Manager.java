
import java.sql.*;

public class Manager {

  Connection con;
  Statement stmt;

  public Manager() throws SQLException {
    new com.mysql.jdbc.Driver();
    String url = "jdbc:mysql://thinkpad:3306/test";
    con = DriverManager.getConnection(url, "root", "nbuser");
    stmt = con.createStatement();
  }

  public static void main(String args[]) {
    try {
      Manager manager = new Manager();
      manager.transfer(1, 2, 1000);
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }

  public boolean transfer(int src, int dst, int amount) {
    try {
      String query = "SELECT * FROM accounts WHERE accNum=" + src;
      ResultSet rs = stmt.executeQuery(query);
      rs.next();
      int srcBal = rs.getInt("balance") - amount;
      query = "SELECT * FROM accounts WHERE accNum=" + dst;
      rs = stmt.executeQuery(query);
      rs.next();
      int dstBal = rs.getInt("balance") + amount;
      return doBatchTransfer(src, dst, srcBal, dstBal);
    } catch (SQLException e) {
      return false;
    }
  }

  public boolean doTransfer(int src, int dst, int srcBal, int dstBal) {
    try {
      String query;
      con.setAutoCommit(false);
      query = "UPDATE accounts SET balance=" + srcBal + " WHERE accNum=" + src;
      stmt.executeUpdate(query);
      query = "UPDATE accounts SET balance=" + dstBal + " WHERE accNum=" + dst;
      stmt.executeUpdate(query);
      con.commit();
      return true;
    } catch (SQLException e) {
      try {
        con.rollback();
      } catch (SQLException e1) {
      }
      return false;
    }
  }

  public boolean doBatchTransfer(int src, int dst, int srcBal, int dstBal) {
    try {
      String query;
      con.setAutoCommit(false);
      stmt.clearBatch();
      query = "UPDATE accounts SET balance=" + srcBal + " WHERE accNum=" + src;
      stmt.addBatch(query);
      query = "UPDATE accounts SET balance=" + dstBal + " WHERE accNum=" + dst;
      stmt.addBatch(query);
      stmt.executeBatch();
      con.commit();
      return true;
    } catch (SQLException e) {
      try {
        con.rollback();
      } catch (SQLException e1) {
      }
      return false;
    }
  }
}
