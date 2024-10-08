package vs.controller;

import java.io.IOException;
import java.sql.Date;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vs.dao.AssignDao;

/**
 * Servlet implementation class AssignServlet
 */
@WebServlet("/AssignServlet")
public class AssignServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AssignServlet() {
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
	
		String title = request.getParameter("title");
		String description = request.getParameter("description");
		String date = request.getParameter("due_date");
		Date due_date = Date.valueOf(date);
		
	    Integer max_marks = Integer.parseInt(request.getParameter("max_marks"));
	    
	    AssignDao assignDao = new AssignDao();
	    assignDao.assignWork( title, description, due_date, max_marks );
	    
	    response.sendRedirect("assign_tab.jsp");
	}

}
