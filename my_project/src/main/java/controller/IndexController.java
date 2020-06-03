package controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import model.CompanyUser;
import model.FormalUser;

@Controller
public class IndexController {
	@RequestMapping(value="/showMessage.html")
	public String test() {
		return "index/frontPage";
	}
	
	@RequestMapping(value="/index/login.html", method=RequestMethod.GET)
	public String tryLogin() {
		return "index/login";
	}
	@RequestMapping(value="index/logincheck.html", method=RequestMethod.POST)
	public ModelAndView LoginCheck(HttpSession session) {
		FormalUser FormalUser=null;
		CompanyUser ComapnyUser=null;
		ModelAndView mav = new ModelAndView();
		String userType=(String)session.getAttribute("userType");
		if(userType.equals("formal")) {
			FormalUser = new FormalUser();
		}
		else if (userType.equals("comapny")) {
			ComapnyUser = new CompanyUser();
		}
		return mav;
	}
	@RequestMapping(value="index/entry.html", method=RequestMethod.GET)
	public String Entry() {
		return "index/EntryTry";
	}
	@RequestMapping(value="index/entryform.html", method=RequestMethod.GET)
	public ModelAndView Entry(String type) {
		ModelAndView mav = new ModelAndView("index/entryform");
		if (type.equals("formal") || type.equals("comapny")) {
			mav.addObject("userType", type);
		}
		else { mav.setViewName("index/EntryTry");
		return mav;
		}
		return mav;
	}
}
