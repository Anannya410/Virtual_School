package vs.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import vs.model.LoginBean;

public class CreateDao {
	
	public int create(String class_name, String section ) {
		
		System.out.println("anannya");
		
		int row = 0;
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
		    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/datavs?useSSL=false", "root", "Ana04mysql");
		    
		    PreparedStatement st = conn.prepareStatement("select* from signup where email = ?");
		    st.setString(1, LoginBean.getUname());
		    
		    ResultSet rs = st.executeQuery();
		    rs.next();
		    String fname = rs.getString("fname");
		    String lname = rs.getString("lname");
		    
			PreparedStatement ps = conn.prepareStatement("insert into class_info(class_name, section, email, fname, lname) values(?,?,?,?,?)");
			ps.setString(1, class_name);
			ps.setString(2, section);
			ps.setString(3, LoginBean.getUname());
			ps.setString(4, fname);
			ps.setString(5, lname);
			
			
			row = ps.executeUpdate();
			
		
		} catch(ClassNotFoundException | SQLException e) {
			System.out.println(e);
			}
		
		
		return row;
	}

}
