package beans;
import java.sql.Connection;
import java.sql.SQLException;
import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
public class DB {
	public static final String URL = "jdbc:mysql://localhost:3306/NileAcademy"; // NileAcademy is your database name
	public static final String USER = "project"; // database project
	public static final String PASSWORD = "pass123"; 
	public static final String DRIVER = "com.mysql.cj.jdbc.Driver";
	private static HikariDataSource dataSource;
	// Configuring the connection pool
    static {
    	try {
			Class.forName(DRIVER);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        HikariConfig config = new HikariConfig();
        config.setJdbcUrl(URL);
        config.setUsername(USER);
        config.setPassword(PASSWORD);
        
        // Pool settings
        config.setMaximumPoolSize(10);     // Maximum connections
        config.setMinimumIdle(5);          // Minimum idle connections
        config.setIdleTimeout(30000);      // 30 seconds idle timeout

        // Initialize the connection pool (DataSource)
        dataSource = new HikariDataSource(config);
    }
	  public static Connection getConnection() throws SQLException {
		  return dataSource.getConnection();
	  }
	
}
