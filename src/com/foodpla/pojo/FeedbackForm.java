package com.foodpla.pojo;

public class FeedbackForm 
{
private String email_id,comments;
private int ratings;
private long orderid;
public String getEmail_id() {
	return email_id;
}
public void setEmail_id(String email_id) {
	this.email_id = email_id;
}
public String getComments() {
	return comments;
}
public void setComments(String comments) {
	this.comments = comments;
}
public int getRatings() {
	return ratings;
}
public void setRatings(int ratings) {
	this.ratings = ratings;
}
public long getOrderid() {
	return orderid;
}
public void setOrderid(long orderid) {
	this.orderid = orderid;
}
@Override
public String toString() {
	return "FeedbackForm [email_id=" + email_id + ", comments=" + comments + ", ratings=" + ratings + ", orderid="
			+ orderid + "]";
}

}
