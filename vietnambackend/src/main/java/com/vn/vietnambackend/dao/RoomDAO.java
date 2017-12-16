package com.vn.vietnambackend.dao;

import java.util.List;

import com.vn.vietnambackend.dto.Room;

public interface RoomDAO {
	
	List<Room> list();
	Room get(int RoomId);
	boolean add(Room room);
	boolean update(Room room);
	boolean delete(Room room);
	List<Room> listByHotel(int id);
}
