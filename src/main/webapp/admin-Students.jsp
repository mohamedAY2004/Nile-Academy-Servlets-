<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="beans.DB"%>
<%@page import="java.sql.*"%>
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
    <div class="content">
        <!-- Content Section -->
        <div class="container">
            <% 
            Connection conn=DB.getConnection();
            Statement stmt=conn.createStatement();
            ResultSet students=stmt.executeQuery("SELECT * FROM students");
            while (students.next()) {
                int student_id = students.getInt(1);
                String image_name = students.getString(7);
                String student_name = students.getString(2);
                String student_phone = students.getString(4);
                int  student_balance =students.getInt(6);
                out.println("<div class='row'>");
       			out.println("<div class='Information-section'>");
       				out.println("<div class='column'>");
       					out.println(String.format("<img src='retrieveImage?filename=%s'/>", image_name)) ;
       				out.println("</div>");
               		out.println("<div class='column'>");
               			out.println("<h3 class='mini-title'>Student Name</h3>");
               			out.println(String.format("<p>%s</p>", student_name));
         			out.println("</div>");
                   	out.println("<div class='column'>");
                   		out.println("<h3 class='mini-title'>Student Phone</h3>");
                   		out.println(String.format("<p>%s</p>", student_phone));
            		out.println("</div>");
            		out.println("<div class='column'>");
               			out.println("<h3 class='mini-title'>Student Balance</h3>");
               			out.println(String.format("<p>%d</p>", student_balance));
        			out.println("</div>");
                out.println("</div>");
                out.println("<div class='button-area'>");
        			out.println("<button class='Delete-Button'>");
        				out.println(String.format("<a href='admin-DeleteStudent?student_id=%s'>Delete</a>", student_id));
        			out.println("</button>");
        			out.println("<button class='Update-Button'>");
        				out.println(String.format("<a href='admin-UpdateStudent.jsp?student_id=%s'>Update</a>", student_id));
        			out.println("</button>");
        		out.println("</div>");
           out.println("</div>");
            }

            %>
        </div>
        <div>
            <button class="Update-Button">
                <a href="admin-AddStudent.jsp">Add Student</a>
            </button>
        </div>
    </div>
</body>

</html>