package com.myweb.home.login.vo;

public class LoginVO {

	private String accountid;
	private String password;
	
	
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

	@Override
	public String toString() {
		return "LoginVO [accountid=" + accountid + ", password=" + password + "]";
	}

	

	
	
	
	
	

	
	
	
}
