package vs.dao;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;


import java.sql.ResultSet;

import vs.model.Fetch;
import vs.model.LoginBean;

public class UploadDao {
	
	public int uploadFile(String file_name, InputStream file, Date added_date) {
		
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
		    
			PreparedStatement ps = conn.prepareStatement("insert into classwork(fname, lname, file_name, class_code, added_date, file) values(?,?,?,?,?,?)");
			ps.setString(1, fname);
			ps.setString(2, lname);
			ps.setString(3, file_name);
			ps.setInt(4, Fetch.getClass_code());
			ps.setDate(5, added_date);
			
			if(file != null) {
				ps.setBlob(6, file);	
			}
			
			row = ps.executeUpdate();
			
		
		} catch(ClassNotFoundException | SQLException e) {
			System.out.println(e);
			}
		
		
		return row;
	}

}
