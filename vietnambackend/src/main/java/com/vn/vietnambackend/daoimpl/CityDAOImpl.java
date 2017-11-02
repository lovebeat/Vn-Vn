package com.vn.vietnambackend.daoimpl;

import java.util.List;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.vn.vietnambackend.dao.CityDAO;
import com.vn.vietnambackend.dto.City;

@Repository("CityDAO")
@Transactional
public class CityDAOImpl implements CityDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	/*
	 * Single
	 */
	public City get(int cityId) {
		try {
			return sessionFactory.getCurrentSession().get(City.class, Integer.valueOf(cityId));
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		return null;
	}
	
	/*
	 * List
	 */
	public List<City> list(){
		return sessionFactory.getCurrentSession().createQuery("FROM City", City.class).getResultList();
	}
	
	/*
	 * Insert
	 * 
	 */
	public boolean add(City city) {
		try {
			sessionFactory.getCurrentSession().persist(city);
			return true;
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		return false;
	}
	
	/*
	 * Update
	 */
	public boolean update(City city) {
		try {
			sessionFactory.getCurrentSession().update(city);
			return true;
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		return false;
	}
	
	/*
	 * delete
	 */
	public boolean delete(City city) {
		try {
			city.setActive(false);
			//call the update method
			return this.update(city);
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		return false;
	}
	/*
	 * List Active
	 */
	public List<City> listActiveCity() {
		String selectActiveCity = "FROM City WHERE active =:active";
		Query query = sessionFactory.getCurrentSession().createQuery(selectActiveCity);
		query.setParameter("active", true);
		
		return query.getResultList();
	}
	

}
