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
    <title>Admins</title>

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
        <div class="container">
           <%
     		Connection conn=DB.getConnection();
            Statement stmt=conn.createStatement();
            ResultSet admins= stmt.executeQuery("SELECT * FROM admins");
        while (admins.next())
        {
            int admin_id=admins.getInt(1);
			if(admin_id==((Admin)session.getAttribute("Admin")).getAdmin_id())continue;
            String image_name=admins.getString(5);
            String admin_name=admins.getString(2);
            String admin_phone=admins.getString(4);
            out.println("<div class='row'>");
   				out.println("<div class='Information-section'>");
   					out.println("<div class='column'>");
   						out.println(String.format("<img src='retrieveImage?filename=%s'/>", image_name)) ;
   					out.println("</div>");
           			out.println("<div class='column'>");
           				out.println("<h3 class='mini-title'>Admin Name</h3>");
           				out.println(String.format("<p>%s</p>", admin_name));
     				out.println("</div>");
               		out.println("<div class='column'>");
               			out.println("<h3 class='mini-title'>Admin Phone</h3>");
               			out.println(String.format("<p>%s</p>", admin_phone));
        			out.println("</div>");
            	out.println("</div>");
            	out.println("<div class='button-area'>");
					out.println("<button class='Delete-Button'>");
						out.println(String.format("<a href='admin-DeleteAdmin.jsp?admin_id=%s'>Delete</a>", admin_id));
					out.println("</button>");
					out.println("<button class='Update-Button'>");
						out.println(String.format("<a href='admin-UpdateAdmin.jsp?admin_id=%s'>Update</a>", admin_id));
					out.println("</button>");
				out.println("</div>");
			out.println("</div>");
        }
        
        %>
            <!--Single ROW -->
            <!-- <div class="row">
            <div class="Information-section">
                <div class="column">
                    <img src='./uploads/image1.jpg'/>
                </div>
                <div class="column">
                    <h3 class="mini-title">Name</h3>
                    <p>Arabic</p>
                </div>
                <div class="column">
                    <h3 class="mini-title">Id</h3>
                    <p>1</p>
                </div>
            </div>
            <div class="button-area">
                <button class="Delete-Button">
                    <a href="#">Delete</a>
                </button>
                <button class="Update-Button">
                    <a href="#">Update</a>
                </button>
            </div>    
        </div> -->
            <!-- ADD BUTTON -->
        </div>
        <div class="add-button">
            <button class="Update-Button">
                <a href="admin-AddAdmin.jsp">Add Admin</a>
            </button>
        </div>
    </div>
</body>

</html>