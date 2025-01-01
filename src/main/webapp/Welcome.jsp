<%@page import="beans.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	String Type=(String)session.getAttribute("Type");
	if(Type==null){
		response.sendRedirect("Login.jsp");
	}else{
	switch (Type) {
    case "students":
    	response.sendRedirect("student-Courses.jsp");
        break;
    case "teachers":
    	out.println((Teacher)session.getAttribute("Teacher"));
        break;
    case "admins":
    	response.sendRedirect("admin-Courses.jsp");
        break;
}
	}
	%>
</body>
</html>