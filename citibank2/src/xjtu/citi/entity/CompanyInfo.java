package xjtu.citi.entity;

import java.util.HashSet;
import java.util.Set;

public class CompanyInfo {

	private int id;
	private String name;           //��ҵ����
	private String taxnum;         //��ҵ˰��
	private double registfund;     //ע���ʽ�
	private String legal;          //��ҵ����
	private String telephone;      //��ϵ�绰
	private int isListedComp;      //�Ƿ������й�˾
	private int isCoreComp;        //�Ƿ��Ǵ���ҵ
	
	private IndustryType industrytype;     //������ҵ�����
	private Set feedbacks = new HashSet();   //������Ϣ������
	private Set smeassessments = new HashSet();
	private Set accounts = new HashSet();
	private Set users = new HashSet();

	public CompanyInfo(int id, String name, String taxnum, double registfund,
			String legal, String telephone, int isListedComp, int isCoreComp,
			IndustryType industrytype, Set feedbacks, Set smeassessments,
			Set accounts, Set users)
	{
		super();
		this.id = id;
		this.name = name;
		this.taxnum = taxnum;
		this.registfund = registfund;
		this.legal = legal;
		this.telephone = telephone;
		this.isListedComp = isListedComp;
		this.isCoreComp = isCoreComp;
		this.industrytype = industrytype;
		this.feedbacks = feedbacks;
		this.smeassessments = smeassessments;
		this.accounts = accounts;
		this.users = users;
	}


	public Set getUsers()
	{
		return users;
	}


	public void setUsers(Set users)
	{
		this.users = users;
	}


	public CompanyInfo(int id) {
		super();
		this.id = id;
	}


	public CompanyInfo() {
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

	public double getRegistfund() {
		return registfund;
	}

	public void setRegistfund(double registfund) {
		this.registfund = registfund;
	}

	public String getLegal() {
		return legal;
	}

	public void setLegal(String legal) {
		this.legal = legal;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public int getIsListedComp() {
		return isListedComp;
	}

	public void setIsListedComp(int isListedComp) {
		this.isListedComp = isListedComp;
	}

	public int getIsCoreComp() {
		return isCoreComp;
	}

	public void setIsCoreComp(int isCoreComp) {
		this.isCoreComp = isCoreComp;
	}

	public IndustryType getIndustrytype() {
		return industrytype;
	}

	public void setIndustrytype(IndustryType industrytype) {
		this.industrytype = industrytype;
	}

	public Set getFeedbacks() {
		return feedbacks;
	}

	public void setFeedbacks(Set feedbacks) {
		this.feedbacks = feedbacks;
	}

	public Set getSmeassessments() {
		return smeassessments;
	}

	public void setSmeassessments(Set smeassessments) {
		this.smeassessments = smeassessments;
	}


	public Set getAccounts() {
		return accounts;
	}


	public void setAccounts(Set accounts) {
		this.accounts = accounts;
	}
	
}
