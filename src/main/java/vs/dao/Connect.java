package vs.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connect {

	public static Connection getConnection() {
		
		Connection conn = null;
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
		    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/datavs?useSSL=false", "root", "Ana04mysql");		
		} catch(ClassNotFoundException | SQLException e) {
			System.out.println(e);
			}
		return conn;
	}
}
