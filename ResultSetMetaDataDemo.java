import java.sql.*;
import java.lang.reflect.*;
class ResultSetMetaDataDemo {
  public static void main (String args []) throws SQLException  {
    try {
	Class.forName("org.gjt.mm.mysql.Driver");
	String url = "jdbc:mysql://uroy:3306/test";
    Connection conn = DriverManager.getConnection(url, "root", "nbuser");
      Statement stmt = conn.createStatement();
      ResultSet rs = stmt.executeQuery("SELECT * FROM questions");
	
      ResultSetMetaData rsmd = rs.getMetaData();
	Object obj[] = new Object[1];
	  Method[] methods = rsmd.getClass().getDeclaredMethods();
	  for (int i = 0; i < methods.length; i++) {
		if(Modifier.isPublic(methods[i].getModifiers()))
		if (methods[i].getParameterTypes().length == 1) {
                  if(!methods[i].getName().equals("isWrapperFor"))
		    if(!methods[i].getName().equals("unwrap")) {
			System.out.print("\n"+methods[i].getName()+": ");
			for(int j=0;j<rsmd.getColumnCount();j++) {
			  obj[0] = new Integer(j+1);
			  System.out.print(methods[i].invoke(rsmd,obj)+" ");
			}

		   }
		}
	  }

    }catch(Exception e) {e.printStackTrace();}

  }
}

