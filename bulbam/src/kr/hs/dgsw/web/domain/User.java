package kr.hs.dgsw.web.domain;

public class User
{
	private int userId;
	
	private String password;
	
	private int number;
	
	private String type;
	
	private int grade;
	
	private int clazz;
	
	private String loginId;
	
	private String userName;

	public int getUserId()
	{
		return userId;
	}

	public void setUserId(int userId)
	{
		this.userId = userId;
	}

	public String getPassword()
	{
		return password;
	}

	public void setPassword(String password)
	{
		this.password = password;
	}

	public int getNumber()
	{
		return number;
	}

	public void setNumber(int number)
	{
		this.number = number;
	}

	public String getType()
	{
		return type;
	}

	public void setType(String type)
	{
		this.type = type;
	}

	public int getGrade()
	{
		return grade;
	}

	public void setGrade(int grade)
	{
		this.grade = grade;
	}

	public int getClazz()
	{
		return clazz;
	}

	public void setClazz(int clazz)
	{
		this.clazz = clazz;
	}

	public String getLoginId()
	{
		return loginId;
	}

	public void setLoginId(String loginId)
	{
		this.loginId = loginId;
	}

	public String getUserName()
	{
		return userName;
	}

	public void setUserName(String userName)
	{
		this.userName = userName;
	}
	
	
}
