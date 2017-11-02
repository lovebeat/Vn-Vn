package vn.vn.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.vn.vietnambackend.dao.CityDAO;
import com.vn.vietnambackend.dao.FoodDAO;
import com.vn.vietnambackend.dao.PlaceDAO;
import com.vn.vietnambackend.dto.City;
import com.vn.vietnambackend.dto.Food;
import com.vn.vietnambackend.dto.Place;

import vn.vn.util.FileUploadUtility;
import vn.vn.validator.CityValidator;
import vn.vn.validator.FoodValidator;
import vn.vn.validator.PlaceValidator;



@Controller
@RequestMapping("/manage")
public class managementController {
	

	@Autowired
	private CityDAO CityDAO;
	@Autowired
	private PlaceDAO PlaceDAO;
	@Autowired
	private FoodDAO FoodDAO;
	
	@RequestMapping(value="/cities")
	public ModelAndView showManageCities(@RequestParam(name="operation", required=false) String operation) {
		ModelAndView mv = new ModelAndView("manageIndex");
		mv.addObject("userClickManageCities", true);
		mv.addObject("title","Manage Cites");
		City nCity = new City();
		nCity.setActive(true);
		mv.addObject("city",nCity);
		
		if(operation != null) {
			if(operation.equals("city")) {
				mv.addObject("message","Submitted Successfully !");
			}
		}
		
		return mv;
	}
	
	@RequestMapping(value="/places")
	public ModelAndView showManagePlaces(@RequestParam(name="operation", required=false) String operation) {
		ModelAndView mv = new ModelAndView("manageIndex");
		mv.addObject("userClickManagePlaces", true);
		mv.addObject("title","Manage Places");
		Place nPlace = new Place();
		nPlace.setActive(true);
		mv.addObject("place",nPlace);
		
		if(operation != null) {
			if(operation.equals("place")) {
				mv.addObject("message","Submitted Successfully !");
			}
		}
		return mv;
	}
	
	@RequestMapping(value="/foods")
	public ModelAndView showManageFoods(@RequestParam(name="operation", required=false) String operation) {
		ModelAndView mv = new ModelAndView("manageIndex");
		mv.addObject("userClickManageFoods", true);
		mv.addObject("title","Manage Foods");
		Food nFood = new Food();
		nFood.setActive(true);
		mv.addObject("food",nFood);
		if(operation != null) {
			if(operation.equals("food")) {
				mv.addObject("message","Submitted Successfully !");
			}
		}
		return mv;
	}
	
		//handling city submission
		@RequestMapping(value="/cities", method=RequestMethod.POST)
		public String handleCitySubmission( @Valid @ModelAttribute("city") City mCity, BindingResult results, Model model, HttpServletRequest request) {
			
			
			if(mCity.getId()== 0) {
				new CityValidator().validate(mCity, results);
			}
			else {
				if(!mCity.getFile().getOriginalFilename().equals("")) {
					new CityValidator().validate(mCity, results);
				}
			}
			
			//check if there are any errors
			if(results.hasErrors()) {
				
				model.addAttribute("userClickManageCities",true);
				model.addAttribute("title","Manage Cities");
				model.addAttribute("message","Validation failed for city Submission!");
				return "manageIndex";
			}
			
			
			//create new city record
			if(mCity.getId()==0) {
				CityDAO.add(mCity);
			}
			else {
				CityDAO.update(mCity);
			}
			
			if(!mCity.getFile().getOriginalFilename().equals("")) {
				FileUploadUtility.uploadFile(request, mCity.getFile(), mCity.getCode());
			}
			
			return "redirect:/manage/cities?operation=city";
		}
		
		
		//handling place submission
		@RequestMapping(value="/places", method=RequestMethod.POST)
		public String handlePlaceSubmission( @Valid @ModelAttribute("place") Place mPlace, BindingResult results, Model model, HttpServletRequest request) {
			
			if(mPlace.getId()== 0) {
				new PlaceValidator().validate(mPlace, results);
			}
			else {
				if(!mPlace.getFile().getOriginalFilename().equals("")) {
					new PlaceValidator().validate(mPlace, results);
				}
			}
			//check if there are any errors
			if(results.hasErrors()) {
				
				model.addAttribute("userClickManagePlaces",true);
				model.addAttribute("title","Manage Places");
				model.addAttribute("message","Validation failed for city Submission!");
				return "manageIndex";
			}
			
			
			//create new place record
			if(mPlace.getId()==0) {
				PlaceDAO.add(mPlace);
			}
			else {
				PlaceDAO.update(mPlace);
			}
			
			if(!mPlace.getFile().getOriginalFilename().equals("")) {
				FileUploadUtility.uploadFile(request, mPlace.getFile(), mPlace.getCode());
			}
			
			return "redirect:/manage/places?operation=place";
		}
		
