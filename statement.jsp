<%@ page import="java.sql.*" %>
<%

new com.mysql.jdbc.Driver();
Connection con = DriverManager.getConnection("jdbc:mysql://notebook:3306/test", "root", "nbuser");
Statement stmt = con.createStatement();

String create = 	"CREATE TABLE accounts (			    	"+
		      		"  accNum		integer	 primary key,	"+
		      		"  holderName	varchar(20),	    		"+
						"  balance		integer						"+
		      		")";


try {
	stmt.executeUpdate("drop table accounts");
}catch(Exception e) {}

stmt.executeUpdate(create);
String insert = "INSERT INTO accounts VALUES(1,'Uttam K. Roy', 10000)";
stmt.executeUpdate(insert);
insert = "INSERT INTO accounts VALUES(2,'Bibhas Ch. Dhara', 20000)";
stmt.executeUpdate(insert);

%>
<table border="1">
<tr><th>AccNum</th><th>Name</th><th>Balance</th><tr>
<%
String query = "SELECT * FROM accounts";
ResultSet rs = stmt.executeQuery(query);
while (rs.next()) {
	String accNum = rs.getString("accNum");
	String holderName = rs.getString("holderName");
	int balance = rs.getInt("balance");
	out.println("<tr><td>"+accNum+"</td><td>"+holderName+"</td><td>"+balance+"</td></tr>");
}
%>
</table>