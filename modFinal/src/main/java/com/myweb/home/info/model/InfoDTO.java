package com.myweb.home.info.model;


public class InfoDTO {
	
	private int bId;
	private String accId;
	private String bTitle;
	private String name;
	private String url;
	private int price;
	private String buyStatus;
	private int visitCnt;
	private int regDate;
	private int buyCnt;
	private int sellCnt;

	
	public int getBuyCnt() {
		return buyCnt;
	}

	public void setBuyCnt(int buyCnt) {
		this.buyCnt = buyCnt;
	}

	public int getSellCnt() {
		return sellCnt;
	}

	public void setSellCnt(int sellCnt) {
		this.sellCnt = sellCnt;
	}

	public int getbId() {
		return bId;
	}
	
	public void setbId(int bId) {
		this.bId = bId;
	}
	
	public String getAccId() {
		return accId;
	}
	
	public void setAccId(String accId) {
		this.accId = accId;
	}
	
	public String getbTitle() {
		return bTitle;
	}
	
	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getUrl() {
		return url;
	}
	
	public void setUrl(String url) {
		this.url = url;
	}
	
	public int getPrice() {
		return price;
	}
	
	public void setPrice(int price) {
		this.price = price;
	}
	
	public String getBuyStatus() {
		return buyStatus;
	}
	
	public void setBuyStatus(String buyStatus) {
		this.buyStatus = buyStatus;
	}
	
	public int getVisitCnt() {
		return visitCnt;
	}

	public void setVisitCnt(int visitCnt) {
		this.visitCnt = visitCnt;
	}

	public int getRegDate() {
		return regDate;
	}
	
	public void setRegDate(int regDate) {
		this.regDate = regDate;
	}
	
	@Override
	public String toString() {
		return "InfoDTO [bId=" + bId + ", accId=" + accId + ", bTitle=" + bTitle + ", name=" + name + ", url=" + url
				+ ", price=" + price + ", buyStatus=" + buyStatus + ", visitCnt=" + visitCnt + ", regDate=" + regDate
				+ ", buyCnt=" + buyCnt + ", sellCnt=" + sellCnt + "]";
	}
	
	
	

}
