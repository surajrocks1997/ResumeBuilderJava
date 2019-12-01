<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page language="java" import="java.sql.*"%>

<% Class.forName("com.mysql.jdbc.Driver"); %>

<% 
	String exp = request.getParameter("nextEx");
	if(exp.equals("Add"))
	{
	String employer = request.getParameter("employer");
	String designation = request.getParameter("designation");
	String joinDate = request.getParameter("joiningDate");
	String leaveDate = request.getParameter("leavingDate");
	String workExp = request.getParameter("workExperience");
	String otherDetails = request.getParameter("other");
	
    try {
        
		
        String URL = "jdbc:mysql://localhost/resumedata";
        String USERNAME = "root";
        String PASSWORD = "elite97";
        
        Connection con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        PreparedStatement smt = con.prepareStatement("INSERT INTO work_experiences(employer,designation,joinDate,leaveDate,workExp,otherDetails)"
        											+ "VALUES(?, ?, ?, ?, ?, ?)");
        
        smt.setString(1, employer);
        smt.setString(2, designation);
        smt.setString(3, joinDate);
        smt.setString(4, leaveDate);
        smt.setString(5, workExp);
        smt.setString(6, otherDetails);
        
               
        smt.executeUpdate(); //Through this command all the values get inserted into respective columns of the table 'newstud' in our database 'sakila'
        /* out.println("Data Inserted Successfully!"); //This message gets printed once you click on the sub,it button and everything turns out well. */
        /* response.sendRedirect("UserExperiencesNew.html"); */
        response.sendRedirect("UserAchievementsNew.html?temp="+request.getParameter("temp")+"&name="+request.getParameter("name")+"&school="+request.getParameter("school")+"&employer="+request.getParameter("employer"));
    
    }catch (Exception e) {
        
        System.out.println(e);
}
	}	
	else if(exp.equals("Next"))
 	{
 		response.sendRedirect("UserAchievementsNew.html?temp="+request.getParameter("temp")+"&name="+request.getParameter("name")+"&school="+request.getParameter("school")+"&employer="+request.getParameter("employer"));
 	}

%>