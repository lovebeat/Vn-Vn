package vn.vn.controller;

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
import org.springframework.web.servlet.ModelAndView;

import com.vn.vietnambackend.dao.CityDAO;
import com.vn.vietnambackend.dao.ContactDAO;
import com.vn.vietnambackend.dao.FoodDAO;
import com.vn.vietnambackend.dao.HotelDAO;
import com.vn.vietnambackend.dao.PlaceDAO;
import com.vn.vietnambackend.dto.City;
import com.vn.vietnambackend.dto.Contact;
import com.vn.vietnambackend.dto.Food;
import com.vn.vietnambackend.dto.Hotel;
import com.vn.vietnambackend.dto.Place;

import vn.vn.util.HotelFileUploadUtility;
import vn.vn.validator.HotelValidator;




@Controller
public class pageController {
	
	@Autowired
	private CityDAO cityDAO;
	@Autowired
	private FoodDAO foodDAO;
	@Autowired
	private PlaceDAO placeDAO;
	@Autowired
	private ContactDAO contactDAO;
	
	@Autowired
	private HotelDAO HotelDAO;
	
	@RequestMapping(value = { "/", "/index", "/home" })
	public ModelAndView homePage(/*@RequestParam(name = "operation", required = false) String operation*/) {
		
		ModelAndView mv = new ModelAndView("index");
		
		mv.addObject("title","Home");
		
		mv.addObject("userClickHome",true);
		
		mv.addObject("listCity",cityDAO.list());//pass list city 
		
		mv.addObject("listFoods", foodDAO.list());
		
		mv.addObject("listPlace", placeDAO.listLimit());
		
		/*if (operation != null) {
			if (operation.equals("contact")) {
				mv.addObject("message", "Submitted Successfully !");
			}
		}*/
		
		return mv;
	
	}
	
/*
	// handling contact submission
	@RequestMapping(value = "/", method = RequestMethod.POST)
	public String handleContactSubmission(@Valid @ModelAttribute("contact") Contact mContact, BindingResult results, Model model,
			HttpServletRequest request) {

		
		// check if there are any errors
		if (results.hasErrors()) {

			model.addAttribute("userClickHome", true);
			model.addAttribute("title", "Home");
			model.addAttribute("message", "Validation failed for submission!");
			return "index";
		}

		// create new contact record
			contactDAO.add(mContact);

		return "redirect:/home?operation=contact";
	}*/
	
	
	// detail food page
	@RequestMapping(value="/food/{id}")
	public ModelAndView showDetailFood(@PathVariable int id){
		ModelAndView mv= new ModelAndView("index");
		Food food = foodDAO.get(id);
		mv.addObject("title", food.getName());
		mv.addObject("food",food);
		City city = cityDAO.getCityById(String.valueOf(food.getCity().getId()));
		mv.addObject("listFood",foodDAO.listFoodById(city.getId()));
		mv.addObject("userClickDetailFood", true);
		return mv;
	}
	

	// detail place page
	@RequestMapping(value="/place/{id}")
	public ModelAndView showDetailPlace(@PathVariable int id){
		ModelAndView mv= new ModelAndView("index");
		Place place = placeDAO.get(id);
		mv.addObject("title", place.getName());
		mv.addObject("place",place);
		City city = cityDAO.getCityById(String.valueOf(place.getCity().getId()));
		mv.addObject("listPlace",placeDAO.listPlaceByIds(city.getId()));
		mv.addObject("userClickDetailPlace", true);
		return mv;
	}
	
	// detail city page
		@RequestMapping(value="/city/{id}")
		public ModelAndView showDetailCity(@PathVariable int id){
			ModelAndView mv= new ModelAndView("index");
			City city = cityDAO.get(id);
			mv.addObject("title", city.getName());
			mv.addObject("city",city);
			mv.addObject("listPlace",placeDAO.listPlaceById(id));
			mv.addObject("listFood",foodDAO.listFoodById(id));
			mv.addObject("userClickDetailCity", true);
			return mv;
		}
	
	//Link to mangage side
	@RequestMapping(value="/manage")
	public ModelAndView managePage() {
		ModelAndView mv = new ModelAndView("manageIndex");
		mv.addObject("title","Management Page");
		mv.addObject("userClickManagement",true);
		return mv;
	}

	
		
		
		
	
	// link to provider side
	@RequestMapping(value = "/provider")
	public ModelAndView providerPage() {
		ModelAndView mv = new ModelAndView("providerIndex");
		mv.addObject("title", "Provider Page");
		mv.addObject("userClickProvider", true);
		return mv;
	}
	
	//login
	@RequestMapping(value = "/login")
	public ModelAndView login(@RequestParam(name="error", required=false)String error) {
		ModelAndView mv = new ModelAndView("login");
		if(error!=null) {
			mv.addObject("message","Invalid username and password");
		}
		mv.addObject("title", "Login");
		return mv;
	}
	


	//Access denied
	@RequestMapping(value = "/access-denied")
	public ModelAndView accessDenied() {
		ModelAndView mv = new ModelAndView("error");
		mv.addObject("title", "403 - Access denied");
		mv.addObject("errorTitle", "Aha! Caught you");
		mv.addObject("errorDescription", "You are not authrized to view this page");
		return mv;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
