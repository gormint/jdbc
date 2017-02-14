import java.sql.*;
import java.io.*;
import java.util.*;
class DatabaseMetaDataDemo {
  public static void main (String args []) throws SQLException  {
    try {
	Class.forName("org.gjt.mm.mysql.Driver");
    }catch(Exception e) {e.printStackTrace();}
    Connection conn = DriverManager.getConnection("jdbc:mysql://uroy:3306/test", "root", "nbuser");
    try {
      DatabaseMetaData md = conn.getMetaData();
      System.out.println(md.getDatabaseProductName());
      System.out.println(md.getDatabaseProductVersion());
      System.out.println(md.getDriverName());
      System.out.println(md.getNumericFunctions());
      System.out.println(md.getStringFunctions()+"\n");
      System.out.println(md.getSystemFunctions()+"\n");
      System.out.println(md.getURL());
      System.out.println(md.getUserName());

      System.out.println(md.getSQLKeywords());
    }catch(Exception e) {e.printStackTrace();}

  }
}

