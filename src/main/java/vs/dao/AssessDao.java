package vs.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import vs.model.Fetch;

public class AssessDao {
	
	public int assessWork(String title, String description, Integer max_marks) {
		
		int result = 0;
		

		try{
			Class.forName("com.mysql.jdbc.Driver");
		    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/datavs?useSSL=false", "root", "Ana04mysql");
			PreparedStatement ps = conn.prepareStatement("insert into assessment(title, description, max_marks, class_code) values(?,?,?,?)");
			ps.setString(1, title);
			ps.setString(2, description);
			ps.setInt(3, max_marks);
			ps.setInt(4, Fetch.getClass_code());
			
			System.out.println(ps);
			result = ps.executeUpdate();
				
		} catch(ClassNotFoundException | SQLException e) {
			System.out.println(e);
			}
			
		
		return result;
	}


}
