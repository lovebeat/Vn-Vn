package vn.vn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class pageController {
	@RequestMapping(value="/")
	public ModelAndView homePage() {
		ModelAndView mv = new ModelAndView("index");
		mv.addObject("title","Home");
		mv.addObject("userClickHome",true);
		return mv;
	}

}
