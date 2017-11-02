package com.vn.vietnambackend.dao;

import java.util.List;
import com.vn.vietnambackend.dto.City;


public interface CityDAO {
	List<City> list();
	City get(int cityId);
	boolean add(City product);
	boolean update(City product);
	boolean delete(City product);
	List<City> listActiveCity();
}
