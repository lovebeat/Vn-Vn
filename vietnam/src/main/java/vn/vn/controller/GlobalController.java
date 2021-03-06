package vn.vn.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.vn.vietnambackend.dao.UserDAO;
import com.vn.vietnambackend.dto.User;

import vn.vn.model.UserModel;

@ControllerAdvice
public class GlobalController {
	
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private HttpSession session;
	
	private UserModel userModel = null;
	private User user = null;	
	
	
	@ModelAttribute("userModel")
	public UserModel getUserModel() {		
		if(session.getAttribute("userModel")==null) {
			// get the authentication object
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
			
			
			if(!authentication.getPrincipal().equals("anonymousUser")){
				// get the user from the database
				user = userDAO.getByEmail(authentication.getName());
				
				if(user!=null) {
					// create a new model
					userModel = new UserModel();
					userModel.setEmail(user.getEmail());
					userModel.setId(user.getId());
					userModel.setFullName(user.getFirstName() + " " + user.getLastName());
					userModel.setRole(user.getRole());
					
					
					session.setAttribute("userModel", userModel);
					return userModel;
				}			
			}
		}
		
		return (UserModel) session.getAttribute("userModel");		
	}
		
}
