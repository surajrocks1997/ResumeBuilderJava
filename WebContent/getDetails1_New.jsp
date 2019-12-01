<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>

<style>
body 
{
text-align: center;
}
</style>

<%
String id = request.getParameter("userId");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "resumedata";
String userId = "root";
String password = "elite97";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;


%>

<div class="row">
<div class="col-sm-3"></div>
<div class="col-sm-6">


<div class="jumbotron" style="background-color:white; padding:30px 30px 30px 30px; border: 5px double;">
<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
Statement stmt1 = connection.createStatement();
String sql ="SELECT * FROM personal_detail where name = '"+request.getParameter("name")+"';"; 
ResultSet rs1 = stmt1.executeQuery(sql);
sql = "SELECT * FROM work_experiences where employer = '"+request.getParameter("employer")+"';";
Statement stmt2 = connection.createStatement();
ResultSet rs2 = stmt2.executeQuery(sql);
sql ="SELECT * FROM education_details where schoolCollege = '"+request.getParameter("school")+"';";
Statement stmt3 = connection.createStatement();
ResultSet rs3 = stmt3.executeQuery(sql);
sql ="SELECT * FROM user_projects where title = '"+request.getParameter("title")+"';";
Statement stmt4 = connection.createStatement();
ResultSet rs4 = stmt4.executeQuery(sql);
sql ="SELECT * FROM user_achievements where name = '"+request.getParameter("achievement")+"';";
Statement stmt5 = connection.createStatement();
ResultSet rs5 = stmt5.executeQuery(sql);

while(rs1.next() && rs2.next() && rs3.next() && rs4.next() && rs5.next())
{
%>
	<div style="font-weight: bold; color:red;"><h1><%=rs1.getString("name") %> <%=rs1.getString("surname") %></h1></div>
	<%=rs2.getString("designation") %> 
	<br/>
	<%=rs1.getString("email") %>
	<br/>
	<%=rs1.getString("contact") %>
	<div style="font-weight: bold; color:#007BB8;"><h2>Objective</h2></div>
	<%=rs1.getString("career_objectives") %>
	<div style="font-weight: bold; color:#007BB8;"><h2>Education</h2></div>
	<%=rs3.getString("schoolCollege") %>
	<br/>
	Degree = <%=rs3.getString("degree") %>
	&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
	Stream = <%=rs3.getString("stream") %>
	<br/>
	Graduation Year = <%=rs3.getString("graduation") %>
	<br/>
	Board = <%=rs3.getString("board") %>
	<br/>
	Percentage = <%=rs3.getString("percentage") %>
	<br/>
	<div style="font-weight: bold; color:#007BB8;"><h2>Projects Undertaken</h2></div>
	<h3><%=rs4.getString("title") %></h3>
	<%=rs4.getString("description") %>
	
	
<% 
} 
} 
catch (Exception e) {
e.printStackTrace();
}
%>
</div>