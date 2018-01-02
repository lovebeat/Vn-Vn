package com.vn.vietnambackend.daoimpl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.vn.vietnambackend.dao.RoomDAO;
import com.vn.vietnambackend.dto.Booking;
import com.vn.vietnambackend.dto.Room;

@Repository("RoomDAO")
@Transactional
public class RoomDAOImpl implements RoomDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public List<Room> list() {
		return sessionFactory.getCurrentSession().createQuery("FROM Room", Room.class).getResultList();
	}

	public Room get(int RoomId) {
		try {
			return sessionFactory.getCurrentSession().get(Room.class, Integer.valueOf(RoomId));
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;
	}

	public boolean add(Room room) {
		try {
			sessionFactory.getCurrentSession().persist(room);
			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return false;
	}

	public boolean update(Room room) {
		try {
			sessionFactory.getCurrentSession().update(room);
			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return false;
	}

	public boolean delete(Room room) {
		try {
			room.setActive(false);
			//call the update method
			return this.update(room);
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		return false;
	}

	public List<Room> listByHotel(int id) {
		String select = "FROM Room WHERE hotel.id =:hotelId ";
		Query query = sessionFactory.getCurrentSession().createQuery(select);
		query.setParameter("hotelId", id);
		
		return query.getResultList();
	}
	
	
	
	
}
