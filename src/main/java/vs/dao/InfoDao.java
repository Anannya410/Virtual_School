package vs.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import vs.model.Info;
 
public class InfoDao {
	
	public int registerInfo(Info info) throws ClassNotFoundException {
		
		int result = 0;
	
		try{
			Class.forName("com.mysql.jdbc.Driver");
		    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/datavs?useSSL=false", "root", "Ana04mysql");
			PreparedStatement ps = conn.prepareStatement("insert into signup(fname, lname, isStudent, email, pass) values(?,?,?,?,?)");
			ps.setString(1, info.getFname());
			ps.setString(2, info.getLname());
			ps.setString(3, info.getIsStudent());
			ps.setString(4, info.getEmail());
			ps.setString(5, info.getPass());
			
			System.out.println(ps);
			result = ps.executeUpdate();
				
		} catch(ClassNotFoundException | SQLException e) {
			System.out.println(e);
			}
			
		return result;
	}
				
		
}

