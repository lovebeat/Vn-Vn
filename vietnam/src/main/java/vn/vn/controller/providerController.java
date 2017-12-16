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

import com.vn.vietnambackend.dao.BookingDAO;
import com.vn.vietnambackend.dao.CityDAO;
import com.vn.vietnambackend.dao.HotelDAO;
import com.vn.vietnambackend.dao.RoomDAO;
import com.vn.vietnambackend.dao.UserDAO;
import com.vn.vietnambackend.dto.Booking;
import com.vn.vietnambackend.dto.City;
import com.vn.vietnambackend.dto.Hotel;
import com.vn.vietnambackend.dto.Room;
import com.vn.vietnambackend.dto.User;

import vn.vn.util.HotelFileUploadUtility;
import vn.vn.validator.HotelValidator;


@Controller
@RequestMapping("/provider")

public class providerController {
	
	@Autowired
	private HotelDAO HotelDAO;
	@Autowired
	private RoomDAO RoomDAO;
	@Autowired
	private BookingDAO BookingDAO;
	@Autowired
	private CityDAO CityDAO;
	@Autowired
	private UserDAO UserDAO;
	
	@RequestMapping(value = "/new", method = RequestMethod.GET)
	public ModelAndView createNew(@RequestParam(name = "operation", required = false) String operation) {
		ModelAndView mv = new ModelAndView("providerIndex");
		mv.addObject("userClickCreateNew", true);
		mv.addObject("title", "Đăng kí Home Stay");
		Hotel nHotel = new Hotel();
		
		/*nHotel.setProviderId("1");*/
		mv.addObject("hotel", nHotel);

		if (operation != null) {
			if (operation.equals("newHotel")) {
				mv.addObject("message", "Submitted Successfully !");
			}
		}
		
		return mv;
	}

	@RequestMapping(value = "/available", method = RequestMethod.GET)
	public ModelAndView available() {
		ModelAndView mv = new ModelAndView("providerIndex");
		mv.addObject("userClickAvailable", true);
		mv.addObject("title", "Home Stay đã đăng kí");
		return mv;
	}
	
	@RequestMapping(value = "/waitApprove", method = RequestMethod.GET)
	public ModelAndView waitApprove() {
		ModelAndView mv = new ModelAndView("providerIndex");
		mv.addObject("userClickWaitApprove", true);
		mv.addObject("title", "Home Stay đợi duyệt");
		return mv;
	}
	
	// handling new hotel submission
		@RequestMapping(value = "/new", method = RequestMethod.POST)
		public String handleHotelSubmission(@Valid @ModelAttribute("hotel") Hotel mHotel, BindingResult results, Model model,
				HttpServletRequest request) {

			if (mHotel.getId() == 0) {
				new HotelValidator().validate(mHotel, results);
			} else {
				if (!mHotel.getFile().getOriginalFilename().equals("")) {
					new HotelValidator().validate(mHotel, results);
				}
			}

			// check if there are any errors
			if (results.hasErrors()) {

				model.addAttribute("userClickCreateNew", true);
				model.addAttribute("title", "Đăng kí Home Stay");
				model.addAttribute("message", "Validation failed for Submission!");
				return "providerIndex";
			}
			mHotel.setCity(new City(Integer.parseInt(mHotel.getCt())));
			mHotel.setUser(new User(Integer.parseInt(mHotel.getPr())));
			// create new city record
			if (mHotel.getId() == 0) {
				HotelDAO.add(mHotel);
			} else {
				HotelDAO.update(mHotel);
			}

			if (!mHotel.getFile().getOriginalFilename().equals("")) {
				HotelFileUploadUtility.uploadFile(request, mHotel.getFile(), mHotel.getCode(), mHotel.getName());
			}

			return "redirect:/provider/new?operation=newHotel";
		}
		
		// activation hotel
		@RequestMapping(value = "/hotel/{id}/activation", method = RequestMethod.GET)
		@ResponseBody
		public String handleHotelActivation(@PathVariable int id) {

			Hotel hotel = HotelDAO.get(id);
			boolean isActive = hotel.isActive();
			hotel.setActive(!hotel.isActive());
			HotelDAO.update(hotel);
			return (isActive) ? "You are successfully de-cativevated the hotel with id " + hotel.getId()
					: "You are successfully ativevated the hotel with id " + hotel.getId();
		}

