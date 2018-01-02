package vn.vn.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.vn.vietnambackend.dao.BannerDAO;
import com.vn.vietnambackend.dao.BookingDAO;
import com.vn.vietnambackend.dao.CityDAO;
import com.vn.vietnambackend.dao.FoodDAO;
import com.vn.vietnambackend.dao.HotelDAO;
import com.vn.vietnambackend.dao.PlaceDAO;
import com.vn.vietnambackend.dao.RoomDAO;
import com.vn.vietnambackend.dto.Banner;
import com.vn.vietnambackend.dto.Booking;
import com.vn.vietnambackend.dto.City;
import com.vn.vietnambackend.dto.Food;
import com.vn.vietnambackend.dto.Hotel;
import com.vn.vietnambackend.dto.Place;
import com.vn.vietnambackend.dto.Room;

import vn.vn.model.UserModel;


@Controller
@RequestMapping("/json/data")
public class JsonDataController {
	
	@Autowired
	private CityDAO cityDAO;
	@Autowired
	private PlaceDAO placeDAO;
	@Autowired
	private FoodDAO foodDAO;
	@Autowired
	private BookingDAO BookingDAO;
	@Autowired
	private HotelDAO hotelDAO;
	@Autowired
	private BannerDAO bannerDAO;
	@Autowired
	private RoomDAO roomDAO;
	@Autowired
	private GlobalController glo;
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
	
	@RequestMapping("/provider/all/hotel")
	@ResponseBody
	public List<Hotel> getAllHotelsForAdmin(){
		return hotelDAO.list();
	}
	@RequestMapping("/provider/all/hotelApprove")
	@ResponseBody
	public List<Hotel> getAllHotelsApprove(){ 
		
		return hotelDAO.listApprove(glo.getUserModel().getId());
	}
	
	@RequestMapping("/provider/all/hotelNotApprove")
	@ResponseBody
	public List<Hotel> getAllHotelNotApprove(){
		return hotelDAO.listActiveAndNotApprove();
	}
	@RequestMapping("/provider/all/hotelNotApproves")
	@ResponseBody
	public List<Hotel> getHotelNotApprove(){
		return hotelDAO.listNotApprove(glo.getUserModel().getId());
	}
	
	@ResponseBody
	@RequestMapping(value = "/{id}/booking", method = RequestMethod.GET)
	public Booking booking(@PathVariable int id) {
		try {
			Booking booking = BookingDAO.getByRoom(id);
			
			/*String strAr = booking.getDateArrive();
			String strLea = booking.getDateLeave();
			SimpleDateFormat fm = new SimpleDateFormat("MM/dd/yyyy");
			Date dateArr = fm.parse(strAr);
			Date dateLea = fm.parse(strLea);
			Date dateCurrent = new Date();
			dateCurrent = fm.parse(dateCurrent.toString());
			if(dateCurrent.before(dateArr) | dateCurrent.after(dateLea)) {
				booking.setActive(false);
			}*/
			
			return booking;
		}catch(Exception e) {
			return null;
		}
	}
	
	//banner
	@RequestMapping("/admin/all/banner")
	@ResponseBody
	public List<Banner> getAllBannerForAdmin(){
		return bannerDAO.list();
	}
	
	@RequestMapping("/manage/all/hotelApproved")
	@ResponseBody
	public List<Hotel> getAllHotelsApproved(){
		return hotelDAO.listApprove();
	}
	
	//room full (was booked)
	@RequestMapping(value = "/{id}/detailRooms", method = RequestMethod.GET)
	@ResponseBody
	public List<Booking> roomFull(@PathVariable int id) {
		
		return BookingDAO.listRoomFull(id);
		
	}
	
	//room empty
		@RequestMapping(value = "/{id}/roomsTotalsss", method = RequestMethod.GET)
		@ResponseBody
		public List<Room> roomsTotalsss(@PathVariable int id) {
			return roomDAO.listByHotel(id);
			
		}

	
	
	
	
	
	
	
}
