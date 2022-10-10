package com.myweb.home.board.model;

import java.sql.Date;

public class BoardVO {
	
	private int bid;
	private String btitle;
	private int categoryid;
	private String bcontent;
	private String accountid;
	private String dealmethod;
	private int price;
	private String pcondition;
	private Date createDate;
	private int viewcnt;
	private String buystatus;
	private String url;
	
	
	
	public int getBid() {
		return bid;
	}
	
	public void setBid(int bid) {
		this.bid = bid;
	}
	
	public String getBtitle() {
		return btitle;
	}
	
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	
	public int getCategoryid() {
		return categoryid;
	}
	public void setCategoryid(int categoryid) {
		this.categoryid = categoryid;
	}
	
	public String getBcontent() {
		return bcontent;
	}
	
	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}
	
	public String getAccountid() {
		return accountid;
	}
	
	public void setAccountid(String accountid) {
		this.accountid = accountid;
	}
	
	public String getDealmethod() {
		return dealmethod;
	}
	
	public void setDealmethod(String dealmethod) {
		this.dealmethod = dealmethod;
	}
	
	public int getPrice() {
		return price;
	}
	
	public void setPrice(int price) {
		this.price = price;
	}
	
	public String getPcondition() {
		return pcondition;
	}
	
	public void setPcondition(String pcondition) {
		this.pcondition = pcondition;
	}
	
	public Date getCreateDate() {
		return createDate;
	}
	
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	public int getViewcnt() {
		return viewcnt;
	}
	
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	
	public String getBuystatus() {
		return buystatus;
	}
	
	public void setBuystatus(String buystatus) {
		this.buystatus = buystatus;
	}
	
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	@Override
	public String toString() {
		return "BoardVO [bid=" + bid + ", btitle=" + btitle + ", categoryid=" + categoryid + ", bcontent=" + bcontent
				+ ", accountid=" + accountid + ", dealmethod=" + dealmethod + ", price=" + price + ", pcondition="
				+ pcondition + ", createDate=" + createDate + ", viewcnt=" + viewcnt + ", buystatus=" + buystatus
				+ ", url=" + url + "]";
	}

}
