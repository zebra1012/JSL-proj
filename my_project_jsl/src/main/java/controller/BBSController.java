package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BBSController {
	
	@RequestMapping(value="bbs/frontpage.html",method=RequestMethod.GET)
	public ModelAndView ToFrontPage() { //각 게시판 정보를 받아서 넣어준다.
		return new ModelAndView("bbs/frontpage");
	}
	@RequestMapping(value="bbs/toBBS.html",method=RequestMethod.GET)
	public ModelAndView ToBBS(String state) {//각 게시판으로 보낸다.
		ModelAndView mav = new ModelAndView();
		if(state.equals("free")) {
			mav.setViewName("bbs/freebbs");
		}
		else if (state.equals("hobbit")) {
			mav.setViewName("bbs/hobbitbbs");
			
		}
		else if (state.equals("read")) {
			mav.setViewName("bbs/readbbs");
		}
		return mav;
	}
}
