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

import com.vn.vietnambackend.dao.BannerDAO;
import com.vn.vietnambackend.dao.CityDAO;
import com.vn.vietnambackend.dao.FoodDAO;
import com.vn.vietnambackend.dao.HotelDAO;
import com.vn.vietnambackend.dao.PlaceDAO;
import com.vn.vietnambackend.dto.Banner;
import com.vn.vietnambackend.dto.City;
import com.vn.vietnambackend.dto.Food;
import com.vn.vietnambackend.dto.Hotel;
import com.vn.vietnambackend.dto.Place;

import vn.vn.util.BannerFileUploadUtility;
import vn.vn.util.CityFileUploadUtility;
import vn.vn.util.FoodFileUploadUtility;
import vn.vn.util.HotelFileUploadUtility;
import vn.vn.util.PlaceFileUploadUtility;
import vn.vn.validator.BannerValidator;
import vn.vn.validator.CityValidator;
import vn.vn.validator.FoodValidator;
import vn.vn.validator.HotelValidator;
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
	
	@Autowired
	private HotelDAO HotelDAO;
	
	@Autowired
	private BannerDAO BannerDAO;
	
	// city
	@RequestMapping(value = "/cities", method = RequestMethod.GET)
	public ModelAndView showManageCities(@RequestParam(name = "operation", required = false) String operation) {
		ModelAndView mv = new ModelAndView("manageIndex");
		mv.addObject("userClickManageCities", true);
		mv.addObject("title", "tỉnh/t. phố");
		City nCity = new City();
		nCity.setActive(true);
		mv.addObject("city", nCity);

		if (operation != null) {
			if (operation.equals("city")) {
				mv.addObject("message", "Submitted Successfully !");
			}
		}

		return mv;
	}

	// handling city submission
	@RequestMapping(value = "/cities", method = RequestMethod.POST)
	public String handleCitySubmission(@Valid @ModelAttribute("city") City mCity, BindingResult results, Model model,
			HttpServletRequest request) {

		if (mCity.getId() == 0) {
			new CityValidator().validate(mCity, results);
		} else {
			if (!mCity.getFile().getOriginalFilename().equals("")) {
				new CityValidator().validate(mCity, results);
			}
		}

		// check if there are any errors
		if (results.hasErrors()) {

			model.addAttribute("userClickManageCities", true);
			model.addAttribute("title", "tỉnh/t. phố");
			model.addAttribute("message", "Validation failed for city Submission!");
			return "manageIndex";
		}

		// create new city record
		if (mCity.getId() == 0) {
			CityDAO.add(mCity);
		} else {
			CityDAO.update(mCity);
		}

		if (!mCity.getFile().getOriginalFilename().equals("")) {
			CityFileUploadUtility.uploadFile(request, mCity.getFile(), mCity.getCode(), mCity.getName());
		}

		return "redirect:/manage/cities?operation=city";
	}

	// activation city
	@RequestMapping(value = "/city/{id}/activation", method = RequestMethod.GET)
	@ResponseBody
	public String handleCityActivation(@PathVariable int id) {

		City city = CityDAO.get(id);
		boolean isActive = city.isActive();
		city.setActive(!city.isActive());
		CityDAO.update(city);
		return (isActive) ? "You are successfully de-cativevated the city with id " + city.getId()
				: "You are successfully ativevated the city with id " + city.getId();
	}

	// edit city
	@RequestMapping(value = "/{id}/city", method = RequestMethod.GET)
	public ModelAndView showEditCity(@PathVariable int id) {
		ModelAndView mv = new ModelAndView("manageIndex");
		mv.addObject("userClickManageCities", true);
		mv.addObject("title", "tỉnh/t. phố");
		// fetch the city from the database
		City nCity = CityDAO.get(id);
		// set the city fetch from database
		mv.addObject("city", nCity);
		return mv;
	}

	// place
	@RequestMapping(value = "/places", method = RequestMethod.GET)
	public ModelAndView showManagePlaces(@RequestParam(name = "operation", required = false) String operation) {
		ModelAndView mv = new ModelAndView("manageIndex");
		mv.addObject("userClickManagePlaces", true);
		mv.addObject("title", "địa điểm");
		Place nPlace = new Place();
		nPlace.setActive(true);
		mv.addObject("place", nPlace);

		if (operation != null) {
			if (operation.equals("place")) {
				mv.addObject("message", "Submitted Successfully !");
			} else if (operation.equals("city")) {
				mv.addObject("message", "City submitted successfully!");
			}
		}
		return mv;
	}

	// handling place submission
	@RequestMapping(value = "/places", method = RequestMethod.POST)
	public String handlePlaceSubmission(@Valid @ModelAttribute("place") Place mPlace, BindingResult results,
			Model model, HttpServletRequest request) {

		if (mPlace.getId() == 0) {
			new PlaceValidator().validate(mPlace, results);
		} else {
			if (!mPlace.getFile().getOriginalFilename().equals("")) {
				new PlaceValidator().validate(mPlace, results);
			}
		}
		// check if there are any errors
		if (results.hasErrors()) {

			model.addAttribute("userClickManagePlaces", true);
			model.addAttribute("title", "địa điểm");
			model.addAttribute("message", "Validation failed for city Submission!");
			return "manageIndex";
		}

		mPlace.setCity(new City(Integer.parseInt(mPlace.getCt())));

		// create new place record
		if (mPlace.getId() == 0) {
			PlaceDAO.add(mPlace);
		} else {
			PlaceDAO.update(mPlace);
		}

		if (!mPlace.getFile().getOriginalFilename().equals("")) {
			PlaceFileUploadUtility.uploadFile(request, mPlace.getFile(), mPlace.getCode(),
					CityDAO.getCityById(mPlace.getCt()).getName(), mPlace.getName());
		}

		return "redirect:/manage/places?operation=place";
	}

	// activation place
	@RequestMapping(value = "/place/{id}/activation", method = RequestMethod.GET)
	@ResponseBody
	public String handlePlaceActivation(@PathVariable int id) {

		Place place = PlaceDAO.get(id);
		boolean isActive = place.isActive();
		place.setActive(!place.isActive());
		PlaceDAO.update(place);
		return (isActive) ? "You are successfully decativevated the place with id " + place.getId()
				: "You are successfully ativevated the place with id " + place.getId();
	}

	// edit place
	@RequestMapping(value = "/{id}/place", method = RequestMethod.GET)
	public ModelAndView showEditPlace(@PathVariable int id) {
		ModelAndView mv = new ModelAndView("manageIndex");
		mv.addObject("userClickManagePlaces", true);
		mv.addObject("title", "địa điểm");
		// fetch the place from the database
		Place nPlace = PlaceDAO.get(id);

		/* nPlace.setCity(new City(Integer.parseInt(nPlace.getCt()))); */
		// set the place fetch from database
		mv.addObject("place", nPlace);

		/* mv.addObject("city", CityDAO.getCityById(nPlace.getCt()).getName()); */
		return mv;
	}

	// food
	@RequestMapping(value = "/foods", method = RequestMethod.GET)
	public ModelAndView showManageFoods(@RequestParam(name = "operation", required = false) String operation) {
		ModelAndView mv = new ModelAndView("manageIndex");
		mv.addObject("userClickManageFoods", true);
		mv.addObject("title", "Ẩm thực");
		Food nFood = new Food();
		nFood.setActive(true);
		mv.addObject("food", nFood);
		if (operation != null) {
			if (operation.equals("food")) {
				mv.addObject("message", "Submitted Successfully !");
			} else if (operation.equals("city")) {
				mv.addObject("message", "City submitted successfully!");
			}
		}
		return mv;
	}

	// handling food submission
	@RequestMapping(value = "/foods", method = RequestMethod.POST)
	public String handleFoodSubmission(@Valid @ModelAttribute("food") Food mFood, BindingResult results, Model model,
			HttpServletRequest request) {

		if (mFood.getId() == 0) {
			new FoodValidator().validate(mFood, results);
		} else {
			if (!mFood.getFile().getOriginalFilename().equals("")) {
				new FoodValidator().validate(mFood, results);
			}
		}

		// check if there are any errors
		if (results.hasErrors()) {

			model.addAttribute("userClickManageFoods", true);
			model.addAttribute("title", "Ẩm thực");
			model.addAttribute("message", "Validation failed for food Submission!");
			return "manageIndex";
		}

		mFood.setCity(new City(Integer.parseInt(mFood.getCt())));
		/*mFood.setPlace(new Place(Integer.parseInt(mFood.getPl())));*/
		// create new city record
		if (mFood.getId() == 0) {
			FoodDAO.add(mFood);
		} else {
			FoodDAO.update(mFood);
		}

		if (!mFood.getFile().getOriginalFilename().equals("")) {
			FoodFileUploadUtility.uploadFile(request, mFood.getFile(), mFood.getCode(),
					CityDAO.getCityById(mFood.getCt()).getName(),
					mFood.getName());
		}

		return "redirect:/manage/foods?operation=food";
	}

	// activation food
	@RequestMapping(value = "/food/{id}/activation", method = RequestMethod.GET)
	@ResponseBody
	public String handleFoodActivation(@PathVariable int id) {

		Food food = FoodDAO.get(id);
		boolean isActive = food.isActive();
		food.setActive(!food.isActive());
		FoodDAO.update(food);
		return (isActive) ? "You are successfully decativevated the food with id " + food.getId()
				: "You are successfully ativevated the food with id " + food.getId();
	}

	// edit food
	@RequestMapping(value = "/{id}/food", method = RequestMethod.GET)
	public ModelAndView showEditFood(@PathVariable int id) {
		ModelAndView mv = new ModelAndView("manageIndex");
		mv.addObject("userClickManageFoods", true);
		mv.addObject("title", "Ẩm thực");
		// fetch the food from the database
		Food nFood = FoodDAO.get(id);
		// set the food fetch from database
		mv.addObject("food", nFood);
		return mv;
	}

	// handling city dialog in place and food submission
	@RequestMapping(value = "/city", method = RequestMethod.POST)
	public String handleCityInPlaceSubmission(@Valid @ModelAttribute("city") City mCity, BindingResult results,
			Model model, HttpServletRequest request) {

		if (mCity.getId() == 0) {
			new CityValidator().validate(mCity, results);
		} else {
			if (!mCity.getFile().getOriginalFilename().equals("")) {
				new CityValidator().validate(mCity, results);
			}
		}

		// check if there are any errors
		if (results.hasErrors()) {

			model.addAttribute("userClickManageCities", true);
			model.addAttribute("title", "tỉnh/t. phố");
			model.addAttribute("message", "Validation failed for city Submission!");
			return "manageIndex";
		}

		// create new city record
		if (mCity.getId() == 0) {
			CityDAO.add(mCity);
		} else {
			CityDAO.update(mCity);
		}

		if (!mCity.getFile().getOriginalFilename().equals("")) {
			CityFileUploadUtility.uploadFile(request, mCity.getFile(), mCity.getCode(), mCity.getName());
		}
		return "redirect:" + request.getHeader("Referer") + "?operation=city";
		/* return "redirect:/manage/places?operation=city"; */
	}

	// handling place dialog in food submission
	/*@RequestMapping(value = "/place", method = RequestMethod.POST)
	public String handlePlaceInFoodSubmission(@Valid @ModelAttribute("place") Place mPlace, BindingResult results,
			Model model, HttpServletRequest request) {

		if (mPlace.getId() == 0) {
			new PlaceValidator().validate(mPlace, results);
		} else {
			if (!mPlace.getFile().getOriginalFilename().equals("")) {
				new PlaceValidator().validate(mPlace, results);
			}
		}

		// check if there are any errors
		if (results.hasErrors()) {

			model.addAttribute("userClickManagePlaces", true);
			model.addAttribute("title", "Manage Places");
			model.addAttribute("message", "Validation failed for place Submission!");
			return "manageIndex";
		}
		mPlace.setCity(new City(Integer.parseInt(mPlace.getCt())));

		// create new city record
		if (mPlace.getId() == 0) {
			PlaceDAO.add(mPlace);
		} else {
			PlaceDAO.update(mPlace);
		}

		if (!mPlace.getFile().getOriginalFilename().equals("")) {
			PlaceFileUploadUtility.uploadFile(request, mPlace.getFile(), mPlace.getCode(),
					CityDAO.getCityById(mPlace.getCt()).getName(), mPlace.getName());
		}
		return "redirect:" + request.getHeader("Referer") + "?operation=place";
		 return "redirect:/manage/places?operation=city"; 
	}*/

	// return cities for all the request mapping
	@ModelAttribute("cities")
	public List<City> getCities() {

		return CityDAO.list();
	}

	// return places for all the request mapping
	@ModelAttribute("places")
	public List<Place> getPlaces() {
		return PlaceDAO.list();
	}

	@ModelAttribute("city")
	public City getCity() {
		return new City();
	}

	@ModelAttribute("place")
	public Place getPlace() {
		return new Place();
	}
	
	//////////
	@RequestMapping(value = "/listHotelApprove")
	public ModelAndView approveProvider() {
		ModelAndView mv = new ModelAndView("manageIndex");
		mv.addObject("userClickListHotelApprove", true);
		mv.addObject("title", "Home Stay");

		return mv;
	}
	
	
	//
	@RequestMapping(value = "/approveProvider", method = RequestMethod.POST)
	public String handleHotelSubmission( @ModelAttribute("hotel") Hotel mHotel) {

		mHotel.setApprove(true);
		HotelDAO.update(mHotel);
		return "redirect:/manage/listHotelApprove";
	}
	
	// detail hotel and approve
	@RequestMapping(value = "/{id}/approveHotel", method = RequestMethod.GET)
	public ModelAndView approveHotel(@PathVariable int id) {
		ModelAndView mv = new ModelAndView("manageIndex");
		mv.addObject("userClickViewAndApprove", true);
		mv.addObject("title", "Xem và duyệt");
		// fetch the city from the database
		Hotel nHotel = HotelDAO.get(id);
		// set the city fetch from database
		mv.addObject("hotel", nHotel);
		return mv;
		
	}
	
	//banner
		@RequestMapping(value = "/banner", method = RequestMethod.GET)
		public ModelAndView showManageBanner(@RequestParam(name = "operation", required = false) String operation) {
			ModelAndView mv = new ModelAndView("manageIndex");
			mv.addObject("userClickManageBanner", true);
			mv.addObject("title", "banner");
			Banner nBanner = new Banner();
			nBanner.setActive(true);
			mv.addObject("banner", nBanner);

			if (operation != null) {
				if (operation.equals("banner")) {
					mv.addObject("message", "Submitted Successfully !");
				}
			}

			return mv;
		}
		
		// handling banner submission
		@RequestMapping(value = "/banner", method = RequestMethod.POST)
		public String handleBannerSubmission(@Valid @ModelAttribute("banner") Banner mBanner, BindingResult results, Model model,
				HttpServletRequest request) {

			if (mBanner.getId() == 0) {
				new BannerValidator().validate(mBanner, results);
			} else {
				if(!mBanner.getFile().getOriginalFilename().equals("")) {
					new BannerValidator().validate(mBanner, results);
				}
			}

			// check if there are any errors
			if (results.hasErrors()) {

				model.addAttribute("userClickManageBanner", true);
				model.addAttribute("title", "banner");
				model.addAttribute("message", "Validation failed for banner Submission!");
				return "manageIndex";
			}

			// create new city record
			if (mBanner.getId() == 0) {
				BannerDAO.add(mBanner);
			} else {
				BannerDAO.update(mBanner);
			}

			if (!mBanner.getFile().getOriginalFilename().equals("")) {
				BannerFileUploadUtility.uploadFile(request, mBanner.getFile(), mBanner.getCode());
			}

			return "redirect:/manage/banner?operation=banner";
		}
		// activation banner
		
		@RequestMapping(value = "/banner/{id}/activation", method = RequestMethod.GET)
		@ResponseBody
		public String handleBannerActivation(@PathVariable int id) {

			Banner banner = BannerDAO.get(id);
			boolean isActive = banner.isActive();
			banner.setActive(!banner.isActive());
			BannerDAO.update(banner);
			return (isActive) ? "You are successfully decativevated the banner with id " + banner.getId()
					: "You are successfully ativevated the banner with id " + banner.getId();
		}
	

}
