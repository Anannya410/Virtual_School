package vs.model;

import java.sql.Date;
import java.sql.Time;

public class VideoTime {
	
	private static Time open_time;
	private static Time close_time;
	private static Date added_date;

	public static Time getOpen_time() {
		return open_time;
	}

	public void setOpen_time(Time open_time) {
		VideoTime.open_time = open_time;
	}
	
	public static Time getClose_time() {
		return close_time;
	}

	public void setClose_time(Time close_time) {
		VideoTime.close_time = close_time;
	}
	
	public static Date getAdded_date() {
		return added_date;
	}

	public void setAdded_date(Date added_date) {
		VideoTime.added_date = added_date;
	}

}
