package com.vn.vietnambackend.daoimpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.vn.vietnambackend.dao.HotelDAO;
import com.vn.vietnambackend.dto.Booking;
import com.vn.vietnambackend.dto.Hotel;
import com.vn.vietnambackend.dto.Place;

@Repository("HotelDAO")
@Transactional
public class HotelDAOImpl implements HotelDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	public List<Hotel> list() {
		return sessionFactory.getCurrentSession().createQuery("FROM Hotel", Hotel.class).getResultList();
	}

	public Hotel get(int providerId) {
		try {
			return sessionFactory.getCurrentSession().get(Hotel.class, Integer.valueOf(providerId));
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		return null;
	}

	public boolean add(Hotel provider) {
		try {
			sessionFactory.getCurrentSession().persist(provider);
			return true;
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		return false;
	}

	public boolean update(Hotel provider) {
		try {
			sessionFactory.getCurrentSession().update(provider);
			return true;
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		return false;
	}

	public boolean delete(Hotel provider) {
		try {
			provider.setActive(false);
			//call the update method
			return this.update(provider);
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		return false;
	}

	public List<Hotel> listActiveAndNotApprove() {
		String selectActiveAndNotApprove = "FROM Hotel WHERE active =:active AND approve =:approve";
		Query query = sessionFactory.getCurrentSession().createQuery(selectActiveAndNotApprove);
		query.setParameter("active", true);
		query.setParameter("approve", false);
		
		return query.getResultList();
	}

	public List<Hotel> listNotApprove(int user) {
		String selectNotApprove = "FROM Hotel WHERE approve =:approve AND user.id =:user";
		Query query = sessionFactory.getCurrentSession().createQuery(selectNotApprove);
		query.setParameter("approve", false);
		query.setParameter("user", user);
		return query.getResultList();
	}

	public List<Hotel> listApprove(int userId) {
		String selectApprove = "FROM Hotel WHERE approve =:approve AND user.id =:userId";
		Query query = sessionFactory.getCurrentSession().createQuery(selectApprove);
		query.setParameter("approve", true);
		query.setParameter("userId", userId);
		
		return query.getResultList();
	}
	public List<Hotel> listApprove() {
		String selectApprove = "FROM Hotel WHERE approve =:approve ";
		Query query = sessionFactory.getCurrentSession().createQuery(selectApprove);
		query.setParameter("approve", true);
		return query.getResultList();
	}

	public Hotel HotelByUser(int id) {
		try {
			return sessionFactory.getCurrentSession().get(Hotel.class, Integer.valueOf(id));
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		return null;
	}

	
	public List<Hotel> search(String keyword) {
		String select = "FROM Hotel where city.name =:str";
		Query query = sessionFactory.getCurrentSession().createQuery(select);
		query.setParameter("str", keyword);
		return query.getResultList();
	}

	

}
