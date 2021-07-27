package com.foodpla.dao;

import java.util.ArrayList;

import com.foodpla.pojo.Cart;

public interface CartDao 
{
boolean AddCart(Cart ct);
boolean ClearCart(String email_id);
ArrayList<Cart> ShowAllCart();
ArrayList<Cart> Showcart(String email_id);
boolean DeleteCart(int cartid);
}
