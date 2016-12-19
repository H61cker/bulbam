package kr.hs.dgsw.web.domain;

import java.util.Date;

public class NightStudyRequest
{
	private int id;
	
	private int userId;
	
	private Date time;
	
	private String userName;
	
	private int clazz;
	
	private int grade;
	
	private int number;

	
	public int getId()
	{
		return id;
	}

	public void setId(int id)
	{
		this.id = id;
	}

	public int getUserId()
	{
		return userId;
	}

	public void setUserId(int userId)
	{
		this.userId = userId;
	}

	public Date getTime()
	{
		return time;
	}

	public void setTime(Date time)
	{
		this.time = time;
	}

	public String getUserName()
	{
		return userName;
	}

	public void setUserName(String userName)
	{
		this.userName = userName;
	}

	public int getClazz()
	{
		return clazz;
	}

	public void setClazz(int clazz)
	{
		this.clazz = clazz;
	}

	public int getGrade()
	{
		return grade;
	}

	public void setGrade(int grade)
	{
		this.grade = grade;
	}

	public int getNumber()
	{
		return number;
	}

	public void setNumber(int number)
	{
		this.number = number;
	}
	
	
}