		// edit hotel
		@RequestMapping(value = "/{id}/hotel", method = RequestMethod.GET)
		public ModelAndView showEditHotel(@PathVariable int id) {
			ModelAndView mv = new ModelAndView("providerIndex");
			mv.addObject("userClickCreateNew", true);
			mv.addObject("title", "Chỉnh sửa thông tin Home Stay");
			// fetch the city from the database
			Hotel nHotel = HotelDAO.get(id);
			// set the city fetch from database
			mv.addObject("hotel", nHotel);
			return mv;
		}
		
		
		//Room
		@RequestMapping(value = "/{id}/detailRoom", method = RequestMethod.GET)
		public ModelAndView detailRoom(@PathVariable int id) {
			ModelAndView mv = new ModelAndView("providerIndex");
			mv.addObject("userClickDeatailRoom", true);
			mv.addObject("title", "Quản lí phòng");
			mv.addObject("hotel",HotelDAO.HotelByUser(id));
			mv.addObject("listRoom",RoomDAO.listByHotel(id));
			
			/*mv.addObject("booking",BookingDAO.listByRoom());*/
			return mv;
		}
		
		/////////////////
		//Room
		@RequestMapping(value = "/{id}/detailRooms", method = RequestMethod.GET)
		public ModelAndView detailRooms(@PathVariable int id) {
			ModelAndView mv = new ModelAndView("providerIndex");
			mv.addObject("userClickDeatailRooms", true);
			mv.addObject("title", "Quản lí phòng");
			mv.addObject("hotel",HotelDAO.HotelByUser(id));
			mv.addObject("listRoom",RoomDAO.listByHotel(id));
			/*Booking booking = BookingDAO.getByRoom(id);
			String strAr = booking.getDateArrive();
			String strLea = booking.getDateLeave();
			SimpleDateFormat fm = new SimpleDateFormat("MM/dd/yyyy");
			Date dateArr = fm.parse(strAr);
			Date dateLea = fm.parse(strLea);
			Date dateCurrent = new Date();
			dateCurrent = fm.parse(dateCurrent.toString());
			if(dateCurrent.before(dateArr) | dateCurrent.after(dateLea)) {
				booking.setActive(false);
			}*/
			/*mv.addObject("booking",BookingDAO.listByRoom());*/
			return mv;
		}
		///////////////
		
		
		//booking submit
		@ModelAttribute("bookingf")
		public Booking loadEmptyModelBean(){
		   return new Booking();
		}
		@RequestMapping(value = "/bookingFy", method = RequestMethod.POST)
		public String handleBookingSubmission(@Valid @ModelAttribute("bookingf") Booking mBooking, BindingResult results, Model model,
				HttpServletRequest request) {
			
			Room room = RoomDAO.get(mBooking.getRoomId());
			// create new record
			if (mBooking.getId() == 0) {
				BookingDAO.add(mBooking);
				
				room.setStatus("full");
				
				RoomDAO.update(room);
			} else {
				BookingDAO.update(mBooking);
			}


			return "redirect:/provider/" + room.getHotel().getId() + "/detailRoom";
		}
		
			
		//add new room
		@ModelAttribute("addRoom")
		public Room loadsEmptyModelBean(){
		   return new Room();
		}
		@RequestMapping(value = "/addRoom", method = RequestMethod.POST)
		public String handleAddRoom(@Valid @ModelAttribute("addRoom") Room mRoom, BindingResult results, Model model,
				HttpServletRequest request) {
			
			mRoom.setStatus("empty");
			
			// create new record
			if (mRoom.getId() == 0) {
				RoomDAO.add(mRoom);
				
			}


			return "redirect:/provider/" + mRoom.getHotel().getId() + "/detailRoom";
		}
		
			
				
		// return cities for all the request mapping
		@ModelAttribute("cities")
		public List<City> getCities() {

			return CityDAO.list();
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
}
