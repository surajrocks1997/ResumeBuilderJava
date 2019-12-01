<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
String id = request.getParameter("userId");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "resumedata";
String userId = "root";
String password = "Jarvis#123";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;


%>

<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
Statement stmt1 = connection.createStatement();
String sql ="SELECT * FROM personal_detail"; 
ResultSet rs1 = stmt1.executeQuery(sql);
sql = "SELECT * FROM work_experiences";
Statement stmt2 = connection.createStatement();
ResultSet rs2 = stmt2.executeQuery(sql);
sql = "SELECT * FROM education_details";
Statement stmt3 = connection.createStatement();
ResultSet rs3 = stmt3.executeQuery(sql);
sql = "SELECT * FROM user_projects";
Statement stmt4 = connection.createStatement();
ResultSet rs4 = stmt4.executeQuery(sql);
sql = "SELECT * FROM user_achievements";
Statement stmt5 = connection.createStatement();
ResultSet rs5 = stmt5.executeQuery(sql);

while(rs1.next() && rs2.next() && rs3.next() && rs4.next() && rs5.next())
{
%>
	<h1><%=rs1.getString("name") %> <%=rs1.getString("surname") %></h1>
	<%=rs2.getString("designation") %> 
	<br/>
	<%=rs1.getString("email") %>
	<h2>Objective</h2>
	<%=rs1.getString("career_objectives") %>
	<h2>Education</h2>
	<%=rs3.getString("schoolCollege") %>
	<br/>
	Degree = <%=rs3.getString("degree") %>
	&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
	Stream = <%=rs3.getString("stream") %>
	<br/>
	Graduation Year = <%=rs3.getString("graduation") %>
	&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
	Board = <%=rs3.getString("board") %>
	&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
	Percentage = <%=rs3.getString("percentage") %>
	<br/>
	<h2>Projects Undertaken</h2>
	<h3><%=rs4.getString("title") %></h3>
	<%=rs4.getString("description") %>
	
	
<% 
} 
} 
catch (Exception e) {
e.printStackTrace();
}
%>