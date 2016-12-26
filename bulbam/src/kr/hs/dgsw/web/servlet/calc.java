package kr.hs.dgsw.web.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/calc.do")

public class calc extends HttpServlet{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String first = request.getParameter("first");
		String middle = request.getParameter("middle");
		String last = request.getParameter("last");
		
		int f = Integer.parseInt(first);
		int l = Integer.parseInt(last);
		
		// Set response content type
		response.setContentType("text/html;charset=UTF-8");

		// Actual logic goes here.
		PrintWriter out = response.getWriter();
		int result = 0;
		
		switch(middle)
		{
		
		case "+":
			result = f+l;
			break;
			
		case "-":
			result = f-l;
			break;
		
		case "*":
			result = f*l;
			break;
			
		case "/":
			result = f/l;
			break;
			
		}
		
		
		out.println("<h1>"+ f +" "+ middle + " "+l+" = "+result+" 입니다. </h1>");
		
		out.close();
	}
}
