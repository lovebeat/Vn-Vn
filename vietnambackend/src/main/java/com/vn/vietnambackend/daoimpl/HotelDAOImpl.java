package com.vn.vietnambackend.daoimpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.vn.vietnambackend.dao.HotelDAO;

import com.vn.vietnambackend.dto.Hotel;

@Repository("ProviderDAO")
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

	public List<Hotel> listNotApprove() {
		String selectNotApprove = "FROM Hotel WHERE approve =:approve";
		Query query = sessionFactory.getCurrentSession().createQuery(selectNotApprove);
		query.setParameter("approve", false);
		return query.getResultList();
	}

	public List<Hotel> listApprove() {
		String selectApprove = "FROM Hotel WHERE approve =:approve";
		Query query = sessionFactory.getCurrentSession().createQuery(selectApprove);
		query.setParameter("approve", true);
		return query.getResultList();
	}

}
