package kr.hs.dgsw.web.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.hs.dgsw.web.service.SampleService;

/**
 * Servlet implementation class SampleServlet
 */
@WebServlet("user_register")
public class UserRegisterServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	
	
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		String name = request.getParameter("username");
		String email = request.getParameter("userid");
		String password = request.getParameter("password");
		String group = request.getParameter("group");
		String identi = request.getParameter("identi");

		System.out.println(name+" "+email+" "+password+" "+group+" "+identi);
		SampleService sampleService = SampleService.getInstance();
		sampleService.saveVisit(name);

		PrintWriter out = response.getWriter();
		out.println("<h1>?ïà?Öï?ïò?Ñ∏?öî " + name + "</h1>");
		out.println("<p>?ãπ?ã†??  " + sampleService.getVisitCount(name) + "Î≤àÏû¨ Î∞©Î¨∏?ûê?ûÖ?ãà?ã§.");
		
		out.close();
	}

	
	
	
	
	
	
	
	
}
