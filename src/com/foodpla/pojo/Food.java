package com.foodpla.pojo;

public class Food 
{
private String foodname,type,category,description;
private int price;
private long foodid;
public String getFoodname() {
	return foodname;
}
public void setFoodname(String foodname) {
	this.foodname = foodname;
}
public String getType() {
	return type;
}
public void setType(String type) {
	this.type = type;
}
public String getCategory() {
	return category;
}
public void setCategory(String category) {
	this.category = category;
}
public String getDescription() {
	return description;
}
public void setDescription(String description) {
	this.description = description;
}
public int getPrice() {
	return price;
}
public void setPrice(int price) {
	this.price = price;
}
public long getFoodid() {
	return foodid;
}
public void setFoodid(long foodid) {
	this.foodid = foodid;
}
@Override
public String toString() {
	return "Food [foodname=" + foodname + ", type=" + type + ", category=" + category + ", description=" + description
			+ ", price=" + price + ", foodid=" + foodid + "]";
}

}
