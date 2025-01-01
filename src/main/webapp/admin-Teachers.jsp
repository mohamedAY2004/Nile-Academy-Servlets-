<%@page import="beans.DB"%>
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
    <title>Admin View</title>

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
         ResultSet teachers=stmt.executeQuery("SELECT * FROM teachers");
        while (teachers.next())
        {
            int teacher_id=teachers.getInt(1);
            String teacher_name=teachers.getString(2);
            String teacher_phone=teachers.getString(3);
            int teacher_balance=teachers.getInt(5);
            String image_name=teachers.getString(7);
            out.println("<div class='row'>");
       			out.println("<div class='Information-section'>");
       				out.println("<div class='column'>");
       					out.println(String.format("<img src='retrieveImage?filename=%s'/>", image_name)) ;
       				out.println("</div>");
               		out.println("<div class='column'>");
               			out.println("<h3 class='mini-title'>Teacher Name</h3>");
               			out.println(String.format("<p>%s</p>", teacher_name));
         			out.println("</div>");
                   	out.println("<div class='column'>");
                   		out.println("<h3 class='mini-title'>Teacher Phone</h3>");
                   		out.println(String.format("<p>%s</p>", teacher_phone));
            		out.println("</div>");
            		out.println("<div class='column'>");
           				out.println("<h3 class='mini-title'>Teacher Balance</h3>");
           				out.println(String.format("<p>%d</p>", teacher_balance));
    			out.println("</div>");
                out.println("</div>");
                out.println("<div class='button-area'>");
        			out.println("<button class='Delete-Button'>");
        				out.println(String.format("<a href='admin-DeleteTeacher.jsp?teacher_id=%s'>Delete</a>", teacher_id));
        			out.println("</button>");
        			out.println("<button class='Update-Button'>");
        				out.println(String.format("<a href='admin-UpdateTeacher.jsp?teacher_id=%s'>Update</a>", teacher_id) );
        			out.println("</button>");
        		out.println("</div>");
           out.println("</div>");
        }
        teachers.close();
        stmt.close();
        conn.close();
        %>
        </div>
        <button class="Update-Button">
            <a href="admin-AddTeacher.jsp">Add Teacher</a>
        </button>
    </div>
</body>

</html>