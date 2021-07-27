package com.foodpla.dao;

import java.util.ArrayList;

import com.foodpla.pojo.Order21020;

public interface OrderDao 
{
boolean AddOrder(String email_id);
boolean CancelOrder(int orderid);
ArrayList<Order21020>ShowAllOrders();
ArrayList<Order21020>ShowAllOrders(String email_id);
Order21020 ShowOrder (long orderid);
}
