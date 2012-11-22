package cn.edu.xjtu.ects.entity;

public class Admin{
	private Integer admin_id;
	private String name;
	private String passwd;
	public Admin(Integer admin_id, String name, String passwd) {
		super();
		this.admin_id = admin_id;
		this.name = name;
		this.passwd = passwd;
	}
	public Integer getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(Integer admin_id) {
		this.admin_id = admin_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public Admin() {
		super();
	}
	
}
