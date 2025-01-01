package beans;

import java.sql.*;

public class DB {
	public static boolean loaded=false;
	public static final String URL = "jdbc:mysql://localhost:3306/NileAcademy"; // NileAcademy is your database name
	public static final String USER = "project"; // database project
	public static final String PASSWORD = "pass123"; 
	public static final String DRIVER = "com.mysql.cj.jdbc.Driver";
	  public static Connection getConnection() throws ClassNotFoundException, SQLException {
      	if(!loaded) {loaded=true; Class.forName(DRIVER);}
        return DriverManager.getConnection(URL, USER, PASSWORD);
	  }
	
}
