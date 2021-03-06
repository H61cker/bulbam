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
@WebServlet("/request_cancel.do")
public class RequestCancelServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user"); 
		
		UserService service = UserService.getInstance();
		service.requestCancel(user.getUserId());
		response.sendRedirect("list.jsp");
		
	}
	
}
