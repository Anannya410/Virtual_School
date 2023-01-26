package vs.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vs.dao.GivemarksDao;

/**
 * Servlet implementation class GiveMarksServlet
 */
@WebServlet("/GiveMarksServlet")
public class GivemarksServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GivemarksServlet() {
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
		
		System.out.println("anannya");
		String email = request.getParameter("email");
		System.out.println(email);
		int marks = Integer.parseInt(request.getParameter("marks"));
			
			GivemarksDao givemarksDao = new GivemarksDao();
			int row = givemarksDao.giveMarks(email, marks);
			
			response.sendRedirect("ToBeMarked.jsp");
	}

}
