package xjtu.citi.entity;

public class CompanyUser {

	private int id;
	private String name;      //企业名称
	private String taxnum;     //企业税号
	private String username;   //用户名
	private String password;   //密码
	
	private CompanyInfo companyinfo;
	
	public CompanyUser(int id, String name, String taxnum, String username,
			String password, CompanyInfo companyinfo)
	{
		super();
		this.id = id;
		this.name = name;
		this.taxnum = taxnum;
		this.username = username;
		this.password = password;
		this.companyinfo = companyinfo;
	}

	public CompanyUser() {
		super();
	}

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
	public String getTaxnum() {
		return taxnum;
	}
	public void setTaxnum(String taxnum) {
		this.taxnum = taxnum;
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

	public CompanyInfo getCompanyinfo()
	{
		return companyinfo;
	}

	public void setCompanyinfo(CompanyInfo companyinfo)
	{
		this.companyinfo = companyinfo;
	}
	
	
}
