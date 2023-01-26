package vs.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import vs.model.Fetch;
import vs.model.FetchAssignment;

public class AssessMarksDao {
	
	public int giveMarks(String email, String fname, String lname, int marks) {
		int result=0;
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
		    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/datavs?useSSL=false", "root", "Ana04mysql");
		    
		    PreparedStatement pst = conn.prepareStatement("select* from assessment where title= ? and class_code = ?");
		    pst.setString(1, FetchAssignment.getTitle());
		    pst.setInt(2, Fetch.getClass_code());
		    
		    ResultSet rs = pst.executeQuery();
		    rs.next();
		    int max_marks = rs.getInt("max_marks");
		    
			PreparedStatement ps = conn.prepareStatement("insert into assess_marks(title, email, class_code, fname, lname, max_marks, marks) values(?,?,?,?,?,?,?)");
			ps.setString(1, FetchAssignment.getTitle());
			ps.setString(2, email);
			ps.setInt(3, Fetch.getClass_code());
			ps.setString(4, fname);
			ps.setString(5,  lname);
			ps.setInt(6, max_marks);
			ps.setInt(7, marks);
			
			System.out.println(ps);
			result = ps.executeUpdate();
				
		} catch(ClassNotFoundException | SQLException e) {
			System.out.println(e);
			}
		
		return result;
	}

}
