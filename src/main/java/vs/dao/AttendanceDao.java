package vs.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import vs.model.Fetch;
import vs.model.FetchVideo;
import vs.model.LoginBean;
import vs.model.VideoTime;

public class AttendanceDao {
	
	public void giveAttendance(Time c) throws ParseException{
		
		String open_time = String.valueOf(VideoTime.getOpen_time());
		String close_time = String.valueOf(c);
		String a = String.valueOf(VideoTime.getAdded_date());
		Date date = new Date(System.currentTimeMillis());
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	    String present_date = df.format(date);
		
		String length = "00:00:10";
		Time video_length = Time.valueOf(length);

		SimpleDateFormat sdfo = new SimpleDateFormat("yyyy-MM-dd");
		
		Date added_date = sdfo.parse(a);
		System.out.println("hey!");
		Date today_date = sdfo.parse(present_date);
		System.out.println("hey!!");
		
		System.out.println("added : " + sdfo.format(added_date));
		System.out.println("today : " + sdfo.format(today_date));

		int d = added_date.compareTo(today_date);
		
		if(d == 0) {
			SimpleDateFormat format = new SimpleDateFormat("HH:mm:ss");
			Date date1 = format.parse(open_time);
			Date date2 = format.parse(close_time);
			
			long differenceInMilliSeconds =  Math.abs(date2.getTime() - date1.getTime());
			long differenceInHours = (differenceInMilliSeconds / (60 * 60 * 1000))% 24;
            long differenceInMinute = (differenceInMilliSeconds / (60 * 1000)) % 60;
            long differenceInSeconds = (differenceInMilliSeconds / 1000) % 60;
            
            String H = Long.toString(differenceInHours);
            String M = Long.toString(differenceInMinute);
            String S = Long.toString(differenceInSeconds);
            
            String temp = H + ":" + M + ":" + S;
            Time watched = Time.valueOf(temp);
            
            int value = watched.compareTo(video_length);
            
            System.out.println("Int Value:" + value);
            
            if (value > 0) {
                System.out.println("watched is greater so Present ");
            	attendanceDao();
            }
            else if (value == 0) {
                System.out.println("watched is equal to video_length so Present");
                attendanceDao();
            }
            else {
                System.out.println("video_length is greater so Absent");
            }
        }
		
		else
			System.out.println("date didn't matched");
		
	}
	
	public int attendanceDao() {
		int result = 0;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/datavs?useSSL=false", "root", "Ana04mysql");
			
			PreparedStatement pst = conn.prepareStatement("select* from videos where video_id = ?");
			pst.setInt(1, FetchVideo.getVideo_id());
			
			ResultSet rst = pst.executeQuery();
			rst.next();
			
			String video_title = rst.getString("file_name");
			
		    PreparedStatement st = conn.prepareStatement("select* from signup where email = ?");
		    st.setString(1, LoginBean.getUname());
		    
		    ResultSet rs = st.executeQuery();
		    rs.next();
		    String fname = rs.getString("fname");
		    String lname = rs.getString("lname");
		    
		    PreparedStatement pps = conn.prepareStatement("select* from attendance where video_id = ? and email = ?");
		    pps.setInt(1,FetchVideo.getVideo_id());
			pps.setString(2,  LoginBean.getUname());
			ResultSet rps = pps.executeQuery();
			if(!rps.next()) {
				System.out.println("data saved for attendance");
				
				PreparedStatement ps = conn.prepareStatement("insert into attendance(video_id, video_title, class_code, email, fname, lname) values(?,?,?,?,?,?)");
				ps.setInt(1,FetchVideo.getVideo_id());
				ps.setString(2,video_title);
				ps.setInt(3, Fetch.getClass_code());
				ps.setString(4, LoginBean.getUname());
				ps.setString(5, fname);
				ps.setString(6, lname);
				
				result = ps.executeUpdate();
			}
			
			else {
				System.out.println("data not saved for attendance");
			}
			
		}catch(ClassNotFoundException | SQLException e) {
			System.out.println(e);
		}
		
		return result;
	}

}


