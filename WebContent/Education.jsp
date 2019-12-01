<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page language="java" import="java.sql.*"%>

<% Class.forName("com.mysql.jdbc.Driver"); %>

<% 
	String val = request.getParameter("nextE");
	if(val.equals("Add"))
	{
	String schoolCollege = request.getParameter("school");
	String degree = request.getParameter("degree");
	String stream = request.getParameter("stream");
	String graduation = request.getParameter("graduation");
	String board = request.getParameter("board");
	String percentage = request.getParameter("percentage");
	
    try {
        
		
        String URL = "jdbc:mysql://localhost/resumedata";
        String USERNAME = "root";
        String PASSWORD = "elite97";
        
        Connection con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        PreparedStatement st = con.prepareStatement("INSERT INTO education_details(schoolCollege,degree,stream,graduation,board,percentage)"
        											+ "VALUES(?, ?, ?, ?, ?, ?)");
        
        st.setString(1, schoolCollege);
        st.setString(2, degree);
        st.setString(3, stream);
        st.setString(4, graduation);
        st.setString(5, board);
        st.setString(6, percentage);
        
               
        st.executeUpdate(); //Through this command all the values get inserted into respective columns of the table 'newstud' in our database 'sakila'
        /* out.println("Data Inserted Successfully!"); //This message gets printed once you click on the sub,it button and everything turns out well. */
        /* response.sendRedirect("UserEducationNew.html"); */
        response.sendRedirect("UserExperiencesNew.html?temp="+request.getParameter("temp")+"&name="+request.getParameter("name")+"&school="+request.getParameter("school"));
    
    }catch (Exception e) {
        
        System.out.println(e);
}
	}	
	else if(val.equals("Next"))
 	{
		//out.print("UserExperiencesNew.html?temp="+request.getParameter("temp")+"&name="+request.getParameter("name")+"&school="+request.getParameter("school"));
 		response.sendRedirect("UserExperiencesNew.html?temp="+request.getParameter("temp")+"&name="+request.getParameter("name")+"&school="+request.getParameter("school"));
 	}

%>