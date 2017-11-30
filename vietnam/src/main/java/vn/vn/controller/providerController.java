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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.vn.vietnambackend.dao.HotelDAO;
import com.vn.vietnambackend.dto.City;
import com.vn.vietnambackend.dto.Hotel;
import vn.vn.util.HotelFileUploadUtility;
import vn.vn.validator.HotelValidator;


@Controller
@RequestMapping("/provider")

public class providerController {
	
	@Autowired
	private HotelDAO HotelDAO;

	@RequestMapping(value = "/new", method = RequestMethod.GET)
	public ModelAndView createNew(@RequestParam(name = "operation", required = false) String operation) {
		ModelAndView mv = new ModelAndView("providerIndex");
		mv.addObject("userClickCreateNew", true);
		mv.addObject("title", "Create New");
		Hotel nHotel = new Hotel();
		nHotel.setActive(false);
		nHotel.setProviderId("1");
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
		mv.addObject("title", "Available List");
		return mv;
	}
	
	@RequestMapping(value = "/waitApprove", method = RequestMethod.GET)
	public ModelAndView waitApprove() {
		ModelAndView mv = new ModelAndView("providerIndex");
		mv.addObject("userClickWaitApprove", true);
		mv.addObject("title", "List Hotel Wait Approve");
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
				model.addAttribute("title", "Create New");
				model.addAttribute("message", "Validation failed for Submission!");
				return "providerIndex";
			}

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
			mv.addObject("title", "Hotel");
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
			mv.addObject("title", "Manage Room");
			return mv;
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
}
