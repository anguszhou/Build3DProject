package xjtu.citi.entity;

import java.util.HashSet;
import java.util.Set;

public class IndustryType {

	private int id;
	private int code;         //��ҵ����
	private String name;      //��ҵ����
	
	private Set companys = new HashSet();    //������ҵ��Ϣ��

	public IndustryType(int id, int code, String name, Set companys) {
		super();
		this.id = id;
		this.code = code;
		this.name = name;
		this.companys = companys;
	}

	public IndustryType() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Set getCompanys() {
		return companys;
	}

	public void setCompanys(Set companys) {
		this.companys = companys;
	}
	
	
}
