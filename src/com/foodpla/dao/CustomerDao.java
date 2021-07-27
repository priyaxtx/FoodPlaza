package com.foodpla.dao;

import java.util.ArrayList;

import com.foodpla.pojo.Customer;

public interface CustomerDao 
{
boolean RegisterCustomer(Customer c);
boolean UpdateCustomer(Customer c);
boolean DeleteCustomer(String email_id);
ArrayList<Customer> ShowAllCustomer();
Customer ShowProfile(String email_id);
}
