package kr.hs.dgsw.web.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.hs.dgsw.web.service.UserService;

/**
 * Servlet implementation class WriterServlet
 */
@WebServlet("/WriterServlet.do")
public class WriterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WriterServlet() {
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
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String subject = request.getParameter("subject");
		String contents = request.getParameter("contents");
		String writer = request.getParameter("writer");
		String password = request.getParameter("password");
		
		System.out.println(subject+" "+contents+" "+writer+" "+password);
		
		/* 데이터 베이스에 입력해야함. */
		UserService userService = UserService.getInstance();
//		userService.registerUser(email, password, name, type, group, identi);
		userService.Write(subject, contents, writer, password);
		
		response.sendRedirect("board_list.jsp");
	}

}
