package vs.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vs.dao.Connect;
import vs.model.Fetch;

/**
 * Servlet implementation class AdownloadServlet
 */
@WebServlet("/AdownloadServlet")
public class AdownloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static final int BUFFER_SIZE = 4096;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdownloadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		String email = request.getParameter("email");
		int class_code = Fetch.getClass_code();
	    String file_name = null;
		
		 try {
			 Connection conn = Connect.getConnection();
			 PreparedStatement ps = conn.prepareStatement("select* from submitted where title = ? and email = ? and class_code = ?");
			 ps.setString(1, title);
			 ps.setString(2,  email);
			 ps.setInt(3, class_code);
			
			 
			 ResultSet result = ps.executeQuery();
			 if(result.next()) {
				 file_name = result.getString("file_name");
				 Blob file = result.getBlob("file");
				 InputStream inputStream = file.getBinaryStream();
				 int fileLength = inputStream.available();
				 
				 System.out.println("fileLength = " + fileLength);
				 
				 ServletContext context = getServletContext();
				 
				 String mimeType = context.getMimeType("file_name");
				 if (mimeType == null) {        
	                    mimeType = "application/octet-stream";
	                }     
				 
				 response.setContentType(mimeType);
				 response.setContentLength(fileLength);
				 String headerKey = "Content-Dipossition";
				 String headerValue = String.format("attachment; file_name=\"%s\"", file_name);
				 response.setHeader(headerKey, headerValue);
				 
				 OutputStream outStream = response.getOutputStream();
				 
				 byte[] buffer = new byte [BUFFER_SIZE];
				 int bytesRead = -1;
				 
				 while((bytesRead = inputStream.read(buffer)) != -1) {
					 outStream.write(buffer,0,bytesRead);
				 }
				 
				 inputStream.close();
				 outStream.close();
				 
			 }
			 else {
				 //no file found
				 response.getWriter().print("File not found for the id: "+ file_name);
			 }
			 
		 } catch(SQLException e) {
				System.out.println(e);
				}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
