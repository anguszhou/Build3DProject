package cn.edu.xjtu.ects.entity;

public class Property {
	private int id;//ID
	private String propertyName;//��������
	private String propertyValue;//����ֵ
	
	private Product product;//������Ʒ
	
	/*���캯��*/
	public Property() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Property(int id, String propertyName, String propertyValue,
			Product product) {
		super();
		this.id = id;
		this.propertyName = propertyName;
		this.propertyValue = propertyValue;
		this.product = product;
	}
	/*get��set����*/

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPropertyName() {
		return propertyName;
	}

	public void setPropertyName(String propertyName) {
		this.propertyName = propertyName;
	}

	public String getPropertyValue() {
		return propertyValue;
	}

	public void setPropertyValue(String propertyValue) {
		this.propertyValue = propertyValue;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}
	

	
	
	
}
