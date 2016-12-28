package kr.hs.dgsw.web.domain;

import java.util.Date;

public class Board {
	
	private int id;
	private String title;
	private String content;
	private Date write_time;
	private String user_id;
	private String password;
	private String writer;
	
//	id
	public int getBoardId()
	{
		return id;
	}

	public void setBoardId(int id)
	{
		this.id = id;
	}
// title
	public String getTitle()
	{
		return title;
	}

	public void setTitle(String title)
	{
		this.title = title;
	}

//	content
	public String getContent()
	{
		return content;
	}

	public void setContent(String content)
	{
		this.content = content;
	}
//	write_time
	public Date getWriteTime()
	{
		return write_time;
	}

	public void setWriteTime(Date time)
	{
		this.write_time = time;
	}
//	user_id
	public String getUserId()
	{
		return user_id;
	}

	public void setUserId(String userId)
	{
		this.user_id = userId;
	}
//	password
	public String getPassword()
	{
		return password;
	}

	public void setPassword(String password)
	{
		this.password = password;
	}
	
//	writer
	public String getWriter()
	{
		return writer;
	}

	public void setWriter(String writer)
	{
		this.writer = writer;
	}
}
