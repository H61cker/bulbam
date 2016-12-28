package kr.hs.dgsw.web.servlet;

import java.io.IOException;
import java.lang.ProcessBuilder.Redirect;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.hs.dgsw.web.service.UserService;

/**
 * Servlet implementation class Modify
 */
@WebServlet("/Modify.do")
public class Modify extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Modify() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		int uri = Integer.parseInt(request.getParameter("uri"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		UserService service = UserService.getInstance();
		service.Modify(uri,title, content);
		response.sendRedirect("board_list.jsp");
		
	}

}
