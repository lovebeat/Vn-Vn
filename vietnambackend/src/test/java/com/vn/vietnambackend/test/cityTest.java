package com.vn.vietnambackend.test;

import static org.junit.Assert.assertEquals;

import org.hibernate.annotations.SelectBeforeUpdate;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.vn.vietnambackend.dao.CityDAO;
import com.vn.vietnambackend.dao.HotelDAO;
import com.vn.vietnambackend.dto.City;


public class cityTest {

	private static CityDAO cityDAO;
	private static HotelDAO hotelDAO;
	private static AnnotationConfigApplicationContext context;
	private City c;
	
	@BeforeClass
	public static void init() {
		context = new AnnotationConfigApplicationContext();
		context.scan("com.vn.vietnambackend");
		context.refresh();
		hotelDAO = (HotelDAO)context.getBean("HotelDAO");
	}
	
//	
//	@Test
//	public void addCityTest() {
//		
//		c = new City();
//		c.setName("Mai Chau");
//		c.setDescription("Thanh pho dong duc");
//		c.setContent("Sai gon lac nhau ");
//		assertEquals("Add new city test", true, cityDAO.add(c));
//		
//		c = new City();
//		c.setName("Con Dao");
//		c.setDescription("Thanh pho dong duc");
//		c.setContent("Sai gon lac nhau ");
//		assertEquals("Add new city test", true, cityDAO.add(c));
//		
//		c = new City();
//		c.setName("Ha Long");
//		c.setDescription("Thanh pho dong duc");
//		c.setContent("Sai gon lac nhau ");
//		assertEquals("Add new city test", true, cityDAO.add(c));
//		
//		c = new City();
//		c.setName("Ha Noi");
//		c.setDescription("Thanh pho dong duc");
//		c.setContent("Sai gon lac nhau ");
//		assertEquals("Add new city test", true, cityDAO.add(c));
//		
//		c = new City();
//		c.setName("Hoi An");
//		c.setDescription("Thanh pho dong duc");
//		c.setContent("Sai gon lac nhau ");
//		assertEquals("Add new city test", true, cityDAO.add(c));
//		
//		c = new City();
//		c.setName("Hue");
//		c.setDescription("Thanh pho dong duc");
//		c.setContent("Sai gon lac nhau ");
//		assertEquals("Add new city test", true, cityDAO.add(c));
//		
//		c = new City();
//		c.setName("Mui Ne");
//		c.setDescription("Thanh pho dong duc");
//		c.setContent("Sai gon lac nhau ");
//		assertEquals("Add new city test", true, cityDAO.add(c));
//		
//		c = new City();
//		c.setName("Sapa");
//		c.setDescription("Thanh pho dong duc");
//		c.setContent("Sai gon lac nhau ");
//		assertEquals("Add new city test", true, cityDAO.add(c));
//		
//		c = new City();
//		c.setName("Vung Tau");
//		c.setDescription("Thanh pho bien");
//		c.setContent("Sai gon lac nhau ");
//		assertEquals("Add new city test", true, cityDAO.add(c));
//		
//	}
//	@Test
//	public void updateCityTest() {
//		c = cityDAO.get(1);
//		c.setActive(true);
//		assertEquals("Update ", true, cityDAO.update(c));
//	}
//	@Test
//	public void listCityTest() {
//		assertEquals("list city", 2, cityDAO.list().size());
//	}
//	
	@Test
	public void test() {
		assertEquals("Test", true, hotelDAO.search("Binh Dinh").size()>0);
	}
}
