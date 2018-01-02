package vn.vn.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
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

import com.vn.vietnambackend.dao.BookingDAO;
import com.vn.vietnambackend.dao.CityDAO;
import com.vn.vietnambackend.dao.ContactDAO;
import com.vn.vietnambackend.dao.FoodDAO;
import com.vn.vietnambackend.dao.HotelDAO;
import com.vn.vietnambackend.dao.PlaceDAO;
import com.vn.vietnambackend.dao.RoomDAO;
import com.vn.vietnambackend.dto.Booking;
import com.vn.vietnambackend.dto.City;
import com.vn.vietnambackend.dto.Contact;
import com.vn.vietnambackend.dto.Food;
import com.vn.vietnambackend.dto.Hotel;
import com.vn.vietnambackend.dto.Place;
import com.vn.vietnambackend.dto.Room;

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
	@Autowired
	private CityDAO CityDAO;
	@Autowired
	private RoomDAO RoomDAO;
	@Autowired
	private BookingDAO BookingDAO;
	
	@Autowired
	private com.vn.vietnambackend.dao.BannerDAO BannerDAO;
	
	@RequestMapping(value = { "/", "/index", "/home" })
	public ModelAndView homePage(/*@RequestParam(name = "operation", required = false) String operation*/) {
		
		ModelAndView mv = new ModelAndView("index");
		
		mv.addObject("title","Home");
		
		mv.addObject("userClickHome",true);
		
		mv.addObject("listCity",cityDAO.list());//pass list city 
		
		mv.addObject("listFoods", foodDAO.list());
		
		mv.addObject("listPlace", placeDAO.listLimit());
		
		mv.addObject("listBanner",BannerDAO.listActive());
		
		/*if (operation != null) {
			if (operation.equals("contact")) {
				mv.addObject("message", "Submitted Successfully !");
			}
		}*/
		
		return mv;
	}
	

	// handling contact submission
	@ModelAttribute("contact")
	public Contact loadsEmptyModelBean(){
	   return new Contact();
	}
	@RequestMapping(value = "/contact", method = RequestMethod.POST)
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

		return "redirect:/home";
	}
	
	
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
	public ModelAndView login(@RequestParam(name="error", required=false)String error,
			@RequestParam(name="logout", required = false)String logout) {
		ModelAndView mv = new ModelAndView("login");
		if(error!=null) {
			mv.addObject("message","Invalid username and password");
		}
		if(logout!=null) {
			mv.addObject("logout","User has successfully logged out!");
		}
		mv.addObject("title", "Login");
		return mv;
	}
	
	//logout
		@RequestMapping(value = "/perform-logout")
		public String logout(HttpServletRequest request, HttpServletResponse response) {
			//first we are going to fetch the authentication
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			if(auth!=null) {
				new SecurityContextLogoutHandler().logout(request, response, auth);
			}
			
			return "redirect:/login?logout";
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
	
	

	@RequestMapping(value = "/allFood")
	public ModelAndView allFood() {
		
		ModelAndView mv = new ModelAndView("index");
		
		mv.addObject("title","All Food");
		
		mv.addObject("userAllFood",true);
		
		mv.addObject("listFoods", foodDAO.list());
		
		return mv;
	
	}
	
	
	
	
	
	
	
	
	
	//search hotel
	@RequestMapping(value = "/searchHotel", method = RequestMethod.GET)
	public ModelAndView searchHotel() {
		ModelAndView mv = new ModelAndView("index");
		mv.addObject("title", "Searching a Hotel");
		mv.addObject("userClickSearchHotel",true);
		
		return mv;
	}
	
	/*// result search hotel
	@RequestMapping(value = "/resultSearchHotel", method = RequestMethod.GET)
	public ModelAndView resultSearchHotel() {
		ModelAndView mv = new ModelAndView("index");
		mv.addObject("title", "Result Searching a Hotel");
		mv.addObject("userClickResultSearchHotel", true);

		return mv;
	}*/
	
	// detail of hotel
/*	@RequestMapping(value = "/detailHotel", method = RequestMethod.GET)
	public ModelAndView detailHotel() {
		ModelAndView mv = new ModelAndView("index");
		mv.addObject("title", "Chi tiết Home Stay");
		mv.addObject("userClickDetailHotel", true);
		
		return mv;
	}*/
	
	@RequestMapping(value="/detailHotel/{id}/{dtArr}/{dtLea}")
	public ModelAndView DetailHotel(@PathVariable int id, @PathVariable String dtArr, @PathVariable String dtLea){
		ModelAndView mv= new ModelAndView("index");
		Hotel hotel = HotelDAO.get(id);
		mv.addObject("title", "Chi tiết Home Stay ");
		mv.addObject("hotel",hotel);
		mv.addObject("userClickDetailHotel", true);
		mv.addObject("room", RoomDAO.listByHotel(id));
		mv.addObject("test",dtArr);
		mv.addObject("dateArrive",dtArr);
		mv.addObject("dateLeave",dtLea);
		/*BookingDAO.listByHotel(dtArr, dtLea, id);*/
		mv.addObject("test2",BookingDAO.listBookedByHotel(dtArr, dtLea, id));
		
		int temp = /*RoomDAO.listByHotel(id).size() - */BookingDAO.listBookedByHotel(dtArr, dtLea, id).size();
		mv.addObject("temp", temp);
		 
		/*System.out.println("Aaaaa---------------------------------"+ dtArrs);
		System.out.println("Aaaaa---------------------------------"+ BookingDAO.listByHotel(dtArrs, dtLeas, id));*/
		return mv;
	}
	
	
	@ModelAttribute("hotel")
	public Hotel loadEmptyModelBean() {
		return new Hotel();
	}
    @RequestMapping(value = "/searchHotel", method = RequestMethod.POST)
    public ModelAndView search(@RequestParam(name = "ct", required = false) String ct, @ModelAttribute("hotel") Hotel mHotel,
    							@RequestParam(name = "dateArr", required = false) String dateArr,
    							@RequestParam(name = "dateLea", required = false) String dateLea
    							) {
    	
    	ModelAndView mv = new ModelAndView("index");
    	mv.addObject("title", "Kết quả Tìm kiếm");
    	mv.addObject("userClickResultSearchHotel", true);
    	System.out.println("---------------------------------"+ ct);
    	
    	mv.addObject("listSearch", HotelDAO.search(cityDAO.getCityById(ct).getName()));
    	mv.addObject("test2", ct);
    	mv.addObject("test", cityDAO.getCityById(ct).getName());
    	mv.addObject("test5",BookingDAO.listCount(dateArr,dateLea, cityDAO.getCityById(ct).getName()));
    	mv.addObject("testdatearr", dateArr.replace('/', '-'));
    	mv.addObject("testdatelea", dateLea.replace('/', '-'));
    	
    	
    	
    	
    	mv.addObject("test4",BookingDAO.listCount(dateArr,dateLea, cityDAO.getCityById(ct).getName()));
    	
    	
    	return mv;
    }
    //this is for about us
    @RequestMapping(value = "/about", method = RequestMethod.GET)
	public ModelAndView aboutUs() {
		ModelAndView mv = new ModelAndView("index");
		mv.addObject("title", "About us!");
		mv.addObject("userClickAbout",true);
		return mv;
	}
	
    //booking page
    @RequestMapping(value="/bookingRoom/{id}/{dtArr}/{dtLea}")
	public ModelAndView bookingRoomPage(@PathVariable int id, 
			 @PathVariable String dtArr, @PathVariable String dtLea,
			@RequestParam(name = "operation", required = false) String operation){
		ModelAndView mv= new ModelAndView("index");
		mv.addObject("infRoom",RoomDAO.get(id));
		mv.addObject("dateArr", dtArr.replace('-', '/'));
		mv.addObject("dateLea", dtLea.replace('-', '/'));
		mv.addObject("dateArrs", dtArr);
		mv.addObject("dateLeas", dtLea);
		mv.addObject("userClickBookingRoom", true);
		if (operation != null) {
			if (operation.equals("booking")) {
				mv.addObject("message", "Đặt phòng thành công !");
			}
		}
		return mv;
	}
    
  //booking submit
  		@ModelAttribute("bookingRoom")
  		public Booking loadEmptyModelBeanBooking(){
  		   return new Booking();
  		}
  		@RequestMapping(value = "/bookingRoom/{id}/{dtArr}/{dtLea}", method = RequestMethod.POST)
  		public String handleBookingSubmission(@PathVariable int id, 
  				 @PathVariable String dtArr, @PathVariable String dtLea,
  				@Valid @ModelAttribute("bookingRoom") Booking mBooking, BindingResult results, Model model,
  				HttpServletRequest request) {
  			
  			SimpleDateFormat formatter = new SimpleDateFormat("MM-dd-yyyy");
  			Date datArr;
  			Date datLea;
  			java.sql.Date sqltDatArr = null;
  			java.sql.Date sqltDatLea = null;
  			try {
  				datArr = formatter.parse(dtArr);
  				sqltDatArr= new java.sql.Date(datArr.getTime());
  				System.out.println(sqltDatArr);
  				datLea = formatter.parse(dtLea);
  				sqltDatLea= new java.sql.Date(datLea.getTime());
  				System.out.println(sqltDatLea);
  			} catch (ParseException e) {
  				// TODO Auto-generated catch block
  				e.printStackTrace();
  			}
  			mBooking.setDateArrive(sqltDatArr);
  			mBooking.setDateLeave(sqltDatLea);
  			mBooking.setCity(new City(Integer.parseInt(mBooking.getCt())));
  			mBooking.setHotel(new Hotel(Integer.parseInt(mBooking.getHt())));
  			mBooking.setRoom(new Room(Integer.parseInt(mBooking.getRo())));
  			// create new record
  			if (mBooking.getId() == 0) {
  				
  				BookingDAO.add(mBooking);
  				
  			} else {
  				BookingDAO.update(mBooking);
  			}


  			return "redirect:/bookingRoom/{id}/{dtArr}/{dtLea}?operation=booking";
  		}
    
    
    
	

    @ModelAttribute("cities")
	public List<City> getCities() {

		return CityDAO.list();
	}
	
}
