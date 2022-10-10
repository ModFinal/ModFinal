package com.myweb.home.login.model;

import java.sql.Date;

public class AccountDTO {

	private String accountid;
	private String password;
	private String name;
	private String email;
	private String address1;
	private String address2;
	private String address3;
	private String address4;
	private String phone;
	private String admin;
	private int visitcnt;
	private Date registerdate;
	
	
	
	public String getAccountid() {
		return accountid;
	}
	
	public void setAccountid(String accountid) {
		this.accountid = accountid;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getAddress1() {
		return address1;
	}
	
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	
	public String getAddress2() {
		return address2;
	}
	
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	
	public String getAddress3() {
		return address3;
	}
	
	public void setAddress3(String address3) {
		this.address3 = address3;
	}
	
	public String getAddress4() {
		return address4;
	}
	
	public void setAddress4(String address4) {
		this.address4 = address4;
	}
	
	public String getPhone() {
		return phone;
	}
	
	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAdmin() {
		return admin;
	}
	
	public void setAdmin(String admin) {
		this.admin = admin;
	}
	
	public int getVisitcnt() {
		return visitcnt;
	}
	
	public void setVisitcnt(int visitcnt) {
		this.visitcnt = visitcnt;
	}
	
	public Date getRegisterdate() {
		return registerdate;
	}
	
	public void setRegisterdate(Date registerdate) {
		this.registerdate = registerdate;
	}

	@Override
	public String toString() {
		return "AccountDTO [accountid=" + accountid + ", password=" + password + ", name=" + name + ", email=" + email
				+ ", address1=" + address1 + ", address2=" + address2 + ", address3=" + address3 + ", address4="
				+ address4 + ", phone=" + phone + ", admin=" + admin + ", visitcnt=" + visitcnt + ", registerdate="
				+ registerdate + "]";
	}

	
	
	
	

}
