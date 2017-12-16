package com.vn.vietnambackend.daoimpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.vn.vietnambackend.dao.BookingDAO;
import com.vn.vietnambackend.dto.Booking;
import com.vn.vietnambackend.dto.Room;
@Repository("BookingDAO")
@Transactional
public class BookingDAOImpl implements BookingDAO {
	@Autowired
	private SessionFactory sessionFactory;
	public List<Booking> list() {
		return sessionFactory.getCurrentSession().createQuery("FROM Booking", Booking.class).getResultList();
	}

	public Booking get(int BookingId) {
		try {
			return sessionFactory.getCurrentSession().get(Booking.class, Integer.valueOf(BookingId));
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;
	}

	public boolean add(Booking booking) {
		try {
			sessionFactory.getCurrentSession().persist(booking);
			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return false;
	}

	public boolean update(Booking booking) {
		try {
			sessionFactory.getCurrentSession().update(booking);
			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return false;
	}


	public boolean delete(Booking booking) {
		try {
			booking.setActive(false);
			//call the update method
			return this.update(booking);
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		return false;
	}

	public Booking getByRoom(int id) {
		
		String select = "FROM Booking WHERE roomId =:roomId order by id";
		Query query = sessionFactory.getCurrentSession().createQuery(select);
		query.setParameter("roomId", id);
		
		return (Booking)query.getResultList().get(0);
	}

	/*public List<Booking> listByRoom(int roomId) {
		String select = "FROM Booking WHERE roomId =:roomId";
		Query query = sessionFactory.getCurrentSession().createQuery(select);
		query.setParameter("roomId", roomId);
		return query.getResultList();
	}*/

	

}
