package kr.hs.dgsw.web.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kr.hs.dgsw.web.domain.User;

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
}
