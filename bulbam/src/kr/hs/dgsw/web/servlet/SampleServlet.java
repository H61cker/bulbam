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
@WebServlet("/sample.do")
public class SampleServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String name = request.getParameter("name");
		
		// Set response content type
		response.setContentType("text/html;charset=UTF-8");

		// Actual logic goes here.
		PrintWriter out = response.getWriter();
		out.println("<h1>안녕하세요 " + name + "</h1>");
		
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		String name = request.getParameter("name");
		
		SampleService sampleService = SampleService.getInstance();
		sampleService.saveVisit(name);

		PrintWriter out = response.getWriter();
		out.println("<h1>안녕하세요 " + name + "</h1>");
		out.println("<p>당신은  " + sampleService.getVisitCount(name) + "번재 방문자입니다.");
		
		out.close();
	}

	
	
	
	
	
	
	
	
}
