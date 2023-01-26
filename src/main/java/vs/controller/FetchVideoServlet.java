package vs.controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.Time;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.time.format.DateTimeFormatter;  
import java.time.LocalDateTime;   

import vs.model.FetchVideo;
import vs.model.VideoTime;

/**
 * Servlet implementation class FetchVideoServlet
 */
@WebServlet("/FetchVideoServlet")
public class FetchVideoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FetchVideoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int video_id = Integer.parseInt(request.getParameter("video_id"));
		String date = request.getParameter("added_date");
		Date added_date = Date.valueOf(date);
		
		System.out.println(added_date);
				
		FetchVideo fetchVideo = new FetchVideo();
		fetchVideo.setVideo_id(video_id);
		
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("HH:mm:ss");  
		LocalDateTime now = LocalDateTime.now();
		
		String time = dtf.format(now);
		Time open_time = Time.valueOf(time);
		
		System.out.println(open_time);
		
		VideoTime videoTime = new VideoTime();
		videoTime.setOpen_time(open_time);
		videoTime.setAdded_date(added_date);

		response.sendRedirect("video.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
