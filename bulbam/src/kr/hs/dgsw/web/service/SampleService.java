package kr.hs.dgsw.web.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public final class SampleService
{
	private static SampleService instance = new SampleService();
	
	private SampleService()
	{
		
	}
	
	public static SampleService getInstance()
	{
		return instance;
	}
	
	public int getVisitCount(String name)
	{
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int visitCount = 0;
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			
			connection = 
				DriverManager.getConnection(
				"jdbc:mysql://114.108.167.90/dgsw_sms?useUnicode=true&characterEncoding=utf8", 
				"dgsw", "dnrhddltks");
			
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT COUNT(*) FROM visit WHERE visiter_name = ? ");
			
			pstmt = connection.prepareStatement(sql.toString());
			pstmt.setString(1, name);
			
			rs = pstmt.executeQuery();
			if (rs.next())
			{
				visitCount = rs.getInt(1);
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
		
		return visitCount;
	}
	
	public void saveVisit(String name)
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
			sql.append("INSERT INTO visit (visiter_name, visit_time) VALUES (?, now())");
			
			pstmt = connection.prepareStatement(sql.toString());
			pstmt.setString(1, name);
			
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
	
	
}
