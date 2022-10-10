package com.myweb.home.board.model;

import java.sql.Date;

public class BoardDTO {
	
	private int bId;
	private String bTitle;
	private String bContent;
	private String accountId;
	private String dealMethod;
	private int price;
	private String pCondition;
	private Date createDate;
	private int viewCnt;
	private String buyStatus;
	private String url;
	private int cateId;
	private String cateName;
	
	
	
	public int getbId() {
		return bId;
	}
	
	public void setbId(int bId) {
		this.bId = bId;
	}
	
	public String getbTitle() {
		return bTitle;
	}
	
	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}
	
	
	public String getbContent() {
		return bContent;
	}
	
	public void setbContent(String bContent) {
		this.bContent = bContent;
	}
	
	public String getAccountId() {
		return accountId;
	}
	
	public void setAccountId(String accountId) {
		this.accountId = accountId;
	}
	
	public String getDealMethod() {
		return dealMethod;
	}
	
	public void setDealMethod(String dealMethod) {
		this.dealMethod = dealMethod;
	}
	
	public int getPrice() {
		return price;
	}
	
	public void setPrice(int price) {
		this.price = price;
	}
	
	public String getpCondition() {
		return pCondition;
	}
	
	public void setpCondition(String pCondition) {
		this.pCondition = pCondition;
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
	
	public String getBuyStatus() {
		return buyStatus;
	}
	
	public void setBuyStatus(String buyStatus) {
		this.buyStatus = buyStatus;
	}
	
	public String getUrl() {
		return url;
	}
	
	public void setUrl(String url) {
		this.url = url;
	}
	
	public int getCateId() {
		return cateId;
	}

	public void setCateId(int cateId) {
		this.cateId = cateId;
	}

	public String getCateName() {
		return cateName;
	}

	public void setCateName(String cateName) {
		this.cateName = cateName;
	}

	@Override
	public String toString() {
		return "BoardDTO [bId=" + bId + ", bTitle=" + bTitle + ", bContent=" + bContent + ", accountId=" + accountId
				+ ", dealMethod=" + dealMethod + ", price=" + price + ", pCondition=" + pCondition + ", createDate="
				+ createDate + ", viewCnt=" + viewCnt + ", buyStatus=" + buyStatus + ", url=" + url + ", cateId="
				+ cateId + ", cateName=" + cateName + "]";
	}
	
	
	
	
	
	
   
	
	
	
	
	
}
