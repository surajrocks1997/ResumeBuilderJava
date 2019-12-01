<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page language="java" import="java.sql.*"%>

<% Class.forName("com.mysql.jdbc.Driver"); %>

<% 
	String pro = request.getParameter("nextP");
	String flag = request.getParameter("tempOne");
	if(pro.equals("Add"))
	{
	String title = request.getParameter("title");
	String description = request.getParameter("description");
	String frontend = request.getParameter("frontEnd");
	String backend = request.getParameter("backEnd");
	String output = request.getParameter("output");
	
    try {
        
		
        String URL = "jdbc:mysql://localhost/resumedata";
        String USERNAME = "root";
        String PASSWORD = "elite97";
        
        Connection con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        PreparedStatement stm = con.prepareStatement("INSERT INTO user_projects(title,description,frontend,backend,output)"
        											+ "VALUES(?, ?, ?, ?, ?)");
        
        stm.setString(1, title);
        stm.setString(2, description);
        stm.setString(3, frontend);
        stm.setString(4, backend);
        stm.setString(5, output);
       
        
               
        stm.executeUpdate(); //Through this command all the values get inserted into respective columns of the table 'newstud' in our database 'sakila'
        /* out.println("Data Inserted Successfully!"); */ //This message gets printed once you click on the sub,it button and everything turns out well.
        response.sendRedirect(request.getParameter("temp")+"?name="+request.getParameter("name")+"&school="+request.getParameter("school")+"&employer="+request.getParameter("employer")+"&achievement="+request.getParameter("achievement")+"&title="+request.getParameter("title"));
    }catch (Exception e) {
        
        System.out.println(e);
}
	}	
	else if(pro.equals("Next"))
 	{
		out.println("<script>alert('"+request.getParameter("name")+"');</script>");
 		response.sendRedirect(request.getParameter("temp")+"?name="+request.getParameter("name")+"&school="+request.getParameter("school")+"&employer="+request.getParameter("employer")+"&achievement="+request.getParameter("achievement")+"&title="+request.getParameter("title"));
 		
 	}

%>