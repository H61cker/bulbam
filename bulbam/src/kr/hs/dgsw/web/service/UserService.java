package kr.hs.dgsw.web.service;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import kr.hs.dgsw.web.domain.NightStudyRequest;
import kr.hs.dgsw.web.domain.User;
import kr.hs.dgsw.web.domain.Board;
import kr.hs.dgsw.web.domain.BoardList;

public final class UserService
{
	private static UserService instance = new UserService();
	
	private UserService()
	{
		
	}
	
	public static UserService getInstance()
	{
		return instance;
	}
	
	public void requestNightStudyCancel(int user_id)
	{
		
	}
	
	public boolean requestCheck(int user_id)
	{
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Boolean check = false;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			
			connection = 
				DriverManager.getConnection(
				"jdbc:mysql://114.108.167.90/dgsw_sms?useUnicode=true&characterEncoding=utf8", 
				"dgsw", "dnrhddltks");
			
			
			// sql query : SELECT * FROM dgsw_sms.nightstudy WHERE time >= current_date() && user_id == user_id;
			
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT * FROM nightstudy ");
			sql.append("  WHERE ");
			sql.append("time >= current_date() && ");
			sql.append("  (user_id = ?) ");
			
			pstmt = connection.prepareStatement(sql.toString());
			pstmt.setInt(1, user_id);
			
			rs = pstmt.executeQuery();
			rs.last();
	        int rowcount = rs.getRow();
			
	        
			if(rowcount>0){
				check = true;
			}
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
		return check;
	}
	
	public void requestCancel(int user_id)
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
			
			
			// sql query : SELECT * FROM dgsw_sms.nightstudy WHERE time >= current_date() && user_id == user_id;
			
			StringBuilder sql = new StringBuilder();
			sql.append("DELETE FROM nightstudy ");
			sql.append("  WHERE ");
			sql.append("time >= current_date() && ");
			sql.append("  (user_id = ?) ");
			
