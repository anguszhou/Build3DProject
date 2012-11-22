package xjtu.citi.entity;

public class BankUser {

	private int id;
	private String workNum;      //Ա����
	private String name;         //Ա������
	private String department;   //Ա�����ڲ���
	private String username;     //�û���
	private String password;     //����
	private UserType usertype;     //����Ա����ɫȨ��

	public BankUser(int id, String workNum, String name, String department,
			String username, String password, UserType usertype) {
		super();
		this.id = id;
		this.workNum = workNum;
		this.name = name;
		this.department = department;
		this.username = username;
		this.password = password;
		this.usertype = usertype;
	}
	

	public BankUser() {
		super();
	}


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getWorkNum() {
		return workNum;
	}

	public void setWorkNum(String workNum) {
		this.workNum = workNum;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public UserType getUsertype() {
		return usertype;
	}

	public void setUsertype(UserType usertype) {
		this.usertype = usertype;
	}
	
	
	
	
}
