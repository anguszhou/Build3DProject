package cn.edu.xjtu.ects.entity;

import java.sql.Date;

public class notice {
	private	Integer id;
	private String noticeTitle;
	private String noticeContext;
	private Date noticeDate;
	
	
	public notice() {
		super();
		// TODO Auto-generated constructor stub
	}
	public notice(Integer id, String noticeTitle, String noticeContext,
			Date noticeDate) {
		super();
		this.id = id;
		this.noticeTitle = noticeTitle;
		this.noticeContext = noticeContext;
		this.noticeDate = noticeDate;
	}
	public Integer getid() {
		return id;
	}
	public void setid(Integer id) {
		this.id = id;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeContext() {
		return noticeContext;
	}
	public void setNoticeContext(String noticeContext) {
		this.noticeContext = noticeContext;
	}
	public Date getNoticeDate() {
		return noticeDate;
	}
	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}
	

}
