package vs.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vs.dao.InfoDao;
import vs.model.Info;

/**
 * Servlet implementation class InfoServlet
 */
@WebServlet("/register")
public class InfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private InfoDao infoDao = new InfoDao();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("registration.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String isStudent = request.getParameter("isStudent");
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		
		Info info = new Info();
		info.setFname(fname);
		info.setLname(lname);
		info.setIsStudent(isStudent);
		info.setEmail(email);
		info.setPass(pass);
		
		try {
			infoDao.registerInfo(info);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		response.sendRedirect("login.jsp");
	}

}
