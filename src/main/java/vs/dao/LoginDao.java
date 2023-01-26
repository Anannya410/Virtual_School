package vs.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import vs.model.LoginBean;

public class LoginDao {
		
		public boolean validate(LoginBean loginbean) throws ClassNotFoundException {
			
			boolean status = false;
		
			try{
				Class.forName("com.mysql.jdbc.Driver");
			    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/datavs?useSSL=false", "root", "Ana04mysql");
				PreparedStatement ps = conn.prepareStatement("select* from signup where email = ? and pass = ?");
				ps.setString(1, loginbean.getUname());
				ps.setString(2, loginbean.getPass());
			
				
				ResultSet rs = ps.executeQuery();
				status = rs.next();
					
			} catch(Exception e2) {
				System.out.println(e2);
				}
				
			return status;
		}

}