			pstmt = connection.prepareStatement(sql.toString());
			pstmt.setInt(1, user_id);
			
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
	}
	
	public void requestNightStudy(int user_id)
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
			sql.append("INSERT INTO nightstudy ");
			sql.append("  (user_id, time) ");
			sql.append("VALUES ");
			sql.append("  (?, now()) ");
			
			pstmt = connection.prepareStatement(sql.toString());
			pstmt.setInt(1, user_id);
			
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
	}
	
	public void registerUser(String email, String password, String userName, String type,
			String group, String sNumber)
	{
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		if ("student".equals(type))
		{
			type = "S";
		}
		else
		{
			type = "T";
		}

		int grade = 0;
		int clazz = 0;
		int number = 0;

		if ("S".equals(type))
		{
			String sGrade = group.substring(0, 1);
			String sClass = group.substring(2);
			
			grade = Integer.parseInt(sGrade);
			clazz = Integer.parseInt(sClass);
			number = Integer.parseInt(sNumber);
		}
		
		
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			
			connection = 
				DriverManager.getConnection(
				"jdbc:mysql://114.108.167.90/dgsw_sms?useUnicode=true&characterEncoding=utf8", 
				"dgsw", "dnrhddltks");
			
			StringBuilder sql = new StringBuilder();
			sql.append("INSERT INTO user ");
			sql.append("  (login_id, password, user_name, class, number, grade, type) ");
			sql.append("VALUES ");
			sql.append("  (?, ?, ?, ?, ?, ?, ?) ");
			
			pstmt = connection.prepareStatement(sql.toString());
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			pstmt.setString(3, userName);
			pstmt.setInt(4, clazz);
			pstmt.setInt(5, number);
			pstmt.setInt(6, grade);
			pstmt.setString(7, type);
			
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
		
	}

	public User getUser(String email)
	{
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		User user = null;
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			connection = 
				DriverManager.getConnection(
				"jdbc:mysql://114.108.167.90/dgsw_sms?useUnicode=true&characterEncoding=utf8", 
				"dgsw", "dnrhddltks");
			
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT * FROM user ");
			sql.append(" WHERE login_id = ? ");
			
			pstmt = connection.prepareStatement(sql.toString());
			pstmt.setString(1, email);
			
			rs = pstmt.executeQuery();
			if (rs.next())
			{
				user = new User();
				
				user.setUserId(rs.getInt("user_id"));
				user.setGrade(rs.getInt("grade"));
				user.setClazz(rs.getInt("class"));
				user.setNumber(rs.getInt("number"));
				user.setLoginId(rs.getString("login_id"));
				user.setUserName(rs.getString("user_name"));
				user.setPassword(rs.getString("password"));
				user.setType(rs.getString("type"));
			}
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
		
		return user;
	}
	
	/**
	 * 二쇱뼱吏� �궇吏쒖뿉 �떖�빞 �옄�뒿�쓣 �떊泥��븳 �궗�엺�뱾�쓽 紐⑸줉�쓣 �씫�뼱�삩�떎.
	 * 
	 * @param date �궇吏�
	 * @return �떊泥��옄 紐⑸줉
	 */
	public List<NightStudyRequest> listNightStudy(Date date)
	{
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		List<NightStudyRequest> list = new LinkedList<NightStudyRequest>();
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			connection = 
				DriverManager.getConnection(
				"jdbc:mysql://114.108.167.90/dgsw_sms?useUnicode=true&characterEncoding=utf8", 
				"dgsw", "dnrhddltks");
			
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT a.id, a.user_id, a.time, b.user_name, b.class, b.grade, b.number  ");
			sql.append("  FROM nightstudy AS a ");
			sql.append("  JOIN user AS b ON a.user_id = b.user_id ");
			sql.append(" WHERE time = ? ");

			pstmt = connection.prepareStatement(sql.toString());
			pstmt.setDate(1, new java.sql.Date(date.getTime()));

			
			NightStudyRequest nightStudyRequest = null;
			
			rs = pstmt.executeQuery();
			while (rs.next())
			{
				int id = rs.getInt(1);
				int userId = rs.getInt(2);
				Date time = rs.getDate(3);
				String userName = rs.getString(4);
				int clazz = rs.getInt(5);
				int grade = rs.getInt(6);
				int number = rs.getInt(7);
				
				nightStudyRequest = new NightStudyRequest();
				nightStudyRequest.setId(id);
				nightStudyRequest.setUserId(userId);
				nightStudyRequest.setTime(time);
				nightStudyRequest.setUserName(userName);
				nightStudyRequest.setClazz(clazz);
				nightStudyRequest.setGrade(grade);
				nightStudyRequest.setNumber(number);
				
				list.add(nightStudyRequest);
			}
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
		
		return list;
	}

	public List<NightStudyRequest> NightStudyPerson(int userid)
	{
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		List<NightStudyRequest> list = new LinkedList<NightStudyRequest>();
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			connection = 
				DriverManager.getConnection(
				"jdbc:mysql://114.108.167.90/dgsw_sms?useUnicode=true&characterEncoding=utf8", 
				"dgsw", "dnrhddltks");
			
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT a.id, a.user_id, a.time, b.user_name, b.class, b.grade, b.number  ");
			sql.append("  FROM nightstudy AS a ");
			sql.append("  JOIN user AS b ON a.user_id = b.user_id ");
			sql.append(" WHERE a.user_id = ? ");

			pstmt = connection.prepareStatement(sql.toString());
			pstmt.setInt(1, userid);

			
			NightStudyRequest nightStudyRequest = null;
			
			rs = pstmt.executeQuery();
			while (rs.next())
			{
				int id = rs.getInt(1);
				int userId = rs.getInt(2);
				Date time = rs.getDate(3);
				String userName = rs.getString(4);
				int clazz = rs.getInt(5);
				int grade = rs.getInt(6);
				int number = rs.getInt(7);
				
				nightStudyRequest = new NightStudyRequest();
				nightStudyRequest.setId(id);
				nightStudyRequest.setUserId(userId);
				nightStudyRequest.setTime(time);
				nightStudyRequest.setUserName(userName);
				nightStudyRequest.setClazz(clazz);
				nightStudyRequest.setGrade(grade);
				nightStudyRequest.setNumber(number);
				
				list.add(nightStudyRequest);
			}
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
		
		return list;
	}
	
	public void Write(String subject, String contents, String writer, String password)
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
			sql.append("  (title,content,write_time,password,writer) ");
			sql.append("VALUES ");
			sql.append("  (?,?, now(),?,?) ");
			
			pstmt = connection.prepareStatement(sql.toString());
			pstmt.setString(1, subject);
			pstmt.setString(2, contents);
			pstmt.setString(3, password);
			pstmt.setString(4, writer);
			
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
	}
	
	public List<BoardList> BoardList()
	{
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		List<BoardList> list = new LinkedList<BoardList>();
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
    		connection = 
    			DriverManager.getConnection(
    			"jdbc:mysql://114.108.167.90/dgsw_sms?useUnicode=true&characterEncoding=utf8", 
    			"dgsw", "dnrhddltks");
    		
    		StringBuilder sql = new StringBuilder();
    		sql.append("SELECT `id`,`title`,`content`,`write_time`,`writer`");
    		sql.append("  FROM board ORDER BY id DESC");


			
			BoardList boardList= null;
			
			pstmt = connection.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			
			while (rs.next())
			{
				int id = rs.getInt(1);
				String title = rs.getString(2);
				String content = rs.getString(3);
				Date write_time = rs.getDate(4);
				String writer = rs.getString(5);
				
				boardList = new BoardList();
				boardList.setId(id);
				boardList.setTitle(title);
				boardList.setContent(content);
				boardList.setDate(write_time);
				boardList.setWriter(writer);
				
				list.add(boardList);
			}
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
		
		return list;
	}
	
	public Board getBoard(int uri)
	{
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		Board board = null;
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			connection = 
				DriverManager.getConnection(
				"jdbc:mysql://114.108.167.90/dgsw_sms?useUnicode=true&characterEncoding=utf8", 
				"dgsw", "dnrhddltks");
			
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT * FROM board ");
			sql.append(" WHERE id = ? ");
			
			pstmt = connection.prepareStatement(sql.toString());
			pstmt.setInt(1, uri);
			
			rs = pstmt.executeQuery();
			
			if (rs.next())
			{
				board = new Board();
				
				board.setBoardId(rs.getInt("id"));
				board.setTitle(rs.getString("title"));
				board.setContent(rs.getString("content"));
				board.setWriteTime(rs.getDate("write_time"));
				board.setPassword(rs.getString("password"));
				board.setWriter(rs.getString("writer"));
			}
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
		
		return board;
	}
	
	public void Modify(int uri , String title, String content)
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
			sql.append("UPDATE board ");
			sql.append("  SET title=(?),content=(?) ");
			sql.append("WHERE id=(?)");
			
			pstmt = connection.prepareStatement(sql.toString());
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, uri);
			
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
	}
	
	public void Delete(int uri)
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
			sql.append("DELETE FROM `board` ");
			sql.append("WHERE id = (?) ");
			
			pstmt = connection.prepareStatement(sql.toString());
			pstmt.setInt(1, uri);
			
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
	}
	
	public static void main(String[] args)
	{
		try
		{
			UserService userService = new UserService();
			List<NightStudyRequest> list = userService.NightStudyPerson(10);
			for (NightStudyRequest item : list)
			{
				System.out.println(item.getTime() + "  " + item.getUserName());
			}
			System.out.println(list.size());
		}
		catch (Exception e)
		{
			e.printStackTrace();
			// TODO: handle exception
		}
	}
}
