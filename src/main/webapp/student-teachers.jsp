<%@page import="beans.DB"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
String Type=(String)session.getAttribute("Type");
if(Type==null || !Type.equals("students")||request.getParameter("course_id")==null){
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
            <a href="MyAccount.jsp?student_id=<%=((beans.Student)session.getAttribute("Student")).getStudent_id()%>>">MyAccount</a>
            <a href="Logout">Logout</a>
        </div>
    </div>
    <!-- Cards Section -->
    <div class="card-container">
        <% 
        Connection conn=DB.getConnection();
        Statement stmt=conn.createStatement();
        String sql=String.format( "SELECT * FROM teachers WHERE course_id='%s'", request.getParameter("course_id"));
        ResultSet teachers= stmt.executeQuery(sql);
        while (teachers.next())
        {
            int teacher_id=teachers.getInt(1);
            String teacher_name=teachers.getString(2);
            String teacher_phone=teachers.getString(3);
            int teacher_balance=teachers.getInt(5);
            String image_name=teachers.getString(7);
            out.println(String.format("<a href=student-lectures.jsp?teacher_id=%s>", teacher_id) ) ;
            out.println("<div class='card'>");
            out.println(String.format("<img src='./uploads/%s' alt='%s Image' width='300px' height='200px'>", image_name,teacher_name) );
            out.println("<hr/>") ;
            out.println(String.format("<h3> %s </h3>",teacher_name) ) ;
            out.println("</div>") ;
            out.println("</a>") ;
        }
        teachers.close();
        stmt.close();
        conn.close();
        %>


    </div>

</body>

</html>