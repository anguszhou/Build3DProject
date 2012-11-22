package xjtu.citi.entity;

import java.util.Date;

public class Feedback {

	private int id;
	private Date time;           //反馈留言时间
	private int reviewer;        //反馈类型 0为企业对银行 1为银行到企业
	private String description;  //反馈内容
	
	private CompanyInfo companyInfo;    //关联企业信息表

	public Feedback(int id, Date time, int reviewer, String description,
			CompanyInfo companyInfo) {
		super();
		this.id = id;
		this.time = time;
		this.reviewer = reviewer;
		this.description = description;
		this.companyInfo = companyInfo;
	}
	
	public Feedback() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public int getReviewer() {
		return reviewer;
	}

	public void setReviewer(int reviewer) {
		this.reviewer = reviewer;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public CompanyInfo getCompanyInfo() {
		return companyInfo;
	}

	public void setCompanyInfo(CompanyInfo companyInfo) {
		this.companyInfo = companyInfo;
	}
	
	
}
