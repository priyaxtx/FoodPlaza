package com.foodpla.pojo;

public class Order21020 
{
	private String bookingdatetime,address,email_id;
	private int totalprice;
	private long orderid;
	public String getBookingdatetime() {
		return bookingdatetime;
	}
	public void setBookingdatetime(String bookingdatetime) {
		this.bookingdatetime = bookingdatetime;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail_id() {
		return email_id;
	}
	public void setEmail_id(String email_id) {
		this.email_id = email_id;
	}
	public int getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}
	public long getOrderid() {
		return orderid;
	}
	public void setOrderid(long orderid) {
		this.orderid = orderid;
	}
	@Override
	public String toString() {
		return "Order21020 [bookingdatetime=" + bookingdatetime + ", address=" + address + ", email_id=" + email_id
				+ ", totalprice=" + totalprice + ", orderid=" + orderid + "]";
	}
	
}
