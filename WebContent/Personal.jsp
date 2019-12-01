<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page language="java" import="java.sql.*"%>

<% Class.forName("com.mysql.jdbc.Driver"); %>

<% 	
	String str = request.getParameter("nextP");
	if(str.equals("Add"))
	{
	String name = request.getParameter("first");
	String surname = request.getParameter("last");
	String father_name = request.getParameter("fatherName");
	String mother_name = request.getParameter("motherName");
	String dob = request.getParameter("dob");
	String gender = request.getParameter("gender");
	String age = request.getParameter("age");
	
	String nationality = request.getParameter("nationality");
	String address = request.getParameter("address");
	String place = request.getParameter("city");
	String contact = request.getParameter("contact");
	String marital_status = request.getParameter("marital_status");
	String email = request.getParameter("email");
	String languages = request.getParameter("languages");
	String career_objectives = request.getParameter("career");
	String strengths = request.getParameter("strengths");
	String hobbies = request.getParameter("hobbies");
	
	
    try {
    
    		
        String URL = "jdbc:mysql://localhost/resumedata";
        String USERNAME = "root";
        String PASSWORD = "elite97";
        
        Connection con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        PreparedStatement ps = con.prepareStatement("INSERT INTO personal_detail(name,surname,father_name,mother_name,dob,gender,age,nationality,address,place,contact,marital_status,email,languages,career_objectives,strengths, hobbies)"
        											+ "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
        
        ps.setString(1, name);
        ps.setString(2, surname);
        ps.setString(3, father_name);
        ps.setString(4, mother_name);
        ps.setString(5, dob);
        ps.setString(6, gender);
        ps.setString(7, age);
        ps.setString(8, nationality);
        ps.setString(9, address);
        ps.setString(10, place);
        ps.setString(11, contact);
        ps.setString(12, marital_status);
        ps.setString(13, email);
        ps.setString(14, languages);
        ps.setString(15, career_objectives);
        ps.setString(16, strengths);
        ps.setString(17, hobbies);
               
        ps.executeUpdate(); //Through this command all the values get inserted into respective columns of the table 'newstud' in our database 'sakila'
        /* out.println("Data Inserted Successfully!"); //This message gets printed once you click on the submit button and everything turns out well. */
        /* response.sendRedirect("UserEducationNew.html"); */
        response.sendRedirect("UserEducationNew.html?temp="+request.getParameter("temp")+"&name="+request.getParameter("first"));
    
    }catch (Exception e) {
        
        System.out.println(e);
}
	}	
	else if(str.equals("Next"))
 	{
 		response.sendRedirect("UserEducationNew.html?temp="+request.getParameter("temp")+"&name="+request.getParameter("first"));
 	}
%>