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
 * Servlet implementation class AdminAddStudent
 */
@WebServlet("/AdminAddStudent")
@MultipartConfig
public class AdminAddStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminAddStudent() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Session validation");
		HttpSession session = request.getSession(true); // false means don't create a new session if none exists

		if (session == null || !"admins".equals(session.getAttribute("Type"))) {
		    response.sendRedirect("Login.jsp");
		    return;
		}
		boolean valid=true;
		System.out.println("Form validation");
		String student_name= request.getParameter("student_name");
		String student_phone=request.getParameter("student_phone");
		String parent_phone=request.getParameter("parent_phone");
		String student_pass=request.getParameter("student_pass");
		String confirm_pass=request.getParameter("confirm_pass");
		//Name Validation
		if(student_name==null||student_name.trim().isEmpty()) {
			request.setAttribute("student_name_error", "Name Can't be empty");
			valid=false;
		}
		//Phone Validation
		if(student_phone==null||student_phone.trim().isEmpty()) {
			System.out.println("Invalid Phone");
			request.setAttribute("student_phone_error", "Phone Can't be empty");
			valid=false;
		}else if(student_phone.trim().length()!=11){
			request.setAttribute("student_phone_error", "Invalid Phone length");
			valid=false;
		}else
		{
			Connection conn;
			try {
				conn = DB.getConnection();
				String sql=String.format("SELECT student_name FROM students WHERE student_phone ='%s'", student_phone) ;
				Statement stmt=conn.createStatement();
				ResultSet rs=stmt.executeQuery(sql);
				if(rs.next()) {
					request.setAttribute("student_phone_error", "Phone Already exists");
					valid=false;
				}
				rs.close();
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}
		if(parent_phone==null||parent_phone.trim().isEmpty()) {
			System.out.println("Invalid parent phone");
			request.setAttribute("parent_phone_error", "Parent Phone Can't be empty");
			valid=false;
		}else if(parent_phone.trim().length()!=11){
			request.setAttribute("parent_phone_error", "Invalid Phone length");
			valid=false;
		}else 
		{
			Connection conn;
			try {
				conn = DB.getConnection();
				String sql=String.format("SELECT student_name FROM students WHERE student_phone ='%s'", parent_phone) ;
				Statement stmt=conn.createStatement();
				ResultSet rs=stmt.executeQuery(sql);
				if(rs.next()) {
					request.setAttribute("parent_phone_error", "This phone is registred as a student can't be parent phone");
					valid=false;
				}
				rs.close();
				stmt.close();
				conn.close();
			} catch ( SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		//Password Validation
		if(student_pass==null||student_pass.trim().isEmpty()) 
		{
			System.out.println("Empty password");
			request.setAttribute("student_pass_error", "Password Can't be empty");
			valid=false;
		}else if(student_pass.trim().length()<5)
		{
			request.setAttribute("student_pass_error", "Password must have atleast 5 characters");
			valid=false;
		}else if(!student_pass.equals(confirm_pass))
		{
			request.setAttribute("student_pass_error", "Password and confirmation doesn't match");
			valid=false;
		}
		request.setAttribute("valid", valid);
		 request.getRequestDispatcher("uploadImage").include(request, response);
		 if((boolean) request.getAttribute("valid")==false) {
			 request.getRequestDispatcher("admin-AddStudent.jsp").forward(request, response);
			 return;
			 
		 }
		 try {
			Connection conn=DB.getConnection();
			Statement stmt=conn.createStatement();
			String image_name=(String)request.getAttribute("image_name");
			 String sql =String.format("INSERT INTO Students (student_name,student_phone,student_pass,parent_phone,image_name) values ('%s','%s','%s','%s','%s')", student_name,student_phone,student_pass,parent_phone,image_name);
			stmt.executeUpdate(sql);
			stmt.close();
			conn.close();
			request.getRequestDispatcher("admin-Students.jsp").forward(request, response);
		 } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		  
	}

}
