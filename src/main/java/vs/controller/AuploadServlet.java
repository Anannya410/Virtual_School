package vs.controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import vs.dao.AuploadDao;

/**
 * Servlet implementation class AuploadServlet
 */
@WebServlet("/AuploadServlet")
@MultipartConfig(maxFileSize = 16177215)

public class AuploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AuploadServlet() {
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
		
		InputStream inputStream = null;
		String message = null;
		
		Part filePart = request.getPart("file");
		String file_name = filePart.getSubmittedFileName();
		String title = request.getParameter("assignment_title");
		int max_marks = Integer.parseInt(request.getParameter("max_marks"));
		Date submitted_date = new Date(System.currentTimeMillis());
		
		
		if (filePart != null) {
            // prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
             
            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
        }
		
		AuploadDao auploadDao = new AuploadDao();
		auploadDao.uploadFile(title, max_marks, submitted_date, file_name, inputStream);
		
		response.sendRedirect("assign_tab.jsp");
		
	}

}
