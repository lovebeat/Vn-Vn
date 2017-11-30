package com.vn.vietnambackend.dao;

import java.util.List;
import com.vn.vietnambackend.dto.Food;


public interface FoodDAO {
	List<Food> list();
	Food get(int foodId);
	boolean add(Food food);
	boolean update(Food food);
	boolean delete(Food food);
	List<Food> listActiveFood();
	List<Food> listFoodById(int id);
}
