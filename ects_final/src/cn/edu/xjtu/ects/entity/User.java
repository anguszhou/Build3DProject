package cn.edu.xjtu.ects.entity;

public class User {
	
	private int id;//用户ID，主键
	private String name;//用户名
	private String passwd;//用户密码
	private ContactInfo contcatInfo;//用户详细信息
	
	/*构造函数*/
	public User(String name, String passwd) {
		super();
		this.name = name;
		this.passwd = passwd;
	}
	
	public User(int user_id, String name, String passwd, ContactInfo contcatInfo) {
		super();
		this.id = user_id;
		this.name = name;
		this.passwd = passwd;
		this.contcatInfo = contcatInfo;
	}

	public User() {
		super();
		
	}
	/*get和set方法*/
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public ContactInfo getContcatInfo() {
		return contcatInfo;
	}
	public void setContcatInfo(ContactInfo contcatInfo) {
		this.contcatInfo = contcatInfo;
	}
	
	
	
	

}
