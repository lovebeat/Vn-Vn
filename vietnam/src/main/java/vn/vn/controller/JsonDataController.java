package vn.vn.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.vn.vietnambackend.dao.CityDAO;
import com.vn.vietnambackend.dao.FoodDAO;
import com.vn.vietnambackend.dao.PlaceDAO;
import com.vn.vietnambackend.dto.City;
import com.vn.vietnambackend.dto.Food;
import com.vn.vietnambackend.dto.Place;


@Controller
@RequestMapping("/json/data")
public class JsonDataController {
	
	@Autowired
	private CityDAO cityDAO;
	@Autowired
	private PlaceDAO placeDAO;
	@Autowired
	private FoodDAO foodDAO;
	
	@RequestMapping("/admin/all/city")
	@ResponseBody
	public List<City> getAllCitiesForAdmin(){
		return cityDAO.list();
	}
	
	@RequestMapping("/admin/all/place")
	@ResponseBody
	public List<Place> getAllPlacesForAdmin(){
		return placeDAO.list();
	}
	
	@RequestMapping("/admin/all/food")
	@ResponseBody
	public List<Food> getAllFoodsForAdmin(){
		return foodDAO.list();
	}

}
