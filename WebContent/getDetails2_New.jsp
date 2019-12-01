<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>




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
	<div style="font-weight: bold; color:brown;"><h1><%=rs1.getString("name") %> <%=rs1.getString("surname") %></h1></div>
	<%=rs2.getString("designation") %> 
	<br/>
	<%=rs1.getString("email") %>
	<br/>
	<%=rs1.getString("contact") %>
	<br/>
	<%=rs2.getString("workExp") %>
	
	
	
<div style="font-weight: bold; color:#007BB8;"><h2>Experience</h2></div>

Employer Name = <%=rs2.getString("employer") %>
<br/>
<div style="font-weight: bold">Designation = <%=rs2.getString("designation") %></div>

Join Date = <%=rs2.getString("joinDate") %>

&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp

Leave Date = <%=rs2.getString("leaveDate") %>

<br/>


Other Details = <%=rs2.getString("otherDetails") %>
	


<div class="table-responsive" >
<table class="table table-bordered" style="border-color:black;" align="center" cellpadding="5" cellspacing="5" >
<tr>

</tr>
<td><b>School</b></td>
<td><b>Degree</b></td>
<td><b>Stream</b></td>
<td><b>Graduation</b></td>
<td><b>Board</b></td>
<td><b>Percentage</b></td>
</tr>

<td><%=rs3.getString("schoolCollege") %></td>
<td><%=rs3.getString("degree") %></td>
<td><%=rs3.getString("stream") %></td>
<td><%=rs3.getString("graduation") %></td>
<td><%=rs3.getString("board") %></td>
<td><%=rs3.getString("percentage") %></td>

</tr>
	
<div style="font-weight: bold; color:#007BB8;"><h2>Achievements</h2></div>
Achievement Name = <%=rs5.getString("name") %>

<br/>

Acheivement Details = <%=rs5.getString("details") %>

<br/>

Acheievement Place = <%=rs5.getString("place") %>

&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp

Achievement Date = <%=rs5.getString("date") %>



<div style="font-weight: bold; color:#007BB8;"><h2>Projects</h2></div>

<div style="font-weight: bold">Project Title = <%=rs4.getString("title") %></div>

Description = <%=rs4.getString("description") %>

<br/>

Front End = <%=rs4.getString("frontend") %>

&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp

Back End = <%=rs4.getString("backend") %>

&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp

Output = <%=rs4.getString("output") %> 


<div style="font-weight: bold; color:#007BB8;"><h2>Education</h2></div>
	
	
	
<% 
} 
} 
catch (Exception e) {
e.printStackTrace();
}
%>
</div>