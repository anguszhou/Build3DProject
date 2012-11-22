package com.ambow.ects.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class Product implements  Serializable{

	private  Integer id;
	private  String  name="";	
	private  String  model="";	
	private  String  images;		
	private  String  service;
	private  String  cpu;
	private  String  board;
	private  String  color;
	private  String  disk="";
	private  String  display;
	private  String  memory;
	private  String  type="";
	private  String  descriptions;	
	
	private  Integer saleVolume;
	private  double  size;
	private  double  basePrice;		
	private  double  discountPrice;
	private  boolean promoted;
	private  boolean discounted;
	private  Date    time;
	
	private  Category  category;
	private   Set  comments = new HashSet();
	private  StarRating starRating;
	
	

	public Set getComments()
	{
		return comments;
	}

	public void setComments(Set comments)
	{
		this.comments = comments;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getImages() {
		return images;
	}

	public void setImages(String images) {
		this.images = images;
	}

	public String getService() {
		return service;
	}

	public void setService(String service) {
		this.service = service;
	}

	public String getCpu() {
		return cpu;
	}

	public void setCpu(String cpu) {
		this.cpu = cpu;
	}

	public String getBoard() {
		return board;
	}

	public void setBoard(String board) {
		this.board = board;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getDisk() {
		return disk;
	}

	public void setDisk(String disk) {
		this.disk = disk;
	}

	public String getDisplay() {
		return display;
	}

	public void setDisplay(String display) {
		this.display = display;
	}

	public String getMemory() {
		return memory;
	}

	public void setMemory(String memory) {
		this.memory = memory;
	}

	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getDescriptions() {
		return descriptions;
	}

	public void setDescriptions(String descriptions) {
		this.descriptions = descriptions;
	}

	public Integer getSaleVolume() {
		return saleVolume;
	}

	public void setSaleVolume(Integer saleVolume) {
		this.saleVolume = saleVolume;
	}

	public double getSize() {
		return size;
	}

	public void setSize(double size) {
		this.size = size;
	}

	public double getBasePrice() {
		return basePrice;
	}

	public void setBasePrice(double basePrice) {
		this.basePrice = basePrice;
	}

	public double getDiscountPrice() {
		return discountPrice;
	}

	public void setDiscountPrice(double discountPrice) {
		this.discountPrice = discountPrice;
	}

	public boolean isPromoted() {
		return promoted;
	}

	public void setPromoted(boolean promoted) {
		this.promoted = promoted;
	}

	public boolean isDiscounted() {
		return discounted;
	}

	public void setDiscounted(boolean discounted) {
		this.discounted = discounted;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}
	
	public Product(){
		
	}

	
	

	public Product(Integer id, String name, String model, String images,
			String service, String cpu, String board, String color,
			String disk, String display, String memory, String type,
			String descriptions, Integer saleVolume, double size,
			double basePrice, double discountPrice, boolean promoted,
			boolean discounted, Date time, Category category, Set comments,
			StarRating starRating)
	{
		super();
		this.id = id;
		this.name = name;
		this.model = model;
		this.images = images;
		this.service = service;
		this.cpu = cpu;
		this.board = board;
		this.color = color;
		this.disk = disk;
		this.display = display;
		this.memory = memory;
		this.type = type;
		this.descriptions = descriptions;
		this.saleVolume = saleVolume;
		this.size = size;
		this.basePrice = basePrice;
		this.discountPrice = discountPrice;
		this.promoted = promoted;
		this.discounted = discounted;
		this.time = time;
		this.category = category;
		this.comments = comments;
		this.starRating = starRating;
	}

	public StarRating getStarRating()
	{
		return starRating;
	}

	public void setStarRating(StarRating starRating)
	{
		this.starRating = starRating;
	}

	
	
}
