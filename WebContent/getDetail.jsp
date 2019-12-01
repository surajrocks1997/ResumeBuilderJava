


<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<style>
body 
{
border: 5px solid black;
padding-top: 20px;
padding-bottom: 20px;
border-spacing: 15px 80px;
text-align: center;
margin-right: 600px;
margin left: 600px;
}
</style>

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
Statement statement = null;
ResultSet resultSet = null;
%>
	
<h1 align="center"><font><strong>Resume</strong></font></h1>
<h2 align="center"><font><strong>Personal Details</strong></font></h2>

<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM personal_detail where name = '"+request.getParameter("name")+"';";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<div style="font-weight: bold"><%=resultSet.getString("name") %> <%=resultSet.getString("surname") %></div>

Father's Name = <%=resultSet.getString("father_name") %>

&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp

Mother's Name = <%=resultSet.getString("mother_name") %>

<br/>

Date of Birth = <%=resultSet.getString("dob") %>

</br>

Gender = <%=resultSet.getString("gender") %>

</br>

Age = <%=resultSet.getString("age") %>

<br/>

Nationality = <%=resultSet.getString("nationality") %>

<br/>

Address = <%=resultSet.getString("address") %>

</br>

Place = <%=resultSet.getString("place") %>

<br/>

Contact = <%=resultSet.getString("contact") %>

</br>

Marital Status = <%=resultSet.getString("marital_status") %>

<br/>

Email = <%=resultSet.getString("email") %>

</br>

Languages = <%=resultSet.getString("languages") %>

<br/>

<div style="font-weight: bold">Career Objectives = <%=resultSet.getString("career_objectives") %></div>

<div style="font-weight: bold">Strengths = <%=resultSet.getString("strengths") %></div>

Hobbies = <%=resultSet.getString("hobbies") %>

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
</table>

<h2 align="center"><font><strong>Educational Details</strong></font></h2>
<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>

</tr>
<td><b>School</b></td>
<td><b>Degree</b></td>
<td><b>Stream</b></td>
<td><b>Graduation</b></td>
<td><b>Board</b></td>
<td><b>Percentage</b></td>
</tr>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM education_details where schoolCollege = '"+request.getParameter("school")+"';";
	
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>

<td><%=resultSet.getString("schoolCollege") %></td>
<td><%=resultSet.getString("degree") %></td>
<td><%=resultSet.getString("stream") %></td>
<td><%=resultSet.getString("graduation") %></td>
<td><%=resultSet.getString("board") %></td>
<td><%=resultSet.getString("percentage") %></td>

</tr>

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
</table>


<h2 align="center"><font><strong>Work Experience</strong></font></h2>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM work_experiences where employer = '"+request.getParameter("employer")+"';";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>

Employer Name = <%=resultSet.getString("employer") %>
<br/>
<div style="font-weight: bold">Designation = <%=resultSet.getString("designation") %></div>

Join Date = <%=resultSet.getString("joinDate") %>

 &nbsp &nbsp &nbsp

Leave Date = <%=resultSet.getString("leaveDate") %>

<br/>

Work Experience = <%=resultSet.getString("workExp") %>



Other Details = <%=resultSet.getString("otherDetails") %>

<br/>
<br/>
<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
</table>

<h2 align="center"><font><strong>Achievement Details</strong></font></h2>

<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM user_achievements where name = '"+request.getParameter("achievement")+"';";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>

Achievement Name = <%=resultSet.getString("name") %>

<br/>

Acheivement Details = <%=resultSet.getString("details") %>

<br/>

Acheievement Place = <%=resultSet.getString("place") %>

&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp

Achievement Date = <%=resultSet.getString("date") %>

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
</table>

<h2 align="center"><font><strong>Project Details</strong></font></h2>

<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM user_projects where title = '"+request.getParameter("title")+"';";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>

<div style="font-weight: bold">Project Title = <%=resultSet.getString("title") %></div>

Description = <%=resultSet.getString("description") %>

<br/>

Front End = <%=resultSet.getString("frontend") %>

&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp

Back End = <%=resultSet.getString("backend") %>

&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp

Output = <%=resultSet.getString("output") %> 


<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
