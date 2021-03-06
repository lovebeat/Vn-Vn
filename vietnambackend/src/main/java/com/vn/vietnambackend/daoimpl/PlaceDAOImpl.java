package com.vn.vietnambackend.daoimpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.vn.vietnambackend.dao.PlaceDAO;
import com.vn.vietnambackend.dto.City;
import com.vn.vietnambackend.dto.Place;

@Repository("PlaceDAO")
@Transactional
public class PlaceDAOImpl implements PlaceDAO {


	@Autowired
	private SessionFactory sessionFactory;
	public List<Place> list() {
		return sessionFactory.getCurrentSession().createQuery("FROM Place", Place.class).getResultList();
	}

	public Place get(int placeId) {
		try {
			return sessionFactory.getCurrentSession().get(Place.class, Integer.valueOf(placeId));
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		return null;
	}

	public boolean add(Place place) {
		try {
			sessionFactory.getCurrentSession().persist(place);
			return true;
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		return false;
	}

	public boolean update(Place place) {
		try {
			sessionFactory.getCurrentSession().update(place);
			return true;
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		return false;
	}

	public boolean delete(Place place) {
		try {
			place.setActive(false);
			//call the update method
			return this.update(place);
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		return false;
	}

	public List<Place> listActivePlace() {
		String selectActivePlace = "FROM Place WHERE active =:active";
		Query query = sessionFactory.getCurrentSession().createQuery(selectActivePlace);
		query.setParameter("active", true);
		
		return query.getResultList();
	}

	public List<Place> listPlaceById(int id) {

		/*try {
			return sessionFactory.getCurrentSession().get(Place.class, Integer.parseInt(id));
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		return null;*/
		String selectListPlaceById = "FROM Place WHERE active =:active AND city.id =:id ";
		Query query = sessionFactory.getCurrentSession().createQuery(selectListPlaceById)/*.setFirstResult(0).setMaxResults(12)*/;
		query.setParameter("active", true);
		query.setParameter("id", id);
		return query.getResultList();
	}
	
	public List<Place> listPlaceByIds(int id) {

		String selectListPlaceById = "FROM Place WHERE active =:active AND city.id =:id ";
		Query query = sessionFactory.getCurrentSession().createQuery(selectListPlaceById);
		query.setParameter("active", true);
		query.setParameter("id", id);
		return query.getResultList();
	}

	public List<Place> listLimit() {
		String selectListLimitPlace = "FROM Place WHERE active =:active ";
		Query query = sessionFactory.getCurrentSession().createQuery(selectListLimitPlace)/*.setFirstResult(0).setMaxResults(12)*/;
		query.setParameter("active", true);
		
		return query.getResultList()/*.subList(0, 9)*/;
	}

	
	

}
