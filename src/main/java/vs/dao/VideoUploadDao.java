package vs.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import vs.model.Fetch;
import vs.model.LoginBean;

public class VideoUploadDao {
	
	public int uploadVideo(String file_name, String src , Date added_date) {
		
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
		    
			PreparedStatement ps = conn.prepareStatement("insert into videos(fname, lname, email, class_code, file_name, added_date, src) values(?,?,?,?,?,?,?)");
			ps.setString(1, fname);
			ps.setString(2, lname);
			ps.setString(3, LoginBean.getUname());
			ps.setInt(4, Fetch.getClass_code());
			ps.setString(5, file_name);
			ps.setDate(6, added_date);
			ps.setString(7, src);
			
			row = ps.executeUpdate();
			
		
		} catch(ClassNotFoundException | SQLException e) {
			System.out.println(e);
			}
		
		
		
		return row;
	}

}
