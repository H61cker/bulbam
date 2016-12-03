package kr.hs.dgsw.web.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DB
{
	public static void main(String[] args)
	{
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try
		{
			connection = 
				DriverManager.getConnection(
				"jdbc:mysql://114.108.167.90/dgsw_sms?useUnicode=true&characterEncoding=utf8", 
				"dgsw", "dnrhddltks");
			
			pstmt = connection.prepareStatement("SELECT * FROM user");
			rs = pstmt.executeQuery();
			
			int id = 0;
			String name = null;
			String login = null;
			String password = null;
			
			while (rs.next())
			{
				id = rs.getInt("user_id");
				login = rs.getString("login_id");
				password = rs.getString("password");
				name = rs.getString("user_name");
				
				System.out.println(id + "  " + login + "  "+password+" "+ name);
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
		
		
	}
}
