<%@page import="beans.DB"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
String Type=(String)session.getAttribute("Type");
if(Type==null || !Type.equals("students")||request.getParameter("teacher_id")==null){
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
    <link rel="stylesheet" href="./tickets.css" />
</head>

<body>

    <!-- Top Dashboard -->
    <div class="top-dashboard">
        <img src="retrieveImage?filename=nile-academy-high-resolution-logo.png" alt="Nile Academy Logo">
        <div>
            <a href="MyAccount.php?student_id=<%=((beans.Student)session.getAttribute("Student")).getStudent_id()%>>">MyAccount</a>
            <a href="Logout">Logout</a>
        </div>
    </div>
    <!-- Cards Section -->
    <div class="card-container">
                    <%
        Connection conn=DB.getConnection();
            Statement stmt=conn.createStatement();
            ResultSet lectures= stmt.executeQuery(String.format("SELECT * FROM lectures WHERE teacher_id='%s'", request.getParameter("teacher_id")));
        while (lectures.next())
        {
            int lecture_id=lectures.getInt(1);
            String lecture_day=lectures.getString(2);
            int starting_hour=lectures.getInt(3);
           out.println("<div class='row'>");
           		out.println("<div class='Information-section'>");
           			out.println("<div class='column'>");
           			out.println("<h3 class='mini-title'>Lecture Day</h3>");
       				out.println(String.format("<p>%s</p>", lecture_day));
       			out.println("</div>");
           			out.println("</div>");
           			out.println("<div class='column'>");
           				out.println("<h3 class='mini-title'>Starting hour</h3>");
           				out.println(String.format("<p>%s</p>", starting_hour));
           			out.println("</div>");
           		out.println("</div>");
                out.println("<div class='button-area'>");
                		out.println("<button class='Update-Button'>");
        				out.println(String.format("<a href='student-RegisterLecture.jsp?lecture_id=%s'>Register</a>", lecture_id) );
        				out.println("</button>");
                out.println("</div>");
           out.println("</div>");
        }
        lectures.close();
        stmt.close();
        conn.close();
        %>

    </div>

</body>

</html>