package com.foodpla.pojo;

public class Cart 
{
private String email_id,foodname,addons;
private int cartid,quantity,totalprice;
private long foodid;
public String getEmail_id() {
	return email_id;
}
public void setEmail_id(String email_id) {
	this.email_id = email_id;
}
public String getFoodname() {
	return foodname;
}
public void setFoodname(String foodname) {
	this.foodname = foodname;
}
public String getAddons() {
	return addons;
}
public void setAddons(String addons) {
	this.addons = addons;
}
public int getCartid() {
	return cartid;
}
public void setCartid(int cartid) {
	this.cartid = cartid;
}
public int getQuantity() {
	return quantity;
}
public void setQuantity(int quantity) {
	this.quantity = quantity;
}
public int getTotalprice() {
	return totalprice;
}
public void setTotalprice(int totalprice) {
	this.totalprice = totalprice;
}
public long getFoodid() {
	return foodid;
}
public void setFoodid(long foodid) {
	this.foodid = foodid;
}
@Override
public String toString() {
	return "Cart [email_id=" + email_id + ", foodname=" + foodname + ", addons=" + addons + ", cartid=" + cartid
			+ ", quantity=" + quantity + ", totalprice=" + totalprice + ", foodid=" + foodid + "]";
}

}
