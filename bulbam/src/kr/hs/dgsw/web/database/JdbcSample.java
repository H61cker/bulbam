package kr.hs.dgsw.web.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class JdbcSample
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
			
			pstmt = connection.prepareStatement("SELECT * FROM artist");
			rs = pstmt.executeQuery();
			
			int id = 0;
			String name = null;
			int debutYear = 0;
			
			while (rs.next())
			{
				id = rs.getInt("artist_id");
				name = rs.getString("artist_name");
				debutYear = rs.getInt("debut_year");
				
				System.out.println(id + "  " + name + "  " + debutYear);
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
