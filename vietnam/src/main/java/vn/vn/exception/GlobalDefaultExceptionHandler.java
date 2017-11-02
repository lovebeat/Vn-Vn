package vn.vn.exception;

import java.io.PrintWriter;
import java.io.StringWriter;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
public class GlobalDefaultExceptionHandler {

	@ExceptionHandler(NoHandlerFoundException.class)
	public ModelAndView notFoundException() {

		ModelAndView mv = new ModelAndView("error");

		mv.addObject("title", "404-Not Found");

		mv.addObject("errorTitle", "The page is not constructed!");

		mv.addObject("errorDescription", "The page you are looking for is not available now!");

		return mv;
	}

	// for general exception
	@ExceptionHandler(Exception.class)
	public ModelAndView handlerException(Exception ex) {
		ModelAndView mv = new ModelAndView("error");

		mv.addObject("errorTitle", "Contact to Administator!");
		// only for debuging
		StringWriter sw = new StringWriter();
		PrintWriter pw = new PrintWriter(sw);
		ex.printStackTrace(pw);

		mv.addObject("errorDescription", sw.toString());

		mv.addObject("title", "Error");

		return mv;
	}
}
