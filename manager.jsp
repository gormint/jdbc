<%@page import="java.sql.*"%>
<%!
	Connection con;
	Statement stmt;
	String query;
	public void jspInit() {
		try {
			new com.mysql.jdbc.Driver();
			String url = "jdbc:mysql://localhost:3306/test";
			con = DriverManager.getConnection(url, "root", "");
			stmt = con.createStatement();
		}catch(Exception e) {}
	}
	public boolean transfer(int src, int dst, int amount) {
		try {
			query = "SELECT balance FROM accounts WHERE accNum=" + src;
			ResultSet rs = stmt.executeQuery(query);
			rs.next();
			int srcBal = rs.getInt("balance") - amount;
			query = "SELECT balance FROM accounts WHERE accNum=" + dst;
			rs = stmt.executeQuery(query);
			rs.next();
			int dstBal = rs.getInt("balance") + amount;
			return doTransfer(src, dst, srcBal, dstBal);
		} catch (SQLException e) {
			return false;
		}
	}

	public boolean wrongTransfer(int src, int dst, int srcBal, int dstBal) {
		try {
			query = "UPDATE accounts SET balance=" + srcBal + " WHERE accNum=" + src;
			stmt.executeUpdate(query);
			query = "UPDATE accounts SET balance=" + dstBal + " WHERE accNum=" + dst;
			stmt.executeUpdate(query);
			return true;
		} catch (SQLException e) {
			return false;
    		}
  	}

	public boolean doTransfer(int src, int dst, int srcBal, int dstBal) {
		try {
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
 %>

<%
try {
      int src = Integer.parseInt(request.getParameter("src"));
      int dst = Integer.parseInt(request.getParameter("dst"));
      int amount = Integer.parseInt(request.getParameter("amount"));
      transfer(src, dst, amount);
}catch(Exception e) {out.println(e);}
%>