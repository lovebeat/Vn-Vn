package com.vn.vietnambackend.daoimpl;

import java.util.List;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.vn.vietnambackend.dao.ContactDAO;
import com.vn.vietnambackend.dto.Contact;


@Repository("ContactDAO")
@Transactional
public class ContactDAOImpl implements ContactDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	/**
	 * List
	 */
	public List<Contact> list() {
		return sessionFactory.getCurrentSession().createQuery("FROM Contact", Contact.class).getResultList();
	}
	
	/**
	 * Single
	 */
	public Contact get(int contactId) {
		try {
			return sessionFactory.getCurrentSession().get(Contact.class, Integer.valueOf(contactId));
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		return null;
	}

	/**
	 * add
	 */
	public boolean add(Contact contact) {
		try {
			sessionFactory.getCurrentSession().persist(contact);
			return true;
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		return false;
	}

}
