import java.lang.reflect.Method;
import java.sql.*;
class DBMetaData {
  public static void main(String args[]) throws SQLException {
	try {
	  new com.mysql.jdbc.Driver();
	  String url = "jdbc:mysql://uroy:3306/test";
	  Connection conn = DriverManager.getConnection(url, "root", "nbuser");
	  DatabaseMetaData md = conn.getMetaData();
	  Method[] methods = md.getClass().getMethods();
	  Object[] param = new Object[0];
	  for (int i = 0; i < methods.length; i++) {
		if (methods[i].getParameterTypes().length == 0) {
		  if (methods[i].getReturnType() == Boolean.TYPE || methods[i].getReturnType() == String.class) {
			System.out.println(methods[i].getName() + ": " + methods[i].invoke(md, param));
		  }
		}
	  }
	} catch (Exception e) {
	  e.printStackTrace();
	}
  }
}

