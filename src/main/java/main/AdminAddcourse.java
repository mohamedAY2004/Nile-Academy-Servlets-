package main;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.DB;

/**
 * Servlet implementation class AdminAddcourse
 */
@WebServlet("/AdminAddcourse")
@MultipartConfig
public class AdminAddcourse extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	boolean valid=true;
    	HttpSession session = request.getSession();
	    if(session.getAttribute("Type")==null||!session.getAttribute("Type").equals("admins") ) {
	        response.sendRedirect("Login.jsp");
	        return;
	    }
    	// Get the course name
        String course_name = request.getParameter("course_name");
        // Handle potential null or empty values
        if (course_name == null || course_name.trim().isEmpty()) {
        	request.setAttribute("name_error","Course Name Can't be empty");
        	request.getRequestDispatcher("admin-AddCourse.jsp").forward(request, response);
        	request.setAttribute("valid", false);
        }
        request.getRequestDispatcher("uploadImage").include(request, response);
        if(request.getAttribute("image_error")!=null||!valid) {
        	request.getRequestDispatcher("admin-AddCourse.jsp").forward(request, response);
        }
        System.out.println("image error: "+request.getAttribute("image_error"));
        
        if(request.getAttribute("image_error")!=null) {
        	request.getRequestDispatcher("admin-AddCourse.jsp").forward(request, response);
        }else {
        	String image_name=(String)request.getAttribute("image_name");
        	try {
				Connection conn=DB.getConnection();
				Statement stmt=conn.createStatement();
				String sql=String.format("INSERT INTO Courses (course_name,image_name) values ('%s','%s')", course_name,image_name);
				stmt.executeUpdate(sql);
				request.getRequestDispatcher("admin-Courses.jsp").forward(request, response);
			}catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        	
        }
        
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	doPost(request, response);
    }
}
