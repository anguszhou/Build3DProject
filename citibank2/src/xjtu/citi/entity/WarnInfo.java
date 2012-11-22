package xjtu.citi.entity;

import java.util.Date;

public class WarnInfo {

	private int id;
	private Date time;          //预警时间
	private double prevalue;       //预警前的分值
	private double latevalue;      //预警时的分值
	private String description;     //预警信息
	
	private WarnParameter warnpara;    //关联预警参数表
	private SMEassessment smeassess;   //关联中小企业表
	
	public WarnInfo(int id, Date time, double prevalue, double latevalue,
			String description, WarnParameter warnpara, SMEassessment smeassess) {
		super();
		this.id = id;
		this.time = time;
		this.prevalue = prevalue;
		this.latevalue = latevalue;
		this.description = description;
		this.warnpara = warnpara;
		this.smeassess = smeassess;
	}

	
	public WarnInfo() {
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

	public double getPrevalue() {
		return prevalue;
	}

	public void setPrevalue(double prevalue) {
		this.prevalue = prevalue;
	}

	public double getLatevalue() {
		return latevalue;
	}

	public void setLatevalue(double latevalue) {
		this.latevalue = latevalue;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public WarnParameter getWarnpara() {
		return warnpara;
	}

	public void setWarnpara(WarnParameter warnpara) {
		this.warnpara = warnpara;
	}

	public SMEassessment getSmeassess() {
		return smeassess;
	}

	public void setSmeassess(SMEassessment smeassess) {
		this.smeassess = smeassess;
	}
	
	
}
