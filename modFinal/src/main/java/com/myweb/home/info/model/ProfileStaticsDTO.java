package com.myweb.home.info.model;

import java.sql.Date;

public class ProfileStaticsDTO {
	
	private int profileId;
	private String accId;
	private String visited;
	private Date latestVisit;
	
	public int getProfileId() {
		return profileId;
	}
	
	public void setProfileId(int profileId) {
		this.profileId = profileId;
	}
	
	public String getAccId() {
		return accId;
	}
	
	public void setAccId(String accId) {
		this.accId = accId;
	}
	
	public String getVisited() {
		return visited;
	}
	
	public void setVisited(String visited) {
		this.visited = visited;
	}
	
	public Date getLatestVisit() {
		return latestVisit;
	}
	
	public void setLatestVisit(Date latestVisit) {
		this.latestVisit = latestVisit;
	}

	@Override
	public String toString() {
		return "ProfileStaticsDTO [profileId=" + profileId + ", accId=" + accId + ", visited="
				+ visited + ", latestVisit=" + latestVisit + "]";
	}
	
	
	
	

}
