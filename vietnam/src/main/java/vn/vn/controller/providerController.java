package vn.vn.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import com.vn.vietnambackend.dto.Food;
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
			mv.addObject("roomFull",BookingDAO.listRoomFull(id));
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
			
			Room room = RoomDAO.get(mBooking.getRoom().getId());
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
		
			
		
		
		
		// edit booking
		@RequestMapping(value = "/detailInfBooking/{id}", method = RequestMethod.GET)
		public ModelAndView showEditBooking(@PathVariable int id
				) {
			ModelAndView mv = new ModelAndView("providerIndex");
			mv.addObject("userClickEditBooking", true);
			mv.addObject("title", "Gia hạn/thay đổi thông tin");
			// fetch from the database
			Booking nBooking = BookingDAO.get(id);
			/*mv.addObject("datearr", nBooking.getDateArrive().toString().replace('/', '-'));
	    	mv.addObject("datelea", nBooking.getDateLeave().toString().replace('/', '-'));*/
			// set the booking fetch from database
			
			mv.addObject("cc",nBooking.getDateArrive().toString().split("-"));
			mv.addObject("booking", nBooking);
			return mv;
		}
		
		   
		  //booking submit
		  		/*@ModelAttribute("detailInfBooking")
		  		public Booking loadEmptyModelBeanBooking(){
		  		   return new Booking();
		  		}*/
		  		@RequestMapping(value = "/detailInfoBooking/{id}", method = RequestMethod.POST)
		  		public String handleBookingSubmission(@PathVariable int id, 
		  				 
		  				@Valid @ModelAttribute("booking") Booking mBooking, BindingResult results, Model model,
		  				HttpServletRequest request) {
		  			
		  			
		  		
		  			/*
		  			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		  			Date datArr;
		  			Date datLea;
		  			java.sql.Date sqltDatArr = null;
		  			java.sql.Date sqltDatLea = null;
		  			try {
		  				datArr = formatter.parse(mBooking.getDateArrive().toString());
		  				sqltDatArr= new java.sql.Date(datArr.getTime());
		  				System.out.println(sqltDatArr);
		  				datLea = formatter.parse(mBooking.getDateLeave().toString());
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
*/		  			if (mBooking.getId() == 0) {
		  				
		  				BookingDAO.add(mBooking);
		  				
		  			} else {
		  				BookingDAO.update(mBooking);
		  			}


		  			return "redirect:/provider/";
		  		}
		    
		
		  
				
		// return cities for all the request mapping
		@ModelAttribute("cities")
		public List<City> getCities() {

			return CityDAO.list();
		}
		
		
	// end booking
	@RequestMapping(value = "/deleteBooking/{id}", method = RequestMethod.GET)
	public ModelAndView deleteBooking(@PathVariable int id) {
		ModelAndView mv = new ModelAndView("providerIndex");
		mv.addObject("userClickDeleteBooking", true);
		mv.addObject("title", "Thanh toán và trả phòng");
		// fetch from the database
		Booking nBooking = BookingDAO.get(id);
		mv.addObject("booking", nBooking);
		return mv;
	}
	
	@RequestMapping(value = "/endBooking/{id}", method = RequestMethod.GET)
	public String bookingsss(@PathVariable int id) {
		try {
			Booking nBooking = BookingDAO.get(id);
			nBooking.setActive(false);
			/*nBooking.setNameGuest(nBooking.getNameGuest());*/
			BookingDAO.update(nBooking);
			return "redirect:/provider/"+ nBooking.getHotel().getId() +"/detailRooms";
		}catch(Exception e) {
			return null;
		}
	}
	
		
	//activation room
		@RequestMapping(value = "/room/{id}/activation", method = RequestMethod.GET)
		@ResponseBody
		public String handleRoomActivation(@PathVariable int id) {

			Room room = RoomDAO.get(id);
			boolean isActive = room.getActive();
			room.setActive(!isActive);
			RoomDAO.update(room);
			return (isActive) ? "You are successfully decativevated the room with id " + room.getId()
					: "You are successfully ativevated the room with id " + room.getId();
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
						
					}else {
						RoomDAO.update(mRoom);
					}


					return "redirect:/provider/" + mRoom.getHotel().getId() + "/detailRooms";
				}
		
		
		
				// edit room
				@RequestMapping(value = "/{id}/editRoom", method = RequestMethod.GET)
				public ModelAndView showEditRoom(@PathVariable int id) {
					ModelAndView mv = new ModelAndView("providerIndex");
					mv.addObject("userClickEditRoom", true);
					mv.addObject("title", "Thay đổi thông tin phòng");
					// fetch the food from the database
					Room nRoom = RoomDAO.get(id);
					// set the food fetch from database
					mv.addObject("addRoom", nRoom);
					return mv;
				}
		
	//booking room direct at Hotel
	//
	@RequestMapping(value = "/{id}/bookingRoomDirect", method = RequestMethod.GET)
	public ModelAndView searchHotel(@PathVariable int id) {
		ModelAndView mv = new ModelAndView("providerIndex");
		mv.addObject("title", "Searching a room");
		mv.addObject("userClickSearchDateBooking", true);
		mv.addObject("hotel",HotelDAO.get(id));
		return mv;
	}
	
	
	
	//
	/*@ModelAttribute("hotel")
	public Hotel loadEmptyModelyyBean() {
		return new Hotel();
	}*/
    @RequestMapping(value = "/{id}/bookingRoomDirect", method = RequestMethod.POST)
    public ModelAndView searchRomsss(@ModelAttribute("hotel") Hotel mHotel, @PathVariable int id,
    							@RequestParam(name = "dateArrive", required = false) String dateArrive,
    							@RequestParam(name = "dateLeave", required = false) String dateLeave
    							) {
    	
    	ModelAndView mv = new ModelAndView("providerIndex");
    	mv.addObject("title", "Kết quả tìm kiếm");
    	mv.addObject("userClickSearchDateBooking", true);
    	mv.addObject("room", RoomDAO.listByHotel(id));
    	mv.addObject("test2",BookingDAO.listBookedByHotel(dateArrive.replace('/', '-'), dateLeave.replace('/', '-'), id));
		
		int temp = RoomDAO.listByHotel(id).size() - BookingDAO.listBookedByHotel(dateArrive.replace('/', '-'), dateLeave.replace('/', '-'), id).size();
		mv.addObject("temp", temp);
    	mv.addObject("datearrive", dateArrive.replace('/', '-'));
    	mv.addObject("dateleave", dateLeave.replace('/', '-'));
    	return mv;
    }
		
  //booking page
    @RequestMapping(value="/{id}/bookingRoomDirect/{idRoom}/{dtArr}/{dtLea}")
	public ModelAndView bookingRoomPage(@PathVariable int id, @PathVariable int idRoom, 
			 @PathVariable String dtArr, @PathVariable String dtLea,
			@RequestParam(name = "operation", required = false) String operation){
		ModelAndView mv= new ModelAndView("providerIndex");
		mv.addObject("infRoom",RoomDAO.get(idRoom));
		mv.addObject("dateArr", dtArr.replace('-', '/'));
		mv.addObject("dateLea", dtLea.replace('-', '/'));
		mv.addObject("dateArrs", dtArr);
		mv.addObject("dateLeas", dtLea);
		mv.addObject("title", "Đặt phòng");
		mv.addObject("userClickBookingRoomcc", true);
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
  		@RequestMapping(value = "{id}/bookingRoomDirect/{idRoom}/{dtArr}/{dtLea}", method = RequestMethod.POST)
  		public String handleBookingSubmission(@PathVariable int id, @PathVariable int idRoom,
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


  			return "redirect:/provider/{id}/bookingRoomDirect";
  		}
    
    
    
		
		
		
		
		
}
