package kr.hs.dgsw.web.servlet.yms;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Calcurlator
 */
@WebServlet("/calc.yms")
public class Calcurlator extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Calcurlator() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String n1 = request.getParameter("in1");
		String op = request.getParameter("op"); 
		String n2 = request.getParameter("in2");
		
		int nn1 = Integer.parseInt(n1);
		int nn2 = Integer.parseInt(n2);
		int result=0;
		if(op.equals("*")){
			result=nn1*nn2;
		}
		else if(op.equals("-")){
			result=nn1-nn2;
		}
		else if(op.equals("+")){
			result=nn1+nn2;
		}
		else if(op.equals("/")){
			result=nn1/nn2;
		}
		
		response.getWriter().append(""+nn1+" "+op+" "+nn2+" = " + result);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
