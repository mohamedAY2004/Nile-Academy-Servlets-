<%@page import="java.sql.*"%>
<%@page import="beans.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Nile Academy</title>
    <link rel="stylesheet" href="./Login.css"/>
</head>

<body>
    <div class="logo">
        <img src="retrieveImage?filename=nile-academy-high-resolution-logo.png" alt="Nile Academy Logo">
    </div>
    <form action="Login.jsp" method="post">
        <fieldset>
            <legend>Login</legend>
            <% 
            if (request.getParameter("submit")!=null) 
            {
                Connection conn=beans.DB.getConnection();
                
                String phone = request.getParameter("phone");
                String password = request.getParameter("password");
                String Type = request.getParameter("Type");
                String sql = "";
                switch (Type) {
                    case "students":
                        sql =String.format("SELECT * FROM  %s  WHERE student_phone='%s' AND student_pass='%s' ",Type,phone,password) ;
                        break;
                    case "teachers":
                        sql =String.format("SELECT * FROM %s WHERE teacher_phone='%s' AND teacher_pass='%s' ", Type,phone,password) ;
                        break;
                    case "admins":
                        sql =String.format("SELECT * FROM %s WHERE admin_phone='%s' AND admin_pass='%s' ", Type,phone,password) ;
                        break;
                }
                Statement stmt=conn.createStatement();
                ResultSet rs=stmt.executeQuery(sql);
                if (rs.next()) {
                    session.setAttribute("Type", Type);
                    switch(Type){
                    
                    case "students":
                    	Student student=new Student();
                    	student.setStudent_id(rs.getInt(1));
                    	student.setStudent_name(rs.getString(2));
                    	student.setStudent_pass(rs.getString(3));
                    	student.setStudent_phone(rs.getString(4));
                    	student.setParent_phone(rs.getString(5));
                    	student.setStudent_balance(rs.getInt(6));
                    	student.setImage_name(rs.getString(7));
                    	session.setAttribute("Student",student);   
                        break;
                    case "teachers":
                    	Teacher teacher=new Teacher();
                    	teacher.setTeacher_id(rs.getInt(1));
                    	teacher.setTeacher_name(rs.getString(2));
                    	teacher.setTeacher_phone(rs.getString(3));
                    	teacher.setTeacher_pass(rs.getString(4));
                    	teacher.setTeacher_balance(rs.getInt(5));
                    	teacher.setImage_name(rs.getString(6));
                    	session.setAttribute("Teacher",teacher);   
                        break;
                    case "admins":
                    	Admin admin=new Admin();
                    	admin.setAdmin_id(rs.getInt(1));
                    	admin.setAdmin_name(rs.getString(2));
                    	admin.setAdmin_pass(rs.getString(3));
                    	admin.setAdmin_phone(rs.getString(4));
                    	admin.setImage_name(rs.getString(5));
                    	session.setAttribute("Admin",admin);   
                        break;
                    
                    
                    }
                    response.sendRedirect("Welcome.jsp");
                } else {
                    out.println("<div class='error-message'>Wrong phone number or password or type</div>");
                }
                rs.close();
                stmt.close();
                conn.close();
            }
            %>

            <label for="phone">Phone:</label>
            <input type="tel" id="phone" placeholder="Write your phone" name="phone" minlength="11" maxlength="11" required>

            <label for="password">Password:</label>
            <input type="password" id="password" placeholder="Write your password" name="password" required>

            <label for="type">Type:</label>
            <select name="Type" id="type">
                <option value="students">Student</option>
                <option value="teachers">Teacher</option>
                <option value="admins">Admin</option>
            </select>

            <div class="form-actions">
                <input type="reset" value="Reset">
                <input type="submit" name="submit" value="Log in">
            </div>
        </fieldset>
    </form>
</body>

</html>