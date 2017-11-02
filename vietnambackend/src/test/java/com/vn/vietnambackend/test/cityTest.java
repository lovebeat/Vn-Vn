package com.vn.vietnambackend.test;

import static org.junit.Assert.assertEquals;

import org.hibernate.annotations.SelectBeforeUpdate;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.vn.vietnambackend.dao.cityDAO;
import com.vn.vietnambackend.dto.city;

public class cityTest {

	private static cityDAO cityDAO;
	private static AnnotationConfigApplicationContext context;
	private city c;
	
	@BeforeClass
	public static void init() {
		context = new AnnotationConfigApplicationContext();
		context.scan("com.vn.vietnambackend");
		context.refresh();
		cityDAO = (cityDAO)context.getBean("cityDAO");
	}
	
//	
	@Test
	public void addCityTest() {
		
		c = new city();
		c.setName("Mai Chau");
		c.setDescription("Thanh pho dong duc");
		c.setContent("Sai gon lac nhau ");
		assertEquals("Add new city test", true, cityDAO.add(c));
		
		c = new city();
		c.setName("Con Dao");
		c.setDescription("Thanh pho dong duc");
		c.setContent("Sai gon lac nhau ");
		assertEquals("Add new city test", true, cityDAO.add(c));
		
		c = new city();
		c.setName("Ha Long");
		c.setDescription("Thanh pho dong duc");
		c.setContent("Sai gon lac nhau ");
		assertEquals("Add new city test", true, cityDAO.add(c));
		
		c = new city();
		c.setName("Ha Noi");
		c.setDescription("Thanh pho dong duc");
		c.setContent("Sai gon lac nhau ");
		assertEquals("Add new city test", true, cityDAO.add(c));
		
		c = new city();
		c.setName("Hoi An");
		c.setDescription("Thanh pho dong duc");
		c.setContent("Sai gon lac nhau ");
		assertEquals("Add new city test", true, cityDAO.add(c));
		
		c = new city();
		c.setName("Hue");
		c.setDescription("Thanh pho dong duc");
		c.setContent("Sai gon lac nhau ");
		assertEquals("Add new city test", true, cityDAO.add(c));
		
		c = new city();
		c.setName("Mui Ne");
		c.setDescription("Thanh pho dong duc");
		c.setContent("Sai gon lac nhau ");
		assertEquals("Add new city test", true, cityDAO.add(c));
		
		c = new city();
		c.setName("Sapa");
		c.setDescription("Thanh pho dong duc");
		c.setContent("Sai gon lac nhau ");
		assertEquals("Add new city test", true, cityDAO.add(c));
		
		c = new city();
		c.setName("Vung Tau");
		c.setDescription("Thanh pho bien");
		c.setContent("Sai gon lac nhau ");
		assertEquals("Add new city test", true, cityDAO.add(c));
		
	}
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
}
