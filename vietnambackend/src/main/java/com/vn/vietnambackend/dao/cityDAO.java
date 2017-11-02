package com.vn.vietnambackend.dao;

import java.util.List;

import com.vn.vietnambackend.dto.city;

public interface cityDAO {
	
	
	city get(int id);
	List<city> list();
	boolean add(city c);
	boolean update(city c);
	boolean delete(city c);

}
