package kr.hs.dgsw.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.hs.dgsw.web.domain.User;
import kr.hs.dgsw.web.service.UserService;

/**
 * Servlet implementation class SampleServlet
 */
@WebServlet("/login.do")
public class LoginServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		String email = request.getParameter("id");
		String password = request.getParameter("password");

		UserService userService = UserService.getInstance();
		User user = userService.getUser(email);
		
		boolean success = false;
		if (user != null)
		{
			if (user.getPassword().equals(password))
			{
				success = true;
			}
			else
			{
				success = false;
			}
		}
		else
		{
			success = false;
		}
		
		if (success)
		{
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			
			response.sendRedirect("home.jsp");
		}
		else
		{
			response.sendRedirect("login.jsp?error=t");
		}
		
		

		/*PrintWriter out = response.getWriter();
		out.println("<h1>?��?��?��?��?�� " + name + "</h1>");
		
		
		out.close();*/
	}

	
	
	
	
	
	
	
	
}
