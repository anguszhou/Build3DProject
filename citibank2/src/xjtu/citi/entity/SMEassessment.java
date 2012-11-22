package xjtu.citi.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class SMEassessment {

	private int id;
	private String risklevel;     //风险等级
	private double score;       //分值
	private int rank;        //所有企业中排名
	private int industryrank;    //行业排名
	private Date time;       //时间
	
	
	private Set warninfos = new HashSet();   //关联预警信息
	private CompanyInfo companyinfo;
	
	public SMEassessment(int id, String risklevel, double score, int rank,
			int industryrank, Date time, Set warninfos, CompanyInfo companyinfo) {
		super();
		this.id = id;
		this.risklevel = risklevel;
		this.score = score;
		this.rank = rank;
		this.industryrank = industryrank;
		this.time = time;
		this.warninfos = warninfos;
		this.companyinfo = companyinfo;
	}

	public SMEassessment() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getRisklevel() {
		return risklevel;
	}

	public void setRisklevel(String risklevel) {
		this.risklevel = risklevel;
	}

	public double getScore() {
		return score;
	}

	public void setScore(double score) {
		this.score = score;
	}

	public int getRank() {
		return rank;
	}

	public void setRank(int rank) {
		this.rank = rank;
	}

	public int getIndustryrank() {
		return industryrank;
	}

	public void setIndustryrank(int industryrank) {
		this.industryrank = industryrank;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public Set getWarninfos() {
		return warninfos;
	}

	public void setWarninfos(Set warninfos) {
		this.warninfos = warninfos;
	}

	public CompanyInfo getCompanyinfo() {
		return companyinfo;
	}

	public void setCompanyinfo(CompanyInfo companyinfo) {
		this.companyinfo = companyinfo;
	}
	
	

	
}
