package com.app.model;

import java.sql.Timestamp;

public class Transaction {
	
	private Integer user_id;
	private String transaction_type;
	private Double amount;
	
	private Timestamp created_at;

	public Transaction() {
		super();
	}

	public Integer getUser_id() {
		return user_id;
	}

	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}

	public String getTransaction_type() {
		return transaction_type;
	}

	public void setTransaction_type(String transaction_type) {
		this.transaction_type = transaction_type;
	}

	public Double getAmount() {
		return amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}

	public Timestamp getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Timestamp created_at) {
		this.created_at = created_at;
	}

	@Override
	public String toString() {
		return "Transaction [user_id=" + user_id + ", transaction_type=" + transaction_type + ", amount=" + amount
				+ ", created_at=" + created_at + "]";
	}
	
	
	

}
