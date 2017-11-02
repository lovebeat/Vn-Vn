package com.vn.vietnambackend.dao.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.vn.vietnambackend.dao.cityDAO;
import com.vn.vietnambackend.dto.city;

@Repository("cityDAO")
@Transactional
public class cityDAOImpl implements cityDAO {
	
	@Autowired
	private SessionFactory sessionFactory;

	public city get(int id) {
		// TODO Auto-generated method stub
		return sessionFactory.getCurrentSession().get(city.class,id);
	}

	public List<city> list() {//get list cities that are active
		String selectActiveCity = "FROM city WHERE isActive = :isActive";
		
		Query query = sessionFactory.getCurrentSession().createQuery(selectActiveCity);
		
		query.setParameter("isActive", true);
		
		return query.getResultList();
	}

	public boolean add(city c) {
		
		
		try {
			sessionFactory.getCurrentSession().persist(c);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
	}

	public boolean update(city c) {
		try {
			sessionFactory.getCurrentSession().update(c);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean delete(city c) {
		try {
			c.setActive(false);
			sessionFactory.getCurrentSession().update(c);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

}
