package com.vn.vietnambackend.dao;

import java.util.List;


import com.vn.vietnambackend.dto.Hotel;

public interface HotelDAO {
	
	List<Hotel> list();
	Hotel get(int providerId);
	boolean add(Hotel provider);
	boolean update(Hotel provider);
	boolean delete(Hotel provider);
	List<Hotel> listActiveAndNotApprove();
	List<Hotel> listNotApprove(int user);
	List<Hotel> listApprove(int userId);
	List<Hotel> listApprove();
	Hotel HotelByUser(int id);
	
	
	List<Hotel> search(String keyword);
}
