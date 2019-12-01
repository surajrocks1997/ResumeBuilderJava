<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page language="java" import="java.sql.*"%>

<% Class.forName("com.mysql.jdbc.Driver"); %>

<% 
	String ach = request.getParameter("nextA");
	if(ach.equals("Add"))
	{
	String name = request.getParameter("achievement");
	String details = request.getParameter("achievementDetails");
	String place = request.getParameter("achievementPlace");
	String date = request.getParameter("achievementDate");
	
	
    try {
        
		
        String URL = "jdbc:mysql://localhost/resumedata";
        String USERNAME = "root";
        String PASSWORD = "elite97";
        
        Connection con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        PreparedStatement stmm = con.prepareStatement("INSERT INTO user_achievements(name,details,place,date)"
        											+ "VALUES(?, ?, ?, ?)");
        
        stmm.setString(1, name);
        stmm.setString(2, details);
        stmm.setString(3, place);
        stmm.setString(4, date);
       
        
               
        stmm.executeUpdate(); //Through this command all the values get inserted into respective columns of the table 'newstud' in our database 'sakila'
        /* out.println("Data Inserted Successfully!"); //This message gets printed once you click on the sub,it button and everything turns out well. */
        /* response.sendRedirect("UserAchievementsNew.html"); */
        response.sendRedirect("UserProjectsNew.html?temp="+request.getParameter("temp")+"&name="+request.getParameter("name")+"&school="+request.getParameter("school")+"&employer="+request.getParameter("employer")+"&achievement="+request.getParameter("achievement"));
    
    }catch (Exception e) {
        
        System.out.println(e);
}
	}	
	else if(ach.equals("Next"))
 	{
 		response.sendRedirect("UserProjectsNew.html?temp="+request.getParameter("temp")+"&name="+request.getParameter("name")+"&school="+request.getParameter("school")+"&employer="+request.getParameter("employer")+"&achievement="+request.getParameter("achievement"));
 	}

%>