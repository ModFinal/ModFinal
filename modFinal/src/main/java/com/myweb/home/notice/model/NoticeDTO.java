package com.myweb.home.notice.model;

import java.sql.Date;

public class NoticeDTO {
	
	private int notId;
	private String accId;
	private String title;
	private String content;
	private Date createDate;
	private int viewCnt;
	
	public int getNotId() {
		return notId;
	}
	
	public void setNotId(int notId) {
		this.notId = notId;
	}
	
	public String getAccId() {
		return accId;
	}
	
	public void setAccId(String accId) {
		this.accId = accId;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	
	@Override
	public String toString() {
		return "NoticeDTO [notId=" + notId + ", accId=" + accId + ", title=" + title + ", content=" + content
				+ ", createDate=" + createDate + ", viewCnt=" + viewCnt + "]";
	}
	
	
	

}
