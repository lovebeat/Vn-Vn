package vn.vn.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.vn.vietnambackend.dto.Food;


public class FoodValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return Food.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		
		Food food = (Food) target;
		
		//whether file has been selected or not
		if(food.getFile()==null || food.getFile().getOriginalFilename().equals("")) {
			errors.rejectValue("file", null, "Vui lòng chọn ảnh để upload !");
			return;
		}
		
		if(! (food.getFile().getContentType().equals("image/jpeg") ||
				food.getFile().getContentType().equals("image/png") ||
				food.getFile().getContentType().equals("image/gif")
				)) {
			
			errors.rejectValue("file", null, "Vui lòng chỉ chọn file ảnh !");
			return;
		}

	}


}
