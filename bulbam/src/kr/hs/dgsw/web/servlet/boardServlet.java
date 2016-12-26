package kr.hs.dgsw.web.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.hs.dgsw.web.service.UserService;

@WebServlet("/board.do")
public class boardServlet extends HttpServlet{
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String name = request.getParameter("name");
		String pass = request.getParameter("pass");

		boolean result = board_insert(subject,name,pass,content);
		
		PrintWriter out = response.getWriter();
		
		if(result){
			out.println("<script><alert>글이 입력되었습니다.</alert></script>");
		}else{
			out.println("글 입력 중 오류가 났습니다.");
		}
		
		out.close();
	}
	
	public boolean board_insert(String subject , String name, String pass , String content)
	{
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			
			connection = 
				DriverManager.getConnection(
				"jdbc:mysql://114.108.167.90/dgsw_sms?useUnicode=true&characterEncoding=utf8", 
				"dgsw", "dnrhddltks");
			
			StringBuilder sql = new StringBuilder();
			sql.append("INSERT INTO board ");
			sql.append("  (title,writer,password,content,write_time) ");
			sql.append("VALUES ");
			sql.append("  (?,?,?,?,now()) ");
			
			pstmt = connection.prepareStatement(sql.toString());
			pstmt.setString(1, subject);
			pstmt.setString(2, name);
			pstmt.setString(3, pass);
			pstmt.setString(4, content);
			
			pstmt.executeUpdate();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		finally 
		{
			if (rs != null)
			{
				try
				{
					rs.close();
				}
				catch (SQLException e)
				{
					e.printStackTrace();
				}
			}
			if (pstmt != null)
			{
				try
				{
					pstmt.close();
				}
				catch (SQLException e)
				{
					e.printStackTrace();
				}
			}
			if (connection != null)
			{
				try
				{
					connection.close();
				}
				catch (SQLException e)
				{
					e.printStackTrace();
				}
			}
		}
		return true;
	}
}