		//handling food submission
				@RequestMapping(value="/foods", method=RequestMethod.POST)
				public String handleFoodSubmission( @Valid @ModelAttribute("food") Food mFood, BindingResult results, Model model, HttpServletRequest request) {
					
					
					if(mFood.getId()== 0) {
						new FoodValidator().validate(mFood, results);
					}
					else {
						if(!mFood.getFile().getOriginalFilename().equals("")) {
							new FoodValidator().validate(mFood, results);
						}
					}
					
					//check if there are any errors
					if(results.hasErrors()) {
						
						model.addAttribute("userClickManageFoods",true);
						model.addAttribute("title","Manage Foods");
						model.addAttribute("message","Validation failed for food Submission!");
						return "manageIndex";
					}
					
					
					//create new city record
					if(mFood.getId()==0) {
						FoodDAO.add(mFood);
					}
					else {
						FoodDAO.update(mFood);
					}
					
					if(!mFood.getFile().getOriginalFilename().equals("")) {
						FileUploadUtility.uploadFile(request, mFood.getFile(), mFood.getCode());
					}
					
					return "redirect:/manage/foods?operation=food";
				}
		
		
		//activation city
		@RequestMapping(value="/city/{id}/activation", method=RequestMethod.GET)
		@ResponseBody
		public String handleCityActivation(@PathVariable int id) {
			
			City city = CityDAO.get(id);
			boolean isActive = city.isActive();
			city.setActive(!city.isActive());
			CityDAO.update(city);
			return (isActive)? "You are successfully decativevated the city with id" + city.getId()
			: "You are successfully ativevated the city with id" + city.getId();
		}
		
		//activation place
		@RequestMapping(value="/place/{id}/activation", method=RequestMethod.GET)
		@ResponseBody
		public String handlePlaceActivation(@PathVariable int id) {
			
			Place place = PlaceDAO.get(id);
			boolean isActive = place.isActive();
			place.setActive(!place.isActive());
			PlaceDAO.update(place);
			return (isActive)? "You are successfully decativevated the place with id" + place.getId()
			: "You are successfully ativevated the place with id" + place.getId();
		}
		
		//activation food
		@RequestMapping(value="/food/{id}/activation", method=RequestMethod.GET)
		@ResponseBody
		public String handleFoodActivation(@PathVariable int id) {
			
			Food food = FoodDAO.get(id);
			boolean isActive = food.isActive();
			food.setActive(!food.isActive());
			FoodDAO.update(food);
			return (isActive)? "You are successfully decativevated the food with id" + food.getId()
			: "You are successfully ativevated the food with id" + food.getId();
		}
		
		//edit city
		@RequestMapping(value="/{id}/city", method=RequestMethod.GET)
		public ModelAndView showEditCity(@PathVariable int id){
			ModelAndView mv = new ModelAndView("manageIndex");
			mv.addObject("userClickManageCities",true);
			mv.addObject("title","Manage Cities");
			//fetch the city from the database
			City nCity = CityDAO.get(id);
			//set the city fetch from database
			mv.addObject("city", nCity);
			return mv;
		}
		
		//edit place
		@RequestMapping(value="/{id}/place", method=RequestMethod.GET)
		public ModelAndView showEditPlace(@PathVariable int id){
			ModelAndView mv = new ModelAndView("manageIndex");
			mv.addObject("userClickManagePlaces",true);
			mv.addObject("title","Manage Places");
			//fetch the place from the database
			Place nPlace = PlaceDAO.get(id);
			//set the place fetch from database
			mv.addObject("place", nPlace);
			return mv;
		}
		
		//edit food
				@RequestMapping(value="/{id}/food", method=RequestMethod.GET)
				public ModelAndView showEditFood(@PathVariable int id){
					ModelAndView mv = new ModelAndView("manageIndex");
					mv.addObject("userClickManageFoods",true);
					mv.addObject("title","Manage Foods");
					//fetch the food from the database
					Food nFood = FoodDAO.get(id);
					//set the food fetch from database
					mv.addObject("food", nFood);
					return mv;
				}
		
		//return cities for all the request mapping
		@ModelAttribute("cities")
		public List<City> getCities(){
			
			return CityDAO.list();
		}
		
		//return cities for all the request mapping
		@ModelAttribute("places")
		public List<Place> getPlaces(){
			return PlaceDAO.list();
		}
		
		
}
