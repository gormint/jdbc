
import java.sql.*;

public class JDBCExecuteDemo {

  public static void main(String args[]) {
    if (args.length != 1) {
      System.out.println("usage: java JDBCExecuteDemo sql");
      return;
    }
    try {
      new com.mysql.jdbc.Driver();
      String url = "jdbc:mysql://thinkpad:3306/test";
      Connection con = DriverManager.getConnection(url, "root", "nbuser");
      Statement stmt = con.createStatement();
      if (stmt.execute(args[0]) == false) {
        System.out.println(stmt.getUpdateCount() + " rows affected");
      } else {
        ResultSet rs = stmt.getResultSet();
        ResultSetMetaData md = rs.getMetaData();
        for (int i = 1; i <= md.getColumnCount(); i++) {
          System.out.print(md.getColumnName(i) + " ");
        }
        while (rs.next()) {
          System.out.println();
          for (int i = 1; i <= md.getColumnCount(); i++) {
            System.out.print(rs.getString(i) + " ");
          }
        }
        rs.close();
      }
      stmt.close();
      con.close();
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
}
