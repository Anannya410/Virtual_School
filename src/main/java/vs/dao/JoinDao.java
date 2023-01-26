package vs.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import vs.model.LoginBean;

public class JoinDao {
	
	public int join(int class_code) {
		int row = 0;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/datavs?useSSL=false", "root", "Ana04mysql");
			
		    PreparedStatement st = conn.prepareStatement("select* from signup where email = ?");
		    st.setString(1, LoginBean.getUname());
		    
		    ResultSet rs = st.executeQuery();
		    rs.next();
		    String fname = rs.getString("fname");
		    String lname = rs.getString("lname");
		    
		    PreparedStatement pst = conn.prepareStatement("select* from class_info where class_code = ?");
		    pst.setInt(1, class_code);
		    
		    ResultSet rst = pst.executeQuery();
		    rst.next();
		    String class_name = rst.getString("class_name");
		    String section = rst.getString("section");
		    String c_fname = rst.getString("fname");
		    String c_lname = rst.getString("lname");
		    
			PreparedStatement ps = conn.prepareStatement("insert into join_info(class_code, class_name, section, c_fname, c_lname, email, fname, lname) values(?,?,?,?,?,?,?,?)");
			ps.setInt(1, class_code);
			ps.setString(2, class_name);
			ps.setString(3, section);
			ps.setString(4, c_fname);
			ps.setString(5, c_lname);
			ps.setString(6, LoginBean.getUname());
			ps.setString(7, fname);
			ps.setString(8, lname);
			
			
			row = ps.executeUpdate();		
			
		} catch(ClassNotFoundException | SQLException e) {
			System.out.println(e);
			}
		
		return row;
	}

}
