package vn.vn.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.vn.vietnambackend.dto.Place;

public class PlaceValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return Place.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		
		Place place = (Place) target;
		
		//whether file has been selected or not
		if(place.getFile()==null || place.getFile().getOriginalFilename().equals("")) {
			errors.rejectValue("file", null, "Vui lòng chọn ảnh để upload !");
			return;
		}
		
		if(! (place.getFile().getContentType().equals("image/jpeg") ||
				place.getFile().getContentType().equals("image/png") ||
				place.getFile().getContentType().equals("image/gif")
				)) {
			
			errors.rejectValue("file", null, "Vui lòng chỉ chọn file ảnh !");
			return;
		}

	}

}
