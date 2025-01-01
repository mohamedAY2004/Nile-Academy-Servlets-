<%@page import="java.sql.*"%>
<%@page import="beans.DB"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
String Type=(String)session.getAttribute("Type");
if(Type==null || !Type.equals("students")){
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
    <link rel="stylesheet" href="./student-courses.css" />
    <link rel="stylesheet" href="./nav-bar.css" />
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
        String sql="SELECT * FROM courses";
        ResultSet courses= stmt.executeQuery(sql);
        while (courses.next()) {
            int course_id=courses.getInt(1);
            String course_name=courses.getString(2);
            String image_name=courses.getString(3);
            out.println(String.format("<a href=student-teachers.jsp?course_id=%s>", course_id) ) ;
            out.println("<div class='card'>");
            out.println(String.format("<img src='./uploads/%s' alt='%s Image' width='300px' height='200px'>", image_name,course_name) );
            out.println("<hr/>") ;
            out.println(String.format("<h3> %s </h3>",course_name) ) ;
            out.println("</div>") ;
            out.println("</a>") ;
        }
        courses.close();
        stmt.close();
        courses.close();
    %>
    </div>

</body>

</html>