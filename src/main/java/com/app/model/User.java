package com.app.model;

public class User {

	private String username;
	private String email;
	private String password;
	private Double balance;
	private String account_number;
	
	
	public User() {
		super();
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public Double getBalance() {
		return balance;
	}


	public void setBalance(Double balance) {
		this.balance = balance;
	}


	public String getAccount_number() {
		return account_number;
	}


	public void setAccount_number(String account_number) {
		this.account_number = account_number;
	}


	@Override
	public String toString() {
		return "User [username=" + username + ", email=" + email + ", password=" + password + ", balance=" + balance
				+ ", account_number=" + account_number + "]";
	}
	
	
	
	
	
	
}
