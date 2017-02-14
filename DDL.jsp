<%@page import="java.sql.*"%>
<%
response.setHeader("Pragma", "no-cache");
            response.setHeader("Cache-Control", "no-cache");
            response.setDateHeader("Expires", -1);

  try {
        //Class.forName("com.mysql.jdbc.Driver");

	//new com.mysql.jdbc.Driver();
        DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());

 //     Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@172.16.4.124:1521:ibmora", "scott", "tiger");

      Statement stmt = conn.createStatement();

	String create = 	"CREATE TABLE users (			    	"+
			      	"  login	varchar(20) primary key,	"+
			      	"  password	varchar(20)		    	"+
			      	")";
	stmt.executeUpdate(create);
//stmt.executeUpdate("drop table users");

	String insert = "INSERT INTO users VALUES('user1','pass1')";
	stmt.executeUpdate(insert);
	insert = "INSERT INTO users VALUES('user2','pass2') ";
	stmt.executeUpdate(insert);

      stmt.close();
      conn.close();
  }catch(Exception e) {out.println(e);}

%>