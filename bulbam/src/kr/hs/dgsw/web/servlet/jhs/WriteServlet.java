package kr.hs.dgsw.web.servlet.jhs;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class WriteServlet
 */
@WebServlet("/write.jhs")
public class WriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("1234 ");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String p1 = request.getParameter("title");
		
		// TODO Auto-generated method stub
		System.out.println("POST  : " + p1);
		
		String p2 = request.getParameter("content");
		System.out.println("POST  : " + p2);
		
		String p3 = request.getParameter("writer");
		System.out.println("POST  : " + p3);
		
		String p4 = request.getParameter("password");
		System.out.println("POST  : " + p4);
	}

}
