package com.myweb.home.board.model;

import java.sql.Date;

public class BoardStaticsDTO {
	
	private int BoardStatId;
	private String accId;
	private int bId;
	private String viewed;
	private Date latestView;
	
	public int getBoardStatId() {
		return BoardStatId;
	}
	
	public void setBoardStatId(int boardStatId) {
		BoardStatId = boardStatId;
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

	public String getViewed() {
		return viewed;
	}

	public void setViewed(String viewed) {
		this.viewed = viewed;
	}

	public Date getLatestView() {
		return latestView;
	}

	public void setLatestView(Date latestView) {
		this.latestView = latestView;
	}

	@Override
	public String toString() {
		return "BoardStaticsDTO [BoardStatId=" + BoardStatId + ", accId=" + accId + ", bId=" + bId + ", viewed="
				+ viewed + ", latestView=" + latestView + "]";
	}
	
	
	
	

}
