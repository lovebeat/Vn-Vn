package com.vn.vietnambackend.daoimpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.vn.vietnambackend.dao.BannerDAO;
import com.vn.vietnambackend.dto.Banner;

@Repository("BannerDAO")
@Transactional
public class BannerDAOImpl implements BannerDAO {

	@Autowired
	private SessionFactory sessionFactory;
	public List<Banner> list() {
		return sessionFactory.getCurrentSession().createQuery("FROM Banner", Banner.class).getResultList();
	}

	public Banner get(int bannerId) {
		try {
			return sessionFactory.getCurrentSession().get(Banner.class, Integer.valueOf(bannerId));
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		return null;
	}

	public boolean add(Banner banner) {
		try {
			sessionFactory.getCurrentSession().persist(banner);
			return true;
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		return false;
		
	}
	
	public boolean update(Banner banner) {
		try {
			sessionFactory.getCurrentSession().update(banner);
			return true;
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		return false;
	}
	
	public boolean delete(Banner banner) {
		try {
			banner.setActive(false);
			//call the update method
			return this.update(banner);
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		return false;
	}

	public List<Banner> listActive() {
		String selectActive = "FROM Banner WHERE active =:active";
		Query query = sessionFactory.getCurrentSession().createQuery(selectActive);
		query.setParameter("active", true);
		
		return query.getResultList();
	}

}
