package com.vn.vietnambackend.dao;

import java.util.List;
import com.vn.vietnambackend.dto.City;


public interface CityDAO {
	List<City> list();
	City get(int cityId);
	City getCityById(String id);
	boolean add(City city);
	boolean update(City city);
	boolean delete(City city);
	List<City> listActiveCity();
	
}
