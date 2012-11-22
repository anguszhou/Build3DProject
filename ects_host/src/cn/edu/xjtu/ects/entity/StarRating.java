package cn.edu.xjtu.ects.entity;

public class StarRating {
	private int id;//产品关联ID
	private int personNum = 0;//评分人数
	private int totalStar = 0;//评分总数
	private double avgStar = 0.0;//平均分数
	
	private Product product;//所评价商品

	/*构造函数*/
	public StarRating() {
		super();
		// TODO Auto-generated constructor stub
	}

	public StarRating(int id, int personNum, int totalStar, double avgStar,
			Product product) {
		super();
		this.id = id;
		this.personNum = personNum;
		this.totalStar = totalStar;
		this.avgStar = avgStar;
		this.product = product;
	}
	/*get和set函数*/

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getPersonNum() {
		return personNum;
	}

	public void setPersonNum(int personNum) {
		this.personNum = personNum;
	}

	public int getTotalStar() {
		return totalStar;
	}

	public void setTotalStar(int totalStar) {
		this.totalStar = totalStar;
	}

	public double getAvgStar() {
		return avgStar;
	}

	public void setAvgStar(double avgStar) {
		this.avgStar = avgStar;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}
	
	

	
	

}
