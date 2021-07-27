package com.foodpla.pojo;

public class Customer 
{
private String name,password,email_id,address;
private int contact;
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public String getEmail_id() {
	return email_id;
}
public void setEmail_id(String email_id) {
	this.email_id = email_id;
}
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
}
public int getContact() {
	return contact;
}
public void setContact(int contact) {
	this.contact = contact;
}
@Override
public String toString() {
	return "Customer [name=" + name + ", password=" + password + ", email_id=" + email_id + ", address=" + address
			+ ", contact=" + contact + "]";
}

}
