package vn.vn.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.vn.vietnambackend.dto.City;

public class CityValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return City.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		
		City city = (City) target;
		
		//whether file has been selected or not
		if(city.getFile()==null || city.getFile().getOriginalFilename().equals("")) {
			errors.rejectValue("file", null, "Vui lòng chọn ảnh để upload !");
			return;
		}
		
		if(! (city.getFile().getContentType().equals("image/jpeg") ||
				city.getFile().getContentType().equals("image/png") ||
				city.getFile().getContentType().equals("image/gif")
				)) {
			
			errors.rejectValue("file", null, "Vui lòng chỉ chọn file ảnh !");
			return;
		}

	}

}
