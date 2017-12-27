package com.vn.vietnambackend.daoimpl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
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

	public List<Booking> listCount(String arr, String lea, String keyword) {
		 
		//convert string(date choose in date picker) in java.sql.Date
		SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
		Date dateArr;
		Date dateLea;
		java.sql.Date sqltDateArr = null;
		java.sql.Date sqltDateLea = null;
		try {
			dateArr = formatter.parse(arr);
			sqltDateArr= new java.sql.Date(dateArr.getTime());
			System.out.println(sqltDateArr);
			dateLea = formatter.parse(lea);
			sqltDateLea= new java.sql.Date(dateLea.getTime());
			System.out.println(sqltDateLea);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		String select = "FROM Booking WHERE dateArrive not between :sqltDateArr "
				+ "and :sqltDateLea "
				+ "AND dateLeave not between :sqltDateArr and :sqltDateLea "
				+ "AND city.name =:str ";
		Query query = sessionFactory.getCurrentSession().createQuery(select);
		
		query.setParameter("sqltDateArr", sqltDateArr);
		query.setParameter("sqltDateLea", sqltDateLea);
		query.setParameter("str", keyword);
		
		return query.getResultList();
	}

	public List<Booking> listBookedByHotel(String arr, String lea, int Idhotel) {
		SimpleDateFormat formatter = new SimpleDateFormat("MM-dd-yyyy");
		Date dateArr;
		Date dateLea;
		java.sql.Date sqltDateArr = null;
		java.sql.Date sqltDateLea = null;
		try {
			dateArr = formatter.parse(arr);
			sqltDateArr= new java.sql.Date(dateArr.getTime());
			System.out.println(sqltDateArr);
			dateLea = formatter.parse(lea);
			sqltDateLea= new java.sql.Date(dateLea.getTime());
			System.out.println(sqltDateLea);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        
		String select = "FROM Booking WHERE dateArrive between :sqltDateArr and :sqltDateLea AND hotel.id =:str "
				+ "OR dateLeave between :sqltDateArr and :sqltDateLea AND hotel.id =:str";
				
		Query query = sessionFactory.getCurrentSession().createQuery(select);
		
		query.setParameter("sqltDateArr", sqltDateArr);
		query.setParameter("sqltDateLea", sqltDateLea);
		query.setParameter("str", Idhotel);
		return query.getResultList();
	}

	public List<Booking> listRoomFull(int idHotel) {
		String select = "FROM Booking WHERE hotel.id =:idHotel AND active =:active order by id desc";
		Query query = sessionFactory.getCurrentSession().createQuery(select);
		query.setParameter("idHotel", idHotel);
		query.setParameter("active", true);
		
		return query.getResultList();
	}

	public List<Booking> listRoomEmpByDateNow() {
		/*SimpleDateFormat formatter = new SimpleDateFormat("MM-dd-yyyy");
		String dateNow = new Date().toString();
		java.sql.Date sqltDateNow = null;
		try {
			Date ds = formatter.parse(dateNow);
			sqltDateNow= new java.sql.Date(ds.getTime());
			System.out.println(sqltDateNow);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        
		String select = "FROM Booking WHERE dateArrive between :sqltDateArr "
				+ "and :sqltDateLea "
				+ "AND dateLeave between :sqltDateArr and :sqltDateLea "
				+ "AND hotel.id =:str ";
		Query query = sessionFactory.getCurrentSession().createQuery(select);
		
		query.setParameter("sqltDateArr", sqltDateArr);
		query.setParameter("sqltDateLea", sqltDateLea);
		query.setParameter("str", Idhotel);
		return query.getResultList();*/
		return null;
	}

	/*public List<Booking> listByRoom(int roomId) {
		String select = "FROM Booking WHERE roomId =:roomId";
		Query query = sessionFactory.getCurrentSession().createQuery(select);
		query.setParameter("roomId", roomId);
		return query.getResultList();
	}*/

	

}
