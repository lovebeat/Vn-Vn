package vn.vn.util;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import org.springframework.web.multipart.MultipartFile;

public class CityFileUploadUtility {
	
	private static String ABS_PATH = "";
	private static String REAL_PATH ="";
	public static void uploadFile(HttpServletRequest request, MultipartFile file, String code, String nameCity) {
		
		//get the real path and abs path
		REAL_PATH = request.getSession().getServletContext().getRealPath("/assets/images/");
		ABS_PATH = "D:\\Eclipse\\Vn-Vn\\vietnam\\src\\main\\webapp\\assets\\images\\";
		REAL_PATH +=nameCity;
		REAL_PATH +="/";
		ABS_PATH +=nameCity;
		ABS_PATH +="\\";
		
		
		//to make sure all the directory exists please create the directories
		if(!new File(ABS_PATH).exists()) {
			//create the directories
			new File(ABS_PATH).mkdirs();
		}
		if(!new File(REAL_PATH).exists()) {
			//create the directories
			new File(REAL_PATH).mkdirs();
		}
		try {
			//server upload
			file.transferTo(new File(REAL_PATH + code + ".jpg"));
			
			//project directory upload
			file.transferTo(new File(ABS_PATH + code + ".jpg"));
		}
		catch(IOException ex) {
			
		}
	}

}
