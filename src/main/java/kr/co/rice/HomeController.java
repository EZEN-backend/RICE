package kr.co.rice;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@RequestMapping("/")
	public String home() {
		
		return "redirect:/main/main";
	}
	
	@RequestMapping("/main/main")
	public String main() {
		return "main/main";
	}
	
}
