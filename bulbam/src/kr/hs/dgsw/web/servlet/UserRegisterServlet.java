package kr.hs.dgsw.web.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.hs.dgsw.web.service.SampleService;
import kr.hs.dgsw.web.service.UserService;

/**
 * Servlet implementation class SampleServlet
 */
@WebServlet("/user_register")
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
		String type = request.getParameter("school");

		System.out.println(name+" "+email+" "+password+" "+group+" "+identi + "  " + type);
		
		UserService userService = UserService.getInstance();
		userService.registerUser(email, password, name, type, group, identi);
		
		response.sendRedirect("home.jsp");

		/*PrintWriter out = response.getWriter();
		out.println("<h1>?��?��?��?��?�� " + name + "</h1>");
		
		
		out.close();*/
	}

	
	
	
	
	
	
	
	
}
