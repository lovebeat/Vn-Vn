package com.vn.vietnambackend.dao;

import java.util.List;

import com.vn.vietnambackend.dto.Place;

public interface PlaceDAO {
	
	List<Place> list();
	Place get(int placeId);
	boolean add(Place place);
	boolean update(Place place);
	boolean delete(Place place);
	List<Place> listActivePlace();

}
