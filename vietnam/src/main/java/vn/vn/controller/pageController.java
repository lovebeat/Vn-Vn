package vn.vn.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.vn.vietnambackend.dao.cityDAO;

@Controller
public class pageController {
	
	@Autowired
	private cityDAO cityDAO;
	
	@RequestMapping(value = { "/", "/index", "/home" })
	public ModelAndView homePage() {
		
		ModelAndView mv = new ModelAndView("index");
		
		mv.addObject("title","Home");
		
		mv.addObject("userClickHome",true);
		
		mv.addObject("listCity",cityDAO.list());//pass list city 
		
		return mv;
	
	}

}
