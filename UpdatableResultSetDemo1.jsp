<%@ page import="java.sql.*, java.io.*, java.util.*" %>
<%
	try {
		new com.mysql.jdbc.Driver();
		Connection con = DriverManager.getConnection("jdbc:mysql://thinkpad:3306/test", "root", "nbuser");
		Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		ResultSet rs = stmt.executeQuery("SELECT * FROM questions");
		BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(application.getRealPath("/")+"question.txt")));
		String line = br.readLine();
		while (line != null) {
			StringTokenizer st = new StringTokenizer(line, ":");
			String qno = st.nextToken();
			String question = st.nextToken();
	
			rs.moveToInsertRow();
			rs.updateString(1, qno);
			rs.updateString(2, question);
			rs.insertRow();
			line = br.readLine();
		}
		br.close();
	} catch (Exception e) {out.println(e); }
%>