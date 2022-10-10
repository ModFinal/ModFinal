package com.myweb.home.board.model;

public class FavoriteDTO {
	
	private int favId;
	private String accId;
	private int bId;
	
	public int getFavId() {
		return favId;
	}
	
	public void setFavId(int favId) {
		this.favId = favId;
	}
	
	public String getAccId() {
		return accId;
	}
	
	public void setAccId(String accId) {
		this.accId = accId;
	}
	
	public int getbId() {
		return bId;
	}
	
	public void setbId(int bId) {
		this.bId = bId;
	}
	
	@Override
	public String toString() {
		return "FavoriteDTO [favId=" + favId + ", accId=" + accId + ", bId=" + bId + "]";
	}
	
	

}
