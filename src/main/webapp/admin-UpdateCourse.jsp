<%@page import="beans.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
String Type=(String)session.getAttribute("Type");
if(Type==null || !Type.equals("admins")){
    response.sendRedirect("Welcome.jsp");
    return; // This explicitly stops further execution
}
session.setAttribute("course_id", Integer.parseInt(request.getParameter("course_id")) );
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nile Academy - Add Course</title>
    <link rel="stylesheet" href="./insertion.css"/>
</head>

<body>
    <form action="AdminUpdatecourse" method="POST" enctype="multipart/form-data">
        <h1>Nile Academy</h1>
		
		
        <label for="course_name">Course Name</label>
        <%
			if(request.getAttribute("name_error")!=null){
				out.println(String.format("<h5 style='color: red;'>%s</h5>",(String)request.getAttribute("name_error")));
			}
		%>
        <input type="text" id="course_name" name="course_name" placeholder="Enter Course Name" required>
        <label for="image">Course Image:</label>
        <%
			if(request.getAttribute("image_error")!=null){
				out.println(String.format("<h5 style='color: red;'>%s</h5>",(String)request.getAttribute("image_error")));
			}
		%>
        <input type="file" name="image" id="image" required>
        <input type="submit" name="submit" value="Upload">
        <button class="Delete-Button">
            <a href="admin-Courses.jsp">Cancel</a>
        </button>
    </form>
</body>
</html>