package xjtu.citi.entity;

import java.util.Date;

public class TransInfo {

	private int id;
	private String accountIn;     //转入账户税号
	private String accountOut;    //转出账户税号
	private double amount;     //转账金额
	private Date time;    //转账时间
	
	public TransInfo(int id, String accountIn, String accountOut,
			double amount, Date time) {
		super();
		this.id = id;
		this.accountIn = accountIn;
		this.accountOut = accountOut;
		this.amount = amount;
		this.time = time;
	}
	
	public TransInfo() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAccountIn() {
		return accountIn;
	}

	public void setAccountIn(String accountIn) {
		this.accountIn = accountIn;
	}

	public String getAccountOut() {
		return accountOut;
	}

	public void setAccountOut(String accountOut) {
		this.accountOut = accountOut;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}
	
	
}
