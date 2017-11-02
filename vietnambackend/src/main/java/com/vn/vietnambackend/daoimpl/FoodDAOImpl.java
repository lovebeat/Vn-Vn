package com.vn.vietnambackend.daoimpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.vn.vietnambackend.dao.FoodDAO;
import com.vn.vietnambackend.dto.Food;
import com.vn.vietnambackend.dto.Place;


@Repository("FoodDAO")
@Transactional
public class FoodDAOImpl implements FoodDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	public List<Food> list() {
		return sessionFactory.getCurrentSession().createQuery("FROM Food", Food.class).getResultList();
	}

	public Food get(int foodId) {
		try {
			return sessionFactory.getCurrentSession().get(Food.class, Integer.valueOf(foodId));
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		return null;
	}

	public boolean add(Food food) {
		try {
			sessionFactory.getCurrentSession().persist(food);
			return true;
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		return false;
	}

	public boolean update(Food food) {
		try {
			sessionFactory.getCurrentSession().update(food);
			return true;
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		return false;
	}

	public boolean delete(Food food) {
		try {
			food.setActive(false);
			//call the update method
			return this.update(food);
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		return false;
	}

	public List<Food> listActiveFood() {
		String selectActiveFood = "FROM Food WHERE active =:active";
		Query query = sessionFactory.getCurrentSession().createQuery(selectActiveFood);
		query.setParameter("active", true);
		
		return query.getResultList();
	}

}
