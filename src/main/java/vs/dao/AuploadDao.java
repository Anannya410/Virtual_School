package vs.dao;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import vs.model.Fetch;
import vs.model.LoginBean;

public class AuploadDao {
	
	public int uploadFile(String title, int max_marks, Date submitted_date, String file_name, InputStream file) {
		
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
		    
		    PreparedStatement pst = conn.prepareStatement("select* from assignment where title = ? and class_code = ?");
		    pst.setString(1, title);
		    pst.setInt(2, Fetch.getClass_code());
		    
		    ResultSet rst = pst.executeQuery();
		    rst.next();
		    int assignment_id = rst.getInt("assignment_id");
		    
			PreparedStatement ps = conn.prepareStatement("insert into submitted(title, email, class_code, assignment_id, fname, lname, submitted_date, file_name, max_marks, file) values(?,?,?,?,?,?,?,?,?,?)");
			ps.setString(1, title);
			ps.setString(2,LoginBean.getUname());
			ps.setInt(3, Fetch.getClass_code());
			ps.setInt(4, assignment_id);
			ps.setString(5, fname);
			ps.setString(6, lname);
			ps.setDate(7, submitted_date);
			ps.setString(8, file_name);
			ps.setInt(9, max_marks);
			
			if(file != null) {
				ps.setBlob(10, file);	
			}
			
			row = ps.executeUpdate();
			
		
		} catch(ClassNotFoundException | SQLException e) {
			System.out.println(e);
			}
		
		
		return row;
	}

}
