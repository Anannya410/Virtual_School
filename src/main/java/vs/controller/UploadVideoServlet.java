package vs.controller;

import java.io.IOException;
import java.sql.Date;


import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import vs.dao.VideoUploadDao;



/**
 * Servlet implementation class UploadVideoServlet
 */
@WebServlet("/UploadVideoServlet")
@MultipartConfig(
		  fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
		  maxFileSize = 1024 * 1024 * 100,      // 10 MB
		  maxRequestSize = 1024 * 1024 * 100   // 100 MB
		)
public class UploadVideoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadVideoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		 Part filePart = request.getPart("file");
		    String file_name = filePart.getSubmittedFileName();
		    Date added_date = new Date(System.currentTimeMillis());
		    String src = "./././videos/" +file_name;
		    
		    for (Part part : request.getParts()) {
		      part.write("C:\\Users\\91999\\eclipse-workspace2\\virtualSchoolTest\\WebContent\\videos\\" + file_name);
		    }
		    
		   VideoUploadDao videouploadDao = new VideoUploadDao();
		   videouploadDao.uploadVideo(file_name, src, added_date);
		    
		    response.sendRedirect("lecture_tab.jsp");
	}

 } 
	

