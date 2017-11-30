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
	List<Hotel> listNotApprove();
	List<Hotel> listApprove();
}
