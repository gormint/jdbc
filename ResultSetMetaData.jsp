<%@page import="java.sql.*, java.lang.reflect.*"%>
<%

  try {
	Class.forName("org.gjt.mm.mysql.Driver");
	String url = "jdbc:mysql://localhost:3306/test";
    Connection conn = DriverManager.getConnection(url, "root", "");
      Statement stmt = conn.createStatement();
      ResultSet rs = stmt.executeQuery("SELECT * FROM questions");
	
      ResultSetMetaData rsmd = rs.getMetaData();
	Object obj[] = new Object[1];
	  Method[] methods = rsmd.getClass().getDeclaredMethods();
	  out.println("<table border=\"0\"><tr><td>Method Name</td>");
		for(int j=0;j<rsmd.getColumnCount();j++) 
			out.println("<td>"+rsmd.getColumnName(j+1)+"</td>");
            out.println("</tr>");
	  for (int i = 0; i < methods.length; i++) {
		if(Modifier.isPublic(methods[i].getModifiers()))
		if (methods[i].getParameterTypes().length == 1) {
                  if(!methods[i].getName().equals("isWrapperFor"))
		    if(!methods[i].getName().equals("unwrap")) {
			out.print("<tr><td>"+methods[i].getName()+"</td>");
			for(int j=0;j<rsmd.getColumnCount();j++) {
			  obj[0] = new Integer(j+1);
			  out.print("<td>"+methods[i].invoke(rsmd,obj)+"</td>");
			}
			out.println("</tr>");

		   }
		}
	  }
	  out.println("<table>");

    }catch(Exception e) {e.printStackTrace();}

%>