package xjtu.citi.entity;

public class Account {

	private int id;
	private String account;         //�˺���Ϣ
	
	private CompanyInfo companyinfo;    //������ҵ��Ϣ��

	public Account(int id, String account, CompanyInfo companyinfo) {
		super();
		this.id = id;
		this.account = account;
		this.companyinfo = companyinfo;
	}

	public Account() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public CompanyInfo getCompanyinfo() {
		return companyinfo;
	}

	public void setCompanyinfo(CompanyInfo companyinfo) {
		this.companyinfo = companyinfo;
	}
	
	
}
