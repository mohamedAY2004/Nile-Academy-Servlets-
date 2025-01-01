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
    <title>Nile Academy - Add Course</title>
    <link rel="stylesheet" href="./insertion.css"/>
</head>

<body>
    <form action="AdminAddStudent" method="POST" enctype="multipart/form-data">
        <h1>Nile Academy</h1>

        <label for="student_name">Student Name </label>
        <%
			if(request.getAttribute("student_name_error")!=null){
				out.println(String.format("<a style='color: red;'>%s</a>",(String)request.getAttribute("student_name_error")));
			}
		%>
        <input type="text" id="student_name" name="student_name" placeholder="Enter Student Name" required>
		
		<label for="student_phone">Student Phone </label>
        <%
			if(request.getAttribute("student_phone_error")!=null){
				out.println(String.format("<a style='color: red;'>%s</a>",(String)request.getAttribute("student_phone_error")));
			}
		%>
        <input type="tel" id="student_phone" name="student_phone" placeholder="Enter Student Phone" maxlength="11" required>
        <label for="parent_phone">Parent Phone </label>
       <%
			if(request.getAttribute("parent_phone_error")!=null){
				out.println(String.format("<a style='color: red;'>%s</a>",(String)request.getAttribute("parent_phone_error")));
			}
		%>
        <input type="tel" id="parent_phone" name="parent_phone" placeholder="Enter Parent Phone"  maxlength="11" required>
        <label for="student_pass">Student Password </label>
        <%
			if(request.getAttribute("student_pass_error")!=null){
				out.println(String.format("<a style='color: red;'>%s</a>",(String)request.getAttribute("student_pass_error")));
			}
		%>
        <input type="password" id="student_pass" name="student_pass" placeholder="Enter Password"  required>
        <label for="confirm_pass">Confirm Password</label>
        <input type="password" id="confirm_pass" name="confirm_pass" placeholder="Confirm Password"  required>
        <label for="image">Student Image: </label>
		<%
			if(request.getAttribute("image_error")!=null){
				out.println(String.format("<a style='color: red;'>%s</a>",(String)request.getAttribute("image_error")));
			}
		%>
        <input type="file" name="image" id="image" >
        <input type="submit" name="submit" value="Upload">
        <button class="Delete-Button">
            <a href="admin-Students.jsp">Cancel</a>
        </button>
    </form>
</body>

</html>

