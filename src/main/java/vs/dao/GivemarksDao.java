package vs.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import vs.model.Fetch;
import vs.model.FetchAssignment;

public class GivemarksDao {
	
	public int giveMarks(String email, int marks) {
		int result=0;
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
		    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/datavs?useSSL=false", "root", "Ana04mysql");
			PreparedStatement ps = conn.prepareStatement("update submitted set marks = ? where class_code = ? and title= ? and email = ? ");
			ps.setInt(1, marks);
			ps.setInt(2, Fetch.getClass_code());
			ps.setString(3, FetchAssignment.getTitle());
			ps.setString(4,  email);
			
			System.out.println(ps);
			result = ps.executeUpdate();
				
		} catch(ClassNotFoundException | SQLException e) {
			System.out.println(e);
			}
		
		return result;
	}

}
