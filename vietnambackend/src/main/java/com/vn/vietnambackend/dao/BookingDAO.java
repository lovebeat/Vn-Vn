package com.vn.vietnambackend.dao;

import java.util.List;

import com.vn.vietnambackend.dto.Booking;


public interface BookingDAO {
	List<Booking> list();
	Booking get(int BookingId);
	boolean add(Booking booking);
	boolean update(Booking booking);
	boolean delete(Booking booking);
	/*List<Booking> listByRoom(int roomId);*/
	Booking getByRoom(int id);
}
