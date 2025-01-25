package main;

import java.io.IOException;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.DB;

/**
 * Servlet implementation class adminDeleteCourse
 */
@WebServlet("/admin-DeleteCourse")
public class adminDeleteCourse extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminDeleteCourse() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String Type=(String)session.getAttribute("Type");
		if(Type==null || !Type.equals("admins")){
		    response.sendRedirect("Welcome.jsp");
		    return; // This explicitly stops further execution
		}
		int course_id=Integer.parseInt(request.getParameter("course_id"));
		try {
			Connection conn =DB.getConnection();
			Statement stmt=conn.createStatement();
			String sql=String.format("DELETE FROM Courses WHERE course_id='%d'",course_id);
			stmt.executeUpdate(sql);
			response.sendRedirect("admin-Courses.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
