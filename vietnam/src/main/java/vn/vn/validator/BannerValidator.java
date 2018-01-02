package vn.vn.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.vn.vietnambackend.dto.Banner;
import com.vn.vietnambackend.dto.City;

public class BannerValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return Banner.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		Banner banner = (Banner) target;
		
		//whether file has been selected or not
		if(banner.getFile()==null || banner.getFile().getOriginalFilename().equals("")) {
			errors.rejectValue("file", null, "Vui lòng chọn ảnh để upload !");
			return;
		}
		
		if(! (banner.getFile().getContentType().equals("image/jpeg") ||
				banner.getFile().getContentType().equals("image/png") ||
				banner.getFile().getContentType().equals("image/gif")
				)) {
			
			errors.rejectValue("file", null, "Vui lòng chỉ chọn file ảnh !");
			return;
		}

		
	}

}
