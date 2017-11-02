package vn.vn.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.vn.vietnambackend.dao.FoodDAO;
import com.vn.vietnambackend.dto.Food;


@Controller
public class pageController {
	
	@Autowired
	private FoodDAO foodDAO;
	
	@RequestMapping(value="/")
	public ModelAndView homePage() {
		ModelAndView mv = new ModelAndView("index");
		mv.addObject("title","Home");
		mv.addObject("userClickHome",true);
		return mv;
	}

	@RequestMapping(value="/food")
	public ModelAndView foodPage() {
		ModelAndView mv = new ModelAndView("index");
		mv.addObject("title","Food");
		
		mv.addObject("listFoods", foodDAO.list());
		
		mv.addObject("userClickFood",true);
		return mv;
	}
	
	// single food page
	@RequestMapping(value="/food/{id}")
	public ModelAndView showSingleFood(@PathVariable int id){
		ModelAndView mv= new ModelAndView("index");
		Food food = foodDAO.get(id);
		mv.addObject("title", food.getName());
		mv.addObject("food",food);
		mv.addObject("userClickSingleFood", true);
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

	
}
