package main;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.DB;

/**
 * Servlet implementation class AdminUpdatecourse
 */
@WebServlet("/AdminUpdatecourse")
@MultipartConfig
public class AdminUpdatecourse extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminUpdatecourse() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    	boolean valid=true;
	    	HttpSession session = request.getSession(true);
		    if(session.getAttribute("Type")==null||!session.getAttribute("Type").equals("admins") ) {
		        response.sendRedirect("Login.jsp");
		        return;
		    }
	    	// Get the course name
	        String course_name = request.getParameter("course_name");
	        int course_id= (int)session.getAttribute("course_id");
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
					String sql=String.format("UPDATE Courses SET course_name = '%s', image_name = '%s' WHERE course_id =  '%d'", course_name,image_name,course_id);
					stmt.executeUpdate(sql);
					request.getRequestDispatcher("admin-Courses.jsp").forward(request, response);
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	        	
	        }
	        
	    }


}
