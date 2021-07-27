package com.foodpla.dao;
import java.util.ArrayList;

import com.foodpla.pojo.Food;

public interface FoodDao 
{
boolean AddFood(Food fd);
boolean UpdateFood(Food fd);
boolean DeleteFood(int foodid);
ArrayList<Food> ShowAllFood();
ArrayList<Food> SearchFoodByTypes(String type);
Food searchByFoodId(int foodid);
ArrayList<Food> SearchFoodByCategory(String category);
}
