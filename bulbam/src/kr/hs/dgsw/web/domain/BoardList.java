package kr.hs.dgsw.web.domain;

import java.util.Date;

public class BoardList 
{
	
	private int id;
	private String title;
	private String writer;
	private Date write_time;
	private String content;
	private int views;
	
//	Id
	public int getId()
	{
		return id;
	}

	public void setId(int id)
	{
		this.id = id;
	}
	
//	Title
	public String getTitle()
	{
		return title;
	}
	
	public void setTitle(String title)
	{
		this.title = title;
	}
	
//	writer
	public String getWriterV()
	{
		return writer;
	}

	public void setWriter(String writer)
	{
		this.writer = writer;
	}

//	Date
	public Date getDate()
	{
		return write_time;
	}

	public void setDate(Date write_time)
	{
		this.write_time = write_time;
	}
	
//	Content
	public String getContent()
	{
		return content;
	}
	
	public void setContent(String content)
	{
		this.content= content;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}
	
}
