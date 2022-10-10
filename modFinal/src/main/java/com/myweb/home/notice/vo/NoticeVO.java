package com.myweb.home.notice.vo;

public class NoticeVO {
	private int notId;
	private String title;
	private String content;
	
	public int getNotId() {
		return notId;
	}
	
	public void setNotId(int notId) {
		this.notId = notId;
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

	@Override
	public String toString() {
		return "NoticeVO [notId=" + notId + ", title=" + title + ", content=" + content + "]";
	}
	
	
	

}
