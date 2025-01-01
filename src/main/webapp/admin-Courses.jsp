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
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Courses</title>
    <link rel="stylesheet" href="./tickets.css">
</head>

<body>
    <!-- Top Dashboard -->
    <div class="top-dashboard">
        <img src="retrieveImage?filename=nile-academy-high-resolution-logo.png" alt="Nile Academy Logo">
        <div>
            <a href="admin-Courses.jsp">Courses</a>
            <a href="admin-Admins.jsp">Admins</a>
            <a href="admin-Students.jsp">Students</a>
            <a href="admin-Teachers.jsp">Teachers</a>
            <a href="Logout">Logout</a>
        </div>
    </div>
    <!-- Content Section -->
    <div class="content">
        <div class="container">
            <%
        Connection conn=DB.getConnection();
            Statement stmt=conn.createStatement();
            ResultSet courses= stmt.executeQuery("SELECT * FROM courses");
        while (courses.next())
        {
            int course_id=courses.getInt(1);
            String course_name=courses.getString(2);
            String image_name=courses.getString(3);
           out.println("<div class='row'>");
           		out.println("<div class='Information-section'>");
           			out.println("<div class='column'>");
           				out.println(String.format("<img src='retrieveImage?filename=%s'/>", image_name)) ;
           			out.println("</div>");
           			out.println("<div class='column'>");
           				out.println("<h3 class='mini-title'>Course Name</h3>");
           				out.println(String.format("<p>%s</p>", course_name));
           			out.println("</div>");
           		out.println("</div>");
                	out.println("<div class='button-area'>");
                		out.println("<button class='Delete-Button'>");
                			out.println(String.format("<a href='admin-DeleteCourse?course_id=%s'>Delete</a>", course_id));
                		out.println("</button>");
                		out.println("<button class='Update-Button'>");
                			out.println(String.format("<a href='admin-UpdateCourse.jsp?course_id=%s'>Update</a>", course_id) );
                		out.println("</button>");
                		
                	out.println("</div>");
           out.println("</div>");
        }
        courses.close();
        stmt.close();
        conn.close();
        %>

        </div>
        <div>
            <button class="Update-Button">
                <a href="admin-AddCourse.jsp">Add Course</a>
            </button>
        </div>
    
    
</body>

</html>