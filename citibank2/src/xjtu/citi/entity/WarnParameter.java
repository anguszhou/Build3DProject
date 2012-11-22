package xjtu.citi.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class WarnParameter {

	private int id;
	private double value;     //临界预警值
	private Date time;      //预警值修改时间
	
	private Set warninfos = new HashSet();  //关联预警信息表

	

	public WarnParameter(int id, double value, Date time, Set warninfos) {
		super();
		this.id = id;
		this.value = value;
		this.time = time;
		this.warninfos = warninfos;
	}

	public WarnParameter() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public double getValue() {
		return value;
	}

	public void setValue(double value) {
		this.value = value;
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

}
