package vn.vn.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.vn.vietnambackend.dto.City;
import com.vn.vietnambackend.dto.Hotel;

public class HotelValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return City.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {

		Hotel hotel = (Hotel) target;
		
		//whether file has been selected or not
		if(hotel.getFile()==null || hotel.getFile().getOriginalFilename().equals("")) {
			errors.rejectValue("file", null, "Please select an image to upload !");
			return;
		}
		
		if(! (hotel.getFile().getContentType().equals("image/jpeg") ||
				hotel.getFile().getContentType().equals("image/png") ||
				hotel.getFile().getContentType().equals("image/gif")
				)) {
			
			errors.rejectValue("file", null, "Please only choose image type for upload !");
			return;
		}

	}

}
